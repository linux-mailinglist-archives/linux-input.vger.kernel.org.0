Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD5D5EB2A9
	for <lists+linux-input@lfdr.de>; Mon, 26 Sep 2022 22:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiIZUuw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Sep 2022 16:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbiIZUuu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Sep 2022 16:50:50 -0400
Received: from mail.inka.de (mail.inka.de [IPv6:2a04:c9c7:0:1073:217:a4ff:fe3b:e77c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E176AB18A
        for <linux-input@vger.kernel.org>; Mon, 26 Sep 2022 13:50:46 -0700 (PDT)
Received: from mail3.berkhan-weisser.de ([2a03:4000:54:b9a::4])
        by mail.inka.de with esmtpsa 
        id 1ocudK-003t0f-VS; Mon, 26 Sep 2022 22:23:19 +0200
Received: from 127.0.0.1 (helo=localhost.localdomain)
        by mail3.berkhan-weisser.de with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <Enrik.Berkhan@inka.de>)
        id 1ocudK-007Trr-J6; Mon, 26 Sep 2022 22:23:18 +0200
From:   Enrik Berkhan <Enrik.Berkhan@inka.de>
To:     linux-input@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rishi Gupta <gupt21@gmail.com>,
        Enrik Berkhan <Enrik.Berkhan@inka.de>
Subject: [PATCH v1 1/4] HID: mcp2221: don't connect hidraw
Date:   Mon, 26 Sep 2022 22:22:36 +0200
Message-Id: <20220926202239.16379-2-Enrik.Berkhan@inka.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
References: <20220926202239.16379-1-Enrik.Berkhan@inka.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MCP2221 driver should not connect to the hidraw userspace interface,
as it needs exclusive access to the chip.

If you want to use /dev/hidrawX with the MCP2221, you need to avoid
binding this driver to the device and use the hid generic driver instead
(e.g. using udev rules).

Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
---
 drivers/hid/hid-mcp2221.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index de52e9f7bb8c..0ca2a7b96825 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -840,12 +840,17 @@ static int mcp2221_probe(struct hid_device *hdev,
 		return ret;
 	}
 
-	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
+	/* This driver uses the .raw_event callback and therefore does not need any
+	 * HID_CONNECT_xxx flags. */
+	ret = hid_hw_start(hdev, 0);
 	if (ret) {
 		hid_err(hdev, "can't start hardware\n");
 		return ret;
 	}
 
+	hid_info(hdev, "USB HID v%x.%02x Device [%s] on %s\n", hdev->version >> 8,
+			hdev->version & 0xff, hdev->name, hdev->phys);
+
 	ret = hid_hw_open(hdev);
 	if (ret) {
 		hid_err(hdev, "can't open device\n");
@@ -870,8 +875,7 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->adapter.retries = 1;
 	mcp->adapter.dev.parent = &hdev->dev;
 	snprintf(mcp->adapter.name, sizeof(mcp->adapter.name),
-			"MCP2221 usb-i2c bridge on hidraw%d",
-			((struct hidraw *)hdev->hidraw)->minor);
+			"MCP2221 usb-i2c bridge");
 
 	ret = i2c_add_adapter(&mcp->adapter);
 	if (ret) {
-- 
2.34.1

