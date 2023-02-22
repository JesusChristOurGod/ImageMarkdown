import pandas as pd

def addImageColumns(imageName, imageTypes, imageObjects, imageDetails):
    data = pd.read_csv("/Users/alexander/Desktop/ImageMarkdown/PyLogic/output.csv")
    entry = {"imageName": imageName,
             "imageTypes": imageTypes,
             "imageObjects": imageObjects,
             "imageDetails": imageDetails}
    # data = pd.Series([imageName, [imageTypes], [imageObjects], [imageDetails]])
    # frame = pd.DataFrame([data], columns=["imageName","imageTypes", "imageObjects", "imageDetails"])
    #
    # print(frame)
    # result = pd.concat([data, frame], ignore_index=True)
    data = data.append(entry, ignore_index=True)
    data.to_csv("/Users/alexander/Desktop/ImageMarkdown/PyLogic/output.csv", index=False)
# addImageColumns("zhopa", ["popa", "pipa"], ["kupa", "guka"], ["pisya", "kaka"])
