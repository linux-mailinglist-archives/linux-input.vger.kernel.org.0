Return-Path: <linux-input+bounces-10986-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33485A698E7
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F5424830EE
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8D42139B5;
	Wed, 19 Mar 2025 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="wziN4Z3E"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F6218E99;
	Wed, 19 Mar 2025 19:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411619; cv=none; b=D3KExh7sp8VGUSeygrGg7/F9GThp7CQLv8wqtBd37FH+hrw6nkqYHSKGY4ry4ztTsi7PlspORXsBKXTUAMMVlvW3b8UClmRrKGxegkoOPCh8nuICPLJMT7ro6DBTgUSXds9TYEeBfZ54WJYqHwww7ZfR9UxUzo33ShxXUxRWGJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411619; c=relaxed/simple;
	bh=GJwwDW3BN8J6YfHmZ4QYl4xAlvZjRCLrNTLGfrLOg5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bg+DRGuan/42/Xsvm+e+fHeC76O/Cx50owslCUWar9jTQRQFx729OVxrGMKQV8xAE3aSUZGfd6/WNUibbQknVzX9ToaJTDU9ORVW0I+0miFGhZNhxJzEZ7bqn9A+MIUdMbWxOxqOyCnY9Q3DC206QnrrVLzpYWlx/TI7O2/xllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=wziN4Z3E; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id E97FA2E095E5;
	Wed, 19 Mar 2025 21:13:33 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411615;
	bh=Vx6zsktsNHbgLXmD/Z9vYeZrBlKe0HGcXv3+fK1rga8=; h=From:To:Subject;
	b=wziN4Z3Eq1dY+K519G1TLykcfFMguvCstaYi6NS0ITxlc5b/yvjDVyZrnlVopU1u/
	 CU24+2zGJcXOAgK/3T58xwURZD8DbsEA0LNAW7UeA4wQe4n8gg5Ac1NC5GGhjbxgUr
	 6LGYSrdp24gVvP6EC0lzWzLrfF0wfHcarSBvPLdY=
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
Subject: [PATCH 07/11] platform/x86: asus-wmi: Add support for multiple kbd
 RGB handlers
Date: Wed, 19 Mar 2025 20:13:15 +0100
Message-ID: <20250319191320.10092-8-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241161509.8235.8967813105438721484@linux1587.grserver.gr>
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
 drivers/platform/x86/asus-wmi.c            | 98 +++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h | 16 ++++
 2 files changed, 103 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 38ef778e8c19b..0cb1cf3c25a28 100644
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
@@ -1487,6 +1489,46 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
 
 /* LEDs ***********************************************************************/
 
+LIST_HEAD(asus_brt_listeners);
+DEFINE_MUTEX(asus_brt_lock);
+struct asus_wmi *asus_brt_ref;
+
+int asus_brt_register_listener(struct asus_brt_listener *bdev)
+{
+	int ret;
+
+	mutex_lock(&asus_brt_lock);
+	list_add_tail(&bdev->list, &asus_brt_listeners);
+	if (asus_brt_ref) {
+		if (asus_brt_ref->kbd_led_registered && asus_brt_ref->kbd_led_wk >= 0)
+			bdev->notify(bdev, asus_brt_ref->kbd_led_wk);
+		else {
+			asus_brt_ref->kbd_led_registered = true;
+			ret = led_classdev_register(
+				&asus_brt_ref->platform_device->dev,
+				&asus_brt_ref->kbd_led);
+		}
+	}
+	mutex_unlock(&asus_brt_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(asus_brt_register_listener);
+
+void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
+{
+	mutex_lock(&asus_brt_lock);
+	list_del(&bdev->list);
+
+	if (asus_brt_ref && list_empty(&asus_brt_listeners) &&
+	    !asus_brt_ref->kbd_led_avail) {
+		led_classdev_unregister(&asus_brt_ref->kbd_led);
+		asus_brt_ref->kbd_led_registered = false;
+	}
+	mutex_unlock(&asus_brt_lock);
+}
+EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
@@ -1566,6 +1608,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 
 static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 {
+	struct asus_brt_listener *listener;
 	struct asus_wmi *asus;
 	int max_level;
 
@@ -1573,25 +1616,37 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 	max_level = asus->kbd_led.max_brightness;
 
 	asus->kbd_led_wk = clamp_val(value, 0, max_level);
-	kbd_led_update(asus);
+
+	if (asus->kbd_led_avail)
+		kbd_led_update(asus);
+
+	list_for_each_entry(listener, &asus_brt_listeners, list)
+		listener->notify(listener, asus->kbd_led_wk);
 }
 
 static void kbd_led_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
+	mutex_lock(&asus_brt_lock);
+
 	/* Prevent disabling keyboard backlight on module unregister */
 	if (led_cdev->flags & LED_UNREGISTERING)
 		return;
 
 	do_kbd_led_set(led_cdev, value);
+	mutex_unlock(&asus_brt_lock);
 }
 
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
 {
-	struct led_classdev *led_cdev = &asus->kbd_led;
+	struct led_classdev *led_cdev;
+
+	mutex_lock(&asus_brt_lock);
+	led_cdev = &asus->kbd_led;
 
 	do_kbd_led_set(led_cdev, value);
 	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
+	mutex_unlock(&asus_brt_lock);
 }
 
 static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
@@ -1601,6 +1656,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
+	if (!asus->kbd_led_avail)
+		return asus->kbd_led_wk;
+
 	retval = kbd_led_read(asus, &value, NULL);
 	if (retval < 0)
 		return retval;
@@ -1716,6 +1774,10 @@ static int camera_led_set(struct led_classdev *led_cdev,
 
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
+	mutex_lock(&asus_brt_lock);
+	asus_brt_ref = NULL;
+	mutex_unlock(&asus_brt_lock);
+
 	led_classdev_unregister(&asus->kbd_led);
 	led_classdev_unregister(&asus->tpd_led);
 	led_classdev_unregister(&asus->wlan_led);
@@ -1730,6 +1792,7 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 static int asus_wmi_led_init(struct asus_wmi *asus)
 {
 	int rv = 0, num_rgb_groups = 0, led_val;
+	bool has_listeners;
 
 	if (asus->kbd_rgb_dev)
 		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
@@ -1754,24 +1817,37 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
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
+	mutex_lock(&asus_brt_lock);
+	has_listeners = !list_empty(&asus_brt_listeners);
+	mutex_unlock(&asus_brt_lock);
 
+	if (asus->kbd_led_avail || has_listeners) {
+		asus->kbd_led_registered = true;
 		rv = led_classdev_register(&asus->platform_device->dev,
 					   &asus->kbd_led);
 		if (rv)
 			goto error;
 	}
 
+	mutex_lock(&asus_brt_lock);
+	asus_brt_ref = asus;
+	mutex_unlock(&asus_brt_lock);
+
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
 			&& (asus->driver->quirks->wapf > 0)) {
 		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 783e2a336861b..42e963b70acdb 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -157,14 +157,30 @@
 #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
+struct asus_brt_listener {
+	struct list_head list;
+	void (*notify)(struct asus_brt_listener *listener, int brightness);
+};
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
+
+int asus_brt_register_listener(struct asus_brt_listener *cdev);
+void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
 #else
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
 	return -ENODEV;
 }
+
+static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
+{
+	return -ENODEV;
+}
+static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
+{
+}
 #endif
 
 /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
-- 
2.48.1


