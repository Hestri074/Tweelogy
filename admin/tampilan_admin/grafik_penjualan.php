<?php
//koneksi ke database
include '../../koneksi.php';

$queryBulan = mysqli_query($koneksi, "SELECT MONTH(pembelian.tanggal_pembelian) bulan FROM pembelian GROUP BY bulan"); 
?>

<!DOCTYPE html>
<html>
<head>
  <title>Detail Produk</title>
  <!-- icon -->
  <link rel="icon" href="../../image_buyme/icon-tweelogy.png" type="image/png">
  <link rel="stylesheet" type="text/css" href="../../css/kategoridanproduk.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="../../fontawesome-free-5.15.4-web/css/all.min.css">
</head>
<body>
  <div class="all">
  	<div class="header">
  		<h2 style="font-size:25px"><b>GRAFIK PENJUALAN PRODUK</b></h2>
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
          <canvas id="chart" class="chart-canvas" height="400"></canvas>
          <!-- <canvas id="bar-chart" class="bar-chart-canvas" height="100"></canvas> -->
        </div>
        <br>
      </div>
      <br>
      <br>
    </div>
    <br>
    <br>
    <br>
    <div class="container container2" style = " background-color : #F9D701">
    <br>
        <h5><b>Tabel Penjualan Produk Per-Bulan<b></h5>
        <table class="table" style="border: 5px solid #253D93; color: white" >
          <!-- <thead> -->
            <!-- <tr style="color: white; "> -->
              <th rowspan ="2" style= "text-align:center; border:3px solid white; vertical-align:middle; color: white" >Bulan</th>
              <th colspan = "2" style= "text-align:center; border-right:3px solid white;">Terbanyak</th>
              <th colspan = "2" style= "text-align:center;">Tersedikit</th>
            <!-- </tr> -->
            <tr> 
              <th style= "text-align:center; border:3px solid white;">Nama Produk</th>
              <th style= "text-align:center; border:3px solid white;">Jumlah Produk</th>
              <th style= "text-align:center; border:3px solid white;">Nama Produk</th>
              <th style= "text-align:center; border:3px solid white;">Jumlah Produk</th>
            </tr>
          <!-- </thead> -->
          <tbody>
          <?php foreach ($queryBulan as $nomorBulan) {?>
              <?php $queryMax = mysqli_query($koneksi, "SELECT pembelian_produk.nama, 
                SUM(pembelian_produk.jumlah) total, 
                MONTH(pembelian.tanggal_pembelian) as 'tanggal_pembelian' 
                FROM pembelian_produk JOIN pembelian 
                ON(pembelian_produk.id_pembelian = pembelian.id_pembelian) 
                WHERE MONTH(pembelian.tanggal_pembelian) = '" . $nomorBulan['bulan'] . "'  
                GROUP BY MONTH(pembelian.tanggal_pembelian), pembelian_produk.nama 
                ORDER BY total DESC LIMIT 1");?>

              <?php $queryMin = mysqli_query($koneksi, "SELECT pembelian_produk.nama, 
                SUM(pembelian_produk.jumlah) total, 
                MONTH(pembelian.tanggal_pembelian) as 'tanggal_pembelian' 
                FROM pembelian_produk JOIN pembelian 
                ON(pembelian_produk.id_pembelian = pembelian.id_pembelian) 
                WHERE MONTH(pembelian.tanggal_pembelian) = '" . $nomorBulan['bulan'] . "'  
                GROUP BY MONTH(pembelian.tanggal_pembelian), pembelian_produk.nama 
                ORDER BY total ASC LIMIT 1");?>

              <tr style = text-align:center; border: 3px solid white>
                <?php foreach ($queryMax as $key): ?>
                <?php $namaBulan = date ("F", mktime(0, 0, 0, $key["tanggal_pembelian"], 10))?>
                  <td style = "border-right:3px solid white"><?= $namaBulan ?></td>
                  <td style = "border-right:3px solid white"><?= $key["nama"]?></td>
                  <td style = "border-right:3px solid white"><?= $key["total"]?></td>
                <?php endforeach ?> 
                <?php foreach ($queryMin as $key) : ?>
                  <td style = "border-right:3px solid white"><?= $key["nama"]?></td>
                  <td style = "border-right:3px solid white"><?= $key["total"]?></td> 
              <?php endforeach?>
              </tr>
            <?php }?>
          </tbody>
        </table>
      <br>
    </div>
    <br>
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
