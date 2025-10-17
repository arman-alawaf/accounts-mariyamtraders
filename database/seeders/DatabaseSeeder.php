<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Supplier;
use App\Models\Customer;
use App\Models\PayType;
use App\Models\Product;
use App\Models\Unit;
use App\Models\Buy;
use App\Models\BuyItem;
use App\Models\Sell;
use App\Models\SellItem;
use App\Models\Payment;
use App\Models\PaymentItem;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::firstOrCreate([
            'email' => 'admin@example.com',
        ], [
            'name' => 'Admin User',
            'role' => 'admin',
            'password' => bcrypt('password'),
        ]);

        User::firstOrCreate([
            'email' => 'manager@example.com',
        ], [
            'name' => 'Manager User',
            'role' => 'manager',
            'password' => bcrypt('password'),
        ]);

        User::firstOrCreate([
            'email' => 'user@example.com',
        ], [
            'name' => 'Regular User',
            'role' => 'user',
            'password' => bcrypt('password'),
        ]);

        // Delete previous suppliers and customers data
        Supplier::query()->delete();
        Customer::query()->delete();

        // Reset auto-increment IDs
        DB::statement('ALTER TABLE suppliers AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE customers AUTO_INCREMENT = 1');

        // Suppliers
        Supplier::factory(20)->create();
        Supplier::create(['name' => 'Supplier A', 'email' => 'supplierA@example.com', 'phone' => '1234567890', 'address' => 'Address A']);
        Supplier::create(['name' => 'Supplier B', 'email' => 'supplierB@example.com', 'phone' => '0987654321', 'address' => 'Address B']);

        // Customers
        Customer::factory(20)->create();
        Customer::create(['name' => 'Customer A', 'email' => 'customerA@example.com', 'phone' => '1111111111', 'address' => 'Address C']);
        Customer::create(['name' => 'Customer B', 'email' => 'customerB@example.com', 'phone' => '2222222222', 'address' => 'Address D']);

        // Delete previous pay types data
        PayType::query()->delete();

        // Reset auto-increment ID
        DB::statement('ALTER TABLE pay_types AUTO_INCREMENT = 1');

        // Pay Types
        PayType::create(['name' => 'Cash']);
        PayType::create(['name' => 'Credit Card']);
        PayType::create(['name' => 'Bank Transfer']);

        // Delete previous product data and related records
        BuyItem::query()->delete();
        SellItem::query()->delete();
        Buy::query()->delete();
        Sell::query()->delete();
        Payment::query()->delete();
        PaymentItem::query()->delete();
        Product::query()->delete();
        Unit::query()->delete();

        // Reset auto-increment IDs
        DB::statement('ALTER TABLE products AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE buys AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE buy_items AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE sells AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE sell_items AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE payments AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE payment_items AUTO_INCREMENT = 1');
        DB::statement('ALTER TABLE units AUTO_INCREMENT = 1');

        // Units
        Unit::create(['name' => 'Piece']);
        Unit::create(['name' => 'Kg']);
        Unit::create(['name' => 'Liter']);

        // Products
        $fruits = [
            ['name' => 'Mango'],
            ['name' => 'Jackfruit'],
            ['name' => 'Banana'],
            ['name' => 'Litchi'],
            ['name' => 'Guava'],
            ['name' => 'Papaya'],
            ['name' => 'Watermelon'],
            ['name' => 'Pineapple'],
            ['name' => 'Coconut'],
            ['name' => 'Starfruit'],
            ['name' => 'Blackberry'],
            ['name' => 'Wood Apple'],
            ['name' => 'Olive'],
            ['name' => 'Palm Fruit'],
            ['name' => 'Tamarind'],
        ];

        $products = [];
        foreach ($fruits as $fruit) {
            $products[] = Product::create($fruit);
        }

        $product1 = $products[0]; // Mango
        $product2 = $products[1]; // Jackfruit
        $product3 = $products[2]; // Banana

        // Units
        $unit1 = Unit::where('name', 'Piece')->first();
        $unit2 = Unit::where('name', 'Kg')->first();
        $unit3 = Unit::where('name', 'Liter')->first();

        // Suppliers
        $supplier1 = Supplier::where('name', 'Supplier A')->first();
        $supplier2 = Supplier::where('name', 'Supplier B')->first();

        // Customers
        $customer1 = Customer::where('name', 'Customer A')->first();
        $customer2 = Customer::where('name', 'Customer B')->first();

        // Pay Types
        $payType1 = PayType::where('name', 'Cash')->first();
        $payType2 = PayType::where('name', 'Credit Card')->first();

        // Sample Buys
        $payment1 = Payment::create();
        $buy1 = Buy::create(['supplier_id' => $supplier1->id, 'payment_id' => $payment1->id]);
        BuyItem::create(['buy_id' => $buy1->id, 'product_id' => $product1->id, 'unit_id' => $unit1->id, 'amount' => 10.00, 'quantity' => 50, 'note' => 'Bulk purchase']);
        BuyItem::create(['buy_id' => $buy1->id, 'product_id' => $product2->id, 'unit_id' => $unit2->id, 'amount' => 5.00, 'quantity' => 20, 'note' => 'Fresh stock']);
        PaymentItem::create(['payment_id' => $payment1->id, 'paytype_id' => $payType1->id, 'amount' => 350.00]);

        $payment2 = Payment::create();
        $buy2 = Buy::create(['supplier_id' => $supplier2->id, 'payment_id' => $payment2->id]);
        BuyItem::create(['buy_id' => $buy2->id, 'product_id' => $product3->id, 'unit_id' => $unit3->id, 'amount' => 8.00, 'quantity' => 30, 'note' => 'Special order']);
        PaymentItem::create(['payment_id' => $payment2->id, 'paytype_id' => $payType2->id, 'amount' => 240.00]);

        // Sample Sells
        $payment3 = Payment::create();
        $sell1 = Sell::create(['customer_id' => $customer1->id, 'payment_id' => $payment3->id]);
        SellItem::create(['sell_id' => $sell1->id, 'product_id' => $product1->id, 'unit_id' => $unit1->id, 'amount' => 15.00, 'quantity' => 10, 'note' => 'Retail sale']);
        SellItem::create(['sell_id' => $sell1->id, 'product_id' => $product2->id, 'unit_id' => $unit2->id, 'amount' => 8.00, 'quantity' => 5, 'note' => 'Discounted']);
        PaymentItem::create(['payment_id' => $payment3->id, 'paytype_id' => $payType1->id, 'amount' => 190.00]);

        $payment4 = Payment::create();
        $sell2 = Sell::create(['customer_id' => $customer2->id, 'payment_id' => $payment4->id]);
        SellItem::create(['sell_id' => $sell2->id, 'product_id' => $product3->id, 'unit_id' => $unit3->id, 'amount' => 12.00, 'quantity' => 8, 'note' => 'Wholesale']);
        PaymentItem::create(['payment_id' => $payment4->id, 'paytype_id' => $payType2->id, 'amount' => 96.00]);
    }
}
