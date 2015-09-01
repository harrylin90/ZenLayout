//
//  ZenLayout.swift
//  Pods
//
//  Created by aethe on 8/27/15.
//
//

public class SmartLayoutAttribute {
    private weak var view: UIView!
    private var rawAttribute: NSLayoutAttribute
    public var multiplier: CGFloat = 1
    public var constant: CGFloat = 0
    public var priority: UILayoutPriority?
    
    public init(view: UIView, rawAttribute: NSLayoutAttribute) {
        self.view = view
        self.rawAttribute = rawAttribute
    }
    
}

public typealias SmartLayoutAttributeTwo = (first: SmartLayoutAttribute, second: SmartLayoutAttribute)
public typealias ValueTwo = (firs: CGFloat, second: CGFloat)
public typealias SmartLayoutAttributeFour = (fisrt: SmartLayoutAttribute, second: SmartLayoutAttribute, third: SmartLayoutAttribute, fouth: SmartLayoutAttribute)
public typealias ValueFour = (first: CGFloat, second: CGFloat, third: CGFloat, four: CGFloat)

public func ==(lhs: SmartLayoutAttribute, rhs: SmartLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: .Equal, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func ==(lhs: SmartLayoutAttributeTwo, rhs: SmartLayoutAttributeTwo) -> [NSLayoutConstraint] {
    return [lhs.first == rhs.first, lhs.second == rhs.second]
}

public func ==(lhs: SmartLayoutAttributeFour, rhs: SmartLayoutAttributeFour) -> [NSLayoutConstraint] {
    return [lhs.fisrt == rhs.fisrt, lhs.second == rhs.second, lhs.third == rhs.third, lhs.fouth == rhs.fouth]
}

public func >=(lhs: SmartLayoutAttribute, rhs: SmartLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: .GreaterThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func >=(lhs: SmartLayoutAttributeTwo, rhs: SmartLayoutAttributeTwo) -> [NSLayoutConstraint] {
    return [lhs.first >= rhs.first, lhs.second >= rhs.second]
}

public func >=(lhs: SmartLayoutAttributeFour, rhs: SmartLayoutAttributeFour) -> [NSLayoutConstraint] {
    return [lhs.fisrt >= rhs.fisrt, lhs.second >= rhs.second, lhs.third >= rhs.third, lhs.fouth >= rhs.fouth]
}

public func <=(lhs: SmartLayoutAttribute, rhs: SmartLayoutAttribute) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: .LessThanOrEqual, toItem: rhs.view, attribute: rhs.rawAttribute, multiplier: rhs.multiplier, constant: rhs.constant)
}

public func <=(lhs: SmartLayoutAttributeTwo, rhs: SmartLayoutAttributeTwo) -> [NSLayoutConstraint] {
    return [lhs.first <= rhs.first, lhs.second <= rhs.second]
}

public func <=(lhs: SmartLayoutAttributeFour, rhs: SmartLayoutAttributeFour) -> [NSLayoutConstraint] {
    return [lhs.fisrt <= rhs.fisrt, lhs.second <= rhs.second, lhs.third <= rhs.third, lhs.fouth <= rhs.fouth]
}

public func ==(lhs: SmartLayoutAttribute, rhs: CGFloat) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: rhs)
}

public func ==(lhs: SmartLayoutAttributeTwo, rhs: ValueTwo) -> [NSLayoutConstraint] {
    return [lhs.first == rhs.firs, lhs.second == rhs.second]
}

public func ==(lhs: SmartLayoutAttributeTwo, rhs: CGSize) -> [NSLayoutConstraint] {
    return lhs == (rhs.width, rhs.height)
}

public func ==(lhs: SmartLayoutAttributeFour, rhs: ValueFour) -> [NSLayoutConstraint] {
    return [lhs.fisrt == rhs.first, lhs.second == rhs.second, lhs.third == rhs.third, lhs.fouth == rhs.four]
}

public func >=(lhs: SmartLayoutAttribute, rhs: CGFloat) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: rhs)
}

public func >=(lhs: SmartLayoutAttributeTwo, rhs: ValueTwo) -> [NSLayoutConstraint] {
    return [lhs.first >= rhs.firs, lhs.second >= rhs.second]
}

public func >=(lhs: SmartLayoutAttributeFour, rhs: ValueFour) -> [NSLayoutConstraint] {
    return [lhs.fisrt >= rhs.first, lhs.second >= rhs.second, lhs.third >= rhs.third, lhs.fouth >= rhs.four]
}

public func <=(lhs: SmartLayoutAttribute, rhs: CGFloat) -> NSLayoutConstraint {
    lhs.view.translatesAutoresizingMaskIntoConstraints = false
    return NSLayoutConstraint(item: lhs.view, attribute: lhs.rawAttribute, relatedBy: .LessThanOrEqual, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: rhs)
}

public func <=(lhs: SmartLayoutAttributeTwo, rhs: ValueTwo) -> [NSLayoutConstraint] {
    return [lhs.first <= rhs.firs, lhs.second <= rhs.second]
}

public func <=(lhs: SmartLayoutAttributeFour, rhs: ValueFour) -> [NSLayoutConstraint] {
    return [lhs.fisrt <= rhs.first, lhs.second <= rhs.second, lhs.third <= rhs.third, lhs.fouth <= rhs.four]
}

public func *(multiplier: CGFloat, attribute: SmartLayoutAttribute) -> SmartLayoutAttribute {
    attribute.multiplier = multiplier
    return attribute
}

public func +(attribute: SmartLayoutAttribute, constant: CGFloat) -> SmartLayoutAttribute {
    attribute.constant = constant
    return attribute
}

public func -(attribute: SmartLayoutAttribute, constant: CGFloat) -> SmartLayoutAttribute {
    attribute.constant = -constant
    return attribute
}

infix operator ~ { associativity left precedence 140 }
public func ~(attribute: SmartLayoutAttribute, priority: UILayoutPriority) -> SmartLayoutAttribute {
    attribute.priority = priority
    return attribute
}

public extension UIView {
    
    public var left: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Left)
    }
    
    public var right: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Right)
    }
    
    public var top: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Top)
    }
    
    public var bottom: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Bottom)
    }
    
    public var leading: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Leading)
    }
    
    public var trailing: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Trailing)
    }
    
    public var width: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Width)
    }
    
    public var height: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Height)
    }
    
    public var size: SmartLayoutAttributeTwo {
        return (width, height)
    }
    
    public var align: SmartLayoutAttributeFour {
        return (top, left, bottom, right)
    }
    
    public var centerX: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .CenterX)
    }
    
    public var centerY: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .CenterY)
    }
    
    public var centerlayout: SmartLayoutAttributeTwo {
        return (centerX, centerY)
    }
    
    public var baseline: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .Baseline)
    }
    
    public var firstBaseline: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .FirstBaseline)
    }
    
    public var leftMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .LeftMargin)
    }
    
    public var rightMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .RightMargin)
    }
    
    public var topMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .TopMargin)
    }
    
    public var bottomMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .BottomMargin)
    }
    
    public var leadingMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .LeadingMargin)
    }
    
    public var trailingMargin: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .TrailingMargin)
    }
    
    public var centerXWithinMargins: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .CenterXWithinMargins)
    }
    
    public var centerYWithinMargins: SmartLayoutAttribute {
        return SmartLayoutAttribute(view: self, rawAttribute: .CenterYWithinMargins)
    }
    
}
