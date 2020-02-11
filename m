Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 011A1158B6E
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 09:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbgBKIqy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Feb 2020 03:46:54 -0500
Received: from inva020.nxp.com ([92.121.34.13]:58700 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727582AbgBKIqx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Feb 2020 03:46:53 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 07E7E1A311B;
        Tue, 11 Feb 2020 09:46:52 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 744291A3129;
        Tue, 11 Feb 2020 09:46:49 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 71C43402CF;
        Tue, 11 Feb 2020 16:46:46 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc:     haibo.chen@nxp.com, linux-imx@nxp.com
Subject: [PATCH 1/2] input: egalax_ts: switch to i2c interface before wake up
Date:   Tue, 11 Feb 2020 16:41:11 +0800
Message-Id: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

For HannStar (HSD100PXN1 Rev: 1-A00C11 F/W:0634) LVDS touch screen,
it has a special request for the EETI touch controller. The host
needs to trigger I2C event to device FW at booting first, and then
the FW can switch to I2C interface. Otherwise, the FW can’t  work
with I2C interface, and can't generate any interrupt when touch
the screen.

This patch send an I2C command before the device wake up, make sure
the device switch to I2C interface first.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/input/touchscreen/egalax_ts.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 83ac8c128192..5e35ca5edc7b 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -183,6 +183,20 @@ static int egalax_ts_probe(struct i2c_client *client,
 	ts->client = client;
 	ts->input_dev = input_dev;
 
+	/* HannStar (HSD100PXN1 Rev: 1-A00C11 F/W:0634) LVDS touch
+	 * screen needs to trigger I2C event to device FW at booting
+	 * first, and then the FW can switch to I2C interface.
+	 * Otherwise, the FW can’t  work with I2C interface. So here
+	 * just use the exist function egalax_firmware_version() to
+	 * send a I2C command to the device, make sure the device FW
+	 * switch to I2C interface.
+	 */
+	error = egalax_firmware_version(client);
+	if (error) {
+		dev_err(&client->dev, "Failed to switch to I2C interface\n");
+		return error;
+	}
+
 	/* controller may be in sleep, wake it up. */
 	error = egalax_wake_up_device(client);
 	if (error) {
-- 
2.17.1

