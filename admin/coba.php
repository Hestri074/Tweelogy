<?php
include "../koneksi.php";

$response = array();

$result = mysqli_query($koneksi, "SELECT pembelian_produk.nama, SUM(pembelian_produk.jumlah) Total, MONTH(`pembelian`.`tanggal_pembelian`) as 'tanggal_pembelian' FROM pembelian_produk JOIN pembelian ON(pembelian_produk.id_pembelian = pembelian.id_pembelian) GROUP BY MONTH(pembelian.tanggal_pembelian), pembelian_produk.nama ORDER BY `pembelian`.`tanggal_pembelian` DESC;
");
foreach ($result as $key){
    $data = array();
    $data['nama'] = $key["nama"];
    $data['Total'] = $key["Total"];
    $data['tanggal_pembelian'] = $key["tanggal_pembelian"];
    array_push($response, $data);
}
echo json_encode($response);
?>
