//
//  NewsModel.swift
//  KBTUApp
//
//  Created by macbook on 12.03.2021.
//

import Foundation
import UIKit

class NewsModel {
    
    private(set) static var news: Array<News>? = Array<News>()
    
    init() {
        testData()
    }
    
    func addNews(_ news: News?) {
        if let x = news {
            NewsModel.news?.append(x)
        }
    }
        
    
    func testData() {
        
        self.addNews(News("ACADEMIC SKILLS PREPARATION COURSE", "The Academic Skills course is aiming at an earlier immersion of high school graduates, would-be Bachelor students in the academic environment. The course is designed for those who would like to master their learning competencies, to get familiarized with main aspects of studying at university, and to acquire basic skills for effective academic activities. As the language of instruction is English, listening, reading, writing, and speaking skills in the target language will be improved. As part of the program, course takers will participate in lectures, seminars, and tutorials, where they will learn how to set goals, increase confidence when speaking, develop interpersonal communication skills. The course takers will also get acquainted with the online platforms used in KBTU for academic goals achievement, for the learning materials storage, and for measuring students’ academic performance.","The Academic Skills course is aiming at an earlier immersion of high school graduates, would-be Bachelor students in the academic environ", UIImage.init(named: "kurs_skills")!))
        
        self.addNews(News("КУРСЫ ПОДГОТОВКИ К КОМПЛЕКСНОМУ ТЕСТИРОВАНИЮ","КУРСЫ ПОДГОТОВКИ К КОМПЛЕКСНОМУ ТЕСТИРОВАНИЮ Уважаемые выпускники ВУЗов! Мы рады сообщить о запуске подготовительного курса к сдаче комплексного тестирования для поступления на магистратуру Подготовительный курс направлен на обучение выпускников бакалавриата, желающих получить послевузовское образование. Подготовка к КТ проводится:- по двум профильным дисциплинам выбранной образовательной программы КБТУ. - для освоения программ пререквизитов, при выборе родственной специальности. Программа готовит к поступлению на определенную образовательную программу. «Полный комплекс» - состоит из 2 дисциплин: Два профильных предмета. Формат: онлайн (Microsoft Teams) Язык обучения: русский Начало занятий: 15 марта 2021г. Стоимость за курс за один месяц – 25 000 тенге. Занятия проводят внутренние и внешние опытные преподаватели. Регистрация: https://forms.gle/Rp8pKq88qRxq9zNU9 Контакты: +7 747 445 47 36 (WA)  m.abikaeva@kbtu.kz", "Уважаемые выпускники ВУЗов! Мы рады сообщить о запуске подготовительного курса к сдаче комплексного тестирования для", UIImage.init(named: "kurs_test")!))
        
        self.addNews(News("INFORMATION ABOUT COURSE", "Dear friends! We are glad to inform you about the launch of a preparatory course on programming! This course is designed for hands-on training in programming in the Python language using standard well-known methods, tools and technologies. The course also helps improve learners' algorithmic thinking and problem-solving ability so learners can write code that actually works and produces the desired functional results The course contains many well thought out coding exercises. Format: Online Language: Russian Duration of the course: 4 weeks / 16 hours (2 times a week for 2 hours) Course teacher: Yershat Sapazhanov - senior lecturer of FIT KBTU Course price: 50 000 tenge. This course will help students understand the general principles of programming and prepare students for education at KBTU in the specialties of Information systems, Computer systems and software, Automation and control, Mathematical and computer modeling. Contacts for feedback: e.sapazhanov@kbtu.kz Application form for registration for courses: https://forms.office.com/Pages/ResponsePage.aspx?id=XhsIV2rmk0mOrxWwswkpP7AYNgiUJrJKsWOhQLJxX4tUM1hBMlZZT0FBRVpZQkowQUdUNjJNTzdPQi4u", "Dear friends! We are glad to inform you about the launch of a preparatory course on programming!", UIImage.init(named: "kurs_prog")!))
        
        self.addNews(News("ЗАПУСКАЕМ ЧЕТВЕРТЫЙ ПОТОК ОНЛАЙН КУРСОВ АНГЛИЙСКОГО ЯЗЫКА 'STEP'", "STEP - интенсивные курсы английского языка, который состоит из языковой практики для следующих уровней: ⠀ ⁃ Pre-Intermediate ⁃ Intermediate ⁃ Upper-Intermediate ⠀ В каждой группе используются все основные навыки: чтение, аудирование (прослушивание), письменная грамота и устная речь. Упор делается на коммуникацию и развитие устной речи. По окончанию курса выдаётся сертификат. ⠀ Состав тренеров курса состоит из опытных отечественных и зарубежных преподавателей. ⠀ Количество слушателей в одной группе: 12-14 человек. ⠀ Объем программы: 30 академических часов (4 недели) Гибкий график обучения. ⠀ Длительность занятия: 2 академических часа (10 мин перерыв) ⠀ ❗️Регистрация уже началась: https://docs.google.com/forms/d/e/1FAIpQLSd5-KAOIQqXyxm7nS2rfi9zVEfe1960EO8iEZjrSIxaq0gIHQ/viewform ⠀ Начало занятий: 11 марта 2021 г. Стоимость курса: 20 000 тенге. Формат: онлайн интерактив с преподавателем ⠀ Поспеши, регистрация открыта до 10 марта 2021 г. ⠀ Реквизиты для оплаты будут доступны после регистрации. Чек оплаты отправить на электронную почту ниже в описании. ⠀ По всем вопросам: k.berezina@kbtu.kz +7747 445 47 36 (WA); +7701 514 39 97 (звонки) Кристина Березина Рабочее время 09:00-18:00", "STEP - интенсивные курсы английского языка, который состоит из языковой практики для следующих уровней:", UIImage.init(named: "kurs_eng")!))
    
        self.addNews(News("КУРСЫ ПО ПОДГОТОВКЕ К ЕНТ","КБТУ ведет набор на подготовительные курсы к ЕНТ по профильным и обязательным образовательным дисциплинам. ⠀ Профильные: - Математика - Физика - География - Химия ⠀ Обязательные: - История Казахстана - Грамотность чтения - Математическая грамотность ⠀ Преимущества ⠀ - опытные преподаватели - группы с казахским и русским языком обучения - гибкий график обучения (онлайн: утренние, вечерние) - доступные цены ⠀ Формат: онлайн-интерактив с преподавателем, Платформа: Microsoft Teams ⠀ Кол-во академических часов в неделю: - обязательная дисциплина – 1,5 часа - профильная дисциплина – 3 часа ⠀ Регистрация: до 10 марта 2021 г.: https://docs.google.com/forms/d/e/1FAIpQLScIl6dEuiQ6-_OC7S4tG2GKDvi7zl265JlzKi888i-JDrUcsA/viewform Начало занятий: 10 марта 2021 г. ⠀ Стоимость: ⠀ Цена одной обязательной дисциплины – 12 000 тенге в месяц. Цена одной профильной дисциплины – 24 000 тенге в месяц. Цена 5 дисциплин в комплексе – 51 000 тенге в месяц. ⠀ Контактные данные: m.abikaeva@kbtu.kz +7 747 445 47 36 (WhatsApp) ⠀ Количество слушателей в группе определяется в зависимости от уровня подготовки слушателя, составляется график занятий. Во время обучения проводится пробное тестирование в онлайн формате. Учебный материал предоставляется в электронном виде", "КБТУ ведет набор на подготовительные курсы к ЕНТ по профильным и обязательным образовательным дисциплинам", UIImage.init(named: "kurs_ent")!))
    }
}
