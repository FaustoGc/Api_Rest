<?php

namespace App\Models;

use CodeIgniter\Model;

class HomeModel extends Model
{
    protected $tableClientes = 'clientes';
    protected $tableProductos = 'productos';
    protected $tableVentas = 'ventas';

    public function lista_clientes()
    {
        $query = $this->db->query("SELECT * FROM " . $this->tableClientes . " LIMIT 3");
        $result = $query->getResult();

        return !empty($result) ? $result : [];
    }

    public function lista_productos()
    {
        $query = $this->db->query("SELECT * FROM " . $this->tableProductos . " LIMIT 3");
        $result = $query->getResult();

        return !empty($result) ? $result : [];
    }

    public function lista_clientes_productos()
    {
        $query = $this->db->query(
            "SELECT c.Id_clientes, c.nombres, p.id, p.nombre 
            FROM " . $this->tableClientes . " c 
            JOIN " . $this->tableVentas . " v ON c.Id_clientes = v.id_cliente 
            JOIN " . $this->tableProductos . " p ON v.id_producto = p.id"
        );
        $result = $query->getResult();

        return !empty($result) ? $result : [];
    }
}
