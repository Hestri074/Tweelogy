async function grafik_stok() {
    try {
        const ctx = document.getElementById('bar-chart').getContext('2d');

        let nama_produk = [];
        let jml_stok_tersedia = [];
        let jml_stok_terjual = [];

         // await --> u/ menjalankan code scr async --> code bisa berjalan bersamaan tanpa memblock yg lain
        const response = await fetch("http://localhost/tweelogy/admin/coba2.php");
        let data = await response.json();
        console.log(data);

        data.forEach(d => {
            nama_produk.push(d.nama_produk);
            jml_stok_tersedia.push(d.jml_stok_tersedia);
            jml_stok_terjual.push(d.jml_stok_terjual);
        })

        const myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: nama_produk,
                datasets: [{
                    label: 'Stok Tersedia',
                    data: jml_stok_tersedia,
                    backgroundColor: 'rgba(54, 162, 235, 0.7)',
                    borderColor: "white",
                    borderWidth: 1
                }, {
                    label: 'Stok Terjual',
                    data: jml_stok_terjual,
                    backgroundColor: [
                        'rgba(255, 159, 64, 0.7)'
                    ],
                    borderColor: [
                        'white'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    } catch (error) {
        console.error(error)
    }
   
}

grafik_stok();