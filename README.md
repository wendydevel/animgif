# How I produce animated GIFs for my BDSMlr blog

## Invloved tools
- kdenlive for video editing - https://kdenlive.org
- ffmpeg for extracting individual frames from a video clip - http://ffmpeg.org
- ImageMagick's convert tool to compose individual images into an animated GIF - https://imagemagick.org

## From raw video to animated GIFs - Step-by-step 
1. Import the raw video to kdenlive
2. Use kedenlive to cut the video 
    - keep only the most interesting parts
    - the smaller the clip is, the faster the subsequent processing will be
3. Use kdenlive to add effects
4. Render the final clip to MP4
5. Run the shellscript animgif, which takes the newly rendered video clip and produces multiple animated GIFs
    - See below for usage
  
## Usage of animgif
animgif is a linux shellscript, which makes use of ffmpeg and ImageMagick. You need to have those packages installed if
you want to use animgif.

animgif takes three argument
1. The input file - This is the video clip rendered by kdenlive
2. The output folder - Where the animated GIFs gonna be
3. Scale - How much the animated GIFs should be scaled down, relatively to the input clip 
    - You can provide a percentage number - i.E. 45%
    - This argument helps to keep the GIFs below the maximum allowd size of 6 MiB of BDSMlr
    - I use 45%
    - You will need to tinker with the scaling to find the best tradeoff between size and quality.

Example: `animgif myclip.mp4 myclip-gifs 45%`
This command will produce GIFs from myclip.mp4 and create a myglip-gifs folder. This folder will contain the animated GIFs. 
The size of the GIFs will 45% of the input clip.
