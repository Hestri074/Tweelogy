<?php
//koneksi ke database
include '../../koneksi.php';

$queryStok = mysqli_query($koneksi, "SELECT p.nama_produk 'nama', p.stok_produk 'jml_stok_tersedia', SUM(pp.jumlah) 'jml_stok_terjual' 
  FROM produk p JOIN pembelian_produk pp ON(p.id_produk = pp.id_produk) GROUP BY p.nama_produk");
?>

<!DOCTYPE html>
<html>
<head>
  <title>Detail Produk</title>
  <!-- icon -->
  <link rel="icon" href="../../image_buyme/icon-tweelogy.png" type="image/png">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../fontawesome-free-5.15.4-web/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="../../css/kategoridanproduk.css">
</head>
<body>
  <div class="all">
  	<div class="header">
  		<h2 style="font-size:25px"><b>GRAFIK STOK PRODUK</b></h2>
  	</div>
  	<div class="image">
  		<img src="../../image_buyme/tw-nn.png" alt="" class="logo" style="width: 160px; height: 150px; position: absolute; left: 15px;">
  	</div>
  		<br>
  		<br>
    <div class="container container2">
      <div class="container-fluid">
        <br>
        <br>
        <div class="chart" style="color: black; background-color: white ; border: 4px solid #F9D701; border-radius: 0.6em;">
          <!-- <canvas id="chart" class="chart-canvas" height="400"></canvas> -->
          <canvas id="bar-chart" class="bar-chart-canvas" height="100"></canvas>
        </div>
        <br>
      <br>
      <br>
    </div>
</div>
    <br>
    <br>
    <br>
    <br>
    <div class="container container2" style = " background-color : #F9D701">
        <br>
          <h5><b>Tabel Stok Produk Secara Keseluruhan<b></h5>
          <table class="table" style="border: 5px solid #253D93; border-radius: 0.6em; " >
            <thead>
              <tr style="color: white; ">
                <th><b>Merk</b></th>
                <th><b>Tersedia</b></th>
                <th><b>Terjual</b></th>
              </tr>
            </thead>
            <tbody>
            <?php foreach ($queryStok as $row) {?>
              <tr>
                <td><?= $row["nama"] ?></td>
                <td><?= $row["jml_stok_tersedia"] ?></td>
                <td><?= $row["jml_stok_terjual"] ?></td>
              </tr>
            <?php }?>
           </tbody>
         </table>
       <br>
        </div>
    <br>
    <div class="container" style = " background-color : white">
        <a href="beranda.php" class="btn btn-primary" style="color: black; background-color: #F9D701; border: 4px solid #F9D701; border-radius: 0.6em;" ><b>Kembali</b></a>
        <br>
      </div>
  </div>
  <!-- Optional JS -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script src="../assets/vendor/clipboard/dist/clipboard.min.js"></script>
  <script src="../../admin/assets/js/grafik_penjualan.js"></script>
  <script src="../../admin/assets/js/grafik_stok.js"></script>
<br>
<br>
</body>
</html>
