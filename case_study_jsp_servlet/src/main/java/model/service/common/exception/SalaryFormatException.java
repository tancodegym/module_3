package model.service.common.exception;

public class SalaryFormatException extends Exception {
    String errorMessage;

    public SalaryFormatException(String message) {
        errorMessage = message;
    }

    public String getString() {
        return this.errorMessage;
    }
}
