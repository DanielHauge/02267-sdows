
import basep.IStringCalculator;
import basep.StringCalculator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;
import org.testng.Assert;

import static org.junit.jupiter.api.Assertions.*;

class IStringCalculatorTest {

    // Software under Test
    private IStringCalculator SUD;

    @BeforeEach
    void setUp() {
        SUD = new StringCalculator();
    }

    /*@AfterEach
    void tearDown() {

    }*/

    @Test
    void emptyGivesZero() throws Exception {
        int result = SUD.Add("");
        Assertions.assertEquals(0, result);
    }

    @Test
    void SingleNumberWorks() throws Exception {
        int result = SUD.Add("1");
        Assertions.assertEquals(1, result);
    }

    @Test
    void TwoNumbersCanBeAdded() throws Exception {
        int result = SUD.Add("1,2");
        Assertions.assertEquals(3, result);
    }

    @Test
    void CanHandleUnknownAmountOfNumbers() throws Exception {
        int result = SUD.Add("1,1,1,1,1,1,1,1,1,1,500");
        Assertions.assertEquals(510, result);
    }

    @Test
    void NewlineAndComaCanBeUsedAsDelimiters() throws Exception {
        int result = SUD.Add("1\n2,3");
        Assertions.assertEquals(6, result);
    }

    @Test
    void CanSupportDifferentDelimiters() throws Exception {
        int result = SUD.Add("//;\n1;2");
        Assertions.assertEquals(3, result);
    }

    @Test
    void NegativeNumbersAreNotAllowed() {
        Throwable exception = assertThrows(Exception.class, new Executable() {
            @Override
            public void execute() throws Throwable {
                int result = SUD.Add("1,-2");
            }
        });

        Assert.assertEquals(exception.getMessage(), "negatives not allowed");
    }

}