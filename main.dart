import 'dart:io';

void main() {
  print('=== Welcome to the Pizza Order System ===');
  print('Menu Prices:');
  print('  Small  (S)  : 5  USD');
  print('  Medium (M)  :  7  USD');
  print('  Large  (L)  : 10 USD');
  print('=========================================');

  bool isRunning = true;
  int grandTotal = 0; //  to track total for all orders ( final calculation after done order)

  while (isRunning) {
    //  Pizza Size with input validation
    stdout.write('\nEnter pizza size (S for Small, M for Medium, L for Large) or Q to Quit: ');
    String? sizeInput = stdin.readLineSync()?.trim().toUpperCase();

    if (sizeInput == 'Q') {
      break;
    }

    if (sizeInput != 'S' && sizeInput != 'M' && sizeInput != 'L') {
      print('Error: Invalid size entered. Please enter S, M, or L.');
      continue; // ask again
    }

    // Quantity with input validation
    stdout.write('Enter quantity: ');
    String? qtyInput = stdin.readLineSync();
    int? quantity = int.tryParse(qtyInput ?? '');

    if (quantity == null || quantity <= 0) {
      print('Error: Invalid quantity. Please enter a positive integer.');
      continue;  //must not les than 0 or equal
    }

    int unitPrice = 0;
    String sizeName = '';

    // Switch case statement to determine price based on size
    switch (sizeInput) {
      case 'S':
        unitPrice = 5;
        sizeName = 'Small';
        break;
      case 'M':
        unitPrice = 7;
        sizeName = 'Medium';
        break;
      case 'L':
        unitPrice = 10;
        sizeName = 'Large';
        break;
    }

    // Calculate current order payment
    int totalPayment = unitPrice * quantity;
    
    // Add current order to the grand total
    grandTotal += totalPayment;

    // Print current order summary
    print('\n--- Order Summary ---');
    print('Size     : $sizeName (USD $unitPrice each)');
    print('Quantity : $quantity');
    print('Subtotal : USD $totalPayment');
    print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

    // Ask if user wants to continue ordering
    stdout.write('\nWould you like to place another order? (y/n): ');
    String? choice = stdin.readLineSync()?.trim().toLowerCase();
    if (choice != 'y') {
      isRunning = false;
    }
  }

  // Print final grand total after exiting the loop
  print('\n=========================================');
  print('                RECEIPT                  ');
  print('=========================================');
  print('Total Amount to Pay :  $grandTotal USD');
  print('Thank you for ordering!.');
  print('=========================================');
}