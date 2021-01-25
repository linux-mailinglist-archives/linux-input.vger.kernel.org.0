Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA73D302A30
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 19:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbhAYS1b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 13:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbhAYS0e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 13:26:34 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8554EC061786
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:25:31 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1l46YL-00041I-Eq; Mon, 25 Jan 2021 19:25:29 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v3 3/5] Input: exc3000 - fix firmware version query for device in bootloader
Date:   Mon, 25 Jan 2021 19:25:25 +0100
Message-Id: <20210125182527.1225245-4-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210125182527.1225245-1-l.stach@pengutronix.de>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If the device is stuck in bootloader (maybe due to blank or corrupted
application firmware) it won't answer a query for the firmware version.
Fall back to returning the bootloader version in that case.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/exc3000.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index b008adc1031d..ae06290a4c45 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -260,6 +260,20 @@ static ssize_t fw_version_show(struct device *dev,
 	u8 response[EXC3000_LEN_FRAME];
 	int ret;
 
+	/* query bootloader info */
+	ret = exc3000_vendor_data_request(data,
+					  (u8[]){0x39, 0x02}, 2, response, 1);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * If the bootloader version is non-zero then the device is in
+	 * bootloader mode and won't answer a query for the application FW
+	 * version, so we just use the bootloader version info.
+	 */
+	if (response[2] || response[3])
+		return sprintf(buf, "%d.%d\n", response[2], response[3]);
+
 	ret = exc3000_vendor_data_request(data, (u8[]){'D'}, 1, response, 1);
 	if (ret < 0)
 		return ret;
-- 
2.20.1

