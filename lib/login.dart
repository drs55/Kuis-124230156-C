import 'package:KUIZ/animal.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SimpleLoginPage extends StatefulWidget {
  @override
  State<SimpleLoginPage> createState() => _SimpleLoginPageState();
}

class _SimpleLoginPageState extends State<SimpleLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _message = '';
  final String correctUsername = 'AQEL';
  final String correctPassword = '156';

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (username == correctUsername && password == correctPassword) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AnimalListPage()),
      );
    } else {
      setState(() {
        _message = 'Username atau password salah.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8D6E63), Color(0xFFFBE9E7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.92),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 16)],
            ),
            width: 350,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Welcome', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF8D6E63))),
                SizedBox(height: 8),
                Text('Animal App', style: TextStyle(fontSize: 18, color: Color(0xFF8D6E63))),
                SizedBox(height: 32),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person, color: Color(0xFF8D6E63)),
                    filled: true,
                    fillColor: Color(0xFFFBE9E7),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF8D6E63)),
                    filled: true,
                    fillColor: Color(0xFFFBE9E7),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8D6E63),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      elevation: 6,
                    ),
                    onPressed: _login,
                    child: Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _message,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnimalListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Daftar Hewan', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.brown,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF8D6E63)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8D6E63), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.only(top: 80, bottom: 16),
          itemCount: dummyAnimals.length,
          itemBuilder: (context, index) {
            final animal = dummyAnimals[index];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimalDetailPage(animal: animal),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          animal.image,
                          width: 90,
                          height: 90,
                        ),
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              animal.name,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF8D6E63)),
                            ),
                            SizedBox(height: 6),
                            Text('${animal.height} | ${animal.weight}', style: TextStyle(color: Color(0xFF8D6E63))),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.star, color: Color(0xFF8D6E63), size: 18),
                                SizedBox(width: 4),
                                Text(animal.type.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ), // Padding
              ), // InkWell
            ); // Card (returned by itemBuilder)
          }, // itemBuilder
        ), // ListView.builder
      ), // Container (body)
    ); // Scaffold
  }
}

class AnimalDetailPage extends StatefulWidget {
  final Animal animal;
  const AnimalDetailPage({Key? key, required this.animal}) : super(key: key);

  @override
  State<AnimalDetailPage> createState() => _AnimalDetailPageState();
}

class _AnimalDetailPageState extends State<AnimalDetailPage> {
  bool isLiked = false;

  void _launchWiki() async {
    final url = widget.animal.wikipedia;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final animal = widget.animal;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(animal.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.brown ,
        elevation: 0,
        iconTheme: IconThemeData(color: Color(0xFF8D6E63)),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8D6E63), Color(0xFFFBE9E7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 80, left: 18, right: 18, bottom: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.network(animal.image, height: 220),
                ),
              ),
              SizedBox(height: 18),
              Text(animal.name, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF8D6E63))),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.height, color: Color(0xFF8D6E63)),
                  SizedBox(width: 6),
                  Text("Tinggi: ${animal.height} cm", style: TextStyle(fontSize: 16)),
                  SizedBox(width: 16),
                  Icon(Icons.monitor_weight, color: Color(0xFF8D6E63)),
                  SizedBox(width: 6),
                  Text('Berat: ${animal.weight} kg', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.public, color: Color(0xFF8D6E63)),
                  SizedBox(width: 6),
                  Text('Habitat: ${animal.habitat.join(", ")}', style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.pets, color: Color(0xFF8D6E63)),
                  SizedBox(width: 6),
                  Text('Type: ${animal.type}', style: TextStyle(fontSize: 16)),
                  Spacer(),
                  IconButton(
                    icon: isLiked
                        ? Icon(Icons.favorite, color: Colors.red, size: 32)
                        : Icon(Icons.favorite_border, color: Colors.brown, size: 32),
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 12),
              Text('Aktivitas:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF8D6E63))),
              ...animal.activities.map((c) => Padding(
                padding: const EdgeInsets.only(left: 8, top: 2),
                child: Text('- $c', style: TextStyle(fontSize: 15)),
              )),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8D6E63),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    onPressed: _launchWiki,
                    icon: Icon(Icons.link),
                    label: Text('Wikipedia', style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8D6E63),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    label: Text('Kembali', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
