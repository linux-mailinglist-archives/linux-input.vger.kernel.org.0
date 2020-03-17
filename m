Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5C8187832
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgCQDaL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:30:11 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:37666 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgCQDaK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:30:10 -0400
Received: by mail-qk1-f193.google.com with SMTP id z25so25359272qkj.4
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ixdnztl3QEU2sGssreYnW96/uJjudI7ecVTEuY4Z0jc=;
        b=A9sKVp4IhOmDXiWPRpW3eR70N95tZU3SamAoUI/2rIHBUfXZqp/XHu5GBPqEfVIczL
         cAhiUtBOLSPrZx14jRFBRZzipxS9ajSk/mhI2l5jQGQ8Z5zv3+BRx+Mf5BQOu7xL94Et
         QV5GiW+S9vLbW9w//Y7YuR/9sxTCfbPYQY4A92SqkJ9i+vCLHIvawB9N77YEclmwwf1N
         2wB7R2tsD3yWioDBe73zFGyPAXtq6hoSz6B4VNdgsGbEbUwkMSw0D/GaXsnMa5de6nYv
         ETCNuWvpTo5biFJfOWPUjrfNcyITsENwrUN+xDYVr6fZt/MKjG5cj2BBBf2A6M8nV9J6
         iQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ixdnztl3QEU2sGssreYnW96/uJjudI7ecVTEuY4Z0jc=;
        b=ZF+dvGoEQDc7BKjIApjYeTXxUPtZ9qXktmoJygMFkkH0PlK4R/h5yGadKGZKvo2hHA
         JSf9ra//j+E/CrTfNg59XQFrQmbnKObqRFYcQt5rwot4KKVdpE8hLRItRq/4acRAxLmw
         7pczCUjAuKRzbJ44FU0nS3dPX2JpST0PiQkwWeegXzjLkgVzbQALSx9pXcx3wyokA7f1
         Sw/rxJK6kOxF9uuGLggN7GAt0p898Z5ANxtbDKePZ8nJ7Fhelpv16jXiJRZnRngI3Ic8
         gAkNYfTgjuDPkowbK4DxeywZt7Ak24UDzBCEHGh8raXwS8E+IvlqK3IJSZY7KWVej7Rb
         ZI/Q==
X-Gm-Message-State: ANhLgQ0mxk4Zv1boD1pchS71qVt5EvfWiyWp0Wb0CbO4n1Gr0uXqQTfQ
        cwSFkXnasgrciBiGLWaRDbWNE5VGxio=
X-Google-Smtp-Source: ADFU+vtoMN/v8G8To6CshGwgWbdpDqXh5Lqw6reZCsaLivBu4V3B+XIE7qyukIZppITwQq2I1bm0gA==
X-Received: by 2002:a37:514:: with SMTP id 20mr2880317qkf.420.1584415809777;
        Mon, 16 Mar 2020 20:30:09 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:30:09 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 10/11] HID: nintendo: set controller uniq to MAC
Date:   Mon, 16 Mar 2020 22:29:27 -0500
Message-Id: <20200317032928.546172-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
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
index a56fa5ffee1a..dbd5946f71e1 100644
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
 
@@ -1316,6 +1319,41 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
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
@@ -1494,6 +1532,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.25.1

