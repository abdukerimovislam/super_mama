// --- pregnancy_data.dart ---

// This is our blueprint for weekly information.
class PregnancyWeek {
  final int weekNumber;
  final String babyDevelopment;
  final String momSymptoms;

  // This is a "constructor" to create a new week's info.
  const PregnancyWeek({
    required this.weekNumber,
    required this.babyDevelopment,
    required this.momSymptoms,
  });
}

// This is our mini-database: a list of all the weekly info.
const List<PregnancyWeek> pregnancyData = [
  // Trimester 1
  PregnancyWeek(
    weekNumber: 1,
    babyDevelopment: "This week is counted from the first day of your last period, even though conception has not yet occurred. Your body is preparing for potential pregnancy.",
    momSymptoms: "You are on your period. Your body is shedding last month's uterine lining and preparing a new egg for release.",
  ),
  PregnancyWeek(
    weekNumber: 2,
    babyDevelopment: "Your ovary is preparing to release an egg (ovulation). Fertilization typically occurs at the end of this week or the beginning of the next.",
    momSymptoms: "Your body is preparing for ovulation. Some women may experience mild pelvic discomfort or a heightened sense of smell.",
  ),
  PregnancyWeek(
    weekNumber: 3,
    babyDevelopment: "Fertilization has happened! The fertilized egg, now a blastocyst, travels down the fallopian tube and will soon implant in the uterine wall.",
    momSymptoms: "You won't feel pregnant yet, but a lot is happening on a cellular level. Some women experience light implantation spotting.",
  ),
  PregnancyWeek(
    weekNumber: 4,
    babyDevelopment: "The blastocyst has implanted in your uterus. It's now an embryo, about the size of a poppy seed, and the amniotic sac and placenta are beginning to form.",
    momSymptoms: "This is when you'd expect your period. A missed period is the first major sign. You might feel mild cramping or fatigue.",
  ),
  PregnancyWeek(
    weekNumber: 5,
    babyDevelopment: "The neural tube, which becomes the brain and spinal cord, is forming. The heart is developing and may even start to beat. Baby is the size of an apple seed.",
    momSymptoms: "Morning sickness may begin. Your breasts might feel tender and swollen, and you'll likely feel more tired than usual.",
  ),
  PregnancyWeek(
    weekNumber: 6,
    babyDevelopment: "Facial features like eyes and nostrils are starting to form. Small buds that will become arms and legs are visible. The heart is beating more regularly.",
    momSymptoms: "Nausea and food aversions can be strong. Frequent urination is common as your kidneys become more efficient.",
  ),
  PregnancyWeek(
    weekNumber: 7,
    babyDevelopment: "The baby is doubling in size! Hands and feet are emerging from the developing arms and legs. They are about the size of a blueberry.",
    momSymptoms: "You might be experiencing mood swings due to hormonal changes. The fatigue and nausea may continue.",
  ),
  PregnancyWeek(
    weekNumber: 8,
    babyDevelopment: "Fingers and toes are now forming. The lungs are beginning to take shape. The baby is constantly moving, although you can't feel it yet.",
    momSymptoms: "Your uterus is expanding, which might cause some light cramping. Your sense of smell can be incredibly sensitive.",
  ),
  PregnancyWeek(
    weekNumber: 9,
    babyDevelopment: "All of the baby’s essential organs have begun to form. The tiny tail at the bottom of the spinal cord has disappeared. Baby is the size of a cherry.",
    momSymptoms: "You might feel exhausted. Hormones are surging, and your body is working hard to grow the placenta.",
  ),
  PregnancyWeek(
    weekNumber: 10,
    babyDevelopment: "The embryo is now officially a fetus. Fingernails and toenails are starting to form, and the baby can swallow.",
    momSymptoms: "Your abdomen may be starting to feel firmer. You might notice your veins are more visible due to increased blood volume.",
  ),
  PregnancyWeek(
    weekNumber: 11,
    babyDevelopment: "The fetus is almost fully formed. They are kicking, stretching, and even hiccuping, but it's still too early for you to feel these movements.",
    momSymptoms: "Nausea may start to subside. Headaches can be common due to hormonal shifts and increased blood volume.",
  ),
  PregnancyWeek(
    weekNumber: 12,
    babyDevelopment: "Fingerprints are forming on the tiny fingertips. The baby's reflexes are developing; if you poke your belly, they'll likely squirm in response.",
    momSymptoms: "The risk of miscarriage drops significantly at the end of this week. Your uterus is starting to rise above the pelvic bone.",
  ),
  PregnancyWeek(
    weekNumber: 13,
    babyDevelopment: "Vocal cords are developing, and their intestines are moving from the umbilical cord into their abdomen. Baby is about the size of a peach.",
    momSymptoms: "Welcome to the second trimester! You might be feeling more energetic as early pregnancy fatigue subsides. Your belly is likely starting to show.",
  ),
  // Trimester 2
  PregnancyWeek(
    weekNumber: 14,
    babyDevelopment: "Baby can now squint, frown, and make facial expressions. Their kidneys are producing urine, which is released into the amniotic fluid.",
    momSymptoms: "Round ligament pain, a sharp jab in your side, might start as your uterus grows. Your energy levels may be increasing.",
  ),
  PregnancyWeek(
    weekNumber: 15,
    babyDevelopment: "The baby's skeleton is hardening from soft cartilage to bone. You might be able to find out the baby's sex via ultrasound this week.",
    momSymptoms: "You may experience some nasal congestion, known as pregnancy rhinitis, due to hormonal changes.",
  ),
  PregnancyWeek(
    weekNumber: 16,
    babyDevelopment: "The baby's eyes can now move, and they can hear your voice. Their circulatory and urinary systems are fully functional.",
    momSymptoms: "You might feel the first flutters of movement, called 'quickening.' It can feel like gas bubbles or a gentle tickle.",
  ),
  PregnancyWeek(
    weekNumber: 17,
    babyDevelopment: "Fat stores are beginning to develop under the baby's skin, which will help regulate their body temperature after birth. Baby is the size of an onion.",
    momSymptoms: "Your appetite may be increasing. Be mindful of making healthy food choices to support your growing baby.",
  ),
  PregnancyWeek(
    weekNumber: 18,
    babyDevelopment: "The nervous system is maturing rapidly. A protective coating called myelin is forming around the nerves.",
    momSymptoms: "You may have trouble sleeping comfortably. Try sleeping on your side with pillows for support. You may also feel dizzy at times.",
  ),
  PregnancyWeek(
    weekNumber: 19,
    babyDevelopment: "A waxy, protective coating called vernix caseosa is forming on the baby's skin to protect it from the amniotic fluid.",
    momSymptoms: "Your skin might be changing. Some women develop dark patches called melasma or a dark line down their abdomen called the linea nigra.",
  ),
  PregnancyWeek(
    weekNumber: 20,
    babyDevelopment: "Halfway there! You can likely feel your baby's movements more distinctly now. They are swallowing more, which is good practice for their digestive system.",
    momSymptoms: "Your anatomy scan ultrasound is usually scheduled around this time. Your belly button might pop out.",
  ),
  PregnancyWeek(
    weekNumber: 21,
    babyDevelopment: "The baby's eyebrows and eyelids are now present. Their kicks and jabs are becoming stronger and more frequent.",
    momSymptoms: "Leg cramps, especially at night, can become common. Make sure you're staying hydrated and stretching.",
  ),
  PregnancyWeek(
    weekNumber: 22,
    babyDevelopment: "The baby now looks like a miniature newborn. Their lips, teeth buds, and eyes are more developed. They are about the size of a papaya.",
    momSymptoms: "Your feet might swell. Putting your feet up can help. Stretch marks may start to appear on your abdomen, breasts, or thighs.",
  ),
  PregnancyWeek(
    weekNumber: 23,
    babyDevelopment: "The sense of hearing is improving. The baby can hear sounds from the outside world, like your voice or music, more clearly.",
    momSymptoms: "You might experience Braxton Hicks contractions, which are 'practice' contractions that feel like a tightening of the abdomen.",
  ),
  PregnancyWeek(
    weekNumber: 24,
    babyDevelopment: "The baby's lungs are developing branches of the respiratory 'tree' as well as cells that produce surfactant, a substance that will help them breathe at birth.",
    momSymptoms: "Your doctor will likely test you for gestational diabetes between now and 28 weeks. Your skin may feel itchy as it stretches.",
  ),
  PregnancyWeek(
    weekNumber: 25,
    babyDevelopment: "The baby is practicing breathing by inhaling and exhaling amniotic fluid. Their hair is growing and may have color and texture.",
    momSymptoms: "Backaches are very common as your center of gravity shifts and your growing belly puts a strain on your back muscles.",
  ),
  PregnancyWeek(
    weekNumber: 26,
    babyDevelopment: "The baby's eyes are starting to open and can detect light. Their sleep-wake cycles are becoming more established.",
    momSymptoms: "You might find yourself feeling more forgetful, often called 'pregnancy brain.' It's normal and temporary!",
  ),
  PregnancyWeek(
    weekNumber: 27,
    babyDevelopment: "The baby's brain is very active now. Their lungs are still maturing but could function with medical assistance if they were born now.",
    momSymptoms: "Welcome to the third trimester! You might feel more tired again as the baby gets bigger. Heartburn is a common complaint.",
  ),
  // Trimester 3
  PregnancyWeek(
    weekNumber: 28,
    babyDevelopment: "The baby is gaining weight rapidly, adding layers of fat. They can blink their eyes, which now have eyelashes.",
    momSymptoms: "Your doctor's appointments will likely become more frequent. Restless leg syndrome can be an issue for some women at night.",
  ),
  PregnancyWeek(
    weekNumber: 29,
    babyDevelopment: "The baby's bones are fully developed but still soft and pliable. Their kicks are strong and visible from the outside.",
    momSymptoms: "Constipation and hemorrhoids can be a problem due to hormones and pressure from the uterus. Increase your fiber and water intake.",
  ),
  PregnancyWeek(
    weekNumber: 30,
    babyDevelopment: "The baby can now regulate their own body temperature. Their head is growing to make room for the developing brain. Baby is the size of a large cabbage.",
    momSymptoms: "You may feel short of breath as your uterus presses up against your diaphragm. Your sleep may be frequently interrupted.",
  ),
  PregnancyWeek(
    weekNumber: 31,
    babyDevelopment: "The baby is practicing all five senses. They are processing information, tracking light, and tasting what you eat through the amniotic fluid.",
    momSymptoms: "You might notice a yellowish fluid, colostrum, leaking from your breasts. This is your baby's first milk.",
  ),
  PregnancyWeek(
    weekNumber: 32,
    babyDevelopment: "The baby has likely settled into a head-down position in preparation for birth. The toenails have finished growing.",
    momSymptoms: "Braxton Hicks contractions might be getting stronger and more frequent. You're in the home stretch!",
  ),
  PregnancyWeek(
    weekNumber: 33,
    babyDevelopment: "The baby's skull is still soft, which allows it to move through the birth canal more easily. Their immune system is getting a boost from you.",
    momSymptoms: "It can be hard to find a comfortable position for anything – sitting, standing, or sleeping. The pressure on your bladder is intense.",
  ),
  PregnancyWeek(
    weekNumber: 34,
    babyDevelopment: "The baby's central nervous system is maturing, and the lungs are well-developed. The protective vernix coating on their skin is getting thicker.",
    momSymptoms: "Your vision might be a bit blurry due to fluid retention. This should resolve after you give birth.",
  ),
  PregnancyWeek(
    weekNumber: 35,
    babyDevelopment: "The baby doesn't have much room to move around anymore, so the movements might feel more like rolling and squirming than sharp kicks.",
    momSymptoms: "You'll likely have a Group B Strep test this week. Your doctor will be checking for signs of labor at your appointments.",
  ),
  PregnancyWeek(
    weekNumber: 36,
    babyDevelopment: "The baby is considered 'early term.' They are shedding most of the fine hair (lanugo) and waxy coating (vernix) that covered their skin.",
    momSymptoms: "You might feel the baby 'drop' into your pelvis, a process called lightening. This can relieve pressure on your lungs but increase it on your bladder.",
  ),
  PregnancyWeek(
    weekNumber: 37,
    babyDevelopment: "The baby is now considered 'full term'! They are practicing breathing movements, and their grasp is firm.",
    momSymptoms: "You might be feeling a mix of excitement, anxiety, and impatience. Look out for signs of labor like regular contractions or your water breaking.",
  ),
  PregnancyWeek(
    weekNumber: 38,
    babyDevelopment: "The baby has a full head of hair, and their brain and lungs will continue to mature until birth. They are gaining about half a pound per week.",
    momSymptoms: "You may have a lot of vaginal discharge and lose your mucus plug. Your body is preparing for the big day!",
  ),
  PregnancyWeek(
    weekNumber: 39,
    babyDevelopment: "The baby is ready to meet you! Their brain is still developing at an incredible pace. They are plump and ready for life outside the womb.",
    momSymptoms: "Try to rest as much as you can. It's a waiting game now! Walking and staying gently active can help encourage labor to start.",
  ),
  PregnancyWeek(
    weekNumber: 40,
    babyDevelopment: "Happy due date! Remember that only about 5% of babies are born on their due date. Your baby is fully mature and waiting for the signal to be born.",
    momSymptoms: "You might feel a lot of pelvic pressure and discomfort. Call your doctor if you think you are in labor or if your water breaks.",
  ),
  PregnancyWeek(
    weekNumber: 41,
    babyDevelopment: "The baby is now 'late term.' They continue to grow, and their nails and hair may be quite long at birth.",
    momSymptoms: "Your doctor may discuss options for inducing labor. You will be monitored closely to ensure the baby is still doing well.",
  ),
  PregnancyWeek(
    weekNumber: 42,
    babyDevelopment: "The baby is 'post-term.' The risks are slightly higher, so induction is very likely if you haven't gone into labor naturally.",
    momSymptoms: "It can be emotionally draining to go past your due date. Trust your body and your medical team. You will meet your baby very soon!",
  ),
];