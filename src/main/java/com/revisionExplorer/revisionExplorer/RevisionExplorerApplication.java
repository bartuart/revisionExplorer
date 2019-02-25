package com.revisionExplorer.revisionExplorer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SpringBootApplication
public class RevisionExplorerApplication {

	public static void main(String[] args) {
		SpringApplication.run(RevisionExplorerApplication.class, args);
	}

	@RequestMapping("/success")
	public String showHelloWorld(){
		return "hello-world";
	}

}
