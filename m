Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8A15F5A1D
	for <lists+linux-input@lfdr.de>; Wed,  5 Oct 2022 20:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiJESvj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Oct 2022 14:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229774AbiJESvi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Oct 2022 14:51:38 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE0F6B8E5
        for <linux-input@vger.kernel.org>; Wed,  5 Oct 2022 11:51:37 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b4so20303772wrs.1
        for <linux-input@vger.kernel.org>; Wed, 05 Oct 2022 11:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=wF5bNPXQn5f+v1FMf7+hCwm+T7o8jqjGjlTOS1sYvqs=;
        b=F0Y7lKNUqhSu3YEGcWSGffVPsYw1lP2HeC4mfjZoJwxGXcMLX6mnAtgJHWoIpO5Ahj
         dqDo87nGhIDvyYO4zkEk9cLG+YOm8MPYnq/2zcs3vPSA1c6bXy5RTTzMcj0XwqtBfddk
         rIvyFGnHFbs8fFy7dJOqJ1koyC0Fko1y/comXGoDRVc7baTbSFafQpUa0EFueIeD0qOi
         Vh3YCjtggpwgKqvcWPymvDjtWO/AkCXTevy1/6gajBle8ForMXG32pdvPJQ5upsaI0vv
         ZjuHg23yHMd/4qu87/rmcwceXPUE7FH5k83b5KmZjNJSAXJ5EZIk5kyOwXsalY35WzyQ
         CsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=wF5bNPXQn5f+v1FMf7+hCwm+T7o8jqjGjlTOS1sYvqs=;
        b=jJGQIKgqC2JXVGDJCdxIiW4hsXzGcXk4E7jv4VqjL26JZkKbNK900IlzgMZCGtwPFN
         teZnfeXhCIiWWnzIqlyOvVJr0H8FgBtWsp1rxHwUT6HlO6kGXX1831d2AcG4C6VqfZLs
         rYJ9HSxwoxxqIeetcKInA/L34uN6RA6qqQL3JdssnaEiwB7x4cYT88ROtexMUbIEqKF3
         ZPJBDAdegSj3UhSgIkF34xEkFZ+KdsRv2GYdj5FBpHjr9++srgTeEziAeJ1/dqzXdHsk
         HwipzMoWh7gy0gp/X0nz1BgJ2VJU5nX8mZm9lAYqA1w/JH8yBGMJ67UPlAR53gM/14Ep
         dkaA==
X-Gm-Message-State: ACrzQf030apD3CywVTQHv8/F9Mqkd2/PVMtQYQLenrriFp5EeOsXB5aD
        CDNtRe+fRFY3hmHvNLIclgt3N7dvAxMRbQ==
X-Google-Smtp-Source: AMsMyM7YISPvvcOQrDoyBYxEEZeucOjmG6g264t6oKR89jyGIG9g1+uzFIMPc3O62jJUMztk6I9llA==
X-Received: by 2002:adf:eb4c:0:b0:22b:24d5:3786 with SMTP id u12-20020adfeb4c000000b0022b24d53786mr685927wrn.550.1664995896125;
        Wed, 05 Oct 2022 11:51:36 -0700 (PDT)
Received: from d1.cmb.bingbong.tech ([95.148.23.155])
        by smtp.gmail.com with ESMTPSA id f13-20020adfe90d000000b0022e57e66824sm5121554wrm.99.2022.10.05.11.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 11:51:35 -0700 (PDT)
From:   Samuel Bailey <samuel.bailey1@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     Samuel Bailey <samuel.bailey1@gmail.com>
Subject: [PATCH] HID: saitek: add madcatz variant of MMO7 mouse device ID
Date:   Wed,  5 Oct 2022 19:51:23 +0100
Message-Id: <20221005185123.22219-1-samuel.bailey1@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MadCatz variant of the MMO7 mouse has the ID 0738:1713 and the same
quirks as the Saitek variant.

Signed-off-by: Samuel Bailey <samuel.bailey1@gmail.com>
---
 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 drivers/hid/hid-saitek.c | 2 ++
 3 files changed, 4 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index f80d6193fca6..0df74aafaf1b 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -867,6 +867,7 @@
 #define USB_DEVICE_ID_MADCATZ_BEATPAD	0x4540
 #define USB_DEVICE_ID_MADCATZ_RAT5	0x1705
 #define USB_DEVICE_ID_MADCATZ_RAT9	0x1709
+#define USB_DEVICE_ID_MADCATZ_MMO7  0x1713
 
 #define USB_VENDOR_ID_MCC		0x09db
 #define USB_DEVICE_ID_MCC_PMD1024LS	0x0076
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 70f602c64fd1..50e1c717fc0a 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -620,6 +620,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_MMO7) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_RAT5) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_RAT9) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_MMO7) },
 #endif
 #if IS_ENABLED(CONFIG_HID_SAMSUNG)
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAMSUNG, USB_DEVICE_ID_SAMSUNG_IR_REMOTE) },
diff --git a/drivers/hid/hid-saitek.c b/drivers/hid/hid-saitek.c
index c7bf14c01960..b84e975977c4 100644
--- a/drivers/hid/hid-saitek.c
+++ b/drivers/hid/hid-saitek.c
@@ -187,6 +187,8 @@ static const struct hid_device_id saitek_devices[] = {
 		.driver_data = SAITEK_RELEASE_MODE_RAT7 },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SAITEK, USB_DEVICE_ID_SAITEK_MMO7),
 		.driver_data = SAITEK_RELEASE_MODE_MMO7 },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_MMO7),
+		.driver_data = SAITEK_RELEASE_MODE_MMO7 },
 	{ }
 };
 
-- 
2.37.3

