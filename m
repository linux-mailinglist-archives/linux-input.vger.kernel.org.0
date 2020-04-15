Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165B81A95D8
	for <lists+linux-input@lfdr.de>; Wed, 15 Apr 2020 10:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393781AbgDOIJU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Apr 2020 04:09:20 -0400
Received: from inva021.nxp.com ([92.121.34.21]:53650 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393775AbgDOIJQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Apr 2020 04:09:16 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 176EF2007BB;
        Wed, 15 Apr 2020 10:09:14 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F5B72007A0;
        Wed, 15 Apr 2020 10:09:12 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 3166F402FC;
        Wed, 15 Apr 2020 16:09:09 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com, festevam@gmail.com
Subject: [PATCH V3 2/2] input: egalax_ts: fix the get_firmware_command
Date:   Wed, 15 Apr 2020 16:01:03 +0800
Message-Id: <1586937663-13342-2-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586937663-13342-1-git-send-email-haibo.chen@nxp.com>
References: <1586937663-13342-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

According to the User Guide, the get firmware command is
{ 0x03, 0x03, 0xa, 0x01, 'D' }, ASCII value of 'D' is 0x44.

This patch fix that.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/input/touchscreen/egalax_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index d3dc6d14bb78..1da6ddb9b4ee 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -171,7 +171,7 @@ static int egalax_wake_up_device(struct i2c_client *client)
 
 static int egalax_firmware_version(struct i2c_client *client)
 {
-	static const u8 cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x41 };
+	static const u8 cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x44 };
 	int ret;
 
 	ret = i2c_master_send(client, cmd, MAX_I2C_DATA_LEN);
-- 
2.17.1

