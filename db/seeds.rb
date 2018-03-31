# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	admin = User.create(email: "admin@gmail.com", password: "admin", role: User.roles["admin"], name: "DIPP")

    m1 = Ministry.create(name: 'Public Sector', description: 'We are associated with the public sector.')
	m2 = Ministry.create(name: 'Ministry of skill development and Entrepreneurship', description: 'We are associated with skill development and Entrepreneurship')
	m3 = Ministry.create(name: 'Ministry of new and renewable energy resources', description: 'We are associated with new and renewable energy resources')
	m4 = Ministry.create(name: 'Ministry of petroleum', description: 'We are associated with petroleum')
	m5 = Ministry.create(name: 'NITI Aayog', description: 'We are associated with NITI Aayog')
	m6 = Ministry.create(name: 'Ministry of electronics and Information Technology', description: 'We are associated with electronics and Information Technology')
	m7 = Ministry.create(name: 'Ministry of Science and Technology', description: 'We are associated with science and Technology')
	m8 = Ministry.create(name: 'Ministry of micro, small and medium enterprises', description: 'We are associated with micro, small and medium enterprises')
	m9 = Ministry.create(name: 'Ministry of heavy industries and public enterprise', description: 'We are associated with heavy industries and public enterprises')
	m10 = Ministry.create(name: 'Ministry of Agriculture', description: 'We are associated with Agriculture')
	m11 = Ministry.create(name: 'Ministry of Ministry of Law and Justice', description: 'We are associated with Law and Justice')


	u11 = User.create(email: "abc1@gmail.com", password: "abcd", name: "abc1", role: User.roles["officer"])
	u12 = User.create(email: "abc2@gmail.com", password: "abcd", name: "abc2", role: User.roles["officer"])
	u13 = User.create(email: "abc3@gmail.com", password: "abcd", name: "abc3", role: User.roles["officer"])
	d11 = Department.create(name: 'Small Industries Development Bank of India',user_id: u11.id ,ministry_id: m1.id)
	d12 = Department.create(name: 'Mudra',user_id: u12.id ,ministry_id: m1.id)
	d13 = Department.create(name: 'National Bank for Agriculture and Rural Development',user_id: u13.id ,ministry_id: m1.id)

    u21 = User.create(email: "abc4@gmail.com", password: "abcd", name: "abc4", role: User.roles["officer"])
	d21 = Department.create(name: 'National Skill Development Corporation',user_id: u21.id ,ministry_id: m2.id)
	
	u31 = User.create(email: "abc5@gmail.com", password: "abcd", name: "abc5", role: User.roles["officer"])
	d31 = Department.create(name: 'Indian Renewable Energy Development Agency',user_id: u31.id ,ministry_id: m3.id)
	
	u41 = User.create(email: "abc6@gmail.com", password: "abcd", name: "abc6", role: User.roles["officer"])
	d41 = Department.create(name: 'directorate general of hydrocarbons',user_id: u41.id ,ministry_id: m4.id)
		
	u51 = User.create(email: "abc7@gmail.com", password: "abcd", name: "abc7", role: User.roles["officer"])
	d51 = Department.create(name: 'Atal Innovation Mission',user_id: u51.id ,ministry_id: m5.id)
	
	u61 = User.create(email: "abc8@gmail.com", password: "abcd", name: "abc8", role: User.roles["officer"])
	u62 = User.create(email: "abc9@gmail.com", password: "abcd", name: "abc9", role: User.roles["officer"])
	d61 = Department.create(name: 'Software Technology parks of India',user_id: u61.id ,ministry_id: m6.id)
	d62 = Department.create(name: 'Department of electronics and information technology (DeitY)',user_id: u62.id ,ministry_id: m6.id)
	
	u71 = User.create(email: "abc10@gmail.com", password: "abcd", name: "abc10", role: User.roles["officer"])
	u72 = User.create(email: "abc11@gmail.com", password: "abcd", name: "abc11", role: User.roles["officer"])
	u73 = User.create(email: "abc12@gmail.com", password: "abcd", name: "abc12", role: User.roles["officer"])
	u74 = User.create(email: "abc13@mail.com", password: "abcd", name: "abc13", role: User.roles["officer"])
	u75 = User.create(email: "abc14@gmail.com", password: "abcd", name: "abc14", role: User.roles["officer"])
	d71 = Department.create(name: 'Science and Engineering Research Board (SERB)',user_id: u71.id ,ministry_id: m7.id)
	d72 = Department.create(name: 'Department of Science and Technology',user_id: u72.id ,ministry_id: m7.id)
	d73 = Department.create(name: 'Biotechnology Industry Research Assistance Council (BIRAC)',user_id: u73.id ,ministry_id: m7.id)
	d74 = Department.create(name: 'Council of Scientific and Industrial Research ',user_id: u74.id ,ministry_id: m7.id)
	d75 = Department.create(name: 'Department of Biotechnology',user_id: u75.id ,ministry_id: m7.id)

	u81 = User.create(email: "abc15@gmail.com", password: "abcd", name: "abc15", role: User.roles["officer"])
	u82 = User.create(email: "abc16@gmail.com", password: "abcd", name: "abc16", role: User.roles["officer"])
	u83 = User.create(email: "abc17@gmail.com", password: "abcd", name: "abc17", role: User.roles["officer"])
	u84 = User.create(email: "abc18@gmail.com", password: "abcd", name: "abc18", role: User.roles["officer"])
	u85 = User.create(email: "abc19@gmail.com", password: "abcd", name: "abc19", role: User.roles["officer"])
	u86 = User.create(email: "abc20@gmail.com", password: "abcd", name: "abc20", role: User.roles["officer"])
	d81 = Department.create(name: 'Steering Committee)',user_id: u81.id ,ministry_id: m8.id)
	d82 = Department.create(name: 'Khadi and Village Industries Commission',user_id: u82.id ,ministry_id: m8.id)
	d83 = Department.create(name: 'National Small Industries Corporation',user_id: u83.id ,ministry_id: m8.id)
	d84 = Department.create(name: 'Office of the development commissioner (MSME) ',user_id: u84.id ,ministry_id: m8.id)
	d85 = Department.create(name: 'Credit Guarantee Fund Trust for Micro and small enterprises (CGFTMSE)',user_id: u85.id ,ministry_id: m8.id)
	d86 = Department.create(name: 'Coir Board',user_id: u86.id ,ministry_id: m8.id)

	u91 = User.create(email: "abc21@gmail.com", password: "abcd", name: "abc21", role: User.roles["officer"])
	d91 = Department.create(name: 'Department of heavy industries',user_id: u91.id ,ministry_id: m9.id)

	u101 = User.create(email: "abc22@gmail.com", password: "abcd", name: "abc22", role: User.roles["officer"])
	d101 = Department.create(name: 'Department of Agriculture and Corporation',user_id: u101.id ,ministry_id: m10.id)

	u111 = User.create(email: "abc23@gmail.com", password: "abcd", name: "abc23", role: User.roles["officer"])
	d111 = Department.create(name: 'Ministry of Law and Justice',user_id: u111.id ,ministry_id: m11.id)












 #    s = Schemes.create(name: 'gov funding scheme', guidelines: 'kindly submit proper proofs', collateral: 'plot', ticket_size: '2 cr', interest_rate: '5%', department_id: d.id)

	# departments = Department.create(department: ' National Bank for Agriculture and Rural Development',ministry:'Public Sector Enterprise')
	# departments = Department.create(department: ' Micro Units Development and Refinance Agency Ltd.',ministry:'Public Sector Enterprise')
	# departments = Department.create(department: ' National Skill Development Corporation',ministry:'Ministry of Skill Development and Entrepreneurship')
	# departments = Department.create(department: ' Indian renewable energy development agency',ministry:'Ministry of New and Renewable Energy Resources')
	# departments = Department.create(department: ' Directorate general of hydrocarbons',ministry:'Ministry of petroleum')

	
 # 	schemes = Schemes.create( name: 'Stand Up India', department: 'Small Industries Development Bank of India')
 # 	schemes = Schemes.create( name: 'Startup Assistance Scheme', department: 'Small Industries Development Bank of India')
 # 	schemes = Schemes.create( name: 'Growth Capital and Equity Assistance Scheme', department: 'Small Industries Development Bank of India')
	# schemes = Schemes.create( name: 'SIDBI Make in India Soft Loan Fund', department: 'Small Industries Development Bank of India')
	# schemes = Schemes.create( name: 'Pradhan Mantri Mudra Yojana', department: 'Micro Units Development and Refinance Agency Ltd.')
	# schemes = Schemes.create( name: 'Daily Entrepreneurship Development Scheme', department: 'National Bank for Agriculture and Rural Development')
	# schemes = Schemes.create( name: 'Growth Capital and Equity Assistance Scheme', department: 'National Skill Development Corporation')
	# schemes = Schemes.create( name: 'Udaan training programme for unemployed youth of Jammu and Kashmir', department: 'National Skill Development Corporation')
 	

 # 	schemes = Schemes.create( name: 'Loan for rooftop solar pv power projects', department: 'Indian renewable energy development agency')
 # 	schemes = Schemes.create( name: 'Bridge loan against GBI claims', department: 'Indian renewable energy development agency')
 # 	schemes = Schemes.create( name: 'National clean energy fund refine', department: 'Indian renewable energy development agency')
 # 	schemes = Schemes.create( name: 'IREDA Scheme for discounting every bil', department: 'Indian renewable energy development agency')
 # 	schemes = Schemes.create( name: 'Bridge loan against MNRE Capital Subsidy', department: 'Indian renewable energy development agency')
 # 	schemes = Schemes.create( name: 'Credit enhancement guarantee scheme', department: 'Indian renewable energy development agency')

 # 	schemes = Schemes.create( name: 'Incredible india bread and breakfast', department: 'Directorate General of hydrocarbons')
 # 	schemes = Schemes.create( name: 'Innovation in science pursuit for inspired research', department: 'Directorate General of hydrocarbons')
 # 	schemes = Schemes.create( name: 'Vajra', department: 'Directorate General of hydrocarbons')
 # 	schemes = Schemes.create( name: 'Bionest', department: 'Directorate General of hydrocarbons')
 # 	schemes = Schemes.create( name: 'BPCL startup fun', department: 'Directorate General of hydrocarbons')
 	 	 	
 	 	 	



 	






