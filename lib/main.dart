import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/providers/theme_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) {
          final themeProvider = context.watch<ThemeProvider>();
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Yes No App',
              theme: AppTheme(
                      selectedColorIndex: themeProvider.currentColorIndex,
                      isDark: themeProvider.isDark)
                  .theme(),
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Yes -  No'),
                  actions: [
                    IconButton(
                        onPressed: () {
                          themeProvider.changeColorIndex();
                        },
                        icon: const Icon(Icons.color_lens)),
                    IconButton(
                        onPressed: () {
                          themeProvider.toggleDark();
                        },
                        icon: Icon(
                          themeProvider.isDark 
                            ? Icons.light_mode
                            : Icons.dark_mode
                        )
                        ),
                  ],
                ),
                body: const ChatScreen(),
              ));
        },
      ),
    );
  }
}
