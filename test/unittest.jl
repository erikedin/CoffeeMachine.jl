using Test
using CoffeeMachine

@testset "CoffeeMachine" begin
    @testset "Make a coffee" begin
        m = Machine(coffee=5.0)

        cup = makecoffee!(m)

        @test cup isa Cup
        @test cup.coffee > 0.0
    end

    @testset "A regular coffee does not have milk" begin
        m = Machine(coffee=5.0)

        cup = makecoffee!(m)

        @test cup.milk == 0.0
    end

    @testset "Out of coffee" begin
        m = Machine(coffee=0.0)

        cup = makecoffee!(m)

        @test cup === nothing
    end

    @testset "Out of coffee, displays message" begin
        m = Machine(coffee=0.0)

        cup = makecoffee!(m)

        @test cup === nothing
        @test readdisplay(m) == "Out of coffee"
    end

    @testset "Coffee with Milk" begin
        m = Machine(coffee=5.0, milk=5.0)

        cup = makecoffee!(m, withmilk=true)

        @test cup.milk > 0.0
    end

    @testset "Out of milk" begin
        m = Machine(coffee=5.0, milk=0.0)

        cup = makecoffee!(m, withmilk=true)

        @test cup === nothing
    end

    @testset "Out of milk displays message" begin
        m = Machine(coffee=5.0, milk=0.0)

        cup = makecoffee!(m, withmilk=true)

        @test readdisplay(m) == "Out of milk"
    end

    @testset "Fill milk" begin
        m = Machine(coffee=5.0, milk=0.0)

        cup = makecoffee!(m, withmilk=true)

        @test readdisplay(m) == "Out of milk"

        fillwith!(m, milk=5.0)

        cup = makecoffee!(m, withmilk=true)
    
        @test cup.milk > 0.0
        @test readdisplay(m) == "Enjoy"
    end

    @testset "Fill coffee" begin
        m = Machine(coffee=0.0)

        cup = makecoffee!(m)

        @test cup === nothing

        fillwith!(m, coffee=5.0)

        cup = makecoffee!(m)

        @test cup.coffee > 0.0
        @test readdisplay(m) == "Enjoy"
    end

    @testset "Running out of coffee" begin
        m = Machine(coffee=2.0)

        cup1 = makecoffee!(m)
        cup2 = makecoffee!(m)
        cup3 = makecoffee!(m)

        @test cup1 !== nothing
        @test cup2 !== nothing

        @test cup3 === nothing
    end

    @testset "Running out of milk" begin
        m = Machine(coffee=10.0, milk=2.0)

        cup1 = makecoffee!(m, withmilk=true)
        cup2 = makecoffee!(m, withmilk=true)
        cup3 = makecoffee!(m, withmilk=true)

        @test cup1 !== nothing
        @test cup2 !== nothing

        @test cup3 === nothing
        @test readdisplay(m) == "Out of milk"
    end
end