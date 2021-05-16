using Behavior
using CoffeeMachine

@given("a machine without coffee") do context
    context[:machine] = Machine(coffee=0.0, milk=5.0)
end

@given("a machine without milk") do context
    context[:machine] = Machine(coffee=5.0, milk=0.0)
end

@then("the machine displays {String}") do context, message
    m = context[:machine]
    @expect readdisplay(m) == message
end