Return-Path: <linux-input+bounces-8720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B389FA857
	for <lists+linux-input@lfdr.de>; Sun, 22 Dec 2024 22:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A7DD1886580
	for <lists+linux-input@lfdr.de>; Sun, 22 Dec 2024 21:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5972018FDB1;
	Sun, 22 Dec 2024 21:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="OnjOOEgR"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66958EAF6;
	Sun, 22 Dec 2024 21:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734904296; cv=none; b=dXWIU2X5hd59MnbOjzNh2dnAbI4kcXX6uak+R3zAMAyppYxzibWNJNEYD0c99u1fDUGKpNwtALtwgg+X/v4EPHduzD08KBz5f3ZdlRTdG/Lgwj7/H8hFOE5IyublUx8esCg8Dvg0fQ0fmxZT3hsXhUfYhMa4ZfVHdVGS6k7FL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734904296; c=relaxed/simple;
	bh=QrdcmOVES0c7udi2quCTCuYhvdd0HxOWN+1Ziybv+sk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=rV3dtkGNVq17M5v4uqWmW0Cos4uDHBh/xsngRpUvQZ3tlDU0DPwm34qRo77MYDmwaawWDIOHGh8G6QaUpyY9KjYzM+PDcCBE5d/r4/84BnlfRhpqvkfq6W17nkoFwfT+xdtxdjMIyCWNDAEgyOvvCdCu0QvAM0vwQ3OhA3AxMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=OnjOOEgR; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734904248; x=1735509048; i=w_armin@gmx.de;
	bh=mFR4J+O1clo+TN4YcicFY04iJ70Rwuc9IkzqZmicPPY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OnjOOEgRDnhxSt57Zm0qIndEONPDx4vTJ9McHtdXM8ppUrs9AdOSI4AGv+xa+UP9
	 bbUaWwX+R8rNOogxipkPBX1Vja8eCkpvI10OBGqlhwJqR/s/daAnPzqUKIbmckR5k
	 vdYUIBVC0gvobYLt1flVOWsu5UCPSGapf6W6Xsgd0X5OrrS2MRJSnfj0z6DQ3J3Jr
	 NiIO+gDNsyi1JdM2FuaxMN+o+Z8izh1MJRjBp0qH116rebwaz8yzRSJMf1FoT7oQH
	 582mgDdLqyqinjAxIIMIB2B9icywyZMaIljKGi3jGIX6W1v0H5mYucdy4U30fpRMI
	 QT5GYcLb26A27h4fQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-inspiron.fritz.box ([91.14.230.110]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MRTN9-1tDkHl19Tp-00SY0l; Sun, 22 Dec 2024 22:50:48 +0100
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
Subject: [PATCH v2] Input: i8042 - Add support for platform filter contexts
Date: Sun, 22 Dec 2024 22:50:42 +0100
Message-Id: <20241222215042.7709-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Iq8jfnHwCipc77+H5S+JfrMEm3hOyUEgHBgse/G2KLDdID/pQ9g
 wAC9S2P+IwRfXWyp3YgGIZXZVDw+/lkbV9ahYwugDqeC/AZ+I85sl7NczWRdZhnVGhbrgRo
 r7OD5/8Nzy+c0OhiXDWRsVVmqoTm7SVWjHNxzbW38dAm4MVhHQ7euZN8EUyG6nGm0JuDWjd
 dpI80rbBPOB7HjJBrt6QQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L2pw2RX9ejA=;rlVYAzi76yetRzNYThq+d/MG9p4
 brGawFjkAX1WvnMtPUJ+F6XJyZ6V8SQaT58DJQo3AAwCiC1SOr1Xz7JFh8tXID662aAH0XuXm
 E2E7xnX/Q7I+Me90xAfDDR3wh0EGs89FmS/tEEw7WDDcCkJkWSUm9npPTj9oH0pZcRZUOdZIF
 9vtxKzLV/o1Nl2714zMTbTCrEDrtwmNA4KP9T8Tuyf+ggPrye3QEB+8fZckOPtXAEjOjBmt9k
 jsM/gvQaI1usTGI/i96dU3TVAGsVHBiCToy8F1g1kTfUSRbpGrBVrmOrN0yH2P08CQPz0fNEY
 I9KGdewqou2FS3A+FbJK9njCXL7d0WnORSVnYMuWJn0nI9s/V4zI9DT5rvL6JNa5I6xgWhP+u
 V/fVjHo8IWkKkI1BG0itA+vtzgsmo40AhEQ8jLgFwMzUWyFxATcvknyVy6uSQLRxVug738Ul5
 tX0tM67Haviuf3cktI4K36ZTasijyZTRAYj7K4SFP10vuHQyG1lvls1PZ7Eq6VnhJhqN5vcmX
 AZmQ55GPUot2X1kJvoZAtaG86KfPaX7YIG+lKK7oSUdDm8YxpqxFOjMBqrTfN10WP9xOqW6mC
 NwnhuWACtPaaCTJ2RCTHu1H6VumA/HBa3EtoBsKck+8duYIJhtJwqQnoWBc1w1dvU96de5xYk
 XnOfOm5v6v71zwmT2U/FOsSqgmc5d5TT8B/gyCLvZB/7RosUZlC/o9yLfiXINrrPn+8ek1BQW
 dcjotK7Xr/w9Z4q7V3MDzxOBeNcUcbzF/MIh0CddqIFdJGXtojt28tRPAEiyG7a1cdcs4gVk0
 6qFCw2o73cTUY38trQ0JT4TBvoQERIO42HSyD3puNylYgVWBYxRQZcN3GPyawDvUATGoFe+zj
 Y0h7kxtgGhIkVAK+AjSFh+ezyKDt7ACnUo79QBXFgCcfOE4EmJAaNYOSEItWtSEM15Z+kE0K9
 IIkwd25LbvDaWAE7zQBGWMU6A90pJIl/zwelwi5gZ7UGU+8E5RdWcqWWefN6TUCODPe1DgdUT
 x3Dpt+rgPf8CMuGwDpbthNkgjkHNybQaJQEqcWz8AKsKBUk4OTXMa7Y9lD43ALEzmPssZprzj
 0kUrk6gl0nrdY7kXpy5XPgbEAMN4wH

Currently the platform filter cannot access any driver-specific state
which forces drivers installing a i8042 filter to have at least some
kind of global pointer for their filter.

This however might cause issues should such a driver probe multiple
devices. Fix this by allowing callers of i8042_install_filter() to
submit a context pointer which is then passed to the i8042 filter.

Also introduce a separate type for the i8042 filter (i8042_filter_t)
so that the function definitions can stay compact.

Tested on a Dell Inspiron 3505.

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
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


