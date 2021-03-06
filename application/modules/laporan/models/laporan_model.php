<?php 
class Laporan_model extends CI_Model {
    function __construct()
    {
        parent::__construct();
    }

	public function rekapitulasi($where='') ## COPY FUNGSI DARI PEK WISNU
	{
			/*$sql="SELECT c.id_departemen,sum(a.jumlah) FROM trs_payroll_detail as a LEFT JOIN  trs_payroll as b on a.id_payroll=b.id_payroll  LEFT JOIN mst_karyawan as c on b.id_karyawan=c.id_karyawan WHERE a.jenis='TUNJANGAN' GROUP BY c.id_departemen"*/
			
			if(is_array($where)){
				$keys=array_keys($where);
				foreach($keys as $key){
					if(!empty($where[$key]))
					$this->db->where($key,$where[$key]);		
				}
			}
			$this->db->select('d.nama_departemen');
			$this->db->select_sum('a.jumlah');
			$this->db->join('trs_payroll as b','a.id_payroll=b.id_payroll','LEFT');
			$this->db->join('mst_karyawan as c','b.id_karyawan=c.id_karyawan','LEFT');
			$this->db->join('mst_departemen as d','c.id_departemen=d.id_departemen','LEFT');
			
			
			$this->db->group_by('c.id_departemen');
			$query = $this->db->get('trs_payroll_detail as a');
			//echo $this->db->last_query().'<br>';

			if(!empty($where['c.id_departemen']))
			return $query->row_array();
				else
			return $query->result_array();
	}
	function rekap_by_departemen($bulan='',$tahun='',$nama_komponen_gaji=''){
	## GENERATE QUERY FOR REPORT
	$list_tunjangan= $this->db->query("SELECT nama_komponen_gaji FROM mst_komponen_gaji WHERE aktif='YA' and jenis in('TUNJANGAN','GAJI POKOK') ")->result_array();
	
	
	$sql="SELECT a.id_departemen,a.nama_departemen";
	foreach($list_tunjangan as $tunjangan){
		$sql.=",(SELECT sum(bb.jumlah) FROM trs_payroll as aa 
					LEFT JOIN trs_payroll_detail as bb on aa.id_payroll=bb.id_payroll
					LEFT JOIN mst_karyawan as cc on aa.id_karyawan=cc.id_karyawan
					LEFT JOIN mst_departemen as dd on cc.id_departemen=dd.id_departemen
					LEFT JOIN mst_komponen_gaji as ee on bb.id_komponen_gaji=ee.id_komponen_gaji
				WHERE bb.jenis='TUNJANGAN' and aa.bulan=8 and tahun='2014' and cc.id_departemen=a.id_departemen and 
				ee.nama_komponen_gaji='".$tunjangan['nama_komponen_gaji']."' ) as ".str_replace(array(' ','(',')'),'_',$tunjangan['nama_komponen_gaji']);
	}
		$sql.=" FROM mst_departemen as a";
		$result=$this->db->query($sql);
		$fields=$result->list_fields();
		print_r($fields);
	}
}