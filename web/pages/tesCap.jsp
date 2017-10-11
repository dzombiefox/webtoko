<%@page import="net.tanesha.recaptcha.ReCaptchaResponse"%>
<%@page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%
ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
reCaptcha.setPrivateKey("6LdlHOsSAAAAACe2WYaGCjU2sc95EZqCI9wLcLXY");
String remoteip = request.getParameter("remoteip");
String challenge = request.getParameter("challenge");
String res = request.getParameter("response");
ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteip, challenge, res);
if (reCaptchaResponse.isValid()) {
out.print("1");
} else {
out.print("0");
}

%>