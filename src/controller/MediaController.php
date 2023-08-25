<?php

namespace App\controller;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Illuminate\Database\Query\Builder;

class MediaController {
 
    public function __construct()
    {
        // $this->view = $view;
    }

    public function getList($db) {
        $result = [];
        $result = $db->table('pendaftar')
            ->select('pendaftar.id','pendaftar.nama_resmi','user.nama_lengkap')
            ->leftJoin('user','pendaftar.created_by','user.id')
            ->where('pendaftar.is_deleted', 0)
            ->get();
        
        return $result;
    }

    public function getListJoin($db, $id) {
        $result = [];
        $result = $db->table('pendaftar')
            ->select('pendaftar.id','pendaftar.nama_resmi','user.nama_lengkap','penilaian.id as pid','penjurian.penjurian')
            ->leftJoin('user','pendaftar.created_by','user.id')
            ->leftJoin('penilaian','pendaftar.id','penilaian.pendaftar_id')
            ->leftJoin('penjurian', function ($join) use ($id) {
                $join->on('penjurian.pendaftar_id', '=', 'pendaftar.id')
                    ->where('penjurian.tahap', '=', 1)
                    ->where('penjurian.is_accepted', '=', 1)
                    ->where('penjurian.penilai_id', '=', $id);
            })
            ->where('pendaftar.is_deleted', 0)
            ->get();
        
        return $result;
    }

    public function getListBulk($db) {
        $result = [];
        $result = $db->table('pendaftar')
            ->select('pendaftar.id','pendaftar.nama_resmi','penilaian.penilaian_kinerja','penilaian.jumlah_artikel','penjurian.tahap','penjurian.penjurian','user.nama_lengkap')
            ->leftJoin('penilaian','pendaftar.id','penilaian.pendaftar_id')
            ->leftJoin('penjurian', function ($join) {
                $join->on('penjurian.pendaftar_id', '=', 'pendaftar.id')
                    ->where('penjurian.tahap', '=', 1)
                    ->where('penjurian.is_accepted', '=', 1);
            })
            ->leftJoin('user','penjurian.penilai_id','user.id')
            ->where('pendaftar.is_deleted', 0)
            ->get();
        
        return $result;
    }

    public function add($db, $nama, $cid) {
        $result = $db->table('pendaftar')->insertGetId([
            'id_role' => 9,
            'nama_resmi' => $nama,
            'is_aktif' => 1,
            'created_by' => $cid,
        ]);

        return $result;
    }

    public function edit($db, $param) {
        $affected = $db->table('pendaftar')->where('id', $param['id'])
            ->update([
                'nama_lengkap' => $param['nama_lengkap'],
                'nama_resmi' => $param['nama_resmi'],
                'email' => $param['email'],
                'wa' => $param['wa'],
            ]);
        
        return $affected;
    }

    public function delete($db, $id) {
        $affected = $db->table('pendaftar')->where('id', $id)
            ->update([
                'is_deleted' => 1,
            ]);
        
        return $affected;
    }

    public function getById($db, $id) {
        $result = [];
        $result = $db->table('pendaftar')
            ->where('id', $id)
            ->first();

        return $result;
    }

    public function getPenilaiaByPendaftarId($db, $mid) {
        $result = [];
        $result = $db->table('penilaian')
            ->select('penilaian.*','pendaftar.nama_resmi')
            ->leftJoin('pendaftar','pendaftar.id','penilaian.pendaftar_id')
            ->where('penilaian.pendaftar_id', $mid)
            ->first();
        return $result;
    }

    public function getPenilaiaByPendaftarIdPenilaiId($db, $mid, $pid) {
        $result = [];
        $result = $db->table('penilaian')
            ->select('penilaian.*','pendaftar.nama_resmi','penjurian.penjurian')
            ->leftJoin('pendaftar','pendaftar.id','penilaian.pendaftar_id')
            ->leftJoin('penjurian', function ($join) use ($pid) {
                $join->on('penjurian.pendaftar_id', '=', 'pendaftar.id')
                    ->where('penjurian.tahap', '=', 1)
                    ->where('penjurian.is_accepted', '=', 1)
                    ->where('penjurian.penilai_id', '=', $pid);
            })
            ->where('penilaian.pendaftar_id', $mid)
            ->first();

        return $result;
    }

    public function uploadFile($uploadedFile, $directory, $lampiran, $mid) {
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
            $filename = $uploadedFile->getClientFilename();
            $nama_lengkap = "[{$mid}]-[{$lampiran}]{$filename}";
            $lokasi_file = "{$directory}${nama_lengkap}";
            $uploadedFile->moveTo($lokasi_file);
        
            return $nama_lengkap;
        }
        else {
            return 'failed';
        }
    }

    public function insertKinerja($db, $pendaftar_id, $penilai_id, $json, $jml) {
        $result = $db->table('penilaian')->insertGetId([
            'pendaftar_id' => $pendaftar_id,
            'penilai_id' => $penilai_id,
            'penilaian_kinerja' => $json,
            'jumlah_artikel' => $jml,
        ]);

        return $result;
    }

    public function updateKinerja($db, $pendaftar_id, $penilai_id, $json, $jml) {
        $affected = $db->table('penilaian')->where('pendaftar_id', $pendaftar_id)
            ->update([
                'penilai_id' => $penilai_id,
                'penilaian_kinerja' => $json,
                'jumlah_artikel' => $jml,
            ]);
        
        return $affected;
    }
    
}