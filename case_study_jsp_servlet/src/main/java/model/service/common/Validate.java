package model.service.common;

import model.service.common.exception.AgeFormatException;
import model.service.common.exception.DateFormatException;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Validate {
    private static final String DATE_REGEX = "([\\d]{4})(\\-)+((0+[1-9]{1})|(1+[0-2]{1}))+(\\-)+(([1-2]{1}+[\\d]{1})|(0+[1-9]{1})|(3+[0-1]))";

    public static String validateName(String name) {
        String regex = "([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        String message = null;
        if (name.matches(regex)) {
            return message;
        }
        return message="Wrong Name Format !";
    }
    public static String validateAddress(String address) {
        String regex = "([\\p{Lu}][\\p{Ll}]{1,8})(\\s([\\p{Lu}]|[\\p{Lu}][\\p{Ll}]{1,10})){0,5}$";
        String message = null;
        if (address.matches(regex)) {
            return message;
        }
        return message="Wrong Address Format !";
    }

    public static String validateNumber(String number) {
        String regex = "^\\d+$";
        String message = null;
        if (number.matches(regex)) {
            return message;
        }
        return message="Wrong Number Format !";
    }

    public static String validateNumberPhone(String numberPhone) {
        final String NUMBER_PHONE_REGEX = "((090)(\\d){7})|((091)(\\d){7})|((84)\\+90(\\d){7})|((84)\\+91(\\d){7})";
        String message = null;
        if (numberPhone.matches(NUMBER_PHONE_REGEX)) {
            return message;
        } else {
            return message = "Please enter again, wrong number phone format  !";
        }
    }

    public static String validateIdCard(String idCard) {
        final String ID_CARD_REGEX = "(\\d{9})|(\\d){12}";
        String message = null;
        if (idCard.matches(ID_CARD_REGEX)) {
            return message;}
        else{
            return message= "Please enter again, id card is 9 or 12 digit string !";
        }
    }

    public static String validateEmail(String email) {
        final String EMAIL_REGEX = "^[A-z]{1}((\\w)*[.]?(\\w)*|(\\w)*[-]?(\\w)*)@[a-z0-9]+([.][a-z]{2,3}){1,5}";
        String message = null;
        if (email.matches(EMAIL_REGEX)) {
            return message;
        } else {
            return message = "Please enter again, wrong email format !";
        }
    }


    public static String validateDate(String date) {
        String message =null;
        try {
            if (!date.matches(DATE_REGEX)) {
                throw new DateFormatException("Wrong format, please enter again.");
            }
        } catch (DateFormatException e) {
            return message="Wrong Format Date !";
        }
        return message;
    }


    public static String validateDateOfBirth(String dateOfBirth) {
        String message = null ;
        try {
            if (!dateOfBirth.matches(DATE_REGEX)) {
                throw new DateFormatException("Wrong format, please enter again.");
            }
        } catch (DateFormatException e) {
            System.err.println(e.getString() + "(dd/mm/yyyy)");
              return message="Wrong Format Date !";
        }

        //Tính số ngày từ ngày sinh đến hiện tại :
        String[] arrayDate = dateOfBirth.split("-");
        int day = Integer.parseInt(arrayDate[2]);
        int month = Integer.parseInt(arrayDate[1]);
        int year = Integer.parseInt(arrayDate[0]);
        DateFormat simpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        Date currentDate = new Date();
        Date date1;
        Date date2;
        long getDayDiff = 0;
        try {
            String startDate = "" + day + "-" + month + "-" + year;
            String endDate = simpleDateFormat.format(currentDate);
            date1 = simpleDateFormat.parse(startDate);
            date2 = simpleDateFormat.parse(endDate);
            long getDiff = date2.getTime() - date1.getTime();

            getDayDiff = getDiff / (24 * 60 * 60 * 1000);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        boolean checkDateMin = getDayDiff / 365 < 18;
        boolean checkDateMax = getDayDiff / 365 > 100;
        try {
            if (checkDateMax) {
                throw new AgeFormatException("Age must be less than 100, please enter again !");
            }
        } catch (AgeFormatException e) {
            return message="Age must be less than 100!";
        }
        try {
            if (checkDateMin) {
                throw new AgeFormatException("Age must be greater than 18, please enter again !");
            }
        } catch (AgeFormatException e) {
            return message="Age must be greater than 18 !";
        }
        return message;
    }

    public static String validateArea(int area) {
        String message = null;
        if (area > 0) {
            return message;
        } else {
            return message= "Please enter area again, area  must be greater than 0";
        }
    }
    public static String validateCost(double cost) {
        String message = null;
        if (cost > 0) {
            return message;
        } else {
            return message= "Please enter again, cost  must be greater than 0";
        }
    }
    public static String validateDeposit(double deposit) {
        String message = null;
        if (deposit > 0) {
            return message;
        } else {
            return message= "Please enter again, deposit  must be greater than 0";
        }
    }
    public static String validateMaxPeople(int maxPeople) {
        String message = null;
        if (maxPeople > 0) {
            return message;
        } else {
            return message= "Please enter again, number of max people  must be greater than 0";
        }
    }
    public static String validateNumberOfFloors(int number) {
        String message = null;
        if (number > 0) {
            return message;
        } else {
            return message= "Please enter again, number of floor must be greater than 0";
        }
    }
    public static String validateSalary(double salary) {
        String message = null;
        if (salary > 0) {
            return message;
        } else {
            return message= "Please enter again, salary must be greater than 0";
        }
    }
    public static String validatePoolArea(double poolArea) {
        String message = null;
        if (poolArea > 0) {
            return message;
        } else {
            return message= "Please enter again, area of pool must be greater than 0";
        }
    }

}
//    public static boolean validateCustomerId(String customerId) {
//        final String CUSTOMER_ID_REGEX = "KH-[\\d]{4}";
//
//        if (customerId.matches(CUSTOMER_ID_REGEX)) {
//            return true;
//        } else {
//            System.err.println("Please enter again, wrong text format !");
//            return false;
//        }
//
//    }
//
//    public static boolean validateServiceId(String serviceId) {
//        final String SERVICE_ID_REGEX = "DV-[\\d]{4}";
//
//        if (serviceId.matches(SERVICE_ID_REGEX)) {
//            return true;
//        } else {
//            System.err.println("Please enter again, wrong text format !");
//            return false;
//        }
//
//    }
//        if (salary > 0) {
//            return true;
//        } else {
//            System.err.println("Please enter salary again, salary must be greater than zero !");
//            return false;
//        }


//    public static boolean validateGender(String gender) {
//        if (gender == "Male" || gender == "Female") {
//            return true;
//        } else {
//            System.err.println("Please enter gender again, gender is 'Male' or 'Female' !");
//            return false;
//        }
//    }

//    }




