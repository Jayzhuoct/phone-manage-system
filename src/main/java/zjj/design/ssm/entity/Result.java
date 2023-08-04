package zjj.design.ssm.entity;

import java.io.Serializable;

public class Result<T> implements Serializable {
    //标识是否成功操作
    private boolean success;
    //需要传递的信息
    private String message;
    //需要传递的数据
    private T data;

    public Result() {
    }

    public Result(boolean success, String message) {
        this.success=success;
        this.message = message;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
