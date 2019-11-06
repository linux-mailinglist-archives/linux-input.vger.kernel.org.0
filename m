Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42CF7F0EBD
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730037AbfKFGHL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:07:11 -0500
Received: from mail-yw1-f66.google.com ([209.85.161.66]:44515 "EHLO
        mail-yw1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbfKFGHL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:07:11 -0500
Received: by mail-yw1-f66.google.com with SMTP id p128so353792ywc.11
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ow9f9V+rSKoz1ZYone9J08Jkn/N4+iISXil9NZ29mb0=;
        b=WtVhmZxDPRrNwV0eCRXPXdquZOSVixoit2ADKcc3k8WwYA2nhjtMUR/F/3QttERRSQ
         0qVysrrKP2g80B5kGo1Wtw3upTYDVEC8E5p+Akq9F1E6+jyN1JGs5NcjpJMSVyWOy+fQ
         NtykjqVdhJu3JTXB7w4Vmm5QS3ckueipjpT90dSxXO4E105BsJoKZIRt+NyXXk9pWkUh
         h87ZPjfAMcUJgDwIT85u2QISISkI/2n09gk/22tZjBSYn2oGZ+5uM1IMgCyW69JmD2V8
         QAqYPirR/d0ON/WT2We39QdI65K880AC5dsvxF4UDNA5ycdEH62SOdloex7oeUlPPe4J
         HZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ow9f9V+rSKoz1ZYone9J08Jkn/N4+iISXil9NZ29mb0=;
        b=lGLNZoVBW4m7zRs7VN+00yuVhGQd5Tuj1pJS4VZ99a6ZkU2QNw8XVG00Ib+nxcLk/c
         7UFbAEboFenL/opIO/A/9t84nQnKUYFLFEGy2GKe1cmEqw8Q1fLTOLWvoPfTuNzjsaf/
         eEJFDr7xXMiZL+9ua7jQ0R1DI4oskuXPtNzLxrYgPMZhKn+fCSKj6x2SPi/LRfSJyGn/
         sDC3wXz6SHJcFSam+xdBsso54OKI57pTUG9M6JwZNn/y2rRKyPFYDpRnveaigrIIL7LA
         jTUA6PB/rIyu5T9galrD9A+Eis2TLKDjK6VUFaOYcO3PZSYkVDhNIo6+Be2yBVBB+B15
         WHfA==
X-Gm-Message-State: APjAAAXWneOi2SlPal3ayfFiaAZHeGRVLzs/PSfAlm39Huar9HtNo4Ui
        tmg+6uiwR/zRy7ki9WPreXh0qOfv8sSZXQ==
X-Google-Smtp-Source: APXvYqzDOnxBUwfmeQXjY6NgATEfkbtY73Z6YgC7U6/r4bMe+FbMLUVNnvCn5nrSh3/yG7ExCRUCrg==
X-Received: by 2002:a81:b617:: with SMTP id u23mr435292ywh.295.1573020429284;
        Tue, 05 Nov 2019 22:07:09 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:07:08 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 10/10] HID: nintendo: set controller uniq to MAC
Date:   Wed,  6 Nov 2019 00:06:48 -0600
Message-Id: <20191106060648.3018478-11-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106060648.3018478-1-djogorchock@gmail.com>
References: <20191106060648.3018478-1-djogorchock@gmail.com>
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
index 24c4ec4e453a..c81bdcda76d4 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -313,6 +313,8 @@ struct joycon_ctlr {
 	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
+	u8 mac_addr[6];
+	char *mac_addr_str;
 
 	/* The following members are used for synchronous sends/receives */
 	enum joycon_msg_type msg_type;
@@ -970,6 +972,7 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	ctlr->input->id.vendor = hdev->vendor;
 	ctlr->input->id.product = hdev->product;
 	ctlr->input->id.version = hdev->version;
+	ctlr->input->uniq = ctlr->mac_addr_str;
 	ctlr->input->name = name;
 	input_set_drvdata(ctlr->input, ctlr);
 
@@ -1250,6 +1253,41 @@ static int joycon_power_supply_create(struct joycon_ctlr *ctlr)
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
@@ -1428,6 +1466,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
 
 	ret = joycon_input_create(ctlr);
-- 
2.23.0

