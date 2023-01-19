# Development-of-Deep-Learning-Based-Models
Development of Deep Learning Based Models for COVID-19 Detection from X-ray Images
Çalışmada Kullanılan Veri Setlerinin Linki Sırasıyla (The data set used in the study):
1. Veri Seti: https://github.com/ieee8023/covid-chestxray-dataset
2. Veri Seti: https://www.kaggle.com/datasets/unaissait/curated-chest-xray-image-dataset-for-covid19
3. Veri Seti: https://www.kaggle.com/datasets/tawsifurrahman/covid19-radiography-database
4. Veri Seti: https://www.kaggle.com/datasets/darshan1504/covid19-detection-xray-dataset
5. Veri Seti: https://www.kaggle.com/datasets/ahemateja19bec1025/covid-xray-dataset

Step_1 file  : 1. Aşama olan Transfer Learning işlemi yapılmış olup Feature extraction (Öznitelik Çıkarımı) yapılmıştır . 
Kod dizininde bulunan “SqueezeNet” mimarisi kullanılmış olandır.
Ancak diğer mimarilerde de benzer kod dizini olup kullanılan mimarilerin özelliklerine göre değiştirilmesi gerekmektedir. (Feature extraction with Squeezenet)

Step_2 file  : 2. Aşama olan “NCA” kullanılarak öznitelik seçimi yapılmıştır. (Feature Selection with NCA)
Ancak diğer mimarilerde de benzer kod dizini olup kullanılan mimarinin “öznitelik çıkarımı” alınmalıdır.

Step_3 file  : Sınıflandırma algoritmaları vardır. Ancak öncesinde "kappa"ve "calculatemetrics" fonksiyonları tanımlanmalıdır. (Classification with SVM, Naive Bayes, KNN)

Bu çalışma bir çok derin evrişimli sinir ağları ile denenmiş olup genel olarak en iyi sonuçlar SqueezeNet ve SVM konbinasyonu ile sağlanmıştır. (The best results in the study were obtained with SqueezeNet and SVM.)
