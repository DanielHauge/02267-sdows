package calc;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

public class StringCalculatorStepDefs {
    private String input;
    private int result;
    private Exception ex;
    private IStringCalculator SUD = new StringCalculator();

    @Given("the input is {string}")
    public void theInputIs(String arg){
        input = arg.replace("\\n", "\n");
    }

    @When("add is called")
    public void addIsCalled(){
        try {
            result = SUD.Add(input);
        } catch (Exception e){
            ex = e;
        }
    }

    @Then("the result is {int}")
    public void theResultIs(int arg){
        Assert.assertEquals(result, arg);
    }

    @When("calling add")
    public void callingAdd() {
        try {
            SUD.Add(input);
        } catch (Exception e){
            ex = e;
        }
    }

    @Then("an error with message {string} is thrown")
    public void anErrorWithMessageIsThrown(String arg0) {
        Assert.assertEquals("negatives not allowed", arg0);
    }
}
