class scoreboard extends uvm_scoreboard;
  `uvm_component_utils(scoreboard)
  
  uvm_tlm_analysis_fifo#(seq_item)item_col;
  seq_item seq;
  //seq_item pkt_qu[$]; 
  
  function new(string name,uvm_component parent);
    super.new(name,parent);
  endfunction:new
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item_col=new("items_col",this); 
  endfunction:build_phase
  
  /* virtual function void write(seq_item trans_col);
    `uvm_info(get_type_name(),$sformatf(" Value of sequence item in Scoreboard \n"),UVM_LOW)
    trans_col.print();
    pkt_qu.push_back(trans_col); 
  endfunction:write */
  
  /*virtual task run_phase(uvm_phase phase);
    seq_item seq;
    forever begin
      wait(pkt_qu.size()>0);
      seq=pkt_qu.pop_front();
      
      if(seq.A+seq.B == seq.sum) begin
        `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
        `uvm_info(get_type_name(),$sformatf(" Value of Sum = %0d", seq.sum),UVM_LOW)
       
      end
      else begin
        `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
        end
      end */
  virtual task run_phase(uvm_phase phase);
    forever begin
      item_col.get(seq);
      
      if(seq.sel == 3'b000)
        begin
          if(seq.A + seq.B == seq.result)
            begin
              $display("------------------------------------------------------------------------------------");
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Addition"), UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------");
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      if(seq.sel == 3'b001)
        begin
          if(seq.A + (~seq.B + 1) == seq.result)
            begin
              $display("------------------------------------------------------------------------------------");
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Subtraction"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------");
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      if(seq.sel == 3'b010)
        begin
          if(seq.A & seq.B == seq.result)
            begin
              $display("------------------------------------------------------------------------------------");
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Logical AND"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------" );        
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      if(seq.sel == 3'b011)
        begin
          if(seq.A | seq.B == seq.result)
            begin
              $display("------------------------------------------------------------------------------------");
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Logical OR"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------");
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      if(seq.sel == 3'b100)
        begin
          if(seq.A * seq.B == seq.result)
            begin
              $display("------------------------------------------------------------------------------------");
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Multiplication"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------");
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      if(seq.sel == 3'b101)
        begin
          if(seq.A ^ seq.B == seq.result)
            begin
              $display("------------------------------------------------------------------------------------");
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Logical XOR"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------" );        
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      if(seq.sel == 3'b110)
        begin
          if(seq.A % seq.B == seq.result)
            begin
              $display("------------------------------------------------------------------------------------");
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Modulo Operator"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------" );        
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      if(seq.sel == 3'b111)
        begin
          if(seq.A / seq.B == seq.result)
            begin
              $display("------------------------------------------------------------------------------------" );
              `uvm_info(get_type_name(),$sformatf(" The selected operation is Division"),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Test Pass "),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of A = %0d", seq.A),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of B = %0d", seq.B),UVM_LOW)
              `uvm_info(get_type_name(),$sformatf(" Value of Result = %0d", seq.result),UVM_LOW)
              $display("------------------------------------------------------------------------------------" );        
            end
          else
            begin
              `uvm_info(get_type_name(),$sformatf(" Test Failed "),UVM_LOW)
            end
        end
      
      else begin 
        `uvm_info(get_type_name(),$sformatf ("Default value initiated"),UVM_LOW)
      end
    end
   
  endtask : run_phase
endclass : scoreboard