// lib/services/url_launcher_service.dart
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  static Future<void> launchPhone(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  static Future<void> launchEmail(String email, String subject, String body) async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }

  static Future<void> launchMap(double latitude, double longitude, String query) async {
    Uri googleMapsUrl = Uri.parse('http://maps.google.com/maps?q=$latitude,$longitude');
    Uri webMapUrl = Uri.parse('https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)}');

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else if (await canLaunchUrl(webMapUrl)) {
      await launchUrl(webMapUrl);
    } else {
      print('Could not launch map for $query');
    }
  }

  static Future<void> launchWhatsApp(String phoneNumber, String message) async {
    String whatsappUrl = "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeComponent(message)}";
    Uri url = Uri.parse(whatsappUrl);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      String webWhatsappUrl = "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}";
      Uri webUrl = Uri.parse(webWhatsappUrl);
      if (await canLaunchUrl(webUrl)) {
        await launchUrl(webUrl);
      } else {
        print('Could not launch WhatsApp for $phoneNumber');
      }
    }
  }

  static Future<void> launchWebUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print('Could not launch $url');
    }
  }
}
