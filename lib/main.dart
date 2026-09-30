import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

void main() {
  runApp(const NextStepApp());
}

void _updateSEO({required String title, required String description}) {
  if (kIsWeb) {
    html.document.title = title;
    final metaDesc = html.document.querySelector(
      'meta[name="description"]',
    ) as html.MetaElement?;
    if (metaDesc != null) {
      metaDesc.content = description;
    } else {
      final newMeta = html.document.createElement('meta') as html.MetaElement
        ..name = 'description'
        ..content = description;
      html.document.head?.append(newMeta);
    }
  }
}

class NextStepApp extends StatelessWidget {
  const NextStepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextStep Digital | App Personalizzate e Siti Web su Misura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0a1128),
        primaryColor: const Color(0xFF00f2fe),
        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00f2fe),
          secondary: Color(0xFF2563eb),
          surface: Color(0xFF101c44),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/servizi': (context) => const ServiziPage(),
        '/metodo': (context) => const MetodoPage(),
        '/preventivo': (context) => const PreventivoPage(),
        '/contatti': (context) => const ContattiPage(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  String selectedType = 'App Personalizzata';
  String currentPriceRange = '€150 - €450';

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String _formService = 'App Personalizzata';
  bool _formSubmitted = false;

  @override
  void initState() {
    super.initState();
    _updateSEO(
      title: 'NextStep Digital | App Personalizzate e Siti Web su Misura',
      description: 'NextStep Digital: agenzia di sviluppo per la creazione di app personalizzate, siti web aziendali in puro HTML e e-commerce Shopify ad alte prestazioni. Richiedi un preventivo.',
    );
  }

  // Funzione per aprire i link dei lavori in una nuova scheda (funziona sul web)
  void _openProjectLink(String url) {
    if (kIsWeb) {
      html.window.open(url, '_blank');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFF070c1b),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Color(0xFF101c44)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: const [
                      Text(
                        'NextStep',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '.',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00f2fe),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'DIGITAL AGENCY',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.design_services,
                color: Color(0xFF00f2fe),
              ),
              title: const Text(
                'Servizi',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/servizi');
              },
            ),
            ListTile(
              leading: const Icon(Icons.linear_scale, color: Color(0xFF00f2fe)),
              title: const Text(
                'Il Metodo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/metodo');
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate, color: Color(0xFF00f2fe)),
              title: const Text(
                'Preventivo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/preventivo');
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail, color: Color(0xFF00f2fe)),
              title: const Text(
                'Contatti',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contatti');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= NAVBAR =================
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: const Color(0xFF070c1b).withValues(alpha: 0.9),
                border: const Border(
                  bottom: BorderSide(color: Color(0xFF1e293b), width: 1),
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isSmallScreen = constraints.maxWidth < 768;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (isSmallScreen) ...[
                            Builder(
                              builder: (context) => IconButton(
                                icon: const Icon(
                                  Icons.menu,
                                  color: Color(0xFF00f2fe),
                                ),
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                              ),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFF00f2fe), Color(0xFF2563eb)],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.flash_on,
                              color: Color(0xFF0a1128),
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Row(
                                children: [
                                  Text(
                                    'NextStep',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '.',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF00f2fe),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'DIGITAL AGENCY',
                                style: TextStyle(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey,
                                  letterSpacing: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (!isSmallScreen)
                        Row(
                          children: [
                            _navItem(
                              context,
                              'Servizi',
                              onTap: () =>
                                  Navigator.pushNamed(context, '/servizi'),
                            ),
                            const SizedBox(width: 32),
                            _navItem(
                              context,
                              'Il Metodo',
                              onTap: () =>
                                  Navigator.pushNamed(context, '/metodo'),
                            ),
                            const SizedBox(width: 32),
                            _navItem(
                              context,
                              'Preventivo',
                              onTap: () =>
                                  Navigator.pushNamed(context, '/preventivo'),
                            ),
                            const SizedBox(width: 32),
                            _navItem(
                              context,
                              'Contatti',
                              onTap: () =>
                                  Navigator.pushNamed(context, '/contatti'),
                            ),
                          ],
                        ),
                    ],
                  );
                },
              ),
            ),

            // ================= HERO SECTION =================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: 600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF101c44)
                                    .withValues(alpha: 0.8),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: const Color(0xFF00f2fe)
                                      .withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF00f2fe),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'Soluzioni Digitali su Misura per Aziende',
                                    style: TextStyle(
                                      color: Color(0xFF00f2fe),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            const Text(
                              'Il prossimo passo digitale per la tua azienda.',
                              style: TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Costruiamo app personalizzate e siti web ad alte prestazioni (puro HTML o Shopify) progettati unicamente per accelerare e migliorare il tuo ambiente lavorativo.',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF94a3b8),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 420,
                        child: _buildGlassCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF00f2fe),
                                          Color(0xFF2563eb),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: const Icon(
                                      Icons.flash_on,
                                      color: Color(0xFF0a1128),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'NextStep Digital',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Soluzioni per Ogni Esigenza',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xFF00f2fe),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              _buildMiniFeatureCard(
                                Icons.phone_iphone,
                                'App Personalizzate',
                                'Soluzioni su misura per ogni task',
                              ),
                              const SizedBox(height: 12),
                              _buildMiniFeatureCard(
                                Icons.code,
                                'Siti HTML & Shopify',
                                'Prestazioni e vendite al top',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= SEZIONE SERVIZI (PREVIEW) =================
            Container(
              color: const Color(0xFF070c1b).withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      const Text(
                        'COSA FACCIAMO',
                        style: TextStyle(
                          color: Color(0xFF00f2fe),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Soluzioni digitali pensate per la tua crescita',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),
                      Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: [
                          _buildServiceCard(
                            Icons.phone_iphone,
                            'App Personalizzate',
                            'Sviluppiamo applicazioni web e mobile su misura per gestire ordini, logistica o flussi interni.',
                          ),
                          _buildServiceCard(
                            Icons.code,
                            'Siti in Puro HTML',
                            'Siti vetrina e landing page ultra-veloci, leggeri e ottimizzati per i motori di ricerca.',
                          ),
                          _buildServiceCard(
                            Icons.shopping_bag,
                            'E-commerce Shopify',
                            'Apriamo e personalizziamo negozi online professionali pronti a convertire visitatori.',
                          ),
                          _buildServiceCard(
                            Icons.bolt,
                            'Workflow & Velocità',
                            'Analizziamo i colli di bottiglia per creare automazioni che ti fanno risparmiare ore.',
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF101c44),
                          foregroundColor: const Color(0xFF00f2fe),
                          side: const BorderSide(color: Color(0xFF00f2fe)),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/servizi'),
                        child: const Text(
                          'Leggi la Guida Completa ai Servizi',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= SEZIONE CENTRALE: I NOSTRI LAVORI & RISULTATI (3 PROGETTI) =================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: Column(
                    children: [
                      const Text(
                        'PORTFOLIO & PERFORMANCE',
                        style: TextStyle(
                          color: Color(0xFF00f2fe),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'I Nostri Lavori e i Risultati Garantiti',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Ogni progetto che realizziamo viene testato rigorosamente per offrire velocità eccezionali, accessibilità totale e performance SEO al top[cite: 6].',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF94a3b8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 48),

                      // Griglia con i 3 Progetti dimostrativi
                      Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        alignment: WrapAlignment.center,
                        children: [
                          // Progetto 1
                          _buildProjectCard(
                            projectName:
                                'Progetto 1: App Agenda per Parucchiere Uomo',
                            projectDesc:
                                'App personalizzata per Parucchieri uomo',
                            projectUrl: 'https://prenota.gentlemanbarber.it/',
                            onTapLink: () => _openProjectLink(
                              'https://prenota.gentlemanbarber.it/',
                            ),
                            scorePrestazioni: '99',
                            scoreAccessibilita: '96',
                            scoreBestPractice: '92',
                            scoreSeo: '100',
                            navigazioneAgentica: '4/4',
                          ),
                          // Progetto 2
                          _buildProjectCard(
                            projectName: 'Progetto 2: E-commerce Shopify',
                            projectDesc: 'Piattaforma di vendita online avanzata, responsive e strutturata per alte conversioni.',
                            projectUrl: 'https://medicalbimby.it/',
                            onTapLink: () =>
                                _openProjectLink('https://medicalbimby.it/'),
                            scorePrestazioni: '100',
                            scoreAccessibilita: '96',
                            scoreBestPractice: '94',
                            scoreSeo: '100',
                            navigazioneAgentica: '4/4',
                          ),
                          // Progetto 3
                          _buildProjectCard(
                            projectName: 'Progetto 3: Sito Vetrina con app',
                            projectDesc: 'Applicazione web sartoriale per la gestione dei flussi operativi e logistici interni.',
                            projectUrl: 'https://www.ricambiveloce.it/',
                            onTapLink: () => _openProjectLink(
                              'https://www.ricambiveloce.it/',
                            ),
                            scorePrestazioni: '91',
                            scoreAccessibilita: '96',
                            scoreBestPractice: '94',
                            scoreSeo: '98',
                            navigazioneAgentica: '4/4',
                          ),

                          // Progetto 4
                          _buildProjectCard(
                            projectName: 'Progetto 3: Sito Vetrina con app',
                            projectDesc: 'Sito vetrina piu app per Parucchiere Uomo con Shopify pronto per le vendite on-line',
                            projectUrl: 'https://gentlemanbarber.it/',
                            onTapLink: () =>
                                _openProjectLink('https://gentlemanbarber.it/'),
                            scorePrestazioni: '100',
                            scoreAccessibilita: '98',
                            scoreBestPractice: '98',
                            scoreSeo: '100',
                            navigazioneAgentica: '4/4',
                          ),

                          // Progetto 5
                          _buildProjectCard(
                            projectName:
                                'Progetto 3: App social simile a facebook',
                            projectDesc: 'App social moderna simile a facebook',
                            projectUrl: 'https://veritasocial.it/',
                            onTapLink: () =>
                                _openProjectLink('https://veritasocial.it/'),
                            scorePrestazioni: '91',
                            scoreAccessibilita: '96',
                            scoreBestPractice: '97',
                            scoreSeo: '98',
                            navigazioneAgentica: '4/4',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= PREVENTIVO INTERATTIVO =================
            Container(
              color: const Color(0xFF070c1b).withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    children: [
                      const Text(
                        'PREVENTIVO INTERATTIVO',
                        style: TextStyle(
                          color: Color(0xFF00f2fe),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Calcola una stima rapida del tuo progetto',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      _buildGlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Seleziona il servizio di tuo interesse:',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              children: [
                                _estimatorOption(
                                  'App Personalizzata',
                                  '€150 - €450',
                                ),
                                _estimatorOption(
                                  'Sito in Puro HTML',
                                  '€150 - €300',
                                ),
                                _estimatorOption(
                                  'E-commerce Shopify',
                                  '€350 - €800',
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: const Color(0xFF0a1128),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: const Color(0xFF00f2fe)
                                      .withValues(alpha: 0.3),
                                ),
                              ),
                              child: Wrap(
                                spacing: 16,
                                runSpacing: 16,
                                alignment: WrapAlignment.spaceBetween,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'STIMA INDICATIVA INVESTIMENTO',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        currentPriceRange,
                                        style: const TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF00f2fe),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF00f2fe),
                                      foregroundColor: const Color(0xFF0a1128),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 14,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      '/preventivo',
                                    ),
                                    child: const Text(
                                      'Scopri Dettagli Preventivo',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= FORM CONTATTI =================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    children: [
                      const Text(
                        'CONTATTACI',
                        style: TextStyle(
                          color: Color(0xFF00f2fe),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Parliamo del tuo prossimo progetto digitale',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      _buildGlassCard(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: _nameController,
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration('Il tuo Nome *'),
                                validator: (val) => val == null || val.isEmpty
                                    ? 'Inserisci il nome'
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _emailController,
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration(
                                  'Email Aziendale o Personale *',
                                ),
                                validator: (val) =>
                                    val == null || !val.contains('@')
                                    ? 'Inserisci un\'email valida'
                                    : null,
                              ),
                              const SizedBox(height: 20),
                              DropdownButtonFormField(
                                value: _formService,
                                dropdownColor: const Color(0xFF101c44),
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration(
                                  'Servizio di Interesse',
                                ),
                                items:
                                    [
                                          'App Personalizzata',
                                          'Sito in Puro HTML',
                                          'E-commerce Shopify',
                                          'Ottimizzazione Flusso',
                                        ]
                                        .map(
                                          (s) => DropdownMenuItem(
                                            value: s,
                                            child: Text(s),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (val) =>
                                    setState(() => _formService = val!),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: _messageController,
                                maxLines: 4,
                                style: const TextStyle(color: Colors.white),
                                decoration: _inputDecoration(
                                  'Raccontaci il tuo progetto o esigenza *',
                                ),
                                validator: (val) => val == null || val.isEmpty
                                    ? 'Descrivi brevemente il progetto'
                                    : null,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF00f2fe),
                                    foregroundColor: const Color(0xFF0a1128),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() => _formSubmitted = true);
                                    }
                                  },
                                  child: const Text(
                                    'Invia Richiesta di Consulenza Gratuita',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              if (_formSubmitted) ...[
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withValues(alpha: 0.2),
                                    border: Border.all(color: Colors.green),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Messaggio inviato con successo! Ti ricontatteremo presto.',
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/contatti'),
                        child: const Text(
                          'Visualizza la pagina dedicata Contatti con tutti i recapiti diretti',
                          style: TextStyle(color: Color(0xFF00f2fe)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= FOOTER =================
            Container(
              padding: const EdgeInsets.all(32),
              decoration: const BoxDecoration(
                color: Color(0xFF070c1b),
                border: Border(top: BorderSide(color: Color(0xFF1e293b))),
              ),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  const Text(
                    'NextStep Digital',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/preventivo'),
                        child: const Text(
                          'Preventivo',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, '/contatti'),
                        child: const Text(
                          'Contatti',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '© 2026 NextStep Digital. Tutti i diritti riservati.',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(BuildContext context, String title, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFFcbd5e1),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildGlassCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: const Color(0xFF101c44).withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: child,
    );
  }

  Widget _buildMiniFeatureCard(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0a1128).withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF1e293b)),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00f2fe), size: 24),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Color(0xFF94a3b8)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(IconData icon, String title, String desc) {
    return SizedBox(
      width: 260,
      child: _buildGlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF2563eb).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFF00f2fe), size: 24),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF94a3b8),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget per mostrare il lavoro con link e i risultati di performance (Lighthouse)
  Widget _buildProjectCard({
    required String projectName,
    required String projectDesc,
    required String projectUrl,
    required VoidCallback onTapLink,
    required String scorePrestazioni,
    required String scoreAccessibilita,
    required String scoreBestPractice,
    required String scoreSeo,
    required String navigazioneAgentica,
  }) {
    return SizedBox(
      width: 360,
      child: _buildGlassCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    projectName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              projectDesc,
              style: const TextStyle(fontSize: 13, color: Color(0xFF94a3b8)),
            ),
            const SizedBox(height: 12),
            Text(
              projectUrl,
              style: const TextStyle(fontSize: 12, color: Color(0xFF00f2fe)),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00f2fe),
                foregroundColor: const Color(0xFF0a1128),
                minimumSize: const Size(double.infinity, 38),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onTapLink,
              icon: const Icon(Icons.open_in_new, size: 16),
              label: const Text(
                'Visita Sito',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: Color(0xFF1e293b)),
            const SizedBox(height: 8),
            const Text(
              'Performance verificate (Lighthouse):',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 12,
              alignment: WrapAlignment.spaceAround,
              children: [
                _scoreCircle(scorePrestazioni, 'Prestazioni'),
                _scoreCircle(scoreAccessibilita, 'Accessib.'),
                _scoreCircle(scoreBestPractice, 'Best Pract.'),
                _scoreCircle(scoreSeo, 'SEO'),
              ],
            ),
            const SizedBox(height: 12),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.greenAccent),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ContainerDot(),
                    const SizedBox(width: 6),
                    Text(
                      '$navigazioneAgentica Navigazione agentica',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _scoreCircle(String score, String label) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.greenAccent, width: 2.5),
            color: Colors.green.withValues(alpha: 0.1),
          ),
          child: Center(
            child: Text(
              score,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
                fontSize: 12,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Color(0xFF94a3b8)),
        ),
      ],
    );
  }

  Widget _estimatorOption(String title, String priceRange) {
    bool isSelected = (selectedType == title);
    return InkWell(
      onTap: () {
        setState(() {
          selectedType = title;
          currentPriceRange = priceRange;
        });
      },
      child: Container(
        width: 240,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF192b63)
              : const Color(0xFF0a1128).withValues(alpha: 0.6),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF00f2fe)
                : const Color(0xFF1e293b),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      filled: true,
      fillColor: const Color(0xFF0a1128).withValues(alpha: 0.9),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1e293b)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF1e293b)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF00f2fe)),
      ),
    );
  }
}

class ContainerDot extends StatelessWidget {
  const ContainerDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
        shape: BoxShape.circle,
      ),
    );
  }
}

// ================= PAGINA SERVIZI (URL PULITO: /servizi) =================
class ServiziPage extends StatefulWidget {
  const ServiziPage({super.key});

  @override
  State createState() => _ServiziPageState();
}

class _ServiziPageState extends State {
  @override
  void initState() {
    super.initState();
    _updateSEO(
      title: 'Servizi - Sviluppo App, Siti Web e E-commerce | NextStep Digital',
      description: 'Scopri la gamma completa dei servizi digitali di NextStep Digital: sviluppo di app personalizzate su misura, siti web in puro HTML ad alte prestazioni e e-commerce Shopify professionali.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF070c1b),
        title: const Text('NextStep Digital - Servizi'),
        iconTheme: const IconThemeData(color: Color(0xFF00f2fe)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Sviluppo App Personalizzate, Siti Web e E-commerce: La Guida Completa per la Crescita Digitale',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nel mercato digitale odierno, altamente competitivo e in continua evoluzione, possedere una presenza online non è più sufficiente per fare la differenza. Le piccole, medie e grandi aziende hanno la necessità urgente di dotarsi di infrastrutture tecnologiche avanzate, flessibili e orientate alla massima conversione. NextStep Digital offre consulenza mirata e soluzioni informatiche sartoriali progettate per ottimizzare i flussi di lavoro, migliorare la brand awareness e incrementare sensibilmente il fatturato aziendale.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  '1. Sviluppo di App Personalizzate per Aziende e Startup',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Molti imprenditori e manager sprecano tempo e risorse preziose affidandosi a software standardizzati, gestionali preconfezionati rigidi o applicazioni generiche che non rispecchiano le reali dinamiche operative interne. Sviluppare un\'app personalizzata significa invece creare uno strumento digitale cucito millimetricamente sulle specifiche esigenze della tua attività. Che si tratti di un\'applicazione mobile per la gestione della logistica, di un portale web per il monitoraggio degli ordini B2B o di un sistema CRM proprietario, realizziamo codice pulito, sicuro, altamente scalabile e integrabile con i tuoi sistemi esistenti.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  '2. Siti Web in Puro HTML: Velocità, Sicurezza e SEO',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Quando l\'obiettivo primario è presentare la propria azienda online con una vetrina professionale, una landing page di impatto o un sito istituzionale leggero, la tecnologia in puro HTML rappresenta la scelta d\'eccellenza assoluta. A differenza dei pesanti CMS ricchi di plugin superflui che rallentano la navigazione, un sito web in puro HTML garantisce tempi di caricamento fulminei (ottimizzati per Core Web Vitals), massima sicurezza contro le vulnerabilità informatiche e un posizionamento organico sui motori di ricerca (SEO) eccellente sin dal primo giorno.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  '3. E-commerce Shopify: Vendere Online Senza Compromessi',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Il commercio elettronico richiede piattaforme stabili, sicure, intuitive per l\'utente finale e dotate di potenti strumenti di gestione del magazzino e dei pagamenti. Attraverso lo sviluppo e la personalizzazione di e-commerce su Shopify, NextStep Digital ti accompagna nel mondo del digital retail. Creiamo negozi online professionali, graficamente accattivanti, perfettamente responsive su smartphone e tablet, e ottimizzati per massimizzare il tasso di conversione (Conversion Rate Optimization). Dalla configurazione iniziale dei cataloghi fino alle strategie di checkout avanzate, ti forniamo tutto il necessario per vendere con successo.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  '4. Ottimizzazione dei Flussi di Lavoro e Automazione',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Oltre alla scrittura del codice, analizziamo in profondità i colli di bottiglia operativi della tua impresa. Implementiamo automazioni intelligenti e flussi di lavoro digitali che eliminano le attività manuali ripetitive, riducono drasticamente i margini di errore umano e permettono al tuo team di concentrarsi unicamente sulle attività a maggior valore aggiunto.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00f2fe),
                    foregroundColor: const Color(0xFF0a1128),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Torna alla Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a1128),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= PAGINA METODO (URL PULITO: /metodo) =================
class MetodoPage extends StatefulWidget {
  const MetodoPage({super.key});

  @override
  State createState() => _MetodoPageState();
}

class _MetodoPageState extends State {
  @override
  void initState() {
    super.initState();
    _updateSEO(
      title: 'Il Nostro Metodo - Sviluppo App e Siti Web | NextStep Digital Catania',
      description: 'Scopri il metodo di NextStep Digital a Catania: un approccio sartoriale per lo sviluppo di app personalizzate, siti web e e-commerce con servizi in loco.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF070c1b),
        title: const Text('NextStep Digital - Il Metodo'),
        iconTheme: const IconThemeData(color: Color(0xFF00f2fe)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Il Metodo di NextStep Digital: Come Trasformiamo le Idee in Soluzioni Digitali Vincenti',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Nel panorama digitale odierno, avere una presenza online non basta più: serve una strategia mirata, un codice pulito e un\'esecuzione impeccabile. In NextStep Digital, con sede a Catania, abbiamo sviluppato un metodo di lavoro sartoriale pensato per accompagnare le aziende passo dopo passo, trasformando le sfide di business in opportunità concrete grazie ai nostri servizi in loco e alla nostra esperienza nello sviluppo di app personalizzate, siti web e e-commerce.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '1. Analisi Strategica e Ascolto del Cliente',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ogni grande progetto nasce da una comprensione profonda degli obiettivi aziendali. Prima di scrivere una sola riga di codice, incontriamo i nostri clienti a Catania o tramite consulenza dedicata per analizzare il mercato di riferimento, identificare i colli di bottiglia operativi e definire la soluzione tecnologica ideale.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '2. Progettazione UX/UI e Architettura su Misura',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Passiamo poi alla fase di design e pianificazione dell\'architettura software. Creiamo interfacce intuitive, veloci e piacevoli da navigare, garantendo un\'esperienza utente eccellente su qualsiasi dispositivo.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '3. Sviluppo Tecnologico ad Alte Prestazioni',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Sfruttando le migliori tecnologie sul mercato, realizziamo:\n- Sviluppo app personalizzate per ottimizzare i processi.\n- Siti web professionali e veloci.\n- E-commerce performanti orientati alla conversione.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '4. Test Rigorosi e Ottimizzazione SEO',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Prima del lancio, testiamo la qualità e integriamo le fondamenta per l\'ottimizzazione SEO tecnica, valorizzando anche la ricerca locale per chi opera sul territorio di Catania.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  '5. Lancio, Formazione e Supporto Continuo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Offriamo servizi di supporto in loco e assistenza continua, formando il tuo team sull\'uso dei nuovi strumenti digitali per garantire una crescita costante.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00f2fe),
                    foregroundColor: const Color(0xFF0a1128),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Torna alla Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a1128),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= PAGINA PREVENTIVO (URL PULITO: /preventivo) =================
class PreventivoPage extends StatefulWidget {
  const PreventivoPage({super.key});

  @override
  State createState() => _PreventivoPageState();
}

class _PreventivoPageState extends State {
  @override
  void initState() {
    super.initState();
    _updateSEO(
      title: 'Preventivo App e Siti Web Online | NextStep Digital',
      description: 'Richiedi un preventivo personalizzato per lo sviluppo di app, siti web in puro HTML o e-commerce Shopify. Stime trasparenti e soluzioni su misura per aziende.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF070c1b),
        title: const Text('NextStep Digital - Preventivo'),
        iconTheme: const IconThemeData(color: Color(0xFF00f2fe)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Richiesta Preventivo App Personalizzate e Siti Web: Costi e Soluzioni Trasparenti',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Se stai cercando un partner strategico e affidabile per digitalizzare o potenziare il tuo business, conoscere in modo chiaro i costi, i budget e le tempistiche di sviluppo software è il primo passo fondamentale. In NextStep Digital offriamo preventivi dettagliati, trasparenti e modulari per la creazione di app personalizzate, siti web professionali in puro HTML ed e-commerce Shopify ad alte prestazioni.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Come viene calcolato il preventivo per il tuo progetto?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Ogni azienda ha esigenze uniche, per questo motivo non crediamo nei listini rigidi ma in un\'offerta basata sulle reali necessità operative:\n- Sviluppo App Personalizzate: stime basate sulle funzionalità logiche, integrazioni API e complessità dei flussi utente.\n- Siti Web in Puro HTML: pacchetti ideali per chi necessita di una presenza online veloce, leggera, sicura e altamente ottimizzata per i motori di ricerca.\n- E-commerce Shopify: preventivi strutturati in base alla dimensione del catalogo prodotti, configurazione dei sistemi di pagamento e strategie di vendita.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'I vantaggi di un investimento tecnologico mirato',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Affidarsi a professionisti dello sviluppo significa trasformare un costo iniziale in un investimento altamente redditizio capace di automatizzare i processi aziendali, ridurre le spese superflue e attrarre un numero costante di nuovi clienti profilati. Richiedi subito una consulenza preliminare e scopri la stima su misura per la tua impresa.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00f2fe),
                    foregroundColor: const Color(0xFF0a1128),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Torna alla Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a1128),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================= PAGINA CONTATTI (URL PULITO: /contatti) =================
class ContattiPage extends StatefulWidget {
  const ContattiPage({super.key});

  @override
  State createState() => _ContattiPageState();
}

class _ContattiPageState extends State {
  @override
  void initState() {
    super.initState();
    _updateSEO(
      title: 'Contatti NextStep Digital | Agenzia Web e App a Catania',
      description: 'Mettiti in contatto con NextStep Digital. Scrivici a info@nextstepdigital.shop o chiama il numero 328/7095/115 per consulenze su app e siti web.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF070c1b),
        title: const Text('NextStep Digital - Contatti'),
        iconTheme: const IconThemeData(color: Color(0xFF00f2fe)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contatta NextStep Digital: Parla con un Esperto di Sviluppo App e Siti Web',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hai un\'idea innovativa da sviluppare, un software gestionale da creare o desideri rinnovare la presenza digitale della tua azienda per attrarre nuovi clienti? Il team di NextStep Digital è a tua completa disposizione per offrire consulenze strategiche mirate, analisi di fattibilità tecnica e preventivi rapidi per app personalizzate, siti web professionali ed e-commerce.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'I Nostri Recapiti Diretti',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF101c44),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFF00f2fe).withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.email, color: Color(0xFF00f2fe)),
                          SizedBox(width: 12),
                          Text(
                            'Email: info@nextstepdigital.shop',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: const [
                          Icon(Icons.phone, color: Color(0xFF00f2fe)),
                          SizedBox(width: 12),
                          Text(
                            'Telefono / WhatsApp: 328/7095/115',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Perché scegliere la nostra agenzia',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF00f2fe),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Garantiamo un contatto umano diretto, supporto costante, competenze tecniche di alto livello e la massima flessibilità, offrendo servizi sia a distanza che in loco per accompagnare passo dopo passo ogni tipo di impresa verso il successo digitale.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF94a3b8),
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00f2fe),
                    foregroundColor: const Color(0xFF0a1128),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Torna alla Home',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0a1128),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
