//
//  DateExtension.swift
//  AppValePar
//
//  Created by Regis Araujo Melo on 07/03/19.
//  Copyright © 2019 Vale Par. All rights reserved.
//


import Foundation
import UIKit

extension  Date {
    /*** Usage -> let date = Date() // let newString = date.hourToString() ***/
    public func hourToString() -> String {
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: self)
        let min = calendar.component(.minute, from: self)
        let sec = calendar.component(.second, from: self)
        
        return String(hour)+":"+String(min)+":"+String(sec)
    }
    
    fileprivate struct AssociatedKeys {
        static var TimeZone = "biss_TimeZone"
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    var timeZone: NSTimeZone {
        return objc_getAssociatedObject(self, &AssociatedKeys.TimeZone) as? NSTimeZone ?? calendar.timeZone as NSTimeZone
    }
    
    fileprivate var calendar: NSCalendar {
        return (NSCalendar.autoupdatingCurrent as NSCalendar)
    }
    
    public func milliSecoundsToHoursMinutes (seconds : Int) -> String {
        return ("\(seconds / 3600)h\((seconds % 3600) / 60)")
    }
    
    public func milliSecoundsToDate (seconds: Int64) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(seconds/1000))
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    
    public func dateToString() -> String {
        
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: self)
        let month = calendar.component(.month, from: self)
        let year = calendar.component(.year, from: self)
        
        if day < 10 && month < 10{
            return "0"+String(day)+"/0"+String(month)+"/"+String(year)
        }
        if month < 10 {
            return String(day)+"/0"+String(month)+"/"+String(year)
        } else {
            return String(day)+"/"+String(month)+"/"+String(year)
        }
    }
    
    func isDateFuture() -> Bool {
        if self.timeIntervalSinceReferenceDate >  Date().timeIntervalSinceReferenceDate {
            return true
        }
        return false
    }
    
    func new(from string: String, format: String) -> Date? {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-3:00")
        return dateFormatter.date(from: string)
    }
    
    func currentDate() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let result = formatter.string(from: date)
        return result
    }
    
    public func stringToDate(string: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-3:00") //Current time zone
        return dateFormatter.date(from: string) //according to date format your date string
    }
    
    
    
    public func removeTimeStamp() -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            fatalError("Failed to strip time from Date object")
        }
        return date
    }
    
    public func ageFromBirthDay() -> Int? {
        
        let now = Date()
        let birthday: Date = self
        let calendar = Calendar.current
        
        let ageComponents = calendar.dateComponents([.year], from: birthday, to: now)
        return ageComponents.year ?? calendar.dateComponents([.year], from: Date(), to: Date()).year
        
    }
    
    public func setTime(hour: Int, min: Int, sec: Int, timeZoneAbbrev: String = "UTC") -> Date? {
        let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
        let cal = Calendar.current
        var components = cal.dateComponents(x, from: self)
        
        components.timeZone = self.timeZone as TimeZone
        components.hour = hour
        components.minute = min
        components.second = sec
        
        return cal.date(from: components)
    }
    
    /// Returns the amount of days from another date
    func days(from initDate: Date, to endDate: Date) -> Int {
        let calendar = Calendar.current
        
        // Replace the hour (time) of both dates with 00:00
        let initDate = calendar.startOfDay(for: initDate)
        let endDate = calendar.startOfDay(for: endDate)
        
        return calendar.dateComponents([.day], from: initDate, to: endDate).day ?? 0
    }
    
}

