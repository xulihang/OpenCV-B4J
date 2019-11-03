B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.8
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private Imgproc As JavaObject
	Private Imgcodecs As JavaObject
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize
	Imgproc.InitializeStatic("org.opencv.imgproc.Imgproc")
	Imgcodecs.InitializeStatic("org.opencv.imgcodecs.Imgcodecs")
End Sub

Public Sub imread(path As String) As cvMat
	Return matJO2mat(Imgcodecs.RunMethodJO("imread",Array(path)))
End Sub

Public Sub imwrite(path As String,img As cvMat)
	Imgcodecs.RunMethod("imwrite",Array(path,img.JO))
End Sub

Public Sub medianBlur(src As cvMat,dst As cvMat, ksize As Int)
	Imgproc.RunMethodJO("medianBlur",Array(src.JO,dst.JO,ksize))
End Sub

Public Sub threshold(src As cvMat,dst As cvMat,thresh As Double,maxVal As Double,threshType As Int) As Double
	Return Imgproc.RunMethod("threshold",Array(src.JO,dst.JO,thresh,maxVal,threshType))
End Sub

Public Sub connectedComponentsWithStats(image As cvMat,labels As cvMat,stats As cvMat,centroids As cvMat,connectivity As Int, ltype As Int) As Int
	Return Imgproc.RunMethod("connectedComponentsWithStats",Array(image.JO,labels.JO,stats.JO,centroids.JO,connectivity,ltype))
End Sub

Public Sub cvtColor(src As cvMat,dst As cvMat,mode As Object)
	Dim modeInt As Int=0
	If GetType(mode)="java.lang.String" Then
		modeInt=procEnum(mode)
	Else if GetType(mode)="java.lang.Integer" Then
		modeInt=mode
	End If
	Imgproc.RunMethodJO("cvtColor",Array(src.JO,dst.JO,modeInt))
End Sub

'mode example: COLOR_BGR2GRAY 
Public Sub procEnum(mode As String) As Int
	Return Imgproc.GetField(mode)
End Sub

Public Sub cvType(typeStr As String) As Int
	Dim cvt As JavaObject
	cvt.InitializeStatic("org.opencv.core.CvType")
	Return cvt.GetField(typeStr)
End Sub

Sub matJO2mat(jo As JavaObject) As cvMat
	Dim mat As cvMat
	mat.Initialize(Null)
	mat.JO=jo
	Return mat
End Sub