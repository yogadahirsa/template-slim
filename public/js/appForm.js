import { Api as Api } from './api.js';

var env = $("#env").val();
var mid = $("#media_id").val();

var is_uploaded = [];
is_uploaded['p1_a'] = '';
is_uploaded['p1_b'] = '';
is_uploaded['p2_c'] = '';

function validasi() {
    var requiredFields = [];
    const fileInput1a = $('#lamp_p1_a')[0];
    const file1a = fileInput1a.files[0];
    const fileInput1b = $('#lamp_p1_b')[0];
    const file1b = fileInput1b.files[0];
    const fileInput2c = $('#lamp_p2_c')[0];
    const file2c = fileInput2c.files[0];

    var jsonData = new FormData();

    if ($("#p1_a").val() > 1) {
        if (is_uploaded['p1_a']) {
            jsonData.append('is_uploaded_lamp_p1_a', is_uploaded['p1_a']);
        }
        else {
            requiredFields.push($("#lamp_p1_a"));
        }
        jsonData.append('lamp_p1_a', file1a);
    }
    if ($("#p1_b").val() > 1) {
        if (is_uploaded['p1_b']) {
            jsonData.append('is_uploaded_lamp_p1_b', is_uploaded['p1_b']);
        }
        else {
            requiredFields.push($("#lamp_p1_b"));
        }
        jsonData.append('lamp_p1_b', file1b);
    }
    if ($("#p2_c").val() > 1) {
        if (is_uploaded['p2_c']) {
            jsonData.append('is_uploaded_lamp_p2_c', is_uploaded['p2_c']);
        }
        else {
            requiredFields.push($("#lamp_p2_c"));
        }
        jsonData.append('lamp_p2_c', file2c);
    }

    var cek = 0;
    requiredFields.forEach(function(el) {
        if (el.val() === '') {
            cek = 1;
        }
        else if (el.val() == "0") {
            cek = 1;
        }
    });

    if (cek == 1) {
        alert('Harap melengkapi input File!');
    }
    else {
        jsonData.append('p1_a', $("#p1_a").val());
        jsonData.append('p1_b', $("#p1_b").val());
        jsonData.append('p2_a', $("#p2_a").val());
        jsonData.append('p2_b', $("#p2_b").val());
        jsonData.append('p2_c', $("#p2_c").val());
        jsonData.append('link_artikel1', $("#link_artikel1").val());
        jsonData.append('link_artikel2', $("#link_artikel2").val());
        jsonData.append('link_artikel3', $("#link_artikel3").val());
        jsonData.append('mid', mid);

        console.log(jsonData)

        let apiPost = new Api(env,'post_form_kinerja','POST',jsonData);
        let res = apiPost.ajaxRequestFile();

        // console.log(res)

        if (res.status) {
            $("#modal-sukses").modal('show');
        }
    }
}

function initForm(re) {
    var dt = re.data;
    const penilaian = JSON.parse(dt.penilaian_kinerja);
    console.log(penilaian)

    $("#p1_a").val(penilaian.p1_a);
    $("#p1_a").trigger('change');
    $("#p1_b").val(penilaian.p1_b);
    $("#p1_b").trigger('change');
    $("#p2_a").val(penilaian.p2_a);
    $("#p2_b").val(penilaian.p2_b);
    $("#p2_c").val(penilaian.p2_c);
    $("#p2_c").trigger('change');

    let root = re.uri;
    let sp = root.split('/');
    let path = `/${sp[1]}/${sp[2]}/upload`;

    if (penilaian.hasOwnProperty('lamp_p1_a')) {
        is_uploaded['p1_a'] = penilaian.lamp_p1_a;
        $("#uploaded_lamp_p1_a").empty();
        $("#uploaded_lamp_p1_a").append(`<strong>Uploaded file:</strong> <a href="${path}/${penilaian.lamp_p1_a}" target="_blank">${penilaian.lamp_p1_a}</a>`);   
    }

    if (penilaian.hasOwnProperty('lamp_p1_b')) {
        is_uploaded['p1_b'] = penilaian.lamp_p1_b;
        $("#uploaded_lamp_p1_b").empty();
        $("#uploaded_lamp_p1_b").append(`<strong>Uploaded file:</strong> <a href="${path}/${penilaian.lamp_p1_b}" target="_blank">${penilaian.lamp_p1_b}</a>`);   
    }

    if (penilaian.hasOwnProperty('lamp_p2_c')) {
        is_uploaded['p2_c'] = penilaian.lamp_p2_c;
        $("#uploaded_lamp_p2_c").empty();
        $("#uploaded_lamp_p2_c").append(`<strong>Uploaded file:</strong> <a href="${path}/${penilaian.lamp_p2_c}" target="_blank">${penilaian.lamp_p2_c}</a>`);   
    }

    if (penilaian.hasOwnProperty('link_artikel1')) {
        $("#link_artikel1").val(penilaian.link_artikel1);
    }
    
    if (penilaian.hasOwnProperty('link_artikel2')) {
        $("#link_artikel2").val(penilaian.link_artikel2);
    }

    if (penilaian.hasOwnProperty('link_artikel3')) {
        $("#link_artikel3").val(penilaian.link_artikel3);
    }
}

$(document).ready(function() {
    $("#form-kinerja").submit(function(ev) {
        ev.preventDefault();

        let re = validasi();
    });

    $("#p1_a,#p1_b,#p2_c").on('change', function() {
        let sib = $(this).parent().parent().children(":eq(1)");
        if ($(this).val() != 1) {
            sib.show();
        }
        else {
            sib.hide();
        }
    });

    $("#back").on('click', function() {
        let apiBack = new Api(env, 'get_url/input', 'GET');
        var uri = apiBack.ajaxRequest();
        window.location.href = uri.uri;
    });

    $("#close-sukses").on('click', function() {
        window.location.reload();
    })

    let apiPenilaian = new Api(env, 'get_penilaian_by_pid/'+mid, 'GET');
    let re = apiPenilaian.ajaxRequest();

    if (re.data) {
        initForm(re);
    }
});