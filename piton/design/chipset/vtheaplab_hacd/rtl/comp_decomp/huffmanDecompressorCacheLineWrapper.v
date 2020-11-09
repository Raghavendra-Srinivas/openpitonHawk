module decompressorChisel(
  input         clock,
  input         reset,
  input         io_start,
  input         io_dataIn_0_valid,
  input  [31:0] io_dataIn_0_bits,
  output [14:0] io_currentBit_0,
  input         io_dataOut_0_ready,
  output        io_dataOut_0_valid,
  output [7:0]  io_dataOut_0_bits,
  output        io_finished
);
  reg [1:0] state; // @[decompressorChisel.scala 59:22]
  reg [31:0] _RAND_0;
  reg [12:0] iterations_0; // @[decompressorChisel.scala 61:23]
  reg [31:0] _RAND_1;
  reg [14:0] currentBit_0; // @[decompressorChisel.scala 67:23]
  reg [31:0] _RAND_2;
  reg [8:0] unencodedCharacters_0; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_3;
  reg [8:0] unencodedCharacters_1; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_4;
  reg [8:0] unencodedCharacters_2; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_5;
  reg [8:0] unencodedCharacters_3; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_6;
  reg [8:0] unencodedCharacters_4; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_7;
  reg [8:0] unencodedCharacters_5; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_8;
  reg [8:0] unencodedCharacters_6; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_9;
  reg [8:0] unencodedCharacters_7; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_10;
  reg [8:0] unencodedCharacters_8; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_11;
  reg [8:0] unencodedCharacters_9; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_12;
  reg [8:0] unencodedCharacters_10; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_13;
  reg [8:0] unencodedCharacters_11; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_14;
  reg [8:0] unencodedCharacters_12; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_15;
  reg [8:0] unencodedCharacters_13; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_16;
  reg [8:0] unencodedCharacters_14; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_17;
  reg [8:0] unencodedCharacters_15; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_18;
  reg [8:0] unencodedCharacters_16; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_19;
  reg [8:0] unencodedCharacters_17; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_20;
  reg [8:0] unencodedCharacters_18; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_21;
  reg [8:0] unencodedCharacters_19; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_22;
  reg [8:0] unencodedCharacters_20; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_23;
  reg [8:0] unencodedCharacters_21; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_24;
  reg [8:0] unencodedCharacters_22; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_25;
  reg [8:0] unencodedCharacters_23; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_26;
  reg [8:0] unencodedCharacters_24; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_27;
  reg [8:0] unencodedCharacters_25; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_28;
  reg [8:0] unencodedCharacters_26; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_29;
  reg [8:0] unencodedCharacters_27; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_30;
  reg [8:0] unencodedCharacters_28; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_31;
  reg [8:0] unencodedCharacters_29; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_32;
  reg [8:0] unencodedCharacters_30; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_33;
  reg [8:0] unencodedCharacters_31; // @[decompressorChisel.scala 74:32]
  reg [31:0] _RAND_34;
  reg [14:0] encodedCharacters_0; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_35;
  reg [14:0] encodedCharacters_1; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_36;
  reg [14:0] encodedCharacters_2; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_37;
  reg [14:0] encodedCharacters_3; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_38;
  reg [14:0] encodedCharacters_4; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_39;
  reg [14:0] encodedCharacters_5; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_40;
  reg [14:0] encodedCharacters_6; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_41;
  reg [14:0] encodedCharacters_7; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_42;
  reg [14:0] encodedCharacters_8; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_43;
  reg [14:0] encodedCharacters_9; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_44;
  reg [14:0] encodedCharacters_10; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_45;
  reg [14:0] encodedCharacters_11; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_46;
  reg [14:0] encodedCharacters_12; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_47;
  reg [14:0] encodedCharacters_13; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_48;
  reg [14:0] encodedCharacters_14; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_49;
  reg [14:0] encodedCharacters_15; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_50;
  reg [14:0] encodedCharacters_16; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_51;
  reg [14:0] encodedCharacters_17; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_52;
  reg [14:0] encodedCharacters_18; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_53;
  reg [14:0] encodedCharacters_19; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_54;
  reg [14:0] encodedCharacters_20; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_55;
  reg [14:0] encodedCharacters_21; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_56;
  reg [14:0] encodedCharacters_22; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_57;
  reg [14:0] encodedCharacters_23; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_58;
  reg [14:0] encodedCharacters_24; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_59;
  reg [14:0] encodedCharacters_25; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_60;
  reg [14:0] encodedCharacters_26; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_61;
  reg [14:0] encodedCharacters_27; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_62;
  reg [14:0] encodedCharacters_28; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_63;
  reg [14:0] encodedCharacters_29; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_64;
  reg [14:0] encodedCharacters_30; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_65;
  reg [14:0] encodedCharacters_31; // @[decompressorChisel.scala 80:30]
  reg [31:0] _RAND_66;
  reg [3:0] encodedLength_0; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_67;
  reg [3:0] encodedLength_1; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_68;
  reg [3:0] encodedLength_2; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_69;
  reg [3:0] encodedLength_3; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_70;
  reg [3:0] encodedLength_4; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_71;
  reg [3:0] encodedLength_5; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_72;
  reg [3:0] encodedLength_6; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_73;
  reg [3:0] encodedLength_7; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_74;
  reg [3:0] encodedLength_8; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_75;
  reg [3:0] encodedLength_9; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_76;
  reg [3:0] encodedLength_10; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_77;
  reg [3:0] encodedLength_11; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_78;
  reg [3:0] encodedLength_12; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_79;
  reg [3:0] encodedLength_13; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_80;
  reg [3:0] encodedLength_14; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_81;
  reg [3:0] encodedLength_15; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_82;
  reg [3:0] encodedLength_16; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_83;
  reg [3:0] encodedLength_17; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_84;
  reg [3:0] encodedLength_18; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_85;
  reg [3:0] encodedLength_19; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_86;
  reg [3:0] encodedLength_20; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_87;
  reg [3:0] encodedLength_21; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_88;
  reg [3:0] encodedLength_22; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_89;
  reg [3:0] encodedLength_23; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_90;
  reg [3:0] encodedLength_24; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_91;
  reg [3:0] encodedLength_25; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_92;
  reg [3:0] encodedLength_26; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_93;
  reg [3:0] encodedLength_27; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_94;
  reg [3:0] encodedLength_28; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_95;
  reg [3:0] encodedLength_29; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_96;
  reg [3:0] encodedLength_30; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_97;
  reg [3:0] encodedLength_31; // @[decompressorChisel.scala 83:26]
  reg [31:0] _RAND_98;
  wire [62:0] _GEN_1511 = {{31'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [62:0] _T_3 = _GEN_1511 & 63'h7fffffff80000000; // @[decompressorChisel.scala 24:47]
  wire [61:0] _GEN_1512 = {{30'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [61:0] _T_6 = _GEN_1512 & 62'h3fffffffc0000000; // @[decompressorChisel.scala 24:47]
  wire [60:0] _GEN_1513 = {{29'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [60:0] _T_9 = _GEN_1513 & 61'h1fffffffe0000000; // @[decompressorChisel.scala 24:47]
  wire [59:0] _GEN_1514 = {{28'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [59:0] _T_12 = _GEN_1514 & 60'hffffffff0000000; // @[decompressorChisel.scala 24:47]
  wire [58:0] _GEN_1515 = {{27'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [58:0] _T_15 = _GEN_1515 & 59'h7fffffff8000000; // @[decompressorChisel.scala 24:47]
  wire [57:0] _GEN_1516 = {{26'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [57:0] _T_18 = _GEN_1516 & 58'h3fffffffc000000; // @[decompressorChisel.scala 24:47]
  wire [56:0] _GEN_1517 = {{25'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [56:0] _T_21 = _GEN_1517 & 57'h1fffffffe000000; // @[decompressorChisel.scala 24:47]
  wire [55:0] _GEN_1518 = {{24'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [55:0] _T_24 = _GEN_1518 & 56'hffffffff000000; // @[decompressorChisel.scala 24:47]
  wire [54:0] _GEN_1519 = {{23'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [54:0] _T_27 = _GEN_1519 & 55'h7fffffff800000; // @[decompressorChisel.scala 24:47]
  wire [53:0] _GEN_1520 = {{22'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [53:0] _T_30 = _GEN_1520 & 54'h3fffffffc00000; // @[decompressorChisel.scala 24:47]
  wire [52:0] _GEN_1521 = {{21'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [52:0] _T_33 = _GEN_1521 & 53'h1fffffffe00000; // @[decompressorChisel.scala 24:47]
  wire [51:0] _GEN_1522 = {{20'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [51:0] _T_36 = _GEN_1522 & 52'hffffffff00000; // @[decompressorChisel.scala 24:47]
  wire [50:0] _GEN_1523 = {{19'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [50:0] _T_39 = _GEN_1523 & 51'h7fffffff80000; // @[decompressorChisel.scala 24:47]
  wire [49:0] _GEN_1524 = {{18'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [49:0] _T_42 = _GEN_1524 & 50'h3fffffffc0000; // @[decompressorChisel.scala 24:47]
  wire [48:0] _GEN_1525 = {{17'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [48:0] _T_45 = _GEN_1525 & 49'h1fffffffe0000; // @[decompressorChisel.scala 24:47]
  wire [47:0] _GEN_1526 = {{16'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [47:0] _T_48 = _GEN_1526 & 48'hffffffff0000; // @[decompressorChisel.scala 24:47]
  wire [46:0] _GEN_1527 = {{15'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [46:0] _T_51 = _GEN_1527 & 47'h7fffffff8000; // @[decompressorChisel.scala 24:47]
  wire [45:0] _GEN_1528 = {{14'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [45:0] _T_54 = _GEN_1528 & 46'h3fffffffc000; // @[decompressorChisel.scala 24:47]
  wire [44:0] _GEN_1529 = {{13'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [44:0] _T_57 = _GEN_1529 & 45'h1fffffffe000; // @[decompressorChisel.scala 24:47]
  wire [43:0] _GEN_1530 = {{12'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [43:0] _T_60 = _GEN_1530 & 44'hffffffff000; // @[decompressorChisel.scala 24:47]
  wire [42:0] _GEN_1531 = {{11'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [42:0] _T_63 = _GEN_1531 & 43'h7fffffff800; // @[decompressorChisel.scala 24:47]
  wire [41:0] _GEN_1532 = {{10'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [41:0] _T_66 = _GEN_1532 & 42'h3fffffffc00; // @[decompressorChisel.scala 24:47]
  wire [40:0] _GEN_1533 = {{9'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [40:0] _T_69 = _GEN_1533 & 41'h1fffffffe00; // @[decompressorChisel.scala 24:47]
  wire [39:0] _GEN_1534 = {{8'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [39:0] _T_72 = _GEN_1534 & 40'hffffffff00; // @[decompressorChisel.scala 24:47]
  wire [38:0] _GEN_1535 = {{7'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [38:0] _T_75 = _GEN_1535 & 39'h7fffffff80; // @[decompressorChisel.scala 24:47]
  wire [37:0] _GEN_1536 = {{6'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [37:0] _T_78 = _GEN_1536 & 38'h3fffffffc0; // @[decompressorChisel.scala 24:47]
  wire [36:0] _GEN_1537 = {{5'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [36:0] _T_81 = _GEN_1537 & 37'h1fffffffe0; // @[decompressorChisel.scala 24:47]
  wire [35:0] _GEN_1538 = {{4'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [35:0] _T_84 = _GEN_1538 & 36'hffffffff0; // @[decompressorChisel.scala 24:47]
  wire [34:0] _GEN_1539 = {{3'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [34:0] _T_87 = _GEN_1539 & 35'h7fffffff8; // @[decompressorChisel.scala 24:47]
  wire [33:0] _GEN_1540 = {{2'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [33:0] _T_90 = _GEN_1540 & 34'h3fffffffc; // @[decompressorChisel.scala 24:47]
  wire [32:0] _GEN_1541 = {{1'd0}, io_dataIn_0_bits}; // @[decompressorChisel.scala 24:47]
  wire [32:0] _T_93 = _GEN_1541 & 33'h1fffffffe; // @[decompressorChisel.scala 24:47]
  wire  _T_98 = encodedLength_0 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_100 = encodedLength_0 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1542 = {{2'd0}, encodedLength_0}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_102 = 6'h20 - _GEN_1542; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1543 = {{63'd0}, encodedCharacters_0}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_103 = _GEN_1543 << _T_102; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_1 = 4'h1 == _T_100 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_2 = 4'h2 == _T_100 ? _T_9[31:0] : _GEN_1; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_3 = 4'h3 == _T_100 ? _T_12[31:0] : _GEN_2; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_4 = 4'h4 == _T_100 ? _T_15[31:0] : _GEN_3; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_5 = 4'h5 == _T_100 ? _T_18[31:0] : _GEN_4; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_6 = 4'h6 == _T_100 ? _T_21[31:0] : _GEN_5; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_7 = 4'h7 == _T_100 ? _T_24[31:0] : _GEN_6; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_8 = 4'h8 == _T_100 ? _T_27[31:0] : _GEN_7; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_9 = 4'h9 == _T_100 ? _T_30[31:0] : _GEN_8; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_10 = 4'ha == _T_100 ? _T_33[31:0] : _GEN_9; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_11 = 4'hb == _T_100 ? _T_36[31:0] : _GEN_10; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_12 = 4'hc == _T_100 ? _T_39[31:0] : _GEN_11; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_13 = 4'hd == _T_100 ? _T_42[31:0] : _GEN_12; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_14 = 4'he == _T_100 ? _T_45[31:0] : _GEN_13; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_15 = 4'hf == _T_100 ? _T_48[31:0] : _GEN_14; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1544 = {{1'd0}, _T_100}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_16 = 5'h10 == _GEN_1544 ? _T_51[31:0] : _GEN_15; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_17 = 5'h11 == _GEN_1544 ? _T_54[31:0] : _GEN_16; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_18 = 5'h12 == _GEN_1544 ? _T_57[31:0] : _GEN_17; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_19 = 5'h13 == _GEN_1544 ? _T_60[31:0] : _GEN_18; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_20 = 5'h14 == _GEN_1544 ? _T_63[31:0] : _GEN_19; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_21 = 5'h15 == _GEN_1544 ? _T_66[31:0] : _GEN_20; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_22 = 5'h16 == _GEN_1544 ? _T_69[31:0] : _GEN_21; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_23 = 5'h17 == _GEN_1544 ? _T_72[31:0] : _GEN_22; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_24 = 5'h18 == _GEN_1544 ? _T_75[31:0] : _GEN_23; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_25 = 5'h19 == _GEN_1544 ? _T_78[31:0] : _GEN_24; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_26 = 5'h1a == _GEN_1544 ? _T_81[31:0] : _GEN_25; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_27 = 5'h1b == _GEN_1544 ? _T_84[31:0] : _GEN_26; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_28 = 5'h1c == _GEN_1544 ? _T_87[31:0] : _GEN_27; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_29 = 5'h1d == _GEN_1544 ? _T_90[31:0] : _GEN_28; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_30 = 5'h1e == _GEN_1544 ? _T_93[31:0] : _GEN_29; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_31 = 5'h1f == _GEN_1544 ? io_dataIn_0_bits : _GEN_30; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1560 = {{46'd0}, _GEN_31}; // @[decompressorChisel.scala 32:58]
  wire  _T_104 = _GEN_1560 == _T_103; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_0 = _T_98 ? 1'h0 : _T_104; // @[decompressorChisel.scala 29:35]
  wire  _T_203 = encodedLength_1 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_205 = encodedLength_1 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1592 = {{2'd0}, encodedLength_1}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_207 = 6'h20 - _GEN_1592; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1593 = {{63'd0}, encodedCharacters_1}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_208 = _GEN_1593 << _T_207; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_34 = 4'h1 == _T_205 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_35 = 4'h2 == _T_205 ? _T_9[31:0] : _GEN_34; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_36 = 4'h3 == _T_205 ? _T_12[31:0] : _GEN_35; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_37 = 4'h4 == _T_205 ? _T_15[31:0] : _GEN_36; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_38 = 4'h5 == _T_205 ? _T_18[31:0] : _GEN_37; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_39 = 4'h6 == _T_205 ? _T_21[31:0] : _GEN_38; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_40 = 4'h7 == _T_205 ? _T_24[31:0] : _GEN_39; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_41 = 4'h8 == _T_205 ? _T_27[31:0] : _GEN_40; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_42 = 4'h9 == _T_205 ? _T_30[31:0] : _GEN_41; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_43 = 4'ha == _T_205 ? _T_33[31:0] : _GEN_42; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_44 = 4'hb == _T_205 ? _T_36[31:0] : _GEN_43; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_45 = 4'hc == _T_205 ? _T_39[31:0] : _GEN_44; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_46 = 4'hd == _T_205 ? _T_42[31:0] : _GEN_45; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_47 = 4'he == _T_205 ? _T_45[31:0] : _GEN_46; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_48 = 4'hf == _T_205 ? _T_48[31:0] : _GEN_47; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1594 = {{1'd0}, _T_205}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_49 = 5'h10 == _GEN_1594 ? _T_51[31:0] : _GEN_48; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_50 = 5'h11 == _GEN_1594 ? _T_54[31:0] : _GEN_49; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_51 = 5'h12 == _GEN_1594 ? _T_57[31:0] : _GEN_50; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_52 = 5'h13 == _GEN_1594 ? _T_60[31:0] : _GEN_51; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_53 = 5'h14 == _GEN_1594 ? _T_63[31:0] : _GEN_52; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_54 = 5'h15 == _GEN_1594 ? _T_66[31:0] : _GEN_53; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_55 = 5'h16 == _GEN_1594 ? _T_69[31:0] : _GEN_54; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_56 = 5'h17 == _GEN_1594 ? _T_72[31:0] : _GEN_55; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_57 = 5'h18 == _GEN_1594 ? _T_75[31:0] : _GEN_56; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_58 = 5'h19 == _GEN_1594 ? _T_78[31:0] : _GEN_57; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_59 = 5'h1a == _GEN_1594 ? _T_81[31:0] : _GEN_58; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_60 = 5'h1b == _GEN_1594 ? _T_84[31:0] : _GEN_59; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_61 = 5'h1c == _GEN_1594 ? _T_87[31:0] : _GEN_60; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_62 = 5'h1d == _GEN_1594 ? _T_90[31:0] : _GEN_61; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_63 = 5'h1e == _GEN_1594 ? _T_93[31:0] : _GEN_62; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_64 = 5'h1f == _GEN_1594 ? io_dataIn_0_bits : _GEN_63; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1610 = {{46'd0}, _GEN_64}; // @[decompressorChisel.scala 32:58]
  wire  _T_209 = _GEN_1610 == _T_208; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_1 = _T_203 ? 1'h0 : _T_209; // @[decompressorChisel.scala 29:35]
  wire  _T_308 = encodedLength_2 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_310 = encodedLength_2 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1642 = {{2'd0}, encodedLength_2}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_312 = 6'h20 - _GEN_1642; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1643 = {{63'd0}, encodedCharacters_2}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_313 = _GEN_1643 << _T_312; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_67 = 4'h1 == _T_310 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_68 = 4'h2 == _T_310 ? _T_9[31:0] : _GEN_67; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_69 = 4'h3 == _T_310 ? _T_12[31:0] : _GEN_68; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_70 = 4'h4 == _T_310 ? _T_15[31:0] : _GEN_69; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_71 = 4'h5 == _T_310 ? _T_18[31:0] : _GEN_70; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_72 = 4'h6 == _T_310 ? _T_21[31:0] : _GEN_71; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_73 = 4'h7 == _T_310 ? _T_24[31:0] : _GEN_72; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_74 = 4'h8 == _T_310 ? _T_27[31:0] : _GEN_73; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_75 = 4'h9 == _T_310 ? _T_30[31:0] : _GEN_74; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_76 = 4'ha == _T_310 ? _T_33[31:0] : _GEN_75; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_77 = 4'hb == _T_310 ? _T_36[31:0] : _GEN_76; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_78 = 4'hc == _T_310 ? _T_39[31:0] : _GEN_77; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_79 = 4'hd == _T_310 ? _T_42[31:0] : _GEN_78; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_80 = 4'he == _T_310 ? _T_45[31:0] : _GEN_79; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_81 = 4'hf == _T_310 ? _T_48[31:0] : _GEN_80; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1644 = {{1'd0}, _T_310}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_82 = 5'h10 == _GEN_1644 ? _T_51[31:0] : _GEN_81; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_83 = 5'h11 == _GEN_1644 ? _T_54[31:0] : _GEN_82; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_84 = 5'h12 == _GEN_1644 ? _T_57[31:0] : _GEN_83; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_85 = 5'h13 == _GEN_1644 ? _T_60[31:0] : _GEN_84; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_86 = 5'h14 == _GEN_1644 ? _T_63[31:0] : _GEN_85; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_87 = 5'h15 == _GEN_1644 ? _T_66[31:0] : _GEN_86; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_88 = 5'h16 == _GEN_1644 ? _T_69[31:0] : _GEN_87; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_89 = 5'h17 == _GEN_1644 ? _T_72[31:0] : _GEN_88; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_90 = 5'h18 == _GEN_1644 ? _T_75[31:0] : _GEN_89; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_91 = 5'h19 == _GEN_1644 ? _T_78[31:0] : _GEN_90; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_92 = 5'h1a == _GEN_1644 ? _T_81[31:0] : _GEN_91; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_93 = 5'h1b == _GEN_1644 ? _T_84[31:0] : _GEN_92; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_94 = 5'h1c == _GEN_1644 ? _T_87[31:0] : _GEN_93; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_95 = 5'h1d == _GEN_1644 ? _T_90[31:0] : _GEN_94; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_96 = 5'h1e == _GEN_1644 ? _T_93[31:0] : _GEN_95; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_97 = 5'h1f == _GEN_1644 ? io_dataIn_0_bits : _GEN_96; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1660 = {{46'd0}, _GEN_97}; // @[decompressorChisel.scala 32:58]
  wire  _T_314 = _GEN_1660 == _T_313; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_2 = _T_308 ? 1'h0 : _T_314; // @[decompressorChisel.scala 29:35]
  wire  _T_413 = encodedLength_3 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_415 = encodedLength_3 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1692 = {{2'd0}, encodedLength_3}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_417 = 6'h20 - _GEN_1692; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1693 = {{63'd0}, encodedCharacters_3}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_418 = _GEN_1693 << _T_417; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_100 = 4'h1 == _T_415 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_101 = 4'h2 == _T_415 ? _T_9[31:0] : _GEN_100; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_102 = 4'h3 == _T_415 ? _T_12[31:0] : _GEN_101; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_103 = 4'h4 == _T_415 ? _T_15[31:0] : _GEN_102; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_104 = 4'h5 == _T_415 ? _T_18[31:0] : _GEN_103; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_105 = 4'h6 == _T_415 ? _T_21[31:0] : _GEN_104; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_106 = 4'h7 == _T_415 ? _T_24[31:0] : _GEN_105; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_107 = 4'h8 == _T_415 ? _T_27[31:0] : _GEN_106; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_108 = 4'h9 == _T_415 ? _T_30[31:0] : _GEN_107; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_109 = 4'ha == _T_415 ? _T_33[31:0] : _GEN_108; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_110 = 4'hb == _T_415 ? _T_36[31:0] : _GEN_109; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_111 = 4'hc == _T_415 ? _T_39[31:0] : _GEN_110; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_112 = 4'hd == _T_415 ? _T_42[31:0] : _GEN_111; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_113 = 4'he == _T_415 ? _T_45[31:0] : _GEN_112; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_114 = 4'hf == _T_415 ? _T_48[31:0] : _GEN_113; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1694 = {{1'd0}, _T_415}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_115 = 5'h10 == _GEN_1694 ? _T_51[31:0] : _GEN_114; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_116 = 5'h11 == _GEN_1694 ? _T_54[31:0] : _GEN_115; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_117 = 5'h12 == _GEN_1694 ? _T_57[31:0] : _GEN_116; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_118 = 5'h13 == _GEN_1694 ? _T_60[31:0] : _GEN_117; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_119 = 5'h14 == _GEN_1694 ? _T_63[31:0] : _GEN_118; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_120 = 5'h15 == _GEN_1694 ? _T_66[31:0] : _GEN_119; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_121 = 5'h16 == _GEN_1694 ? _T_69[31:0] : _GEN_120; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_122 = 5'h17 == _GEN_1694 ? _T_72[31:0] : _GEN_121; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_123 = 5'h18 == _GEN_1694 ? _T_75[31:0] : _GEN_122; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_124 = 5'h19 == _GEN_1694 ? _T_78[31:0] : _GEN_123; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_125 = 5'h1a == _GEN_1694 ? _T_81[31:0] : _GEN_124; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_126 = 5'h1b == _GEN_1694 ? _T_84[31:0] : _GEN_125; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_127 = 5'h1c == _GEN_1694 ? _T_87[31:0] : _GEN_126; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_128 = 5'h1d == _GEN_1694 ? _T_90[31:0] : _GEN_127; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_129 = 5'h1e == _GEN_1694 ? _T_93[31:0] : _GEN_128; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_130 = 5'h1f == _GEN_1694 ? io_dataIn_0_bits : _GEN_129; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1710 = {{46'd0}, _GEN_130}; // @[decompressorChisel.scala 32:58]
  wire  _T_419 = _GEN_1710 == _T_418; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_3 = _T_413 ? 1'h0 : _T_419; // @[decompressorChisel.scala 29:35]
  wire  _T_518 = encodedLength_4 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_520 = encodedLength_4 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1742 = {{2'd0}, encodedLength_4}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_522 = 6'h20 - _GEN_1742; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1743 = {{63'd0}, encodedCharacters_4}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_523 = _GEN_1743 << _T_522; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_133 = 4'h1 == _T_520 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_134 = 4'h2 == _T_520 ? _T_9[31:0] : _GEN_133; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_135 = 4'h3 == _T_520 ? _T_12[31:0] : _GEN_134; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_136 = 4'h4 == _T_520 ? _T_15[31:0] : _GEN_135; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_137 = 4'h5 == _T_520 ? _T_18[31:0] : _GEN_136; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_138 = 4'h6 == _T_520 ? _T_21[31:0] : _GEN_137; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_139 = 4'h7 == _T_520 ? _T_24[31:0] : _GEN_138; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_140 = 4'h8 == _T_520 ? _T_27[31:0] : _GEN_139; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_141 = 4'h9 == _T_520 ? _T_30[31:0] : _GEN_140; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_142 = 4'ha == _T_520 ? _T_33[31:0] : _GEN_141; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_143 = 4'hb == _T_520 ? _T_36[31:0] : _GEN_142; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_144 = 4'hc == _T_520 ? _T_39[31:0] : _GEN_143; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_145 = 4'hd == _T_520 ? _T_42[31:0] : _GEN_144; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_146 = 4'he == _T_520 ? _T_45[31:0] : _GEN_145; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_147 = 4'hf == _T_520 ? _T_48[31:0] : _GEN_146; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1744 = {{1'd0}, _T_520}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_148 = 5'h10 == _GEN_1744 ? _T_51[31:0] : _GEN_147; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_149 = 5'h11 == _GEN_1744 ? _T_54[31:0] : _GEN_148; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_150 = 5'h12 == _GEN_1744 ? _T_57[31:0] : _GEN_149; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_151 = 5'h13 == _GEN_1744 ? _T_60[31:0] : _GEN_150; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_152 = 5'h14 == _GEN_1744 ? _T_63[31:0] : _GEN_151; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_153 = 5'h15 == _GEN_1744 ? _T_66[31:0] : _GEN_152; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_154 = 5'h16 == _GEN_1744 ? _T_69[31:0] : _GEN_153; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_155 = 5'h17 == _GEN_1744 ? _T_72[31:0] : _GEN_154; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_156 = 5'h18 == _GEN_1744 ? _T_75[31:0] : _GEN_155; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_157 = 5'h19 == _GEN_1744 ? _T_78[31:0] : _GEN_156; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_158 = 5'h1a == _GEN_1744 ? _T_81[31:0] : _GEN_157; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_159 = 5'h1b == _GEN_1744 ? _T_84[31:0] : _GEN_158; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_160 = 5'h1c == _GEN_1744 ? _T_87[31:0] : _GEN_159; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_161 = 5'h1d == _GEN_1744 ? _T_90[31:0] : _GEN_160; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_162 = 5'h1e == _GEN_1744 ? _T_93[31:0] : _GEN_161; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_163 = 5'h1f == _GEN_1744 ? io_dataIn_0_bits : _GEN_162; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1760 = {{46'd0}, _GEN_163}; // @[decompressorChisel.scala 32:58]
  wire  _T_524 = _GEN_1760 == _T_523; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_4 = _T_518 ? 1'h0 : _T_524; // @[decompressorChisel.scala 29:35]
  wire  _T_623 = encodedLength_5 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_625 = encodedLength_5 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1792 = {{2'd0}, encodedLength_5}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_627 = 6'h20 - _GEN_1792; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1793 = {{63'd0}, encodedCharacters_5}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_628 = _GEN_1793 << _T_627; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_166 = 4'h1 == _T_625 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_167 = 4'h2 == _T_625 ? _T_9[31:0] : _GEN_166; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_168 = 4'h3 == _T_625 ? _T_12[31:0] : _GEN_167; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_169 = 4'h4 == _T_625 ? _T_15[31:0] : _GEN_168; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_170 = 4'h5 == _T_625 ? _T_18[31:0] : _GEN_169; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_171 = 4'h6 == _T_625 ? _T_21[31:0] : _GEN_170; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_172 = 4'h7 == _T_625 ? _T_24[31:0] : _GEN_171; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_173 = 4'h8 == _T_625 ? _T_27[31:0] : _GEN_172; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_174 = 4'h9 == _T_625 ? _T_30[31:0] : _GEN_173; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_175 = 4'ha == _T_625 ? _T_33[31:0] : _GEN_174; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_176 = 4'hb == _T_625 ? _T_36[31:0] : _GEN_175; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_177 = 4'hc == _T_625 ? _T_39[31:0] : _GEN_176; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_178 = 4'hd == _T_625 ? _T_42[31:0] : _GEN_177; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_179 = 4'he == _T_625 ? _T_45[31:0] : _GEN_178; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_180 = 4'hf == _T_625 ? _T_48[31:0] : _GEN_179; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1794 = {{1'd0}, _T_625}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_181 = 5'h10 == _GEN_1794 ? _T_51[31:0] : _GEN_180; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_182 = 5'h11 == _GEN_1794 ? _T_54[31:0] : _GEN_181; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_183 = 5'h12 == _GEN_1794 ? _T_57[31:0] : _GEN_182; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_184 = 5'h13 == _GEN_1794 ? _T_60[31:0] : _GEN_183; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_185 = 5'h14 == _GEN_1794 ? _T_63[31:0] : _GEN_184; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_186 = 5'h15 == _GEN_1794 ? _T_66[31:0] : _GEN_185; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_187 = 5'h16 == _GEN_1794 ? _T_69[31:0] : _GEN_186; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_188 = 5'h17 == _GEN_1794 ? _T_72[31:0] : _GEN_187; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_189 = 5'h18 == _GEN_1794 ? _T_75[31:0] : _GEN_188; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_190 = 5'h19 == _GEN_1794 ? _T_78[31:0] : _GEN_189; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_191 = 5'h1a == _GEN_1794 ? _T_81[31:0] : _GEN_190; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_192 = 5'h1b == _GEN_1794 ? _T_84[31:0] : _GEN_191; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_193 = 5'h1c == _GEN_1794 ? _T_87[31:0] : _GEN_192; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_194 = 5'h1d == _GEN_1794 ? _T_90[31:0] : _GEN_193; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_195 = 5'h1e == _GEN_1794 ? _T_93[31:0] : _GEN_194; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_196 = 5'h1f == _GEN_1794 ? io_dataIn_0_bits : _GEN_195; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1810 = {{46'd0}, _GEN_196}; // @[decompressorChisel.scala 32:58]
  wire  _T_629 = _GEN_1810 == _T_628; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_5 = _T_623 ? 1'h0 : _T_629; // @[decompressorChisel.scala 29:35]
  wire  _T_728 = encodedLength_6 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_730 = encodedLength_6 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1842 = {{2'd0}, encodedLength_6}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_732 = 6'h20 - _GEN_1842; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1843 = {{63'd0}, encodedCharacters_6}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_733 = _GEN_1843 << _T_732; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_199 = 4'h1 == _T_730 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_200 = 4'h2 == _T_730 ? _T_9[31:0] : _GEN_199; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_201 = 4'h3 == _T_730 ? _T_12[31:0] : _GEN_200; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_202 = 4'h4 == _T_730 ? _T_15[31:0] : _GEN_201; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_203 = 4'h5 == _T_730 ? _T_18[31:0] : _GEN_202; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_204 = 4'h6 == _T_730 ? _T_21[31:0] : _GEN_203; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_205 = 4'h7 == _T_730 ? _T_24[31:0] : _GEN_204; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_206 = 4'h8 == _T_730 ? _T_27[31:0] : _GEN_205; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_207 = 4'h9 == _T_730 ? _T_30[31:0] : _GEN_206; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_208 = 4'ha == _T_730 ? _T_33[31:0] : _GEN_207; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_209 = 4'hb == _T_730 ? _T_36[31:0] : _GEN_208; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_210 = 4'hc == _T_730 ? _T_39[31:0] : _GEN_209; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_211 = 4'hd == _T_730 ? _T_42[31:0] : _GEN_210; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_212 = 4'he == _T_730 ? _T_45[31:0] : _GEN_211; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_213 = 4'hf == _T_730 ? _T_48[31:0] : _GEN_212; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1844 = {{1'd0}, _T_730}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_214 = 5'h10 == _GEN_1844 ? _T_51[31:0] : _GEN_213; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_215 = 5'h11 == _GEN_1844 ? _T_54[31:0] : _GEN_214; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_216 = 5'h12 == _GEN_1844 ? _T_57[31:0] : _GEN_215; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_217 = 5'h13 == _GEN_1844 ? _T_60[31:0] : _GEN_216; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_218 = 5'h14 == _GEN_1844 ? _T_63[31:0] : _GEN_217; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_219 = 5'h15 == _GEN_1844 ? _T_66[31:0] : _GEN_218; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_220 = 5'h16 == _GEN_1844 ? _T_69[31:0] : _GEN_219; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_221 = 5'h17 == _GEN_1844 ? _T_72[31:0] : _GEN_220; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_222 = 5'h18 == _GEN_1844 ? _T_75[31:0] : _GEN_221; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_223 = 5'h19 == _GEN_1844 ? _T_78[31:0] : _GEN_222; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_224 = 5'h1a == _GEN_1844 ? _T_81[31:0] : _GEN_223; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_225 = 5'h1b == _GEN_1844 ? _T_84[31:0] : _GEN_224; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_226 = 5'h1c == _GEN_1844 ? _T_87[31:0] : _GEN_225; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_227 = 5'h1d == _GEN_1844 ? _T_90[31:0] : _GEN_226; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_228 = 5'h1e == _GEN_1844 ? _T_93[31:0] : _GEN_227; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_229 = 5'h1f == _GEN_1844 ? io_dataIn_0_bits : _GEN_228; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1860 = {{46'd0}, _GEN_229}; // @[decompressorChisel.scala 32:58]
  wire  _T_734 = _GEN_1860 == _T_733; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_6 = _T_728 ? 1'h0 : _T_734; // @[decompressorChisel.scala 29:35]
  wire  _T_833 = encodedLength_7 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_835 = encodedLength_7 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1892 = {{2'd0}, encodedLength_7}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_837 = 6'h20 - _GEN_1892; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1893 = {{63'd0}, encodedCharacters_7}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_838 = _GEN_1893 << _T_837; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_232 = 4'h1 == _T_835 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_233 = 4'h2 == _T_835 ? _T_9[31:0] : _GEN_232; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_234 = 4'h3 == _T_835 ? _T_12[31:0] : _GEN_233; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_235 = 4'h4 == _T_835 ? _T_15[31:0] : _GEN_234; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_236 = 4'h5 == _T_835 ? _T_18[31:0] : _GEN_235; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_237 = 4'h6 == _T_835 ? _T_21[31:0] : _GEN_236; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_238 = 4'h7 == _T_835 ? _T_24[31:0] : _GEN_237; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_239 = 4'h8 == _T_835 ? _T_27[31:0] : _GEN_238; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_240 = 4'h9 == _T_835 ? _T_30[31:0] : _GEN_239; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_241 = 4'ha == _T_835 ? _T_33[31:0] : _GEN_240; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_242 = 4'hb == _T_835 ? _T_36[31:0] : _GEN_241; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_243 = 4'hc == _T_835 ? _T_39[31:0] : _GEN_242; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_244 = 4'hd == _T_835 ? _T_42[31:0] : _GEN_243; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_245 = 4'he == _T_835 ? _T_45[31:0] : _GEN_244; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_246 = 4'hf == _T_835 ? _T_48[31:0] : _GEN_245; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1894 = {{1'd0}, _T_835}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_247 = 5'h10 == _GEN_1894 ? _T_51[31:0] : _GEN_246; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_248 = 5'h11 == _GEN_1894 ? _T_54[31:0] : _GEN_247; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_249 = 5'h12 == _GEN_1894 ? _T_57[31:0] : _GEN_248; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_250 = 5'h13 == _GEN_1894 ? _T_60[31:0] : _GEN_249; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_251 = 5'h14 == _GEN_1894 ? _T_63[31:0] : _GEN_250; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_252 = 5'h15 == _GEN_1894 ? _T_66[31:0] : _GEN_251; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_253 = 5'h16 == _GEN_1894 ? _T_69[31:0] : _GEN_252; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_254 = 5'h17 == _GEN_1894 ? _T_72[31:0] : _GEN_253; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_255 = 5'h18 == _GEN_1894 ? _T_75[31:0] : _GEN_254; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_256 = 5'h19 == _GEN_1894 ? _T_78[31:0] : _GEN_255; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_257 = 5'h1a == _GEN_1894 ? _T_81[31:0] : _GEN_256; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_258 = 5'h1b == _GEN_1894 ? _T_84[31:0] : _GEN_257; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_259 = 5'h1c == _GEN_1894 ? _T_87[31:0] : _GEN_258; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_260 = 5'h1d == _GEN_1894 ? _T_90[31:0] : _GEN_259; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_261 = 5'h1e == _GEN_1894 ? _T_93[31:0] : _GEN_260; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_262 = 5'h1f == _GEN_1894 ? io_dataIn_0_bits : _GEN_261; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1910 = {{46'd0}, _GEN_262}; // @[decompressorChisel.scala 32:58]
  wire  _T_839 = _GEN_1910 == _T_838; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_7 = _T_833 ? 1'h0 : _T_839; // @[decompressorChisel.scala 29:35]
  wire  _T_938 = encodedLength_8 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_940 = encodedLength_8 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1942 = {{2'd0}, encodedLength_8}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_942 = 6'h20 - _GEN_1942; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1943 = {{63'd0}, encodedCharacters_8}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_943 = _GEN_1943 << _T_942; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_265 = 4'h1 == _T_940 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_266 = 4'h2 == _T_940 ? _T_9[31:0] : _GEN_265; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_267 = 4'h3 == _T_940 ? _T_12[31:0] : _GEN_266; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_268 = 4'h4 == _T_940 ? _T_15[31:0] : _GEN_267; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_269 = 4'h5 == _T_940 ? _T_18[31:0] : _GEN_268; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_270 = 4'h6 == _T_940 ? _T_21[31:0] : _GEN_269; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_271 = 4'h7 == _T_940 ? _T_24[31:0] : _GEN_270; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_272 = 4'h8 == _T_940 ? _T_27[31:0] : _GEN_271; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_273 = 4'h9 == _T_940 ? _T_30[31:0] : _GEN_272; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_274 = 4'ha == _T_940 ? _T_33[31:0] : _GEN_273; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_275 = 4'hb == _T_940 ? _T_36[31:0] : _GEN_274; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_276 = 4'hc == _T_940 ? _T_39[31:0] : _GEN_275; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_277 = 4'hd == _T_940 ? _T_42[31:0] : _GEN_276; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_278 = 4'he == _T_940 ? _T_45[31:0] : _GEN_277; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_279 = 4'hf == _T_940 ? _T_48[31:0] : _GEN_278; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1944 = {{1'd0}, _T_940}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_280 = 5'h10 == _GEN_1944 ? _T_51[31:0] : _GEN_279; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_281 = 5'h11 == _GEN_1944 ? _T_54[31:0] : _GEN_280; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_282 = 5'h12 == _GEN_1944 ? _T_57[31:0] : _GEN_281; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_283 = 5'h13 == _GEN_1944 ? _T_60[31:0] : _GEN_282; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_284 = 5'h14 == _GEN_1944 ? _T_63[31:0] : _GEN_283; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_285 = 5'h15 == _GEN_1944 ? _T_66[31:0] : _GEN_284; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_286 = 5'h16 == _GEN_1944 ? _T_69[31:0] : _GEN_285; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_287 = 5'h17 == _GEN_1944 ? _T_72[31:0] : _GEN_286; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_288 = 5'h18 == _GEN_1944 ? _T_75[31:0] : _GEN_287; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_289 = 5'h19 == _GEN_1944 ? _T_78[31:0] : _GEN_288; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_290 = 5'h1a == _GEN_1944 ? _T_81[31:0] : _GEN_289; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_291 = 5'h1b == _GEN_1944 ? _T_84[31:0] : _GEN_290; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_292 = 5'h1c == _GEN_1944 ? _T_87[31:0] : _GEN_291; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_293 = 5'h1d == _GEN_1944 ? _T_90[31:0] : _GEN_292; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_294 = 5'h1e == _GEN_1944 ? _T_93[31:0] : _GEN_293; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_295 = 5'h1f == _GEN_1944 ? io_dataIn_0_bits : _GEN_294; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_1960 = {{46'd0}, _GEN_295}; // @[decompressorChisel.scala 32:58]
  wire  _T_944 = _GEN_1960 == _T_943; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_8 = _T_938 ? 1'h0 : _T_944; // @[decompressorChisel.scala 29:35]
  wire  _T_1043 = encodedLength_9 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1045 = encodedLength_9 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_1992 = {{2'd0}, encodedLength_9}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1047 = 6'h20 - _GEN_1992; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_1993 = {{63'd0}, encodedCharacters_9}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1048 = _GEN_1993 << _T_1047; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_298 = 4'h1 == _T_1045 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_299 = 4'h2 == _T_1045 ? _T_9[31:0] : _GEN_298; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_300 = 4'h3 == _T_1045 ? _T_12[31:0] : _GEN_299; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_301 = 4'h4 == _T_1045 ? _T_15[31:0] : _GEN_300; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_302 = 4'h5 == _T_1045 ? _T_18[31:0] : _GEN_301; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_303 = 4'h6 == _T_1045 ? _T_21[31:0] : _GEN_302; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_304 = 4'h7 == _T_1045 ? _T_24[31:0] : _GEN_303; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_305 = 4'h8 == _T_1045 ? _T_27[31:0] : _GEN_304; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_306 = 4'h9 == _T_1045 ? _T_30[31:0] : _GEN_305; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_307 = 4'ha == _T_1045 ? _T_33[31:0] : _GEN_306; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_308 = 4'hb == _T_1045 ? _T_36[31:0] : _GEN_307; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_309 = 4'hc == _T_1045 ? _T_39[31:0] : _GEN_308; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_310 = 4'hd == _T_1045 ? _T_42[31:0] : _GEN_309; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_311 = 4'he == _T_1045 ? _T_45[31:0] : _GEN_310; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_312 = 4'hf == _T_1045 ? _T_48[31:0] : _GEN_311; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_1994 = {{1'd0}, _T_1045}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_313 = 5'h10 == _GEN_1994 ? _T_51[31:0] : _GEN_312; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_314 = 5'h11 == _GEN_1994 ? _T_54[31:0] : _GEN_313; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_315 = 5'h12 == _GEN_1994 ? _T_57[31:0] : _GEN_314; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_316 = 5'h13 == _GEN_1994 ? _T_60[31:0] : _GEN_315; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_317 = 5'h14 == _GEN_1994 ? _T_63[31:0] : _GEN_316; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_318 = 5'h15 == _GEN_1994 ? _T_66[31:0] : _GEN_317; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_319 = 5'h16 == _GEN_1994 ? _T_69[31:0] : _GEN_318; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_320 = 5'h17 == _GEN_1994 ? _T_72[31:0] : _GEN_319; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_321 = 5'h18 == _GEN_1994 ? _T_75[31:0] : _GEN_320; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_322 = 5'h19 == _GEN_1994 ? _T_78[31:0] : _GEN_321; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_323 = 5'h1a == _GEN_1994 ? _T_81[31:0] : _GEN_322; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_324 = 5'h1b == _GEN_1994 ? _T_84[31:0] : _GEN_323; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_325 = 5'h1c == _GEN_1994 ? _T_87[31:0] : _GEN_324; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_326 = 5'h1d == _GEN_1994 ? _T_90[31:0] : _GEN_325; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_327 = 5'h1e == _GEN_1994 ? _T_93[31:0] : _GEN_326; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_328 = 5'h1f == _GEN_1994 ? io_dataIn_0_bits : _GEN_327; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2010 = {{46'd0}, _GEN_328}; // @[decompressorChisel.scala 32:58]
  wire  _T_1049 = _GEN_2010 == _T_1048; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_9 = _T_1043 ? 1'h0 : _T_1049; // @[decompressorChisel.scala 29:35]
  wire  _T_1148 = encodedLength_10 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1150 = encodedLength_10 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2042 = {{2'd0}, encodedLength_10}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1152 = 6'h20 - _GEN_2042; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2043 = {{63'd0}, encodedCharacters_10}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1153 = _GEN_2043 << _T_1152; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_331 = 4'h1 == _T_1150 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_332 = 4'h2 == _T_1150 ? _T_9[31:0] : _GEN_331; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_333 = 4'h3 == _T_1150 ? _T_12[31:0] : _GEN_332; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_334 = 4'h4 == _T_1150 ? _T_15[31:0] : _GEN_333; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_335 = 4'h5 == _T_1150 ? _T_18[31:0] : _GEN_334; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_336 = 4'h6 == _T_1150 ? _T_21[31:0] : _GEN_335; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_337 = 4'h7 == _T_1150 ? _T_24[31:0] : _GEN_336; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_338 = 4'h8 == _T_1150 ? _T_27[31:0] : _GEN_337; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_339 = 4'h9 == _T_1150 ? _T_30[31:0] : _GEN_338; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_340 = 4'ha == _T_1150 ? _T_33[31:0] : _GEN_339; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_341 = 4'hb == _T_1150 ? _T_36[31:0] : _GEN_340; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_342 = 4'hc == _T_1150 ? _T_39[31:0] : _GEN_341; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_343 = 4'hd == _T_1150 ? _T_42[31:0] : _GEN_342; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_344 = 4'he == _T_1150 ? _T_45[31:0] : _GEN_343; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_345 = 4'hf == _T_1150 ? _T_48[31:0] : _GEN_344; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2044 = {{1'd0}, _T_1150}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_346 = 5'h10 == _GEN_2044 ? _T_51[31:0] : _GEN_345; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_347 = 5'h11 == _GEN_2044 ? _T_54[31:0] : _GEN_346; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_348 = 5'h12 == _GEN_2044 ? _T_57[31:0] : _GEN_347; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_349 = 5'h13 == _GEN_2044 ? _T_60[31:0] : _GEN_348; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_350 = 5'h14 == _GEN_2044 ? _T_63[31:0] : _GEN_349; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_351 = 5'h15 == _GEN_2044 ? _T_66[31:0] : _GEN_350; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_352 = 5'h16 == _GEN_2044 ? _T_69[31:0] : _GEN_351; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_353 = 5'h17 == _GEN_2044 ? _T_72[31:0] : _GEN_352; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_354 = 5'h18 == _GEN_2044 ? _T_75[31:0] : _GEN_353; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_355 = 5'h19 == _GEN_2044 ? _T_78[31:0] : _GEN_354; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_356 = 5'h1a == _GEN_2044 ? _T_81[31:0] : _GEN_355; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_357 = 5'h1b == _GEN_2044 ? _T_84[31:0] : _GEN_356; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_358 = 5'h1c == _GEN_2044 ? _T_87[31:0] : _GEN_357; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_359 = 5'h1d == _GEN_2044 ? _T_90[31:0] : _GEN_358; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_360 = 5'h1e == _GEN_2044 ? _T_93[31:0] : _GEN_359; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_361 = 5'h1f == _GEN_2044 ? io_dataIn_0_bits : _GEN_360; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2060 = {{46'd0}, _GEN_361}; // @[decompressorChisel.scala 32:58]
  wire  _T_1154 = _GEN_2060 == _T_1153; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_10 = _T_1148 ? 1'h0 : _T_1154; // @[decompressorChisel.scala 29:35]
  wire  _T_1253 = encodedLength_11 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1255 = encodedLength_11 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2092 = {{2'd0}, encodedLength_11}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1257 = 6'h20 - _GEN_2092; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2093 = {{63'd0}, encodedCharacters_11}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1258 = _GEN_2093 << _T_1257; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_364 = 4'h1 == _T_1255 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_365 = 4'h2 == _T_1255 ? _T_9[31:0] : _GEN_364; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_366 = 4'h3 == _T_1255 ? _T_12[31:0] : _GEN_365; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_367 = 4'h4 == _T_1255 ? _T_15[31:0] : _GEN_366; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_368 = 4'h5 == _T_1255 ? _T_18[31:0] : _GEN_367; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_369 = 4'h6 == _T_1255 ? _T_21[31:0] : _GEN_368; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_370 = 4'h7 == _T_1255 ? _T_24[31:0] : _GEN_369; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_371 = 4'h8 == _T_1255 ? _T_27[31:0] : _GEN_370; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_372 = 4'h9 == _T_1255 ? _T_30[31:0] : _GEN_371; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_373 = 4'ha == _T_1255 ? _T_33[31:0] : _GEN_372; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_374 = 4'hb == _T_1255 ? _T_36[31:0] : _GEN_373; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_375 = 4'hc == _T_1255 ? _T_39[31:0] : _GEN_374; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_376 = 4'hd == _T_1255 ? _T_42[31:0] : _GEN_375; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_377 = 4'he == _T_1255 ? _T_45[31:0] : _GEN_376; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_378 = 4'hf == _T_1255 ? _T_48[31:0] : _GEN_377; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2094 = {{1'd0}, _T_1255}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_379 = 5'h10 == _GEN_2094 ? _T_51[31:0] : _GEN_378; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_380 = 5'h11 == _GEN_2094 ? _T_54[31:0] : _GEN_379; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_381 = 5'h12 == _GEN_2094 ? _T_57[31:0] : _GEN_380; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_382 = 5'h13 == _GEN_2094 ? _T_60[31:0] : _GEN_381; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_383 = 5'h14 == _GEN_2094 ? _T_63[31:0] : _GEN_382; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_384 = 5'h15 == _GEN_2094 ? _T_66[31:0] : _GEN_383; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_385 = 5'h16 == _GEN_2094 ? _T_69[31:0] : _GEN_384; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_386 = 5'h17 == _GEN_2094 ? _T_72[31:0] : _GEN_385; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_387 = 5'h18 == _GEN_2094 ? _T_75[31:0] : _GEN_386; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_388 = 5'h19 == _GEN_2094 ? _T_78[31:0] : _GEN_387; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_389 = 5'h1a == _GEN_2094 ? _T_81[31:0] : _GEN_388; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_390 = 5'h1b == _GEN_2094 ? _T_84[31:0] : _GEN_389; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_391 = 5'h1c == _GEN_2094 ? _T_87[31:0] : _GEN_390; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_392 = 5'h1d == _GEN_2094 ? _T_90[31:0] : _GEN_391; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_393 = 5'h1e == _GEN_2094 ? _T_93[31:0] : _GEN_392; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_394 = 5'h1f == _GEN_2094 ? io_dataIn_0_bits : _GEN_393; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2110 = {{46'd0}, _GEN_394}; // @[decompressorChisel.scala 32:58]
  wire  _T_1259 = _GEN_2110 == _T_1258; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_11 = _T_1253 ? 1'h0 : _T_1259; // @[decompressorChisel.scala 29:35]
  wire  _T_1358 = encodedLength_12 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1360 = encodedLength_12 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2142 = {{2'd0}, encodedLength_12}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1362 = 6'h20 - _GEN_2142; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2143 = {{63'd0}, encodedCharacters_12}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1363 = _GEN_2143 << _T_1362; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_397 = 4'h1 == _T_1360 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_398 = 4'h2 == _T_1360 ? _T_9[31:0] : _GEN_397; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_399 = 4'h3 == _T_1360 ? _T_12[31:0] : _GEN_398; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_400 = 4'h4 == _T_1360 ? _T_15[31:0] : _GEN_399; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_401 = 4'h5 == _T_1360 ? _T_18[31:0] : _GEN_400; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_402 = 4'h6 == _T_1360 ? _T_21[31:0] : _GEN_401; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_403 = 4'h7 == _T_1360 ? _T_24[31:0] : _GEN_402; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_404 = 4'h8 == _T_1360 ? _T_27[31:0] : _GEN_403; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_405 = 4'h9 == _T_1360 ? _T_30[31:0] : _GEN_404; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_406 = 4'ha == _T_1360 ? _T_33[31:0] : _GEN_405; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_407 = 4'hb == _T_1360 ? _T_36[31:0] : _GEN_406; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_408 = 4'hc == _T_1360 ? _T_39[31:0] : _GEN_407; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_409 = 4'hd == _T_1360 ? _T_42[31:0] : _GEN_408; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_410 = 4'he == _T_1360 ? _T_45[31:0] : _GEN_409; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_411 = 4'hf == _T_1360 ? _T_48[31:0] : _GEN_410; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2144 = {{1'd0}, _T_1360}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_412 = 5'h10 == _GEN_2144 ? _T_51[31:0] : _GEN_411; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_413 = 5'h11 == _GEN_2144 ? _T_54[31:0] : _GEN_412; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_414 = 5'h12 == _GEN_2144 ? _T_57[31:0] : _GEN_413; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_415 = 5'h13 == _GEN_2144 ? _T_60[31:0] : _GEN_414; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_416 = 5'h14 == _GEN_2144 ? _T_63[31:0] : _GEN_415; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_417 = 5'h15 == _GEN_2144 ? _T_66[31:0] : _GEN_416; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_418 = 5'h16 == _GEN_2144 ? _T_69[31:0] : _GEN_417; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_419 = 5'h17 == _GEN_2144 ? _T_72[31:0] : _GEN_418; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_420 = 5'h18 == _GEN_2144 ? _T_75[31:0] : _GEN_419; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_421 = 5'h19 == _GEN_2144 ? _T_78[31:0] : _GEN_420; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_422 = 5'h1a == _GEN_2144 ? _T_81[31:0] : _GEN_421; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_423 = 5'h1b == _GEN_2144 ? _T_84[31:0] : _GEN_422; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_424 = 5'h1c == _GEN_2144 ? _T_87[31:0] : _GEN_423; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_425 = 5'h1d == _GEN_2144 ? _T_90[31:0] : _GEN_424; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_426 = 5'h1e == _GEN_2144 ? _T_93[31:0] : _GEN_425; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_427 = 5'h1f == _GEN_2144 ? io_dataIn_0_bits : _GEN_426; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2160 = {{46'd0}, _GEN_427}; // @[decompressorChisel.scala 32:58]
  wire  _T_1364 = _GEN_2160 == _T_1363; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_12 = _T_1358 ? 1'h0 : _T_1364; // @[decompressorChisel.scala 29:35]
  wire  _T_1463 = encodedLength_13 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1465 = encodedLength_13 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2192 = {{2'd0}, encodedLength_13}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1467 = 6'h20 - _GEN_2192; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2193 = {{63'd0}, encodedCharacters_13}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1468 = _GEN_2193 << _T_1467; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_430 = 4'h1 == _T_1465 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_431 = 4'h2 == _T_1465 ? _T_9[31:0] : _GEN_430; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_432 = 4'h3 == _T_1465 ? _T_12[31:0] : _GEN_431; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_433 = 4'h4 == _T_1465 ? _T_15[31:0] : _GEN_432; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_434 = 4'h5 == _T_1465 ? _T_18[31:0] : _GEN_433; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_435 = 4'h6 == _T_1465 ? _T_21[31:0] : _GEN_434; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_436 = 4'h7 == _T_1465 ? _T_24[31:0] : _GEN_435; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_437 = 4'h8 == _T_1465 ? _T_27[31:0] : _GEN_436; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_438 = 4'h9 == _T_1465 ? _T_30[31:0] : _GEN_437; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_439 = 4'ha == _T_1465 ? _T_33[31:0] : _GEN_438; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_440 = 4'hb == _T_1465 ? _T_36[31:0] : _GEN_439; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_441 = 4'hc == _T_1465 ? _T_39[31:0] : _GEN_440; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_442 = 4'hd == _T_1465 ? _T_42[31:0] : _GEN_441; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_443 = 4'he == _T_1465 ? _T_45[31:0] : _GEN_442; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_444 = 4'hf == _T_1465 ? _T_48[31:0] : _GEN_443; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2194 = {{1'd0}, _T_1465}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_445 = 5'h10 == _GEN_2194 ? _T_51[31:0] : _GEN_444; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_446 = 5'h11 == _GEN_2194 ? _T_54[31:0] : _GEN_445; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_447 = 5'h12 == _GEN_2194 ? _T_57[31:0] : _GEN_446; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_448 = 5'h13 == _GEN_2194 ? _T_60[31:0] : _GEN_447; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_449 = 5'h14 == _GEN_2194 ? _T_63[31:0] : _GEN_448; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_450 = 5'h15 == _GEN_2194 ? _T_66[31:0] : _GEN_449; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_451 = 5'h16 == _GEN_2194 ? _T_69[31:0] : _GEN_450; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_452 = 5'h17 == _GEN_2194 ? _T_72[31:0] : _GEN_451; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_453 = 5'h18 == _GEN_2194 ? _T_75[31:0] : _GEN_452; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_454 = 5'h19 == _GEN_2194 ? _T_78[31:0] : _GEN_453; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_455 = 5'h1a == _GEN_2194 ? _T_81[31:0] : _GEN_454; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_456 = 5'h1b == _GEN_2194 ? _T_84[31:0] : _GEN_455; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_457 = 5'h1c == _GEN_2194 ? _T_87[31:0] : _GEN_456; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_458 = 5'h1d == _GEN_2194 ? _T_90[31:0] : _GEN_457; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_459 = 5'h1e == _GEN_2194 ? _T_93[31:0] : _GEN_458; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_460 = 5'h1f == _GEN_2194 ? io_dataIn_0_bits : _GEN_459; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2210 = {{46'd0}, _GEN_460}; // @[decompressorChisel.scala 32:58]
  wire  _T_1469 = _GEN_2210 == _T_1468; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_13 = _T_1463 ? 1'h0 : _T_1469; // @[decompressorChisel.scala 29:35]
  wire  _T_1568 = encodedLength_14 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1570 = encodedLength_14 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2242 = {{2'd0}, encodedLength_14}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1572 = 6'h20 - _GEN_2242; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2243 = {{63'd0}, encodedCharacters_14}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1573 = _GEN_2243 << _T_1572; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_463 = 4'h1 == _T_1570 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_464 = 4'h2 == _T_1570 ? _T_9[31:0] : _GEN_463; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_465 = 4'h3 == _T_1570 ? _T_12[31:0] : _GEN_464; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_466 = 4'h4 == _T_1570 ? _T_15[31:0] : _GEN_465; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_467 = 4'h5 == _T_1570 ? _T_18[31:0] : _GEN_466; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_468 = 4'h6 == _T_1570 ? _T_21[31:0] : _GEN_467; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_469 = 4'h7 == _T_1570 ? _T_24[31:0] : _GEN_468; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_470 = 4'h8 == _T_1570 ? _T_27[31:0] : _GEN_469; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_471 = 4'h9 == _T_1570 ? _T_30[31:0] : _GEN_470; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_472 = 4'ha == _T_1570 ? _T_33[31:0] : _GEN_471; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_473 = 4'hb == _T_1570 ? _T_36[31:0] : _GEN_472; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_474 = 4'hc == _T_1570 ? _T_39[31:0] : _GEN_473; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_475 = 4'hd == _T_1570 ? _T_42[31:0] : _GEN_474; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_476 = 4'he == _T_1570 ? _T_45[31:0] : _GEN_475; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_477 = 4'hf == _T_1570 ? _T_48[31:0] : _GEN_476; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2244 = {{1'd0}, _T_1570}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_478 = 5'h10 == _GEN_2244 ? _T_51[31:0] : _GEN_477; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_479 = 5'h11 == _GEN_2244 ? _T_54[31:0] : _GEN_478; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_480 = 5'h12 == _GEN_2244 ? _T_57[31:0] : _GEN_479; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_481 = 5'h13 == _GEN_2244 ? _T_60[31:0] : _GEN_480; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_482 = 5'h14 == _GEN_2244 ? _T_63[31:0] : _GEN_481; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_483 = 5'h15 == _GEN_2244 ? _T_66[31:0] : _GEN_482; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_484 = 5'h16 == _GEN_2244 ? _T_69[31:0] : _GEN_483; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_485 = 5'h17 == _GEN_2244 ? _T_72[31:0] : _GEN_484; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_486 = 5'h18 == _GEN_2244 ? _T_75[31:0] : _GEN_485; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_487 = 5'h19 == _GEN_2244 ? _T_78[31:0] : _GEN_486; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_488 = 5'h1a == _GEN_2244 ? _T_81[31:0] : _GEN_487; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_489 = 5'h1b == _GEN_2244 ? _T_84[31:0] : _GEN_488; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_490 = 5'h1c == _GEN_2244 ? _T_87[31:0] : _GEN_489; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_491 = 5'h1d == _GEN_2244 ? _T_90[31:0] : _GEN_490; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_492 = 5'h1e == _GEN_2244 ? _T_93[31:0] : _GEN_491; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_493 = 5'h1f == _GEN_2244 ? io_dataIn_0_bits : _GEN_492; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2260 = {{46'd0}, _GEN_493}; // @[decompressorChisel.scala 32:58]
  wire  _T_1574 = _GEN_2260 == _T_1573; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_14 = _T_1568 ? 1'h0 : _T_1574; // @[decompressorChisel.scala 29:35]
  wire  _T_1673 = encodedLength_15 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1675 = encodedLength_15 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2292 = {{2'd0}, encodedLength_15}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1677 = 6'h20 - _GEN_2292; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2293 = {{63'd0}, encodedCharacters_15}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1678 = _GEN_2293 << _T_1677; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_496 = 4'h1 == _T_1675 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_497 = 4'h2 == _T_1675 ? _T_9[31:0] : _GEN_496; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_498 = 4'h3 == _T_1675 ? _T_12[31:0] : _GEN_497; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_499 = 4'h4 == _T_1675 ? _T_15[31:0] : _GEN_498; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_500 = 4'h5 == _T_1675 ? _T_18[31:0] : _GEN_499; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_501 = 4'h6 == _T_1675 ? _T_21[31:0] : _GEN_500; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_502 = 4'h7 == _T_1675 ? _T_24[31:0] : _GEN_501; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_503 = 4'h8 == _T_1675 ? _T_27[31:0] : _GEN_502; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_504 = 4'h9 == _T_1675 ? _T_30[31:0] : _GEN_503; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_505 = 4'ha == _T_1675 ? _T_33[31:0] : _GEN_504; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_506 = 4'hb == _T_1675 ? _T_36[31:0] : _GEN_505; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_507 = 4'hc == _T_1675 ? _T_39[31:0] : _GEN_506; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_508 = 4'hd == _T_1675 ? _T_42[31:0] : _GEN_507; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_509 = 4'he == _T_1675 ? _T_45[31:0] : _GEN_508; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_510 = 4'hf == _T_1675 ? _T_48[31:0] : _GEN_509; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2294 = {{1'd0}, _T_1675}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_511 = 5'h10 == _GEN_2294 ? _T_51[31:0] : _GEN_510; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_512 = 5'h11 == _GEN_2294 ? _T_54[31:0] : _GEN_511; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_513 = 5'h12 == _GEN_2294 ? _T_57[31:0] : _GEN_512; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_514 = 5'h13 == _GEN_2294 ? _T_60[31:0] : _GEN_513; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_515 = 5'h14 == _GEN_2294 ? _T_63[31:0] : _GEN_514; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_516 = 5'h15 == _GEN_2294 ? _T_66[31:0] : _GEN_515; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_517 = 5'h16 == _GEN_2294 ? _T_69[31:0] : _GEN_516; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_518 = 5'h17 == _GEN_2294 ? _T_72[31:0] : _GEN_517; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_519 = 5'h18 == _GEN_2294 ? _T_75[31:0] : _GEN_518; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_520 = 5'h19 == _GEN_2294 ? _T_78[31:0] : _GEN_519; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_521 = 5'h1a == _GEN_2294 ? _T_81[31:0] : _GEN_520; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_522 = 5'h1b == _GEN_2294 ? _T_84[31:0] : _GEN_521; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_523 = 5'h1c == _GEN_2294 ? _T_87[31:0] : _GEN_522; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_524 = 5'h1d == _GEN_2294 ? _T_90[31:0] : _GEN_523; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_525 = 5'h1e == _GEN_2294 ? _T_93[31:0] : _GEN_524; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_526 = 5'h1f == _GEN_2294 ? io_dataIn_0_bits : _GEN_525; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2310 = {{46'd0}, _GEN_526}; // @[decompressorChisel.scala 32:58]
  wire  _T_1679 = _GEN_2310 == _T_1678; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_15 = _T_1673 ? 1'h0 : _T_1679; // @[decompressorChisel.scala 29:35]
  wire  _T_1778 = encodedLength_16 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1780 = encodedLength_16 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2342 = {{2'd0}, encodedLength_16}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1782 = 6'h20 - _GEN_2342; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2343 = {{63'd0}, encodedCharacters_16}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1783 = _GEN_2343 << _T_1782; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_529 = 4'h1 == _T_1780 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_530 = 4'h2 == _T_1780 ? _T_9[31:0] : _GEN_529; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_531 = 4'h3 == _T_1780 ? _T_12[31:0] : _GEN_530; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_532 = 4'h4 == _T_1780 ? _T_15[31:0] : _GEN_531; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_533 = 4'h5 == _T_1780 ? _T_18[31:0] : _GEN_532; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_534 = 4'h6 == _T_1780 ? _T_21[31:0] : _GEN_533; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_535 = 4'h7 == _T_1780 ? _T_24[31:0] : _GEN_534; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_536 = 4'h8 == _T_1780 ? _T_27[31:0] : _GEN_535; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_537 = 4'h9 == _T_1780 ? _T_30[31:0] : _GEN_536; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_538 = 4'ha == _T_1780 ? _T_33[31:0] : _GEN_537; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_539 = 4'hb == _T_1780 ? _T_36[31:0] : _GEN_538; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_540 = 4'hc == _T_1780 ? _T_39[31:0] : _GEN_539; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_541 = 4'hd == _T_1780 ? _T_42[31:0] : _GEN_540; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_542 = 4'he == _T_1780 ? _T_45[31:0] : _GEN_541; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_543 = 4'hf == _T_1780 ? _T_48[31:0] : _GEN_542; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2344 = {{1'd0}, _T_1780}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_544 = 5'h10 == _GEN_2344 ? _T_51[31:0] : _GEN_543; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_545 = 5'h11 == _GEN_2344 ? _T_54[31:0] : _GEN_544; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_546 = 5'h12 == _GEN_2344 ? _T_57[31:0] : _GEN_545; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_547 = 5'h13 == _GEN_2344 ? _T_60[31:0] : _GEN_546; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_548 = 5'h14 == _GEN_2344 ? _T_63[31:0] : _GEN_547; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_549 = 5'h15 == _GEN_2344 ? _T_66[31:0] : _GEN_548; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_550 = 5'h16 == _GEN_2344 ? _T_69[31:0] : _GEN_549; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_551 = 5'h17 == _GEN_2344 ? _T_72[31:0] : _GEN_550; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_552 = 5'h18 == _GEN_2344 ? _T_75[31:0] : _GEN_551; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_553 = 5'h19 == _GEN_2344 ? _T_78[31:0] : _GEN_552; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_554 = 5'h1a == _GEN_2344 ? _T_81[31:0] : _GEN_553; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_555 = 5'h1b == _GEN_2344 ? _T_84[31:0] : _GEN_554; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_556 = 5'h1c == _GEN_2344 ? _T_87[31:0] : _GEN_555; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_557 = 5'h1d == _GEN_2344 ? _T_90[31:0] : _GEN_556; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_558 = 5'h1e == _GEN_2344 ? _T_93[31:0] : _GEN_557; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_559 = 5'h1f == _GEN_2344 ? io_dataIn_0_bits : _GEN_558; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2360 = {{46'd0}, _GEN_559}; // @[decompressorChisel.scala 32:58]
  wire  _T_1784 = _GEN_2360 == _T_1783; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_16 = _T_1778 ? 1'h0 : _T_1784; // @[decompressorChisel.scala 29:35]
  wire  _T_1883 = encodedLength_17 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1885 = encodedLength_17 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2392 = {{2'd0}, encodedLength_17}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1887 = 6'h20 - _GEN_2392; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2393 = {{63'd0}, encodedCharacters_17}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1888 = _GEN_2393 << _T_1887; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_562 = 4'h1 == _T_1885 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_563 = 4'h2 == _T_1885 ? _T_9[31:0] : _GEN_562; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_564 = 4'h3 == _T_1885 ? _T_12[31:0] : _GEN_563; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_565 = 4'h4 == _T_1885 ? _T_15[31:0] : _GEN_564; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_566 = 4'h5 == _T_1885 ? _T_18[31:0] : _GEN_565; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_567 = 4'h6 == _T_1885 ? _T_21[31:0] : _GEN_566; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_568 = 4'h7 == _T_1885 ? _T_24[31:0] : _GEN_567; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_569 = 4'h8 == _T_1885 ? _T_27[31:0] : _GEN_568; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_570 = 4'h9 == _T_1885 ? _T_30[31:0] : _GEN_569; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_571 = 4'ha == _T_1885 ? _T_33[31:0] : _GEN_570; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_572 = 4'hb == _T_1885 ? _T_36[31:0] : _GEN_571; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_573 = 4'hc == _T_1885 ? _T_39[31:0] : _GEN_572; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_574 = 4'hd == _T_1885 ? _T_42[31:0] : _GEN_573; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_575 = 4'he == _T_1885 ? _T_45[31:0] : _GEN_574; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_576 = 4'hf == _T_1885 ? _T_48[31:0] : _GEN_575; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2394 = {{1'd0}, _T_1885}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_577 = 5'h10 == _GEN_2394 ? _T_51[31:0] : _GEN_576; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_578 = 5'h11 == _GEN_2394 ? _T_54[31:0] : _GEN_577; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_579 = 5'h12 == _GEN_2394 ? _T_57[31:0] : _GEN_578; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_580 = 5'h13 == _GEN_2394 ? _T_60[31:0] : _GEN_579; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_581 = 5'h14 == _GEN_2394 ? _T_63[31:0] : _GEN_580; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_582 = 5'h15 == _GEN_2394 ? _T_66[31:0] : _GEN_581; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_583 = 5'h16 == _GEN_2394 ? _T_69[31:0] : _GEN_582; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_584 = 5'h17 == _GEN_2394 ? _T_72[31:0] : _GEN_583; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_585 = 5'h18 == _GEN_2394 ? _T_75[31:0] : _GEN_584; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_586 = 5'h19 == _GEN_2394 ? _T_78[31:0] : _GEN_585; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_587 = 5'h1a == _GEN_2394 ? _T_81[31:0] : _GEN_586; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_588 = 5'h1b == _GEN_2394 ? _T_84[31:0] : _GEN_587; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_589 = 5'h1c == _GEN_2394 ? _T_87[31:0] : _GEN_588; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_590 = 5'h1d == _GEN_2394 ? _T_90[31:0] : _GEN_589; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_591 = 5'h1e == _GEN_2394 ? _T_93[31:0] : _GEN_590; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_592 = 5'h1f == _GEN_2394 ? io_dataIn_0_bits : _GEN_591; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2410 = {{46'd0}, _GEN_592}; // @[decompressorChisel.scala 32:58]
  wire  _T_1889 = _GEN_2410 == _T_1888; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_17 = _T_1883 ? 1'h0 : _T_1889; // @[decompressorChisel.scala 29:35]
  wire  _T_1988 = encodedLength_18 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_1990 = encodedLength_18 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2442 = {{2'd0}, encodedLength_18}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_1992 = 6'h20 - _GEN_2442; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2443 = {{63'd0}, encodedCharacters_18}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_1993 = _GEN_2443 << _T_1992; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_595 = 4'h1 == _T_1990 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_596 = 4'h2 == _T_1990 ? _T_9[31:0] : _GEN_595; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_597 = 4'h3 == _T_1990 ? _T_12[31:0] : _GEN_596; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_598 = 4'h4 == _T_1990 ? _T_15[31:0] : _GEN_597; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_599 = 4'h5 == _T_1990 ? _T_18[31:0] : _GEN_598; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_600 = 4'h6 == _T_1990 ? _T_21[31:0] : _GEN_599; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_601 = 4'h7 == _T_1990 ? _T_24[31:0] : _GEN_600; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_602 = 4'h8 == _T_1990 ? _T_27[31:0] : _GEN_601; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_603 = 4'h9 == _T_1990 ? _T_30[31:0] : _GEN_602; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_604 = 4'ha == _T_1990 ? _T_33[31:0] : _GEN_603; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_605 = 4'hb == _T_1990 ? _T_36[31:0] : _GEN_604; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_606 = 4'hc == _T_1990 ? _T_39[31:0] : _GEN_605; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_607 = 4'hd == _T_1990 ? _T_42[31:0] : _GEN_606; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_608 = 4'he == _T_1990 ? _T_45[31:0] : _GEN_607; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_609 = 4'hf == _T_1990 ? _T_48[31:0] : _GEN_608; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2444 = {{1'd0}, _T_1990}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_610 = 5'h10 == _GEN_2444 ? _T_51[31:0] : _GEN_609; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_611 = 5'h11 == _GEN_2444 ? _T_54[31:0] : _GEN_610; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_612 = 5'h12 == _GEN_2444 ? _T_57[31:0] : _GEN_611; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_613 = 5'h13 == _GEN_2444 ? _T_60[31:0] : _GEN_612; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_614 = 5'h14 == _GEN_2444 ? _T_63[31:0] : _GEN_613; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_615 = 5'h15 == _GEN_2444 ? _T_66[31:0] : _GEN_614; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_616 = 5'h16 == _GEN_2444 ? _T_69[31:0] : _GEN_615; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_617 = 5'h17 == _GEN_2444 ? _T_72[31:0] : _GEN_616; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_618 = 5'h18 == _GEN_2444 ? _T_75[31:0] : _GEN_617; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_619 = 5'h19 == _GEN_2444 ? _T_78[31:0] : _GEN_618; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_620 = 5'h1a == _GEN_2444 ? _T_81[31:0] : _GEN_619; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_621 = 5'h1b == _GEN_2444 ? _T_84[31:0] : _GEN_620; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_622 = 5'h1c == _GEN_2444 ? _T_87[31:0] : _GEN_621; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_623 = 5'h1d == _GEN_2444 ? _T_90[31:0] : _GEN_622; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_624 = 5'h1e == _GEN_2444 ? _T_93[31:0] : _GEN_623; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_625 = 5'h1f == _GEN_2444 ? io_dataIn_0_bits : _GEN_624; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2460 = {{46'd0}, _GEN_625}; // @[decompressorChisel.scala 32:58]
  wire  _T_1994 = _GEN_2460 == _T_1993; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_18 = _T_1988 ? 1'h0 : _T_1994; // @[decompressorChisel.scala 29:35]
  wire  _T_2093 = encodedLength_19 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2095 = encodedLength_19 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2492 = {{2'd0}, encodedLength_19}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2097 = 6'h20 - _GEN_2492; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2493 = {{63'd0}, encodedCharacters_19}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2098 = _GEN_2493 << _T_2097; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_628 = 4'h1 == _T_2095 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_629 = 4'h2 == _T_2095 ? _T_9[31:0] : _GEN_628; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_630 = 4'h3 == _T_2095 ? _T_12[31:0] : _GEN_629; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_631 = 4'h4 == _T_2095 ? _T_15[31:0] : _GEN_630; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_632 = 4'h5 == _T_2095 ? _T_18[31:0] : _GEN_631; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_633 = 4'h6 == _T_2095 ? _T_21[31:0] : _GEN_632; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_634 = 4'h7 == _T_2095 ? _T_24[31:0] : _GEN_633; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_635 = 4'h8 == _T_2095 ? _T_27[31:0] : _GEN_634; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_636 = 4'h9 == _T_2095 ? _T_30[31:0] : _GEN_635; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_637 = 4'ha == _T_2095 ? _T_33[31:0] : _GEN_636; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_638 = 4'hb == _T_2095 ? _T_36[31:0] : _GEN_637; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_639 = 4'hc == _T_2095 ? _T_39[31:0] : _GEN_638; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_640 = 4'hd == _T_2095 ? _T_42[31:0] : _GEN_639; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_641 = 4'he == _T_2095 ? _T_45[31:0] : _GEN_640; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_642 = 4'hf == _T_2095 ? _T_48[31:0] : _GEN_641; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2494 = {{1'd0}, _T_2095}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_643 = 5'h10 == _GEN_2494 ? _T_51[31:0] : _GEN_642; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_644 = 5'h11 == _GEN_2494 ? _T_54[31:0] : _GEN_643; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_645 = 5'h12 == _GEN_2494 ? _T_57[31:0] : _GEN_644; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_646 = 5'h13 == _GEN_2494 ? _T_60[31:0] : _GEN_645; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_647 = 5'h14 == _GEN_2494 ? _T_63[31:0] : _GEN_646; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_648 = 5'h15 == _GEN_2494 ? _T_66[31:0] : _GEN_647; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_649 = 5'h16 == _GEN_2494 ? _T_69[31:0] : _GEN_648; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_650 = 5'h17 == _GEN_2494 ? _T_72[31:0] : _GEN_649; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_651 = 5'h18 == _GEN_2494 ? _T_75[31:0] : _GEN_650; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_652 = 5'h19 == _GEN_2494 ? _T_78[31:0] : _GEN_651; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_653 = 5'h1a == _GEN_2494 ? _T_81[31:0] : _GEN_652; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_654 = 5'h1b == _GEN_2494 ? _T_84[31:0] : _GEN_653; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_655 = 5'h1c == _GEN_2494 ? _T_87[31:0] : _GEN_654; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_656 = 5'h1d == _GEN_2494 ? _T_90[31:0] : _GEN_655; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_657 = 5'h1e == _GEN_2494 ? _T_93[31:0] : _GEN_656; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_658 = 5'h1f == _GEN_2494 ? io_dataIn_0_bits : _GEN_657; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2510 = {{46'd0}, _GEN_658}; // @[decompressorChisel.scala 32:58]
  wire  _T_2099 = _GEN_2510 == _T_2098; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_19 = _T_2093 ? 1'h0 : _T_2099; // @[decompressorChisel.scala 29:35]
  wire  _T_2198 = encodedLength_20 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2200 = encodedLength_20 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2542 = {{2'd0}, encodedLength_20}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2202 = 6'h20 - _GEN_2542; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2543 = {{63'd0}, encodedCharacters_20}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2203 = _GEN_2543 << _T_2202; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_661 = 4'h1 == _T_2200 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_662 = 4'h2 == _T_2200 ? _T_9[31:0] : _GEN_661; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_663 = 4'h3 == _T_2200 ? _T_12[31:0] : _GEN_662; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_664 = 4'h4 == _T_2200 ? _T_15[31:0] : _GEN_663; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_665 = 4'h5 == _T_2200 ? _T_18[31:0] : _GEN_664; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_666 = 4'h6 == _T_2200 ? _T_21[31:0] : _GEN_665; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_667 = 4'h7 == _T_2200 ? _T_24[31:0] : _GEN_666; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_668 = 4'h8 == _T_2200 ? _T_27[31:0] : _GEN_667; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_669 = 4'h9 == _T_2200 ? _T_30[31:0] : _GEN_668; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_670 = 4'ha == _T_2200 ? _T_33[31:0] : _GEN_669; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_671 = 4'hb == _T_2200 ? _T_36[31:0] : _GEN_670; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_672 = 4'hc == _T_2200 ? _T_39[31:0] : _GEN_671; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_673 = 4'hd == _T_2200 ? _T_42[31:0] : _GEN_672; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_674 = 4'he == _T_2200 ? _T_45[31:0] : _GEN_673; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_675 = 4'hf == _T_2200 ? _T_48[31:0] : _GEN_674; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2544 = {{1'd0}, _T_2200}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_676 = 5'h10 == _GEN_2544 ? _T_51[31:0] : _GEN_675; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_677 = 5'h11 == _GEN_2544 ? _T_54[31:0] : _GEN_676; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_678 = 5'h12 == _GEN_2544 ? _T_57[31:0] : _GEN_677; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_679 = 5'h13 == _GEN_2544 ? _T_60[31:0] : _GEN_678; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_680 = 5'h14 == _GEN_2544 ? _T_63[31:0] : _GEN_679; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_681 = 5'h15 == _GEN_2544 ? _T_66[31:0] : _GEN_680; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_682 = 5'h16 == _GEN_2544 ? _T_69[31:0] : _GEN_681; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_683 = 5'h17 == _GEN_2544 ? _T_72[31:0] : _GEN_682; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_684 = 5'h18 == _GEN_2544 ? _T_75[31:0] : _GEN_683; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_685 = 5'h19 == _GEN_2544 ? _T_78[31:0] : _GEN_684; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_686 = 5'h1a == _GEN_2544 ? _T_81[31:0] : _GEN_685; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_687 = 5'h1b == _GEN_2544 ? _T_84[31:0] : _GEN_686; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_688 = 5'h1c == _GEN_2544 ? _T_87[31:0] : _GEN_687; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_689 = 5'h1d == _GEN_2544 ? _T_90[31:0] : _GEN_688; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_690 = 5'h1e == _GEN_2544 ? _T_93[31:0] : _GEN_689; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_691 = 5'h1f == _GEN_2544 ? io_dataIn_0_bits : _GEN_690; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2560 = {{46'd0}, _GEN_691}; // @[decompressorChisel.scala 32:58]
  wire  _T_2204 = _GEN_2560 == _T_2203; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_20 = _T_2198 ? 1'h0 : _T_2204; // @[decompressorChisel.scala 29:35]
  wire  _T_2303 = encodedLength_21 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2305 = encodedLength_21 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2592 = {{2'd0}, encodedLength_21}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2307 = 6'h20 - _GEN_2592; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2593 = {{63'd0}, encodedCharacters_21}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2308 = _GEN_2593 << _T_2307; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_694 = 4'h1 == _T_2305 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_695 = 4'h2 == _T_2305 ? _T_9[31:0] : _GEN_694; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_696 = 4'h3 == _T_2305 ? _T_12[31:0] : _GEN_695; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_697 = 4'h4 == _T_2305 ? _T_15[31:0] : _GEN_696; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_698 = 4'h5 == _T_2305 ? _T_18[31:0] : _GEN_697; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_699 = 4'h6 == _T_2305 ? _T_21[31:0] : _GEN_698; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_700 = 4'h7 == _T_2305 ? _T_24[31:0] : _GEN_699; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_701 = 4'h8 == _T_2305 ? _T_27[31:0] : _GEN_700; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_702 = 4'h9 == _T_2305 ? _T_30[31:0] : _GEN_701; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_703 = 4'ha == _T_2305 ? _T_33[31:0] : _GEN_702; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_704 = 4'hb == _T_2305 ? _T_36[31:0] : _GEN_703; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_705 = 4'hc == _T_2305 ? _T_39[31:0] : _GEN_704; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_706 = 4'hd == _T_2305 ? _T_42[31:0] : _GEN_705; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_707 = 4'he == _T_2305 ? _T_45[31:0] : _GEN_706; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_708 = 4'hf == _T_2305 ? _T_48[31:0] : _GEN_707; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2594 = {{1'd0}, _T_2305}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_709 = 5'h10 == _GEN_2594 ? _T_51[31:0] : _GEN_708; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_710 = 5'h11 == _GEN_2594 ? _T_54[31:0] : _GEN_709; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_711 = 5'h12 == _GEN_2594 ? _T_57[31:0] : _GEN_710; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_712 = 5'h13 == _GEN_2594 ? _T_60[31:0] : _GEN_711; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_713 = 5'h14 == _GEN_2594 ? _T_63[31:0] : _GEN_712; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_714 = 5'h15 == _GEN_2594 ? _T_66[31:0] : _GEN_713; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_715 = 5'h16 == _GEN_2594 ? _T_69[31:0] : _GEN_714; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_716 = 5'h17 == _GEN_2594 ? _T_72[31:0] : _GEN_715; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_717 = 5'h18 == _GEN_2594 ? _T_75[31:0] : _GEN_716; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_718 = 5'h19 == _GEN_2594 ? _T_78[31:0] : _GEN_717; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_719 = 5'h1a == _GEN_2594 ? _T_81[31:0] : _GEN_718; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_720 = 5'h1b == _GEN_2594 ? _T_84[31:0] : _GEN_719; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_721 = 5'h1c == _GEN_2594 ? _T_87[31:0] : _GEN_720; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_722 = 5'h1d == _GEN_2594 ? _T_90[31:0] : _GEN_721; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_723 = 5'h1e == _GEN_2594 ? _T_93[31:0] : _GEN_722; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_724 = 5'h1f == _GEN_2594 ? io_dataIn_0_bits : _GEN_723; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2610 = {{46'd0}, _GEN_724}; // @[decompressorChisel.scala 32:58]
  wire  _T_2309 = _GEN_2610 == _T_2308; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_21 = _T_2303 ? 1'h0 : _T_2309; // @[decompressorChisel.scala 29:35]
  wire  _T_2408 = encodedLength_22 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2410 = encodedLength_22 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2642 = {{2'd0}, encodedLength_22}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2412 = 6'h20 - _GEN_2642; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2643 = {{63'd0}, encodedCharacters_22}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2413 = _GEN_2643 << _T_2412; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_727 = 4'h1 == _T_2410 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_728 = 4'h2 == _T_2410 ? _T_9[31:0] : _GEN_727; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_729 = 4'h3 == _T_2410 ? _T_12[31:0] : _GEN_728; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_730 = 4'h4 == _T_2410 ? _T_15[31:0] : _GEN_729; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_731 = 4'h5 == _T_2410 ? _T_18[31:0] : _GEN_730; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_732 = 4'h6 == _T_2410 ? _T_21[31:0] : _GEN_731; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_733 = 4'h7 == _T_2410 ? _T_24[31:0] : _GEN_732; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_734 = 4'h8 == _T_2410 ? _T_27[31:0] : _GEN_733; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_735 = 4'h9 == _T_2410 ? _T_30[31:0] : _GEN_734; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_736 = 4'ha == _T_2410 ? _T_33[31:0] : _GEN_735; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_737 = 4'hb == _T_2410 ? _T_36[31:0] : _GEN_736; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_738 = 4'hc == _T_2410 ? _T_39[31:0] : _GEN_737; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_739 = 4'hd == _T_2410 ? _T_42[31:0] : _GEN_738; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_740 = 4'he == _T_2410 ? _T_45[31:0] : _GEN_739; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_741 = 4'hf == _T_2410 ? _T_48[31:0] : _GEN_740; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2644 = {{1'd0}, _T_2410}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_742 = 5'h10 == _GEN_2644 ? _T_51[31:0] : _GEN_741; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_743 = 5'h11 == _GEN_2644 ? _T_54[31:0] : _GEN_742; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_744 = 5'h12 == _GEN_2644 ? _T_57[31:0] : _GEN_743; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_745 = 5'h13 == _GEN_2644 ? _T_60[31:0] : _GEN_744; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_746 = 5'h14 == _GEN_2644 ? _T_63[31:0] : _GEN_745; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_747 = 5'h15 == _GEN_2644 ? _T_66[31:0] : _GEN_746; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_748 = 5'h16 == _GEN_2644 ? _T_69[31:0] : _GEN_747; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_749 = 5'h17 == _GEN_2644 ? _T_72[31:0] : _GEN_748; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_750 = 5'h18 == _GEN_2644 ? _T_75[31:0] : _GEN_749; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_751 = 5'h19 == _GEN_2644 ? _T_78[31:0] : _GEN_750; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_752 = 5'h1a == _GEN_2644 ? _T_81[31:0] : _GEN_751; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_753 = 5'h1b == _GEN_2644 ? _T_84[31:0] : _GEN_752; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_754 = 5'h1c == _GEN_2644 ? _T_87[31:0] : _GEN_753; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_755 = 5'h1d == _GEN_2644 ? _T_90[31:0] : _GEN_754; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_756 = 5'h1e == _GEN_2644 ? _T_93[31:0] : _GEN_755; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_757 = 5'h1f == _GEN_2644 ? io_dataIn_0_bits : _GEN_756; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2660 = {{46'd0}, _GEN_757}; // @[decompressorChisel.scala 32:58]
  wire  _T_2414 = _GEN_2660 == _T_2413; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_22 = _T_2408 ? 1'h0 : _T_2414; // @[decompressorChisel.scala 29:35]
  wire  _T_2513 = encodedLength_23 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2515 = encodedLength_23 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2692 = {{2'd0}, encodedLength_23}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2517 = 6'h20 - _GEN_2692; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2693 = {{63'd0}, encodedCharacters_23}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2518 = _GEN_2693 << _T_2517; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_760 = 4'h1 == _T_2515 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_761 = 4'h2 == _T_2515 ? _T_9[31:0] : _GEN_760; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_762 = 4'h3 == _T_2515 ? _T_12[31:0] : _GEN_761; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_763 = 4'h4 == _T_2515 ? _T_15[31:0] : _GEN_762; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_764 = 4'h5 == _T_2515 ? _T_18[31:0] : _GEN_763; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_765 = 4'h6 == _T_2515 ? _T_21[31:0] : _GEN_764; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_766 = 4'h7 == _T_2515 ? _T_24[31:0] : _GEN_765; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_767 = 4'h8 == _T_2515 ? _T_27[31:0] : _GEN_766; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_768 = 4'h9 == _T_2515 ? _T_30[31:0] : _GEN_767; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_769 = 4'ha == _T_2515 ? _T_33[31:0] : _GEN_768; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_770 = 4'hb == _T_2515 ? _T_36[31:0] : _GEN_769; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_771 = 4'hc == _T_2515 ? _T_39[31:0] : _GEN_770; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_772 = 4'hd == _T_2515 ? _T_42[31:0] : _GEN_771; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_773 = 4'he == _T_2515 ? _T_45[31:0] : _GEN_772; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_774 = 4'hf == _T_2515 ? _T_48[31:0] : _GEN_773; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2694 = {{1'd0}, _T_2515}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_775 = 5'h10 == _GEN_2694 ? _T_51[31:0] : _GEN_774; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_776 = 5'h11 == _GEN_2694 ? _T_54[31:0] : _GEN_775; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_777 = 5'h12 == _GEN_2694 ? _T_57[31:0] : _GEN_776; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_778 = 5'h13 == _GEN_2694 ? _T_60[31:0] : _GEN_777; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_779 = 5'h14 == _GEN_2694 ? _T_63[31:0] : _GEN_778; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_780 = 5'h15 == _GEN_2694 ? _T_66[31:0] : _GEN_779; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_781 = 5'h16 == _GEN_2694 ? _T_69[31:0] : _GEN_780; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_782 = 5'h17 == _GEN_2694 ? _T_72[31:0] : _GEN_781; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_783 = 5'h18 == _GEN_2694 ? _T_75[31:0] : _GEN_782; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_784 = 5'h19 == _GEN_2694 ? _T_78[31:0] : _GEN_783; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_785 = 5'h1a == _GEN_2694 ? _T_81[31:0] : _GEN_784; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_786 = 5'h1b == _GEN_2694 ? _T_84[31:0] : _GEN_785; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_787 = 5'h1c == _GEN_2694 ? _T_87[31:0] : _GEN_786; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_788 = 5'h1d == _GEN_2694 ? _T_90[31:0] : _GEN_787; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_789 = 5'h1e == _GEN_2694 ? _T_93[31:0] : _GEN_788; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_790 = 5'h1f == _GEN_2694 ? io_dataIn_0_bits : _GEN_789; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2710 = {{46'd0}, _GEN_790}; // @[decompressorChisel.scala 32:58]
  wire  _T_2519 = _GEN_2710 == _T_2518; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_23 = _T_2513 ? 1'h0 : _T_2519; // @[decompressorChisel.scala 29:35]
  wire  _T_2618 = encodedLength_24 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2620 = encodedLength_24 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2742 = {{2'd0}, encodedLength_24}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2622 = 6'h20 - _GEN_2742; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2743 = {{63'd0}, encodedCharacters_24}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2623 = _GEN_2743 << _T_2622; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_793 = 4'h1 == _T_2620 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_794 = 4'h2 == _T_2620 ? _T_9[31:0] : _GEN_793; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_795 = 4'h3 == _T_2620 ? _T_12[31:0] : _GEN_794; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_796 = 4'h4 == _T_2620 ? _T_15[31:0] : _GEN_795; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_797 = 4'h5 == _T_2620 ? _T_18[31:0] : _GEN_796; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_798 = 4'h6 == _T_2620 ? _T_21[31:0] : _GEN_797; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_799 = 4'h7 == _T_2620 ? _T_24[31:0] : _GEN_798; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_800 = 4'h8 == _T_2620 ? _T_27[31:0] : _GEN_799; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_801 = 4'h9 == _T_2620 ? _T_30[31:0] : _GEN_800; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_802 = 4'ha == _T_2620 ? _T_33[31:0] : _GEN_801; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_803 = 4'hb == _T_2620 ? _T_36[31:0] : _GEN_802; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_804 = 4'hc == _T_2620 ? _T_39[31:0] : _GEN_803; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_805 = 4'hd == _T_2620 ? _T_42[31:0] : _GEN_804; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_806 = 4'he == _T_2620 ? _T_45[31:0] : _GEN_805; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_807 = 4'hf == _T_2620 ? _T_48[31:0] : _GEN_806; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2744 = {{1'd0}, _T_2620}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_808 = 5'h10 == _GEN_2744 ? _T_51[31:0] : _GEN_807; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_809 = 5'h11 == _GEN_2744 ? _T_54[31:0] : _GEN_808; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_810 = 5'h12 == _GEN_2744 ? _T_57[31:0] : _GEN_809; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_811 = 5'h13 == _GEN_2744 ? _T_60[31:0] : _GEN_810; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_812 = 5'h14 == _GEN_2744 ? _T_63[31:0] : _GEN_811; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_813 = 5'h15 == _GEN_2744 ? _T_66[31:0] : _GEN_812; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_814 = 5'h16 == _GEN_2744 ? _T_69[31:0] : _GEN_813; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_815 = 5'h17 == _GEN_2744 ? _T_72[31:0] : _GEN_814; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_816 = 5'h18 == _GEN_2744 ? _T_75[31:0] : _GEN_815; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_817 = 5'h19 == _GEN_2744 ? _T_78[31:0] : _GEN_816; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_818 = 5'h1a == _GEN_2744 ? _T_81[31:0] : _GEN_817; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_819 = 5'h1b == _GEN_2744 ? _T_84[31:0] : _GEN_818; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_820 = 5'h1c == _GEN_2744 ? _T_87[31:0] : _GEN_819; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_821 = 5'h1d == _GEN_2744 ? _T_90[31:0] : _GEN_820; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_822 = 5'h1e == _GEN_2744 ? _T_93[31:0] : _GEN_821; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_823 = 5'h1f == _GEN_2744 ? io_dataIn_0_bits : _GEN_822; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2760 = {{46'd0}, _GEN_823}; // @[decompressorChisel.scala 32:58]
  wire  _T_2624 = _GEN_2760 == _T_2623; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_24 = _T_2618 ? 1'h0 : _T_2624; // @[decompressorChisel.scala 29:35]
  wire  _T_2723 = encodedLength_25 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2725 = encodedLength_25 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2792 = {{2'd0}, encodedLength_25}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2727 = 6'h20 - _GEN_2792; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2793 = {{63'd0}, encodedCharacters_25}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2728 = _GEN_2793 << _T_2727; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_826 = 4'h1 == _T_2725 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_827 = 4'h2 == _T_2725 ? _T_9[31:0] : _GEN_826; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_828 = 4'h3 == _T_2725 ? _T_12[31:0] : _GEN_827; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_829 = 4'h4 == _T_2725 ? _T_15[31:0] : _GEN_828; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_830 = 4'h5 == _T_2725 ? _T_18[31:0] : _GEN_829; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_831 = 4'h6 == _T_2725 ? _T_21[31:0] : _GEN_830; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_832 = 4'h7 == _T_2725 ? _T_24[31:0] : _GEN_831; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_833 = 4'h8 == _T_2725 ? _T_27[31:0] : _GEN_832; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_834 = 4'h9 == _T_2725 ? _T_30[31:0] : _GEN_833; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_835 = 4'ha == _T_2725 ? _T_33[31:0] : _GEN_834; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_836 = 4'hb == _T_2725 ? _T_36[31:0] : _GEN_835; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_837 = 4'hc == _T_2725 ? _T_39[31:0] : _GEN_836; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_838 = 4'hd == _T_2725 ? _T_42[31:0] : _GEN_837; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_839 = 4'he == _T_2725 ? _T_45[31:0] : _GEN_838; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_840 = 4'hf == _T_2725 ? _T_48[31:0] : _GEN_839; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2794 = {{1'd0}, _T_2725}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_841 = 5'h10 == _GEN_2794 ? _T_51[31:0] : _GEN_840; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_842 = 5'h11 == _GEN_2794 ? _T_54[31:0] : _GEN_841; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_843 = 5'h12 == _GEN_2794 ? _T_57[31:0] : _GEN_842; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_844 = 5'h13 == _GEN_2794 ? _T_60[31:0] : _GEN_843; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_845 = 5'h14 == _GEN_2794 ? _T_63[31:0] : _GEN_844; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_846 = 5'h15 == _GEN_2794 ? _T_66[31:0] : _GEN_845; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_847 = 5'h16 == _GEN_2794 ? _T_69[31:0] : _GEN_846; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_848 = 5'h17 == _GEN_2794 ? _T_72[31:0] : _GEN_847; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_849 = 5'h18 == _GEN_2794 ? _T_75[31:0] : _GEN_848; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_850 = 5'h19 == _GEN_2794 ? _T_78[31:0] : _GEN_849; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_851 = 5'h1a == _GEN_2794 ? _T_81[31:0] : _GEN_850; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_852 = 5'h1b == _GEN_2794 ? _T_84[31:0] : _GEN_851; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_853 = 5'h1c == _GEN_2794 ? _T_87[31:0] : _GEN_852; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_854 = 5'h1d == _GEN_2794 ? _T_90[31:0] : _GEN_853; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_855 = 5'h1e == _GEN_2794 ? _T_93[31:0] : _GEN_854; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_856 = 5'h1f == _GEN_2794 ? io_dataIn_0_bits : _GEN_855; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2810 = {{46'd0}, _GEN_856}; // @[decompressorChisel.scala 32:58]
  wire  _T_2729 = _GEN_2810 == _T_2728; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_25 = _T_2723 ? 1'h0 : _T_2729; // @[decompressorChisel.scala 29:35]
  wire  _T_2828 = encodedLength_26 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2830 = encodedLength_26 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2842 = {{2'd0}, encodedLength_26}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2832 = 6'h20 - _GEN_2842; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2843 = {{63'd0}, encodedCharacters_26}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2833 = _GEN_2843 << _T_2832; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_859 = 4'h1 == _T_2830 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_860 = 4'h2 == _T_2830 ? _T_9[31:0] : _GEN_859; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_861 = 4'h3 == _T_2830 ? _T_12[31:0] : _GEN_860; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_862 = 4'h4 == _T_2830 ? _T_15[31:0] : _GEN_861; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_863 = 4'h5 == _T_2830 ? _T_18[31:0] : _GEN_862; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_864 = 4'h6 == _T_2830 ? _T_21[31:0] : _GEN_863; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_865 = 4'h7 == _T_2830 ? _T_24[31:0] : _GEN_864; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_866 = 4'h8 == _T_2830 ? _T_27[31:0] : _GEN_865; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_867 = 4'h9 == _T_2830 ? _T_30[31:0] : _GEN_866; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_868 = 4'ha == _T_2830 ? _T_33[31:0] : _GEN_867; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_869 = 4'hb == _T_2830 ? _T_36[31:0] : _GEN_868; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_870 = 4'hc == _T_2830 ? _T_39[31:0] : _GEN_869; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_871 = 4'hd == _T_2830 ? _T_42[31:0] : _GEN_870; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_872 = 4'he == _T_2830 ? _T_45[31:0] : _GEN_871; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_873 = 4'hf == _T_2830 ? _T_48[31:0] : _GEN_872; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2844 = {{1'd0}, _T_2830}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_874 = 5'h10 == _GEN_2844 ? _T_51[31:0] : _GEN_873; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_875 = 5'h11 == _GEN_2844 ? _T_54[31:0] : _GEN_874; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_876 = 5'h12 == _GEN_2844 ? _T_57[31:0] : _GEN_875; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_877 = 5'h13 == _GEN_2844 ? _T_60[31:0] : _GEN_876; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_878 = 5'h14 == _GEN_2844 ? _T_63[31:0] : _GEN_877; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_879 = 5'h15 == _GEN_2844 ? _T_66[31:0] : _GEN_878; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_880 = 5'h16 == _GEN_2844 ? _T_69[31:0] : _GEN_879; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_881 = 5'h17 == _GEN_2844 ? _T_72[31:0] : _GEN_880; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_882 = 5'h18 == _GEN_2844 ? _T_75[31:0] : _GEN_881; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_883 = 5'h19 == _GEN_2844 ? _T_78[31:0] : _GEN_882; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_884 = 5'h1a == _GEN_2844 ? _T_81[31:0] : _GEN_883; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_885 = 5'h1b == _GEN_2844 ? _T_84[31:0] : _GEN_884; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_886 = 5'h1c == _GEN_2844 ? _T_87[31:0] : _GEN_885; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_887 = 5'h1d == _GEN_2844 ? _T_90[31:0] : _GEN_886; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_888 = 5'h1e == _GEN_2844 ? _T_93[31:0] : _GEN_887; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_889 = 5'h1f == _GEN_2844 ? io_dataIn_0_bits : _GEN_888; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2860 = {{46'd0}, _GEN_889}; // @[decompressorChisel.scala 32:58]
  wire  _T_2834 = _GEN_2860 == _T_2833; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_26 = _T_2828 ? 1'h0 : _T_2834; // @[decompressorChisel.scala 29:35]
  wire  _T_2933 = encodedLength_27 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_2935 = encodedLength_27 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2892 = {{2'd0}, encodedLength_27}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_2937 = 6'h20 - _GEN_2892; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2893 = {{63'd0}, encodedCharacters_27}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_2938 = _GEN_2893 << _T_2937; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_892 = 4'h1 == _T_2935 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_893 = 4'h2 == _T_2935 ? _T_9[31:0] : _GEN_892; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_894 = 4'h3 == _T_2935 ? _T_12[31:0] : _GEN_893; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_895 = 4'h4 == _T_2935 ? _T_15[31:0] : _GEN_894; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_896 = 4'h5 == _T_2935 ? _T_18[31:0] : _GEN_895; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_897 = 4'h6 == _T_2935 ? _T_21[31:0] : _GEN_896; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_898 = 4'h7 == _T_2935 ? _T_24[31:0] : _GEN_897; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_899 = 4'h8 == _T_2935 ? _T_27[31:0] : _GEN_898; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_900 = 4'h9 == _T_2935 ? _T_30[31:0] : _GEN_899; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_901 = 4'ha == _T_2935 ? _T_33[31:0] : _GEN_900; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_902 = 4'hb == _T_2935 ? _T_36[31:0] : _GEN_901; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_903 = 4'hc == _T_2935 ? _T_39[31:0] : _GEN_902; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_904 = 4'hd == _T_2935 ? _T_42[31:0] : _GEN_903; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_905 = 4'he == _T_2935 ? _T_45[31:0] : _GEN_904; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_906 = 4'hf == _T_2935 ? _T_48[31:0] : _GEN_905; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2894 = {{1'd0}, _T_2935}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_907 = 5'h10 == _GEN_2894 ? _T_51[31:0] : _GEN_906; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_908 = 5'h11 == _GEN_2894 ? _T_54[31:0] : _GEN_907; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_909 = 5'h12 == _GEN_2894 ? _T_57[31:0] : _GEN_908; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_910 = 5'h13 == _GEN_2894 ? _T_60[31:0] : _GEN_909; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_911 = 5'h14 == _GEN_2894 ? _T_63[31:0] : _GEN_910; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_912 = 5'h15 == _GEN_2894 ? _T_66[31:0] : _GEN_911; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_913 = 5'h16 == _GEN_2894 ? _T_69[31:0] : _GEN_912; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_914 = 5'h17 == _GEN_2894 ? _T_72[31:0] : _GEN_913; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_915 = 5'h18 == _GEN_2894 ? _T_75[31:0] : _GEN_914; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_916 = 5'h19 == _GEN_2894 ? _T_78[31:0] : _GEN_915; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_917 = 5'h1a == _GEN_2894 ? _T_81[31:0] : _GEN_916; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_918 = 5'h1b == _GEN_2894 ? _T_84[31:0] : _GEN_917; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_919 = 5'h1c == _GEN_2894 ? _T_87[31:0] : _GEN_918; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_920 = 5'h1d == _GEN_2894 ? _T_90[31:0] : _GEN_919; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_921 = 5'h1e == _GEN_2894 ? _T_93[31:0] : _GEN_920; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_922 = 5'h1f == _GEN_2894 ? io_dataIn_0_bits : _GEN_921; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2910 = {{46'd0}, _GEN_922}; // @[decompressorChisel.scala 32:58]
  wire  _T_2939 = _GEN_2910 == _T_2938; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_27 = _T_2933 ? 1'h0 : _T_2939; // @[decompressorChisel.scala 29:35]
  wire  _T_3038 = encodedLength_28 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_3040 = encodedLength_28 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2942 = {{2'd0}, encodedLength_28}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_3042 = 6'h20 - _GEN_2942; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2943 = {{63'd0}, encodedCharacters_28}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_3043 = _GEN_2943 << _T_3042; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_925 = 4'h1 == _T_3040 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_926 = 4'h2 == _T_3040 ? _T_9[31:0] : _GEN_925; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_927 = 4'h3 == _T_3040 ? _T_12[31:0] : _GEN_926; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_928 = 4'h4 == _T_3040 ? _T_15[31:0] : _GEN_927; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_929 = 4'h5 == _T_3040 ? _T_18[31:0] : _GEN_928; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_930 = 4'h6 == _T_3040 ? _T_21[31:0] : _GEN_929; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_931 = 4'h7 == _T_3040 ? _T_24[31:0] : _GEN_930; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_932 = 4'h8 == _T_3040 ? _T_27[31:0] : _GEN_931; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_933 = 4'h9 == _T_3040 ? _T_30[31:0] : _GEN_932; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_934 = 4'ha == _T_3040 ? _T_33[31:0] : _GEN_933; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_935 = 4'hb == _T_3040 ? _T_36[31:0] : _GEN_934; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_936 = 4'hc == _T_3040 ? _T_39[31:0] : _GEN_935; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_937 = 4'hd == _T_3040 ? _T_42[31:0] : _GEN_936; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_938 = 4'he == _T_3040 ? _T_45[31:0] : _GEN_937; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_939 = 4'hf == _T_3040 ? _T_48[31:0] : _GEN_938; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2944 = {{1'd0}, _T_3040}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_940 = 5'h10 == _GEN_2944 ? _T_51[31:0] : _GEN_939; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_941 = 5'h11 == _GEN_2944 ? _T_54[31:0] : _GEN_940; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_942 = 5'h12 == _GEN_2944 ? _T_57[31:0] : _GEN_941; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_943 = 5'h13 == _GEN_2944 ? _T_60[31:0] : _GEN_942; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_944 = 5'h14 == _GEN_2944 ? _T_63[31:0] : _GEN_943; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_945 = 5'h15 == _GEN_2944 ? _T_66[31:0] : _GEN_944; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_946 = 5'h16 == _GEN_2944 ? _T_69[31:0] : _GEN_945; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_947 = 5'h17 == _GEN_2944 ? _T_72[31:0] : _GEN_946; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_948 = 5'h18 == _GEN_2944 ? _T_75[31:0] : _GEN_947; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_949 = 5'h19 == _GEN_2944 ? _T_78[31:0] : _GEN_948; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_950 = 5'h1a == _GEN_2944 ? _T_81[31:0] : _GEN_949; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_951 = 5'h1b == _GEN_2944 ? _T_84[31:0] : _GEN_950; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_952 = 5'h1c == _GEN_2944 ? _T_87[31:0] : _GEN_951; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_953 = 5'h1d == _GEN_2944 ? _T_90[31:0] : _GEN_952; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_954 = 5'h1e == _GEN_2944 ? _T_93[31:0] : _GEN_953; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_955 = 5'h1f == _GEN_2944 ? io_dataIn_0_bits : _GEN_954; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_2960 = {{46'd0}, _GEN_955}; // @[decompressorChisel.scala 32:58]
  wire  _T_3044 = _GEN_2960 == _T_3043; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_28 = _T_3038 ? 1'h0 : _T_3044; // @[decompressorChisel.scala 29:35]
  wire  _T_3143 = encodedLength_29 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_3145 = encodedLength_29 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_2992 = {{2'd0}, encodedLength_29}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_3147 = 6'h20 - _GEN_2992; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_2993 = {{63'd0}, encodedCharacters_29}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_3148 = _GEN_2993 << _T_3147; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_958 = 4'h1 == _T_3145 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_959 = 4'h2 == _T_3145 ? _T_9[31:0] : _GEN_958; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_960 = 4'h3 == _T_3145 ? _T_12[31:0] : _GEN_959; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_961 = 4'h4 == _T_3145 ? _T_15[31:0] : _GEN_960; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_962 = 4'h5 == _T_3145 ? _T_18[31:0] : _GEN_961; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_963 = 4'h6 == _T_3145 ? _T_21[31:0] : _GEN_962; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_964 = 4'h7 == _T_3145 ? _T_24[31:0] : _GEN_963; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_965 = 4'h8 == _T_3145 ? _T_27[31:0] : _GEN_964; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_966 = 4'h9 == _T_3145 ? _T_30[31:0] : _GEN_965; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_967 = 4'ha == _T_3145 ? _T_33[31:0] : _GEN_966; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_968 = 4'hb == _T_3145 ? _T_36[31:0] : _GEN_967; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_969 = 4'hc == _T_3145 ? _T_39[31:0] : _GEN_968; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_970 = 4'hd == _T_3145 ? _T_42[31:0] : _GEN_969; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_971 = 4'he == _T_3145 ? _T_45[31:0] : _GEN_970; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_972 = 4'hf == _T_3145 ? _T_48[31:0] : _GEN_971; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_2994 = {{1'd0}, _T_3145}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_973 = 5'h10 == _GEN_2994 ? _T_51[31:0] : _GEN_972; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_974 = 5'h11 == _GEN_2994 ? _T_54[31:0] : _GEN_973; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_975 = 5'h12 == _GEN_2994 ? _T_57[31:0] : _GEN_974; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_976 = 5'h13 == _GEN_2994 ? _T_60[31:0] : _GEN_975; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_977 = 5'h14 == _GEN_2994 ? _T_63[31:0] : _GEN_976; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_978 = 5'h15 == _GEN_2994 ? _T_66[31:0] : _GEN_977; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_979 = 5'h16 == _GEN_2994 ? _T_69[31:0] : _GEN_978; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_980 = 5'h17 == _GEN_2994 ? _T_72[31:0] : _GEN_979; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_981 = 5'h18 == _GEN_2994 ? _T_75[31:0] : _GEN_980; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_982 = 5'h19 == _GEN_2994 ? _T_78[31:0] : _GEN_981; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_983 = 5'h1a == _GEN_2994 ? _T_81[31:0] : _GEN_982; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_984 = 5'h1b == _GEN_2994 ? _T_84[31:0] : _GEN_983; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_985 = 5'h1c == _GEN_2994 ? _T_87[31:0] : _GEN_984; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_986 = 5'h1d == _GEN_2994 ? _T_90[31:0] : _GEN_985; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_987 = 5'h1e == _GEN_2994 ? _T_93[31:0] : _GEN_986; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_988 = 5'h1f == _GEN_2994 ? io_dataIn_0_bits : _GEN_987; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_3010 = {{46'd0}, _GEN_988}; // @[decompressorChisel.scala 32:58]
  wire  _T_3149 = _GEN_3010 == _T_3148; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_29 = _T_3143 ? 1'h0 : _T_3149; // @[decompressorChisel.scala 29:35]
  wire  _T_3248 = encodedLength_30 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_3250 = encodedLength_30 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_3042 = {{2'd0}, encodedLength_30}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_3252 = 6'h20 - _GEN_3042; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_3043 = {{63'd0}, encodedCharacters_30}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_3253 = _GEN_3043 << _T_3252; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_991 = 4'h1 == _T_3250 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_992 = 4'h2 == _T_3250 ? _T_9[31:0] : _GEN_991; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_993 = 4'h3 == _T_3250 ? _T_12[31:0] : _GEN_992; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_994 = 4'h4 == _T_3250 ? _T_15[31:0] : _GEN_993; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_995 = 4'h5 == _T_3250 ? _T_18[31:0] : _GEN_994; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_996 = 4'h6 == _T_3250 ? _T_21[31:0] : _GEN_995; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_997 = 4'h7 == _T_3250 ? _T_24[31:0] : _GEN_996; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_998 = 4'h8 == _T_3250 ? _T_27[31:0] : _GEN_997; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_999 = 4'h9 == _T_3250 ? _T_30[31:0] : _GEN_998; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1000 = 4'ha == _T_3250 ? _T_33[31:0] : _GEN_999; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1001 = 4'hb == _T_3250 ? _T_36[31:0] : _GEN_1000; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1002 = 4'hc == _T_3250 ? _T_39[31:0] : _GEN_1001; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1003 = 4'hd == _T_3250 ? _T_42[31:0] : _GEN_1002; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1004 = 4'he == _T_3250 ? _T_45[31:0] : _GEN_1003; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1005 = 4'hf == _T_3250 ? _T_48[31:0] : _GEN_1004; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_3044 = {{1'd0}, _T_3250}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1006 = 5'h10 == _GEN_3044 ? _T_51[31:0] : _GEN_1005; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1007 = 5'h11 == _GEN_3044 ? _T_54[31:0] : _GEN_1006; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1008 = 5'h12 == _GEN_3044 ? _T_57[31:0] : _GEN_1007; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1009 = 5'h13 == _GEN_3044 ? _T_60[31:0] : _GEN_1008; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1010 = 5'h14 == _GEN_3044 ? _T_63[31:0] : _GEN_1009; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1011 = 5'h15 == _GEN_3044 ? _T_66[31:0] : _GEN_1010; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1012 = 5'h16 == _GEN_3044 ? _T_69[31:0] : _GEN_1011; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1013 = 5'h17 == _GEN_3044 ? _T_72[31:0] : _GEN_1012; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1014 = 5'h18 == _GEN_3044 ? _T_75[31:0] : _GEN_1013; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1015 = 5'h19 == _GEN_3044 ? _T_78[31:0] : _GEN_1014; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1016 = 5'h1a == _GEN_3044 ? _T_81[31:0] : _GEN_1015; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1017 = 5'h1b == _GEN_3044 ? _T_84[31:0] : _GEN_1016; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1018 = 5'h1c == _GEN_3044 ? _T_87[31:0] : _GEN_1017; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1019 = 5'h1d == _GEN_3044 ? _T_90[31:0] : _GEN_1018; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1020 = 5'h1e == _GEN_3044 ? _T_93[31:0] : _GEN_1019; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1021 = 5'h1f == _GEN_3044 ? io_dataIn_0_bits : _GEN_1020; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_3060 = {{46'd0}, _GEN_1021}; // @[decompressorChisel.scala 32:58]
  wire  _T_3254 = _GEN_3060 == _T_3253; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_30 = _T_3248 ? 1'h0 : _T_3254; // @[decompressorChisel.scala 29:35]
  wire  _T_3353 = encodedLength_31 == 4'h0; // @[decompressorChisel.scala 29:26]
  wire [3:0] _T_3355 = encodedLength_31 - 4'h1; // @[decompressorChisel.scala 32:52]
  wire [5:0] _GEN_3092 = {{2'd0}, encodedLength_31}; // @[decompressorChisel.scala 32:121]
  wire [5:0] _T_3357 = 6'h20 - _GEN_3092; // @[decompressorChisel.scala 32:121]
  wire [77:0] _GEN_3093 = {{63'd0}, encodedCharacters_31}; // @[decompressorChisel.scala 32:86]
  wire [77:0] _T_3358 = _GEN_3093 << _T_3357; // @[decompressorChisel.scala 32:86]
  wire [31:0] _GEN_1024 = 4'h1 == _T_3355 ? _T_6[31:0] : _T_3[31:0]; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1025 = 4'h2 == _T_3355 ? _T_9[31:0] : _GEN_1024; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1026 = 4'h3 == _T_3355 ? _T_12[31:0] : _GEN_1025; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1027 = 4'h4 == _T_3355 ? _T_15[31:0] : _GEN_1026; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1028 = 4'h5 == _T_3355 ? _T_18[31:0] : _GEN_1027; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1029 = 4'h6 == _T_3355 ? _T_21[31:0] : _GEN_1028; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1030 = 4'h7 == _T_3355 ? _T_24[31:0] : _GEN_1029; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1031 = 4'h8 == _T_3355 ? _T_27[31:0] : _GEN_1030; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1032 = 4'h9 == _T_3355 ? _T_30[31:0] : _GEN_1031; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1033 = 4'ha == _T_3355 ? _T_33[31:0] : _GEN_1032; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1034 = 4'hb == _T_3355 ? _T_36[31:0] : _GEN_1033; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1035 = 4'hc == _T_3355 ? _T_39[31:0] : _GEN_1034; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1036 = 4'hd == _T_3355 ? _T_42[31:0] : _GEN_1035; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1037 = 4'he == _T_3355 ? _T_45[31:0] : _GEN_1036; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1038 = 4'hf == _T_3355 ? _T_48[31:0] : _GEN_1037; // @[decompressorChisel.scala 32:58]
  wire [4:0] _GEN_3094 = {{1'd0}, _T_3355}; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1039 = 5'h10 == _GEN_3094 ? _T_51[31:0] : _GEN_1038; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1040 = 5'h11 == _GEN_3094 ? _T_54[31:0] : _GEN_1039; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1041 = 5'h12 == _GEN_3094 ? _T_57[31:0] : _GEN_1040; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1042 = 5'h13 == _GEN_3094 ? _T_60[31:0] : _GEN_1041; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1043 = 5'h14 == _GEN_3094 ? _T_63[31:0] : _GEN_1042; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1044 = 5'h15 == _GEN_3094 ? _T_66[31:0] : _GEN_1043; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1045 = 5'h16 == _GEN_3094 ? _T_69[31:0] : _GEN_1044; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1046 = 5'h17 == _GEN_3094 ? _T_72[31:0] : _GEN_1045; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1047 = 5'h18 == _GEN_3094 ? _T_75[31:0] : _GEN_1046; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1048 = 5'h19 == _GEN_3094 ? _T_78[31:0] : _GEN_1047; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1049 = 5'h1a == _GEN_3094 ? _T_81[31:0] : _GEN_1048; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1050 = 5'h1b == _GEN_3094 ? _T_84[31:0] : _GEN_1049; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1051 = 5'h1c == _GEN_3094 ? _T_87[31:0] : _GEN_1050; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1052 = 5'h1d == _GEN_3094 ? _T_90[31:0] : _GEN_1051; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1053 = 5'h1e == _GEN_3094 ? _T_93[31:0] : _GEN_1052; // @[decompressorChisel.scala 32:58]
  wire [31:0] _GEN_1054 = 5'h1f == _GEN_3094 ? io_dataIn_0_bits : _GEN_1053; // @[decompressorChisel.scala 32:58]
  wire [77:0] _GEN_3110 = {{46'd0}, _GEN_1054}; // @[decompressorChisel.scala 32:58]
  wire  _T_3359 = _GEN_3110 == _T_3358; // @[decompressorChisel.scala 32:58]
  wire  matchingEncoding_0_31 = _T_3353 ? 1'h0 : _T_3359; // @[decompressorChisel.scala 29:35]
  wire  _T_3361 = unencodedCharacters_0 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3363 = 6'h20 - 6'h8; // @[decompressorChisel.scala 117:52]
  wire [5:0] _T_3365 = _T_3363 - _GEN_1542; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3366 = io_dataIn_0_bits >> _T_3365; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1056 = _T_3361 ? _T_3366 : {{23'd0}, unencodedCharacters_0}; // @[decompressorChisel.scala 113:99]
  wire  _T_3368 = unencodedCharacters_1 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3372 = _T_3363 - _GEN_1592; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3373 = io_dataIn_0_bits >> _T_3372; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1057 = _T_3368 ? _T_3373 : {{23'd0}, unencodedCharacters_1}; // @[decompressorChisel.scala 113:99]
  wire  _T_3375 = unencodedCharacters_2 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3379 = _T_3363 - _GEN_1642; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3380 = io_dataIn_0_bits >> _T_3379; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1058 = _T_3375 ? _T_3380 : {{23'd0}, unencodedCharacters_2}; // @[decompressorChisel.scala 113:99]
  wire  _T_3382 = unencodedCharacters_3 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3386 = _T_3363 - _GEN_1692; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3387 = io_dataIn_0_bits >> _T_3386; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1059 = _T_3382 ? _T_3387 : {{23'd0}, unencodedCharacters_3}; // @[decompressorChisel.scala 113:99]
  wire  _T_3389 = unencodedCharacters_4 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3393 = _T_3363 - _GEN_1742; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3394 = io_dataIn_0_bits >> _T_3393; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1060 = _T_3389 ? _T_3394 : {{23'd0}, unencodedCharacters_4}; // @[decompressorChisel.scala 113:99]
  wire  _T_3396 = unencodedCharacters_5 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3400 = _T_3363 - _GEN_1792; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3401 = io_dataIn_0_bits >> _T_3400; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1061 = _T_3396 ? _T_3401 : {{23'd0}, unencodedCharacters_5}; // @[decompressorChisel.scala 113:99]
  wire  _T_3403 = unencodedCharacters_6 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3407 = _T_3363 - _GEN_1842; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3408 = io_dataIn_0_bits >> _T_3407; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1062 = _T_3403 ? _T_3408 : {{23'd0}, unencodedCharacters_6}; // @[decompressorChisel.scala 113:99]
  wire  _T_3410 = unencodedCharacters_7 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3414 = _T_3363 - _GEN_1892; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3415 = io_dataIn_0_bits >> _T_3414; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1063 = _T_3410 ? _T_3415 : {{23'd0}, unencodedCharacters_7}; // @[decompressorChisel.scala 113:99]
  wire  _T_3417 = unencodedCharacters_8 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3421 = _T_3363 - _GEN_1942; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3422 = io_dataIn_0_bits >> _T_3421; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1064 = _T_3417 ? _T_3422 : {{23'd0}, unencodedCharacters_8}; // @[decompressorChisel.scala 113:99]
  wire  _T_3424 = unencodedCharacters_9 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3428 = _T_3363 - _GEN_1992; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3429 = io_dataIn_0_bits >> _T_3428; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1065 = _T_3424 ? _T_3429 : {{23'd0}, unencodedCharacters_9}; // @[decompressorChisel.scala 113:99]
  wire  _T_3431 = unencodedCharacters_10 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3435 = _T_3363 - _GEN_2042; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3436 = io_dataIn_0_bits >> _T_3435; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1066 = _T_3431 ? _T_3436 : {{23'd0}, unencodedCharacters_10}; // @[decompressorChisel.scala 113:99]
  wire  _T_3438 = unencodedCharacters_11 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3442 = _T_3363 - _GEN_2092; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3443 = io_dataIn_0_bits >> _T_3442; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1067 = _T_3438 ? _T_3443 : {{23'd0}, unencodedCharacters_11}; // @[decompressorChisel.scala 113:99]
  wire  _T_3445 = unencodedCharacters_12 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3449 = _T_3363 - _GEN_2142; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3450 = io_dataIn_0_bits >> _T_3449; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1068 = _T_3445 ? _T_3450 : {{23'd0}, unencodedCharacters_12}; // @[decompressorChisel.scala 113:99]
  wire  _T_3452 = unencodedCharacters_13 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3456 = _T_3363 - _GEN_2192; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3457 = io_dataIn_0_bits >> _T_3456; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1069 = _T_3452 ? _T_3457 : {{23'd0}, unencodedCharacters_13}; // @[decompressorChisel.scala 113:99]
  wire  _T_3459 = unencodedCharacters_14 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3463 = _T_3363 - _GEN_2242; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3464 = io_dataIn_0_bits >> _T_3463; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1070 = _T_3459 ? _T_3464 : {{23'd0}, unencodedCharacters_14}; // @[decompressorChisel.scala 113:99]
  wire  _T_3466 = unencodedCharacters_15 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3470 = _T_3363 - _GEN_2292; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3471 = io_dataIn_0_bits >> _T_3470; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1071 = _T_3466 ? _T_3471 : {{23'd0}, unencodedCharacters_15}; // @[decompressorChisel.scala 113:99]
  wire  _T_3473 = unencodedCharacters_16 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3477 = _T_3363 - _GEN_2342; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3478 = io_dataIn_0_bits >> _T_3477; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1072 = _T_3473 ? _T_3478 : {{23'd0}, unencodedCharacters_16}; // @[decompressorChisel.scala 113:99]
  wire  _T_3480 = unencodedCharacters_17 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3484 = _T_3363 - _GEN_2392; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3485 = io_dataIn_0_bits >> _T_3484; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1073 = _T_3480 ? _T_3485 : {{23'd0}, unencodedCharacters_17}; // @[decompressorChisel.scala 113:99]
  wire  _T_3487 = unencodedCharacters_18 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3491 = _T_3363 - _GEN_2442; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3492 = io_dataIn_0_bits >> _T_3491; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1074 = _T_3487 ? _T_3492 : {{23'd0}, unencodedCharacters_18}; // @[decompressorChisel.scala 113:99]
  wire  _T_3494 = unencodedCharacters_19 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3498 = _T_3363 - _GEN_2492; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3499 = io_dataIn_0_bits >> _T_3498; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1075 = _T_3494 ? _T_3499 : {{23'd0}, unencodedCharacters_19}; // @[decompressorChisel.scala 113:99]
  wire  _T_3501 = unencodedCharacters_20 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3505 = _T_3363 - _GEN_2542; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3506 = io_dataIn_0_bits >> _T_3505; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1076 = _T_3501 ? _T_3506 : {{23'd0}, unencodedCharacters_20}; // @[decompressorChisel.scala 113:99]
  wire  _T_3508 = unencodedCharacters_21 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3512 = _T_3363 - _GEN_2592; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3513 = io_dataIn_0_bits >> _T_3512; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1077 = _T_3508 ? _T_3513 : {{23'd0}, unencodedCharacters_21}; // @[decompressorChisel.scala 113:99]
  wire  _T_3515 = unencodedCharacters_22 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3519 = _T_3363 - _GEN_2642; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3520 = io_dataIn_0_bits >> _T_3519; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1078 = _T_3515 ? _T_3520 : {{23'd0}, unencodedCharacters_22}; // @[decompressorChisel.scala 113:99]
  wire  _T_3522 = unencodedCharacters_23 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3526 = _T_3363 - _GEN_2692; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3527 = io_dataIn_0_bits >> _T_3526; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1079 = _T_3522 ? _T_3527 : {{23'd0}, unencodedCharacters_23}; // @[decompressorChisel.scala 113:99]
  wire  _T_3529 = unencodedCharacters_24 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3533 = _T_3363 - _GEN_2742; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3534 = io_dataIn_0_bits >> _T_3533; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1080 = _T_3529 ? _T_3534 : {{23'd0}, unencodedCharacters_24}; // @[decompressorChisel.scala 113:99]
  wire  _T_3536 = unencodedCharacters_25 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3540 = _T_3363 - _GEN_2792; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3541 = io_dataIn_0_bits >> _T_3540; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1081 = _T_3536 ? _T_3541 : {{23'd0}, unencodedCharacters_25}; // @[decompressorChisel.scala 113:99]
  wire  _T_3543 = unencodedCharacters_26 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3547 = _T_3363 - _GEN_2842; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3548 = io_dataIn_0_bits >> _T_3547; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1082 = _T_3543 ? _T_3548 : {{23'd0}, unencodedCharacters_26}; // @[decompressorChisel.scala 113:99]
  wire  _T_3550 = unencodedCharacters_27 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3554 = _T_3363 - _GEN_2892; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3555 = io_dataIn_0_bits >> _T_3554; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1083 = _T_3550 ? _T_3555 : {{23'd0}, unencodedCharacters_27}; // @[decompressorChisel.scala 113:99]
  wire  _T_3557 = unencodedCharacters_28 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3561 = _T_3363 - _GEN_2942; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3562 = io_dataIn_0_bits >> _T_3561; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1084 = _T_3557 ? _T_3562 : {{23'd0}, unencodedCharacters_28}; // @[decompressorChisel.scala 113:99]
  wire  _T_3564 = unencodedCharacters_29 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3568 = _T_3363 - _GEN_2992; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3569 = io_dataIn_0_bits >> _T_3568; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1085 = _T_3564 ? _T_3569 : {{23'd0}, unencodedCharacters_29}; // @[decompressorChisel.scala 113:99]
  wire  _T_3571 = unencodedCharacters_30 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3575 = _T_3363 - _GEN_3042; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3576 = io_dataIn_0_bits >> _T_3575; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1086 = _T_3571 ? _T_3576 : {{23'd0}, unencodedCharacters_30}; // @[decompressorChisel.scala 113:99]
  wire  _T_3578 = unencodedCharacters_31 == 9'h100; // @[decompressorChisel.scala 113:46]
  wire [5:0] _T_3582 = _T_3363 - _GEN_3092; // @[decompressorChisel.scala 117:77]
  wire [31:0] _T_3583 = io_dataIn_0_bits >> _T_3582; // @[decompressorChisel.scala 117:17]
  wire [31:0] _GEN_1087 = _T_3578 ? _T_3583 : {{23'd0}, unencodedCharacters_31}; // @[decompressorChisel.scala 113:99]
  wire  _T_3584 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_3586 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire [14:0] _T_3594 = currentBit_0 + 15'h20; // @[decompressorChisel.scala 169:40]
  wire [12:0] _T_3596 = iterations_0 + 13'h1; // @[decompressorChisel.scala 170:40]
  wire  _T_3599 = _T_3596 >= 13'h20; // @[decompressorChisel.scala 171:34]
  wire  _T_3600 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_3601 = iterations_0 < 13'h1000; // @[decompressorChisel.scala 187:32]
  wire [7:0] matchingCharacter_0_0 = _GEN_1056[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3602 = matchingEncoding_0_0 ? matchingCharacter_0_0 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_1 = _GEN_1057[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3603 = matchingEncoding_0_1 ? matchingCharacter_0_1 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_2 = _GEN_1058[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3604 = matchingEncoding_0_2 ? matchingCharacter_0_2 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_3 = _GEN_1059[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3605 = matchingEncoding_0_3 ? matchingCharacter_0_3 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_4 = _GEN_1060[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3606 = matchingEncoding_0_4 ? matchingCharacter_0_4 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_5 = _GEN_1061[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3607 = matchingEncoding_0_5 ? matchingCharacter_0_5 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_6 = _GEN_1062[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3608 = matchingEncoding_0_6 ? matchingCharacter_0_6 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_7 = _GEN_1063[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3609 = matchingEncoding_0_7 ? matchingCharacter_0_7 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_8 = _GEN_1064[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3610 = matchingEncoding_0_8 ? matchingCharacter_0_8 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_9 = _GEN_1065[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3611 = matchingEncoding_0_9 ? matchingCharacter_0_9 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_10 = _GEN_1066[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3612 = matchingEncoding_0_10 ? matchingCharacter_0_10 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_11 = _GEN_1067[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3613 = matchingEncoding_0_11 ? matchingCharacter_0_11 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_12 = _GEN_1068[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3614 = matchingEncoding_0_12 ? matchingCharacter_0_12 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_13 = _GEN_1069[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3615 = matchingEncoding_0_13 ? matchingCharacter_0_13 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_14 = _GEN_1070[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3616 = matchingEncoding_0_14 ? matchingCharacter_0_14 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_15 = _GEN_1071[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3617 = matchingEncoding_0_15 ? matchingCharacter_0_15 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_16 = _GEN_1072[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3618 = matchingEncoding_0_16 ? matchingCharacter_0_16 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_17 = _GEN_1073[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3619 = matchingEncoding_0_17 ? matchingCharacter_0_17 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_18 = _GEN_1074[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3620 = matchingEncoding_0_18 ? matchingCharacter_0_18 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_19 = _GEN_1075[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3621 = matchingEncoding_0_19 ? matchingCharacter_0_19 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_20 = _GEN_1076[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3622 = matchingEncoding_0_20 ? matchingCharacter_0_20 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_21 = _GEN_1077[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3623 = matchingEncoding_0_21 ? matchingCharacter_0_21 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_22 = _GEN_1078[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3624 = matchingEncoding_0_22 ? matchingCharacter_0_22 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_23 = _GEN_1079[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3625 = matchingEncoding_0_23 ? matchingCharacter_0_23 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_24 = _GEN_1080[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3626 = matchingEncoding_0_24 ? matchingCharacter_0_24 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_25 = _GEN_1081[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3627 = matchingEncoding_0_25 ? matchingCharacter_0_25 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_26 = _GEN_1082[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3628 = matchingEncoding_0_26 ? matchingCharacter_0_26 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_27 = _GEN_1083[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3629 = matchingEncoding_0_27 ? matchingCharacter_0_27 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_28 = _GEN_1084[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3630 = matchingEncoding_0_28 ? matchingCharacter_0_28 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_29 = _GEN_1085[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3631 = matchingEncoding_0_29 ? matchingCharacter_0_29 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_30 = _GEN_1086[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3632 = matchingEncoding_0_30 ? matchingCharacter_0_30 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] matchingCharacter_0_31 = _GEN_1087[7:0]; // @[decompressorChisel.scala 105:31 decompressorChisel.scala 115:56 decompressorChisel.scala 122:56]
  wire [7:0] _T_3633 = matchingEncoding_0_31 ? matchingCharacter_0_31 : 8'h0; // @[Mux.scala 27:72]
  wire [7:0] _T_3634 = _T_3602 | _T_3603; // @[Mux.scala 27:72]
  wire [7:0] _T_3635 = _T_3634 | _T_3604; // @[Mux.scala 27:72]
  wire [7:0] _T_3636 = _T_3635 | _T_3605; // @[Mux.scala 27:72]
  wire [7:0] _T_3637 = _T_3636 | _T_3606; // @[Mux.scala 27:72]
  wire [7:0] _T_3638 = _T_3637 | _T_3607; // @[Mux.scala 27:72]
  wire [7:0] _T_3639 = _T_3638 | _T_3608; // @[Mux.scala 27:72]
  wire [7:0] _T_3640 = _T_3639 | _T_3609; // @[Mux.scala 27:72]
  wire [7:0] _T_3641 = _T_3640 | _T_3610; // @[Mux.scala 27:72]
  wire [7:0] _T_3642 = _T_3641 | _T_3611; // @[Mux.scala 27:72]
  wire [7:0] _T_3643 = _T_3642 | _T_3612; // @[Mux.scala 27:72]
  wire [7:0] _T_3644 = _T_3643 | _T_3613; // @[Mux.scala 27:72]
  wire [7:0] _T_3645 = _T_3644 | _T_3614; // @[Mux.scala 27:72]
  wire [7:0] _T_3646 = _T_3645 | _T_3615; // @[Mux.scala 27:72]
  wire [7:0] _T_3647 = _T_3646 | _T_3616; // @[Mux.scala 27:72]
  wire [7:0] _T_3648 = _T_3647 | _T_3617; // @[Mux.scala 27:72]
  wire [7:0] _T_3649 = _T_3648 | _T_3618; // @[Mux.scala 27:72]
  wire [7:0] _T_3650 = _T_3649 | _T_3619; // @[Mux.scala 27:72]
  wire [7:0] _T_3651 = _T_3650 | _T_3620; // @[Mux.scala 27:72]
  wire [7:0] _T_3652 = _T_3651 | _T_3621; // @[Mux.scala 27:72]
  wire [7:0] _T_3653 = _T_3652 | _T_3622; // @[Mux.scala 27:72]
  wire [7:0] _T_3654 = _T_3653 | _T_3623; // @[Mux.scala 27:72]
  wire [7:0] _T_3655 = _T_3654 | _T_3624; // @[Mux.scala 27:72]
  wire [7:0] _T_3656 = _T_3655 | _T_3625; // @[Mux.scala 27:72]
  wire [7:0] _T_3657 = _T_3656 | _T_3626; // @[Mux.scala 27:72]
  wire [7:0] _T_3658 = _T_3657 | _T_3627; // @[Mux.scala 27:72]
  wire [7:0] _T_3659 = _T_3658 | _T_3628; // @[Mux.scala 27:72]
  wire [7:0] _T_3660 = _T_3659 | _T_3629; // @[Mux.scala 27:72]
  wire [7:0] _T_3661 = _T_3660 | _T_3630; // @[Mux.scala 27:72]
  wire [7:0] _T_3662 = _T_3661 | _T_3631; // @[Mux.scala 27:72]
  wire [7:0] _T_3663 = _T_3662 | _T_3632; // @[Mux.scala 27:72]
  wire [7:0] _T_3664 = _T_3663 | _T_3633; // @[Mux.scala 27:72]
  wire [3:0] _T_3666 = matchingEncoding_0_0 ? encodedLength_0 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3667 = matchingEncoding_0_1 ? encodedLength_1 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3668 = matchingEncoding_0_2 ? encodedLength_2 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3669 = matchingEncoding_0_3 ? encodedLength_3 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3670 = matchingEncoding_0_4 ? encodedLength_4 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3671 = matchingEncoding_0_5 ? encodedLength_5 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3672 = matchingEncoding_0_6 ? encodedLength_6 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3673 = matchingEncoding_0_7 ? encodedLength_7 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3674 = matchingEncoding_0_8 ? encodedLength_8 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3675 = matchingEncoding_0_9 ? encodedLength_9 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3676 = matchingEncoding_0_10 ? encodedLength_10 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3677 = matchingEncoding_0_11 ? encodedLength_11 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3678 = matchingEncoding_0_12 ? encodedLength_12 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3679 = matchingEncoding_0_13 ? encodedLength_13 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3680 = matchingEncoding_0_14 ? encodedLength_14 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3681 = matchingEncoding_0_15 ? encodedLength_15 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3682 = matchingEncoding_0_16 ? encodedLength_16 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3683 = matchingEncoding_0_17 ? encodedLength_17 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3684 = matchingEncoding_0_18 ? encodedLength_18 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3685 = matchingEncoding_0_19 ? encodedLength_19 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3686 = matchingEncoding_0_20 ? encodedLength_20 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3687 = matchingEncoding_0_21 ? encodedLength_21 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3688 = matchingEncoding_0_22 ? encodedLength_22 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3689 = matchingEncoding_0_23 ? encodedLength_23 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3690 = matchingEncoding_0_24 ? encodedLength_24 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3691 = matchingEncoding_0_25 ? encodedLength_25 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3692 = matchingEncoding_0_26 ? encodedLength_26 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3693 = matchingEncoding_0_27 ? encodedLength_27 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3694 = matchingEncoding_0_28 ? encodedLength_28 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3695 = matchingEncoding_0_29 ? encodedLength_29 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3696 = matchingEncoding_0_30 ? encodedLength_30 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3697 = matchingEncoding_0_31 ? encodedLength_31 : 4'h0; // @[Mux.scala 27:72]
  wire [3:0] _T_3698 = _T_3666 | _T_3667; // @[Mux.scala 27:72]
  wire [3:0] _T_3699 = _T_3698 | _T_3668; // @[Mux.scala 27:72]
  wire [3:0] _T_3700 = _T_3699 | _T_3669; // @[Mux.scala 27:72]
  wire [3:0] _T_3701 = _T_3700 | _T_3670; // @[Mux.scala 27:72]
  wire [3:0] _T_3702 = _T_3701 | _T_3671; // @[Mux.scala 27:72]
  wire [3:0] _T_3703 = _T_3702 | _T_3672; // @[Mux.scala 27:72]
  wire [3:0] _T_3704 = _T_3703 | _T_3673; // @[Mux.scala 27:72]
  wire [3:0] _T_3705 = _T_3704 | _T_3674; // @[Mux.scala 27:72]
  wire [3:0] _T_3706 = _T_3705 | _T_3675; // @[Mux.scala 27:72]
  wire [3:0] _T_3707 = _T_3706 | _T_3676; // @[Mux.scala 27:72]
  wire [3:0] _T_3708 = _T_3707 | _T_3677; // @[Mux.scala 27:72]
  wire [3:0] _T_3709 = _T_3708 | _T_3678; // @[Mux.scala 27:72]
  wire [3:0] _T_3710 = _T_3709 | _T_3679; // @[Mux.scala 27:72]
  wire [3:0] _T_3711 = _T_3710 | _T_3680; // @[Mux.scala 27:72]
  wire [3:0] _T_3712 = _T_3711 | _T_3681; // @[Mux.scala 27:72]
  wire [3:0] _T_3713 = _T_3712 | _T_3682; // @[Mux.scala 27:72]
  wire [3:0] _T_3714 = _T_3713 | _T_3683; // @[Mux.scala 27:72]
  wire [3:0] _T_3715 = _T_3714 | _T_3684; // @[Mux.scala 27:72]
  wire [3:0] _T_3716 = _T_3715 | _T_3685; // @[Mux.scala 27:72]
  wire [3:0] _T_3717 = _T_3716 | _T_3686; // @[Mux.scala 27:72]
  wire [3:0] _T_3718 = _T_3717 | _T_3687; // @[Mux.scala 27:72]
  wire [3:0] _T_3719 = _T_3718 | _T_3688; // @[Mux.scala 27:72]
  wire [3:0] _T_3720 = _T_3719 | _T_3689; // @[Mux.scala 27:72]
  wire [3:0] _T_3721 = _T_3720 | _T_3690; // @[Mux.scala 27:72]
  wire [3:0] _T_3722 = _T_3721 | _T_3691; // @[Mux.scala 27:72]
  wire [3:0] _T_3723 = _T_3722 | _T_3692; // @[Mux.scala 27:72]
  wire [3:0] _T_3724 = _T_3723 | _T_3693; // @[Mux.scala 27:72]
  wire [3:0] _T_3725 = _T_3724 | _T_3694; // @[Mux.scala 27:72]
  wire [3:0] _T_3726 = _T_3725 | _T_3695; // @[Mux.scala 27:72]
  wire [3:0] _T_3727 = _T_3726 | _T_3696; // @[Mux.scala 27:72]
  wire [3:0] _T_3728 = _T_3727 | _T_3697; // @[Mux.scala 27:72]
  wire [14:0] _GEN_3143 = {{11'd0}, _T_3728}; // @[decompressorChisel.scala 196:54]
  wire [14:0] _T_3731 = currentBit_0 + _GEN_3143; // @[decompressorChisel.scala 196:54]
  wire [7:0] _GEN_1292 = io_dataIn_0_valid ? _T_3664 : 8'h0; // @[decompressorChisel.scala 189:40]
  wire  _GEN_1296 = _T_3601 & io_dataIn_0_valid; // @[decompressorChisel.scala 187:63]
  wire [7:0] _GEN_1297 = _T_3601 ? _GEN_1292 : 8'h0; // @[decompressorChisel.scala 187:63]
  wire  _T_3734 = iterations_0 >= 13'h1000; // @[decompressorChisel.scala 203:29]
  wire  _GEN_1301 = _T_3600 & _GEN_1296; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1302 = _T_3600 ? _GEN_1297 : 8'h0; // @[Conditional.scala 39:67]
  wire  _GEN_1407 = _T_3586 ? 1'h0 : _GEN_1301; // @[Conditional.scala 39:67]
  wire [7:0] _GEN_1408 = _T_3586 ? 8'h0 : _GEN_1302; // @[Conditional.scala 39:67]
  assign io_currentBit_0 = currentBit_0; // @[decompressorChisel.scala 134:26]
  assign io_dataOut_0_valid = _T_3584 ? 1'h0 : _GEN_1407; // @[decompressorChisel.scala 131:29 decompressorChisel.scala 185:33 decompressorChisel.scala 190:37]
  assign io_dataOut_0_bits = _T_3584 ? 8'h0 : _GEN_1408; // @[decompressorChisel.scala 132:28 decompressorChisel.scala 186:32 decompressorChisel.scala 191:36]
  assign io_finished = state == 2'h0; // @[decompressorChisel.scala 208:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  iterations_0 = _RAND_1[12:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  currentBit_0 = _RAND_2[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  unencodedCharacters_0 = _RAND_3[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  unencodedCharacters_1 = _RAND_4[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  unencodedCharacters_2 = _RAND_5[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  unencodedCharacters_3 = _RAND_6[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  unencodedCharacters_4 = _RAND_7[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  unencodedCharacters_5 = _RAND_8[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  unencodedCharacters_6 = _RAND_9[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  unencodedCharacters_7 = _RAND_10[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  unencodedCharacters_8 = _RAND_11[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  unencodedCharacters_9 = _RAND_12[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  unencodedCharacters_10 = _RAND_13[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  unencodedCharacters_11 = _RAND_14[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  unencodedCharacters_12 = _RAND_15[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  unencodedCharacters_13 = _RAND_16[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  unencodedCharacters_14 = _RAND_17[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  unencodedCharacters_15 = _RAND_18[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  unencodedCharacters_16 = _RAND_19[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  unencodedCharacters_17 = _RAND_20[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  unencodedCharacters_18 = _RAND_21[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  unencodedCharacters_19 = _RAND_22[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  unencodedCharacters_20 = _RAND_23[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  unencodedCharacters_21 = _RAND_24[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  unencodedCharacters_22 = _RAND_25[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  unencodedCharacters_23 = _RAND_26[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  unencodedCharacters_24 = _RAND_27[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  unencodedCharacters_25 = _RAND_28[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  unencodedCharacters_26 = _RAND_29[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  unencodedCharacters_27 = _RAND_30[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  unencodedCharacters_28 = _RAND_31[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  unencodedCharacters_29 = _RAND_32[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  unencodedCharacters_30 = _RAND_33[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  unencodedCharacters_31 = _RAND_34[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  encodedCharacters_0 = _RAND_35[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  encodedCharacters_1 = _RAND_36[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  encodedCharacters_2 = _RAND_37[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  encodedCharacters_3 = _RAND_38[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  encodedCharacters_4 = _RAND_39[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  encodedCharacters_5 = _RAND_40[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  encodedCharacters_6 = _RAND_41[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  encodedCharacters_7 = _RAND_42[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  encodedCharacters_8 = _RAND_43[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  encodedCharacters_9 = _RAND_44[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  encodedCharacters_10 = _RAND_45[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  encodedCharacters_11 = _RAND_46[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  encodedCharacters_12 = _RAND_47[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  encodedCharacters_13 = _RAND_48[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  encodedCharacters_14 = _RAND_49[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  encodedCharacters_15 = _RAND_50[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  encodedCharacters_16 = _RAND_51[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  encodedCharacters_17 = _RAND_52[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  encodedCharacters_18 = _RAND_53[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  encodedCharacters_19 = _RAND_54[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  encodedCharacters_20 = _RAND_55[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  encodedCharacters_21 = _RAND_56[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  encodedCharacters_22 = _RAND_57[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  encodedCharacters_23 = _RAND_58[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  encodedCharacters_24 = _RAND_59[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  encodedCharacters_25 = _RAND_60[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  encodedCharacters_26 = _RAND_61[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  encodedCharacters_27 = _RAND_62[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  encodedCharacters_28 = _RAND_63[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  encodedCharacters_29 = _RAND_64[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  encodedCharacters_30 = _RAND_65[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  encodedCharacters_31 = _RAND_66[14:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  encodedLength_0 = _RAND_67[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  encodedLength_1 = _RAND_68[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {1{`RANDOM}};
  encodedLength_2 = _RAND_69[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {1{`RANDOM}};
  encodedLength_3 = _RAND_70[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  encodedLength_4 = _RAND_71[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {1{`RANDOM}};
  encodedLength_5 = _RAND_72[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {1{`RANDOM}};
  encodedLength_6 = _RAND_73[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {1{`RANDOM}};
  encodedLength_7 = _RAND_74[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  encodedLength_8 = _RAND_75[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  encodedLength_9 = _RAND_76[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  encodedLength_10 = _RAND_77[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  encodedLength_11 = _RAND_78[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {1{`RANDOM}};
  encodedLength_12 = _RAND_79[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {1{`RANDOM}};
  encodedLength_13 = _RAND_80[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {1{`RANDOM}};
  encodedLength_14 = _RAND_81[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {1{`RANDOM}};
  encodedLength_15 = _RAND_82[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  encodedLength_16 = _RAND_83[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {1{`RANDOM}};
  encodedLength_17 = _RAND_84[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {1{`RANDOM}};
  encodedLength_18 = _RAND_85[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_86 = {1{`RANDOM}};
  encodedLength_19 = _RAND_86[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_87 = {1{`RANDOM}};
  encodedLength_20 = _RAND_87[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_88 = {1{`RANDOM}};
  encodedLength_21 = _RAND_88[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_89 = {1{`RANDOM}};
  encodedLength_22 = _RAND_89[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_90 = {1{`RANDOM}};
  encodedLength_23 = _RAND_90[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_91 = {1{`RANDOM}};
  encodedLength_24 = _RAND_91[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_92 = {1{`RANDOM}};
  encodedLength_25 = _RAND_92[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_93 = {1{`RANDOM}};
  encodedLength_26 = _RAND_93[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_94 = {1{`RANDOM}};
  encodedLength_27 = _RAND_94[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_95 = {1{`RANDOM}};
  encodedLength_28 = _RAND_95[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_96 = {1{`RANDOM}};
  encodedLength_29 = _RAND_96[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_97 = {1{`RANDOM}};
  encodedLength_30 = _RAND_97[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_98 = {1{`RANDOM}};
  encodedLength_31 = _RAND_98[3:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_3584) begin
      if (io_start) begin
        state <= 2'h1;
      end
    end else if (_T_3586) begin
      if (io_dataIn_0_valid) begin
        if (_T_3599) begin
          state <= 2'h2;
        end
      end
    end else if (_T_3600) begin
      if (_T_3734) begin
        state <= 2'h0;
      end
    end
    if (_T_3584) begin
      if (io_start) begin
        iterations_0 <= 13'h0;
      end
    end else if (_T_3586) begin
      if (io_dataIn_0_valid) begin
        if (_T_3599) begin
          iterations_0 <= 13'h0;
        end else begin
          iterations_0 <= _T_3596;
        end
      end
    end else if (_T_3600) begin
      if (_T_3601) begin
        if (io_dataIn_0_valid) begin
          if (io_dataOut_0_ready) begin
            iterations_0 <= _T_3596;
          end
        end
      end
    end
    if (_T_3584) begin
      if (io_start) begin
        currentBit_0 <= 15'h0;
      end
    end else if (_T_3586) begin
      if (io_dataIn_0_valid) begin
        if (_T_3599) begin
          currentBit_0 <= 15'h0;
        end else begin
          currentBit_0 <= _T_3594;
        end
      end
    end else if (_T_3600) begin
      if (_T_3601) begin
        if (io_dataIn_0_valid) begin
          if (io_dataOut_0_ready) begin
            currentBit_0 <= _T_3731;
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h0 == iterations_0[4:0]) begin
            unencodedCharacters_0 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1 == iterations_0[4:0]) begin
            unencodedCharacters_1 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h2 == iterations_0[4:0]) begin
            unencodedCharacters_2 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h3 == iterations_0[4:0]) begin
            unencodedCharacters_3 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h4 == iterations_0[4:0]) begin
            unencodedCharacters_4 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h5 == iterations_0[4:0]) begin
            unencodedCharacters_5 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h6 == iterations_0[4:0]) begin
            unencodedCharacters_6 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h7 == iterations_0[4:0]) begin
            unencodedCharacters_7 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h8 == iterations_0[4:0]) begin
            unencodedCharacters_8 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h9 == iterations_0[4:0]) begin
            unencodedCharacters_9 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'ha == iterations_0[4:0]) begin
            unencodedCharacters_10 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hb == iterations_0[4:0]) begin
            unencodedCharacters_11 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hc == iterations_0[4:0]) begin
            unencodedCharacters_12 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hd == iterations_0[4:0]) begin
            unencodedCharacters_13 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'he == iterations_0[4:0]) begin
            unencodedCharacters_14 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hf == iterations_0[4:0]) begin
            unencodedCharacters_15 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h10 == iterations_0[4:0]) begin
            unencodedCharacters_16 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h11 == iterations_0[4:0]) begin
            unencodedCharacters_17 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h12 == iterations_0[4:0]) begin
            unencodedCharacters_18 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h13 == iterations_0[4:0]) begin
            unencodedCharacters_19 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h14 == iterations_0[4:0]) begin
            unencodedCharacters_20 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h15 == iterations_0[4:0]) begin
            unencodedCharacters_21 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h16 == iterations_0[4:0]) begin
            unencodedCharacters_22 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h17 == iterations_0[4:0]) begin
            unencodedCharacters_23 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h18 == iterations_0[4:0]) begin
            unencodedCharacters_24 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h19 == iterations_0[4:0]) begin
            unencodedCharacters_25 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1a == iterations_0[4:0]) begin
            unencodedCharacters_26 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1b == iterations_0[4:0]) begin
            unencodedCharacters_27 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1c == iterations_0[4:0]) begin
            unencodedCharacters_28 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1d == iterations_0[4:0]) begin
            unencodedCharacters_29 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1e == iterations_0[4:0]) begin
            unencodedCharacters_30 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1f == iterations_0[4:0]) begin
            unencodedCharacters_31 <= io_dataIn_0_bits[31:23];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h0 == iterations_0[4:0]) begin
            encodedCharacters_0 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1 == iterations_0[4:0]) begin
            encodedCharacters_1 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h2 == iterations_0[4:0]) begin
            encodedCharacters_2 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h3 == iterations_0[4:0]) begin
            encodedCharacters_3 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h4 == iterations_0[4:0]) begin
            encodedCharacters_4 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h5 == iterations_0[4:0]) begin
            encodedCharacters_5 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h6 == iterations_0[4:0]) begin
            encodedCharacters_6 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h7 == iterations_0[4:0]) begin
            encodedCharacters_7 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h8 == iterations_0[4:0]) begin
            encodedCharacters_8 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h9 == iterations_0[4:0]) begin
            encodedCharacters_9 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'ha == iterations_0[4:0]) begin
            encodedCharacters_10 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hb == iterations_0[4:0]) begin
            encodedCharacters_11 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hc == iterations_0[4:0]) begin
            encodedCharacters_12 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hd == iterations_0[4:0]) begin
            encodedCharacters_13 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'he == iterations_0[4:0]) begin
            encodedCharacters_14 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hf == iterations_0[4:0]) begin
            encodedCharacters_15 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h10 == iterations_0[4:0]) begin
            encodedCharacters_16 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h11 == iterations_0[4:0]) begin
            encodedCharacters_17 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h12 == iterations_0[4:0]) begin
            encodedCharacters_18 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h13 == iterations_0[4:0]) begin
            encodedCharacters_19 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h14 == iterations_0[4:0]) begin
            encodedCharacters_20 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h15 == iterations_0[4:0]) begin
            encodedCharacters_21 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h16 == iterations_0[4:0]) begin
            encodedCharacters_22 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h17 == iterations_0[4:0]) begin
            encodedCharacters_23 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h18 == iterations_0[4:0]) begin
            encodedCharacters_24 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h19 == iterations_0[4:0]) begin
            encodedCharacters_25 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1a == iterations_0[4:0]) begin
            encodedCharacters_26 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1b == iterations_0[4:0]) begin
            encodedCharacters_27 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1c == iterations_0[4:0]) begin
            encodedCharacters_28 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1d == iterations_0[4:0]) begin
            encodedCharacters_29 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1e == iterations_0[4:0]) begin
            encodedCharacters_30 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1f == iterations_0[4:0]) begin
            encodedCharacters_31 <= io_dataIn_0_bits[22:8];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h0 == iterations_0[4:0]) begin
            encodedLength_0 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1 == iterations_0[4:0]) begin
            encodedLength_1 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h2 == iterations_0[4:0]) begin
            encodedLength_2 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h3 == iterations_0[4:0]) begin
            encodedLength_3 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h4 == iterations_0[4:0]) begin
            encodedLength_4 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h5 == iterations_0[4:0]) begin
            encodedLength_5 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h6 == iterations_0[4:0]) begin
            encodedLength_6 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h7 == iterations_0[4:0]) begin
            encodedLength_7 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h8 == iterations_0[4:0]) begin
            encodedLength_8 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h9 == iterations_0[4:0]) begin
            encodedLength_9 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'ha == iterations_0[4:0]) begin
            encodedLength_10 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hb == iterations_0[4:0]) begin
            encodedLength_11 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hc == iterations_0[4:0]) begin
            encodedLength_12 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hd == iterations_0[4:0]) begin
            encodedLength_13 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'he == iterations_0[4:0]) begin
            encodedLength_14 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'hf == iterations_0[4:0]) begin
            encodedLength_15 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h10 == iterations_0[4:0]) begin
            encodedLength_16 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h11 == iterations_0[4:0]) begin
            encodedLength_17 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h12 == iterations_0[4:0]) begin
            encodedLength_18 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h13 == iterations_0[4:0]) begin
            encodedLength_19 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h14 == iterations_0[4:0]) begin
            encodedLength_20 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h15 == iterations_0[4:0]) begin
            encodedLength_21 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h16 == iterations_0[4:0]) begin
            encodedLength_22 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h17 == iterations_0[4:0]) begin
            encodedLength_23 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h18 == iterations_0[4:0]) begin
            encodedLength_24 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h19 == iterations_0[4:0]) begin
            encodedLength_25 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1a == iterations_0[4:0]) begin
            encodedLength_26 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1b == iterations_0[4:0]) begin
            encodedLength_27 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1c == iterations_0[4:0]) begin
            encodedLength_28 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1d == iterations_0[4:0]) begin
            encodedLength_29 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1e == iterations_0[4:0]) begin
            encodedLength_30 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
    if (!(_T_3584)) begin
      if (_T_3586) begin
        if (io_dataIn_0_valid) begin
          if (5'h1f == iterations_0[4:0]) begin
            encodedLength_31 <= io_dataIn_0_bits[7:4];
          end
        end
      end
    end
  end
endmodule
module bytesToCacheLine(
  input          clock,
  input          reset,
  output         io_inputData_ready,
  input          io_inputData_valid,
  input  [7:0]   io_inputData_bits,
  input          io_dumpBuffer,
  output [9:0]   io_currentBufferBits,
  input          io_outputData_ready,
  output         io_outputData_valid,
  output [511:0] io_outputData_bits
);
  reg [9:0] currentBufferBits; // @[bytesToCacheLine.scala 41:34]
  reg [31:0] _RAND_0;
  reg [518:0] buffer; // @[bytesToCacheLine.scala 43:19]
  reg [543:0] _RAND_1;
  wire [518:0] _GEN_1 = io_outputData_ready ? 519'h0 : buffer; // @[bytesToCacheLine.scala 48:31]
  wire  _T = currentBufferBits >= 10'h200; // @[bytesToCacheLine.scala 54:28]
  wire [9:0] _T_2 = currentBufferBits - 10'h200; // @[bytesToCacheLine.scala 60:48]
  wire  _T_3 = currentBufferBits == 10'h200; // @[bytesToCacheLine.scala 61:32]
  wire [1030:0] _T_4 = {buffer, 512'h0}; // @[bytesToCacheLine.scala 64:28]
  wire [1030:0] _GEN_2 = _T_3 ? 1031'h0 : _T_4; // @[bytesToCacheLine.scala 61:54]
  wire [1030:0] _GEN_4 = io_outputData_ready ? _GEN_2 : {{512'd0}, buffer}; // @[bytesToCacheLine.scala 58:33]
  wire [9:0] _T_6 = currentBufferBits + 10'h8; // @[bytesToCacheLine.scala 72:48]
  wire [22:0] _GEN_15 = {{15'd0}, io_inputData_bits}; // @[bytesToCacheLine.scala 73:48]
  wire [22:0] _T_10 = _GEN_15 & 23'h7f00ff; // @[bytesToCacheLine.scala 73:48]
  wire [9:0] _T_12 = 10'h207 - 10'h8; // @[bytesToCacheLine.scala 73:121]
  wire [9:0] _T_14 = _T_12 - currentBufferBits; // @[bytesToCacheLine.scala 73:142]
  wire [1045:0] _GEN_16 = {{1023'd0}, _T_10}; // @[bytesToCacheLine.scala 73:104]
  wire [1045:0] _T_15 = _GEN_16 << _T_14; // @[bytesToCacheLine.scala 73:104]
  wire [1045:0] _GEN_17 = {{527'd0}, buffer}; // @[bytesToCacheLine.scala 73:26]
  wire [1045:0] _T_16 = _GEN_17 | _T_15; // @[bytesToCacheLine.scala 73:26]
  wire [1045:0] _GEN_6 = io_inputData_valid ? _T_16 : {{527'd0}, buffer}; // @[bytesToCacheLine.scala 70:32]
  wire  _GEN_7 = _T ? 1'h0 : 1'h1; // @[bytesToCacheLine.scala 54:49]
  wire [1045:0] _GEN_10 = _T ? {{15'd0}, _GEN_4} : _GEN_6; // @[bytesToCacheLine.scala 54:49]
  wire [1045:0] _GEN_14 = io_dumpBuffer ? {{527'd0}, _GEN_1} : _GEN_10; // @[bytesToCacheLine.scala 45:23]
  assign io_inputData_ready = io_dumpBuffer ? 1'h0 : _GEN_7; // @[bytesToCacheLine.scala 47:24 bytesToCacheLine.scala 56:26 bytesToCacheLine.scala 69:26]
  assign io_currentBufferBits = currentBufferBits; // @[bytesToCacheLine.scala 42:24]
  assign io_outputData_valid = io_dumpBuffer | _T; // @[bytesToCacheLine.scala 46:25 bytesToCacheLine.scala 57:27 bytesToCacheLine.scala 68:27]
  assign io_outputData_bits = buffer[518:7]; // @[bytesToCacheLine.scala 79:22]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  currentBufferBits = _RAND_0[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {17{`RANDOM}};
  buffer = _RAND_1[518:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      currentBufferBits <= 10'h0;
    end else if (io_dumpBuffer) begin
      if (io_outputData_ready) begin
        currentBufferBits <= 10'h0;
      end
    end else if (_T) begin
      if (io_outputData_ready) begin
        currentBufferBits <= _T_2;
      end
    end else if (io_inputData_valid) begin
      currentBufferBits <= _T_6;
    end
    buffer <= _GEN_14[518:0];
  end
endmodule
module cacheLineBitGetter(
  input          clock,
  input          reset,
  input          io_readFifoPointer_ready,
  output         io_readFifoPointer_valid,
  output [5:0]   io_readFifoPointer_bits,
  output         io_inputData_ready,
  input          io_inputData_valid,
  input  [511:0] io_inputData_bits,
  input  [14:0]  io_currentlyRequestedBit,
  output         io_outputData_valid,
  output [27:0]  io_outputData_bits
);
  wire [14:0] firstCacheLineWithData = io_currentlyRequestedBit / 15'h200; // @[cacheLineBitGetter.scala 55:54]
  reg [511:0] buffer_0; // @[cacheLineBitGetter.scala 58:23]
  reg [511:0] _RAND_0;
  reg [511:0] buffer_1; // @[cacheLineBitGetter.scala 58:23]
  reg [511:0] _RAND_1;
  reg [5:0] bufferStartAddress; // @[cacheLineBitGetter.scala 60:35]
  reg [31:0] _RAND_2;
  reg  buffersValid_0; // @[cacheLineBitGetter.scala 62:29]
  reg [31:0] _RAND_3;
  reg  buffersValid_1; // @[cacheLineBitGetter.scala 62:29]
  reg [31:0] _RAND_4;
  reg  waitingToReceiveReadData; // @[cacheLineBitGetter.scala 64:41]
  reg [31:0] _RAND_5;
  reg [5:0] readAddress; // @[cacheLineBitGetter.scala 66:28]
  reg [31:0] _RAND_6;
  wire [14:0] _GEN_48 = {{9'd0}, bufferStartAddress}; // @[cacheLineBitGetter.scala 76:27]
  wire  _T_3 = _GEN_48 != firstCacheLineWithData; // @[cacheLineBitGetter.scala 76:27]
  wire [14:0] _T_5 = firstCacheLineWithData - 15'h1; // @[cacheLineBitGetter.scala 79:33]
  wire  _T_6 = _T_5 == _GEN_48; // @[cacheLineBitGetter.scala 79:39]
  wire  _T_7 = _T_6 & buffersValid_1; // @[cacheLineBitGetter.scala 79:62]
  wire [511:0] _GEN_2 = _T_7 ? buffer_1 : buffer_0; // @[cacheLineBitGetter.scala 79:82]
  wire [14:0] _GEN_0 = io_currentlyRequestedBit % 15'h200; // @[cacheLineBitGetter.scala 91:36]
  wire [9:0] _T_8 = _GEN_0[9:0]; // @[cacheLineBitGetter.scala 91:36]
  wire [9:0] _T_10 = _T_8 + 10'h1c; // @[cacheLineBitGetter.scala 91:58]
  wire  _T_11 = _T_10 <= 10'h200; // @[cacheLineBitGetter.scala 91:76]
  wire [9:0] _T_13 = 10'h200 - 10'h1c; // @[cacheLineBitGetter.scala 93:62]
  wire [9:0] _T_16 = _T_13 - _T_8; // @[cacheLineBitGetter.scala 93:80]
  wire [511:0] _T_17 = buffer_0 >> _T_16; // @[cacheLineBitGetter.scala 93:39]
  wire [1023:0] _T_18 = {buffer_0,buffer_1}; // @[Cat.scala 29:58]
  wire [10:0] _T_20 = 11'h400 - 11'h1c; // @[cacheLineBitGetter.scala 102:84]
  wire [10:0] _GEN_50 = {{1'd0}, _T_8}; // @[cacheLineBitGetter.scala 102:102]
  wire [10:0] _T_23 = _T_20 - _GEN_50; // @[cacheLineBitGetter.scala 102:102]
  wire [1023:0] _T_24 = _T_18 >> _T_23; // @[cacheLineBitGetter.scala 102:55]
  wire  _T_25 = buffersValid_0 & buffersValid_1; // @[cacheLineBitGetter.scala 103:28]
  wire [1023:0] _GEN_5 = _T_11 ? {{512'd0}, _T_17} : _T_24; // @[cacheLineBitGetter.scala 91:99]
  wire  _GEN_6 = _T_11 ? buffersValid_0 : _T_25; // @[cacheLineBitGetter.scala 91:99]
  wire [14:0] _GEN_7 = _T_3 ? firstCacheLineWithData : {{9'd0}, bufferStartAddress}; // @[cacheLineBitGetter.scala 76:55]
  wire  _GEN_8 = _T_3 ? _T_7 : buffersValid_0; // @[cacheLineBitGetter.scala 76:55]
  wire  _GEN_9 = _T_3 ? 1'h0 : buffersValid_1; // @[cacheLineBitGetter.scala 76:55]
  wire [511:0] _GEN_10 = _T_3 ? _GEN_2 : buffer_0; // @[cacheLineBitGetter.scala 76:55]
  wire [1023:0] _GEN_11 = _T_3 ? 1024'h0 : _GEN_5; // @[cacheLineBitGetter.scala 76:55]
  wire [1:0] _T_29 = {buffersValid_1,buffersValid_0}; // @[cacheLineBitGetter.scala 114:72]
  wire [1:0] _T_30 = ~_T_29; // @[cacheLineBitGetter.scala 114:52]
  wire  _T_33 = _T_30[0] ? 1'h0 : 1'h1; // @[Mux.scala 47:69]
  wire [14:0] _GEN_51 = {{14'd0}, _T_33}; // @[cacheLineBitGetter.scala 117:52]
  wire [14:0] _T_35 = firstCacheLineWithData + _GEN_51; // @[cacheLineBitGetter.scala 117:52]
  wire [14:0] _GEN_52 = {{9'd0}, readAddress}; // @[cacheLineBitGetter.scala 117:24]
  wire  _T_36 = _GEN_52 == _T_35; // @[cacheLineBitGetter.scala 117:24]
  wire  _GEN_53 = ~_T_33; // @[cacheLineBitGetter.scala 122:50]
  wire  _GEN_13 = _GEN_53 | _GEN_8; // @[cacheLineBitGetter.scala 122:50]
  wire  _GEN_14 = _T_33 | _GEN_9; // @[cacheLineBitGetter.scala 122:50]
  wire  _GEN_28 = io_readFifoPointer_ready | waitingToReceiveReadData; // @[cacheLineBitGetter.scala 137:38]
  wire [14:0] _GEN_29 = io_readFifoPointer_ready ? _T_35 : {{9'd0}, readAddress}; // @[cacheLineBitGetter.scala 137:38]
  wire  _GEN_36 = waitingToReceiveReadData ? 1'h0 : 1'h1; // @[cacheLineBitGetter.scala 115:36]
  wire [14:0] _GEN_37 = waitingToReceiveReadData ? 15'h0 : _T_35; // @[cacheLineBitGetter.scala 115:36]
  wire [14:0] _GEN_38 = waitingToReceiveReadData ? {{9'd0}, readAddress} : _GEN_29; // @[cacheLineBitGetter.scala 115:36]
  wire [14:0] _GEN_46 = _T_25 ? _GEN_37 : 15'h0; // @[cacheLineBitGetter.scala 112:45]
  wire [14:0] _GEN_47 = _T_25 ? _GEN_38 : {{9'd0}, readAddress}; // @[cacheLineBitGetter.scala 112:45]
  assign io_readFifoPointer_valid = _T_25 & _GEN_36; // @[cacheLineBitGetter.scala 71:28 cacheLineBitGetter.scala 135:32]
  assign io_readFifoPointer_bits = _GEN_46[5:0]; // @[cacheLineBitGetter.scala 72:27 cacheLineBitGetter.scala 136:31]
  assign io_inputData_ready = _T_25 & waitingToReceiveReadData; // @[cacheLineBitGetter.scala 69:22 cacheLineBitGetter.scala 119:28 cacheLineBitGetter.scala 127:28]
  assign io_outputData_valid = _T_3 ? 1'h0 : _GEN_6; // @[cacheLineBitGetter.scala 70:23 cacheLineBitGetter.scala 97:29 cacheLineBitGetter.scala 106:29]
  assign io_outputData_bits = _GEN_11[27:0]; // @[cacheLineBitGetter.scala 73:22 cacheLineBitGetter.scala 93:26 cacheLineBitGetter.scala 102:26]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {16{`RANDOM}};
  buffer_0 = _RAND_0[511:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {16{`RANDOM}};
  buffer_1 = _RAND_1[511:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  bufferStartAddress = _RAND_2[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  buffersValid_0 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  buffersValid_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  waitingToReceiveReadData = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  readAddress = _RAND_6[5:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      buffer_0 <= 512'h0;
    end else if (_T_25) begin
      if (waitingToReceiveReadData) begin
        if (_T_36) begin
          if (io_inputData_valid) begin
            if (~_T_33) begin
              buffer_0 <= io_inputData_bits;
            end else if (_T_3) begin
              if (_T_7) begin
                buffer_0 <= buffer_1;
              end
            end
          end else if (_T_3) begin
            if (_T_7) begin
              buffer_0 <= buffer_1;
            end
          end
        end else if (_T_3) begin
          if (_T_7) begin
            buffer_0 <= buffer_1;
          end
        end
      end else if (_T_3) begin
        if (_T_7) begin
          buffer_0 <= buffer_1;
        end
      end
    end else begin
      buffer_0 <= _GEN_10;
    end
    if (reset) begin
      buffer_1 <= 512'h0;
    end else if (_T_25) begin
      if (waitingToReceiveReadData) begin
        if (_T_36) begin
          if (io_inputData_valid) begin
            if (_T_33) begin
              buffer_1 <= io_inputData_bits;
            end
          end
        end
      end
    end
    if (reset) begin
      bufferStartAddress <= 6'h0;
    end else begin
      bufferStartAddress <= _GEN_7[5:0];
    end
    if (reset) begin
      buffersValid_0 <= 1'h0;
    end else if (_T_25) begin
      if (waitingToReceiveReadData) begin
        if (_T_36) begin
          if (io_inputData_valid) begin
            buffersValid_0 <= _GEN_13;
          end else if (_T_3) begin
            buffersValid_0 <= _T_7;
          end
        end else if (_T_3) begin
          buffersValid_0 <= _T_7;
        end
      end else if (_T_3) begin
        buffersValid_0 <= _T_7;
      end
    end else if (_T_3) begin
      buffersValid_0 <= _T_7;
    end
    if (reset) begin
      buffersValid_1 <= 1'h0;
    end else if (_T_25) begin
      if (waitingToReceiveReadData) begin
        if (_T_36) begin
          if (io_inputData_valid) begin
            buffersValid_1 <= _GEN_14;
          end else if (_T_3) begin
            buffersValid_1 <= 1'h0;
          end
        end else if (_T_3) begin
          buffersValid_1 <= 1'h0;
        end
      end else if (_T_3) begin
        buffersValid_1 <= 1'h0;
      end
    end else if (_T_3) begin
      buffersValid_1 <= 1'h0;
    end
    if (reset) begin
      waitingToReceiveReadData <= 1'h0;
    end else if (_T_25) begin
      if (waitingToReceiveReadData) begin
        if (io_inputData_valid) begin
          waitingToReceiveReadData <= 1'h0;
        end
      end else begin
        waitingToReceiveReadData <= _GEN_28;
      end
    end
    if (reset) begin
      readAddress <= 6'h0;
    end else begin
      readAddress <= _GEN_47[5:0];
    end
  end
endmodule
module huffmanDecompressorCacheLineWrapper(
  input          clock,
  input          reset,
  input          io_start,
  output [5:0]   io_readPointer,
  output         io_loadReadPointer,
  input          io_readFifoEmpty,
  output         io_readReady,
  input          io_readValid,
  input  [511:0] io_readData,
  input          io_writeFifoFull,
  output         io_writeRequest,
  output [511:0] io_writeData,
  output         io_done
);
  wire  decompressor_clock; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire  decompressor_reset; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire  decompressor_io_start; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire  decompressor_io_dataIn_0_valid; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire [31:0] decompressor_io_dataIn_0_bits; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire [14:0] decompressor_io_currentBit_0; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire  decompressor_io_dataOut_0_ready; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire  decompressor_io_dataOut_0_valid; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire [7:0] decompressor_io_dataOut_0_bits; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire  decompressor_io_finished; // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
  wire  writeCacheLineConverter_clock; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire  writeCacheLineConverter_reset; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire  writeCacheLineConverter_io_inputData_ready; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire  writeCacheLineConverter_io_inputData_valid; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire [7:0] writeCacheLineConverter_io_inputData_bits; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire  writeCacheLineConverter_io_dumpBuffer; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire [9:0] writeCacheLineConverter_io_currentBufferBits; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire  writeCacheLineConverter_io_outputData_ready; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire  writeCacheLineConverter_io_outputData_valid; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire [511:0] writeCacheLineConverter_io_outputData_bits; // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
  wire  readCacheLineConverter_clock; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire  readCacheLineConverter_reset; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire  readCacheLineConverter_io_readFifoPointer_ready; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire  readCacheLineConverter_io_readFifoPointer_valid; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire [5:0] readCacheLineConverter_io_readFifoPointer_bits; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire  readCacheLineConverter_io_inputData_ready; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire  readCacheLineConverter_io_inputData_valid; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire [511:0] readCacheLineConverter_io_inputData_bits; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire [14:0] readCacheLineConverter_io_currentlyRequestedBit; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire  readCacheLineConverter_io_outputData_valid; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  wire [27:0] readCacheLineConverter_io_outputData_bits; // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
  reg [1:0] state; // @[huffmanDecompressorCacheLineWrapper.scala 89:22]
  reg [31:0] _RAND_0;
  wire  _T = ~io_writeFifoFull; // @[huffmanDecompressorCacheLineWrapper.scala 105:8]
  wire  _T_2 = state == 2'h2; // @[huffmanDecompressorCacheLineWrapper.scala 137:20]
  wire  _T_3 = 2'h0 == state; // @[Conditional.scala 37:30]
  wire  _T_4 = 2'h1 == state; // @[Conditional.scala 37:30]
  wire  _T_5 = writeCacheLineConverter_io_currentBufferBits != 10'h0; // @[huffmanDecompressorCacheLineWrapper.scala 150:59]
  wire  _GEN_5 = decompressor_io_finished & _T_5; // @[huffmanDecompressorCacheLineWrapper.scala 149:38]
  wire  _T_6 = 2'h2 == state; // @[Conditional.scala 37:30]
  wire  _T_7 = ~io_start; // @[huffmanDecompressorCacheLineWrapper.scala 162:12]
  wire  _GEN_8 = _T_6 | _T_2; // @[Conditional.scala 39:67]
  wire  _GEN_10 = _T_4 & _GEN_5; // @[Conditional.scala 39:67]
  wire  _GEN_12 = _T_4 ? _T_2 : _GEN_8; // @[Conditional.scala 39:67]
  decompressorChisel decompressor ( // @[huffmanDecompressorCacheLineWrapper.scala 93:28]
    .clock(decompressor_clock),
    .reset(decompressor_reset),
    .io_start(decompressor_io_start),
    .io_dataIn_0_valid(decompressor_io_dataIn_0_valid),
    .io_dataIn_0_bits(decompressor_io_dataIn_0_bits),
    .io_currentBit_0(decompressor_io_currentBit_0),
    .io_dataOut_0_ready(decompressor_io_dataOut_0_ready),
    .io_dataOut_0_valid(decompressor_io_dataOut_0_valid),
    .io_dataOut_0_bits(decompressor_io_dataOut_0_bits),
    .io_finished(decompressor_io_finished)
  );
  bytesToCacheLine writeCacheLineConverter ( // @[huffmanDecompressorCacheLineWrapper.scala 97:39]
    .clock(writeCacheLineConverter_clock),
    .reset(writeCacheLineConverter_reset),
    .io_inputData_ready(writeCacheLineConverter_io_inputData_ready),
    .io_inputData_valid(writeCacheLineConverter_io_inputData_valid),
    .io_inputData_bits(writeCacheLineConverter_io_inputData_bits),
    .io_dumpBuffer(writeCacheLineConverter_io_dumpBuffer),
    .io_currentBufferBits(writeCacheLineConverter_io_currentBufferBits),
    .io_outputData_ready(writeCacheLineConverter_io_outputData_ready),
    .io_outputData_valid(writeCacheLineConverter_io_outputData_valid),
    .io_outputData_bits(writeCacheLineConverter_io_outputData_bits)
  );
  cacheLineBitGetter readCacheLineConverter ( // @[huffmanDecompressorCacheLineWrapper.scala 114:38]
    .clock(readCacheLineConverter_clock),
    .reset(readCacheLineConverter_reset),
    .io_readFifoPointer_ready(readCacheLineConverter_io_readFifoPointer_ready),
    .io_readFifoPointer_valid(readCacheLineConverter_io_readFifoPointer_valid),
    .io_readFifoPointer_bits(readCacheLineConverter_io_readFifoPointer_bits),
    .io_inputData_ready(readCacheLineConverter_io_inputData_ready),
    .io_inputData_valid(readCacheLineConverter_io_inputData_valid),
    .io_inputData_bits(readCacheLineConverter_io_inputData_bits),
    .io_currentlyRequestedBit(readCacheLineConverter_io_currentlyRequestedBit),
    .io_outputData_valid(readCacheLineConverter_io_outputData_valid),
    .io_outputData_bits(readCacheLineConverter_io_outputData_bits)
  );
  assign io_readPointer = readCacheLineConverter_io_readFifoPointer_bits; // @[huffmanDecompressorCacheLineWrapper.scala 133:50]
  assign io_loadReadPointer = io_readFifoEmpty & readCacheLineConverter_io_readFifoPointer_valid; // @[huffmanDecompressorCacheLineWrapper.scala 128:24 huffmanDecompressorCacheLineWrapper.scala 130:24]
  assign io_readReady = readCacheLineConverter_io_inputData_ready; // @[huffmanDecompressorCacheLineWrapper.scala 124:45]
  assign io_writeRequest = _T & writeCacheLineConverter_io_outputData_valid; // @[huffmanDecompressorCacheLineWrapper.scala 106:21 huffmanDecompressorCacheLineWrapper.scala 108:21]
  assign io_writeData = writeCacheLineConverter_io_outputData_bits; // @[huffmanDecompressorCacheLineWrapper.scala 104:46]
  assign io_done = _T_3 ? _T_2 : _GEN_12; // @[huffmanDecompressorCacheLineWrapper.scala 137:11 huffmanDecompressorCacheLineWrapper.scala 161:15]
  assign decompressor_clock = clock;
  assign decompressor_reset = reset;
  assign decompressor_io_start = io_start; // @[huffmanDecompressorCacheLineWrapper.scala 94:25]
  assign decompressor_io_dataIn_0_valid = readCacheLineConverter_io_outputData_valid; // @[huffmanDecompressorCacheLineWrapper.scala 135:40]
  assign decompressor_io_dataIn_0_bits = {{4'd0}, readCacheLineConverter_io_outputData_bits}; // @[huffmanDecompressorCacheLineWrapper.scala 135:40]
  assign decompressor_io_dataOut_0_ready = writeCacheLineConverter_io_inputData_ready; // @[huffmanDecompressorCacheLineWrapper.scala 111:40]
  assign writeCacheLineConverter_clock = clock;
  assign writeCacheLineConverter_reset = reset;
  assign writeCacheLineConverter_io_inputData_valid = decompressor_io_dataOut_0_valid; // @[huffmanDecompressorCacheLineWrapper.scala 111:40]
  assign writeCacheLineConverter_io_inputData_bits = decompressor_io_dataOut_0_bits; // @[huffmanDecompressorCacheLineWrapper.scala 111:40]
  assign writeCacheLineConverter_io_dumpBuffer = _T_3 ? 1'h0 : _GEN_10; // @[huffmanDecompressorCacheLineWrapper.scala 140:41 huffmanDecompressorCacheLineWrapper.scala 152:49]
  assign writeCacheLineConverter_io_outputData_ready = ~io_writeFifoFull; // @[huffmanDecompressorCacheLineWrapper.scala 110:47]
  assign readCacheLineConverter_clock = clock;
  assign readCacheLineConverter_reset = reset;
  assign readCacheLineConverter_io_readFifoPointer_ready = io_readFifoEmpty; // @[huffmanDecompressorCacheLineWrapper.scala 132:51]
  assign readCacheLineConverter_io_inputData_valid = io_readValid; // @[huffmanDecompressorCacheLineWrapper.scala 123:45]
  assign readCacheLineConverter_io_inputData_bits = io_readData; // @[huffmanDecompressorCacheLineWrapper.scala 122:44]
  assign readCacheLineConverter_io_currentlyRequestedBit = decompressor_io_currentBit_0; // @[huffmanDecompressorCacheLineWrapper.scala 134:51]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
    end else if (_T_3) begin
      if (io_start) begin
        state <= 2'h1;
      end
    end else if (_T_4) begin
      if (decompressor_io_finished) begin
        if (!(_T_5)) begin
          state <= 2'h2;
        end
      end
    end else if (_T_6) begin
      if (_T_7) begin
        state <= 2'h0;
      end
    end
  end
endmodule
