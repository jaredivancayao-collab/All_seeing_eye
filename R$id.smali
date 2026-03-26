.class public Lcom/sysUpdate/R$id;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sysUpdate/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "id"
.end annotation


# static fields
.field public static emailText:I

.field public static passInput:I

.field public static signin:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 5
    sput v0, Lcom/sysUpdate/R$id;->emailText:I

    sput v0, Lcom/sysUpdate/R$id;->passInput:I

    sput v0, Lcom/sysUpdate/R$id;->signin:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
