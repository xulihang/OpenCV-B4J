B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.8
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Private matJO As JavaObject
End Sub

'Initializes the object. You can add parameters to this method if needed.
Public Sub Initialize(params() As Object)
	matJO.InitializeNewInstance("org.opencv.core.Mat",params)
End Sub

Public Sub getJO As JavaObject
	Return matJO
End Sub

Public Sub setJO(mat As JavaObject)
	matJO=mat
End Sub

Public Sub clone As cvMat
	Return matJO2mat(matJO.RunMethodJO("clone",Null))
End Sub

Sub matJO2mat(jo As JavaObject) As cvMat
	Dim cv2 As opencv
	cv2.Initialize
	Dim mat As cvMat
	mat.Initialize(Null)
	mat.JO=jo
	Return mat
End Sub

Sub Size As JavaObject
	Return matJO.RunMethodJO("size",Null)
End Sub

Sub Cols As Int
	Return matJO.RunMethod("cols",Null)
End Sub

Sub Rows As Int
	Return matJO.RunMethod("rows",Null)
End Sub