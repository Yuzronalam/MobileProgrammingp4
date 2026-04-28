import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';
import '../main.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final kodeController = TextEditingController();
  final namaController = TextEditingController();
  final hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Beranda")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ================= FORM =================
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      controller: kodeController,
                      decoration: const InputDecoration(
                        labelText: "Kode Produk",
                      ),
                    ),
                    TextField(
                      controller: namaController,
                      decoration: const InputDecoration(
                        labelText: "Nama Produk",
                      ),
                    ),
                    TextField(
                      controller: hargaController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Harga Produk",
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ================= SUBMIT =================
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  SimpleAlertDialog.show(
                    context,
                    assetImagepath: AnimatedImage.confirm,
                    title: AlertTitleText("Konfirmasi"),
                    content: AlertContentText("Simpan data?"),
                    onConfirmButtonPressed: (ctx) {
                      /// SIMPAN KE GLOBAL
                      kodeProdukGlobal = kodeController.text;
                      namaProdukGlobal = namaController.text;
                      hargaProdukGlobal = hargaController.text;

                      CherryToast.success(
                        title: const Text("Data berhasil disimpan"),
                      ).show(context);

                      Navigator.pop(context);
                    },
                  );
                },
                child: const Text("Submit"),
              ),

              const SizedBox(height: 10),

              /// ================= DELETE =================
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  SimpleAlertDialog.show(
                    context,
                    assetImagepath: AnimatedImage.warning,
                    title: AlertTitleText("Konfirmasi"),
                    content: AlertContentText("Hapus data?"),
                    onConfirmButtonPressed: (ctx) {
                      kodeProdukGlobal = "";
                      namaProdukGlobal = "";
                      hargaProdukGlobal = "";

                      CherryToast.success(
                        title: const Text("Data dihapus"),
                      ).show(context);

                      Navigator.pop(context);
                    },
                  );
                },
                child: const Text("Delete"),
              ),

              const SizedBox(height: 10),

              /// ================= DIALOG =================
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Info"),
                      content: const Text("Ini dialog biasa"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Tutup"),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Show Dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
