Return-Path: <linux-input+bounces-16239-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9222C73495
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 10:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 4EF692FFF7
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 09:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED3E321F39;
	Thu, 20 Nov 2025 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="hviNx/+B"
X-Original-To: linux-input@vger.kernel.org
Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F3B3195E2;
	Thu, 20 Nov 2025 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763632002; cv=none; b=oBMl+vS57rZa987ISbdf1H4OU7mVE716XhfFRHiOwNc4uijLztor45AbPHQr2PcRLMYoSG+F3xThlbZ22Nk4aSpvtCahVApJAP3Gkvy33ph5AAQo922pMWZlGleJZdfD37zbd1oq8FiFxvB7x0wcu6dZEhzUfkiypUtEIyGcw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763632002; c=relaxed/simple;
	bh=srVtS9T3D2L8mcfvKrT50+aESdXVYtmA4NA/KpDHllo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvnRkD3lQD2h3j0qzTIDD+qj1OrZwVtxXquDSBw8w5rRlpyTsYjuUFPIJba2hQhiodpad0H2LtlbhEYODY0LI8EhBKkcigR2bjSLnoCj4xsCvV3TYC3FSeJPkqegCl6j5UlKlB8pzROuIrLRYAwQVtQ7xkJUrwowby3jN5BT+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=hviNx/+B; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 0C77EC2629;
	Thu, 20 Nov 2025 11:46:38 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 6AE1FC22D6;
	Thu, 20 Nov 2025 11:46:37 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c2:511b:0:8d8a:5967:d692:ea4e])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 5CC5E1FE2E1;
	Thu, 20 Nov 2025 11:46:36 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763631997;
	bh=RpJRazAuVLKJ4CPTPFJOlE689eMbR3VbNbnmH+jPBCA=; h=From:To:Subject;
	b=hviNx/+Bs2/RHoNx1F+vSCI4LFuCD0BLmbmNfRLCo6+9ZQnzgWL2JE8bm2tfVBKKY
	 l0Wla+b3Jt8Llnenz0E1h0fPfgyzzvdcHHdQSyFvBm3ODA3o1Vatd2H2LdoiNdmK9z
	 YaAiHCIhp/VgyRnMJfYHsi9ad5OXhe20crn7x7/M+3icSK47Jo1UT30/Bvfg4fGm9p
	 iKR2zrWbviVLS/I+L3jEStHBrVb526p+BY5qh9QPprvMmDvBTg/Aq7lA4scfprc6b4
	 +F3pnPhVmvww+WJyawUkV9vstxNiIc2m9wI6lnPOIS87fzKXeVhiRYv7d062cN8We4
	 8n8Pic9nSJ9HQ==
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
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v9 10/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
Date: Thu, 20 Nov 2025 10:46:16 +0100
Message-ID: <20251120094617.11672-11-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120094617.11672-1-lkml@antheas.dev>
References: <20251120094617.11672-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <176363199692.1475330.16923485772314759582@linux3247.grserver.gr>
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
2.52.0



