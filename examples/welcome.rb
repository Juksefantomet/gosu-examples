require 'rubygems'
require 'gosu/preview'

WIDTH, HEIGHT = 600, 600

class Welcome < (Example rescue Gosu::Window)
  PADDING = 20
  
  def initialize
    super WIDTH, HEIGHT
    
    self.caption = "Welcome!"
    
    text =
      "<b>Welcome to the Gosu Example Box!</b>
      
      This little tool lets you launch any of Gosu’s example games from the list on the right hand side of the screen.
      
      Every example can be run both from this tool <i>and</i> from the terminal/command line as a stand-alone Ruby script.
      
      Shortcuts:
      
      • To see the source code of an example or feature demo, press <i>S</i>.
      • To open the ‘examples’ folder, press <i>O</i>.
      • To quit this tool, press <i>Esc</i>. This is useful if you are running in fullscreen mode. (gosu-examples --fullscreen)
      
      Why not take a look at this example right now? Simply press <i>S</i>."
    
    # Remove all leading spaces so the text is left-aligned
    text.gsub! /^ +/, ''
    
    @text = Gosu::Image.from_text text, 20, :width => WIDTH - 2 * PADDING
    
    @background = Gosu::Image.new "media/space.png"
  end
  
  def draw
    draw_rotating_star_backgrounds
    
    @text.draw PADDING, PADDING, 0
  end
  
  def draw_rotating_star_backgrounds
    # Disregard the math in this method, it doesn't look as good as I thought it
    # would. =(
    
    angle = Gosu::milliseconds / 50.0
    scale = (Gosu::milliseconds % 1000) / 1000.0
    
    [1, 0].each do |extra_scale|
      @background.draw_rot WIDTH * 0.5, HEIGHT * 0.75, 0, angle, 0.5, 0.5,
        scale + extra_scale, scale + extra_scale
    end
  end
end

Welcome.new.show if __FILE__ == $0
