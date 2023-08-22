import { Api as Api } from './api.js';

var env = $("#env").val();

function refreshBody(re) {
    var tmp = '';
    re.forEach(function(el, idx) {
        tmp += `<tr>`;
        
        tmp += `<td class="text-center">${idx+1}</td>`;
        tmp += `<td style="width: 10%" class="text-center">
            <button type="button" data-id=${el.id} class="btn btn-success btn-icon-text btn-sm form-penilaian"><i class="fas fa-edit"></i></button>
        </td>`;
        tmp += `<td>${el.nama_resmi}</td>`;

        if (el.pid) {
            tmp += `<td><h6><span class="badge badge-success">Yes</span></h6></td>`;
        }
        else {
            tmp += `<td><h6><span class="badge badge-danger">No</span></h6></td>`;
        }

        if (el.penjurian) {
            const pj = JSON.parse(el.penjurian);
            const objectLength = Object.keys(pj).length;
            
            var c = 0;
            for (const key in pj) {
                if (pj.hasOwnProperty(key)) {
                    const value = pj[key];
                    const v = parseInt(value);
                    if(v) {
                        c = c+1;
                    }
                }
            }

            if (c == 5) {
                tmp += `<td><span class="badge badge-success">5/5</span></td>`;
            }
            else {
                tmp += `<td><span class="badge badge-warning">${c}/5</span></td>`;
            }
        }
        else {
            tmp += `<td><span class="badge badge-danger">0/5</span></td>`;         
        }

        tmp += `</tr>`;
    });

    $("#my-body").empty();
    $("#my-body").append(tmp);
}

function init() {
    let apiData = new Api(env, 'get_list_media_join', 'GET');
    let result = apiData.ajaxRequest();

    refreshBody(result);

    var data_table = new DataTable("#myTable", {
        stateSave: true,
        searchable: true,
        fixedHeight: true,
    });
}

$(document).ready(function() {
    $("#my-body").on('click', 'button.form-penilaian', function() {
        let v = $(this).data('id');
        let url = `form_penilaian/${v}`;
        
        window.location.href = url;
    });

    init();
});