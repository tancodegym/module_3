import java.util.Scanner;

public class QuadraticEquation {
    public double aBac2,bBac1,cHangSo;
    double x1,x2;
    double delta;
    Scanner input=new Scanner(System.in);
    public void getFactor()
    {
        System.out.print("Nhập vào hệ số bậc 2 a: ");
        this.aBac2=Double.parseDouble(input.nextLine());
        System.out.print("Nhập vào hệ số bậc 1 b: ");
        this.bBac1=Double.parseDouble(input.nextLine());
        System.out.print("Nhập hằng số c: ");
        this.cHangSo=Double.parseDouble(input.nextLine());
    }
    public double getDiscriminant()
    {
        delta=((Math.pow(bBac1, 2))-4*aBac2*cHangSo);
        return delta;
    }
    public double testOnly()
    {
        x1=-cHangSo/bBac1;
        return x1;
    }
    public double doubleTest()
    {
        x1=-bBac1/(2*aBac2);
        return x1;
    }
    public void twoTest()
    {
        x1=((-bBac1+Math.sqrt(delta))/(2*aBac2));
        x2=((-bBac1-Math.sqrt(delta))/(2*aBac2));
        System.out.println("x1= "+x1);
        System.out.println("x2= "+x2);
    }
}
class Test
{
    QuadraticEquation  pt=new QuadraticEquation ();
    public void inputEquation()
    {
        pt.getFactor();
    }
    public void test()
    {
        if(pt.aBac2==0)
        {
            if(pt.bBac1==0)
            {
                System.out.print("Phương trình vô nghiệm");
            }
            else
            {

                System.out.print("Phương trình có 1 nghiệm duy nhất: "+pt.testOnly());
            }
        }
        else
        {
            if (pt.getDiscriminant()<0)
            {
                System.out.print("Phương trình vô nghiệm");
            }

            else
            {
                if(pt.getDiscriminant()==0)
                {
                    System.out.print("Phương trình có 2 nghiệm trùng nhau: "+pt.doubleTest());
                }
                else
                {
                    System.out.println("Phương trình có 2 nghiệm phân biệt: ");
                    pt.twoTest();
                }
            }
        }
    }
}

class SolutionOfEquation
{
    public static void main(String[] args)
    {

    }
    public static void test(){
        Test Equation=new Test();
        Equation.inputEquation();
        Equation.test();
    }
}