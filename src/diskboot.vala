/* Copyright 2016 Robert San <robertsanseries@gmail.com>
*
* This program is free software: you can redistribute it
* and/or modify it under the terms of the GNU General Public License as
* published by the Free Software Foundation, either version 3 of the
* License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
* Public License for more details.
*
* You should have received a copy of the GNU General Public License along
* with this program. If not, see http://www.gnu.org/licenses/.
*/

using Gtk;    
using Granite;

namespace Diskboot{
    
    /**
     * Main Diskboot class.
     */    
    public class Diskboot : Gtk.Application {

        public static int main (string[] args) {
            
            Gtk.init (ref args);
            var app = new Application ();
            app.init ();

            return 0;
        }
    }

    /**

     * Main application class.
     */
    public class Application : Gtk.Application {

        construct {
            var window = new Window ();
            var box = new Box (Orientation.VERTICAL, 250);

            window.title = "Diskbook";
            window.border_width = 2;
            window.window_position = WindowPosition.CENTER;
            window.set_default_size (40, 250);
            window.destroy.connect (Gtk.main_quit);
            
            var box_label = new Box (Orientation.VERTICAL, 20);
            var label_welcome = new Label ("Welcome Diskbook!");
            box_label.add (label_welcome);
            box.add (box_label);

            var box_step1 = new Box (Orientation.VERTICAL, 20);
              var label_usb_devices = new Label ("Step1: You Selected E: as your USB Device!\n");
              var checkbox_all_devices = new CheckButton.with_label ("Show All Devices?");
              box_step1.add (label_usb_devices);
              box_step1.add (checkbox_all_devices);        
            box.add (box_step1);

            var box_step2 = new Box (Orientation.VERTICAL, 20);
              var label_distribution = new Label ("Step2: Select a Distribution  to put on E:\n");
              box_step1.add (label_distribution);
            box.add (box_step1);

            var box_step3 = new Box (Orientation.VERTICAL, 20);
              var label_select_iso = new Label ("Browser and select your ubuntu*desktop*.iso");
              var all_isos = new CheckButton.with_label ("Show All ISOs?");
              var search_entry = new Granite.Widgets.SearchBar ("Search");
              var browser = new Button.with_label ("Browser");            
              box_step1.add (label_select_iso);
              box_step1.add (all_isos);        
              box_step1.add (search_entry);        
              box_step1.add (browser);        
            box.add (box_step1);

            window.add (box);
            window.show_all ();
        }
        
        public void init (){
            Gtk.main ();
        }
    
    }

}
