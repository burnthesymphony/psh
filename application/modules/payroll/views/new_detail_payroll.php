<style type="text/css">
	@media print {
    	footer {page-break-after: always;}
    	  body {
			margin: 0px;
			padding: 10px;
			background-color: #FAFAFA;
			font-size:10pt;
		}
		td{font-size:10pt;}
    .label{
    	width:200px;
    }
     .breakhere {page-break-before: always}
      @page {
        size: A4;
        margin: 5;
    }
		
	}		 
</style>
<?php 
$salary = $this->load->module('payroll/salary');

foreach($result_karyawan as $rec){
if(empty($thp)){
		$id_kar=$rec['id_karyawan'];
		$thp='';
		$thp= $this->global_model->get_thp($id_kar,$bulan_payroll,$tahun_payroll);
	}
	 $payroll			= $this->global_model->get_data(array('table'=>'trs_payroll',
																		'where'=>array('id_karyawan'=>$rec['id_karyawan'],
																						'bulan'=>$bulan_payroll,
																						 'tahun'=>$tahun_payroll
																						),
																		'data'=>'row'
																	)
																);
	print_slip($thp,$rec,$bulan_payroll,$tahun_payroll,$payroll,$salary);
	if($_GET['is_printed']=='yes'){
		echo '<table width="100%" cellpadding=0 cellspacing=0><tr><td align="center" style="border-bottom:1px #000 dashed;font-size:9px"><b>Gunting disini</b></td></tr></table><br>';
		 print_slip($thp,$rec,$bulan_payroll,$tahun_payroll,$payroll,$salary);
		 echo '<div class="breakhere">&nbsp;</div>';
	}
	
	 
	unset($thp);
}

function print_slip($thp,$rec,$bulan_payroll,$tahun_payroll,$payroll,$salary){?>
<table width="100%" cellspacing=0 cellpadding=0 >
	<thead>
		<tr class="danger" >
			<td rowspan="2" align="center" <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>><img src="<?php echo base_url('assets/images/psh-small.png')?>"></td>
			<td align="center"  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>>PADJADJARAN SUITE HOTEL</td>
			<td align="center"  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>>Department</td>
		</tr>
		<tr>
		<td align="center"  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>>PAYSLIP</td>
		<td align="center"  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>><?php echo $rec['nama_departemen']?></td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td colspan=3>
						<table  width="100%" cellspacing=0 cellpadding=0>
							<tr>
								<td  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>Payment By : <?php echo $payroll['jenis_pengiriman']?></td>
								<td  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>>Period : <?php echo bulan(str_pad($bulan_payroll,2, "0", STR_PAD_LEFT)).'&nbsp; '.$tahun_payroll?></td>
								
							</tr>
							<tr>
								<td  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>>Name</td>
								<td  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>><b><?php echo $rec['nama_karyawan']?>(<?php echo $rec['nik']?>)</b></td>
							</tr>
							<tr>
								<td  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>>Position</td>
								<td  <?php if (isset($_GET['is_printed'])) echo 'style="border:1px #000 solid"'?>><b><?php echo strtoupper($rec['nama_jabatan'])?></b></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan=3>
						<table class="table table-condensed" width="100%">
			<tr>
				<td>Earnings</td>
				<td>Deduction</td>
			</tr>
			<tr>
				<td><?php $salary::get_salary('TUNJANGAN',$rec['id_karyawan'],$bulan_payroll,$tahun_payroll);?></td>
				<td><?php $salary::get_salary('POTONGAN',$rec['id_karyawan'],$bulan_payroll,$tahun_payroll);?></td>
			</tr>
			<?php $absensi= $salary::get_absensi($bulan_payroll,$tahun_payroll,$rec['id_karyawan'])?>
			<tr class="danger">
			<td>
				<table width="100%">
					<tr>
					<td>Total Take Home Pay</td>
					<td colspan="2" align="right"><b><?php echo number_format($thp) ?></b></td>
					
					</tr>
				</table>
			</td><td >&nbsp;</td></tr>
			<tr><td colspan=4 text-align="center" class="danger"><b><i>(<?php echo  ucwords(terbilang($thp)).' Rupiah'?> )</i></b></td></tr>
			<?php if(!empty($absensi['jumlah_hari_masuk'])){?>
			<tr class="danger"><td>Jumlah Hari Kerja (hari) : <?php echo $absensi['jumlah_hari_masuk'] ?> </td><td>Jumlah Lembur (hari): <?php echo $absensi['jumlah_lembur'] ?></td></tr>
			<?php } ?>
			<tr class="danger"><td colspan=2 style="border-bottom:1px #000 solid" >Catatan : Service sudah diterima pada tanggal 15 <?php echo bulan(str_pad($bulan_payroll,2, "0", STR_PAD_LEFT)).'&nbsp; '.$tahun_payroll?></td></tr>
			<?php if((!isset($_GET['is_printed']))&&(!isset($all_print))) {?>
			<tr><td colspan="4"><a href="<?php echo base_url('payroll/salary/detail_payroll/?id_karyawan='.$rec['id_karyawan'].'&bulan='.$bulan_payroll.'&tahun='.$tahun_payroll.'&thp='.$thp.'&is_printed=yes') ?>" target="_blank" class="btn btn-primary">Cetak Slip Gaji</a></td></tr>
			<?php } 
			else{
			?>
			<script>
				window.print();
			</script>
			<?php }?>
		</table>
			</td>
		</tr>
		<?php if(isset($_GET['is_printed'])) {?>
			<tr>
				<td align="center">
					<table width="80%" cellpadding=0 cellspacing=0>
						<tr>
							<td>
								<table>
									<tr><td>Receiver<br><br><br></td></tr>
									<tr><td style="border-bottom:1px #000 solid"><?php echo $rec['nama_karyawan']?></td></tr>
									<tr><td >Employee</td></tr>
								</table>
							</td>
							<td></td>
							<td></td>
						</tr>
					
					</table>
				</td>
				<td align="center"><img align="center" src="<?php echo base_url('assets/images/psh-logo.png')?>" width="180px"></td>
				<td align="center" >
					<table width="80%" cellpadding=0 cellspacing=0>
						<tr>
							<td>
								<table>
									<tr><td>Bogor,<?php echo date('d').' '. bulan(str_pad($bulan_payroll,2, "0", STR_PAD_LEFT)).'&nbsp; '.$tahun_payroll?><br><br><br></td></tr>
									<tr><td style="border-bottom:1px #000 solid"><?php echo "Didik Soepardi"?></td></tr>
									<tr><td >Human Capital Manager</td></tr>
								</table>
							</td>
							<td></td>
							<td></td>
						</tr>
					
					</table>
				</td>
			</tr>
			<?php }?>
	</tbody>
</table>

<?php } ?>