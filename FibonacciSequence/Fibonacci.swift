//
//  Fibonacci.swift
//  FibonacciSequence F_n = F_{n-1} + F_{n-2}
//
//  Created by chuck on 10/30/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//

import Foundation


class Fibonacci : SequenceType {
    
    var upperBound : Int?
    
    init(){
        
        upperBound = 0
        
    }
    
    
    init(limit:Int){
        
        upperBound = limit
        
    }
    
    //faster method
      //Recursive single function method
    func simpleRecursive(current: Int, next: Int, limit: Int) {
        
        //exit method if beyond limit
        if next >= limit {
            return
        }
        
        fibNumberArray.append(current)
        
        let result = current + next
        
        simpleRecursive(next, next: result, limit: limit)
    }
    
    
    //======Other ways of creating a Fibonacci Sequence )=====
    
    //slow:
      //uses the Sequence Protocol's generate() function that returns a generator type of type
    func generate() -> GeneratorOf<Int> {
        
        var current = 0
        
        var next = 1
        
        return GeneratorOf<Int>() {
            
            if current >= self.upperBound {
                
                return nil
                
            }
            
            let result = current
            
            current = next
            
            next += result
            
            fibNumberArray.append(result)
            
            return result
            
        }
        
    }
    
    //other possible methods
    // - making use of the 'inout' parameter type to save the value of the parameters for reuse
}


