Return-Path: <linux-input+bounces-11092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC12A6C948
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 11:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7C01189E696
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A2911FFC7C;
	Sat, 22 Mar 2025 10:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="3yI0cvtx"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0F21FBEA8;
	Sat, 22 Mar 2025 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742639328; cv=none; b=ipT9fOqa9QJSkchB34azSg5kOJTMpBo2D/TDVHYqPXQIBviJVVm4rG2oSJPsPZx5Y+p+PtE5ax4ssNeaFFv8XoRn7hFIqQS+6qK4UMORgbGFnuxCUtDEODQTlka3oO87tV069LrkVLkYnPYuQEIsUMdeJFQtOjjikzdpudB+sTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742639328; c=relaxed/simple;
	bh=2bwz6/VClWYWuGUBaE+neBwzBY+f1dpSy9ca91u3qsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjByce3v9t5LrDr0D5oXBMl3JYwkO+H9hBEh90N7rcc/CZ3h9j12AinxIB91rqjFaj7pANbTxm6tnX+4suBng8ERoR1f8MTplrhc/Xq49IPa0G5I5dLiEdTkevxIupSDqt2EmAqDZ9o6jFEy1kAX1YuAee36MLyEv5YeYnz8XsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=3yI0cvtx; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 878E82E07CE9;
	Sat, 22 Mar 2025 12:28:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742639323;
	bh=a9838lgHV1wfDl5kDlXXawrJ+2ogLhqYNJ6kAR1xXLc=; h=From:To:Subject;
	b=3yI0cvtxJLDD5uGq1I269FA0AHcJe21Uwv/Xk85F47oxX2GABLPAGroYcn5g71ffR
	 5BlimjB3IN+WtHSg3NEJ2nPrBBN5A4pJlbCUjF2H1wFw+7/c9wS3taSQVN5gcNL0tf
	 K5K1ZvoRr7Vm+L5t5So70bns4eI7nt/QvNmHpaVs=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v3 04/10] platform/x86: asus-wmi: Add support for multiple kbd
 RGB handlers
Date: Sat, 22 Mar 2025 11:27:58 +0100
Message-ID: <20250322102804.418000-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250322102804.418000-1-lkml@antheas.dev>
References: <20250322102804.418000-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174263932358.19014.7281450241552487270@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Some devices, such as the Z13 have multiple AURA devices connected
to them by USB. In addition, they might have a WMI interface for
RGB. In Windows, Armoury Crate exposes a unified brightness slider
for all of them, with 3 brightness levels.

Therefore, to be synergistic in Linux, and support existing tooling
such as UPower, allow adding listeners to the RGB device of the WMI
interface. If WMI does not exist, lazy initialize the interface.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c            | 113 ++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h |  16 +++
 2 files changed, 117 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19b..95ef9b1d321bb 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -254,6 +254,8 @@ struct asus_wmi {
 	int tpd_led_wk;
 	struct led_classdev kbd_led;
 	int kbd_led_wk;
+	bool kbd_led_avail;
+	bool kbd_led_registered;
 	struct led_classdev lightbar_led;
 	int lightbar_led_wk;
 	struct led_classdev micmute_led;
@@ -1487,6 +1489,53 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
 
 /* LEDs ***********************************************************************/
 
+struct asus_hid_ref {
+	struct list_head listeners;
+	struct asus_wmi *asus;
+	spinlock_t lock;
+};
+
+struct asus_hid_ref asus_ref = {
+	.listeners = LIST_HEAD_INIT(asus_ref.listeners),
+	.asus = NULL,
+	.lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
+};
+
+int asus_hid_register_listener(struct asus_hid_listener *bdev)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	list_add_tail(&bdev->list, &asus_ref.listeners);
+	if (asus_ref.asus) {
+		if (asus_ref.asus->kbd_led_registered && asus_ref.asus->kbd_led_wk >= 0)
+			bdev->brightness_set(bdev, asus_ref.asus->kbd_led_wk);
+
+		if (!asus_ref.asus->kbd_led_registered) {
+			ret = led_classdev_register(
+				&asus_ref.asus->platform_device->dev,
+				&asus_ref.asus->kbd_led);
+			if (!ret)
+				asus_ref.asus->kbd_led_registered = true;
+		}
+	}
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(asus_hid_register_listener);
+
+void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	list_del(&bdev->list);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+}
+EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
@@ -1566,6 +1615,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 
 static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 {
+	struct asus_hid_listener *listener;
 	struct asus_wmi *asus;
 	int max_level;
 
@@ -1573,25 +1623,39 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	max_level = asus->kbd_led.max_brightness;
 
 	asus->kbd_led_wk = clamp_val(value, 0, max_level);
-	kbd_led_update(asus);
+
+	if (asus->kbd_led_avail)
+		kbd_led_update(asus);
+
+	list_for_each_entry(listener, &asus_ref.listeners, list)
+		listener->brightness_set(listener, asus->kbd_led_wk);
 }
 
 static void kbd_led_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
+	unsigned long flags;
+
 	/* Prevent disabling keyboard backlight on module unregister */
 	if (led_cdev->flags & LED_UNREGISTERING)
 		return;
 
+	spin_lock_irqsave(&asus_ref.lock, flags);
 	do_kbd_led_set(led_cdev, value);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
 }
 
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
 {
-	struct led_classdev *led_cdev = &asus->kbd_led;
+	struct led_classdev *led_cdev;
+	unsigned long flags;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	led_cdev = &asus->kbd_led;
 
 	do_kbd_led_set(led_cdev, value);
 	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
 }
 
 static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
@@ -1601,6 +1665,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
+	if (!asus->kbd_led_avail)
+		return asus->kbd_led_wk;
+
 	retval = kbd_led_read(asus, &value, NULL);
 	if (retval < 0)
 		return retval;
@@ -1716,7 +1783,14 @@ static int camera_led_set(struct led_classdev *led_cdev,
 
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
-	led_classdev_unregister(&asus->kbd_led);
+	unsigned long flags;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	asus_ref.asus = NULL;
+	if (asus->kbd_led_registered)
+		led_classdev_unregister(&asus->kbd_led);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+
 	led_classdev_unregister(&asus->tpd_led);
 	led_classdev_unregister(&asus->wlan_led);
 	led_classdev_unregister(&asus->lightbar_led);
@@ -1730,6 +1804,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 static int asus_wmi_led_init(struct asus_wmi *asus)
 {
 	int rv = 0, num_rgb_groups = 0, led_val;
+	unsigned long flags;
+	bool has_listeners;
 
 	if (asus->kbd_rgb_dev)
 		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
@@ -1754,24 +1830,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
-		pr_info("using asus-wmi for asus::kbd_backlight\n");
+	asus->kbd_led.name = "asus::kbd_backlight";
+	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
+	asus->kbd_led.brightness_set = kbd_led_set;
+	asus->kbd_led.brightness_get = kbd_led_get;
+	asus->kbd_led.max_brightness = 3;
+	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
+
+	if (asus->kbd_led_avail)
 		asus->kbd_led_wk = led_val;
-		asus->kbd_led.name = "asus::kbd_backlight";
-		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
-		asus->kbd_led.brightness_set = kbd_led_set;
-		asus->kbd_led.brightness_get = kbd_led_get;
-		asus->kbd_led.max_brightness = 3;
+	else
+		asus->kbd_led_wk = -1;
+
+	if (asus->kbd_led_avail && num_rgb_groups != 0)
+		asus->kbd_led.groups = kbd_rgb_mode_groups;
 
-		if (num_rgb_groups != 0)
-			asus->kbd_led.groups = kbd_rgb_mode_groups;
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	has_listeners = !list_empty(&asus_ref.listeners);
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
 
+	if (asus->kbd_led_avail || has_listeners) {
 		rv = led_classdev_register(&asus->platform_device->dev,
 					   &asus->kbd_led);
 		if (rv)
 			goto error;
+		asus->kbd_led_registered = true;
 	}
 
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	asus_ref.asus = asus;
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
 			&& (asus->driver->quirks->wapf > 0)) {
 		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 783e2a336861b..ec8b0c585a63f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -157,14 +157,30 @@
 #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
+struct asus_hid_listener {
+	struct list_head list;
+	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
+};
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
+
+int asus_hid_register_listener(struct asus_hid_listener *cdev);
+void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
 #else
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
 	return -ENODEV;
 }
+
+static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
+{
+	return -ENODEV;
+}
+static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
+{
+}
 #endif
 
 /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
-- 
2.48.1


