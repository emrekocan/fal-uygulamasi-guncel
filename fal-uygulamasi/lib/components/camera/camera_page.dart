import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  final String fortuneType;

  const CameraPage({Key? key, required this.fortuneType}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;
  bool _isCameraPermissionGranted = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    print('Mevcut kamera izni durumu: $status');
    setState(() {
      _isCameraPermissionGranted = status.isGranted;
    });
    if (_isCameraPermissionGranted) {
      await _initializeCamera();
    }
  }

  Future<void> _requestCameraPermission() async {
    print('Kamera izni isteniyor...');
    final status = await Permission.camera.request();
    print('Kamera izni sonucu: $status');

    if (status.isGranted) {
      setState(() {
        _isCameraPermissionGranted = true;
      });
      await _initializeCamera();
    } else if (status.isPermanentlyDenied) {
      print('Kamera izni kalıcı olarak reddedildi');
      _showSettingsDialog();
    } else {
      print('Kamera izni reddedildi');
      setState(() {
        _isCameraPermissionGranted = false;
      });
    }
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Kamera İzni Gerekli'),
        content: const Text(
            'Kamera izni kalıcı olarak reddedildi. Lütfen ayarlardan kamera iznini etkinleştirin.'),
        actions: <Widget>[
          TextButton(
            child: const Text('İptal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('Ayarlar'),
            onPressed: () {
              Navigator.of(context).pop();
              openAppSettings();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _initializeCamera() async {
    print('Kamera başlatılıyor...');
    if (_controller != null) {
      await _controller!.dispose();
    }
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        print('Kamera bulunamadı');
        return;
      }
      final firstCamera = cameras.first;

      _controller = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );

      _initializeControllerFuture = _controller!.initialize();
      if (mounted) {
        setState(() {});
      }
      print('Kamera başarıyla başlatıldı');
    } catch (e) {
      print('Kamera başlatılırken hata oluştu: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.fortuneType} Çekimi'),
        backgroundColor: const Color.fromARGB(255, 235, 83, 7),
      ),
      body: _buildBody(),
      floatingActionButton: _buildCaptureButton(),
    );
  }

  Widget _buildBody() {
    if (!_isCameraPermissionGranted) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Kamera izni gerekli'),
            ElevatedButton(
              onPressed: _requestCameraPermission,
              child: const Text('İzin İste'),
            ),
          ],
        ),
      );
    }

    if (_controller == null || _initializeControllerFuture == null) {
      return const Center(child: Text('Kamera başlatılıyor...'));
    }

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CameraPreview(_controller!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildCaptureButton() {
    return FloatingActionButton(
      onPressed: _isCameraPermissionGranted && _controller != null
          ? _takePicture
          : null,
      child: const Icon(Icons.camera_alt),
    );
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      print('Kamera hazır değil');
      return;
    }

    try {
      final image = await _controller!.takePicture();
      print('Fotoğraf çekildi: ${image.path}');
      // ignore: use_build_context_synchronously
      Navigator.pop(context, image.path);
    } catch (e) {
      print('Fotoğraf çekilirken hata oluştu: $e');
    }
  }
}
