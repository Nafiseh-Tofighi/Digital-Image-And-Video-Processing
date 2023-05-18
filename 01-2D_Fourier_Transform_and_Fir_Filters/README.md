# Prob1 - Fourier Magnitude and Phase Relations

This code calculates and displays the magnitude and phase functions of the DFT (Discrete Fourier Transform) for two intensity images, 𝑥[𝑛₁,𝑛₂] and 𝑦[𝑛₁,𝑛₂]. It then computes and displays two new Fourier transforms, 𝑊[𝑘₁,𝑘₂] and 𝑍[𝑘₁,𝑘₂], and compares them to 𝑥[𝑛₁,𝑛₂]. Additionally, it defines 𝐴[𝑘₁,𝑘₂] and 𝐵[𝑘₁,𝑘₂] and computes their corresponding images, 𝑎[𝑛₁,𝑛₂] and 𝑏[𝑛₁,𝑛₂], discussing their visual representation. 
# Prob2 - Frequency Response of Filters, DFT, Circular-Linear Convolution

This code demonstrates the analysis of filters' frequency response using the Discrete Fourier Transform (DFT) and circular-linear convolution. The 1-D filter, h = (1/11)ones(11,1), is used to generate a separable 2-D filter impulse response. The frequency response of the resulting 2-D filter is plotted, and its characteristics are discussed.

Furthermore, a circularly symmetric 2-D filter impulse response is generated, and its frequency response is plotted. 

The filters are then applied to the image 𝑥[𝑛₁,𝑛₂] from Exercise 1 in the DFT domain. The steps include computing the 2D DFT of the image and the filter impulse response, multiplying them together, calculating the inverse 2D DFT of the product, and displaying the resulting image.
