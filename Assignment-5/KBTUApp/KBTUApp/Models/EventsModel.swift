//
//  EventsModel.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import Foundation
import UIKit

struct EventsModel {
    //fields
    private static var events: Array<Events> = Array<Events>()
    
    init() {
        testData()
    }
    
    func addEvent(_ newEvent: Events?) {
        if let x = newEvent {
            EventsModel.events.append(x)
        }
    }
    
    func getEvents() -> Array<Events> {
        return EventsModel.events
    }
    
    func testData() {
        self.addEvent(Events("Webinar “Investigation of computer incidents”", "“KBTU” invites you to participate in the webinar “Investigation of computer incidents”. Aim of the course: Training in legal, organizational and practical issues of investigation of incidents in the field of circulation of computer information. The course examines all aspects of the activities of the security service (information security department) of the organization in responding to incidents in the information system, including the method of preventing the elimination of damage caused by them, suppressing hacker activity, blocking channels of illegal information retrieval and identifying the perpetrators in detail. The training is held online via Microsoft Teams platform. The nearest course will be conducted in the period of November 16 to 20, 2020. Duration of the course: 5 days, from 14:00 to 17:00 (Almaty time). Coach: International specialist, teacher, expert-practitioner in the sphere of information security. Fee-based participation. For all questions regarding participation in the course, contact KBTU manager Ainagul Ismailova: +7 701 512 8332 (telephone/ WhatsApp) or email: A.Izmailova@kbtu.kz", "Webinar “Investigation of computer incidents”", UIImage.init(named: "webinar")!))
        self.addEvent(Events("MEETING OF THE KBTU MANAGEMENT WITH THE SECOND COURSE", "Dear second-year students of KBTU, on August 28, an online meeting with the university leadership will be organized for you! The meeting will discuss the educational process in the fall semester, the change in the paradigm of education, online learning, student life and other issues. Date: 28.08. Time: 11:00 Platform: Microsoft Teams 365, link: https://teams.microsoft.com/l/meetup-join/19%3ameeting_ODZiMDcyZDItNTExNS00ZDM4LWExYTAtMjgxMDIwNzdiODUy%40thread.v2/0?context=%7b%22Tid%22%3a%2257081b5e-e66a-4993-8eaf-15b0b309293f%22%2c%22Oid%22%3a%22fb672eb7-6c1f-403b-aad4-3762195c5c70%22%7d", "KBTU management meeting with the second year students", UIImage.init(named: "meeting")!))
        self.addEvent(Events("Вебинар «Эффективные продажи»", "Спешим сообщить о проведении бесплатного вебинара на тему «Эффективные продажи». Если Вы хотите узнать ответы на вопросы: - Почему клиенты покупают у одних и не покупают у других? -Как стать необходимым для своих клиентов? -Как продать товар или услугу? -Как подготовиться к продажам и какие навыки при этом будут необходимы? А также обсудить влияние пандемии COVID на продажи, то приглашаем вас на вебинар «Эффективные продажи», который состоится 9 июня с 15.00 до 15.40 ч (по времени Алматы). Вебинар проведет ведущий эксперт в области продаж, бизнес-тренер Айнур Калмагамбетова. Участие в вебинаре будет полезно для руководителей компаний, руководителей и специалистов отдела продаж, маркетинга и других заинтересованных в продажах лиц. Регистрация по ссылке: https://docs.google.com/forms/d/1cpPTQOSmkTeI6VrA4YLaBgiIAKr-vC0Djg-LWePecxk/viewform?edit_requested=true Для дополнительной консультации свяжитесь, пожалуйста, с Амангуль Жайлибаевой: 8 777 999 8238, A.Zhailibayeva@kbtu.kz", "9 июня состоится бесплатный вебинар «Эффективные продажи».", UIImage.init(named: "Efficient-sales")!))
        self.addEvent(Events("Online meeting of the KBTU rector with teaching staff", "On June 2, the rector of KBTU will meet online with professors and teachers of the university. As part of the meeting, June 3-4, exclusively for teaching staff of KBTU will be held training webinars on digital literacy.", "On June 2, the rector of KBTU will meet online with the teaching staff.", UIImage.init(named: "Rectors-meeting")!))
    }
}
