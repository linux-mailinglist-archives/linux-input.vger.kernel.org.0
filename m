Return-Path: <linux-input+bounces-15595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBAEBECD39
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 12:20:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66C044E22CD
	for <lists+linux-input@lfdr.de>; Sat, 18 Oct 2025 10:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 611ED2EC090;
	Sat, 18 Oct 2025 10:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="YygKYYnz"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414C72EB86E;
	Sat, 18 Oct 2025 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760782820; cv=none; b=e9C0l3xAQl+0YjiFg2mVM78Qbac2KaDO+Rs4jtr6atwZo8cPhKXe+NUgkahjKS3hBI+rnmnOAJ+VPtNp8NMNpY3h/ftdGTcImAZZqUgWo3BXxmSRmj/4VUppgrDsETx6NJ2Hw6fpuYyx+aaAl+ysQF82JGQFVi6QLHUlukAd5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760782820; c=relaxed/simple;
	bh=dMuJ3XXbb66B6zfVzs6h63EJQ3NxJnJgU3b4iPHW3DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZpNBCHsG6jC11L1WvD3sBehJNEVw4EyjEP/dGd2ftqQkEKvEuLw/TtnujnpPNwBVo2sA3LQYEJXa9gBHJBZZZAgRgxM/uSuddgQOxG1LxyaTOMs1D6LN3uLWzUOe6/khpRbDEWeVKg00liOr5JE2ADE+WS/3Y9m5033EWnIero=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=YygKYYnz; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 2C60A5E21B;
	Sat, 18 Oct 2025 13:20:17 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 0E0475E4C9;
	Sat, 18 Oct 2025 13:20:16 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 49AAF1FE7ED;
	Sat, 18 Oct 2025 13:20:13 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760782815;
	bh=fOurZuA/XxQXqbjwU2sZbh5G3qD6J2QQADdpEOrt32Q=; h=From:To:Subject;
	b=YygKYYnz4sw9Dj88lxKVWybXQeKiGPZzXe8O4ka7SWFCHmOs2nBCxhuql/fAlWK2p
	 d3bJ5wNGqJJEsRaJpdq6sdhE0kadFGux8XQ4j83RpoJ5WT1cBhppjNl7QlPGAYDh9M
	 ZZhkzUL8d/kXH30ogty7FlfGmfRUBZrd5RIHf6sxtEHTmUGrMyrdIiqx0EKYMU7vaW
	 ySPH/H3sjgy60om72DTtT5Jm6bWRrK1VSnOYSC5IHluPopuI+vWtr+o0MERwLfhpfF
	 Ge+AQtyCHG7MefUNbvowZDlo/jZ6RBLt7nfrp1C4GTBvHyU2OsdRSeBo+gFULLf8f0
	 g+i1mykd85jeA==
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
Subject: [PATCH v7 5/9] platform/x86: asus-wmi: Add support for multiple kbd
 led handlers
Date: Sat, 18 Oct 2025 12:17:55 +0200
Message-ID: <20251018101759.4089-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251018101759.4089-1-lkml@antheas.dev>
References: <20251018101759.4089-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176078281513.1198823.10393441334901805564@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Some devices, such as the Z13 have multiple Aura devices connected
to them by USB. In addition, they might have a WMI interface for
RGB. In Windows, Armoury Crate exposes a unified brightness slider
for all of them, with 3 brightness levels.

Therefore, to be synergistic in Linux, and support existing tooling
such as UPower, allow adding listeners to the RGB device of the WMI
interface. If WMI does not exist, lazy initialize the interface.

Since both hid-asus and asus-wmi can both interact with the led
objects including from an atomic context, protect the brightness
access with a spinlock and update the values from a workqueue.
Use this workqueue to process WMI keyboard events as well, so they
are processed asynchronously.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c            | 175 ++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h |  17 ++
 2 files changed, 168 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index e72a2b5d158e..aab779142323 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -36,6 +36,7 @@
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -258,6 +259,9 @@ struct asus_wmi {
 	int tpd_led_wk;
 	struct led_classdev kbd_led;
 	int kbd_led_wk;
+	bool kbd_led_notify;
+	bool kbd_led_avail;
+	bool kbd_led_registered;
 	struct led_classdev lightbar_led;
 	int lightbar_led_wk;
 	struct led_classdev micmute_led;
@@ -266,6 +270,7 @@ struct asus_wmi {
 	struct work_struct tpd_led_work;
 	struct work_struct wlan_led_work;
 	struct work_struct lightbar_led_work;
+	struct work_struct kbd_led_work;
 
 	struct asus_rfkill wlan;
 	struct asus_rfkill bluetooth;
@@ -1530,6 +1535,100 @@ static void asus_wmi_battery_exit(struct asus_wmi *asus)
 
 /* LEDs ***********************************************************************/
 
+struct asus_hid_ref {
+	struct list_head listeners;
+	struct asus_wmi *asus;
+	/* Protects concurrent access from hid-asus and asus-wmi to leds */
+	spinlock_t lock;
+};
+
+static struct asus_hid_ref asus_ref = {
+	.listeners = LIST_HEAD_INIT(asus_ref.listeners),
+	.asus = NULL,
+	/*
+	 * Protects .asus, .asus.kbd_led_{wk,notify}, and .listener refs. Other
+	 * asus variables are read-only after .asus is set. Except the led cdev
+	 * device if not kbd_led_avail. That becomes read-only after the
+	 * first hid-asus listener registers and triggers the work queue. It is
+	 * then not referenced again until unregistering, which happens after
+	 * .asus ref is dropped. Since .asus needs to be accessed by hid-asus
+	 * IRQs to check if forwarding events is possible, a spinlock is used.
+	 */
+	.lock = __SPIN_LOCK_UNLOCKED(asus_ref.lock),
+};
+
+/*
+ * Allows registering hid-asus listeners that want to be notified of
+ * keyboard backlight changes.
+ */
+int asus_hid_register_listener(struct asus_hid_listener *bdev)
+{
+	struct asus_wmi *asus;
+
+	guard(spinlock_irqsave)(&asus_ref.lock);
+	list_add_tail(&bdev->list, &asus_ref.listeners);
+	asus = asus_ref.asus;
+	if (asus)
+		queue_work(asus->led_workqueue, &asus->kbd_led_work);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asus_hid_register_listener);
+
+/*
+ * Allows unregistering hid-asus listeners that were added with
+ * asus_hid_register_listener().
+ */
+void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
+{
+	guard(spinlock_irqsave)(&asus_ref.lock);
+	list_del(&bdev->list);
+}
+EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
+
+static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
+
+static void kbd_led_update_all(struct work_struct *work)
+{
+	enum led_brightness value;
+	struct asus_wmi *asus;
+	bool registered, notify;
+	int ret;
+
+	asus = container_of(work, struct asus_wmi, kbd_led_work);
+
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		registered = asus->kbd_led_registered;
+		value = asus->kbd_led_wk;
+		notify = asus->kbd_led_notify;
+	}
+
+	if (!registered) {
+		/*
+		 * This workqueue runs under asus-wmi, which means probe has
+		 * completed and asus-wmi will keep running until it finishes.
+		 * Therefore, we can safely register the LED without holding
+		 * a spinlock.
+		 */
+		ret = devm_led_classdev_register(&asus->platform_device->dev,
+					    &asus->kbd_led);
+		if (!ret) {
+			scoped_guard(spinlock_irqsave, &asus_ref.lock)
+				asus->kbd_led_registered = true;
+		} else {
+			pr_warn("Failed to register keyboard backlight LED: %d\n", ret);
+			return;
+		}
+	}
+
+	if (value >= 0)
+		do_kbd_led_set(&asus->kbd_led, value);
+	if (notify) {
+		scoped_guard(spinlock_irqsave, &asus_ref.lock)
+			asus->kbd_led_notify = false;
+		led_classdev_notify_brightness_hw_changed(&asus->kbd_led, value);
+	}
+}
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
@@ -1576,7 +1675,8 @@ static void kbd_led_update(struct asus_wmi *asus)
 {
 	int ctrl_param = 0;
 
-	ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
+	scoped_guard(spinlock_irqsave, &asus_ref.lock)
+		ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
 	asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
 }
 
@@ -1609,14 +1709,23 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
 
 static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 {
+	struct asus_hid_listener *listener;
 	struct asus_wmi *asus;
 	int max_level;
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 	max_level = asus->kbd_led.max_brightness;
 
-	asus->kbd_led_wk = clamp_val(value, 0, max_level);
-	kbd_led_update(asus);
+	scoped_guard(spinlock_irqsave, &asus_ref.lock)
+		asus->kbd_led_wk = clamp_val(value, 0, max_level);
+
+	if (asus->kbd_led_avail)
+		kbd_led_update(asus);
+
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		list_for_each_entry(listener, &asus_ref.listeners, list)
+			listener->brightness_set(listener, asus->kbd_led_wk);
+	}
 }
 
 static void kbd_led_set(struct led_classdev *led_cdev,
@@ -1631,10 +1740,11 @@ static void kbd_led_set(struct led_classdev *led_cdev,
 
 static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
 {
-	struct led_classdev *led_cdev = &asus->kbd_led;
-
-	do_kbd_led_set(led_cdev, value);
-	led_classdev_notify_brightness_hw_changed(led_cdev, asus->kbd_led_wk);
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		asus->kbd_led_wk = value;
+		asus->kbd_led_notify = true;
+	}
+	queue_work(asus->led_workqueue, &asus->kbd_led_work);
 }
 
 static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
@@ -1644,10 +1754,18 @@ static enum led_brightness kbd_led_get(struct led_classdev *led_cdev)
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
 
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		if (!asus->kbd_led_avail)
+			return asus->kbd_led_wk;
+	}
+
 	retval = kbd_led_read(asus, &value, NULL);
 	if (retval < 0)
 		return retval;
 
+	scoped_guard(spinlock_irqsave, &asus_ref.lock)
+		asus->kbd_led_wk = value;
+
 	return value;
 }
 
@@ -1759,7 +1877,9 @@ static int camera_led_set(struct led_classdev *led_cdev,
 
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
-	led_classdev_unregister(&asus->kbd_led);
+	scoped_guard(spinlock_irqsave, &asus_ref.lock)
+		asus_ref.asus = NULL;
+
 	led_classdev_unregister(&asus->tpd_led);
 	led_classdev_unregister(&asus->wlan_led);
 	led_classdev_unregister(&asus->lightbar_led);
@@ -1797,22 +1917,25 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (!kbd_led_read(asus, &led_val, NULL) && !dmi_check_system(asus_use_hid_led_dmi_ids)) {
-		pr_info("using asus-wmi for asus::kbd_backlight\n");
-		asus->kbd_led_wk = led_val;
-		asus->kbd_led.name = "asus::kbd_backlight";
-		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
-		asus->kbd_led.brightness_set = kbd_led_set;
-		asus->kbd_led.brightness_get = kbd_led_get;
-		asus->kbd_led.max_brightness = 3;
+	asus->kbd_led.name = "asus::kbd_backlight";
+	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
+	asus->kbd_led.brightness_set = kbd_led_set;
+	asus->kbd_led.brightness_get = kbd_led_get;
+	asus->kbd_led.max_brightness = 3;
+	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
+	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
 
+	if (asus->kbd_led_avail) {
+		asus->kbd_led_wk = led_val;
 		if (num_rgb_groups != 0)
 			asus->kbd_led.groups = kbd_rgb_mode_groups;
+	} else
+		asus->kbd_led_wk = -1;
 
-		rv = led_classdev_register(&asus->platform_device->dev,
-					   &asus->kbd_led);
-		if (rv)
-			goto error;
+	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
+		asus_ref.asus = asus;
+		if (asus->kbd_led_avail || !list_empty(&asus_ref.listeners))
+			queue_work(asus->led_workqueue, &asus->kbd_led_work);
 	}
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
@@ -4272,6 +4395,7 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
 
 static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 {
+	enum led_brightness led_value;
 	unsigned int key_value = 1;
 	bool autorelease = 1;
 
@@ -4288,19 +4412,22 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 
+	scoped_guard(spinlock_irqsave, &asus_ref.lock)
+		led_value = asus->kbd_led_wk;
+
 	if (code == NOTIFY_KBD_BRTUP) {
-		kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
+		kbd_led_set_by_kbd(asus, led_value + 1);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTDWN) {
-		kbd_led_set_by_kbd(asus, asus->kbd_led_wk - 1);
+		kbd_led_set_by_kbd(asus, led_value - 1);
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
-		if (asus->kbd_led_wk == asus->kbd_led.max_brightness)
+		if (led_value == asus->kbd_led.max_brightness)
 			kbd_led_set_by_kbd(asus, 0);
 		else
-			kbd_led_set_by_kbd(asus, asus->kbd_led_wk + 1);
+			kbd_led_set_by_kbd(asus, led_value + 1);
 		return;
 	}
 
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 8a515179113d..1165039013b1 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -163,11 +163,20 @@ enum asus_ally_mcu_hack {
 	ASUS_WMI_ALLY_MCU_HACK_DISABLED,
 };
 
+/* Used to notify hid-asus when asus-wmi changes keyboard backlight */
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
@@ -184,6 +193,14 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
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



