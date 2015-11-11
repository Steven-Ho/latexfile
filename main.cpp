//
//  main.cpp
//  OpenCV-test
//
//  Created by StevenHo on 15/10/13.
//  Copyright © 2015年 StevenHo. All rights reserved.
//

#include <iostream>
#include <highgui.h>
#include <cv.h>

using namespace std;

float trans(float x);

const int img_max = 255;

int main(int argc, const char * argv[]) {
    // insert code here...
    IplImage* img = cvLoadImage("/Users/stevenho/Desktop/lena.jpg");
    cvNamedWindow("image0");
    cvShowImage("imgae0", img);
    
    int height = img->height;
    int width = img->width;

    for (int i=0; i<width; i++)
        for (int j=0; j<height; j++){
            CvScalar s = cvGet2D(img, i, j);
            for (int k=0; k<3; k++){
                s.val[k] = (trans(s.val[k]) > 255) ? 255 : (trans(s.val[k]));
            }
            cvSet2D(img, i, j, s);
        }
    
    cvNamedWindow("image1");
    cvShowImage("imgae1", img);
    
    cvWaitKey(0);
    
    cvSaveImage("/Users/stevenho/Desktop/lena_light.jpg", img);
    
    cvDestroyAllWindows();
    cvReleaseImage(&img);
    
    return 0;
}

float trans(float x){
    x = x / img_max;
    return sqrtf(x)*img_max;
}
