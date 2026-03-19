## Database Recommendation
Choosing the Database based on the problem gives clear path the solution. here problems are
- Treating the Patient admitted to hospital
- Losses due to false claims (Fraud detection)

when Treating a patient, the past medical records such as medications, surgical history etc.  
play key role diagonsing the patient condition. So, any incosistency/accurate date about the patient can lead to casuality and bad reputation to the hospital.  
Here, __MySQL Database__ is the go to option for it's strict rules (ACID) for integrity of the data. 
Following CAP theorem for patient safety, Consistency must be prioritized over Availability. Showing a doctor outdated medication data, even for seconds, could be life threatening.


For fraud detection requires large set of unstructured data to draw patterns of fraud. In this case the __MongoDB__ is a great choice.  
because there are different kinds of frauds can happen like
- Hospital bills - Billing for treatments never given
- Medication details - Over prescribing expensive drugs
- Admit details - Fake admissions for insurance money
- Medical records - Altering records to hide mistakes

all these are frauds but done differently this where __MongoDB__ is help to store unstructured data.

So, my recommendation would be using __MySQL Database__ for Patients records along side with __MongoDB__ for fraud data.

