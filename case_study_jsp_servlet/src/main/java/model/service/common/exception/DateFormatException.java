package model.service.common.exception;

public class DateFormatException extends Exception {
    String errorMessage;
    public DateFormatException(String message){
        errorMessage=message;
    }
    public String getString() {
        return this.errorMessage;
    }
}
