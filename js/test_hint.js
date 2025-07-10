function checkLimitAnswer() {
    let limitFunction = $("#limitFunction").val();   // Get the function input
    let limitPoint = parseFloat($("#limitPoint").val());  // Get the point to approach
    let userAnswer = $("#userLimitAnswer").val();    // Get the user's answer

    try {
        // Calculate the correct limit using math.js
        let correctLimit = math.evaluate(`limit(${limitFunction}, x, ${limitPoint})`);

        // Compare the student's answer to the correct limit
        if (math.simplify(userAnswer).toString() === math.simplify(correctLimit).toString()) {
            $("#limitResult").html("✅ Correct! Well done!").css("color", "green");
            $("#limitExplanation").html(`Your answer is correct because when x approaches ${limitPoint}, 
            the function simplifies to ${correctLimit}. This means the limit exists and equals ${correctLimit}.`);
            $("#limitHint").html("");
        } else {
            $("#limitResult").html("❌ Incorrect. Try again!").css("color", "red");
            $("#limitExplanation").html(`Your answer is incorrect because the correct limit is ${correctLimit}. 
            Let's review the function behavior near x = ${limitPoint}.`);
            $("#limitHint").html(generateLimitHint(limitFunction, limitPoint));
        }
    } catch (error) {
        $("#limitResult").html("⚠️ Invalid input! Please enter a valid function.").css("color", "orange");
        $("#limitExplanation").html("");
        $("#limitHint").html("");
    }
}

// Hint generator to help students solve the limit problem
function generateLimitHint(expression, point) {
    if (expression.includes(`(x - ${point})`)) {
        return "Hint: Try simplifying the expression. You might be able to cancel out terms.";
    } else if (expression.includes("1/(x - " + point + ")")) {
        return "Hint: Does the function approach infinity? Consider limits involving division by zero.";
    } else if (expression.includes("sin(x)/x")) {
        return "Hint: Remember that lim(x→0) sin(x)/x = 1.";
    } else {
        return "Hint: Substitute values closer to the limit point to estimate the limit.";
    }
}
