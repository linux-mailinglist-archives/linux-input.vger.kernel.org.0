Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240B4465E28
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 07:17:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhLBGUz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 01:20:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbhLBGUy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Dec 2021 01:20:54 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EC21C061748
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 22:17:31 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id nn15-20020a17090b38cf00b001ac7dd5d40cso3781707pjb.3
        for <linux-input@vger.kernel.org>; Wed, 01 Dec 2021 22:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Csl63fRf1TquKhILndInZ4fFylaHk+NhQgJgwRqhuTI=;
        b=R/5jpbCFDHhYKUwXyRXqAn3Y02+uYCNSTUG3+c38Z4X7IMOB5MOPBPv4UfhAQPfp2B
         LXeluFNVoyLBPS9L4LgP1CUmwr1/snaR/20j0x5f4NvBTzE99CQhcOPnM57hYhCxQlsI
         Q22ky2XTUY7CdIptbbWRvj8/1fR1WQBzHI5A0JowoDtBpgva+zwoj9YfRNwYSP6+KjKd
         h9ztv0F8RtT5ICcuti5+FllJhDPuCUw/W3nY3sotFC8MPmhRbXy+fcSpX3lS5cVKGynH
         kGvSskbuU2qoExNYtKU6win8jGg0si0dmXa6SiAcC/q1Qm3z3MCBfNUxjYy/G39izqg3
         jsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Csl63fRf1TquKhILndInZ4fFylaHk+NhQgJgwRqhuTI=;
        b=P4yOtEMxFLjpzBdPgE7D34opR35egt8pcY+W+jxBo8j6tj4b5rcOxu5KWxsgr5R8ST
         wgQiXhPAXILLqbwAEfrpKMMF9cLC7+MqiP1Tt1SvXpCB8Bt48yV+lTFmsSjJR+neJcPu
         2cFaEzf5ptznNGupOWAoyrZiFrosEvWVQHa3bjl+xofrTRTHs2yIPlPaPCOjs1U5RIAp
         E0b/bQh634beuq+DECGluEcOigx5+7ulJl5u+jJUhzWSfyxleXFGMMTugQtK1e8JvDfr
         B2CGA6X2BPqgLfT6s0zLIKSFyASF0ltef47XvXfZk8HXGpuaGLMNsdz7tBG7YbnpXEBD
         aFQA==
X-Gm-Message-State: AOAM532y1YOWEep3lncSq4yBxbB9vDye3P9i2vqsxmOEe67HEbZzrCa7
        WtGf47Os4R4rZy2PvO6mFZxdMpM1UTw=
X-Google-Smtp-Source: ABdhPJwVNJqAFvVc925j2mXEbq/ReJsycdHYN9QtLv/BV3TbeJp9mKebVZbuf961al1fLOZT89Vn2g==
X-Received: by 2002:a17:90a:c286:: with SMTP id f6mr3781183pjt.45.1638425850663;
        Wed, 01 Dec 2021 22:17:30 -0800 (PST)
Received: from xavier.lan ([166.70.246.164])
        by smtp.gmail.com with ESMTPSA id x33sm1663763pfh.133.2021.12.01.22.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 22:17:30 -0800 (PST)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin@sipsolutions.net, bberg@redhat.com,
        jose.exposito89@gmail.com
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH 2/2] HID: apple: Add 2021 Magic Keyboard with number pad
Date:   Wed,  1 Dec 2021 23:16:51 -0700
Message-Id: <20211202061651.115548-2-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211202061651.115548-1-alexhenrie24@gmail.com>
References: <20211202061651.115548-1-alexhenrie24@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c | 4 ++++
 drivers/hid/hid-ids.h   | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index b2d8bcd86bd5..5eda7a0d0575 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -644,6 +644,10 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 
 	{ }
 };
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 8c70a731ef46..16fbcdab2ae2 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -176,6 +176,7 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 
 #define USB_VENDOR_ID_ASUS		0x0486
 #define USB_DEVICE_ID_ASUS_T91MT	0x0185
-- 
2.34.1

