Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C053FE66B
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbhIAXn4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXn4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:56 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5D7C061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:58 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id gf5so141704qvb.9
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0a6qMWDUV7rgXQ9mMlDRa7bgOs93UIxAYPSeCFL2n8=;
        b=AMNWqjZZaRiH+LXNkQc8MR8nBvN7PkPkDTUg/ZEwWvvJG1BNpwFa8PCvL4GGXh8Ngj
         SaeNN0V8hc/ZeQf2CH5c8+lXbKjRM3Am4rr5difXHcap9qPfP6e/tnWH/RYwze/79AF+
         STVRfIz1KjlM8QIE1WetG4vXtwIrs5NFQqkF6L99TeQGAlePBWRoaji4Js0IimPUmOmf
         lDX6UCn+3GtFGxB9kPGIkYotygKlU5WbkI/51vD7KgldQ0kbaJRqAtF8QHOeQLANdEJA
         m5DEy4BkL+KEsUh4nbvMQBosCecWhLQO5sSSXDT3/ilWipiCI8itKDANO5AvY+RUSAqI
         7GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0a6qMWDUV7rgXQ9mMlDRa7bgOs93UIxAYPSeCFL2n8=;
        b=A3A4LaZTcO+q0AZkjr5f74YeDW+PZh9ciqlqCYXpWI/G6XDoHGZJcuI1cB5Nu/mR6q
         CrJCL3QbgacPc0khVdxhzpmIFde7XbAzeSl6E/Kr6lZV7tXLivSOyGGgIWYXkol09u84
         tCz+KeNSa6WwrDNUIU0f8+m7vNEShCa5xF22O+7d3BEAjERQc8LJoFuY3egHTHo7DkG1
         wE3HuLdxZDw0o29Boq6aUIq/gLT/Gd9ufRd/OYuyfz/sNmBNsCCG3habhpNnjg/4P5Fz
         wYtr7mjlFS2XllmPrK6HikoZEHGBoUgeZFsrUqxHcmumgs5zKlZgrtvKu7JDxUEw2XF8
         6EkQ==
X-Gm-Message-State: AOAM532q92fxRXN6O/9d3EQXzDqqb3zXjsqkRyMQ36XBjZmwaAYjzF4d
        G5dqmawQMxV93z2sZEjnIWv7kTVjSkA=
X-Google-Smtp-Source: ABdhPJzb5aNBjyGtWZT+/iBEUGMlsFUv0L1YOJoPimTKXvvGqva04a3HDmuC59ef66k8bl00Y9JjUQ==
X-Received: by 2002:a05:6214:23cc:: with SMTP id hr12mr164428qvb.56.1630539778084;
        Wed, 01 Sep 2021 16:42:58 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:57 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 10/16] HID: nintendo: set controller uniq to MAC
Date:   Wed,  1 Sep 2021 19:42:30 -0400
Message-Id: <20210901234236.3113-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
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
index f673a6903f04a..4b72e92e0ff4d 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -326,6 +326,8 @@ struct joycon_ctlr {
 	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
+	u8 mac_addr[6];
+	char *mac_addr_str;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -1012,6 +1014,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->input->id.vendor = hdev->vendor;
 	ctlr->input->id.product = hdev->product;
 	ctlr->input->id.version = hdev->version;
+	ctlr->input->uniq = ctlr->mac_addr_str;
 	ctlr->input->name = name;
 	input_set_drvdata(ctlr->input, ctlr);
 
@@ -1322,6 +1325,41 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
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
@@ -1498,6 +1536,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.33.0

