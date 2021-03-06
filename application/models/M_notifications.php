<?php
class m_notifications extends CI_Model { 
    function notifications_add($role_id,$class_id,$sections_id,$students_id,$title,$message,$datetime,$school_id){ 
//         $this->db->select("*");
//         $this->db->from('notification');
//         $this->db->where(array(  "roles_id" => $role_id ));
//         $this->db->where(array( "message" => $message ));
//         $this->db->where(array( "school_id" => $school_id )); 
        
//         $query = $this->db->get();
//         if($query->num_rows() == 0){
            if($role_id != 'Section'){
                $class_id = '';
                $sections_id= '';
            }
    	 
    	    $target = array(  	
    	        "roles_id" => $role_id,
    	        "class_id" => $class_id,
    	        "sections_id" => $sections_id,
    	        "students_id" => $students_id,
    	        "title" => $title, 
    	        "message" => $message,
    	        "datetime" => $datetime, 
    	        "school_id" => $school_id,
    	        "created_date"=>date('Y-m-d'),
    	        "created_by"=>$this->session->userdata['id'], 
    			);   
    		$this->db->insert('notification', $target);
    		return true;
//         }
    }
    function notifications_edit($id,$role_id,$class_id,$sections_id,$students_id,$title,$message,$datetime,$school_id){ 
        $this->db->select("*");
        $this->db->from('notification');
        $this->db->where(array(  "roles_id" => $role_id ));
        $this->db->where(array( "message" => $message ));
        $this->db->where(array( "school_id" => $school_id ));
        $this->db->where('id!=', $id);
        
        $query = $this->db->get();
        if($query->num_rows() == 0){
            if($role_id != 'Section'){
                $class_id = '';
                $sections_id= '';
            }
            
            $target = array(
                "roles_id" => $role_id,
                "class_id" => $class_id,
                "sections_id" => $sections_id,
                "students_id" => $students_id,
                "title" => $title, 
                "message" => $message,
                "datetime" => $datetime,
                "school_id" => $school_id,
                "updated_date"=>date('Y-m-d'),
                "updated_by"=>$this->session->userdata['id'],
            );   
    	    $this->db->where(array( 'id' => $id));
    		$this->db->update('notification', $target);
    		return true; 
        }
    }
    function notifications_show(){  
		$this->db->select('f.*,c.class,sec.sections,s.student_name');
		$this->db->from('notification f');
		$this->db->join('students s', 'f.students_id=s.id', 'left');
		$this->db->join('class c', 'f.class_id=c.id', 'left');
		$this->db->join('sections sec', 'f.sections_id=sec.id', 'left');
		$this->db->where(array( 'f.school_id' => $this->session->userdata['school']));
		
		$query = $this->db->get(); 
		
		if($query)
	    {
	        return $query->result();
	    } 
    } 
    function notifications_delete($id){ 
		$this->db->where(array( 'id' =>$id));
		$query = $this->db->delete('notification');
		if($query)
	    {
	        return true;
	    } 
    } 
    
    
    
    function notifications_class_sel($class_id,$section_id){
        $this->db->select('s.student_name,s.roll_number,f.*,c.class,sec.sections');
        $this->db->from('notification f');
        $this->db->join('students s', 'f.students_id=s.id', 'left');
        $this->db->join('class c', 'f.class_id=c.id', 'left');
        $this->db->join('sections sec', 'f.sections_id=sec.id', 'left');
        $this->db->where(array( 'f.school_id' => $this->session->userdata['school'])); 
        
        if($class_id != '0'){
            $this->db->where(array( 'f.class_id' => $class_id ));
        }
        if($section_id != '0'){
            $this->db->where(array( 'sec.sections' => $section_id ));
        }
        $query = $this->db->get();
        
        if($query)
        {
            return $query->result();
        }
    } 
    
    
    //APp functions
    
    
    function notifications_show_app($token,$class_id,$sections_id){
        
        $this->db->select('n.message,n.datetime,s.school_name,u.school_id');
        $this->db->from('notification n');
        $this->db->join('students stud', 'n.class_id=stud.class_id', 'left');
        $this->db->join('users u', 'stud.users_id=u.id', 'left');
        $this->db->join('school s', 'u.school_id=s.id', 'left');
        $this->db->where(array( 'u.token' =>$token)); 
        $this->db->or_where(array( 'n.sections_id' =>$sections_id));
        $this->db->or_where(array( 'n.roles_id' =>'Student')); 
        
        $this->db->distinct();
        
        
        $query = $this->db->get();
        
        if($query)
        {
            return $query->result();
        }
    } 
    
    
    function notifications_show_id_app($token,$user_id){
        
        $this->db->select('n.*,s.school_name,u.school_id');
        $this->db->from('notification n');
        $this->db->join('students stud', 'n.class_id=stud.class_id', 'left');
        $this->db->join('users u', 'stud.users_id=u.id', 'left');
        $this->db->join('school s', 'u.school_id=s.id', 'left');
        $this->db->where(array( 'u.token' =>$token));
        $this->db->where(array( 'u.id' =>$user_id));
        
        $query = $this->db->get();
        
        if($query)
        {
            return $query->result();
        }
    } 
    
    
 
}
?>