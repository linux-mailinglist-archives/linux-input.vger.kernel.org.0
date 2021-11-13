Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5ED44F529
	for <lists+linux-input@lfdr.de>; Sat, 13 Nov 2021 21:04:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbhKMUHo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 15:07:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbhKMUHn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 15:07:43 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DF6FC061766;
        Sat, 13 Nov 2021 12:04:51 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id t21so11147251plr.6;
        Sat, 13 Nov 2021 12:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Tb74LrSzA8PWHlBbQ2QqZoirlUR2jOkJqwuP2JlwP2g=;
        b=fr2NExjejAaBCjGfUF1PZQ/UEzdEpY12IHDphNFvVXzELU5LQT1rXxsc8B/Wez8kQN
         JVBQGc+eK8ziRSxV0q8O2uai0W85hXj9z6rHl/XQ0bslcahVWRu5jqGBUhR9SJZSPMmN
         86XY4kIhxoWcEQ6BEdwrlJ5i0MMpORjzjR8Is7mmInx1KRsqus4Ccr7b64/Cc/xO8pu7
         8wtTXypOWY1epP+DVM8wsqJRgCVAT2P3nCJoH89TfZ758E3ALc/XawdLvAKkcdJp3HWO
         4G818aaD2Zx0AdhP6zp/OfHEAjDA2bkBagfAFsCvwzxfSFtnCbqKqupq/Ceeu2V7TjYa
         Rgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Tb74LrSzA8PWHlBbQ2QqZoirlUR2jOkJqwuP2JlwP2g=;
        b=Yfm+gLQgzD868vRpjQXsOFU5Su9S41EhL4T4DSCg5p2bx+tkBUagAccGMQlDJU7Li9
         zgdY5Kt9SJXLe9824JW0URLfd/KeBnYLXEkt/+eGYxFmKtImRWJ4CkWUCGZfbRSt8vYw
         rJTeYTrncT1gkhoPPpPHa6acRWAYlaxnzj9DbdioeCeuFu9dJr4VLOYL933WOJzv/jLz
         Sf2OcFr0efoZ/kjrxy8DCmTD6j2DFGAJLApMSg2WPlWYYJVDrVWYjUPa2Ei2jsjZBtnV
         r+tpbZ44YTGF1tde3e/SVdTPyq7Z1q6mRjSmvBPkQyaRP/HggwlSAVEVcw/EqFVvCzbG
         UUng==
X-Gm-Message-State: AOAM533iM1Aq9/OW2UOT+vb+fQjH/V8iFP2KeQqCOmzog+7HQuUiilp9
        5ijCpdj0WvKl3HbVtf5yTZJMu/OIj88=
X-Google-Smtp-Source: ABdhPJxSzOFn3lMaparm0oRAqDqKpnDPf90DElYcRINmAqDZtXL6YFmz0+o+lMheasGAXbtcHJHfeQ==
X-Received: by 2002:a17:902:e8d4:b0:143:88c2:e2c9 with SMTP id v20-20020a170902e8d400b0014388c2e2c9mr20246258plg.12.1636833890966;
        Sat, 13 Nov 2021 12:04:50 -0800 (PST)
Received: from makvihas ([103.85.9.85])
        by smtp.gmail.com with ESMTPSA id h23sm9988328pfn.109.2021.11.13.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 12:04:50 -0800 (PST)
Date:   Sun, 14 Nov 2021 01:34:48 +0530
From:   Vihas Mak <makvihas@gmail.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: thrustmaster: fix sparse warnings
Message-ID: <20211113200448.GA1111164@makvihas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Changed 0 to NULL to fix following sparse warnings:

    drivers/hid/hid-thrustmaster.c:208:43: warning: Using plain integer as NULL pointer
    drivers/hid/hid-thrustmaster.c:241:17: warning: Using plain integer as NULL pointer
    drivers/hid/hid-thrustmaster.c:275:37: warning: Using plain integer as NULL pointer

Signed-off-by: Vihas Mak <makvihas@gmail.com>
---
 drivers/hid/hid-thrustmaster.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index d44550aa8..3a5333424 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -205,7 +205,7 @@ static void thrustmaster_model_handler(struct urb *urb)
 	struct tm_wheel *tm_wheel = hid_get_drvdata(hdev);
 	uint16_t model = 0;
 	int i, ret;
-	const struct tm_wheel_info *twi = 0;
+	const struct tm_wheel_info *twi = NULL;
 
 	if (urb->status) {
 		hid_err(hdev, "URB to get model id failed with error %d\n", urb->status);
@@ -238,7 +238,7 @@ static void thrustmaster_model_handler(struct urb *urb)
 		tm_wheel->usb_dev,
 		usb_sndctrlpipe(tm_wheel->usb_dev, 0),
 		(char *)tm_wheel->change_request,
-		0, 0, // We do not expect any response from the wheel
+		NULL, 0, // We do not expect any response from the wheel
 		thrustmaster_change_handler,
 		hdev
 	);
@@ -272,7 +272,7 @@ static void thrustmaster_remove(struct hid_device *hdev)
 static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	int ret = 0;
-	struct tm_wheel *tm_wheel = 0;
+	struct tm_wheel *tm_wheel = NULL;
 
 	ret = hid_parse(hdev);
 	if (ret) {
-- 
2.25.1

