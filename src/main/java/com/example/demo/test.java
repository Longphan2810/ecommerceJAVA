package com.example.demo;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

public class test {

	public static void main(String[] args) {
		
		List<String> listTotal = new ArrayList<>();
		List<String> list1 = new ArrayList<>();
		List<String> list2 = new ArrayList<>();
		
		list1.add("a");
		list1.add("b");
		list1.add("c");
		list2.add("d");
		list2.add("e");
		list2.add("f");
		
		listTotal.addAll(list1);
		listTotal.addAll(list2);
		
		
		
		
	}
	
}
