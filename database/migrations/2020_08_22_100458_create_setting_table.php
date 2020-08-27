<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('setting', function (Blueprint $table) {
            $table->string('phone', 255)->nullable();
            $table->string('phone_support', 255)->nullable();
            $table->string('name', 255)->nullable();
            $table->string('address', 255)->nullable();
            $table->string('link_fb', 255)->nullable();
            $table->string('link_zalo', 255)->nullable();
            $table->string('link_youtube', 255)->nullable();
            $table->string('link_instagram', 255)->nullable();
            $table->softDeletes('deleted_at')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('setting');
    }
}