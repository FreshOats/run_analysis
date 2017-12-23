DATA CODEBOOK - Human Activity Recognition Using Smartphones Data Set

VARIABLES/NAMING STRUCTURE
	subject
	  Subject Number - number assigned to individual participating in experiment (1-30). 
	  
	activity
	  The physical activity recorded as part of the experiment during data collection. 
	  1. walking - walking in a planar direction
	  2. walkingupstairs - walking up stairs
	  3. walkingdownstairs - walking down stairs
	  4. sitting - sitting in the prone position
	  5. standing - standing in a erect position
	  6. laying - laying flat
	  
	body.acceleration.
	  Body acceleration components measured (triaxial: x, y, and z axes) using the built-in accelerometer,
	  applying high-frequency filtration to isolate body acceleration.

	body.gyroscope.
	  Body angular velocity measured using built-in gyroscope.

	fft.
	  Fast Fourier Transform - time domain is measured in all gyroscope and accelerometer measurements
	  unless denoted by fft. label, which indicated that data has been transformed into the frequency domain

	frequency.
	  Denotes that the indicated measurement is a weighted average of frequency components to obtain a mean frequency. 
	  
	gravity.accelerometer.
	  Gravitational acceleration components measured (triaxial: x, y, and z axes) using built-in accelerometer, 
	  applying low-frequency filtration to isolate the gravitational component of acceleration. 
	  
	jerk.
	  Jerk was measured from the change in linear acceleration or angular velocity and represented with the jerk. label.
	  
	magnitude. 
	  Measurements labeled with .magnitude measure the vector magnitude of the combined x, y, and z components.
	  
	mean.
	  The arithmetic mean of the means was acquired by taking the mean of all replicate means from each subject and activity. This is a mean of means. 
	  The means are measured for the individual x, y, and z components for the acceleration, jerk, and frequency.
		
	std. 
	  The std. represents the mean standard deviation of the collected data. 


COMPLETE LIST OF VARIABLES
  
	body.accelerometer.mean.x
	body.accelerometer.mean.y
	body.accelerometer.mean.z
	body.accelerometer.std.x
	body.accelerometer.std.y
	body.accelerometer.std.z
	gravity.accelerometer.mean.x
	gravity.accelerometer.mean.y
	gravity.accelerometer.mean.z
	gravity.accelerometer.std.x
	gravity.accelerometer.std.y
	gravity.accelerometer.std.z
	body.accelerometer.jerk.mean.x
	body.accelerometer.jerk.mean.y
	body.accelerometer.jerk.mean.z
	body.accelerometer.jerk.std.x
	body.accelerometer.jerk.std.y
	body.accelerometer.jerk.std.z
	body.gyroscope.mean.x
	body.gyroscope.mean.y
	body.gyroscope.mean.z
	body.gyroscope.std.x
	body.gyroscope.std.y
	body.gyroscope.std.z
	body.gyroscope.jerk.mean.x
	body.gyroscope.jerk.mean.y
	body.gyroscope.jerk.mean.z
	body.gyroscope.jerk.std.x
	body.gyroscope.jerk.std.y
	body.gyroscope.jerk.std.z
	body.accelerometer.magnitude.mean
	body.accelerometer.magnitude.std
	gravity.accelerometer.magnitude.mean
	gravity.accelerometer.magnitude.std
	body.accelerometer.jerk.magnitude.mean
	body.accelerometer.jerk.magnitude.std
	body.gyroscope.magnitude.mean
	body.gyroscope.magnitude.std
	body.gyroscope.jerk.magnitude.mean
	body.gyroscope.jerk.magnitude.std
	fft.body.accelerometer.mean.x
	fft.body.accelerometer.mean.y
	fft.body.accelerometer.mean.z
	fft.body.accelerometer.std.x
	fft.body.accelerometer.std.y
	fft.body.accelerometer.std.z
	fft.body.accelerometer.mean.frequency.x
	fft.body.accelerometer.mean.frequency.y
	fft.body.accelerometer.mean.frequency.z
	fft.body.accelerometer.jerk.mean.x
	fft.body.accelerometer.jerk.mean.y
	fft.body.accelerometer.jerk.mean.z
	fft.body.accelerometer.jerk.std.x
	fft.body.accelerometer.jerk.std.y
	fft.body.accelerometer.jerk.std.z
	fft.body.accelerometer.jerk.mean.frequency.x
	fft.body.accelerometer.jerk.mean.frequency.y
	fft.body.accelerometer.jerk.mean.frequency.z
	fft.body.gyroscope.mean.x
	fft.body.gyroscope.mean.y
	fft.body.gyroscope.mean.z
	fft.body.gyroscope.std.x
	fft.body.gyroscope.std.y
	fft.body.gyroscope.std.z
	fft.body.gyroscope.mean.frequency.x
	fft.body.gyroscope.mean.frequency.y
	fft.body.gyroscope.mean.frequency.z
	fft.body.accelerometer.magnitude.mean
	fft.body.accelerometer.magnitude.std
	fft.body.accelerometer.magnitude.mean.frequency
	fft.body.accelerometer.jerk.magnitude.mean
	fft.body.accelerometer.jerk.magnitude.std
	fft.body.accelerometer.jerk.magnitude.mean.frequency
	fft.body.gyroscope.magnitude.mean
	fft.body.gyroscope.magnitude.std
	fft.body.gyroscope.magnitude.mean.frequency
	fft.body.gyroscope.jerk.magnitude.mean
	fft.body.gyroscope.jerk.magnitude.std
	fft.body.gyroscope.jerk.magnitude.mean.frequency


EXPERIMENTAL DESIGN
	30 volunteers within an age bracket of 19-48 years participated in the study. 
	Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, and laying) 
	while wearing a smartphone (Samsung Galaxy S II) on the waist. 
	Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular 
	velocity were acquired sampling at a constant rate of 50Hz. 
	The experiments were video-recorded to label the data manually. 
	The obtained dataset was randomly partitioned into two sets, 70% selected to generate training data and 30% for test data. 

	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
	and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
	The sensor acceleration signal, which has gravitational and body motion components, 
	was separated using a Butterworth low-pass filter into body acceleration and gravity. 
	The gravitational force was assumed to have only low frequency components, 
	therefore a filter with 0.3 Hz cutoff frequency was used. 
	From each window, a vector of features was obtained by calculating variables from the time and frequency domain.
	
	Subsequently, the body linear acceleration and angular velocity were 
	derived in time to obtain Jerk signals. The magnitude of these three-dimensional signals were 
	calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of the signals. 

	For each record in the dataset it is provided: 
	- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
	- Triaxial Angular velocity from the gyroscope. 
	- A 561-feature vector with time and frequency domain variables. 
	- Its activity label. 
	- An identifier of the subject who carried out the experiment.
	
	Source: 
		Human Activity Recognition Using Smartphones Data Set
		Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
		1 - Smartlab - Non-Linear Complex Systems Laboratory
		DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
		2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
		Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
		activityrecognition '@' smartlab.ws
		http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


OUTPUT DATA
	tidyData 
		This is a dataframe organized as Wide Data, is organized by subject, and then by activity. Each subject and activity represents an observation. 
		The above list of variables are columns 2 through 83. 
	
	activityData 
		This dataframe is organized slightly differently than tidyData - just prioritizing the activity over the subject. 
