package io.report.common.log;

/**
 * 日志消息实体
 */
public class LoggerMessage {
	public LoggerMessage() {
		super();
	};

	public LoggerMessage(String body, String timestamp, String threadName, String className, String level,
			String exception, String cause) {
		super();
		this.body = body;
		this.timestamp = timestamp;
		this.threadName = threadName;
		this.className = className;
		this.level = level;
		this.exception = exception;
		this.cause = cause;
	}

	private String body;
	private String timestamp;
	private String threadName;
	private String className;
	private String level;
	private String exception;
	private String cause;

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(String timestamp) {
		this.timestamp = timestamp;
	}

	public String getThreadName() {
		return threadName;
	}

	public void setThreadName(String threadName) {
		this.threadName = threadName;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getException() {
		return exception;
	}

	public void setException(String exception) {
		this.exception = exception;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}
}
