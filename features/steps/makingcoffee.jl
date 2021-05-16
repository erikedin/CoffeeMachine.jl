using Behavior
using CoffeeMachine

@given("a machine filled with coffee beans") do context
    context[:machine] = Machine(coffee=5.0)
end

@when("a user makes a cup of coffee") do context
    m = context[:machine]
    cup = makecoffee!(m)
    context[:cup] = cup
end

@then("the cup contains coffee") do context
    cup = context[:cup]

    @expect cup.coffee > 0.0
end

@given("that the machine also has milk") do context
    m = context[:machine]
    fillwith!(m, milk=5.0)
end

@when("a user makes a cup of coffee with milk") do context
    m = context[:machine]
    cup = makecoffee!(m, withmilk=true)
    context[:cup] = cup
end

@then("the cup contains milk") do context
    cup = context[:cup]

    @expect cup.milk > 0.0
end