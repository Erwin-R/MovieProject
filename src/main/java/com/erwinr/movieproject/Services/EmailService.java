package com.erwinr.movieproject.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender emailSender;
	
	public EmailService(JavaMailSender emailSender) {
		this.emailSender = emailSender;
	}
	
	public void sendMessage(String to, String subject, String text) {
		SimpleMailMessage sendMessage = new SimpleMailMessage();
		sendMessage.setFrom("eloyschoolstuff@gmail.com");
		sendMessage.setTo(to);
		sendMessage.setSubject(subject);
		sendMessage.setText(text);
		emailSender.send(sendMessage);
	}

	public void recieveMessage(String subject, String text) {
		SimpleMailMessage recieveMessage = new SimpleMailMessage();
		recieveMessage.setFrom("eloyschoolstuff@gmail.com");
		recieveMessage.setTo("eloyjvigil@hotmail.com");
		recieveMessage.setSubject(subject);
		recieveMessage.setText(text);
		emailSender.send(recieveMessage);
	}
	
}