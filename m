Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92DDD5FCFF7
	for <lists+linux-input@lfdr.de>; Thu, 13 Oct 2022 02:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbiJMAYZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Oct 2022 20:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiJMAX0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Oct 2022 20:23:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F0D129087;
        Wed, 12 Oct 2022 17:20:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A614616DA;
        Thu, 13 Oct 2022 00:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A75C433C1;
        Thu, 13 Oct 2022 00:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665620395;
        bh=1OlEwYkckHy/Iwjd7fQXnsm7gnGVUSYB4eOuxPVXuYg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CIDG+J2yW5Sq2plnpjSq/uTT1Uj1HC1106AwZPoN5zuH94OZ9seRCw0tdMyCfEWia
         WdQQLBoNOey1tuFMyBdQzaeRXlrjmvA7PHPO3TrBQAjOzQmorOHsRUEctdF5W0KSA+
         t3ywWj9iG+CdqlkmUzNYKUy6JCOo+cdBhVsnUq+ZesziJNfspVyOH6g0T/DO358dFs
         M+UVuYaFsEWsdsT8wiL/RAxuwomwRBjfMy/Kx3J4jfh0hD5jh43qgFtq8DYlzX5XmC
         LG27r5trkZJVTY+s56n3nDmDo7Et8G7SI/1qE1vB4J3T+FtMtee4an9/OoXfeTw9w5
         fzC7W138k4GPw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Harry Stern <harry@harrystern.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Sasha Levin <sashal@kernel.org>, jikos@kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 29/63] hid: topre: Add driver fixing report descriptor
Date:   Wed, 12 Oct 2022 20:18:03 -0400
Message-Id: <20221013001842.1893243-29-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221013001842.1893243-1-sashal@kernel.org>
References: <20221013001842.1893243-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Harry Stern <harry@harrystern.net>

[ Upstream commit a109d5c45b3d6728b9430716b915afbe16eef27c ]

The Topre REALFORCE R2 firmware incorrectly reports that interface
descriptor number 1, input report descriptor 2's events are array events
rather than variable events. That particular report descriptor is used
to report keypresses when there are more than 6 keys held at a time.
This bug prevents events from this interface from being registered
properly, so only 6 keypresses (from a different interface) can be
registered at once, rather than full n-key rollover.

This commit fixes the bug by setting the correct value in a report_fixup
function.

The original bug report can be found here:
Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/804

Thanks to Benjamin Tissoires for diagnosing the issue with the report
descriptor.

Signed-off-by: Harry Stern <harry@harrystern.net>
Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Link: https://lore.kernel.org/r/20220911003614.297613-1-harry@harrystern.net
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/Kconfig     |  6 +++++
 drivers/hid/Makefile    |  1 +
 drivers/hid/hid-ids.h   |  3 +++
 drivers/hid/hid-topre.c | 49 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 59 insertions(+)
 create mode 100644 drivers/hid/hid-topre.c

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 70da5931082f..37734fce88e4 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1141,6 +1141,12 @@ config HID_TOPSEED
 	Say Y if you have a TopSeed Cyberlink or BTC Emprex or Conceptronic
 	CLLRCMCE remote control.
 
+config HID_TOPRE
+	tristate "Topre REALFORCE keyboards"
+	depends on HID
+	help
+	  Say Y for N-key rollover support on Topre REALFORCE R2 108 key keyboards.
+
 config HID_THINGM
 	tristate "ThingM blink(1) USB RGB LED"
 	depends on HID
diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index cac2cbe26d11..7870a3c9d802 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -123,6 +123,7 @@ obj-$(CONFIG_HID_GREENASIA)	+= hid-gaff.o
 obj-$(CONFIG_HID_THRUSTMASTER)	+= hid-tmff.o hid-thrustmaster.o
 obj-$(CONFIG_HID_TIVO)		+= hid-tivo.o
 obj-$(CONFIG_HID_TOPSEED)	+= hid-topseed.o
+obj-$(CONFIG_HID_TOPRE)	+= hid-topre.o
 obj-$(CONFIG_HID_TWINHAN)	+= hid-twinhan.o
 obj-$(CONFIG_HID_U2FZERO)	+= hid-u2fzero.o
 hid-uclogic-objs		:= hid-uclogic-core.o \
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index bc550e884f37..28cf838c8399 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1231,6 +1231,9 @@
 #define USB_DEVICE_ID_TIVO_SLIDE	0x1201
 #define USB_DEVICE_ID_TIVO_SLIDE_PRO	0x1203
 
+#define USB_VENDOR_ID_TOPRE			0x0853
+#define USB_DEVICE_ID_TOPRE_REALFORCE_R2_108			0x0148
+
 #define USB_VENDOR_ID_TOPSEED		0x0766
 #define USB_DEVICE_ID_TOPSEED_CYBERLINK	0x0204
 
diff --git a/drivers/hid/hid-topre.c b/drivers/hid/hid-topre.c
new file mode 100644
index 000000000000..88a91cdad5f8
--- /dev/null
+++ b/drivers/hid/hid-topre.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  HID driver for Topre REALFORCE Keyboards
+ *
+ *  Copyright (c) 2022 Harry Stern <harry@harrystern.net>
+ *
+ *  Based on the hid-macally driver
+ */
+
+#include <linux/hid.h>
+#include <linux/module.h>
+
+#include "hid-ids.h"
+
+MODULE_AUTHOR("Harry Stern <harry@harrystern.net>");
+MODULE_DESCRIPTION("REALFORCE R2 Keyboard driver");
+MODULE_LICENSE("GPL");
+
+/*
+ * Fix the REALFORCE R2's non-boot interface's report descriptor to match the
+ * events it's actually sending. It claims to send array events but is instead
+ * sending variable events.
+ */
+static __u8 *topre_report_fixup(struct hid_device *hdev, __u8 *rdesc,
+				 unsigned int *rsize)
+{
+	if (*rsize >= 119 && rdesc[69] == 0x29 && rdesc[70] == 0xe7 &&
+						 rdesc[71] == 0x81 && rdesc[72] == 0x00) {
+		hid_info(hdev,
+			"fixing up Topre REALFORCE keyboard report descriptor\n");
+		rdesc[72] = 0x02;
+	}
+	return rdesc;
+}
+
+static const struct hid_device_id topre_id_table[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_TOPRE,
+			 USB_DEVICE_ID_TOPRE_REALFORCE_R2_108) },
+	{ }
+};
+MODULE_DEVICE_TABLE(hid, topre_id_table);
+
+static struct hid_driver topre_driver = {
+	.name			= "topre",
+	.id_table		= topre_id_table,
+	.report_fixup		= topre_report_fixup,
+};
+
+module_hid_driver(topre_driver);
-- 
2.35.1

