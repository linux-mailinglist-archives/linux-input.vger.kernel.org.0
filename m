Return-Path: <linux-input+bounces-11040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 354D0A6B074
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 23:11:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3132717510D
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 22:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698F022D4E5;
	Thu, 20 Mar 2025 22:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="dwgFhAw+"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9130322CBE5;
	Thu, 20 Mar 2025 22:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742508588; cv=none; b=qUlY2w80JO6XxK+ns2xwr/SZCW66FOP+3mG8CzJbOS+CQvPgkMnDI7dPxfqVAsvsMZecskBr86pyVNdA0sAFWRewb29u2mLeFsbU3NqBgVpK2oJ/2RnW+cfWXOOPtMNs3Us+O//6JXlOLt1yJrqXluct9PzdJaM8ttaTJMTATdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742508588; c=relaxed/simple;
	bh=b/hut+rSugMwy/fru1rLHovugPT80r6uhymv5UUJ+B0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJXo0OBVmWxYccN/ftKr93+j3WKsEy7GPDFS2aYdNhfbqTkMEqyZ9JaB8a6jnovYZsN4D9+fIYYACSFvJh4vptjubtFcHPMfBlf72DgUOdzON5tWs+kagTSF+GoqJHuj0G8Ia+MkzVItTIEsDM6vG2l7+wuwHFvpn7s8D9WrFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=dwgFhAw+; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 026282E0972E;
	Fri, 21 Mar 2025 00:09:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742508584;
	bh=99yUjEZP5Nq+SzgWfE7KzrE/M5TN0DSSLcXY7LQL/ts=; h=From:To:Subject;
	b=dwgFhAw+s5sIB5AGUye+ErZ8hKUQTE6y840PjKuYuWvdzW56xBkklf3rYGJjX8+Kz
	 W9aFThNMFIL5PfUuJShOJ4quaPB7E7q6sUK9C+07xEJLf3tkSqMO7aBB93VwTIZdqX
	 RSFwDrtaiyWTrtm/kypty3I3iPrVe+2u3hKxAsM4=
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
Subject: [PATCH 08/11] platform/x86: asus-wmi: add keyboard brightness event
 handler
Date: Thu, 20 Mar 2025 23:09:21 +0100
Message-ID: <20250320220924.5023-9-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250320220924.5023-1-lkml@antheas.dev>
References: <20250320220924.5023-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174250858400.26542.2584689086615092229@linux1587.grserver.gr>
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

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/asus-wmi.c            | 38 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h | 11 +++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 21e034be71b2f..45999dda9e7ed 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1529,6 +1529,44 @@ void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
 }
 EXPORT_SYMBOL_GPL(asus_brt_unregister_listener);
 
+static void do_kbd_led_set(struct led_classdev *led_cdev, int value);
+
+int asus_brt_event(enum asus_brt_event event)
+{
+	int brightness;
+
+	mutex_lock(&asus_brt_lock);
+	if (!asus_brt_ref || !asus_brt_ref->kbd_led_registered) {
+		mutex_unlock(&asus_brt_lock);
+		return -EBUSY;
+	}
+	brightness = asus_brt_ref->kbd_led_wk;
+
+	switch (event) {
+	case ASUS_BRT_UP:
+		brightness += 1;
+		break;
+	case ASUS_BRT_DOWN:
+		brightness -= 1;
+		break;
+	case ASUS_BRT_TOGGLE:
+		if (brightness >= 3)
+			brightness = 0;
+		else
+			brightness += 1;
+		break;
+	}
+
+	do_kbd_led_set(&asus_brt_ref->kbd_led, brightness);
+	led_classdev_notify_brightness_hw_changed(&asus_brt_ref->kbd_led,
+						  asus_brt_ref->kbd_led_wk);
+
+	mutex_unlock(&asus_brt_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asus_brt_event);
+
 /*
  * These functions actually update the LED's, and are called from a
  * workqueue. By doing this as separate work rather than when the LED
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index add04524031d8..2ac7912d8acd3 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -162,11 +162,18 @@ struct asus_brt_listener {
 	void (*notify)(struct asus_brt_listener *listener, int brightness);
 };
 
+enum asus_brt_event {
+	ASUS_BRT_UP,
+	ASUS_BRT_DOWN,
+	ASUS_BRT_TOGGLE,
+};
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 
 int asus_brt_register_listener(struct asus_brt_listener *cdev);
 void asus_brt_unregister_listener(struct asus_brt_listener *cdev);
+int asus_brt_event(enum asus_brt_event event);
 #else
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
@@ -181,6 +188,10 @@ static inline int asus_brt_register_listener(struct asus_brt_listener *bdev)
 static inline void asus_brt_unregister_listener(struct asus_brt_listener *bdev)
 {
 }
+static inline int asus_brt_event(enum asus_brt_event event)
+{
+	return -ENODEV;
+}
 #endif
 
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.48.1


