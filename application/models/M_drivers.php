<?php
class m_drivers extends CI_Model { 
    function drivers_add($drivers_name,$drivers_address,$drivers_mobile,$username,$password,$join_date){ 
	    $this->db->select("*");
	    $this->db->from('users');
	    $this->db->where(array( 'username' => $username));
	    $query = $this->db->get();
	    if($query->num_rows() == 0){
	        $target = array(
	            "username" => $username,
	            "password" => $password,
	            "school_id"=>  $this->session->userdata['school'],
	            "role"=>  'driver',
                "created_date"=>date('Y-m-d'),
                "created_by"=>$this->session->userdata['id'], 
	        );
	        $this->db->insert('users', $target);
	        
	        $this->db->select("*");
	        $this->db->from('users');
	        $this->db->where(array( 'username' => $username));
	        $query = $this->db->get();
	        if($query->num_rows() == 1){
	            $userData = $query->result(); 
	            
	            $this->db->select("*"); 
        		$this->db->from('drivers'); 
        		$this->db->where(array( 'drivers_name' => $drivers_name));
        		$query = $this->db->get(); 
        		if($query->num_rows() == 0){
        		    $target = array(
        		        "users_id" => $userData[0]->id ,
        				"drivers_name"=>$drivers_name,
        				"drivers_address"=>$drivers_address,
        				"drivers_mobile"=>$drivers_mobile,
        		        "join_date"=>$join_date,
        		        "created_date"=>date('Y-m-d'),
        		        "created_by"=>$this->session->userdata['id'], 
        				);   
        			$query = $this->db->insert('drivers', $target);
        			
        			if($query){ return true;  }else{ return false; };
        		}	
	        }
	    }  
    }
    function drivers_edit($id,$user_id,$drivers_name,$drivers_address,$drivers_mobile,$username,$password,$join_date){ 
        
        $this->db->select("*");
        $this->db->from('drivers');
        $this->db->where(array( 'drivers_name' => $drivers_name));
        $this->db->where('id!=', $id);
        $query = $this->db->get();
        if($query->num_rows() == 0){ 
            $target = array(  	 
			"drivers_name"=>$drivers_name,
			"drivers_address"=>$drivers_address,
			"drivers_mobile"=>$drivers_mobile,
            "join_date"=>$join_date,
            "updated_date"=>date('Y-m-d'),
            "updated_by"=>$this->session->userdata['id'],
			);   
	   
    	   $this->db->select("*");
    	   $this->db->from('users');
    	   $this->db->where(array( 'id' => $user_id));
    	   $query = $this->db->get();
    	   if($query->num_rows() == 1){
    	       $target1 = array(
    	           "username" => $username,
    	           "password" => $password,
    	           "updated_date"=>date('Y-m-d'),
    	           "updated_by"=>$this->session->userdata['id'],
    	       );
    	       $this->db->where(array( 'id' => $user_id));
    	       $this->db->update('users', $target1);
    	   }  
    	   
    	   
    	    $this->db->where(array( 'id' => $id));
    	    $query = $this->db->update('drivers', $target);
    	    if($query){ return true;  }else{ return false; }
        }
    }
    function drivers_show(){ 
	    $this->db->select("b.*,u.username,u.password"); 
	    $this->db->from('drivers b');
	    $this->db->join('users u', 'b.users_id=u.id', 'left');
	    $this->db->where(array( 'u.school_id' => $this->session->userdata['school']));
		$query = $this->db->get(); 
		if($query)
	    {
	        return $query->result();
	    } 
    } 
    function drivers_delete($id){ 
		$this->db->where(array( 'id' =>$id));
		$query = $this->db->delete('drivers');
		if($query)
	    {
	        return true;
	    } 
    } 

    function drivers_show_id(){ 
	    $this->db->select("*"); 
		$this->db->from('drivers'); 
	    $this->db->where(array( 'school_id' => $this->session->userdata['school']));
		$query = $this->db->get(); 
		if($query)
	    {
	        return $query->result();
	    } 
    }


     function drivers_fetch($bus_id){ 
	    $this->db->select("*"); 
		$this->db->from('drivers'); 
	    $this->db->where(array( 'bus_id' => $bus_id ));
		$query = $this->db->get(); 
		if($query)
	    {
	        return $query->result();
	    } 
    } 
    
    
    
    public function importData($data) {
        $duplicate = '';
//         print_r($data);exit();
        foreach($data as $row){
            $this->db->select("*");
            $this->db->from('users');
            $this->db->where(array( 'username' => $row['username']));
            $query = $this->db->get();
            if($query->num_rows() == 0){
                $target = array(
                    "username" => $row['username'],
                    "password" => $row['password'],
                    "school_id"=>  $this->session->userdata['school'],
                    "role"=>  'driver',
                    "created_date"=>date('Y-m-d'),
                    "created_by"=>$this->session->userdata['id'],
                );
                $this->db->insert('users', $target);
                
                $this->db->select("*");
                $this->db->from('users');
                $this->db->where(array( 'username' => $row['username']));
                $query = $this->db->get();
                if($query->num_rows() == 1){
                    $userData = $query->result();
                    $this->db->select("*");
                    $this->db->from('drivers');
                    $this->db->where(array( 'drivers_name' => $row['drivers_name'])); 
                    $query = $this->db->get();
                    if($query->num_rows() == 0){
                        $target = array(
                            "users_id" => $userData[0]->id ,
                            "drivers_name"=>$row['drivers_name'],
                            "drivers_address"=>$row['drivers_address'],
                            "drivers_mobile"=>$row['drivers_mobile'],
                            "join_date"=>$row['join_date'], 
                            "created_date"=>date('Y-m-d'),
                            "created_by"=>$this->session->userdata['id'],
                        );
                        $res =  $this->db->insert('drivers', $target); 
                        
                    }
                }
            }else{
                $duplicate[] = $row['username'];
                
            }
        }
        
        return $duplicate;
        
    }
    
    
    
    function drivers_show_user_app($id){
        
        $this->db->select('t.*,b.bus_number');
        $this->db->from('drivers t');
        $this->db->join('bus b', 'b.drivers_id=t.id', 'left');
        $this->db->where(array( 't.users_id' => $id));
        $query = $this->db->get();
        
        if($query)
        {
            return $query->result();
        }
    }
    
    
}
?>