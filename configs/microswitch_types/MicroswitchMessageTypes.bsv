/******************************************************************************
Author: Hyoukjun Kwon (hyoukjun@gatech.edu)

Copyright (c) 2017 Georgia Instititue of Technology

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*******************************************************************************/

/* NoC types */
import MicroswitchTypes::*;
/* Neural network types */
import NeuralNetworkTypes::*;

typedef NeuralNetworkFlitType             MsgType;  // enum {Weight, IfMap, PSum, OfMap} 
typedef enum {Head, Body, Tail, HeadTail} FlitType deriving(Bits, Eq);

typedef Pixel FlitData;

// Flit
typedef struct {
  MsgType   msgType;   // {Weight, IfMap, PSum, OfMap}
  DestBits  dests;
  NumPEsBit localDest;
  FlitData  flitData;
} Flit deriving (Bits, Eq);


interface SwitchInPort;
  method Action putFlit(Flit flit);
endinterface

interface SwitchOutPort;
  method ActionValue#(Flit) getFlit;
endinterface

