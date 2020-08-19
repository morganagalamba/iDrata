//
//  Person.swift
//  agua
//
//  Created by Morgana Beatriz Feijo Galamba on 10/03/20.
//  Copyright © 2020 Morgana Beatriz Feijo Galamba. All rights reserved.
//

import Foundation

public class Person{
        
        public var weight: Int
        public var waterDrinked: Float
        public var water: Float
        public var percentage: Float
    public var canFresh: Bool
        
        init(){
            self.percentage = 0
            self.waterDrinked = 0
            self.water = 0
            self.weight = 0
            self.canFresh = false
        }
        
        func drinked(amount:Float){
            if(amount==0.03){
                self.waterDrinked = self.waterDrinked + 0.030
            }
            else if(amount==0.2){
                self.waterDrinked = self.waterDrinked + 0.2
            }
            else{
                self.waterDrinked = self.waterDrinked + 0.5
            }
            
            if (self.waterDrinked>self.water){
                self.waterDrinked = self.water
            }
            
            self.percentage = (self.waterDrinked*100)/self.water
        }
        
        func notDrinked(amount:Float){
            if(amount==0.03){
                self.waterDrinked = self.waterDrinked - 0.030
            }
            else if(amount==0.2){
                self.waterDrinked = self.waterDrinked - 0.2
            }
            else{
                self.waterDrinked = self.waterDrinked - 0.5
            }
            if (self.waterDrinked<0){
                self.waterDrinked = 0
            }
            self.percentage = (self.waterDrinked*100)/self.water
        }
    
}

