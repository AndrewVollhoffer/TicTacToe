require 'ruby2d'

#Sets global variables to allow dragging window size changes and display program info in the terminal
set diagnostics: 'True'

#Loads music and sounds to play and manipulate
song = Music.new('tictactoe_plaza.mp3')
victory = Sound.new('victory.ogg')

song.loop = 'True'
Music.volume = 50
song.play

#Window size, title, and adjustments variables
set title: "Hotseat TicTacToe"
set width: Window.display_width
set height: Window.display_height - (Window.display_height / 17.5)
@x = Window.display_width / 2 #Centre points
@y = Window.display_height / 2 #    

#Sets background to a steel gray
set background: [0.25, 0.25, 0.25, 1]

#Draws grid for tic tac toe
#Vertical
#Left
Line.new(
    x1: (@x / 1.25), y1: (@y / 3),
    x2: (@x / 1.25), y2: (@y * 1.65),
    width: 15, color: 'black'
)
#Right
Line.new(
    x1: (@x * 1.25), y1: (@y / 3),
    x2: (@x * 1.25), y2: (@y * 1.65),
    width: 15, color: 'black'
)
#Horizontal
#Top
Line.new(
    x1: (@x / 2), y1: (@y / 1.3),
    x2: (@x * 1.5), y2: (@y / 1.3),
    width: 15, color: 'black'
)
#Bottom
Line.new(
    x1: (@x / 2), y1: (@y * 1.25),
    x2: (@x * 1.5), y2: (@y * 1.25),
    width: 15, color: 'black'
)

#Creates grid square placement variables for checking mouse collision.
a1 = Rectangle.new(
    x: (@x / 1.9), y: (@y / 2.8),
    width: (@x / 4), height: (@y / 2.8),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
a2 = Rectangle.new(
    x: (@x / 1.2), y: (@y / 2.8),
    width: (@x / 2.6), height: (@y / 2.8),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
a3 = Rectangle.new(
    x: (@x * 1.28), y: (@y / 2.8),
    width: (@x / 4.5), height: (@y / 2.8),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
b1 = Rectangle.new(
    x: (@x / 1.9), y: (@y / 1.24),
    width: (@x / 4), height: (@y / 2.6),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
b2 = Rectangle.new(
    x: (@x / 1.2), y: (@y / 1.24),
    width: (@x / 2.6), height: (@y / 2.6),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
b3 = Rectangle.new(
    x: (@x * 1.28), y: (@y / 1.24),
    width: (@x / 4.5), height: (@y / 2.6),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
c1 = Rectangle.new(
    x: (@x / 1.9), y: (@y * 1.28),
    width: (@x / 4), height: (@y / 2.8),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
c2 = Rectangle.new(
    x: (@x / 1.2), y: (@y * 1.28),
    width: (@x / 2.6), height: (@y / 2.8),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)
c3 = Rectangle.new(
    x: (@x * 1.28), y: (@y * 1.28),
    width: (@x / 4.5), height: (@y / 2.8),
    color: [0.25, 0.25, 0.25, 1],
    clicked: false
)

#Sets and displays the turn counter and initializes the win variables
turn_display = 'True'
@p_turn = 1

@win_num1 = 0
@win_num2 = 0

tick = 0

on :mouse_down do |mouse|

    #Checks mouse placement for the grid squares created earlier and places an X or O inside the grid lines.
    #Also adds values to an S variable to check for win conditions.
    if a1.contains?(mouse.x, mouse.y) && a1.clicked == false && @p_turn == 1
        Line.new(
            x1: (@x / 1.8), y1: (@y / 2.6),
            x2: (@x / 1.3), y2: (@y / 1.4),
            width: (Window.display_width / 200),
            color: 'black'
        )
        Line.new(
            x1: (@x / 1.8), y1: (@y / 1.4),
            x2: (@x / 1.3), y2: (@y / 2.6),
            width: (Window.display_width / 200),
            color: 'black'
        )
        @win_num1 += 1
    elsif a1.contains?(mouse.x, mouse.y) && @p_turn == 2
        Circle.new(
            x: (@x / 1.55), y: (@y / 1.9),
            radius: (Window.display_width / 19),
            color: 'black'
        )
        Circle.new(
            x: (@x / 1.55), y: (@y / 1.9),
            radius: (Window.display_width / 20),
            color: [0.25, 0.25, 0.25, 1]
        )
        a1.clicked = true
        @win_num2 += 1
    end

    if a2.contains?(mouse.x, mouse.y) && a2.clicked == false && @p_turn == 1
        Line.new(
            x1: (@x / 1.1), y1: (@y / 2.6),
            x2: (@x * 1.1), y2: (@y / 1.4),
            width: (Window.display_width / 200),
            color: 'black'
        )
        Line.new(
            x1: (@x / 1.1), y1: (@y / 1.4),
            x2: (@x * 1.1), y2: (@y / 2.6),
            width: (Window.display_width / 200),
            color: 'black'
        )
        @win_num1 += 2
    elsif a2.contains?(mouse.x, mouse.y) && @p_turn == 2
        Circle.new(
            x: (@x), y: (@y / 1.9),
            radius: (Window.display_width / 19),
            color: 'black'
        )
        Circle.new(
            x: (@x), y: (@y / 1.9),
            radius: (Window.display_width / 20),
            color: [0.25, 0.25, 0.25, 1]
        )
        a2.clicked = true
        @win_num2 += 2
    end

    if a3.contains?(mouse.x, mouse.y) && a3.clicked == false && @p_turn == 1
        Line.new(
            x1: (@x * 1.3), y1: (@y / 2.6),
            x2: (@x * 1.45), y2: (@y / 1.4),
            width: (Window.display_width / 200),
            color: 'black'
        )
        Line.new(
            x1: (@x * 1.3), y1: (@y / 1.4),
            x2: (@x * 1.45), y2: (@y / 2.6),
            width: (Window.display_width / 200),
            color: 'black'
        )
        @win_num1 += 3
    elsif a3 .contains?(mouse.x, mouse.y) && @p_turn == 2
        Circle.new(
            x: (@x * 1.38), y: (@y / 1.9),
            radius: (Window.display_width / 19),
            color: 'black'
        )
        Circle.new(
            x: (@x * 1.38), y: (@y / 1.9),
            radius: (Window.display_width / 20),
            color: [0.25, 0.25, 0.25, 1]
        )
        a3.clicked = true
        @win_num2 += 3
    end

    if b1.contains?(mouse.x, mouse.y) && b1.clicked == false && @p_turn == 1
        Line.new(
            x1: (@x / 1.8), y1: (@y / 1.2),
            x2: (@x / 1.3), y2: (@y * 1.2),
            width: (Window.display_width / 200),
            color: 'black'
        )
        Line.new(
            x1: (@x / 1.8), y1: (@y * 1.2),
            x2: (@x / 1.3), y2: (@y / 1.2),
            width: (Window.display_width / 200),
            color: 'black'
        )
        @win_num1 += 4
    elsif b1.contains?(mouse.x, mouse.y) && @p_turn == 2
        Circle.new(
            x: (@x / 1.55), y: (@y),
            radius: (Window.display_width / 19),
            color: 'black'
        )
        Circle.new(
            x: (@x / 1.55), y: (@y),
            radius: (Window.display_width / 20),
            color: [0.25, 0.25, 0.25, 1]
        )
        b1.clicked = true
        @win_num2 += 4
    end

    if b2.contains?(mouse.x, mouse.y) && b2.clicked == false && @p_turn == 1
        Line.new(
        x1: (@x / 1.1), y1: (@y / 1.2),
        x2: (@x * 1.1), y2: (@y * 1.2),
        width: (Window.display_width / 200),
        color: 'black'
        )
        Line.new(
            x1: (@x / 1.1), y1: (@y * 1.2),
            x2: (@x * 1.1), y2: (@y / 1.2),
            width: (Window.display_width / 200),
            color: 'black'
        )
        @win_num1 += 5
    elsif b2.contains?(mouse.x, mouse.y) && @p_turn == 2
        Circle.new(
            x: (@x), y: (@y),
            radius: (Window.display_width / 19),
            color: 'black'
        )
        Circle.new(
            x: (@x), y: (@y),
            radius: (Window.display_width / 20),
            color: [0.25, 0.25, 0.25, 1]
        )
        @win_num2 += 5
    end

if b3.contains?(mouse.x, mouse.y) && @p_turn == 1
Line.new(
    x1: (@x * 1.3), y1: (@y / 1.2),
    x2: (@x * 1.45), y2: (@y * 1.2),
    width: (Window.display_width / 200),
    color: 'black'
)
Line.new(
    x1: (@x * 1.3), y1: (@y * 1.2),
    x2: (@x * 1.45), y2: (@y / 1.2),
    width: (Window.display_width / 200),
    color: 'black'
)
@win_num1 += 6
elsif b3 .contains?(mouse.x, mouse.y) && @p_turn == 2
Circle.new(
    x: (@x * 1.38), y: (@y),
    radius: (Window.display_width / 19),
    color: 'black'
)
Circle.new(
    x: (@x * 1.38), y: (@y),
    radius: (Window.display_width / 20),
    color: [0.25, 0.25, 0.25, 1]
)
@win_num2 += 6
end

if c1.contains?(mouse.x, mouse.y) && @p_turn == 1
    Line.new(
        x1: (@x / 1.8), y1: (@y * 1.3),
        x2: (@x / 1.3), y2: (@y * 1.6),
        width: (Window.display_width / 200),
        color: 'black'
    )
    Line.new(
        x1: (@x / 1.8), y1: (@y * 1.6),
        x2: (@x / 1.3), y2: (@y * 1.3),
        width: (Window.display_width / 200),
        color: 'black'
    )
    @win_num1 += 7
elsif c1.contains?(mouse.x, mouse.y) && @p_turn == 2
Circle.new(
    x: (@x / 1.55), y: (@y * 1.475),
    radius: (Window.display_width / 19),
    color: 'black'
)
Circle.new(
    x: (@x / 1.55), y: (@y * 1.475),
    radius: (Window.display_width / 20),
    color: [0.25, 0.25, 0.25, 1]
)
@win_num2 += 7
end

if c2.contains?(mouse.x, mouse.y) && @p_turn == 1
Line.new(
    x1: (@x / 1.1), y1: (@y * 1.6),
    x2: (@x * 1.1), y2: (@y * 1.3),
    width: (Window.display_width / 200),
    color: 'black'
)
Line.new(
    x1: (@x / 1.1), y1: (@y * 1.3),
    x2: (@x * 1.1), y2: (@y * 1.6),
    width: (Window.display_width / 200),
    color: 'black'
)
@win_num1 += 8
elsif c2.contains?(mouse.x, mouse.y) && @p_turn == 2
Circle.new(
    x: (@x), y: (@y * 1.475),
    radius: (Window.display_width / 19),
    color: 'black'
)
Circle.new(
    x: (@x), y: (@y * 1.475),
    radius: (Window.display_width / 20),
    color: [0.25, 0.25, 0.25, 1]
)
@win_num2 += 8
end

if c3.contains?(mouse.x, mouse.y) && @p_turn == 1
Line.new(
    x1: (@x * 1.3), y1: (@y * 1.3),
    x2: (@x * 1.45), y2: (@y * 1.6),
    width: (Window.display_width / 200),
    color: 'black'
)
Line.new(
    x1: (@x * 1.3), y1: (@y * 1.6),
    x2: (@x * 1.45), y2: (@y *1.3),
    width: (Window.display_width / 200),
    color: 'black'
)
@win_num1 += 9
elsif c3 .contains?(mouse.x, mouse.y) && @p_turn == 2
Circle.new(
    x: (@x * 1.38), y: (@y * 1.475),
    radius: (Window.display_width / 19),
    color: 'black'
)
Circle.new(
    x: (@x * 1.38), y: (@y * 1.475),
    radius: (Window.display_width / 20),
    color: [0.25, 0.25, 0.25, 1]
)
@win_num2 += 9
end

#Changes the counter every mouse click and places a box over the number to clear left over display artifacts
if @p_turn <= 1
    @p_turn += 1
   elsif @p_turn >= 2
    @p_turn = 1
end

Rectangle.new(
    x: (@x / 4.5), y: (@y / 30),
    width: (@x / 25), height: (@y / 12.5),
    color: [0.25, 0.25, 0.25, 1]
)

end

#Creates and updates the player turn display every frame and stalls the close to play the sound and display text
update do
    if turn_display == 'True'
        Text.new(
            "It's Player #{@p_turn} 's turn. Press space to pause the music. Press Escape to close the game",
            x: 10, y: 10,
            style: 'bold',
            size: (Window.display_width / 43)
        )
    end

    #Sets and executes the win condition

    if @win_num1 == 6 || @win_num1 == 15 || @win_num1 == 24 || @win_num1 == 12 || @win_num1 == 18
        song.stop
        clear
        victory.play
        
        Text.new(
            "Congrats Player 1!",
            x: (@x / 1.3), y: (@y / 1.3),
            style: 'bold',
            size: (Window.display_width / 50)       
        )
    elsif @win_num2 == 6 || @win_num2 == 15 || @win_num2 == 24 || @win_num2 == 12 || @win_num2 == 18
        song.stop
        clear
        victory.play
        
        Text.new(
            "Congrats Player 2!",
            x: (@x / 1.3), y: (@y / 1.3),
            style: 'bold',
            size: (Window.display_width / 50)       
        )

        tick += 1
        if tick == 150
            close
        end
    end

end

#Sets pause aware music picking
mus_on = "True"
on :key_down do |mus_control|
    if mus_control.key == 'space' && mus_on == "True"
        song.pause
        mus_on = "False"
    elsif mus_on == "False" && mus_control.key == "space"
        song.resume
        mus_on = "True"
    end
end

#Closes program once the escape key is pressed.
on :key_down do |exit|
    if exit.key == 'escape'
        turn_display = 'False'
        clear
        Text.new(
            "Bye!",
            x: (@x / 1.3), y: (@y / 1.3),
            style: 'bold',

            size: (Window.display_width / 10)       
        )
        song.fadeout(1500)
        close 
    end
end

show