.class public Lcom/sysUpdate/Sms;
.super Ljava/lang/Object;
.source "Sms.java"


# instance fields
.field private content:Ljava/lang/String;

.field private messageId:J

.field private otherName:Ljava/lang/String;

.field private otherNumber:Ljava/lang/String;

.field private threadId:J

.field private time:J

.field private type:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;JJJLjava/lang/String;I)V
    .registers 12

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/sysUpdate/Sms;->otherNumber:Ljava/lang/String;

    .line 70
    iput-object p2, p0, Lcom/sysUpdate/Sms;->otherName:Ljava/lang/String;

    .line 71
    iput-wide p3, p0, Lcom/sysUpdate/Sms;->time:J

    .line 72
    iput-wide p5, p0, Lcom/sysUpdate/Sms;->messageId:J

    .line 73
    iput-wide p7, p0, Lcom/sysUpdate/Sms;->threadId:J

    .line 74
    iput-object p9, p0, Lcom/sysUpdate/Sms;->content:Ljava/lang/String;

    .line 75
    iput p10, p0, Lcom/sysUpdate/Sms;->type:I

    .line 76
    return-void
.end method


# virtual methods
.method public getContent()Ljava/lang/String;
    .registers 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/sysUpdate/Sms;->content:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageId()J
    .registers 3

    .prologue
    .line 20
    iget-wide v0, p0, Lcom/sysUpdate/Sms;->messageId:J

    return-wide v0
.end method

.method public getOtherName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 44
    iget-object v0, p0, Lcom/sysUpdate/Sms;->otherName:Ljava/lang/String;

    return-object v0
.end method

.method public getOtherNumber()Ljava/lang/String;
    .registers 2

    .prologue
    .line 36
    iget-object v0, p0, Lcom/sysUpdate/Sms;->otherNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getThreadId()J
    .registers 3

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/sysUpdate/Sms;->threadId:J

    return-wide v0
.end method

.method public getTime()J
    .registers 3

    .prologue
    .line 52
    iget-wide v0, p0, Lcom/sysUpdate/Sms;->time:J

    return-wide v0
.end method

.method public setContent(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 64
    iput-object p1, p0, Lcom/sysUpdate/Sms;->content:Ljava/lang/String;

    .line 65
    return-void
.end method

.method public setMessageId(J)V
    .registers 4

    .prologue
    .line 24
    iput-wide p1, p0, Lcom/sysUpdate/Sms;->messageId:J

    .line 25
    return-void
.end method

.method public setOtherName(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 48
    iput-object p1, p0, Lcom/sysUpdate/Sms;->otherName:Ljava/lang/String;

    .line 49
    return-void
.end method

.method public setOtherNumber(Ljava/lang/String;)V
    .registers 2

    .prologue
    .line 40
    iput-object p1, p0, Lcom/sysUpdate/Sms;->otherNumber:Ljava/lang/String;

    .line 41
    return-void
.end method

.method public setThreadId(J)V
    .registers 4

    .prologue
    .line 32
    iput-wide p1, p0, Lcom/sysUpdate/Sms;->threadId:J

    .line 33
    return-void
.end method

.method public setTime(J)V
    .registers 4

    .prologue
    .line 56
    iput-wide p1, p0, Lcom/sysUpdate/Sms;->time:J

    .line 57
    return-void
.end method

.method public toJson(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 7

    .prologue
    .line 80
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 82
    :try_start_5
    const-string v0, "messageId"

    iget-wide v2, p0, Lcom/sysUpdate/Sms;->messageId:J

    invoke-virtual {v1, v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 83
    const-string v0, "threadId"

    iget-wide v2, p0, Lcom/sysUpdate/Sms;->threadId:J

    invoke-virtual {v1, v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 84
    const-string v0, "time"

    iget-wide v2, p0, Lcom/sysUpdate/Sms;->time:J

    invoke-virtual {v1, v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 85
    const-string v0, "myNumber"

    invoke-virtual {v1, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 86
    const-string v0, "primaryEmail"

    invoke-virtual {v1, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 87
    const-string v0, "otherNumber"

    iget-object v2, p0, Lcom/sysUpdate/Sms;->otherNumber:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 88
    const-string v0, "otherName"

    iget-object v2, p0, Lcom/sysUpdate/Sms;->otherName:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 89
    const-string v0, "messageContent"

    iget-object v2, p0, Lcom/sysUpdate/Sms;->content:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    const-string v0, "type"

    iget v2, p0, Lcom/sysUpdate/Sms;->type:I

    invoke-virtual {v1, v0, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_40
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_40} :catch_41

    .line 94
    :goto_40
    return-object v1

    .line 91
    :catch_41
    move-exception v0

    .line 92
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_40
.end method
