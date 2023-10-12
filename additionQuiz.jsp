<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Random Addition Quiz</title>
</head>
<body>
    <h1>Welcome to the Random Addition Quiz</h1>

    <form action="additionQuiz.jsp" method="post">
        <%
            // Generate two random numbers for the addition question
            int num1 = (int) (Math.random() * 10);
            int num2 = (int) (Math.random() * 10);
            int correctAnswer = num1 + num2;
            
            // Store the correct answer in the session for validation later
            session.setAttribute("correctAnswer", correctAnswer);
        %>
        <p>What is <%= num1 %> + <%= num2 %>?</p>
        <input type="text" name="userAnswer" />
        <input type="submit" value="Submit Answer" />
    </form>

    <%
        // Check if the user has submitted an answer
        String userAnswerStr = request.getParameter("userAnswer");
        if (userAnswerStr != null) {
            int userAnswer = Integer.parseInt(userAnswerStr);
            int correctAnswer = (int) session.getAttribute("correctAnswer");

            // Display the user's answer and whether it's correct
            out.print("<p>Your Answer: " + userAnswer + "</p>");
            out.print("<p>Correct Answer: " + correctAnswer + "</p>");

            if (userAnswer == correctAnswer) {
                out.print("<p style='color: green;'>Correct! Well done!</p>");
            } else {
                out.print("<p style='color: red;'>Sorry, that's incorrect. Try again.</p>");
            }
        }
    %>

</body>
</html>
