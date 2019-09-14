var save_method, table;

//Menampilkan data dengan plugin datatables
$(function(){
   table = $('.table').DataTable({
      "processing" : true,
      "ajax" : {
         "url" : "ajax/ajax_departemen.php?action=table_data",
         "type" : "POST"
      }
   });
});



//Ketika tombol tambah diklik
function form_add(){
   save_method = "add";
   $('#modal_departemen').modal('show');
   $('#modal_departemen form')[0].reset();
   $('.modal-title').text('Tambah Departemen');
}
	
//Ketika tombol edit diklik
function form_edit(id){
   save_method = "edit";
   $('#modal_departemen form')[0].reset();
   $.ajax({
      url : "ajax/ajax_departemen.php?action=form_data&id="+id,
      type : "GET",
      dataType : "JSON",
      success : function(data){
         $('#modal_departemen').modal('show');
         $('.modal-title').text('Edit Departemen');
			
         $('#id').val(data.id_departemen);
         $('#nama_departemen').val(data.nama_departemen);
      },
      error : function(){
         alert("Tidak dapat menampilkan data!");
      }
   });
}

//Ketika tombol simpan diklik
function save_data(){
   if(save_method == "add") url = "ajax/ajax_departemen.php?action=insert";
   else url = "ajax/ajax_departemen.php?action=update";
   
   $.ajax({
      url : url,
      type : "POST",
      data : $('#modal_departemen form').serialize(),
      success : function(data){
         $('#modal_departemen').modal('hide');
         table.ajax.reload();
      },
      error : function(){
      alert("Tidak dapat menyimpan data!");
		}			
   });
   return false;
}
	
//Ketika tombol hapus diklik
function delete_data(id){
   if(confirm("Apakah yakin data akan dihapus?")){
      $.ajax({
         url : "ajax/ajax_departemen.php?action=delete&id="+id,
         type : "GET",
         success : function(data){
            table.ajax.reload();
         },
         error : function(){
           alert("Tidak dapat menghapus data!");
         }
      });
   }
}