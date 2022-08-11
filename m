Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E422158F63A
	for <lists+linux-input@lfdr.de>; Thu, 11 Aug 2022 05:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233896AbiHKDAL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Aug 2022 23:00:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbiHKC75 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Aug 2022 22:59:57 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4BE8B997
        for <linux-input@vger.kernel.org>; Wed, 10 Aug 2022 19:58:52 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id p18so15872614plr.8
        for <linux-input@vger.kernel.org>; Wed, 10 Aug 2022 19:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc;
        bh=FanHt6WQP4NmLyUB3d1OkhI4bOP5Oviwv4Y0DSe/VWQ=;
        b=H4oeZC06TwA9/XuttKLwNTgeswONrKea67HF/xbp8TBAdztgvZWgIEEDJrQRmYC76R
         uieU3KnBmYrtsndL5/yfhxjBnldpGVMlFwRBD3hDC1PKbQzLyWi00WsBL6TYlAyAAeN2
         ly8l9quZdBO0b7TUmX8p+6GiXmSmFhX7YA/19GQ2bhBUVuoqXD/KpKkqQpRcRSGXjXeF
         DR98JAFf2EuSBK4BcUAcDNadURntrV2TjzsIejS3HG6TRW+BDjE4NjrryzOr+YmcY9zd
         ICeiVNN2zp9Gv+UeEyWtpC59hW4AdS6AHA4oGsNy5NfWfamPQSZDh67YbR4glxWBErZ/
         HJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FanHt6WQP4NmLyUB3d1OkhI4bOP5Oviwv4Y0DSe/VWQ=;
        b=NkfzAa2E89lEIDjXpZAjqkJfQtnobfJz0n2EsMJ1c5ze3w1rTUx9qteRQ3ps8ffKzk
         uvxeid/jCZK3AYBTM34oXB/3GA67dTkbGGRgEFjXmoHkPXCzdr/oWfmaZFki9PuuRPLW
         +NrjMIUMl5/3FGvpNH/2jzN2AreXKH6MVWOgMORqivc8sas8dgEonDIUdzCo7tiSstCz
         DbsQkxeLZ0+f/xiRBuhCk1noAbtJYiUUKgCHlq5kSvHAYSesUYfNe4klv4CqAZ7v4MWS
         lmuaBr8yuwv9lI4YfuE/7JytEq3slhX4a6IJ9fkk49DS3oJhzouQZZidmoRQO/EXeqrI
         IaTw==
X-Gm-Message-State: ACgBeo3Zf5cKyHqggTtJa8PxXrMmlfPC8DfbPrJAzDtlprPqKtfONk95
        3njlzmJrJP579RGxeT/DzD1iHXr+oQSLA0fFe8s=
X-Google-Smtp-Source: AA6agR5oT5yzIfzE/MaqN7E6f9Qbw5KM3qzSiNAkisKrSwlmjPsA0/sF3D8jQpGxsBd5A8gOiwbpow==
X-Received: by 2002:a17:90b:390f:b0:1f4:e394:8c18 with SMTP id ob15-20020a17090b390f00b001f4e3948c18mr6479082pjb.141.1660186728795;
        Wed, 10 Aug 2022 19:58:48 -0700 (PDT)
Received: from localhost.localdomain ([63.222.17.38])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709026b4200b0016db51ca7dfsm13721310plt.15.2022.08.10.19.58.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Aug 2022 19:58:48 -0700 (PDT)
From:   margeyang <marge.yang@synaptics.corp-partner.google.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hdegoede@redhat.com,
        benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com,
        Marge Yang <marge.yang@synaptics.corp-partner.google.com>
Subject: [PATCH V3] HID: HID-rmi - ignore to rmi_hid_read_block after system resumes.
Date:   Thu, 11 Aug 2022 10:58:32 +0800
Message-Id: <1660186712-2598-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Marge Yang <marge.yang@synaptics.corp-partner.google.com>

The interrupt GPIO will be pulled down once
after RMI driver reads this command(Report ID:0x0A).
It will cause "Dark resume test fail" for chromebook device.
Hence, TP driver will ignore rmi_hid_read_block function once
after system resumes.

Signed-off-by: Marge Yang<marge.yang@synaptics.corp-partner.google.com>
---
 drivers/hid/hid-rmi.c | 14 ++++++++++++--
 include/linux/rmi.h   |  2 ++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 311eee599ce9..fdaf2c4ce181 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -203,7 +203,13 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 		if (ret < 0)
 			goto exit;
 	}
-
+	if (xport->ignoreonce == 1) {
+		dev_err(&hdev->dev,
+			"ignoreonce (%d)\n",
+			xport->ignoreonce);
+		xport->ignoreonce = 0;
+		goto exit;
+	}
 	for (retries = 5; retries > 0; retries--) {
 		data->writeReport[0] = RMI_READ_ADDR_REPORT_ID;
 		data->writeReport[1] = 0; /* old 1 byte read count */
@@ -468,8 +474,12 @@ static int rmi_post_resume(struct hid_device *hdev)
 	ret = hid_hw_open(hdev);
 	if (ret)
 		return ret;
-
+	// Avoid to read rmi_hid_read_block once after system resumes.
+	// The interrupt will be pulled down
+	// after RMI Read command(Report ID:0x0A).
+	data->xport.ignoreonce = 1;
 	ret = rmi_reset_attn_mode(hdev);
+	data->xport.ignoreonce = 0;
 	if (ret)
 		goto out;
 
diff --git a/include/linux/rmi.h b/include/linux/rmi.h
index ab7eea01ab42..24f63ad00970 100644
--- a/include/linux/rmi.h
+++ b/include/linux/rmi.h
@@ -270,6 +270,8 @@ struct rmi_transport_dev {
 	struct rmi_device_platform_data pdata;
 
 	struct input_dev *input;
+
+	int ignoreonce;
 };
 
 /**
-- 
2.22.0.windows.1

