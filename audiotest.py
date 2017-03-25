from python_speech_features import mfcc
from python_speech_features import delta
from python_speech_features import logfbank

import scipy.io.wavfile as wav
import wave
import numpy

import urllib.request

def calculate_mfcc(file_name):
	(rate,sig) = wav.read(file_name)
	mfcc_feat = mfcc(sig,rate)
	# d_mfcc_feat = delta(mfcc_feat, 2)
	# fbank_feat = logfbank(sig,rate)

	print(mfcc_feat)
	return mfcc_feat



# calculate the correlatin coefficent between two arrays
def correlation_cal(array1, array2):
	cor_array = np.corrcoef(array1, array2)*0.5+0.5
	return cor_array

# download the wav file from VOICE RSS API
# then print the data from the response
def request_to_api(text, speech_rate=0, code='WAV', formate='44khz_16bit_stereo', ssml=False, b64=False):
	params = urllib.parse.urlencode(
		{
			'key': 'bf95ff8a70e34b93afdb7de02d2a230b', 
			'src': text, 
			'hl': 'en-us',
			'r': speech_rate,
			'c': code,
			'f': formate,
			'ssml': ssml,
			'b64' : b64
		})

	url = 'http://api.voicerss.org/?%s' % params
	with urllib.request.urlopen(url) as f:
		print(f.read())
		write_to_file(text+'.wav', f.read())

def write_to_file(file_name, content):
	f = wave.open(file_name, 'w')
	# num of channels, sampwidth, framerate, nframes, comptype, compname
	f.setparams((2, 2, 44100, 0, 'NONE', 'not compressed'))
	f.writeframes(content)
	f.close()

	


if __name__ == '__main__':
	request_to_api('Hello World')