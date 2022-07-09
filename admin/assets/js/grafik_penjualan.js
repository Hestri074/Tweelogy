const api_url = "http://localhost/tweelogy/admin/coba.php";
async function getapi(url) {
  const response = await fetch(url);
  var data = await response.json();
  console.log(data);

  // const label_data = [];
  // const value_data = [];

  // for (let r of data) {
  //   label_data.push(r.nama);
  //   value_data.push(r.Total);
  // }

  // const adalah nilai variabel yang tidak bisa diubah
  const BULAN = [
    "januari",
    "februari",
    "maret",
    "april",
    "mei",
    "juni",
    "juli",
    "agustus",
    "september",
    "oktober",
    "november",
    "desember",
  ];

  const COLORS = ['red', 'green', 'blue', 'salmon', 'purple', 'pink', 'yellow', 'orange', 'black', 'gray'];

  // mengelompokkan data dari database perbulan
  let b = {};
  data.forEach((v) => {
    if (v.tanggal_pembelian in b) {
      b[v.tanggal_pembelian].push(v);
    } else {
      b[v.tanggal_pembelian] = [v];
    }
  });

  console.log(b);
  
  // mencari item apa saja yang ada di chart.js
  let p_items = []
  for (const key in b) {
    if (Object.hasOwnProperty.call(b, key)) {
      const element = b[key];
        element.forEach(e2 => {
          if (p_items.indexOf(e2.nama) == -1) {
            p_items.push(e2.nama)
          }  
        });
    }
  }

  // ngecek item tiap bulan sama atau tidak
  let bulan_lable = [];
  // console.log("file: t.js ~ line 109 ~ sample", sample);
  for (const key in b) {
    if (Object.hasOwnProperty.call(b, key)) {
      const element = b[key];
      let f = false;
      bulan_lable.push(BULAN[Number(key) - 1]);

      p_items.forEach((p) => {
        element.forEach((i1) => {
            if (p == i1.nama) {
              f = true;
            }
          });
    
          if (f) {
            f = false;
          } else {
            b[key].push({ nama: p, Total: 0 });
          }
      })
      // sample.forEach((i2) => {
      //   element.forEach((i1) => {
      //     if (i2.nama == i1.nama) {
      //       f = true;
      //     }
      //   });
  
      //   if (f) {
      //     f = false;
      //   } else {
      //     b[key].push({ ...i2, Total: 0 });
      //   }
      // });
    }
  }

  // nampung data dari database sebelum dijadikan format chart.js
  bbb = {};
  for (const key in b) {
    if (Object.hasOwnProperty.call(b, key)) {
      const element = b[key];
      element.forEach((v) => {
        if (v.nama in bbb) {
          bbb[v.nama].push(Number(v.Total));
        } else {
          bbb[v.nama] = [Number(v.Total)];
        }
      });
    }
  }
  
  // mengubah data dari database ke format chart.js
  const datasets = [];
  let c_idx = 0;
  for (const key in bbb) {
    if (Object.hasOwnProperty.call(bbb, key)) {
      const data = bbb[key];
      datasets.push({
        data,
        label: key,
        borderColor: COLORS[c_idx],
        fill: false,
      });
      c_idx++;
    }
  }

  // console.log(label_data);
  console.log(bbb);

  // console.log(datasets);
  console.log(datasets);

//   const dataSales = [
//     {
//         day: "Mon", sales : {
//             food: 1300,
//             drink: 200,
//         },
//         day: "tue", sales : {
//             food: 500,
//             drink: 100,
//         },
//         day: "wed", sales : {
//             food: 400,
//             drink: 200,
//         },
//         day: "thu", sales : {
//             food: 800,
//             drink: 100,
//         }
//     }
//   ];


//   var ctx1 = document.getElementById("chart").getContext("2d");
//     var gradientStroke1 = ctx1.createLinearGradient(0, 230, 0, 50);
//     gradientStroke1.addColorStop(1, 'rgba(94, 114, 228, 0.2)');
//     gradientStroke1.addColorStop(0.2, 'rgba(94, 114, 228, 0.0)');
//     gradientStroke1.addColorStop(0, 'rgba(94, 114, 228, 0)');
//     new Chart(ctx1, {
//       type: "line",
//       data: {
//         labels: label_data,
//         datasets: [{
//           label: "Transaction",
//           tension: 0.4,
//           borderWidth: 0,
//           pointRadius: 0,
//           borderColor: "#5e72e4",
//           backgroundColor: gradientStroke1,
//           borderWidth: 3,
//           fill: true,
//           data: value_data,
//           maxBarThickness: 6
//         }],
//       },
//       options: {
//         responsive: true,
//         maintainAspectRatio: false,
//         plugins: {
//           legend: {
//             display: false,
//           }
//         },
//         interaction: {
//           intersect: false,
//           mode: 'index',
//         },
//         scales: {
//           y: {
//             grid: {
//               drawBorder: false,
//               display: true,
//               drawOnChartArea: true,
//               drawTicks: false,
//               borderDash: [5, 5]
//             },
//             ticks: {
//               display: true,
//               padding: 10,
//               color: '#5e72e4',
//               font: {
//                 size: 11,
//                 family: "Open Sans",
//                 style: 'normal',
//                 lineHeight: 2
//               },
//             }
//           },
//           x: {
//             grid: {
//               drawBorder: false,
//               display: false,
//               drawOnChartArea: false,
//               drawTicks: false,
//               borderDash: [5, 5]
//             },
//             ticks: {
//               display: true,
//               color: '#ccc',
//               padding: 20,
//               font: {
//                 size: 11,
//                 family: "Open Sans",
//                 style: 'normal',
//                 lineHeight: 2
//               },
//             }
//           },
//         },
//       },
//     });
// console.log (data)

// console.log (bulan_lable)
// console.log (datasets)

//  var xValues = [100,200,300,400,500,600,700,800,900,1000]; 

new Chart("chart", {
  type: "line",
  data: {
    labels: bulan_lable,
    datasets
  },
  options: {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        display: false,
      }
    },
    interaction: {
      intersect: false,
      mode: 'index',
    },
    scales: {
      y: {
        grid: {
          drawBorder: false,
          display: true,
          drawOnChartArea: true,
          drawTicks: false,
          borderDash: [5, 5]
        },
        ticks: {
          display: true,
          padding: 10,
          color: '#5e72e4',
          font: {
            size: 11,
            family: "Open Sans",
            style: 'normal',
            lineHeight: 2
          },
        }
      },
      x: {
        grid: {
          drawBorder: false,
          display: false,
          drawOnChartArea: false,
          drawTicks: false,
          borderDash: [5, 5]
        },
        ticks: {
          display: true,
          color: '#ccc',
          padding: 20,
          font: {
            size: 11,
            family: "Open Sans",
            style: 'normal',
            lineHeight: 2
          },
        }
      },
    },
  },
});
}

getapi(api_url);


