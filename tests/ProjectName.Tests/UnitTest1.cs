namespace ProjectName.Tests;

/// <summary>
/// Example test class demonstrating TDD approach.
/// Tests should follow naming convention: MethodName_Scenario_ExpectedResult
/// </summary>
public class CalculatorTests
{
    [Fact]
    public void Add_TwoPositiveNumbers_ReturnsSum()
    {
        // Arrange
        var calculator = new Calculator();

        // Act
        var result = calculator.Add(2, 3);

        // Assert
        Assert.Equal(5, result);
    }

    [Fact]
    public void Add_PositiveAndNegativeNumber_ReturnsCorrectResult()
    {
        // Arrange
        var calculator = new Calculator();

        // Act
        var result = calculator.Add(5, -3);

        // Assert
        Assert.Equal(2, result);
    }

    [Fact]
    public void Subtract_TwoPositiveNumbers_ReturnsDifference()
    {
        // Arrange
        var calculator = new Calculator();

        // Act
        var result = calculator.Subtract(5, 3);

        // Assert
        Assert.Equal(2, result);
    }

    [Theory]
    [InlineData(0, 0, 0)]
    [InlineData(5, 5, 10)]
    [InlineData(-5, -5, -10)]
    [InlineData(100, 50, 150)]
    public void Add_VariousInputs_ReturnsExpectedSum(int a, int b, int expected)
    {
        // Arrange
        var calculator = new Calculator();

        // Act
        var result = calculator.Add(a, b);

        // Assert
        Assert.Equal(expected, result);
    }
}

