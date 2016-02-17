<div class="full-content">
    <div class="row-fluid">
       <div class="span8 offset2">
       	<h3>Backup Settings</h3>
       </div>
    </div>
    <div class="row-fluid">
       <div class="span8 offset2">
        <?php echo $this -> session -> flashdata('error_message');?>
        <form id="backup_frm" action="<?php echo base_url().'backup/last_back_up'; ?>" method="POST">
			<div class="form-group">
			    <button type="submit" id="backup_btn" class="btn btn-primary">Run Backup</button>
			</div>
        </form>
		</div>
	</div>
</div>

<script type="text/javascript">
  $(document).ready(function(){ 
  	$("#backup_frm").on('submit',function(){
  		//disable button when submitted
        $("#backup_btn").attr("disabled",true);
  	});
  });
</script>

