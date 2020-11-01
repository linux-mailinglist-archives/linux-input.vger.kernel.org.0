Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3142A2122
	for <lists+linux-input@lfdr.de>; Sun,  1 Nov 2020 20:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbgKATfA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 1 Nov 2020 14:35:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbgKATe7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 1 Nov 2020 14:34:59 -0500
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADFA5C061A04
        for <linux-input@vger.kernel.org>; Sun,  1 Nov 2020 11:34:57 -0800 (PST)
Received: by mail-qv1-xf49.google.com with SMTP id k15so7090053qvx.4
        for <linux-input@vger.kernel.org>; Sun, 01 Nov 2020 11:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=DM2UgOFHo//AreOdqVZsv1HPnyLVmD2DIdKtCbtXmYA=;
        b=ZWlo6i8pByXuvu/W5xwIqRNrp02RjTcy6fs1WXz4lb088GeG5aAxmIF6HYpmSUeqUE
         VYiWOgorbVJFuuUxFWSiffbM0uwP9ZlEN/7vTinE+KBZUzL43+a75+GbapbheZKLPTuV
         aoQ0hl5v88dl8pJo4VOA16glqkFqC3jYH8K6tUnHzbpzLVa+gjIYGY43i3Vy8w+TH2Ac
         q08snefMOKLzQBybL1/XyrzQX/T47YO6IeB3GP45N8jWmVjVJP1Is2fl+SstuyrcGYfq
         ZvCPDXiiTvomnPHJyJTwz8WFhmeNM20Xg7p0ciVUKzW8tyGKPDR6RtC8KT4Sd0PTWh6U
         tHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=DM2UgOFHo//AreOdqVZsv1HPnyLVmD2DIdKtCbtXmYA=;
        b=FvzGUd0xBey70FkkCb4FhC/BxS7bIhOKmx7MuIoKQWFX4ZenSBLd8f/mqgIND0RUyB
         CvvCmHp0e6vxSpJSBhcCO9A23ZutA+FbTGyeATj8SJc6C0Pi8/nMqUayd6JtknAYNJXn
         ayNDAdJzJ3sHIKmyRCvMm2GzPpDj3rkDqT+dRK2lYpJilcxnEertHo/Ig8esGsp+S3G7
         Fk2aMrAguhgDCE2eHA2136CujeOpT9gp1kFhF9X/mtodEZFnWX400tldMDQR7MsYCQOB
         iZpB6KesZf3e0PxbpZ1d/8P5DB5iDKC2C7xtYKDRPjJoK7Rrq73jB+TAB+yuChDHwrs0
         hFqg==
X-Gm-Message-State: AOAM530PJzh8LyPCPf4iYgNQyMykWK52n5R5BJn5dHOnihRtzqsxbY8q
        deGcyCarb36LJd98L/XM8Xa4XO2w
X-Google-Smtp-Source: ABdhPJx+EM0OMqEKs/YANufilv5FfCCGwb5G5Irp+1EvX/6RxEykc8+GLVWJmxHwsxfmokGmcH+ld+QC
Sender: "lzye via sendgmr" <lzye@chrisye.mtv.corp.google.com>
X-Received: from chrisye.mtv.corp.google.com ([2620:15c:211:2:f693:9fff:fef4:4323])
 (user=lzye job=sendgmr) by 2002:ad4:4142:: with SMTP id z2mr19470484qvp.20.1604259296760;
 Sun, 01 Nov 2020 11:34:56 -0800 (PST)
Date:   Sun,  1 Nov 2020 11:34:52 -0800
Message-Id: <20201101193452.678628-1-lzye@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [PATCH v2] Input: Add devices for HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE
From:   Chris Ye <lzye@google.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-kernel@vger.kernel.org, trivial@kernel.org,
        linux-input@vger.kernel.org, linzhao.ye@gmail.com,
        Chris Ye <lzye@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Kernel 5.4 introduces HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, devices
need to be set explicitly with this flag.

Signed-off-by: Chris Ye <lzye@google.com>
---
 drivers/hid/hid-ids.h    | 4 ++++
 drivers/hid/hid-quirks.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 74be76e848bf..cf55dca494f3 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -449,6 +449,10 @@
 #define USB_VENDOR_ID_FRUCTEL	0x25B6
 #define USB_DEVICE_ID_GAMETEL_MT_MODE	0x0002
 
+#define USB_VENDOR_ID_GAMEVICE	0x27F8
+#define USB_DEVICE_ID_GAMEVICE_GV186	0x0BBE
+#define USB_DEVICE_ID_GAMEVICE_KISHI	0x0BBF
+
 #define USB_VENDOR_ID_GAMERON		0x0810
 #define USB_DEVICE_ID_GAMERON_DUAL_PSX_ADAPTOR	0x0001
 #define USB_DEVICE_ID_GAMERON_DUAL_PCS_ADAPTOR	0x0002
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 0440e2f6e8a3..36d94e3485e3 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -84,6 +84,10 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FREESCALE, USB_DEVICE_ID_FREESCALE_MX28), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_FUTABA, USB_DEVICE_ID_LED_DISPLAY), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_GREENASIA, USB_DEVICE_ID_GREENASIA_DUAL_USB_JOYPAD), HID_QUIRK_MULTI_INPUT },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_GV186),
+		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_GAMEVICE, USB_DEVICE_ID_GAMEVICE_KISHI),
+		HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_DRIVING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FIGHTING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_HAPP, USB_DEVICE_ID_UGCI_FLYING), HID_QUIRK_BADPAD | HID_QUIRK_MULTI_INPUT },
-- 
2.29.1.341.ge80a0c044ae-goog

