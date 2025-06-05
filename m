Return-Path: <linux-input+bounces-12725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6FACF7AA
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 21:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14E661898095
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 19:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8AAC4315A;
	Thu,  5 Jun 2025 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLl2Zom7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F132F4400
	for <linux-input@vger.kernel.org>; Thu,  5 Jun 2025 19:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749150923; cv=none; b=YHgKwmxqm4xIzsSfF/+JXQS8OpOv0s+TFZsNx0iq52e1hZfOD9oT15tkb+iLlv+lqc9lpDwjdNTPtXCZEJKSE2BxgqW0GuNkQmFnIcDXU5opNNJj3WctsRN3Zt2rU9A8n95JfPifg0t+ULBjr0O6FBQuQGBEsTlXjORZw0oeYYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749150923; c=relaxed/simple;
	bh=vi6826HAvAEVFlcFJOKLqPQgcXG7+lR8MaUCpQIf/Z0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jpz31Likyu1fQ9/v162r658eiRiYKGO5zf9/FEAapQp+PsJnPumJS8EiFnYpvtpgnibl5Q0NgW4aUBcI0CbvEpSoygUjysfzInZVyJ9A206cTTDkZiAZhiYx2wSdGjk+5wVo/CdUy9QtO8AbFuz4z9r0sLrZgRjXPOJfpMNxSlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLl2Zom7; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-7d09b0a5009so133507785a.1;
        Thu, 05 Jun 2025 12:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749150921; x=1749755721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=32Lc6xTqa6UVxntLMAqTZCt/YgsBgrc+HSZxnQQRKrg=;
        b=QLl2Zom7/TXTahuD+jjc5ZlGL+3hfDx34nQDjArMweAF681s3WG/k9hm6JZYS4f7ku
         Ax63g6yhLYZxFCfyM/8GRSkMAAv5TRNmFl3C6rU10ctrDASLOUEHa0izXUx1Bq11WD6c
         LIvr90cuLG5JSx2nZw3snJwcp1qK8tAa4/J8hv2plV/vnkHAq68fYvComfx+bJlpcWY+
         2TlgdorPArYBqHkt1c63HD2UfaqA1F6mmtVSwX8hwBIKTIhrNfGXKabFIUJPHnecpFEB
         GMLFS+IfOaAZuiaGeEC5YQlNstaJAQvEOSEdkb1LSRln9TlwbjiBeoZuvR2Zta5pMX2J
         BGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749150921; x=1749755721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32Lc6xTqa6UVxntLMAqTZCt/YgsBgrc+HSZxnQQRKrg=;
        b=j2T1ujDNk9Xrd4pLTK+n9wRjVz9l4+AlL5Kl2zuQWKlNbAnz6x464rltzAdcsqG1L+
         1ERhUwnOdxsDwG7u04TuEhx6pQpmf9kmTbMjMnNs5p44UviFrpPNhGvTlKB45gz5EeHz
         bA6rL14Yw6PC0wAcJUdcUQSTG0HD1MWI4ySrD7lIdN2JRSulKhCjR6x4jO/RF95NHnFf
         ppZ6kR0HrGDAN0tI8v7wl/GEvpHNMt92BMwJE9uvb+5a7tDdNASrAIAAonKmLBfT+MY0
         dxJM7asY/NSRWKnkKiw6BY/eVcvP2GnF1UidPuyxlAirMaSfrUbYtYlF2+U80DBp3uHl
         tazg==
X-Gm-Message-State: AOJu0YyjhCiA97rgY3I/T38CstOaCbJ3cLzpwBV3IbY60gJ9OPD5E9fw
	smlXlMtJ9b08lasRfBqR1xC+iNrOyWsaR2uZQ9DMnW0EZAMMPJnPMUg3H4mN57jsxOxMOQ==
X-Gm-Gg: ASbGnct408ujyJHSxwextKGnj9S9UNfpaV7Qh6IQ/zopkjYSPMog1spEaYZjItZQYWK
	8C0vW4HHM6iyMOylUH1ktLkgaCEEm4WkQmrn7W5HxuaCd4Q7pWAKGd9BGBB4uPbS/qZ7nlCHBLy
	B+OAdFpjHTpgIaVdtcRG90LeLs+9hhRWpzmTzVDNFFoigmZgQ6PxZE82diTW1e0DtdKRxh8Xz7/
	7mKC1KyeyYMsa0pVzGRUL08RB4906hGB1SjoNwpgYGIThSfqTBemwN414dWgc/5d0vNNcTJaw3A
	Y3fk1t4N2z6E6+I5bCLFv8tW17vlZjIa8UXS3Me/rshBro1PeAThFE2nKM8HrZEsMWdXfzppTno
	PrzYk0hq4/Ajc3yXAC8jA2qtlEf3OuXf2XKNfkT3OBApCZ+G+EqMKpRwHglsZXrKyQezqIHjmkI
	yU65PrbNDTJN9yGSV6c2HDAk5jxrebVa5J8muOemY=
X-Google-Smtp-Source: AGHT+IFGHHV91C/jrYOMcEhJ+WXKNO+wYAT5iT0xCJNjpxh1ueopi4PeDSlY5V1GeY/ByOWg1lgOVA==
X-Received: by 2002:a05:6214:c45:b0:6fa:fddf:7343 with SMTP id 6a1803df08f44-6fb08f612b5mr10126496d6.23.1749150919231;
        Thu, 05 Jun 2025 12:15:19 -0700 (PDT)
Received: from 585df118d32e.us-east4-a.c.codatalab-user-runtimes.internal (207.202.86.34.bc.googleusercontent.com. [34.86.202.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fafa9c43adsm32802826d6.31.2025.06.05.12.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 12:15:18 -0700 (PDT)
From: Chrispin-m <mainamohlancer@gmail.com>
X-Google-Original-From: Chrispin-m <mwangi.wachira2019@students.jkuat.ac.ke>
To: linux-input@vger.kernel.org
Cc: lkml@vger.kernel.org,
	Wachira Crispine Mwangi <76584088+Chrispin-m@users.noreply.github.com>,
	Chrispin-m <mwangi.wachira2019@students.jkuat.ac.ke>
Subject: Update autosuspend\_check to prevent external USB mouse from auto-suspending and causing unresponsive, jerky input
Date: Thu,  5 Jun 2025 19:15:18 +0000
Message-Id: <20250605191518.27901-1-mwangi.wachira2019@students.jkuat.ac.ke>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wachira Crispine Mwangi <76584088+Chrispin-m@users.noreply.github.com>

The problem occurs with an external USB mouse that experiences frequent and permanent auto-suspend, leading to unresponsive behavior and non-smooth movement/clicking. This is caused by the USB autosuspend mechanism suspending the mouse too aggressively, even when it's in use.

The solution involves modifying the autosuspend_check function in the USB core driver to prevent autosuspend for HID mouse devices. By identifying mouse interfaces (USB_CLASS_HID with USB_INTERFACE_PROTOCOL_MOUSE) and returning -EBUSY, we ensure these devices remain active, eliminating the suspend/resume latency that causes the issues.

Signed-off-by: Chrispin-m <mwangi.wachira2019@students.jkuat.ac.ke>
---
 drivers/usb/core/driver.c | 127 +++++++++++++++++++++-----------------
 1 file changed, 69 insertions(+), 58 deletions(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 460d4dde5994..139cfbf1b6f1 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -1886,66 +1886,77 @@ void usb_autopm_get_interface_no_resume(struct usb_interface *intf)
 }
 EXPORT_SYMBOL_GPL(usb_autopm_get_interface_no_resume);
 
-/* Internal routine to check whether we may autosuspend a device. */
+/*
+ * Modification: Added check for HID mouse interfaces to prevent autosuspend.
+ * Problem: External mouse experiences frequent/permanent autosuspend and non-smooth movement.
+ * Solution: Return -EBUSY when a HID mouse interface is found to block autosuspend.
+ */
 static int autosuspend_check(struct usb_device *udev)
 {
-	int			w, i;
-	struct usb_interface	*intf;
-
-	if (udev->state == USB_STATE_NOTATTACHED)
-		return -ENODEV;
-
-	/* Fail if autosuspend is disabled, or any interfaces are in use, or
-	 * any interface drivers require remote wakeup but it isn't available.
-	 */
-	w = 0;
-	if (udev->actconfig) {
-		for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
-			intf = udev->actconfig->interface[i];
-
-			/* We don't need to check interfaces that are
-			 * disabled for runtime PM.  Either they are unbound
-			 * or else their drivers don't support autosuspend
-			 * and so they are permanently active.
-			 */
-			if (intf->dev.power.disable_depth)
-				continue;
-			if (atomic_read(&intf->dev.power.usage_count) > 0)
-				return -EBUSY;
-			w |= intf->needs_remote_wakeup;
-
-			/* Don't allow autosuspend if the device will need
-			 * a reset-resume and any of its interface drivers
-			 * doesn't include support or needs remote wakeup.
-			 */
-			if (udev->quirks & USB_QUIRK_RESET_RESUME) {
-				struct usb_driver *driver;
-
-				driver = to_usb_driver(intf->dev.driver);
-				if (!driver->reset_resume ||
-						intf->needs_remote_wakeup)
-					return -EOPNOTSUPP;
-			}
-		}
-	}
-	if (w && !device_can_wakeup(&udev->dev)) {
-		dev_dbg(&udev->dev, "remote wakeup needed for autosuspend\n");
-		return -EOPNOTSUPP;
-	}
-
-	/*
-	 * If the device is a direct child of the root hub and the HCD
-	 * doesn't handle wakeup requests, don't allow autosuspend when
-	 * wakeup is needed.
-	 */
-	if (w && udev->parent == udev->bus->root_hub &&
-			bus_to_hcd(udev->bus)->cant_recv_wakeups) {
-		dev_dbg(&udev->dev, "HCD doesn't handle wakeup requests\n");
-		return -EOPNOTSUPP;
-	}
-
-	udev->do_remote_wakeup = w;
-	return 0;
+    int            w, i;
+    struct usb_interface    *intf;
+
+    if (udev->state == USB_STATE_NOTATTACHED)
+        return -ENODEV;
+
+    /* Fail if autosuspend is disabled, or any interfaces are in use, or
+     * any interface drivers require remote wakeup but it isn't available.
+     */
+    w = 0;
+    if (udev->actconfig) {
+        for (i = 0; i < udev->actconfig->desc.bNumInterfaces; i++) {
+            intf = udev->actconfig->interface[i];
+
+            /* don't need to check interfaces that are
+             * disabled for runtime PM.  Either they are unbound
+             * or else their drivers don't support autosuspend
+             * and so they are permanently active.
+             */
+            if (intf->dev.power.disable_depth)
+                continue;
+            if (atomic_read(&intf->dev.power.usage_count) > 0)
+                return -EBUSY;
+            w |= intf->needs_remote_wakeup;
+
+            /* Don't allow autosuspend if the device will need
+             * a reset-resume and any of its interface drivers
+             * doesn't include support or needs remote wakeup.
+             */
+            if (udev->quirks & USB_QUIRK_RESET_RESUME) {
+                struct usb_driver *driver;
+
+                driver = to_usb_driver(intf->dev.driver);
+                if (!driver->reset_resume ||
+                        intf->needs_remote_wakeup)
+                    return -EOPNOTSUPP;
+            }
+
+            /* Begin change: Prevent autosuspend for HID mouse interfaces */
+            if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_HID &&
+                intf->cur_altsetting->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_MOUSE) {
+                return -EBUSY;
+            }
+            /* End change */
+        }
+    }
+    if (w && !device_can_wakeup(&udev->dev)) {
+        dev_dbg(&udev->dev, "remote wakeup needed for autosuspend\n");
+        return -EOPNOTSUPP;
+    }
+
+    /*
+     * If the device is a direct child of the root hub and the HCD
+     * doesn't handle wakeup requests, don't allow autosuspend when
+     * wakeup is needed.
+     */
+    if (w && udev->parent == udev->bus->root_hub &&
+            bus_to_hcd(udev->bus)->cant_recv_wakeups) {
+        dev_dbg(&udev->dev, "HCD doesn't handle wakeup requests\n");
+        return -EOPNOTSUPP;
+    }
+
+    udev->do_remote_wakeup = w;
+    return 0;
 }
 
 int usb_runtime_suspend(struct device *dev)
-- 
2.34.1


