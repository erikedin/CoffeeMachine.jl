module CoffeeMachine

export Machine, Cup, makecoffee!, fillwith!, readdisplay

mutable struct Machine
    coffee::Float64
    milk::Float64
    message::String

    Machine(; coffee=0.0, milk=0.0) = new(coffee, milk, "")
end

struct Cup
    coffee::Float64
    milk::Float64
end

function fillwith!(m::Machine; coffee=0.0, milk=0.0)
    m.coffee += coffee
    m.milk += milk
end

function makecoffee!(m::Machine; withmilk=false) :: Union{Cup, Nothing}
    if m.coffee <= 0.0
        display!(m, "Out of coffee")
        return nothing
    end

    if withmilk && m.milk <= 0.0
        display!(m, "Out of milk")
        return nothing
    end

    milkincup = if withmilk
        1.0
    else
        0.0
    end

    m.coffee -= 1.0
    m.milk -= milkincup

    display!(m, "Enjoy")

    Cup(1.0, milkincup)
end

readdisplay(m::Machine) = m.message
display!(m::Machine, msg::String) = m.message = msg

end # module
