package com.projecttodo.ToDo_App.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.projecttodo.ToDo_App.model.ToDo;
import com.projecttodo.ToDo_App.service.ToDoService;



@Controller
public class ToDoController {
	
	@Autowired
	private ToDoService service;
	
	@GetMapping({"/", "/viewToDoList"})
	public String viewAllToDoItems(Model model, @ModelAttribute("message") String message) {
	    model.addAttribute("list", service.getAllToDoItems());
	    model.addAttribute("msg", message);
		
		return "ViewToDoList";
	}
	
	
	
	@PostMapping("/updateToDoStatus/{id}")
    public String updateToDoStatus(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		if(service.updateStatus(id)) {
			redirectAttributes.addFlashAttribute("message", "Update Sucessfull.....");
			return "redirect:/ViewToDoList";
		}
		redirectAttributes.addFlashAttribute("message", "Update Failed!!!");
		return "redirect:/ViewToDoList";
	}
    
	
	
    @GetMapping("/addToDoItem")
    public String addToDoItem(Model model) {
    	model.addAttribute("todo",new ToDo());
    	return "AddToDoItem";
    }
    
    
    
    @PostMapping("/saveToDoItem")
    public String saveToDoItem(ToDo todo,RedirectAttributes redirectAttributes) {
    	if(service.saveOrUpdateToDoItem(todo)) {
    		redirectAttributes.addFlashAttribute("message", "save todo item is sucessfull.....");
    		return "redirect:/ViewToDoList";
    	}
    	redirectAttributes.addFlashAttribute("message", "save todo item is failed!!!");
    	return "redirect:/addToDoItem";
    }
    
    
    
    @GetMapping("/editToDoItem/{id}")
    public String editToDoItem(@PathVariable Long id,Model model) {
    	model.addAttribute("todo",service.getToDoItemById(id));
    	return "EditToDoItem";
    }
    
    
    
    @PostMapping("/editSaveToDoItem")
    public String editSaveToDoItem(ToDo todo,RedirectAttributes redirectAttributes) {
    	if(service.saveOrUpdateToDoItem(todo )) {
			redirectAttributes.addFlashAttribute("message", "Edit Sucessfull.....");
			return "redirect:/ViewToDoList";
		}
		redirectAttributes.addFlashAttribute("message", "Edit Failed!!!");
		return "redirect:/editToDoItem/"+todo.getId();
    }
    
    
    
    @GetMapping("/deleteToDoItem/{id}")
    public String deleteToDoItem(@PathVariable Long id,RedirectAttributes redirectAttributes) {
    	if(service.deleteToDoItem(id)) {
    		redirectAttributes.addFlashAttribute("message", "Deleted the Item Sucessfully.....");
    	}
    	redirectAttributes.addFlashAttribute("message", "Deletion of Item Failed.....");
    	return "redirect:/ViewToDoList";
    }
}
