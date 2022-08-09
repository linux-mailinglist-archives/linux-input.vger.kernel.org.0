Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D611758D23D
	for <lists+linux-input@lfdr.de>; Tue,  9 Aug 2022 05:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232227AbiHIDJP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Aug 2022 23:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbiHIDJO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Aug 2022 23:09:14 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8F41C913
        for <linux-input@vger.kernel.org>; Mon,  8 Aug 2022 20:09:12 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id m2so10231908pls.4
        for <linux-input@vger.kernel.org>; Mon, 08 Aug 2022 20:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=synaptics-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=4qMyf3ra1p/hv8IQNzr/gSMHDdqMJMfflxKZSaqC/T4=;
        b=Crrcq45G+srLavji4sh1eYPTWcASC1Tfg5+Nhj5vrz1nNLV7YlHI4gN4lB5Zk2l80U
         hfi2f27rWux73TPMTZmWYuYr03TjKKnWO6JXSnKivmeMvGgUUpykODmIBavtHS2sgjHg
         eC8Dhp3QVx0ip/sNMZQxC5Svtmfv0nXXQdvz1sGQO6qizF/LJi50AU+F4e4LqPTeDsWd
         4XNAz+55kuQnL/IF/GyZuwe8Mujj/1RicTuHwAevuJO5bKzEWsChCBYD6mJMIxeDwZAN
         isEnhcDzPcVwhioraSmcjfzKEyQlPVLY/w4v7Y/7vNFET67+0K8+68BKPshMw/J1OSLy
         tA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4qMyf3ra1p/hv8IQNzr/gSMHDdqMJMfflxKZSaqC/T4=;
        b=vLdKrNJCMdPVsXB7x3fKGULVpI4anKuKuIEim5836+q/nlXloWcl/Su08HPA1F1U/h
         7mjc61w5PtxdiRW+0TvTgsC27thU02tyXGWslG0Sh+dCtVaIojGSwFxFKNMu2biC2RKH
         I7/75koXEruEE0pAHGkltYGZ+rmntNfsLE1X5jeUPTuf7CXI1yKPMsU8V0QmMn0iSUqx
         ZLqXotqHW6a8IFQ89rNle+F3IghCfloVYO/lYaqiOGpHkLu57LhmYz37fNERb1poMHGr
         hZ3/IcCTuHZiDuzeabmHNqFeIZoztC6Djo7FXs4fwXHs8q/L6RpzjaV/ly8LN5OLIE9X
         kknQ==
X-Gm-Message-State: ACgBeo1y/Xv5/Q+Ay0PaMM8Gmxwb0UWyhAJxcHV2yAdRJD8qeB7AQb6P
        DLSM6gfG64FfSajNYxMpRZG+Jw==
X-Google-Smtp-Source: AA6agR6Q4rMI5yIM9lNvFcRsrZ8SX+O6hCjni4vYKBKs7Pzi39297xr8p/lDYmta+9NlR9j1IKa9yg==
X-Received: by 2002:a17:902:f283:b0:16f:c46:dc1f with SMTP id k3-20020a170902f28300b0016f0c46dc1fmr20973734plc.162.1660014552382;
        Mon, 08 Aug 2022 20:09:12 -0700 (PDT)
Received: from localhost.localdomain ([63.222.17.38])
        by smtp.gmail.com with ESMTPSA id g17-20020aa79f11000000b0052d3899f8c3sm9424608pfr.36.2022.08.08.20.09.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Aug 2022 20:09:11 -0700 (PDT)
From:   margeyang <marge.yang@synaptics.corp-partner.google.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hdegoede@redhat.com,
        benjamin.tissoires@redhat.com
Cc:     marge.yang@tw.synaptics.com, derek.cheng@tw.synaptics.com,
        vincent.huang@tw.synaptics.com,
        Marge Yang <marge.yang@synaptics.corp-partner.google.com>
Subject: [PATCH V2] HID: HID-rmi - ignore to rmi_hid_read_block after system resumes.
Date:   Tue,  9 Aug 2022 11:09:04 +0800
Message-Id: <1660014544-1009-1-git-send-email-marge.yang@synaptics.corp-partner.google.com>
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
index 311eee599ce9..b08b74b0c140 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -203,7 +203,13 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 		if (ret < 0)
 			goto exit;
 	}
-
+	if ((!!xport) && (xport->ignoreonce == 1)) {
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

