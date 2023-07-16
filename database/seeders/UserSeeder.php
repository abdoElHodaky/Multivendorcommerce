<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // data
        $data = [
            'admin' => [
                'name' => 'Abdo Moh',
                'email' => 'admin@gmail.com',
                'password' => Hash::make('admin1234'),
                'username' => 'abdomoh1',
                'role' => 'admin',
                'status' => 1]
            ,
            'vendor' => [
                'name' => 'AbdoMoh Vendor',
                'email' => 'vendor@gmail.com',
                'password' => Hash::make('vendor1234'),
                'username' => 'abdomohv2',
                'role' => 'vendor',
                'status' => 0]
            ,
            'user' => [
                'name' => 'Abdo User',
                'email' => 'user@gmail.com',
                'password' => Hash::make('user1234'),
                'username' => 'abdomohu3',
                'role' => 'user',
                'status' => 0]

        ];

        // seed the db
        foreach ($data as $role => $userData)
            DB::table('users')->insert($userData);
    }
}
