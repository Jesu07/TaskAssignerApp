package com.project;

import java.io.File;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.project.config.ResourceConfig;

@SpringBootApplication
public class TaskAssignerAppApplication {

	public static void main(String[] args) {
		new File(ResourceConfig.uploadDirectory).mkdir();
		SpringApplication.run(TaskAssignerAppApplication.class, args);
	}

}