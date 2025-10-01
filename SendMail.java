package com.mobile.db;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class SendMail
{
	static String emailFrom="cloudkarad@gmail.com";
	static String emailUser="cloudkarad@gmail.com";
	static String emailFromPasswd="cloud123#$";
	public static void send(String emailID, String subj, String message) throws Exception
	{
		String host = "smtp.gmail.com", user = emailUser, pass = emailFromPasswd;
		String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		String to = emailID;
		String from = emailFrom;
		String subject = subj;
		String messageText = message;
		boolean sessionDebug = true;

		Properties props = System.getProperties();
		props.put("mail.host", host);
		props.put("mail.transport.protocol.", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.", "true");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.socketFactory.fallback", "false");
		props.put("mail.smtp.socketFactory.class", SSL_FACTORY);

		Session mailSession = Session.getDefaultInstance(props, null);
		mailSession.setDebug(sessionDebug);

		Message msg = new MimeMessage(mailSession);
		msg.setFrom(new InternetAddress(from));
		InternetAddress[] address = {new InternetAddress(to)};
		msg.setRecipients(Message.RecipientType.TO, address);
		msg.setSubject(subject);
		msg.setContent(messageText, "text/html");

		Transport transport = mailSession.getTransport("smtp");
		transport.connect(host, user, pass);

		try
		{
			transport.sendMessage(msg, msg.getAllRecipients());
		}
		catch (Exception e)
		{
			System.out.println("Error" + e.getMessage());
		}
		transport.close();
	}
	public static void main(String[] args) throws Exception {
		String s="TEST";
		send("cloudkarad@gmail.com","TESTING MAIL" , s);
	}
}