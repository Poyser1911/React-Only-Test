<?php

use Faker\Generator as Faker;

/* @var Illuminate\Database\Eloquent\Factory $factory */

$factory->define(App\Question::class, function (Faker $faker) {
    return [
        'user_id' => \App\User::all()->random()->id,
        'subject' => $faker->sentence(),
        'desc' => $faker->paragraph(rand(1,3), true)
    ];
});
