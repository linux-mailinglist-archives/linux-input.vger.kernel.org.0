Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E45F12CBA3
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfL3B1l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:41 -0500
Received: from mail-yw1-f67.google.com ([209.85.161.67]:34688 "EHLO
        mail-yw1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfL3B1k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:40 -0500
Received: by mail-yw1-f67.google.com with SMTP id b186so13606142ywc.1
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oNxIbMsZ18nhhRI3/mIoL9hJ7/jbqgwwzLK/YMNuPfw=;
        b=BCLjeL5+2FDwDyjyHUrAAtueMoHoxBjrcDMbpe2afYvzWjEIoitgKDuWeYiQhN72sX
         QsPcNNcrq71OUvcv2hX1ZFYRWQgrf9m5bMk+SzXyzIRjFEBiLlizTUfJYqeTRCCut0uW
         SAwqUnOm6z6OVANWvnEp4SyWFLhrcEZUqWFXJq05SePsPoR/hLUKnhyxPnUCoutQJdtV
         r0aCO/dPi2m1jSXDMydT9tzTxilaexZCATM89Mne7OWxjtHxptHdWpwHzHfWZuyFMkJG
         ivrXrbi1yAt1yrZMkAIwlvGWhXQ8L8K4QQBaZlnQGSfcfvGhjgYWrL+lKuPFiNy9JruT
         w10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oNxIbMsZ18nhhRI3/mIoL9hJ7/jbqgwwzLK/YMNuPfw=;
        b=aH0nEk5wzlxYOzqPnX8pNsY6Z7wMuI1/urp1mNXuDeHExqL1jYtAsaxG5jzG3Om7oF
         aQz/jS6ex7PUspMcEoP86o5nao4pq9jektz0tX+eE/zWEjm7WYlgERJSSIFVrv+qxJcv
         8ailQQyfsN04brx22qojQjEKezz/RwM+BneLVkoTeVP+c6I1oEQrVMfZccRmFUg4lGLR
         127bSKNhBeUbkzJZMS08OZ4I9qVvxwoaQOHqZzPATkesIgTKrAiBxxYhAMV+i7OXyB6x
         inPxdB2ldlXBrQGIKZAavQmVRICEdD3LY6zbMngXM17gAIyv/7jnq3S4q2ch2TOw3zTT
         pYRA==
X-Gm-Message-State: APjAAAVRW9nb1xNwgCvgzWlQfkxQwZ7NwXmgseiMOUZaw+/GdsAT+USh
        OHXqtnKZsLJ38wdyUgpB8YtD/Yp9toc=
X-Google-Smtp-Source: APXvYqy/WRLai+DjAA1rAOGUAk17vsCyaLzOM0ATTpbfjjCTJg3rzT+D9Zx3rB4PbIfDuMo3gX6mZA==
X-Received: by 2002:a81:230a:: with SMTP id j10mr46310291ywj.485.1577669259325;
        Sun, 29 Dec 2019 17:27:39 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:38 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 10/12] HID: nintendo: set controller uniq to MAC
Date:   Sun, 29 Dec 2019 19:27:18 -0600
Message-Id: <20191230012720.2368987-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230012720.2368987-1-djogorchock@gmail.com>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
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
index b11c27a8e381..7b7a0cf3fe0b 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -314,6 +314,8 @@ struct joycon_ctlr {
 	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
+	u8 mac_addr[6];
+	char *mac_addr_str;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -975,6 +977,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->input->id.vendor = hdev->vendor;
 	ctlr->input->id.product = hdev->product;
 	ctlr->input->id.version = hdev->version;
+	ctlr->input->uniq = ctlr->mac_addr_str;
 	ctlr->input->name = name;
 	input_set_drvdata(ctlr->input, ctlr);
 
@@ -1267,6 +1270,41 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
 	return 0;
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
@@ -1445,6 +1483,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 		goto err_mutex;
 	}
 
+	ret = joycon_read_mac(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to retrieve controller MAC; ret=%d\n",
+			ret);
+		goto err_close;
+	}
+
 	mutex_unlock(&ctlr->output_mutex);
 
 	/* Initialize the leds */
-- 
2.24.1

