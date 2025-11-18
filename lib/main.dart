import 'package:ecommerce_app/providers/cart_provider.dart';
import 'package:ecommerce_app/screens/auth_wrapper.dart';
import 'package:ecommerce_app/services/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Nomad Gear & Co. Color Palette ---
const Color nomadBlack = Color(0xFF212121);
const Color nomadWhite = Color(0xFFFAFAFA);
const Color nomadGrey = Color(0xFF9E9E9E);
// --- END OF COLOR PALETTE ---

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Initialize Notification Service
  await NotificationService().initNotifications();

  final cartProvider = CartProvider();
  runApp(
    ChangeNotifierProvider.value(
      value: cartProvider,
      child: const MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eCommerce App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: nomadBlack,
        colorScheme: ColorScheme.fromSeed(
          seedColor: nomadBlack,
          brightness: Brightness.light,
          primary: nomadBlack,
          secondary: nomadGrey,
          surface: nomadWhite,
          onPrimary: nomadWhite,
          onSecondary: nomadWhite,
          onSurface: nomadBlack,
          error: Colors.red, // Keep a standard error color
          onError: Colors.white,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: nomadWhite,
        textTheme: GoogleFonts.robotoTextTheme(
          ThemeData(brightness: Brightness.light).textTheme,
        ).apply(
          bodyColor: nomadBlack,
          displayColor: nomadBlack,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.hovered)) return nomadGrey;
                return nomadBlack; // Defer to the default
              },
            ),
            foregroundColor: WidgetStateProperty.all<Color>(nomadWhite),
            padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            ),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: nomadGrey.withAlpha(128)),
          ),
          labelStyle: TextStyle(color: nomadGrey.withAlpha(204)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: nomadBlack, width: 2.0),
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 2,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          clipBehavior: Clip.antiAlias,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: nomadWhite,
          foregroundColor: nomadBlack,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const AuthWrapper(),
    );
  }
}
