Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2FD41F30E
	for <lists+linux-input@lfdr.de>; Fri,  1 Oct 2021 19:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355032AbhJAR2C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 1 Oct 2021 13:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhJAR2B (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 1 Oct 2021 13:28:01 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C17C061775;
        Fri,  1 Oct 2021 10:26:16 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id t16-20020a1c7710000000b003049690d882so11792651wmi.5;
        Fri, 01 Oct 2021 10:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBVGTkTXgNf+I009NGAKNedlsjlVh/R09z0MATWKFB0=;
        b=caXeazUXd5njPHi5ApOTJv3irww/GZMFnrIm/rDcJSRL94w8mEhS+kTqPVmqhjem6k
         gLihBl41eB05+TYF5VwKhjRM+HH+UbA6HW5Ehq4IIjkG455/sE0tsTblyNXR+DeGKRIe
         F732lTfvYnhq2Cur+s+yzy0yXIolsl34osgWmVuFGlfeSY6iI//leHKdNtiphp6b8xhh
         JzbX6ElivGLqIh+TCScb/flJ4dOClgTMhIHV5cAqx9ppVCpyYjXwYW+5i0buwsaabKgt
         I9K0Yn4OyEkslrWYplGqGgwojwUJyJAiAhM4buoZSK+Wb2npaqfRZB74KQf6z9ayIf7s
         A09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lBVGTkTXgNf+I009NGAKNedlsjlVh/R09z0MATWKFB0=;
        b=FgQ35YFLRscml1m7b9/uSHw7Dsjtj4i0AjgfMp6of6oYe4elmlWz7K6IEa3wILuwVa
         np/VRx+4Nvs+i/pol81XLjm5Xv5wIKELpl4CcXVdhjHEAhTVS10DIRG3S2jpOWiuTqgh
         w/23SK3xM5uk2ceZEH0hD+vUNrizntaqt8BOSWbaTCz0H6mRloRHRW4mTniUQKtpqeS4
         ejRXlM0df7xiJiEwLkhiS12VSR1DA6Px4SmAVw6iynvXaFYNO20/6nmoXfggr1ml/TnE
         viAT0isqKnJT3L2EZl9sf/tN6VEpol4hAPWntPczHPK1oSeSdZzZ9J2fOtxFla9irfoP
         11Rw==
X-Gm-Message-State: AOAM530uy8qae0fvvE2kiZAYPObgpocOAoPF5qbNnXxmHPBSmS9WHYQ6
        SjVa2b0X/chaIgxBFKQeo5E=
X-Google-Smtp-Source: ABdhPJwuJtw2Ki8S/xlvOe3wP6Y8Td1md7CHW13js6JTcIiQVpmRrrerba3S2CVDW13XQjlYigyZTQ==
X-Received: by 2002:a1c:4455:: with SMTP id r82mr2930053wma.100.1633109174985;
        Fri, 01 Oct 2021 10:26:14 -0700 (PDT)
Received: from localhost.localdomain ([94.73.37.210])
        by smtp.gmail.com with ESMTPSA id x10sm4861974wmk.42.2021.10.01.10.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 10:26:14 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     benjamin.tissoires@redhat.com
Cc:     jikos@kernel.org, rydberg@bitmath.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH] HID: multitouch: disable sticky fingers for UPERFECT Y
Date:   Fri,  1 Oct 2021 19:25:14 +0200
Message-Id: <20211001172513.27822-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When a finger is on the screen, the UPERFECT Y portable touchscreen
monitor reports a contact in the first place. However, after this
initial report, contacts are not reported at the refresh rate of the
screen as required by the Windows 8 specs.

This behaviour triggers the release_timer, removing the fingers even
though they are still present.

To avoid it, add a new class, similar to MT_CLS_WIN_8 but without the
MT_QUIRK_STICKY_FINGERS quirk for this device.

Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/hid/hid-ids.h        |  3 +++
 drivers/hid/hid-multitouch.c | 13 +++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 29564b370341..3706c635b12e 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1276,6 +1276,9 @@
 #define	USB_DEVICE_ID_WEIDA_8752	0xC300
 #define	USB_DEVICE_ID_WEIDA_8755	0xC301
 
+#define USB_VENDOR_ID_WINBOND		0x0416
+#define USB_DEVICE_ID_TSTP_MTOUCH	0xc168
+
 #define USB_VENDOR_ID_WISEGROUP		0x0925
 #define USB_DEVICE_ID_SMARTJOY_PLUS	0x0005
 #define USB_DEVICE_ID_SUPER_JOY_BOX_3	0x8888
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3ea7cb1cda84..e1afddb7b33d 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -193,6 +193,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 /* reserved					0x0014 */
 #define MT_CLS_WIN_8_FORCE_MULTI_INPUT		0x0015
 #define MT_CLS_WIN_8_DISABLE_WAKEUP		0x0016
+#define MT_CLS_WIN_8_NO_STICKY_FINGERS		0x0017
 
 /* vendor specific classes */
 #define MT_CLS_3M				0x0101
@@ -294,6 +295,13 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_WIN8_PTP_BUTTONS |
 			MT_QUIRK_DISABLE_WAKEUP,
 		.export_all_inputs = true },
+	{ .name = MT_CLS_WIN_8_NO_STICKY_FINGERS,
+		.quirks = MT_QUIRK_ALWAYS_VALID |
+			MT_QUIRK_IGNORE_DUPLICATES |
+			MT_QUIRK_HOVERING |
+			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_WIN8_PTP_BUTTONS,
+		.export_all_inputs = true },
 
 	/*
 	 * vendor specific classes
@@ -2120,6 +2128,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_VTL,
 			USB_DEVICE_ID_VTL_MULTITOUCH_FF3F) },
 
+	/* Winbond Electronics Corp. */
+	{ .driver_data = MT_CLS_WIN_8_NO_STICKY_FINGERS,
+		HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_WINBOND, USB_DEVICE_ID_TSTP_MTOUCH) },
+
 	/* Wistron panels */
 	{ .driver_data = MT_CLS_NSMU,
 		MT_USB_DEVICE(USB_VENDOR_ID_WISTRON,
-- 
2.25.1

