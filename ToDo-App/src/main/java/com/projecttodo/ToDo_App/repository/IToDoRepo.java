package com.projecttodo.ToDo_App.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.projecttodo.ToDo_App.model.ToDo;


@Repository
public interface IToDoRepo extends JpaRepository<ToDo,Long>{

}
