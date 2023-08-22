import { Api as Api } from './api.js';

var env = $("#env").val();
var edit_id = 0;
var data_table;

function refreshTable(re) {
    var tmp = '';
    re.forEach(function(el, idx) {
        tmp += `<tr>`;
        tmp += `<td style="width: 10%" class="text-center">
            <button type="button" data-id=${el.id} class="btn btn-success btn-icon-text btn-sm edit"><i class="fas fa-edit"></i></button>
            <button type="button" data-id=${el.id} class="btn btn-danger btn-icon-text btn-sm delete"><i class="fas fa-trash"></i></button>
        </td>`;
        tmp += `<td class="text-center">${idx+1}</td>`;
        tmp += `<td>${el.nama_resmi}</td>`;
        tmp += `<td>${el.nama_lengkap}</td>`;
        tmp += `<td style="widht: 10%" class="text-center"><button type="button" data-id=${el.id} class="btn btn-success btn-sm form-kinerja"><i class="fas fa-edit"></i></button></td>`;
        tmp += `</tr>`;
    });

    $("#my-body").empty();
    $("#my-body").append(tmp);
}

function init(upd=0) {
    let apiData = new Api(env, 'get_list_media', 'GET');
    var result = apiData.ajaxRequest();
    
    if (upd) {
        // data_table.clear();
        data_table.destroy();
    }

    refreshTable(result);

    data_table = new DataTable("#myTable", {
        stateSave: true,
        searchable: true,
        fixedHeight: true,
    });
}

$(document).ready(function() {
    $("#form-tambah").submit(function(event) {
        event.preventDefault();

        var jsonData = new FormData();
        jsonData.append('nama_resmi', $("#nama_resmi").val());

        let apiTambah = new Api(env,'tambah_media','POST',jsonData);
        let re = apiTambah.ajaxRequestFile();

        $("#close-tambah").trigger('click');
        
        if (re.status) {
            init(1);
        }
    });

    $("#form-edit").submit(function(event) {
        event.preventDefault();

        var jsonData = new FormData();
        jsonData.append('nama_resmi', $("#nama_resmi_edit").val());
        jsonData.append('nama_lengkap', $("#nama_lengkap").val());
        jsonData.append('email', $("#email").val());
        jsonData.append('wa', $("#wa").val());
        jsonData.append('id', edit_id);

        let apiEdit = new Api(env,'edit_media','POST',jsonData);
        let re = apiEdit.ajaxRequestFile();

        if (re.status) {
            init(1);
        }
        $("#close-edit").trigger('click');
    });

    $("#my-body").on('click', 'button.edit', function() {
        edit_id = $(this).data('id');

        let apiGet = new Api(env, 'get_media_by_id/'+edit_id, 'GET');
        let result = apiGet.ajaxRequest();


        $("#nama_resmi_edit").val(result.nama_resmi);
        $("#nama_lengkap").val(result.nama_lengkap);

        $("#modal-edit").modal('show');
    });

    $("#my-body").on('click', 'button.delete', function() {
        let id = $(this).data('id');

        var konfirm = confirm(`Anda akan menghapus data dengan id ${id}?`);
        if (konfirm) {
            let apiDel = new Api(env, 'delete_media_by_id/'+id, 'GET');
            let result = apiDel.ajaxRequest();

            if (result.status) {
                init(1);
            }
        }
    });

    $("#button-tambah").on('click', function() {
        $("#nama_resmi").val("");
        $("#modal-tambah").modal('show');
    });

    $("#my-body").on('click', 'button.form-kinerja', function() {
        let v = $(this).data('id');
        let url = `form_kinerja/${v}`;
        
        window.location.href = url;
    });

    init();
});