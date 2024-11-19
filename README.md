# SystemVerilog_Development_Course
Course examples and exercises about HDL for FPGA development

## Basic instructions to run the code

To compile with icarus Verilog use the following line:

        iverilog -g2012 -o output_file your_file.sv

To run the code use the folowing line:
        
        vvp output_file

To be able to visualize the signals of your code, make sure to include in your testbench monitoring cycle the following code, where output_file_tb shall match with the module testbench name:

        $dumpfile("output_file_tb.vcd");
        $dumpvars(0, output_file_tb);

Then, to visualize the signals you can use gtkwave, if using macOS, I do recommend using the binaries that https://github.com/YosysHQ/oss-cad-suite-build has, to avoid messing with libraries. And then run it by using the following command:
                
        {path to gtkwave binary}/gtkwave output_file_tb.vcd

To visualize the circuit, you can use https://digitaljs.tilk.eu/
