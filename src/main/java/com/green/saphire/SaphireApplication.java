package com.green.saphire;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.green.saphire.app.controllers"})
public class SaphireApplication {

	public static void main(String[] args) {
		SpringApplication.run(SaphireApplication.class, args);
	}

}
