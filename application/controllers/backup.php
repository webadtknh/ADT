<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
ini_set("memory_limit",-1);
/**
 * Created by PhpStorm.
 * User: kwoshvick
 * Date: 12/01/16
 * Time: 10:37
 */


class backup extends MY_Controller{

    function __construct() {
        parent::__construct();
        date_default_timezone_set('Africa/Nairobi');
    }

    public function index() {
        $data['content_view'] = 'backup_v';
        $data['banner_text'] = "Database Backup";
        $data['hide_side_menu'] = 1;
        $data['actual_page'] = 'Database Backup';
        $this -> base_params($data);
    }

    public function base_params($data) {
        $data['title'] = "webADT | Data Backup";
        $data['link'] = "backup_management";
        $this -> load -> view('template', $data);
    }


    public function backup_data()
    {
        //paremeters
        $prefs = array(
            'tables'      => array('dose'),  // Array of tables to backup.
            'ignore'      => array(),           // List of tables to omit from the backup
            'format'      => 'txt',             // gzip, zip, txt
            'filename'    => 'mybackup.sql',    // File name - NEEDED ONLY WITH ZIP FILES
            'add_drop'    => TRUE,              // Whether to add DROP TABLE statements to backup file
            'add_insert'  => TRUE,              // Whether to add INSERT data to backup file
            'newline'     => "\n"               // Newline character used in backup file
        );
        // Load the DB utility class
        $this->load->dbutil();
        //call start backup
        $id = $this->start_backup();
        // Backup your entire database and assign it to a variable
        $backup =& $this->dbutil->backup($prefs);

        // Load the file helper and write the file to your server
        $this->load->helper('file');
        $ext = date('Y-m-d H:i:s',time());
        $db =$ext.'.sql';
        write_file('./backup/'.$db, $backup);

        //call end backup
        $this->end_backup($id,$db);
        $this->remote_backup();

       // $filepath = './pagemodules/'.str_replace('/','.',$data['page']->url).'.mod';
        $error_message = "<div class='alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Backup!</strong> Local  and Server Database Backup Successful</div>";
        $this -> session -> set_flashdata('error_message', $error_message);
        redirect("backup_management");
        die();

        // Load the download helper and send the file to your desktop
        //$this->load->helper('download');
        //force_download('mybackup.sql', $backup);

    }


    public function start_backup(){

        $data = array(
            'is_complete' => 0
        );

        $this->db->insert('backup', $data);
        $id = $this->db->insert_id();

        return $id;
    }


    public function end_backup($id,$db){

        $data = array(
            'dbname' => $db,
            'end_time' => date('Y-m-d H:i:s',time()),
            'is_complete' => 1
        );
        $this->db->update('backup', $data, "id = $id");

    }

    //checks last time back up
     public function last_back_up(){
         //mysql_query()
         $query = $this->db->query("SELECT * FROM backup ORDER BY id DESC LIMIT 1")->row_array();

         $date = $query['end_time'];

         $new_time = strtotime($date) + 24*60*60;


         //echo 'ile ya kitambo ',$date;

         //echo '<br>';
         //echo 'ya sasa kama time ',time();
         $kesho=$new_time;

         //echo '<br>';
         //echo 'ya kesho ',$kesho;
         //echo '<br>';
         //echo date('Y-m-d H:i:s',$kesho);

         //die();



         if($kesho < time()) {
             echo 'more';

             $this->backup_data();

         }else{
             $error_message = "<div class='alert-success'><button type='button' class='close' data-dismiss='alert'>&times;</button><strong>Backup!</strong> Back up can only take place after 24 hours</div>";
             $this -> session -> set_flashdata('error_message', $error_message);
             redirect("backup_management");

         }


     }

    //remote backup

    public function remote_backup(){
        $ftp_username = 'project@wkdesigns.co.ke';
        $ftp_userpass = 'QWErty123!@';

        $query = $this->db->query("SELECT * FROM backup ORDER BY id DESC LIMIT 1")->row_array();

        $dbname = $query['dbname'];


        // connect and login to FTP server
        $ftp_server = "ftp.wkdesigns.co.ke";
        $ftp_conn = ftp_connect($ftp_server) or die("Could not connect to $ftp_server");
        $login = ftp_login($ftp_conn, $ftp_username, $ftp_userpass);

        $file = "./backup/$dbname";

        // upload file
        if (ftp_put($ftp_conn, "$dbname", $file, FTP_ASCII))
        {
            echo "Successfully uploaded $file.";
        }
        else
        {
            echo "Error uploading $file.";
        }

        // close connection
        ftp_close($ftp_conn);
    }

    public function test(){
        die();
    }




}