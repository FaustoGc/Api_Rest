<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;
use App\Models\HomeModel;

class Home extends BaseController
{
    public function __construct()
    {
        $this->homeModel = new HomeModel();
    }

   public function index(): ResponseInterface
{
    $clientes = $this->homeModel->lista_clientes();
    $productos = $this->homeModel->lista_productos();
    $clientes_productos = $this->homeModel->lista_clientes_productos();

    $result = [
        'clientes' => $clientes,
        'productos' => $productos,
        'clientes_productos' => $clientes_productos
    ];

    return $this->response->setJSON($result);
}
}
