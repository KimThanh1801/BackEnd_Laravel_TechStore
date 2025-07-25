<?php
namespace Database\Factories;

use App\Models\Product;
use App\Models\ProductColor;
use Illuminate\Database\Eloquent\Factories\Factory;

class ProductColorFactory extends Factory
{
    protected $model = ProductColor::class;

    public function definition()
    {
        return [
            'product_id' => Product::factory(),
            'color' => $this->faker->safeColorName(), // Tạo màu sắc ngẫu nhiên
        ];
    }
}
