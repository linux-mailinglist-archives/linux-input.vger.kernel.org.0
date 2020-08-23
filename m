Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620D724EB65
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgHWEml (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgHWEma (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:30 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BE4C061573
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:29 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id z195so2275420oia.6
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D6lVl63bMnKUgqWp+1jrNfFdwd7UjDCrhoZJv/DEscI=;
        b=mJbP95hbrRyHrbgtpUE3a53x14icobXb1QN/0YVXqvseH1dPH/+FhlY62xAc0LeKLf
         QRZTQln37XzEpOSQoPnylSPNbIyx/eKVlNr8NTv72JUA5RTx35Hwz/05IJFtsyd0lfOX
         VV06CVMZWV8bFKOlN51Ob72zd5vdbBz4kQfn2kPzXMoJSb6wroS/vsQJul6JrLfkYuAO
         aXvUeyI800tRBMtv4VvyyllFsnC5dW+bLWqlfDHBw6CknwdacxROsP8AOUQzn7iz7BJE
         y3dcz+QEAjmyUKfXiF9vevcWaYhso4JmZ739NFMuHJrEH4S3DMujYCPD9PTLpMI749ps
         wdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D6lVl63bMnKUgqWp+1jrNfFdwd7UjDCrhoZJv/DEscI=;
        b=Z+hVJX2MOhJWDloeSonN0QBehyJcMHtZm4avy/f8DM1O0ybXrJAixtA8GyiEpV6lov
         Ud1YbJBPGOj8p0ITqlpe5z6thKEM7nfGg2MtcGYIfv8xAScjMY8vVOiVBYN/GCVeoLBN
         61aAAbARuM8lhruK4jJoV6Bqw1+DQ0nQRe1DLAsPfxYVCaw8ejBdWbVn0IzSRrjZA5y7
         WkVVe/XChl0ZSzQ4rr+7wmYfG/DVNwt2Jadg/AK67GNhaORnWUJCeOgRdhj6FpWbVqW4
         QX0UjT3is5gK0Phff4G93IL9c85pmnhwUvU+sFvJucqwCySpOrdUNfP6Mrn5KdsQlcIA
         cItQ==
X-Gm-Message-State: AOAM530zf0dd34HuaW8IaMIABSgShis0RWjmapOPD9prEThQXqp3R5/P
        ZRWtFqrs6seJDWgAK+N6vDxl580t4jc1CNn2
X-Google-Smtp-Source: ABdhPJwpH8o6L4Bvv53daOT7qqyDKOnATjNAFGpYBdeAYinJDbXsBTnTVt2LEJuffFvqgkPhpaKRnQ==
X-Received: by 2002:aca:410:: with SMTP id 16mr105111oie.67.1598157749212;
        Sat, 22 Aug 2020 21:42:29 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:28 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 10/14] HID: nintendo: set controller uniq to MAC
Date:   Sat, 22 Aug 2020 23:41:53 -0500
Message-Id: <20200823044157.339677-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823044157.339677-1-djogorchock@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
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
index c2f7dc83d875..85870569cb49 100644
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
@@ -1495,6 +1533,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.28.0

