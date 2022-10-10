Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 160585FA6E7
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 23:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbiJJVXX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 17:23:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiJJVXW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 17:23:22 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA1C6BCEC
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 14:23:21 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id i6so11819031pfb.2
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 14:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05se/QLxbcZC/U9SJgyBO6TtEpzcC1Jq7/S8OolD1VM=;
        b=vYbM3FK0M1aBaoDw/yrM2w99gA9UTV4/QsqC2J09tWJdCRkxIx/nTYOuTls2kVOzhu
         2uN45IID81baR/CrTPTBS4veUGoTeNWUTRg0EROk+A0zEOy2KZXydCXaWMAL9g9SsuRh
         Hvnv1zPcSYyUgG6EE37POeo1Qn9Tf5inrciM+tOHmw6zskygEegZ5q7m0Bd4G7YglwNE
         XLDAh1r/Y9D37iC2OEbziocGFEPJADhl7r6GytrfOURW+qtwRvU3GW4pLkp9IdwHUL5N
         aNa0fxNcmybxU1jQS8nXX52BG+tXI0MoDcyF2G+5nR+3HhxfQaCnnd6b9Dz9Es5ODOuF
         QQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05se/QLxbcZC/U9SJgyBO6TtEpzcC1Jq7/S8OolD1VM=;
        b=BtD4NekD8n+tQ1G4FCt7YmZTiRGB0lz+4c2igz/CdF40IIlkAqb9ef6fXTvY1ysV73
         X/+F7WUrUvHOfkat62u8np5L6kml+PoMYYFVoC5x32SHsCpz/9TYkYRYh6JaG2HojiY3
         FjQp8dwrZOwnIdSM00tFNzFLXFG8xoA9xgDzKs174NM7879bU8yk7EW5w41zrv4sDKNf
         Sr2KZK8vuRKQpEDxg+1SeNMEge4OTb6F8yXJrJQC4fJE3fdeah3NvxZQkh5yOcJYiI8F
         MiDq0W3nyj8fKBfvah9a79aSFE2+yUIN7LWlt9irPFFrSX9q7Yr66iPon+zkYZxksBtg
         yd/w==
X-Gm-Message-State: ACrzQf2lJ038gjBfnQFc0I4ie1heZpr/lJr2gKTOxkfc6q1puxScM5y3
        ZsvtJCZEuqRw+vbftL8/WEUn6PhDTIL9tg==
X-Google-Smtp-Source: AMsMyM4eOT4VO2Riqb39WbsITGdk0C8AcDEeaV++aLAq+dNy9cyapR4gaVHM6JfrkBj5Lq+ijEy5BQ==
X-Received: by 2002:a63:d709:0:b0:461:be56:507e with SMTP id d9-20020a63d709000000b00461be56507emr8151215pgg.597.1665437001518;
        Mon, 10 Oct 2022 14:23:21 -0700 (PDT)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id d17-20020a621d11000000b0054097cb2da6sm7383876pfd.38.2022.10.10.14.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 14:23:20 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        stable@vger.kernel.org
Subject: [PATCH v2 2/3] HID: playstation: add initial DualSense Edge controller support
Date:   Mon, 10 Oct 2022 14:23:12 -0700
Message-Id: <20221010212313.78275-3-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010212313.78275-1-roderick.colenbrander@sony.com>
References: <20221010212313.78275-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Provide initial support for the DualSense Edge controller. The brings
support up to the level of the original DualSense, but won't yet provide
support for new features (e.g. reprogrammable buttons).

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
CC: stable@vger.kernel.org
---
 drivers/hid/hid-ids.h         | 1 +
 drivers/hid/hid-playstation.c | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index f80d6193fca6..cd8087ed412c 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1142,6 +1142,7 @@
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_2	0x09cc
 #define USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE	0x0ba0
 #define USB_DEVICE_ID_SONY_PS5_CONTROLLER	0x0ce6
+#define USB_DEVICE_ID_SONY_PS5_CONTROLLER_2	0x0df2
 #define USB_DEVICE_ID_SONY_MOTION_CONTROLLER	0x03d5
 #define USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER	0x042f
 #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER		0x0002
diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index d727cd2bf44e..396356b6760a 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -1464,7 +1464,8 @@ static int ps_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto err_stop;
 	}
 
-	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
+	if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER ||
+		hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
 		dev = dualsense_create(hdev);
 		if (IS_ERR(dev)) {
 			hid_err(hdev, "Failed to create dualsense.\n");
@@ -1499,6 +1500,8 @@ static void ps_remove(struct hid_device *hdev)
 static const struct hid_device_id ps_devices[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER) },
+	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, ps_devices);
-- 
2.37.3

