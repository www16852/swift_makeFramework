public class HelloString{
    static let A = "Hello world!!"
    static let B = "Hello swift!!"
    
    static public func getA() -> String{
        return A
    }
    
    static public func getB() -> String{
        return B
    }
}

public func add(a:Int,b:Int) -> Int {
    return a+b
}

public func ptr(){
    print("ptr")
}
