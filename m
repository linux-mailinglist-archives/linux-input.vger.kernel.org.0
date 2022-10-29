Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFFD6124F3
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiJ2StR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJ2StQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:16 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F07EB4599B
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:15 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id e4so7440856pfl.2
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYhAzsJ2Du85shITNB+9upl/fTKX2vmS2iYh656fq+w=;
        b=M8uXA/N/tAIRUz0h1l+x2W0EAy4NU1aCaRMPr3kVCD0bQOsgsBZyPQtzD7ul6CIaql
         T+HATxSH19VNDPTkmaXkO3cuSrvTCp34mZ+A1y1h7rtosJCpr07NbW9Z3qNg7LiHkLX4
         bnHVPlIMyFtirLkfmLQeDRMVLhuLlXaYe/iVeS8yJYn5DeCXK/tv6XNZjYtNyNmpJVow
         7mufNVdSq/ldBzzMtMDQ83Lq3ZmRFKrGk34XQvgqz6HVouGBcxOhyBKDLz5+EooIKp/L
         Zq2Mj4AE3CwjQandKVsYcND6xV6neakM6Zq2UKkHOtvZvBvxl+C2rpXXgxVnTT5drnSD
         hDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pYhAzsJ2Du85shITNB+9upl/fTKX2vmS2iYh656fq+w=;
        b=59ftlyj5aUx0Whsd4wWfv1JRgiFF0M460bbdT4If4JrLwG2ImckR18htaHk9zosGvZ
         6qLNEFaOdlcaq38Y763yZ/LnP3Qd4ZJTER6MnNTSyBcQ0i47M+IPa1y59CquU+eR21tT
         qGRBQDtQfbls+/83+DMMnc0T6n6m+Yyl65Mi9Fql8bcgtXsSDGqD59SaCcVkK7Nx/RMK
         zQJm2JmIcqFHo6+hcv9zhnbsXKSLsj152U0zOCQf/CrEGpbjgfI2J7NycN6KLJnhGhuG
         v9183nK9vCi13Z2CRA31DPl+hGsSrLj9jpJ4gtTq7aOKa0NhsahvedAlxvwcDT1euN+J
         BaKA==
X-Gm-Message-State: ACrzQf1Ug4hXSdQphnqsJHhFzDJwP/fgiTXBrTtMv8plQr5AF7zJS1T2
        kp8AnVYcXZ2gPjUCP6w+u3XtyA==
X-Google-Smtp-Source: AMsMyM7HEwPjmfbhP4V+axQiV2yQn2uMsZ5UqltlgvWRXMxpYf7YRjHCyk/MEN31yXAbro6l3c7leQ==
X-Received: by 2002:aa7:9083:0:b0:55f:9827:42e7 with SMTP id i3-20020aa79083000000b0055f982742e7mr5432426pfa.15.1667069355508;
        Sat, 29 Oct 2022 11:49:15 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:15 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 02/13] HID: playstation: report DualShock4 hardware and firmware version.
Date:   Sat, 29 Oct 2022 11:48:40 -0700
Message-Id: <20221029184851.282366-3-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Report DualShock4 hardware and firmware version info through sysfs.
It uses the same sysfs nodes as the DualSense did (and hid-sony).

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 38 +++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 04d03d2e40db..df4353a4f1e9 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -286,6 +286,8 @@ struct dualsense_output_report {
 #define DS4_INPUT_REPORT_USB			0x01
 #define DS4_INPUT_REPORT_USB_SIZE		64
 
+#define DS4_FEATURE_REPORT_FIRMWARE_INFO	0xa3
+#define DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE	49
 #define DS4_FEATURE_REPORT_PAIRING_INFO		0x12
 #define DS4_FEATURE_REPORT_PAIRING_INFO_SIZE	16
 
@@ -1494,6 +1496,30 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	return ERR_PTR(ret);
 }
 
+static int dualshock4_get_firmware_info(struct dualshock4 *ds4)
+{
+	uint8_t *buf;
+	int ret;
+
+	buf = kzalloc(DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = ps_get_report(ds4->base.hdev, DS4_FEATURE_REPORT_FIRMWARE_INFO, buf,
+			DS4_FEATURE_REPORT_FIRMWARE_INFO_SIZE);
+	if (ret) {
+		hid_err(ds4->base.hdev, "Failed to retrieve DualShock4 firmware info: %d\n", ret);
+		goto err_free;
+	}
+
+	ds4->base.hw_version = get_unaligned_le16(&buf[35]);
+	ds4->base.fw_version = get_unaligned_le16(&buf[41]);
+
+err_free:
+	kfree(buf);
+	return ret;
+}
+
 static int dualshock4_get_mac_address(struct dualshock4 *ds4)
 {
 	uint8_t *buf;
@@ -1600,6 +1626,12 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 	}
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds4->base.mac_address);
 
+	ret = dualshock4_get_firmware_info(ds4);
+	if (ret) {
+		hid_err(hdev, "Failed to get firmware info from DualShock4\n");
+		return ERR_PTR(ret);
+	}
+
 	ret = ps_devices_list_add(ps_dev);
 	if (ret)
 		return ERR_PTR(ret);
@@ -1616,6 +1648,12 @@ static struct ps_device *dualshock4_create(struct hid_device *hdev)
 		goto err;
 	}
 
+	/*
+	 * Reporting hardware and firmware is important as there are frequent updates, which
+	 * can change behavior.
+	 */
+	hid_info(hdev, "Registered DualShock4 controller hw_version=0x%08x fw_version=0x%08x\n",
+			ds4->base.hw_version, ds4->base.fw_version);
 	return &ds4->base;
 
 err:
-- 
2.37.3

