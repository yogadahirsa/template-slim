import { Api as Api } from './api.js';

var env = $("#env").val();
var bulk = [];
var v = '';

function rekapTotal(arr) {
    var total = 0;
    const jml = arr.length;

    arr.forEach(function(el, idx) {
        const pj = JSON.parse(el.penjurian);
        for (const key in pj) {
            if (pj.hasOwnProperty(key)) {
                const value = pj[key];
                const param = v[key];
                param.forEach(el => {
                    if (el.id == value) {
                        total = total+(value*el.bobot/100);
                    }
                });
            }
        }
    });

    return total/jml;
}

function refreshModalBody(mid) {
    let apiModal = new Api(env, `get_penjurian_by_mid/${mid}`, 'GET');
    let re = apiModal.ajaxRequest();
    let result =  re.data;

    // console.log(result)
    var tmp = '';
    if (result.length) {
        result.forEach(function(el, idx){
            tmp += `<tr><td>${el.nama_lengkap}</td>`;
            const pj = JSON.parse(el.penjurian);
            // console.log(pj)
            var komitmen = 0;
            var kualitatif = 0;
            var total = 0;
            for (const key in pj) {
                if (pj.hasOwnProperty(key)) {
                    const value = pj[key];
                    const param = v[key];
                    // console.log(v[key])
                    if (value == 0) {
                        tmp += `<td>0</td>`;
                    }
                    else {
                        param.forEach(el2 => {
                            // console.log(value)
                            if (el2.id == value) {
                                let hitung = value*el2.bobot/100;
                                tmp += `<td>${hitung}<br><small>(${value}*${el2.bobot}/100)</small></td>`;
                                if (el2.jenis == 'komitmen') {
                                    komitmen += hitung;
                                }
                                else {
                                    kualitatif += hitung;
                                }
                            }
                        });
                    }
                }
            }
            tmp += `<td>${komitmen}</td>`;
            tmp += `<td>${kualitatif}</td>`;
            tmp += `<td>${komitmen+kualitatif}</td>`;
            tmp += `<tr>`;
        });
    }
    else {
        tmp += `<tr><td colspan="9">Empty data</td></tr>`;
    }

    $("#my-modal-body").empty();
    $("#my-modal-body").append(tmp);
    $("#modal-penilai").modal('show');
}

function refreshBody(re) {
    const media = _.uniqBy(re, 'id');
    // console.log(media)
    var tmp = '';
    if (media.length) {
        media.forEach(function(el, idx) {
            tmp += `<tr>`;
            tmp += `<td>${parseInt(idx)+1}</td>`;
            tmp += `<td>${el.nama_resmi}</td>`;
            const ft = _.filter(bulk, (o) => o.id == el.id);
            if (ft[0].penilaian_kinerja) {
                tmp += `<td class="text-center"><span class="badge badge-success">Ya</span></td>`;
            }
            else {
                tmp += `<td class="text-center"><span class="badge badge-danger">Tidak</span></td>`;
            }

            if (ft.length > 1) {
                tmp += `<td class="text-center">${ft.length}</td>`;
            }
            else if (ft.length == 1) {
                if (ft[0].penjurian) {
                    tmp += `<td class="text-center">1</td>`;    
                }
                else {
                    tmp += `<td class="text-center">0</td>`;
                }
            }
            else {
                tmp += `<td class="text-center">0</td>`;
            }
            
            // Total
            if (ft.length > 1) {
                let total = rekapTotal(ft);
                tmp += `<td class="text-center pops" data-id="${el.id}">${total.toFixed(2)}</td>`;
            }
            else if (ft.length == 1) {
                if (ft[0].penjurian) {
                    let total = rekapTotal(ft);
                    tmp += `<td class="text-center pops" data-id="${el.id}">${total.toFixed(2)}</td>`;
                }
                else {
                    tmp += `<td class="text-center">NA</td>`;
                }
            }
            else {
                tmp += `<td class="text-center">NA</td>`;
            }
            tmp += `</tr>`;
        });
    }
    else {
        tmp += `<tr><td colspan="5">Empty data</td></tr>`;
    }
    $("#my-body").empty();
    $("#my-body").append(tmp);
}

$(document).ready(function() {
    $("#my-body").on('mouseenter', 'td.pops', function() {
        $(this).addClass('hovered');
    });

    $("#my-body").on('mouseleave', 'td.pops', function() {
        $(this).removeClass('hovered');
    });

    $("#my-body").on('click', 'td.pops', function() {
        refreshModalBody($(this).data('id'));
    });

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