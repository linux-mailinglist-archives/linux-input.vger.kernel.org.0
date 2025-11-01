Return-Path: <linux-input+bounces-15857-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F335C27C2A
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 11:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D41B4051DD
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 10:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B882D94A6;
	Sat,  1 Nov 2025 10:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="oI/wnb8I"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B52D738E;
	Sat,  1 Nov 2025 10:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761994047; cv=none; b=fKSV08mMTHgFYaBwD5y5U+OGSSMO+XkqDTntXBV0LeFrnyynaWZVWk2vOrdcZIGk8WRVc1AEAz7okjX/kNbrKs3vx4mdDe7OEhkV+3VuDyjzLANTRl4x+JG9c9GNI9asYWZkHMrdvBxcQtgp+isvgWGycaNmhQkK1lTTPH7ab58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761994047; c=relaxed/simple;
	bh=FxUXAaTCnNdmJ0DSnCqWmRjuBpid1lMDFSDfB6pymjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=la9GmKeqBIYtfUqbhAsdgjmBBzYTKifyE87XE4eukLKVgXva8YN+vHodli3oU8LX650kiyh3WOXnFA71fHCBfnhi8hFtDvWsdp5JP5MCesp+CgyUhU/Dyw+NPtfsOTNHigDl80RvdAJvGjzkn89GdvYFTX4DRw8Q93loPvOTD/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=oI/wnb8I; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id EAC6D3F2C8;
	Sat,  1 Nov 2025 12:47:23 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 6B2B03F2AF;
	Sat,  1 Nov 2025 12:47:23 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 599412007D3;
	Sat,  1 Nov 2025 12:47:22 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761994043;
	bh=JMsvUErq4V5qN/2j92h9mIs/BE578cCisEu+HYqbudk=; h=From:To:Subject;
	b=oI/wnb8Isi3QYnqbL7gwUQ4GJBAmnoyw/+qOHs28BLuyZwHiCNDARBKPe3o+I0hPx
	 LJGJZcr4hJnUs2fgL5deTF859Cy2maqzvWW6IKVoPBVR5/ctn7uDpUUWlEyO7J8vYJ
	 J3Ue5azuReB87xQJMiDSTW7zHouRgQqnRAafgAAfs3afu6kVPGb9YzdeYmG+hm3O2d
	 00FsP28iPvw0eyK9vD47zWwjtAQj8OCJM5TfYIMNCtspKnV+6l/++LulBemWJLWb47
	 HJIW8kAadz2C9Mz/DpottTKip3oPB+NZgtQbdYsJZqqV53sBO2LGYiX+EKqxA5IDJo
	 LVKZfo2xQ8qyg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:8d8a:5967:d692:ea4e) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
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
Subject: [PATCH v8 09/10] platform/x86: asus-wmi: add keyboard brightness
 event handler
Date: Sat,  1 Nov 2025 11:47:11 +0100
Message-ID: <20251101104712.8011-10-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101104712.8011-1-lkml@antheas.dev>
References: <20251101104712.8011-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176199404293.3745903.8697429662101418782@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The keyboard brightness control of Asus WMI keyboards is handled in
kernel, which leads to the shortcut going from brightness 0, to 1,
to 2, and 3.

However, for HID keyboards it is exposed as a key and handled by the
user's desktop environment. For the toggle button, this means that
brightness control becomes on/off. In addition, in the absence of a
DE, the keyboard brightness does not work.

Therefore, expose an event handler for the keyboard brightness control
which can then be used by hid-asus. Since this handler is called from
an interrupt context, defer the actual work to a workqueue.

In the process, introduce ASUS_EV_MAX_BRIGHTNESS to hold the constant
for maximum brightness since it is shared between hid-asus/asus-wmi.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c            | 46 +++++++++++++++++++---
 include/linux/platform_data/x86/asus-wmi.h | 13 ++++++
 2 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5f23aedbf34f..a7482c97cc5b 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1628,6 +1628,44 @@ static void kbd_led_update_all(struct work_struct *work)
 	}
 }
 
+/*
+ * This function is called from hid-asus to inform asus-wmi of brightness
+ * changes initiated by the keyboard backlight keys.
+ */
+int asus_hid_event(enum asus_hid_event event)
+{
+	struct asus_wmi *asus;
+	int brightness;
+
+	guard(spinlock_irqsave)(&asus_ref.lock);
+	asus = asus_ref.asus;
+	if (!asus || !asus->kbd_led_registered)
+		return -EBUSY;
+
+	brightness = asus->kbd_led_wk;
+
+	switch (event) {
+	case ASUS_EV_BRTUP:
+		brightness += 1;
+		break;
+	case ASUS_EV_BRTDOWN:
+		brightness -= 1;
+		break;
+	case ASUS_EV_BRTTOGGLE:
+		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
+			brightness = 0;
+		else
+			brightness += 1;
+		break;
+	}
+
+	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
+	asus->kbd_led_notify = true;
+	queue_work(asus->led_workqueue, &asus->kbd_led_work);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asus_hid_event);
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
@@ -1710,13 +1748,11 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
 {
 	struct asus_hid_listener *listener;
 	struct asus_wmi *asus;
-	int max_level;
 
 	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
-	max_level = asus->kbd_led.max_brightness;
 
 	scoped_guard(spinlock_irqsave, &asus_ref.lock)
-		asus->kbd_led_wk = clamp_val(value, 0, max_level);
+		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
 
 	if (asus->kbd_led_avail)
 		kbd_led_update(asus);
@@ -1920,7 +1956,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
 	asus->kbd_led.brightness_set = kbd_led_set;
 	asus->kbd_led.brightness_get = kbd_led_get;
-	asus->kbd_led.max_brightness = 3;
+	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
 	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
 	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
 
@@ -4423,7 +4459,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 	}
 	if (code == NOTIFY_KBD_BRTTOGGLE) {
-		if (led_value == asus->kbd_led.max_brightness)
+		if (led_value == ASUS_EV_MAX_BRIGHTNESS)
 			kbd_led_set_by_kbd(asus, 0);
 		else
 			kbd_led_set_by_kbd(asus, led_value + 1);
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index d8c5269854b0..3f679598b629 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -169,6 +169,14 @@ struct asus_hid_listener {
 	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
 };
 
+enum asus_hid_event {
+	ASUS_EV_BRTUP,
+	ASUS_EV_BRTDOWN,
+	ASUS_EV_BRTTOGGLE,
+};
+
+#define ASUS_EV_MAX_BRIGHTNESS 3
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
 void set_ally_mcu_powersave(bool enabled);
@@ -177,6 +185,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 
 int asus_hid_register_listener(struct asus_hid_listener *cdev);
 void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
+int asus_hid_event(enum asus_hid_event event);
 #else
 static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
 {
@@ -201,6 +210,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
 static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
 {
 }
+static inline int asus_hid_event(enum asus_hid_event event)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.51.2



