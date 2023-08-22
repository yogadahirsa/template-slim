<?php

namespace App\controller;

use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Illuminate\Database\Query\Builder;

class PenilaianController {
 
    public function __construct()
    {
        // $this->view = $view;
    }

    public function getByMid($db, $mid) {
        $result = [];
        $result = $db->table('penilaian')
            ->where('pendaftar_id', $mid)
            ->get();
        
        return $result;
    }

    public function getByMidPid($db, $mid, $pid, $tahap) {
        $result = [];
        $result = $db->table('penilaian')
            ->where('pendaftar_id', $mid)
            ->where('penilai_id', $pid)
            ->where('tahap', $tahap)
            ->get();
        
        return $result;
    }

    public function updateTahap1($db, $mid, $pid, $nilai) {
        $affected = $db->table('penilaian')
            ->where('pendaftar_id', $mid)
            ->where('penilai_id', $pid)
            ->update([
                'penilaian_kinerja' => $nilai,
            ]);
        
        return $affected;
    }

    public function insTahap1($db, $mid, $pid, $nilai) {
        $result = $db->table('penilaian')->insertGetId([
            'pendaftar_id' => $mid,
            'penilai_id' => $pid,
            'penilaian_kinerja' => $nilai,
        ]);

        return $result;
    }
}