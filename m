Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0514079F7
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbhIKRiR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233121AbhIKRiQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:16 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312F2C061757
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:03 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id 22so5822742qkg.2
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WgY2Lx7Q+Rn8EFfctbvGz9yFk4kqkwqPYRmIwqaquMc=;
        b=KkPg9yeOu1GYofU4FrP/1YH/Nvw58MrC48cHDv/p/i8lYzfY/vEtCX9b/IqET2v9Kl
         Vv9ekM6VQwupuswgZaYgf26Dmpm+GtQpzxHmYPuP8WenV/gcQjEOTSsGE+u6J31gT77u
         fAKmcsgeCh8/0GHaaOeuD2TTmtdkfmH4vRINP5nTnH78L77siJmZc8taTWzalO2/Gdkw
         WCZs9ztFPQrnGk1hUwIYBoujf5VJgluVcgaU4dAqr8ShT9zCAHv8S1Oggxghth7u/el4
         TylRYlnZcG3+QY9wbqEbbF2HeYu2jFE4SPe43vwLwkI8yURozDwd+DNEroJK5lt9xvp9
         2gLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WgY2Lx7Q+Rn8EFfctbvGz9yFk4kqkwqPYRmIwqaquMc=;
        b=nQdvlAmMqK2CMdqDIcvG85wSzm/QoTEvJO50CdaEjiwQmB4pyftWOaaRsmP7LlqV/3
         Hx1/FZ/LW6Mbbee+2KMg8I1T9NvstyiFkOceJ04fceNpg/TAqiP0UKLFL53BY55RFSXI
         WxKFm+kuIAjTonmial9RkIBbhLg0Lzrj/NvPiz3lOpi5ByC0Dj4enkPRLHWO2FCL0dTj
         1f+z9FdRtqPLuRs8wcl2gnXrvHst6eHmiboEBM7EPWTLUe3GEqoy8a6kFT3vwhLLa1hj
         xFq6N+eeBkwSsMFveN5DY23l1AVOjZtAU+SoQEUM80T5XIJyhnNSADPxn2lg6iN1+Oec
         ldTQ==
X-Gm-Message-State: AOAM5317z7dgnYiT3bk77tygIBVLs0AO9J2K/QlXBXPBS3TBbu0TTA7n
        jV3qwF27Yo+3+h038pHNb8XEhp3GRqbqCA==
X-Google-Smtp-Source: ABdhPJyugoagFgGAN2RglZ+opIw/23lH77aAoIZYPu7g4R4OdpfqXSHY8nQosh+dFQSyKoFhmIZCGw==
X-Received: by 2002:a05:620a:4094:: with SMTP id f20mr2860245qko.488.1631381822322;
        Sat, 11 Sep 2021 10:37:02 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:37:01 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 10/16] HID: nintendo: set controller uniq to MAC
Date:   Sat, 11 Sep 2021 13:36:33 -0400
Message-Id: <20210911173639.5688-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
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
index ed9cf7b373067..ac171ee5066ad 100644
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

