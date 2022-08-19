//
//  Category.swift
//  Dhammapada
//
//  Created by Xiao Yuan on 6/21/22.
//

import Foundation

struct Category: Identifiable {
    var id: Int
    var eng: String
    var mm: String
    var pali: String
    var roman: String
    var total: String
}

var categoryDataList = [
    Category(id: 1, eng: "The Pairs", mm: "အစုံ အစုံ တရားတော်", pali: "ယမကဝဂ္ဂ", roman: "Yamakavagga", total: "1-20"),
    Category(id: 2, eng: "Heedfulness", mm: "မမေ့ မလျော့ခြင်း", pali: "အပ္ပမာဒဝဂ္ဂ", roman: "Appamādavagga", total: "21-32"),
    Category(id: 3, eng: "The Mind", mm: "စိတ်", pali: "စိတ္တဝဂ္ဂ", roman: "Cittavagga", total: "33-43"),
    Category(id: 4, eng: "Flowers", mm: "ပန်းတရားတော်", pali: "ပုပ္ဖဝဂ္ဂ", roman: "Pupphavagga", total: "44-59"),
    Category(id: 5, eng: "The Fool", mm: "လူမိုက်", pali: "ဗာလဝဂ္ဂ", roman: "Bālavagga", total: "60-75"),
    Category(id: 6, eng: "The Wise Man", mm: "လူလိမ္မာ", pali: "ပဏ္ဍိတဝဂ္ဂ", roman: "Paṇḍitavagga", total: "76-89"),
    Category(id: 7, eng: "The Arahant or Perfected One", mm: "ရဟန္တာ", pali: "အရဟန္တဝဂ္ဂ", roman: "Arahantavagga", total: "90-99"),
    Category(id: 8, eng: "The Thousands", mm: "တစ်ထောင်ခန်း", pali: "သဟဿဝဂ္ဂ", roman: "Sahassavagga", total: "100-115"),
    Category(id: 9, eng: "Evil", mm: "မကောင်းမှု", pali: "ပါပဝဂ္ဂ", roman: "Pāpavagga", total: "116-128"),
    Category(id: 10, eng: "Violence", mm: "ဒဏ်", pali: "ဒဏ္ဍဝဂ္ဂ", roman: "Daṇḍavagga", total: "129-145"),
    Category(id: 11, eng: "Old Age", mm: "အိုခြင်းတရား", pali: "ဇရာဝဂ္ဂ", roman: "Jarāvagga", total: "146-156"),
    Category(id: 12, eng: "The Self", mm: "မိမိကိုယ်", pali: "အတ္တဝဂ္ဂ", roman: "Attavagga", total: "157-166"),
    Category(id: 13, eng: "The World", mm: "လောက", pali: "လောကဝဂ္ဂ", roman: "Lokavagga", total: "167-178"),
    Category(id: 14, eng: "The Buddha", mm: "မြတ်စွာဘုရား", pali: "ဗုဒ္ဓဝဂ္ဂ", roman: "Buddhavagga", total: "179-196"),
    Category(id: 15, eng: "Happiness", mm: "ချမ်းသာခြင်း", pali: "သုခဝဂ္ဂ", roman: "Sukhavagga", total: "197-208"),
    Category(id: 16, eng: "Affection", mm: "ချစ်ခြင်း", pali: "ပိယဝဂ္ဂ", roman: "Piyavagga", total: "209-220"),
    Category(id: 17, eng: "Anger", mm: "အမျက်ဒေါသ", pali: "ကောဓဝဂ္ဂ", roman: "Kodhavagga", total: "221-234"),
    Category(id: 18, eng: "Impurity", mm: "အညစ်အကြေး", pali: "မလဝဂ္ဂ", roman: "Malavagga", total: "235-255"),
    Category(id: 19, eng: "The Just", mm: "တရားရှိခြင်း", pali: "ဓမ္မဋ္ဌဝဂ္ဂ", roman: "Dhammaṭṭhavagga", total: "256-272"),
    Category(id: 20, eng: "The Path", mm: "လမ်း", pali: "မဂ္ဂဝဂ္ဂ", roman: "Maggavagga", total: "273-289"),
    Category(id: 21, eng: "Miscellaneous", mm: "အထွေထွေ", pali: "ပကိဏ္ဏကဝဂ္ဂ", roman: "Pakiṇṇakavagga", total: "290-305"),
    Category(id: 22, eng: "The State of Woe", mm: "ငရဲ", pali: "နိရယဝဂ္ဂ", roman: "Nirayavagga", total: "306-319"),
    Category(id: 23, eng: "The Elephant", mm: "ဆင်", pali: "နာဂဝဂ္ဂ", roman: "Nāgavagga", total: "320-333"),
    Category(id: 24, eng: "Craving", mm: "တဏှာ", pali: "တဏှာဝဂ္ဂ", roman: "Taṇhāvagga", total: "334-359"),
    Category(id: 25, eng: "The Monk", mm: "ရဟန်း", pali: "ဘိက္ခုဝဂ္ဂ", roman: "Bhikkhuvagga", total: "360-382"),
    Category(id: 26, eng: "The Holy Man", mm: "ပုဏ္ဏား", pali: "ဗြာဟ္မဏဝဂ္ဂ", roman: "Brāhmaṇavagga", total: "383-423")
]
