import "package:flutter/material.dart";
import "widgets/bloco_estatistica.dart";
import "widgets/cracha_perfil.dart";

void main() {
  runApp(const DevFolioApp());
}

class DevFolioApp extends StatelessWidget {
  const DevFolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevFolio App - PPDM",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0D1117),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161B22),
          elevation: 0,
        ),
      ),
      home: const DevFolioHomePage(),
    );
  }
}

class DevFolioHomePage extends StatefulWidget {
  const DevFolioHomePage({super.key});

  @override
  State<DevFolioHomePage> createState() => _DevFolioHomePageState();
}

class _DevFolioHomePageState extends State<DevFolioHomePage> {
  int _commits = 42;
  final int _projetosConcluidos = 6;
  bool _mostrarIntegrante2 = false;

  void _registrarNovoCommit() {
    setState(() {
      _commits++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final nomeAtual = _mostrarIntegrante2
        ? "Integrante 2 (Dupla PPDM)"
        : "Guilherme Fernandes";
    final githubAtual =
        _mostrarIntegrante2 ? "Skavolsqn" : "gFernandes001";

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.terminal, color: Color(0xFF38BDF8)),
            SizedBox(width: 10),
            Text(
              "DevFolio App - PPDM",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              setState(() {
                _mostrarIntegrante2 = !_mostrarIntegrante2;
              });
            },
            icon: const Icon(Icons.swap_horiz, color: Color(0xFF38BDF8)),
            label: Text(
              _mostrarIntegrante2 ? "Ver Perfil 1" : "Alternar Dupla",
              style: const TextStyle(color: Color(0xFF38BDF8)),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 960),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Perfil / Crachá do Desenvolvedor",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                CrachaPerfil(
                  nome: nomeAtual,
                  cargo: "Desenvolvedor Mobile & Web (Flutter / Dart)",
                  githubUser: githubAtual,
                  curso: "PPDM - 2026",
                  tecnologias: const [
                    "Flutter",
                    "Dart",
                    "Git & GitHub",
                    "REST API",
                    "Cloud Shell",
                  ],
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Dashboard de Métricas",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: _registrarNovoCommit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF238636),
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text("Simular Commit"),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final crossAxisCount = constraints.maxWidth > 650 ? 4 : 2;
                    return GridView.count(
                      crossAxisCount: crossAxisCount,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                      childAspectRatio: 1.25,
                      children: [
                        BlocoEstatistica(
                          titulo: "Commits no GitHub",
                          valor: "$_commits",
                          subtitulo: "+12% esta semana",
                          icone: Icons.commit,
                          corDestaque: const Color(0xFF38BDF8),
                        ),
                        BlocoEstatistica(
                          titulo: "Projetos Entregues",
                          valor: "$_projetosConcluidos",
                          subtitulo: "100% validados",
                          icone: Icons.folder_special,
                          corDestaque: const Color(0xFF3FB950),
                        ),
                        const BlocoEstatistica(
                          titulo: "Horas de Código",
                          valor: "128h",
                          subtitulo: "Semestre PPDM",
                          icone: Icons.timer,
                          corDestaque: Color(0xFFA371F7),
                        ),
                        const BlocoEstatistica(
                          titulo: "Cobertura de Testes",
                          valor: "94%",
                          subtitulo: "Dart & Flutter Test",
                          icone: Icons.verified,
                          corDestaque: Color(0xFFF78166),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
