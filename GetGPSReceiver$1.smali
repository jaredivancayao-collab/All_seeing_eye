.class Lcom/sysUpdate/GetGPSReceiver$1;
.super Lcom/sysUpdate/MyLocation/LocationResult;
.source "GetGPSReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sysUpdate/GetGPSReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sysUpdate/GetGPSReceiver;


# direct methods
.method constructor <init>(Lcom/sysUpdate/GetGPSReceiver;)V
    .registers 2

    .prologue
    .line 43
    iput-object p1, p0, Lcom/sysUpdate/GetGPSReceiver$1;->this$0:Lcom/sysUpdate/GetGPSReceiver;

    invoke-direct {p0}, Lcom/sysUpdate/MyLocation/LocationResult;-><init>()V

    return-void
.end method


# virtual methods
.method public gotLocation(Landroid/location/Location;)V
    .registers 3

    .prologue
    .line 46
    iget-object v0, p0, Lcom/sysUpdate/GetGPSReceiver$1;->this$0:Lcom/sysUpdate/GetGPSReceiver;

    iput-object p1, v0, Lcom/sysUpdate/GetGPSReceiver;->location:Landroid/location/Location;

    .line 47
    return-void
.end method
