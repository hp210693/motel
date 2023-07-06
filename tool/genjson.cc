/*MIT License

Copyright (c) 2020 Hung Phan

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
SOFTWARE.*/
#include <iostream>
#include <vector>
#include <boost/property_tree/ptree.hpp>
#include <boost/property_tree/json_parser.hpp>

using namespace std;
using namespace boost::property_tree;

struct Room {
    std::string name = "";
    std::string booking_date = "";
    std::string date_move_in = "";
    double electric_number = 0;
    std::string img_electric = "";
    double water_number = 0;
    std::string img_water = "";
    double room_rates = 800000;
    std::string img_room_rates = "";
    double junk_money = 0;
    double deposits = 0;
    int num_of_member = 0;
};

void gen_rooms() {

    ptree pt;
    std::vector<std::string> titles{"A","B","C","D","E","F","G","H","K","KIOT"};
   
    for(int i = 0; i < titles.size(); i++) {
        ptree temp_room;
        ptree temp_rooms;
      
        int index = 10;
        if (i == 3 || i == 4 || i == 6) {
            index = 11;
        }
        if (i == 7) {
            index = 12;
        }
        if (i == 8) {
            index = 13;
        }
        if (i == 9){
            index = 5;
        }
       
       //default 10 element in flow
        for (int j = 0 ; j < index; j++) {
            Room temp;
       
            if (((i == 0 || i == 1)&&(j == 0))||(i == 3 && j == 0)||(i == 4 && (j == 0 || j == 10))
                || ((i == 7 || j == 8) && j == 0)) {
                temp.room_rates = 900000;
            }
            if ((i == 5)&&(j == 0 || j == 9)) {
                temp.room_rates = 1000000;
            }
            if ((i == 6 && j == 10)||(i == 8 || j == 11)) {
                temp.room_rates = 1200000;
            }
            if (i == 12 || i == 13) {
                temp.room_rates = 2000000;
            }
            if (i == 9 && j == 0) {
                temp.room_rates = 3000000;
            }
            if (i == 9 && j == 1) {
                temp.room_rates = 1400000;
            }
            if (i == 9 && j== 2) {
                temp.room_rates = 1600000;
            }
            if (i == 9 && j > 2 ) {
                temp.room_rates = 2000000;
            }
          
            temp_room.put("name", temp.name  + titles.at(i) + std::to_string(((i == 3 || i == 4))? j : j+1));
            temp_room.put("booking_date", temp.booking_date);
            temp_room.put("date_move_in", temp.date_move_in);
            temp_room.put("electric_number", temp.electric_number);
            temp_room.put("deposits", temp.deposits);
            temp_room.put("img_electric", temp.img_electric);
            temp_room.put("img_room_rates", temp.img_room_rates);
            temp_room.put("img_water", temp.img_water);
            temp_room.put("junk_money", temp.junk_money);
            temp_room.put("num_of_member", temp.num_of_member);
            temp_room.put("room_rates", temp.room_rates);
            temp_room.put("water_number", temp.water_number);

            temp_rooms.push_back(make_pair("",temp_room));  
        }
        
        std::string str_flow = "flow-" + titles.at(i);
        pt.add_child(str_flow,temp_rooms);
       
        json_parser::write_json("../motel/data/flows.json", pt);
    }
};

int main() {
    gen_rooms();
    return 0;
}