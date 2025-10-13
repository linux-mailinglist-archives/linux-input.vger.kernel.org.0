Return-Path: <linux-input+bounces-15431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C266EBD60EE
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62A1B18A713C
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 20:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2929D2E7659;
	Mon, 13 Oct 2025 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="fJLMtL/R"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1673D2E1EFF;
	Mon, 13 Oct 2025 20:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760386678; cv=none; b=uqCj52+3EJA8wY4hXlaajjU18o+MMSRiDe5Tofh34TBIqmbNfda57h29pJGAvNBiK7voU0Dkambzco3J5RORWR5LD1kSLABBKCZy96DsVhFtyumyVb4SsfEjiAi+ryItYWrryTOCAxYLW9p34PGLnpXgXjFLP8LowLyWY1A7fd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760386678; c=relaxed/simple;
	bh=xyQgSY7ATHyEbgu/L27Am/nvaitQossSrxjojFcg8b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KXu/4sTvcKuhZgpBFkxnXitGY15OtIQ9/QoPcjUuUIX6/NKTIQgPHTcp/Y2s4ijW/sFNLQ0gAB/rJgzaU7+0vGJYh+qicCNkG2L7lOC8PswXxVRw4BOXrDBuQpwqOhWvTjfATTijrlQ7GO5VE6p+z8sXnU6elsqtK0jUg5HvvBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=fJLMtL/R; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 67A36BD71C;
	Mon, 13 Oct 2025 23:17:54 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id DA343BCF41;
	Mon, 13 Oct 2025 23:17:53 +0300 (EEST)
Received: from antheas-z13 (x5996a8de.customers.hiper-net.dk [89.150.168.222])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B2F691FDBBF;
	Mon, 13 Oct 2025 23:17:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1760386673;
	bh=vbpNbTnGcDC5sxeacSKQ3Cf3ynx79dkZOF4R7/C/b7g=; h=From:To:Subject;
	b=fJLMtL/RZChRRG1zf/yH0ibV4cwZhvqVvQGwO5dCCtCvzYKTk/e+C8TEn0e3oeuwt
	 01HK+UiU8IFRdmMfcwf1YnDI/R557YrTZ6nv4LHq4Yly7O8cAMXf+cdJaa75L1X/Em
	 48W34uKyQPEtjlDaOdowXFi/C+Hd3wbL9WmaRbVDB3cBXoNssJFFWyAtXv+ct+DNiE
	 iECoMlXMGzwQwQ27CSswtDOTIqdXZaMQRhd/WRyPrZnwFMZ6RXG5mjwDBKoZOOpz2P
	 Wn59bC7rjNabRqHK4GRUBHw+U6T1XC0VWwnyiqqHaR37O2L4BPUJLu4qY5PBib+Xgo
	 9gO7WLF78L1fw==
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
Subject: [PATCH v6 6/7] platform/x86: asus-wmi: add keyboard brightness event
 handler
Date: Mon, 13 Oct 2025 22:15:34 +0200
Message-ID: <20251013201535.6737-7-lkml@antheas.dev>
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
 <176038667351.3397675.2342453525099003018@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

Currenlty, the keyboard brightness control of Asus WMI keyboards is
handled in the kernel, which leads to the shortcut going from
brightness 0, to 1, to 2, and 3.

However, for HID keyboards it is exposed as a key and handled by the
user's desktop environment. For the toggle button, this means that
brightness control becomes on/off. In addition, in the absence of a
DE, the keyboard brightness does not work.

Therefore, expose an event handler for the keyboard brightness control
which can then be used by hid-asus.

Reviewed-by: Luke D. Jones <luke@ljones.dev>
Tested-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c            | 41 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h | 13 +++++++
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a2a7cd61fd59..58407a3b6d41 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1579,6 +1579,45 @@ void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
 }
 EXPORT_SYMBOL_GPL(asus_hid_unregister_listener);
 
+static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
+
+int asus_hid_event(enum asus_hid_event event)
+{
+	unsigned long flags;
+	int brightness;
+
+	spin_lock_irqsave(&asus_ref.lock, flags);
+	if (!asus_ref.asus || !asus_ref.asus->kbd_led_registered) {
+		spin_unlock_irqrestore(&asus_ref.lock, flags);
+		return -EBUSY;
+	}
+	brightness = asus_ref.asus->kbd_led_wk;
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
+	do_kbd_led_set(&asus_ref.asus->kbd_led, brightness);
+	led_classdev_notify_brightness_hw_changed(&asus_ref.asus->kbd_led,
+						  asus_ref.asus->kbd_led_wk);
+
+	spin_unlock_irqrestore(&asus_ref.lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asus_hid_event);
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
@@ -1878,7 +1917,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
 	asus->kbd_led.brightness_set = kbd_led_set;
 	asus->kbd_led.brightness_get = kbd_led_get;
-	asus->kbd_led.max_brightness = 3;
+	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
 	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
 
 	if (asus->kbd_led_avail)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 1f85d76387a8..e78e0fbccede 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -168,6 +168,14 @@ struct asus_hid_listener {
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
@@ -176,6 +184,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 
 int asus_hid_register_listener(struct asus_hid_listener *cdev);
 void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
+int asus_hid_event(enum asus_hid_event event);
 #else
 static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
 {
@@ -200,6 +209,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
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
2.51.0



