import { Api as Api } from './api.js';

var env = $("#env").val();
var bulk = [];
var v = '';

function prosesHitung(arr) {
    var result = '';
    let p1 = 0;
    let p2 = 0;
    let p3 = 0;
    let p4 = 0;
    let p5 = 0;
    // console.log(arr)
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
    result += `<td>${(p1+p2+p3+p4+p5).toFixed(2)}</td>`;
    
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
    return result;
}

function refreshBody(dt) {
    const media = _.uniqBy(dt, 'id');
    var tmp = '';
    if (media.length) {
        media.forEach(function(el, idx) {
            tmp += `<tr>`;
            tmp += `<td>${parseInt(idx)+1}</td>`;
            tmp += `<td style="text-align:left;">${el.nama_resmi}</td>`;
            const ft = _.filter(bulk, (o) => o.id == el.id);
            
            if (ft.length > 1) {
                let a = prosesHitung(ft);
                tmp += a;   
            }
            else if (ft.length == 1) {
                if (ft[0].penjurian) {
                    let a = prosesHitung(ft);
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