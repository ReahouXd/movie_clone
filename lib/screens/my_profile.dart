import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      // backgroundColor: Colors.black.withOpacity(0.9),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Scaffold(
      // drawer: _buildDrawer(),
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: AppBar(
      //   leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: const Icon(
      //         Icons.menu,
      //         size: 30,
      //         color: Colors.white,
      //       ),
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //     );
      //   },
      // ),
        backgroundColor: Colors.black,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Handle search action
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Handle more action
            },
          ),
        ],
      ),
      body: _buildProfileContent(),
    );
  }

  Widget _buildProfileContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.grey[700],
              child: ClipOval(
                child: Image.asset(
                  "assets/poster/admin.jpg",
                  fit: BoxFit.cover,
                  width: 180,
                  height: 180,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Roeun Chanthou',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            const Text(
              'roeunchanthou',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 5),
            const Text(
              'Joined 2024',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ProfileStatItem(label: 'Movies', value: '0'),
                _ProfileStatItem(label: 'Shows', value: '0'),
                _ProfileStatItem(label: 'Episodes', value: '0'),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.people, color: Colors.white),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Plex is better with friends!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Connect with friends to share recommendations, ratings, your watchlist, and more!',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle add friends action
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    child: const Text('Add friends'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Ly Hou'),
            accountEmail: const Text('roeunchanthou1401@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: ClipOval(
                child: Image.asset(
                  'assets/poster/admin.jpg',  // Replace with your image path
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[800],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.white),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(color: Colors.grey), // Divider under Home
          ListTile(
            leading: const Icon(Icons.bookmark, color: Colors.white),
            title: const Text('Watchlist', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(color: Colors.grey), // Divider under Watchlist
          ListTile(
            leading: const Icon(Icons.live_tv, color: Colors.white),
            title: const Text('Live TV', style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
          const Divider(color: Colors.grey), // Divider under Live TV
          // Add more ListTile items with dividers if necessary
        ],
      ),
    );
  }

}

class _ProfileStatItem extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
      ],
    );
  }
}
