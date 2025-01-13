Return-Path: <linux-input+bounces-9208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CE9A0C471
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 23:14:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67F123A5FD5
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 22:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 400CD1F12EC;
	Mon, 13 Jan 2025 22:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QhKEcnbB"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B45C1CB51F;
	Mon, 13 Jan 2025 22:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736806440; cv=none; b=ZYKt6Sv7LrDSJ+rvtUi9N+B7QNJ+0a9vmt29d0nXM92xUhdLnamoLKNpoO/QDEugfJKUUf8fKn0rz73JNZS7Nffx1iRHEaZquE9FWZtrlfsBu3f03rrOjuUDNLGlUdKsAjRfp9NiZZ1M0y3tLatw1YpV4dVULPtkpqxVqvmfamc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736806440; c=relaxed/simple;
	bh=oliZNI3+eheoPZtlQyfHIM0GS3nDnKkWBBbmAH9Q5yE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=YuFYF4TXWFZ7delXSUIYcbqqtr9LuPHhoUNkr6XES0S9Pim3gnCU+kptPoIkToDd5Xx+J9ziD6spV0MqXBSWiNz+5LpbdC3Vs892eivIAjWYMecfa+nFJtGV3DA/CRbrKWmWIaTjDiSlAIkhz+zqr4E6z7ZX7sshsIs269hxcQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QhKEcnbB; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736806404; x=1737411204; i=w_armin@gmx.de;
	bh=9RlzvtGpg6mgvHkHAHhgMpENVBVP80sF2GEwV15zLSs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QhKEcnbBBUVfpKtth1q3A+dnG5l9hWVdPIbZk1YlrhbDuFSH7fcYbWu+Ud5B6hkk
	 /uu8URCIPqFDSkMiGBwbq4xMvmc6kBY92PMrsQ5wWldpLxdwlX5ylJQnoBwcQGC4R
	 wzMIRDz6YUp5D8/PCAIFWUPeQeQcekeKYlWhoP1cwEHUPz/zfS7R8dizTHCuxixRu
	 kUGghU8xL9Plih1SVRaXQpRrQejR4cleF1jYL5Xs/RzJWa508AGOSF54HlBhuR90O
	 tOp8/xIsWVpraS5tEWaZwW5od6BKRFMmnJhe5tlQfgN/XYPovpmVxM50vi8mD0syR
	 OHpFpgu5ZbnX0t5Rhg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.230.110]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mel3t-1swl1N1BtF-00ZOrD; Mon, 13 Jan 2025 23:13:24 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: dmitry.torokhov@gmail.com,
	o2g.org.ru@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	mjg59@srcf.ucam.org,
	pali@kernel.org,
	eric.piel@tremplin-utc.net,
	jlee@suse.com,
	kenneth.t.chan@gmail.com,
	coproscefalo@gmail.com,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	josh@joshuagrisham.com
Subject: [PATCH v3] Input: i8042 - Add support for platform filter contexts
Date: Mon, 13 Jan 2025 23:13:14 +0100
Message-Id: <20250113221314.435812-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xStTKEd5Vo7lWfMdDOxITHM8MeXZPfeqh/1WNkP8KGA/X5DEmrN
 R6Kd1kjqFLYihbSR3gWcGjxdKDgy1BCMn719eP+etYjA5Uh/OlB99X9Jd8ZbfZYzEixbwX6
 HhNE77MAHwHjsne+T5235Y6MYDMslSICmVJaFvThV+SFqS1kukaFVNk4hOKSXqpx9MgPmoH
 eoe6c9rfF4zNouAsROMTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:uiqMwUfadPQ=;xO/pmcInDbUtKRl2FjQiZkDBszp
 xhrc7tayaOaaYEzRbkAsHhD4y9PQuE7nrtwsS1tgFbiQ/G2W5SHJ81LhbJ+Kmi0A0C8vK/OYx
 t2WxzkD+Vak5d6iVZmmWTaRAPdPzQ5IVtORl9mRv7c18SviF0l9DOhmAn73Dg/2f7W1Z0mSXO
 eEK2u11/axubqSJ5+HL//qZB1bd5BbQUlkxFygr6oowLxS+8F2+4WsIKAs5onhkcd2xgP8w8+
 c3v77eWpVJiLlzF2KbUh6r8nN6IwCPsDkltEBo1IjsNFxCfCj4LxsT7SrCkc3MKD9E5pNucr0
 uXYNVA/mrNw5XDnEnPDkGwmgLTB7XgRwYEu7gvFTvT7LnIbwPZ6GpMfkXzerwjRmtNqNjKaW4
 xkvFbRqWYqkUF5aL9oz5mUd1mR36KfHzcgmJ8wizm2dN5bp9LADYdaXk3/NJZ9XuIc3w43kN6
 04C2Npeq7JiiCHUaUjzFQMDZhXaghSSUqPi9InCyOK/ygYRA5aNcEtBsSVVVJkuaTJ5EfJQgR
 EvJdu7xAHPO8k8haDlkFcsqtAKFWHwbB+Et6UqDt4ubH+CqZKBaxNq1QQPNR28peH2S8IMsuD
 zotPJyF1dv1uVvfdGahNbnxgizN1daCqBgBC23vQIepHHHD+vcbml8FyDpK9T+aAykbNF+ZAJ
 KkzDLusYay43w9rVn/IDEWgleAYMsosfCDUhzc42XqKQ9LEdja9ksVQY+ovyw7p5AwQyR5It1
 7vZJdQ6M6jdw3bBS8KU9wSTwzXVqwnWJXNxxeKevvtPappPPNXeIK5SiVbZuijoks1axrwwDJ
 7rCfPCuYtbj8ojV4tcpPZiQ6Op8YrwzsuSjlGFbXojbQflQBlvLLSqbG9rLuk1oCf3hosV2n0
 kIdI/cpQP0ydUXyICKdADhJ9+TpjiRjaw7tIejMlgCjm6lI8V1S+49v7tcnQoLtEXsgUmftjM
 C+5JuSYyinzPAE6R24NxPfAOErYEgfBPtSOG1EYgilyxpmIOug9qGB1qjHmrIlyMfvWaBTQPO
 lzEImVp+QDYpx591sufgii08D53WmhxeSmHoULu/m+ej7Um0cndmkx43AppVLqb0keFrlBt/L
 /MEvXQ1jD3HGSxPCQsKHurqeglU3DG

Currently the platform filter cannot access any driver-specific state
which forces drivers installing a i8042 filter to have at least some
kind of global pointer for their filter.

Allow callers of i8042_install_filter() to submit a context pointer
which is then passed to the i8042 filter. This frees drivers from the
responsibility of having to manage this global pointer themself.

Also introduce a separate type for the i8042 filter (i8042_filter_t)
so that the function definitions can stay compact.

Tested on a Dell Inspiron 3505.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v2:
- reword commit message

Changes since v1:
- add kerneldoc for new typedef
- add Reviewed-by tag
=2D--
 drivers/input/misc/ideapad_slidebar.c   |  4 ++--
 drivers/input/serio/i8042.c             | 17 ++++++++-------
 drivers/platform/x86/asus-nb-wmi.c      |  3 ++-
 drivers/platform/x86/asus-wmi.c         |  2 +-
 drivers/platform/x86/asus-wmi.h         |  3 +--
 drivers/platform/x86/dell/dell-laptop.c |  6 +++---
 drivers/platform/x86/hp/hp_accel.c      |  4 ++--
 drivers/platform/x86/msi-laptop.c       |  6 +++---
 drivers/platform/x86/panasonic-laptop.c |  4 ++--
 drivers/platform/x86/toshiba_acpi.c     |  4 ++--
 include/linux/i8042.h                   | 28 ++++++++++++++++++-------
 11 files changed, 48 insertions(+), 33 deletions(-)

diff --git a/drivers/input/misc/ideapad_slidebar.c b/drivers/input/misc/id=
eapad_slidebar.c
index f6e5fc807b4d..ab2e0a401904 100644
=2D-- a/drivers/input/misc/ideapad_slidebar.c
+++ b/drivers/input/misc/ideapad_slidebar.c
@@ -121,7 +121,7 @@ static void slidebar_mode_set(u8 mode)
 }

 static bool slidebar_i8042_filter(unsigned char data, unsigned char str,
-				  struct serio *port)
+				  struct serio *port, void *context)
 {
 	static bool extended =3D false;

@@ -219,7 +219,7 @@ static int __init ideapad_probe(struct platform_device=
* pdev)
 	input_set_capability(slidebar_input_dev, EV_ABS, ABS_X);
 	input_set_abs_params(slidebar_input_dev, ABS_X, 0, 0xff, 0, 0);

-	err =3D i8042_install_filter(slidebar_i8042_filter);
+	err =3D i8042_install_filter(slidebar_i8042_filter, NULL);
 	if (err) {
 		dev_err(&pdev->dev,
 			"Failed to install i8042 filter: %d\n", err);
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 509330a27880..cab5a4c5baf5 100644
=2D-- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -179,8 +179,8 @@ static struct platform_device *i8042_platform_device;
 static struct notifier_block i8042_kbd_bind_notifier_block;

 static bool i8042_handle_data(int irq);
-static bool (*i8042_platform_filter)(unsigned char data, unsigned char st=
r,
-				     struct serio *serio);
+static i8042_filter_t i8042_platform_filter;
+static void *i8042_platform_filter_context;

 void i8042_lock_chip(void)
 {
@@ -194,8 +194,7 @@ void i8042_unlock_chip(void)
 }
 EXPORT_SYMBOL(i8042_unlock_chip);

-int i8042_install_filter(bool (*filter)(unsigned char data, unsigned char=
 str,
-					struct serio *serio))
+int i8042_install_filter(i8042_filter_t filter, void *context)
 {
 	guard(spinlock_irqsave)(&i8042_lock);

@@ -203,12 +202,12 @@ int i8042_install_filter(bool (*filter)(unsigned cha=
r data, unsigned char str,
 		return -EBUSY;

 	i8042_platform_filter =3D filter;
+	i8042_platform_filter_context =3D context;
 	return 0;
 }
 EXPORT_SYMBOL(i8042_install_filter);

-int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned char =
str,
-				       struct serio *port))
+int i8042_remove_filter(i8042_filter_t filter)
 {
 	guard(spinlock_irqsave)(&i8042_lock);

@@ -216,6 +215,7 @@ int i8042_remove_filter(bool (*filter)(unsigned char d=
ata, unsigned char str,
 		return -EINVAL;

 	i8042_platform_filter =3D NULL;
+	i8042_platform_filter_context =3D NULL;
 	return 0;
 }
 EXPORT_SYMBOL(i8042_remove_filter);
@@ -480,7 +480,10 @@ static bool i8042_filter(unsigned char data, unsigned=
 char str,
 		}
 	}

-	if (i8042_platform_filter && i8042_platform_filter(data, str, serio)) {
+	if (!i8042_platform_filter)
+		return false;
+
+	if (i8042_platform_filter(data, str, serio, i8042_platform_filter_contex=
t)) {
 		dbg("Filtered out by platform filter\n");
 		return true;
 	}
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asu=
s-nb-wmi.c
index ef04d396f61c..a3d4b98045f8 100644
=2D-- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -50,7 +50,8 @@ MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1=
:auto 0:disable 1:kbd-do
 static struct quirk_entry *quirks;
 static bool atkbd_reports_vol_keys;

-static bool asus_i8042_filter(unsigned char data, unsigned char str, stru=
ct serio *port)
+static bool asus_i8042_filter(unsigned char data, unsigned char str, stru=
ct serio *port,
+			      void *context)
 {
 	static bool extended_e0;
 	static bool extended_e1;
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-w=
mi.c
index fdeebab96fc0..6c674de60ec0 100644
=2D-- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4824,7 +4824,7 @@ static int asus_wmi_add(struct platform_device *pdev=
)
 	}

 	if (asus->driver->i8042_filter) {
-		err =3D i8042_install_filter(asus->driver->i8042_filter);
+		err =3D i8042_install_filter(asus->driver->i8042_filter, NULL);
 		if (err)
 			pr_warn("Unable to install key filter - %d\n", err);
 	}
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-w=
mi.h
index d02f15fd3482..018dfde4025e 100644
=2D-- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -73,8 +73,7 @@ struct asus_wmi_driver {
 	void (*key_filter) (struct asus_wmi_driver *driver, int *code,
 			    unsigned int *value, bool *autorelease);
 	/* Optional standard i8042 filter */
-	bool (*i8042_filter)(unsigned char data, unsigned char str,
-			     struct serio *serio);
+	i8042_filter_t		i8042_filter;

 	int (*probe) (struct platform_device *device);
 	void (*detect_quirks) (struct asus_wmi_driver *driver);
diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x8=
6/dell/dell-laptop.c
index 5671bd0deee7..58b860b88fff 100644
=2D-- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -725,8 +725,8 @@ static void dell_update_rfkill(struct work_struct *ign=
ored)
 }
 static DECLARE_DELAYED_WORK(dell_rfkill_work, dell_update_rfkill);

-static bool dell_laptop_i8042_filter(unsigned char data, unsigned char st=
r,
-			      struct serio *port)
+static bool dell_laptop_i8042_filter(unsigned char data, unsigned char st=
r, struct serio *port,
+				     void *context)
 {
 	static bool extended;

@@ -884,7 +884,7 @@ static int __init dell_setup_rfkill(void)
 		pr_warn("Unable to register dell rbtn notifier\n");
 		goto err_filter;
 	} else {
-		ret =3D i8042_install_filter(dell_laptop_i8042_filter);
+		ret =3D i8042_install_filter(dell_laptop_i8042_filter, NULL);
 		if (ret) {
 			pr_warn("Unable to install key filter\n");
 			goto err_filter;
diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/=
hp_accel.c
index 39a6530f5072..10d5af18d639 100644
=2D-- a/drivers/platform/x86/hp/hp_accel.c
+++ b/drivers/platform/x86/hp/hp_accel.c
@@ -267,7 +267,7 @@ static struct delayed_led_classdev hpled_led =3D {
 };

 static bool hp_accel_i8042_filter(unsigned char data, unsigned char str,
-				  struct serio *port)
+				  struct serio *port, void *context)
 {
 	static bool extended;

@@ -326,7 +326,7 @@ static int lis3lv02d_probe(struct platform_device *dev=
ice)
 	/* filter to remove HPQ6000 accelerometer data
 	 * from keyboard bus stream */
 	if (strstr(dev_name(&device->dev), "HPQ6000"))
-		i8042_install_filter(hp_accel_i8042_filter);
+		i8042_install_filter(hp_accel_i8042_filter, NULL);

 	INIT_WORK(&hpled_led.work, delayed_set_status_worker);
 	ret =3D led_classdev_register(NULL, &hpled_led.led_classdev);
diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-=
laptop.c
index e5391a37014d..c4b150fa093f 100644
=2D-- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -806,8 +806,8 @@ static void msi_send_touchpad_key(struct work_struct *=
ignored)
 }
 static DECLARE_DELAYED_WORK(msi_touchpad_dwork, msi_send_touchpad_key);

-static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str=
,
-				struct serio *port)
+static bool msi_laptop_i8042_filter(unsigned char data, unsigned char str=
, struct serio *port,
+				    void *context)
 {
 	static bool extended;

@@ -996,7 +996,7 @@ static int __init load_scm_model_init(struct platform_=
device *sdev)
 	if (result)
 		goto fail_input;

-	result =3D i8042_install_filter(msi_laptop_i8042_filter);
+	result =3D i8042_install_filter(msi_laptop_i8042_filter, NULL);
 	if (result) {
 		pr_err("Unable to install key filter\n");
 		goto fail_filter;
diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x8=
6/panasonic-laptop.c
index 22ca70eb8227..2987b4db6009 100644
=2D-- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -260,7 +260,7 @@ struct pcc_acpi {
  * keypress events over the PS/2 kbd interface, filter these out.
  */
 static bool panasonic_i8042_filter(unsigned char data, unsigned char str,
-				   struct serio *port)
+				   struct serio *port, void *context)
 {
 	static bool extended;

@@ -1100,7 +1100,7 @@ static int acpi_pcc_hotkey_add(struct acpi_device *d=
evice)
 		pcc->platform =3D NULL;
 	}

-	i8042_install_filter(panasonic_i8042_filter);
+	i8042_install_filter(panasonic_i8042_filter, NULL);
 	return 0;

 out_platform:
diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/to=
shiba_acpi.c
index 78a5aac2dcfd..5ad3a7183d33 100644
=2D-- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2755,7 +2755,7 @@ static int toshiba_acpi_enable_hotkeys(struct toshib=
a_acpi_dev *dev)
 }

 static bool toshiba_acpi_i8042_filter(unsigned char data, unsigned char s=
tr,
-				      struct serio *port)
+				      struct serio *port, void *context)
 {
 	if (str & I8042_STR_AUXDATA)
 		return false;
@@ -2915,7 +2915,7 @@ static int toshiba_acpi_setup_keyboard(struct toshib=
a_acpi_dev *dev)
 	if (ec_handle && acpi_has_method(ec_handle, "NTFY")) {
 		INIT_WORK(&dev->hotkey_work, toshiba_acpi_hotkey_work);

-		error =3D i8042_install_filter(toshiba_acpi_i8042_filter);
+		error =3D i8042_install_filter(toshiba_acpi_i8042_filter, NULL);
 		if (error) {
 			pr_err("Error installing key filter\n");
 			goto err_free_dev;
diff --git a/include/linux/i8042.h b/include/linux/i8042.h
index 95b07f8b77fe..00037c13abc8 100644
=2D-- a/include/linux/i8042.h
+++ b/include/linux/i8042.h
@@ -54,15 +54,29 @@

 struct serio;

+/**
+ * typedef i8042_filter_t - i8042 filter callback
+ * @data: Data received by the i8042 controller
+ * @str: Status register of the i8042 controller
+ * @serio: Serio of the i8042 controller
+ * @context: Context pointer associated with this callback
+ *
+ * This represents a i8042 filter callback which can be used with i8042_i=
nstall_filter()
+ * and i8042_remove_filter() to filter the i8042 input for platform-speci=
fic key codes.
+ *
+ * Context: Interrupt context.
+ * Returns: true if the data should be filtered out, false if otherwise.
+ */
+typedef bool (*i8042_filter_t)(unsigned char data, unsigned char str, str=
uct serio *serio,
+			       void *context);
+
 #if defined(CONFIG_SERIO_I8042) || defined(CONFIG_SERIO_I8042_MODULE)

 void i8042_lock_chip(void);
 void i8042_unlock_chip(void);
 int i8042_command(unsigned char *param, int command);
-int i8042_install_filter(bool (*filter)(unsigned char data, unsigned char=
 str,
-					struct serio *serio));
-int i8042_remove_filter(bool (*filter)(unsigned char data, unsigned char =
str,
-				       struct serio *serio));
+int i8042_install_filter(i8042_filter_t filter, void *context);
+int i8042_remove_filter(i8042_filter_t filter);

 #else

@@ -79,14 +93,12 @@ static inline int i8042_command(unsigned char *param, =
int command)
 	return -ENODEV;
 }

-static inline int i8042_install_filter(bool (*filter)(unsigned char data,=
 unsigned char str,
-					struct serio *serio))
+static inline int i8042_install_filter(i8042_filter_t filter, void *conte=
xt)
 {
 	return -ENODEV;
 }

-static inline int i8042_remove_filter(bool (*filter)(unsigned char data, =
unsigned char str,
-				       struct serio *serio))
+static inline int i8042_remove_filter(i8042_filter_t filter)
 {
 	return -ENODEV;
 }
=2D-
2.39.5


