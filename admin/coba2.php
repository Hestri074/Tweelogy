<?php
include "../koneksi.php";

$response = array();

$result = mysqli_query($koneksi, "SELECT p.nama_produk, p.stok_produk 'jml_stok_tersedia', SUM(pp.jumlah) 'jml_stok_terjual' FROM produk p JOIN pembelian_produk pp ON(p.id_produk = pp.id_produk) GROUP BY p.nama_produk");

foreach ($result as $key){
    $data = array();
    $data['nama_produk'] = $key["nama_produk"];
    $data['jml_stok_tersedia'] = $key["jml_stok_tersedia"];
    $data['jml_stok_terjual'] = $key["jml_stok_terjual"];
    array_push($response, $data);
}
echo json_encode($response);
?>
