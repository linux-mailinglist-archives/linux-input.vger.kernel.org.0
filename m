Return-Path: <linux-input+bounces-8575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD669F2772
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 00:37:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3041885100
	for <lists+linux-input@lfdr.de>; Sun, 15 Dec 2024 23:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6688D1922D4;
	Sun, 15 Dec 2024 23:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UrlBpAV9"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AADF9D6;
	Sun, 15 Dec 2024 23:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734305843; cv=none; b=it8FurlV1T5IpETYoRWNpJBBsyliMwmRA49hyPq6mKKNl5qfCTDnqCmtV8XJr+JOc38820pPq8eKLJnJal80r7L5pKc3jA61XSKjN/uQfo99hnFtvRZdepYFW/y+1/LoB6rCzmpaapgrmQf2qQxXnkscSMtdKP3bzgB682RT6ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734305843; c=relaxed/simple;
	bh=O4MU2LzSN5kSLVJxFEuCjwBiEmQl7SpX4o8I6X4Li7Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dOSTwc4+55L/lQRCmQiAoAFvCTG09MM91DFIPeTbRYF7bixhldqWMkrqih6srtYgrO/ExSI3mL4OXCdo0JsOm0a6BYpmTEVuDkNpti+GXDgVOhxATTXTAEzcsP0Lm8ga5BfdxupTcP+ptA2n1r9Z9rEJSk5T1tphbPhZ9EuQeXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=UrlBpAV9; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734305801; x=1734910601; i=w_armin@gmx.de;
	bh=kJvsfayy+PV+rQMMoWCezgt9G3fGaX2/dsxDhy3GvbM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=UrlBpAV9PSBWapJRiDACCVoYvs/SErG+gnexbGeKiD5ErkjqEXQgHnyUu2y3UVKa
	 yvgl4Ilu2MWeEp6pvp8TB3OYWncrJfUY+IrQgcGQwc5NVCmdYVbbwU7oAtm+v3SGH
	 ftXdNZE/Q7JdlUI7O1ZYJE8+5GLE6tjGRTugRnAQOeY9wF+lQJ+rm25NdsXoFzJMW
	 o9cuCJXDah/YKQHhsSpMJFkN7yzIdA8LXfd+Uvm/nExo0MY4+O3YC0b6U/CgS6XE1
	 i6TjXPEZza5oGvqhR9vFHEXi+CqCiu3n1R/FpkAL1LAmn82AK1vvE+Z5ZpKXECcYo
	 i3sxhVRepfoB5KSHTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-inspiron.fritz.box ([91.14.230.110]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MUosN-1tDnFQ2xlZ-00Mr5u; Mon, 16 Dec 2024 00:36:41 +0100
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
Subject: [PATCH] Input: i8042 - Add support for platform filter contexts
Date: Mon, 16 Dec 2024 00:36:28 +0100
Message-Id: <20241215233628.4500-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TOJAA1O0EdY9K5SQrZZmMQburMcRNbJ5zR+5ZMaMYawXkU/JXLY
 rJeg0tisjCIiJbY96wZDdTVBdCUmhyOc2M3jHOjuoOsZnACpxzAB2Fnt/L42nIQA2fOomNH
 eG2k1zXID4aWo4u7PZ9sXB4hu6lnnWE450eMd827ZyK6smJ960zh37qS4uCpFxlsPZIb3mM
 jUpH8dyxEZfDo6tBM37Iw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NnxoV+PBD1E=;sNwZdFECA/BxH74uV3D32ApzWSZ
 VwWvw8zQxP7y4JWPggNJjgM6hI9YvdJ6/nFpS8v4NfqSKqNQsP9kTrPvL2h1gkvJlCB3icAFU
 M9lOAIyvxaXhZLbR9vjvCFbCNCKouiLUlm8ESPxBz4xSOYNrwRo5fZ/k8Grvz6LKhsNW/5oik
 zMM3cckQX0NxhXqA4MpZMa7TPdeHFM2UK4bx9pJWkC4RG75pVr0ZwdMdNyxFn3K4BwsmLIuRx
 XxlclTGhv2ydKxiLXhVpOH8u6Kp6PZAEq6fMJSVweH4uXrAUABD1PQ6mH+rFch/sLABOTdWbj
 lRCAj9dhOL9ToVnTFYqosYmLXC1ozNzOo3eBUnifzP1zoRemI0JrI4z3Jtcvqn4f6P/yTxy8v
 uifooWi21oCAtaAQhrNy6ykGy77xxooWoj+lFhk4g65zswpvy4LeCkLLmKR2F0CUqnx5bvy5y
 xZ/k2rlvOCjTxIqY63pqrM6xTDk6Lm38767scUoS2L+QVXIwVzWDF/EiLJZ4vGbfbSe4zIUg/
 FvCjBdaAE+3uGRKhlDRXeJbdn7WOfFsFF4HhXGjmo8293KOcm73SRCO0tWzGXbPkobBnHWny7
 cA8V4mmYyqheM7/alk0xo9QL14Pvv+SzcFYVt26dPHLeLkSP+WHXpkWHxhuWNcwAaxk/A1/Ou
 JVlPfTWy/NwlJBYxojxmg9yjw33L8geZsAQYQg2OwXXvGCjkGK5LF27XxYqYWjGh1dE7YinAa
 WBheFtlVPSycS370RoIZqd4BEOjg69DS2qNCYoB3+kLh+acFc3uzaOCzGJ9dk3N2Q11N3ArTC
 JdoyVG6Jp3bh5AEiX/Y79ToYzH8XtUUPqIyeeBf45N0FiYJwDCuDxNNLl3nxlU2DMnvEOp7nc
 d2T+ViKjvbOnF1m6bnJmH5+/WCXmboiVEMhmFrRQDudK7wu30Kmk5Jv2pg8StZ0D40kkDFVY3
 pcRlsWm+HcD7KAz96f4LH1eYODyy0hRi1iYu+dkASw7sAp8dNwZzncRW6ghptFr4Eyc7hsQiQ
 Fla5ZOOuf0YoKPEjvwCfFgFgFxl40K9jqjeGAUogjOjLgCBBlf52VR3IsMG5UrO9Tov4aT4S8
 /EttKTS34SG49Z7iCamt8/znQRPfKs

Currently the platform filter cannot access any driver-specific state
which forces drivers installing a i8042 filter to have at least some
kind of global pointer for their filter.

This however might cause issues should such a driver probe multiple
devices. Fix this by allowing callers of i8042_install_filter() to
submit a context pointer which is then passed to the i8042 filter.

Also introduce a separate type for the i8042 filter (i8042_filter_t)
so that the function definitions can stay compact.

Tested on a Dell Inspiron 3505.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Since most of the affected drivers are x86 platform drivers, i would
like to have this changes merged through the platform-drivers-x86
tree. This would also prevent a possible merge conflict should
the samsung-galaxybook driver get merged.
=2D--
 drivers/input/misc/ideapad_slidebar.c   |  4 ++--
 drivers/input/serio/i8042.c             | 17 ++++++++++-------
 drivers/platform/x86/asus-nb-wmi.c      |  3 ++-
 drivers/platform/x86/asus-wmi.c         |  2 +-
 drivers/platform/x86/asus-wmi.h         |  3 +--
 drivers/platform/x86/dell/dell-laptop.c |  6 +++---
 drivers/platform/x86/hp/hp_accel.c      |  4 ++--
 drivers/platform/x86/msi-laptop.c       |  6 +++---
 drivers/platform/x86/panasonic-laptop.c |  4 ++--
 drivers/platform/x86/toshiba_acpi.c     |  4 ++--
 include/linux/i8042.h                   | 15 +++++++--------
 11 files changed, 35 insertions(+), 33 deletions(-)

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
index 95b07f8b77fe..be9460c874d6 100644
=2D-- a/include/linux/i8042.h
+++ b/include/linux/i8042.h
@@ -54,15 +54,16 @@

 struct serio;

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

@@ -79,14 +80,12 @@ static inline int i8042_command(unsigned char *param, =
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


