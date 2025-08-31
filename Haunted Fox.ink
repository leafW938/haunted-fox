// New Cross Cop - Interactive Narrative Demo
// Written by Leaf Wang
//5-10mins

-> Archives_Start

VAR items_found = 0
VAR examined_doughnut = false
VAR examined_newspaper = false
VAR examined_magnifier = false
VAR examined_badge = false
VAR talked_to_arthur = false

=== Archives_Start ===
The basement air is thick with the scent of old paper and dust.
* [Cough, cough...]
    -> archives_shelves

=== archives_shelves ===
Tall metal shelves groan under the weight of decades-old case files, stretching up into the gloom.
* [Look up.]
    -> archives_bulb

=== archives_bulb ===
A single, bare bulb swings overhead, casting long, dancing shadows.
* [Take in the scene.]
    -> archives_reflection

=== archives_reflection ===
"First day on the job and I'm banished to the archives... Superintendent Logan really knows how to roll out the welcome mat."
* ["Alright. Time to conquer this mountain of paper."]
* ["Better get this over with."]
- -> Find_Objects

=== Find_Objects ===
My task: clear out the East Sector files. But first, I need to clear some space.

* {items_found < 4 && not examined_doughnut} [Examine the half-eaten doughnut.] -> doughnut
* {items_found < 4 && not examined_newspaper} [Examine the old newspaper.] -> newspaper
* {items_found < 4 && not examined_magnifier} [Examine the broken magnifying glass.] -> magnifier
* {items_found < 4 && not examined_badge} [Examine the rusted police badge.] -> badge
* {items_found >= 4} [Start sorting the East Sector boxes.] -> Archives_Cleared

=== doughnut ===
~ items_found += 1
~ examined_doughnut = true
Tucked inside an open file box. A fly buzzes lazily over the stale glaze.
"Some things never change. I bet the coffee was just as bad back then, too."
-> Find_Objects

=== newspaper ===
~ items_found += 1
~ examined_newspaper = true
Peeking out from under a heavy cabinet. The headline reads: 'Silver Jubilee Preparations in Full Swing'. The date is smudged, but visible: 1977.
"1977... a busy year. Dad would have been seven."
-> Find_Objects

=== magnifier ===
~ items_found += 1
~ examined_magnifier = true
The lens is cracked clean in two. Dropped in a hurry, maybe.
"Looks like someone was searching for something they weren't supposed to see."
-> Find_Objects

=== badge ===
~ items_found += 1
~ examined_badge = true
Dull and forgotten in a corner.
"Every one of these is supposed to have a story."
-> Find_Objects

=== Archives_Cleared ===
With the clutter cleared, I can finally get to the East Sector boxes. One in particular catches my eye, wedged deep at the back.

* [Pull the box free.]
    I pull it free, a cloud of dust exploding into the light. But it's not the box that holds my attention. It's what's on top of it.
    -> discover_folder
* [Focus on the object.]
    -> discover_folder

=== discover_folder ===
A single red folder. No labels. It looks almost new, completely out of place in this mausoleum of forgotten cases.

* [Examine the folder.]
    "Strange. It's almost as if someone left it here for me to find."
    I carry it over to the weak light of the hanging bulb and open it.
    -> read_contents

=== read_contents ===
* [Try to read the contents.]
    Inside, most of the text has been blacked out with a thick marker. Redacted.
    But holding it up to the light... I can just make out a few words ghosting through the ink.
    -> decipher_text

=== decipher_text ===
* [Squint to read the visible text.]
    Case Type: ...dead greyhounds.
    Location: New Cross Depot.
    Lead Detective: Paul Michaels.
    -> react_to_discovery

=== react_to_discovery ===
"Paul Michaels... That's... that's my grandfather's name."

* ["A cold case about my grandfather, buried and redacted... This can't be a coincidence."]
    -> decision_point
* ["Why would a simple case about dogs be covered up? And what was Grandpa's role in it?"]
    -> decision_point

=== decision_point ===
"Ezra would just dismiss me if I asked. But the file mentioned a name... a bookie he was investigating. And an address."

* [Report the finding to Superintendent Logan.] -> Report_To_Logan
* [Investigate the address from the file myself.] -> Go_To_Pub

=== Report_To_Logan ===
I take the file upstairs and find Superintendent Logan at his desk, buried in paperwork.
"Sir, I found this in the archives. It has no markings, but it seems important."
He takes it without looking up, flips it open, and then closes it. "Unmarked files go in the shredder, Michaels. I don't have time for administrative errors."
He dismisses me with a wave of his hand.
-> END

=== Go_To_Pub ===
"This feels bigger than a simple filing error. If I want answers, I'll have to find them myself."
-> The_Marquis_of_Granby
    
// --------------------------------------------------------------------
// SCENE 2: THE MARQUIS OF GRANBY
// --------------------------------------------------------------------

=== The_Marquis_of_Granby ===
The address leads me to a pub, The Marquis of Granby.

* [Push open the heavy door.]
    The air inside is heavy with the smell of stale beer and disinfectant.
    -> scan_pub
* [Hesitate at the entrance.]
    This could be dangerous. But I need answers.
    -> scan_pub

=== scan_pub ===
* [Scan the room.]
    A few old-timers are scattered around, lost in their own worlds. Behind the bar, a man in his seventies with tired, wary eyes polishes a glass. He fits the description.
    -> approach_decision

=== approach_decision ===
* ["That must be him. Time to see what he knows."]
    -> approach_bar
* ["I need to be careful with this. He won't talk easily."]
    -> approach_bar

=== approach_bar ===
I walk up to the bar.
-> Arthur_Dialogue_Start

=== Arthur_Dialogue_Start ===
"Good afternoon," I say. "Could I ask you a few questions?"
The old barman, ARTHUR, glances at me, then back at his glass. "If you're ordering, yes. If you're chatting, no. I'm busy."
"New Cross PD. I'm looking into an old case."
Arthur stops polishing. His posture stiffens. "Police? Haven't had a cop in here asking about 'old cases' for decades. I've got nothing to say."

* {not talked_to_arthur} "This is just a routine inquiry." -> arthur_routine
* "It concerns a detective named Paul Michaels." -> arthur_paul
* [Present Evidence] "I'm here because of this." -> arthur_present_evidence

=== arthur_routine ===
~ talked_to_arthur = true
Arthur scoffs. "Nothing routine ever brought a detective to my door. Now, are you going to order a drink or waste my time?"
He turns his back on me. I need a different approach.

* "It concerns a detective named Paul Michaels." -> arthur_paul
* [Present Evidence] "I'm here because of this." -> arthur_present_evidence
* [Leave the pub.] -> pub_exit_empty
    
=== arthur_paul ===
His eyes narrow at the name, a flicker of something... but it's gone as quickly as it came. "Never heard of him."
He's lying. I need something more specific.

* [Present Evidence] "I'm here because of this." -> arthur_present_evidence
* [Press him harder.] "I think you do know him." -> arthur_press
* [Leave the pub.] -> pub_exit_empty

=== arthur_press ===
Arthur's jaw tightens. "I said I never heard of him. Now either order something or get out."
The tension in the pub is palpable. I need to try a different approach.

* [Present Evidence] "Let me show you something." -> arthur_present_evidence
* [Leave the pub.] -> pub_exit_empty

=== arthur_present_evidence ===
I pull out the redacted file. "I found this in the archives."
How do I get him to talk?

* [Mention Detective Paul Michaels.] -> arthur_paul_with_evidence
* [Mention the dead greyhounds.] -> arthur_greyhounds

=== arthur_paul_with_evidence ===
"This file mentions Detective Paul Michaels. He was my grandfather."
Arthur's expression softens slightly. "Your grandfather, eh? Well... that changes things."
-> arthur_reveals_truth

=== arthur_greyhounds ===
I lean in slightly. "I'm not here about Paul Michaels. I'm here about a train carriage full of dead greyhounds."
Arthur freezes. The glass in his hand stops moving. He slowly sets it down on the bar and looks me straight in the eye for the first time.
"Forty years," he says, his voice raspy. "I thought no one would ever mention that again."
"Paul Michaels was my grandfather. I need to know what happened."
He lets out a long, weary sigh. "Your grandfather... he was a good man. Too good for this job. And too stubborn."
    
* "What did he find out?" -> arthur_reveals_truth
* "Why do you say he was stubborn?" -> arthur_stubborn

=== arthur_stubborn ===
"He wouldn't let it go. Kept digging when anyone with any sense would have walked away. That's what got him into trouble." He shakes his head. "You have the same look in your eye."
-> arthur_reveals_truth

=== arthur_reveals_truth ===
Arthur leans forward, his voice dropping to a conspiratorial whisper.
"He found out those dogs weren't just about illegal racing. It was tied to a massive underground gambling syndicate. Connected to the Millwall firm, and worse."

* [Let him continue.]
    He glances around the empty pub nervously.
    "Listen to me, girl. You're just like him. You've got that fire in your eyes. But some things are better left buried. Let sleeping dogs lie. "
    -> final_warning

=== final_warning ===
* ["He's warning me? Is this bigger than I thought..."]
    -> leave_pub_informed
* ["A warning... or a threat? Either way, I shouldn't back down."]
    -> leave_pub_determined

=== leave_pub_informed ===
I thank him for his time and turn to leave stiffly. The truth feels closer now, but so does the danger.
-> Pub_Exit_Scene

=== leave_pub_determined ===
I thank him for his time and turn to leave, more determined than ever. The truth feels closer now.
-> Pub_Exit_Scene

=== pub_exit_empty ===
I leave the pub with more questions than answers. Maybe I need to find another approach.
-> END

// --------------------------------------------------------------------
// SCENE 3: THE WARNING
// --------------------------------------------------------------------

=== Pub_Exit_Scene ===
As I walk out onto the street, the pub door swinging shut behind me, the scene inside remains.

* [Pause for a moment outside.]
    Arthur watches me go. After a moment's hesitation, he pulls an old flip phone from under the counter. He dials a number.
    -> arthur_phone_call
* [Walk away quickly.]
    -> END

=== arthur_phone_call ===
* [Watch him through the window.]
    "It's me," he says into the phone. "Someone's asking about forty years ago... yeah, '77."
    He pauses, listening.
    "A girl. Young. A cop... Yes... It's *his* granddaughter."
    -> phone_call_end

=== phone_call_end ===
* [Move on.]
    He snaps the phone shut.
    -> END