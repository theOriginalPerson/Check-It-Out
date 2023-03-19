import 'dart:convert';
import 'dart:html';
import 'dart:math';

void main() {
  // Make an HTTP GET request to retrieve the image and price data
  HttpRequest.getString('prices.json').then((response) {
    // Parse the JSON response into a list of items
    List<dynamic> items = jsonDecode(response);

    // Select a random item from the list
    Random random = Random();
    Map<String, dynamic> item = items[random.nextInt(items.length)];

    // Extract the image URL and price for the item
    String title = item['Title'];
    String imageUrl = item['Image'];
    String price = 'Price: ${item['Price']}';
    String idVal = 'Item ID: ${item['nlproduct__code']}';

    // Create HTML elements for the image and price
    HeadingElement name = HeadingElement.h2()..text = title;
    ImageElement image = ImageElement(src: imageUrl);
    HeadingElement priceElement = HeadingElement.h3()..text = price;
    HeadingElement id = HeadingElement.h3()..text = idVal;

    // Add the HTML elements to the DOM
    DivElement container = DivElement()
      ..append(name)
      ..append(image)
      ..append(priceElement)
      ..append(id);
    document.body?.append(container);
  }).catchError((error) {
    print('Error loading image data: $error');
  });
}
