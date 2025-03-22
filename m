Return-Path: <linux-input+bounces-11095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E7A6C952
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 11:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942031B6410A
	for <lists+linux-input@lfdr.de>; Sat, 22 Mar 2025 10:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EB822422B;
	Sat, 22 Mar 2025 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JwJsl+9M"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7921C9FE;
	Sat, 22 Mar 2025 10:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742639332; cv=none; b=kPM6oTRzxQJkR4YW6qSKr485JkVuhD/BhfH9tHDlZ86PgX1F8DTq0pIawQ45GPmffI+ZPbOoVTstlx9DDufiNbZuxgFj/WxsAQhZkm1J3rnxLL+Ft8UwaHsggu+nAInDPFX6GW9jKP2svm0cgrKWEWJMJDgzeN7rurPmfnT0psg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742639332; c=relaxed/simple;
	bh=ieGORN0TqJk5Q732Xg+jD645jlreXCLiDv3rbzsDgnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ustTBeAnk0VH1l4Le9HPd4dkuDsvXaBLkEjUrYDcxJzFR2Z7Hsia01lKsjCtxhYSni9tNGf2D86nGr5lNlRHw4C1Wl16bCQWsXJV9ZFlm3Tm2229IBOxKgrSeXrMSxJaifogKJnEeJR9Z1T8wEPQhEGdAY8LaaSptwznA/7CgKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JwJsl+9M; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 6C7202E0874A;
	Sat, 22 Mar 2025 12:28:47 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742639328;
	bh=qUdK7XrrQzaKDCS6/qpxHboH9+3xcFrLTOs4plEtZLE=; h=From:To:Subject;
	b=JwJsl+9M8oJdOEUsZM3g700KwAZLrj0CvJk/OJU/6ypI27jmVVuIMHwpD3GXd6Zg7
	 eo410pdyjxxQPzH1nHGC3viPIXXnvQF5fKM5B37RT08cW7fiQWs0PtGKdZCF3krEHI
	 N6gEEGBjiuIQS9DuMRgqKaDUjKx316hEnztJM1Yo=
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
Subject: [PATCH v3 07/10] platform/x86: asus-wmi: add keyboard brightness
 event handler
Date: Sat, 22 Mar 2025 11:28:01 +0100
Message-ID: <20250322102804.418000-8-lkml@antheas.dev>
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
 <174263932848.19249.2485555568285790978@linux1587.grserver.gr>
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
 drivers/platform/x86/asus-wmi.c            | 39 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h | 11 ++++++
 2 files changed, 50 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 95ef9b1d321bb..5ebe141294ecf 100644
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
+		if (brightness >= 3)
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
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index c513b5a732323..9adbe8abef090 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -162,11 +162,18 @@ struct asus_hid_listener {
 	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
 };
 
+enum asus_hid_event {
+	ASUS_EV_BRTUP,
+	ASUS_EV_BRTDOWN,
+	ASUS_EV_BRTTOGGLE,
+};
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 
 int asus_hid_register_listener(struct asus_hid_listener *cdev);
 void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
+int asus_hid_event(enum asus_hid_event event);
 #else
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
@@ -181,6 +188,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
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
2.48.1


