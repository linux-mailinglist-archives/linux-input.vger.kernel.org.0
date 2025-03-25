Return-Path: <linux-input+bounces-11268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06897A709A1
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F63C173008
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5341F4C9D;
	Tue, 25 Mar 2025 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="iawzJkLS"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61271F4617;
	Tue, 25 Mar 2025 18:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742928383; cv=none; b=VXKJ2X8nFB1j0jN6CHS03JIzntCW6fQ1Gb8sLcC5vykVFh4UFV0AskXEgS4Zvd6MPEroNzOUHZ0vNgrDmuCksNYNRPv7ZFhbkdRrHbpFX9x/cT7zrmtfJJG/dG76i9m/KNls4RhphCfOvDrX2zQzvAcUYcDhJZoAF2+UiD3jVIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742928383; c=relaxed/simple;
	bh=ofdGTVEAizFyb+v62EJLhjDSJukU7zB6uRDywz75jCU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LBEHS9oN9r8h5HxaOU6nGJ4Bl25a+3YhRBV7DFOrftSdMKPJw5lZwuNDBDWZw9Z6M+kTR+UjgayttDLnsoAlnJ6qh4Kh4Z9wqjXytsTjr9nMeXAXmShDwVFcuR5OGfwdr8PuyiTbdIcOqi+pyNGvGqjOBXKE7E+FaYfcJHLyJ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=iawzJkLS; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id A47D42E098A8;
	Tue, 25 Mar 2025 20:46:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742928379;
	bh=d4QiFVK4WmmwBkzG9Qr6f4R+trwulmtOg5R193riJSc=; h=From:To:Subject;
	b=iawzJkLSsNZ8t4TKpfegHpa4stK9sKIwNZw9JzJye5kDfYpYtilSgq8Z3+rw0qWU8
	 e1gas21LeeQDFqA7PJrVFnyuHDa6qfhu6wIpd/QqJeG3XJ4ukhc6FEUtqyEndQZdkW
	 J9TVlBI2bMQOrXMwE1hFh5cDT9Aq+foV/rlRlBMg=
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
Subject: [PATCH v5 07/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
Date: Tue, 25 Mar 2025 19:45:56 +0100
Message-ID: <20250325184601.10990-8-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325184601.10990-1-lkml@antheas.dev>
References: <20250325184601.10990-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174292837969.8136.13505508897574718102@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
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
index ff1d7ccb3982f..64185e3f55000 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1536,6 +1536,45 @@ void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
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
@@ -1835,7 +1874,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
 	asus->kbd_led.brightness_set = kbd_led_set;
 	asus->kbd_led.brightness_get = kbd_led_get;
-	asus->kbd_led.max_brightness = 3;
+	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
 	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
 
 	if (asus->kbd_led_avail)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index c513b5a732323..b051cd089c6d0 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -162,11 +162,20 @@ struct asus_hid_listener {
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
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 
 int asus_hid_register_listener(struct asus_hid_listener *cdev);
 void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
+int asus_hid_event(enum asus_hid_event event);
 #else
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
@@ -181,6 +190,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
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
2.49.0


