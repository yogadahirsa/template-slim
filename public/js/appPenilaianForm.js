import { Api as Api } from './api.js';

var env = $("#env").val();
var mid = $("#mid").val();

var pertanyaan =  [];
pertanyaan['p1_a'] = 'Pertanyaan 1A';
pertanyaan['p1_b'] = 'Pertanyaan 1B';
pertanyaan['p2_a'] = 'Pertanyaan 2A';
pertanyaan['p2_b'] = 'Pertanyaan 2B';
pertanyaan['p2_c'] = 'Pertanyaan 2C';

function postPenilaian() {
    var jsonData = new FormData();
    jsonData.append('mid', mid);

    if ($("#p1_a").val()) jsonData.append('p1_a', $("#p1_a").val());
    if ($("#p1_b").val()) jsonData.append('p1_b', $("#p1_b").val());
    if ($("#p2_a").val()) jsonData.append('p2_a', $("#p2_a").val());
    if ($("#p2_b").val()) jsonData.append('p2_b', $("#p2_b").val());
    if ($("#p2_c").val()) jsonData.append('p2_c', $("#p2_c").val());

    let apiPost = new Api(env,'post_penilaian','POST',jsonData);
    let re = apiPost.ajaxRequestFile();

    if (re.status == 'ok') {
        $("#modal-sukses").modal('show');
    }
}

function refreshBodyModal(re, tipe) {
    if (re.length) {
        var tmp;
        re.forEach(function(el, idx) {
            const pj = JSON.parse(el.penjurian);
            tmp += `<tr><td>${parseInt(idx)+1}</td>`;
            tmp += `<td>${el.nama_lengkap}</td>`;
            tmp += `<td>${pj[tipe]}</td></tr>`;
        });
    }

    else {
        var tmp = `<tr><td colspan="3">Empty data</td></tr>`;
    }
    $("#my-body").empty();
    $("#my-body").append(tmp);
}

$(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();

    $("#submit").on('click', function() {
        postPenilaian();
    });

    $(".detail-penilaian").on('click', function() {
        let tipe = $(this).data('jenis');

        let apiPt = new Api(env, `get_penjurian_by_mid/${mid}`, 'GET');
        let result = apiPt.ajaxRequest();
        
        refreshBodyModal(result.data, tipe);

        $("#modal-penilai-label").text(pertanyaan[tipe]);
        $("#modal-penilaian").modal('show');
    });
});