Return-Path: <linux-input+bounces-15430-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B1BD60E2
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EABCB18A6E27
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 20:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C0B92E6CA3;
	Mon, 13 Oct 2025 20:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="QikBfYck"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64732E2EE4;
	Mon, 13 Oct 2025 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386676; cv=none; b=hXHHsaJ7CNxP21SIyc6TIsrs0xRD2sEa+JoNlAx6ltet6P6U5nsHi9QoUV4ZOCExeE1KDrdNuElEvJ9BVHC9vMr7UmQfFEcvHmEpEuCoXMXdg0ra+1qCck4KIEM6FoQR+gb6nnfiA+5wSO/rG3eKFIDP8jcNNcjjtO3CF2/FGkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386676; c=relaxed/simple;
	bh=5zTcIJxcciiINvKHDME9IyVkO0G7SwjDVtfwPljV/R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMLXcMsICbJbi5oAsxgGcIS8sP7RpSGHfTz0c7vVpLuJaz5zHr92tAm960qMZWpGzDAYHBbl77qdGUM1fAgMhCjZFSW4ha1bBXHbbz2iTyUGkBTKxoAbzyOm/cjTs/ADjHZQjzJm311tOQuu/WO0Ia/KeHtaznsn4/OWOFg/GaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=QikBfYck; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id EB4CE5E4D7;
	Mon, 13 Oct 2025 23:17:47 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 2262C5E4F7;
	Mon, 13 Oct 2025 23:17:47 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 692D41FDC0B;
	Mon, 13 Oct 2025 23:17:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760386666;
	bh=Amc5vBhz8hofVCWjkWLyiSEcCiR+R+ulNjbPpMemVkw=; h=From:To:Subject;
	b=QikBfYck+yWuCbTwWRSPESLohMKjd+Os91ov3ZcEAd08OlxQjQ7qswSSGzoZAJfsN
	 SLGuxR8HkcxJ8gDC8roTV5ozrWiqjk636ghC5TOkmlgFWRfgbUxSemfPUDjtFsKha4
	 G7z9iraVEfX1tNtjksKdXm11F770LN8Juew68zP+y1zOKmgDZGaDYG2ttmPvxdOcwE
	 FyQAKzojp3MQNr9ODCOV6eDAb/Y/9obvvvxMks8JiOtKXksDmsikbyWZbvlzUp+4YH
	 zqZG8yOCGWr4p9O3WVIqEcBKAYta1V2blnsgA6hFIOkxIsKeaOCPRYFVEd9468goqP
	 jp8Il7c3W+tYg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 89.150.168.222) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
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
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v6 3/7] platform/x86: asus-wmi: Add support for multiple kbd
 RGB handlers
Date: Mon, 13 Oct 2025 22:15:31 +0200
Message-ID: <20251013201535.6737-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013201535.6737-1-lkml@antheas.dev>
References: <20251013201535.6737-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176038666622.3397504.9375733686851379643@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Some devices, such as the Z13 have multiple AURA devices connected
to them by USB. In addition, they might have a WMI interface for
RGB. In Windows, Armoury Crate exposes a unified brightness slider
for all of them, with 3 brightness levels.

Therefore, to be synergistic in Linux, and support existing tooling
such as UPower, allow adding listeners to the RGB device of the WMI
interface. If WMI does not exist, lazy initialize the interface.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c            | 118 ++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h |  16 +++
 2 files changed, 121 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e72a2b5d158e..a2a7cd61fd59 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -258,6 +258,8 @@ struct asus_wmi {
 	int tpd_led_wk;
 	struct led_classdev kbd_led;
 	int kbd_led_wk;
+	bool kbd_led_avail;
+	bool kbd_led_registered;
 	struct led_classdev lightbar_led;
 	int lightbar_led_wk;
 	struct led_classdev micmute_led;
@@ -1530,6 +1532,53 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
 
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
@@ -1609,6 +1658,7 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 
 static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 {
+	struct asus_hid_listener *listener;
 	struct asus_wmi *asus;
 	int max_level;
 
@@ -1616,25 +1666,39 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
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
@@ -1644,6 +1708,9 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
+	if (!asus->kbd_led_avail)
+		return asus->kbd_led_wk;
+
 	retval = kbd_led_read(asus, &value, NULL);
 	if (retval < 0)
 		return retval;
@@ -1759,7 +1826,15 @@ static int camera_led_set(struct led_classdev *led_cdev,
 
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
-	led_classdev_unregister(&asus->kbd_led);
+	unsigned long flags;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	asus_ref.asus = NULL;
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+
+	if (asus->kbd_led_registered)
+		led_classdev_unregister(&asus->kbd_led);
+
 	led_classdev_unregister(&asus->tpd_led);
 	led_classdev_unregister(&asus->wlan_led);
 	led_classdev_unregister(&asus->lightbar_led);
@@ -1773,6 +1848,8 @@ static void asus_wmi_led_exit(struct asus_wmi *asus)
 static int asus_wmi_led_init(struct asus_wmi *asus)
 {
 	int rv = 0, num_rgb_groups = 0, led_val;
+	struct asus_hid_listener *listener;
+	unsigned long flags;
 
 	if (asus->kbd_rgb_dev)
 		kbd_rgb_mode_groups[num_rgb_groups++] = &kbd_rgb_mode_group;
@@ -1797,23 +1874,38 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
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
 
-		if (num_rgb_groups != 0)
-			asus->kbd_led.groups = kbd_rgb_mode_groups;
+	if (asus->kbd_led_avail && num_rgb_groups != 0)
+		asus->kbd_led.groups = kbd_rgb_mode_groups;
 
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	if (asus->kbd_led_avail || !list_empty(&asus_ref.listeners)) {
 		rv = led_classdev_register(&asus->platform_device->dev,
 					   &asus->kbd_led);
-		if (rv)
+		if (rv) {
+			spin_unlock_irqrestore(&asus_ref.lock, flags);
 			goto error;
+		}
+		asus->kbd_led_registered = true;
+
+		if (asus->kbd_led_wk >= 0) {
+			list_for_each_entry(listener, &asus_ref.listeners, list)
+				listener->brightness_set(listener, asus->kbd_led_wk);
+		}
 	}
+	asus_ref.asus = asus;
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
 			&& (asus->driver->quirks->wapf > 0)) {
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 8a515179113d..f13a701f47a8 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -163,11 +163,19 @@ enum asus_ally_mcu_hack {
 	ASUS_WMI_ALLY_MCU_HACK_DISABLED,
 };
 
+struct asus_hid_listener {
+	struct list_head list;
+	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
+};
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
 void set_ally_mcu_powersave(bool enabled);
 int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
+
+int asus_hid_register_listener(struct asus_hid_listener *cdev);
+void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
 #else
 static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
 {
@@ -184,6 +192,14 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
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
2.51.0



