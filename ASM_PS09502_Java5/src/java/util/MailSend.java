/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import entity.Record;
import entity.Staff;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;

/**
 *
 * @author admin
 */
@Controller
public class MailSend {

    @Autowired
    public JavaMailSender emailSender;

    public void sendEmail(Staff staff, Record record) throws MessagingException {
        MimeMessage message = emailSender.createMimeMessage();

        boolean multipart = true;

        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");

        String htmlMsg = "<h3>Dear </h3>" + staff.getName()
                + "You are <b>"
                + (record.getType() ? "rewarded" : "reminded")
                + "</b> because " + record.getNote() + "<br />"
                + "On date: " + record.getDate().toString();

        message.setContent(htmlMsg, "text/html");

        helper.setTo(staff.getEmail());

        helper.setSubject("Test send HTML email");

        this.emailSender.send(message);
    }
}
