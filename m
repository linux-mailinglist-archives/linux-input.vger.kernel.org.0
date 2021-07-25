Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 105063D4B30
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhGYCr0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhGYCrX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:23 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0613C061757
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:53 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id a12so4612878qtb.2
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qz8Dn67rqs/rHzcr5TNrlqEnsKN88/RIl/Ox5041CSs=;
        b=j2PI/QL7PGGmNsVL1mc117QVkrM5wtTJbltrJvs+4ioAd9F+ssn8i20+qFa6UyZM1Z
         RxHi0koqi35AZ3ejoczHGd5DNb9wu1556MLc2zyZ/JV3O/WO8wpNvBxcSM+UFQghdV8i
         fOKifAiE6+yV31UP+ywqnOBUimej309ios2Y9bIsYA4A3q/91iGHW8nPe1ETJ+FQY/yo
         /MkG9HwKxxmTz6MA4bl+cmavNt5ubf+5zNuYemb9IET7K4FkLAMupAeJ82TEGvLCSlEI
         2RGCPVlitNsFgTZHyiREP1KmjTVEd00OU/eZJAprLxr9vsRyJCn+h8TCHDil8KF/FhEW
         U3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qz8Dn67rqs/rHzcr5TNrlqEnsKN88/RIl/Ox5041CSs=;
        b=aUMZXTGX3iIm6grwQSs83XNJXIXOmscWqC+vbV2w5lDwYOW+mguYDKMauSH/Wt71kU
         LIbTi439RjPnkWaiIPyMJ2HKPllCy4y6dYEBPoPPpCgz4rUJ+F/Z69LDi3fe5uMF2WVp
         OQvTj/c57M2Akva9R84pouxZqeVHlR1qEgGe5S+1sdU+OGK6SQWO1st7GmumzEhsNXJY
         jALfZCHqbIsGbtWIJ1fXx6peDJL956Z2wbDZ5UgxjyAkSZe5mYyosx8bMDLE5V8kKbyi
         wM00TsfUwGYKCE67XvXi//zNek5kvgavdhMxYV0UsyK6AhIoxzZBMAk2nzaThwd4pZOC
         6mHA==
X-Gm-Message-State: AOAM532ZjSgh6HNT9pohOcfEmrRR+/Ee8QgBvHsYlRtFfEZGZ7HAOMH7
        mT2HwBHb7sNtnXYfBUEbLinzeBV35lj8+2LL
X-Google-Smtp-Source: ABdhPJwhazpRVypeoKw64ZyNQyi2l/5kxK8/AcvofIWr1RB18p1KhnIHCi8BIK966M3JJzEczririg==
X-Received: by 2002:a05:622a:610:: with SMTP id z16mr10335880qta.99.1627183672737;
        Sat, 24 Jul 2021 20:27:52 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:52 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 10/17] HID: nintendo: set controller uniq to MAC
Date:   Sat, 24 Jul 2021 23:27:01 -0400
Message-Id: <20210725032707.440071-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
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
2.32.0

