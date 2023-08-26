import { Api as Api } from './api.js';

var env = $("#env").val();
var bulk = [];
var v = '';

function calculateStandardDeviation(numbers) {
    const mean = numbers.reduce((sum, num) => sum + num, 0) / numbers.length;
    const squaredDifferences = numbers.map(num => Math.pow(num - mean, 2));
    const variance = squaredDifferences.reduce((sum, diff) => sum + diff, 0) / numbers.length;
    const standardDeviation = Math.sqrt(variance);
    return standardDeviation;
}

function hitungTotal(a, b, c) {
    var result;

    const persenA = 40;
    const persenB = 40;
    const persenC = 20;

    const maxA = 8;
    const maxB = 8;
    const maxC = 1;

    result = ((a/maxA)*persenA)+((b/maxB)*persenB)+((c/maxC)*persenC);
    return result.toFixed(2);
}

function prosesHitung(arr, ma, mi) {
    // console.log(arr[0].jumlah_artikel, mi, ma)
    var result = '';
    
    let p1 = 0;
    let p2 = 0;
    let p3 = 0;
    let p4 = 0;
    let p5 = 0;
    let art = (parseInt(arr[0].jumlah_artikel)-parseInt(mi))/(parseInt(ma)-parseInt(mi));
    // console.log(art)
    arr.forEach(el => {
        const pj = JSON.parse(el.penjurian);
        for (const key in pj) {
            if (pj.hasOwnProperty(key)) {
                const value = pj[key];
                const param = v[key];
                // console.log(v[key])
                if (value == 0) {
                    if (key == 'p1_a') p1 += 0;
                    else if (key == 'p1_b') p2 += 0;
                    else if (key == 'p2_a') p3 += 0;
                    else if (key == 'p2_b') p4 += 0;
                    else if (key == 'p2_c') p5 += 0;
                }
                else {
                    param.forEach(el2 => {
                        if (el2.id == value) {
                            let hitung = (value*el2.bobot)/100;
                            // hitung = hitung.toFixed(2);
                            if (key == 'p1_a') p1 += hitung;
                            else if (key == 'p1_b') p2 += hitung;
                            else if (key == 'p2_a') p3 += hitung;
                            else if (key == 'p2_b') p4 += hitung;
                            else if (key == 'p2_c') p5 += hitung;
                        }
                    });
                }
            }
        }
    });

    result += `<td>${p1}</td>`;
    result += `<td>${p2}</td>`;
    result += `<td>${(p1+p2).toFixed(2)}</td>`;
    result += `<td>${p3}</td>`;
    result += `<td>${p4}</td>`;
    result += `<td>${p5}</td>`;
    result += `<td>${(p3+p4+p5).toFixed(2)}</td>`;
    result += `<td>${arr[0].jumlah_artikel}</td>`;
    result += `<td>${art.toFixed(2)}</td>`;
    result += `<td>${arr.length}</td>`;
    // result += `<td>${(p1+p2+p3+p4+p5+art).toFixed(2)}</td>`;
    result += `<td>${hitungTotal((p1+p2),(p3+p4+p5),art)}</td>`;
    
    return result;
}

function emptyTd() {
    var result = '';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    result += '<td></td>';
    return result;
}

function refreshBody(dt) {
    const media = _.uniqBy(dt, 'id');
    var tmp = '';
    const maxArtikel = _.maxBy(dt, function(o) { return o.jumlah_artikel; });
    const minArtikel = _.minBy(dt, function(o) { return o.jumlah_artikel; });
    const liArtikel = _.map(media, 'jumlah_artikel');
    
    const filteredLiArtikel = _.compact(liArtikel)
    const stdev = calculateStandardDeviation(filteredLiArtikel);
    console.log(filteredLiArtikel)
    console.log(stdev)

    // assign min max
    const myMax = maxArtikel.jumlah_artikel+(2*stdev);
    const myMin = minArtikel.jumlah_artikel-(2*stdev);
    
    if (media.length) {
        media.forEach(function(el, idx) {
            tmp += `<tr>`;
            tmp += `<td>${parseInt(idx)+1}</td>`;
            tmp += `<td style="text-align:left;">${el.nama_resmi}</td>`;
            const ft = _.filter(bulk, (o) => o.id == el.id);
            
            if (ft.length > 1) {
                let a = prosesHitung(ft, myMax, myMin);
                tmp += a;   
            }
            else if (ft.length == 1) {
                if (ft[0].penjurian) {
                    let a = prosesHitung(ft, myMax, myMin);
                    tmp += a;
                }
                else {
                    tmp += emptyTd()
                }
            }
            else {
                tmp += emptyTd();
            }
            tmp += `</tr>`;
        });
    }
    else {
        tmp += `<tr><td colspan="10">Empty data</td></tr>`;
    }

    $("#tbody-tab1").empty();
    $("#tbody-tab1").append(tmp);
}

$(document).ready(function() {
    let apiBulk = new Api(env, 'get_list_media_bulk', 'GET');
    let result = apiBulk.ajaxRequest();

    bulk = result.data;
    v = JSON.parse(result.var);

    refreshBody(result.data);

    var data_table = new DataTable("#myTable", {
        stateSave: true,
        searchable: true,
        fixedHeight: true,
    });
});