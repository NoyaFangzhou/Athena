import audioBasicIO
import audioFeatureExtraction
import matplotlib.pyplot as plt
import numpy
print("COUNT 1\n")
[Fs1, x1] = audioBasicIO.readAudioFile("data/practice.wav");
F1 = audioFeatureExtraction.stFeatureExtraction(x1, Fs1, 0.050*Fs1, 0.025*Fs1);
# F1[12*420] MATRIX
print(len(F1[9:21]), len(F1[9:21][0]))

print("\n\nCOUNT 2\n")
[Fs2, x2] = audioBasicIO.readAudioFile("data/practice2.wav");
F2 = audioFeatureExtraction.stFeatureExtraction(x2, Fs2, 0.050*Fs2, 0.025*Fs2);

print(len(F2[9:21]), len(F2[9:21][0]))

size = min(len(F2[9:21][0]), len(F1[9:21][0]))
print(size, "\n")

print("\n\nCORRCOEF\n")
print(numpy.corrcoef(F1[9:21, 0:size], F2[9:21, 0:size])*0.5+0.5)



print("\n\nE Distance\n")
print(numpy.linalg.norm(F1[9:21, 0:size] - F2[9:21, 0:size]))