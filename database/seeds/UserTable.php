<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserTable extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            'email' => 'khanh3@gmail.com',
            'password' => bcrypt('123456'),
            'created_at' => new DateTime(),
        ];

        DB::table('user')->insert($data);
    }
}
