Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9ADA38B9A6
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhETWtB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231871AbhETWtA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:49:00 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9ECC061761
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:39 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id k127so17946503qkc.6
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EkqRq+i856MP71GI5yisQ5h35w62tQwjIOVkxxvAUco=;
        b=MqxNjNx0VinxyAZCwLE8zqPhAB8DfpjQE/dwNHwffbj+2PCB/jnPLRr7bhttM7mVos
         jDJruTe6aeWjGdSsBPCmI2PjIAya4FswELGnKr/sOl4i9s3UjKfyVm7zTMTj72eIBg0Y
         HAXthDmtJtHfT5MUKa2cNfP3Xn4B4L2V7gh7LXbdiYRs8X7k9CC5sQkhMAxrz/TlhCCk
         4F96ztJfiSPXBvOjsQLgqzPjg7gMU8g8Yzox3qCYu6TmkiXVx1myeJ8+NVhm2AcmdlKn
         dbgZ52xj88EaARkIjVxGFO369VWFSQMIsoziES0ztbXj8sgG2s7De6f3thL6lVrGx3R4
         wRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EkqRq+i856MP71GI5yisQ5h35w62tQwjIOVkxxvAUco=;
        b=qtJ0oCJ0WGeQLdPQSz40NdhvIkyqBsOg0OdFdPxpbva+m3RdDEgAFW3nTizEXj0Igu
         5Lp61nfhsGrrb8mrE9WMNThCuFP+1LFbOcjCNNjDagA+ZCUHAXwNK4iVHCqhrRguhc8Y
         wxtWdpR9g732Y5psHKHzwYJbsQI8OvWLRyVTjs3ApV+Kra5LL0kFbHfvdGHrD+4dzBlJ
         QONy+nGeI9n7nsmli4hdPNeqzxfCwBplj8d4lPSRpivZ3+3lJOJMXXyMAPjHUXtQtchm
         n4/KlHcAqZZ3159MI4o9HNpBeqrZmEBlv/ui5iuyAnRbKKlcO3j3vIQqESWMSlFx8Y2t
         JBKw==
X-Gm-Message-State: AOAM5314ltbADaa+hldZrcyJQHVqJU+A3RtFswIpWlSTDAteufB1Gkd1
        yI34XpHKNGnps0eA491kD9EN1JldjKBdAg==
X-Google-Smtp-Source: ABdhPJxQSWFzhuCSjNtyKBdjle+QZHxlUuE8pp6lu2kDxrjfZThzycR+9xGSrM92QGycb3c0JMNVIw==
X-Received: by 2002:a05:620a:4486:: with SMTP id x6mr8277366qkp.229.1621550858116;
        Thu, 20 May 2021 15:47:38 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:37 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 10/15] HID: nintendo: set controller uniq to MAC
Date:   Thu, 20 May 2021 18:47:10 -0400
Message-Id: <20210520224715.680919-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch sets the input device's uniq identifier to the controller's
MAC address. This is useful for future association between an IMU input
device with the normal input device as well as associating the
controller with any serial joy-con driver.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 45 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 2eee21f275c9d..c49ec001212bf 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -319,6 +319,8 @@ struct joycon_ctlr {
 	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
+	u8 mac_addr[6];
+	char *mac_addr_str;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -1005,6 +1007,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->input->id.vendor = hdev->vendor;
 	ctlr->input->id.product = hdev->product;
 	ctlr->input->id.version = hdev->version;
+	ctlr->input->uniq = ctlr->mac_addr_str;
 	ctlr->input->name = name;
 	input_set_drvdata(ctlr->input, ctlr);
 
@@ -1317,6 +1320,41 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
 	return power_supply_powers(ctlr->battery, &hdev->dev);
 }
 
+static int joycon_read_mac(struct joycon_ctlr *ctlr)
+{
+	int ret;
+	int i;
+	int j;
+	struct joycon_subcmd_request req = { 0 };
+	struct joycon_input_report *report;
+
+	req.subcmd_id = JC_SUBCMD_REQ_DEV_INFO;
+	ret = joycon_send_subcmd(ctlr, &req, 0, HZ);
+	if (ret) {
+		hid_err(ctlr->hdev, "Failed to get joycon info; ret=%d\n", ret);
+		return ret;
+	}
+
+	report = (struct joycon_input_report *)ctlr->input_buf;
+
+	for (i = 4, j = 0; j < 6; i++, j++)
+		ctlr->mac_addr[j] = report->reply.data[i];
+
+	ctlr->mac_addr_str = devm_kasprintf(&ctlr->hdev->dev, GFP_KERNEL,
+					    "%02X:%02X:%02X:%02X:%02X:%02X",
+					    ctlr->mac_addr[0],
+					    ctlr->mac_addr[1],
+					    ctlr->mac_addr[2],
+					    ctlr->mac_addr[3],
+					    ctlr->mac_addr[4],
+					    ctlr->mac_addr[5]);
+	if (!ctlr->mac_addr_str)
+		return -ENOMEM;
+	hid_info(ctlr->hdev, "controller MAC = %s\n", ctlr->mac_addr_str);
+
+	return 0;
+}
+
 /* Common handler for parsing inputs */
 static int joycon_ctlr_read_handler(struct joycon_ctlr *ctlr, u8 *data,
 							      int size)
@@ -1493,6 +1531,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_mutex;
 	}
 
+	ret = joycon_read_mac(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to retrieve controller MAC; ret=%d\n",
+			ret);
+		goto err_mutex;
+	}
+
 	mutex_unlock(&ctlr->output_mutex);
 
 	/* Initialize the leds */
-- 
2.31.1

