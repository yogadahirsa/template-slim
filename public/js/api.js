export class Api {
    constructor(env, url, type, data) {
        this.type = type;

        if (env == 'local') {
			var http = 'http://';
		}
        else if (env == 'vps') {
            var http = 'https://'
        }
		else {
			var http = 'https://';
		}

        if (data) {
            this.sdata = data;
        }

        var sp = location.pathname.split('/');

        if (sp.length == 3) {
            var fsp = sp.slice(1,-1).join('/');
        }
        else {
            let selisish = 3-sp.length-1
            var fsp = sp.slice(1,selisish).join('/');
        }

		var root = http+location.host +'/'+fsp;
        this.complete_url = root+'/'+url;
        // this.complete_url=fsp;
    }

    ajaxRequest() {
        var result = false

        if (this.sdata) {
            $.ajax({
                type: this.type,
                url: this.complete_url,
                data: this.sdata,
                async: false,
                cache: false,
                timeout: 30000,
                success: function(data) {
                    result =  data;
                },
                error: function(err) {
                    result = err;
                }
            });
        }

        else {
            $.ajax({
                type: this.type,
                url: this.complete_url,
                async: false,
                cache: false,
                timeout: 30000,
                success: function(data) {
                    result =  data;
                },
                error: function(err) {
                    result = err;
                }
            });
        }
        
        return result;
    }

    ajaxRequestFile() {
        var result = false;

        $.ajax({
            type: this.type,
            url: this.complete_url,
            data: this.sdata,
            processData: false,
            contentType: false,
            async: false,
            cache: false,
            timeout: 30000,
            success: function(data) {
                // Handle the data in the success callback
                result = data;
            },
            error: function(err) {
                // Handle errors in the error callback
                result = err;
            }
        });
        
        return result;
    }

    getUrl() {
        return this.complete_url;
    }
}