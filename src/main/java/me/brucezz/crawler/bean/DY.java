package me.brucezz.crawler.bean;

public class DY {
    private int status_code;
    private String message;
    private DyUser data;

    public int getStatus_code() {
        return status_code;
    }

    public void setStatus_code(int status_code) {
        this.status_code = status_code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public DyUser getData() {
        return data;
    }

    public void setData(DyUser data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "DY{" +
                "status_code=" + status_code +
                ", message='" + message + '\'' +
                ", data=" + data +
                '}';
    }
}
