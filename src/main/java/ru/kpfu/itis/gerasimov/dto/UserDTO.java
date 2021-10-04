package ru.kpfu.itis.gerasimov.dto;

public class UserDTO {
    private String firstName;
    private String secondName;

    public UserDTO(String firstName, String secondName) {
        this.firstName = firstName;
        this.secondName = secondName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getSecondName() {
        return secondName;
    }
}
