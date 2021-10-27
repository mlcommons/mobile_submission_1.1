import argparse
import os
import sys
import shutil


def create_calibration_set(images_dir, annotations_dir, cal_list_file):

    cal_images_dest_dir = os.path.join(os.path.dirname(images_dir),"calibration")
    ann_images_dest_dir = os.path.join(os.path.dirname(annotations_dir), "calibration")
    
    os.makedirs(cal_images_dest_dir, exist_ok=True)
    os.makedirs(ann_images_dest_dir, exist_ok=True)
    
    with open(cal_list_file,'r') as fid:
        cal_images = fid.read().splitlines()
    
    for img_name in cal_images:
        img_pth = os.path.join(images_dir, img_name)
        if not os.path.isfile(img_pth):
            print("Unable to locate {}".format(img_path))
            continue
               
        ann_name = img_name.split('.')[0]+'.png'
        ann_pth = os.path.join(annotations_dir, ann_name)
        if not os.path.isfile(ann_pth):
            print("Unable to locate annotation file {}".format(ann_pth))
            continue
        
        img_dest = os.path.join(cal_images_dest_dir, img_name)
        ann_dest = os.path.join(ann_images_dest_dir, ann_name)
        
        shutil.copyfile(img_pth, img_dest)
        shutil.copyfile(ann_pth, ann_dest)

def get_args():
    """Parse commandline."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--ade20k-images-dir", required=True, help="path to ADE20K train images directory")
    parser.add_argument("--ade20k-annotations-dir", required=True, help="path to ADE20K train annotations directory")
    parser.add_argument("--ade20k-cal-list", required=True, help="path to ADE20K calibration list file")

    args = parser.parse_args()
    return args

def main():
    
    args = get_args()
    if not os.path.isdir(args.ade20k_annotations_dir):
        print("Path to annotations directory {} not found. Please double-check".format(args.ade20k_annotations_dir))
        sys.exit(1)
        
    if not os.path.isdir(args.ade20k_images_dir):
        print("Path to ADE20K train images directory {} not found. Please double-check".format(args.ade20k_images_dir))
        sys.exit(1)

    if not os.path.isfile(args.ade20k_cal_list):
        print("ADE20K calibration list file {} not found. Please double-check".format(args.ade20k_cal_list))
        sys.exit(1)

    images_dir = args.ade20k_images_dir
    annotations_dir = args.ade20k_annotations_dir
    calibration_list_file = args.ade20k_cal_list

    create_calibration_set(images_dir, annotations_dir, calibration_list_file)
    
if __name__=="__main__":
    main()