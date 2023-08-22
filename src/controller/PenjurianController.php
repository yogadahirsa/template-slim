<?php

namespace App\controller;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Illuminate\Database\Query\Builder;

class PenjurianController {
 
    public function __construct()
    {
        // $this->view = $view;
    }

    public function getByMid($db, $mid) {
        $result = [];
        $result = $db->table('penjurian')
            ->select('penjurian.id','penjurian.penjurian','user.nama_lengkap')
            ->leftJoin('user','penjurian.penilai_id','user.id')
            ->where('penjurian.pendaftar_id', $mid)
            ->where('penjurian.is_accepted', 1)
            ->get();
        
        return $result;
    }

    public function getByMidPid($db, $mid, $pid) {
        $result = [];
        $result = $db->table('penjurian')
            ->where('pendaftar_id', $mid)
            ->where('penilai_id', $pid)
            ->where('is_accepted', 1)
            ->first();
        
        return $result;
    }

    public function updateTahap1($db, $mid, $pid, $nilai) {
        $affected = $db->table('penjurian')
            ->where('pendaftar_id', $mid)
            ->where('penilai_id', $pid)
            ->where('tahap', 1)
            ->where('is_accepted', 1)
            ->update([
                'penjurian' => $nilai,
            ]);
        
        return $affected;
    }

    public function insTahap1($db, $mid, $pid, $nilai) {
        $result = $db->table('penjurian')->insertGetId([
            'pendaftar_id' => $mid,
            'penilai_id' => $pid,
            'tahap' => 1,
            'penjurian' => $nilai,
        ]);

        return $result;
    }
}