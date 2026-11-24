import 'package:flutter/material.dart';

class CrachaPerfil extends StatelessWidget {
  final String nome;
  final String cargo;
  final String githubUser;
  final String curso;
  final List<String> tecnologias;

  const CrachaPerfil({
    super.key,
    required this.nome,
    required this.cargo,
    required this.githubUser,
    required this.curso,
    required this.tecnologias,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1F2937), Color(0xFF111827)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF38BDF8).withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.35),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: const Color(0xFF38BDF8),
                child: Text(
                  nome.isNotEmpty ? nome[0].toUpperCase() : 'D',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D1117),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF238636).withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFF3FB950)),
                      ),
                      child: const Text(
                        'DEVFOLIO ID • ATIVO',
                        style: TextStyle(
                          color: Color(0xFF3FB950),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      nome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      cargo,
                      style: const TextStyle(
                        color: Color(0xFF38BDF8),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(color: Color(0xFF30363D), height: 28),
          Row(
            children: [
              const Icon(Icons.code, color: Color(0xFF8B949E), size: 18),
              const SizedBox(width: 8),
              Text(
                'github.com/$githubUser',
                style: const TextStyle(color: Color(0xFFC9D1D9), fontSize: 13),
              ),
              const Spacer(),
              const Icon(Icons.school, color: Color(0xFF8B949E), size: 18),
              const SizedBox(width: 6),
              Text(
                curso,
                style: const TextStyle(color: Color(0xFFC9D1D9), fontSize: 13),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tecnologias
                .map(
                  (tech) => Chip(
                    label: Text(
                      tech,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    backgroundColor: const Color(0xFF21262D),
                    side: const BorderSide(color: Color(0xFF30363D)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
