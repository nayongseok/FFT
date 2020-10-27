set_property PACKAGE_PIN M19      [get_ports "clk"];    
set_property IOSTANDARD  LVCMOS33 [get_ports "clk"];    
                                                        
set_property PACKAGE_PIN N15      [get_ports "reset"]; 
set_property IOSTANDARD  LVCMOS33  [get_ports "reset"]; 
                                                        
set_property PACKAGE_PIN E16      [get_ports "valid_in"];
set_property IOSTANDARD  LVCMOS33 [get_ports "valid_in"];
                                                        
set_property PACKAGE_PIN D16      [get_ports "start"];  
set_property IOSTANDARD  LVCMOS33 [get_ports "start"];  
                                                        
set_property PACKAGE_PIN D17      [get_ports "MOSI"];   
set_property IOSTANDARD  LVCMOS33 [get_ports "MOSI"];   
                                                        
set_property PACKAGE_PIN E15      [get_ports "SCK"];    
set_property IOSTANDARD  LVCMOS33 [get_ports "SCK"];    
                                                        
set_property PACKAGE_PIN D15      [get_ports "nSS"];    
set_property IOSTANDARD  LVCMOS33 [get_ports "nSS"];    
                                                        
set_property PACKAGE_PIN P20      [get_ports "MISO"];   
set_property IOSTANDARD  LVCMOS33 [get_ports "MISO"];   
                                                        
set_property PACKAGE_PIN P21      [get_ports "Done_FFT"];
set_property IOSTANDARD  LVCMOS33 [get_ports "Done_FFT"];
                                                        
create_clock -name clk -period 40 [get_ports "clk"];    
                                                        