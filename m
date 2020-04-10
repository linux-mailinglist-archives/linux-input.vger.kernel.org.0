Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B66B41A467C
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 14:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725991AbgDJMvI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 08:51:08 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40710 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbgDJMvI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 08:51:08 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0130620061E;
        Fri, 10 Apr 2020 14:51:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 718282008EA;
        Fri, 10 Apr 2020 14:51:04 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E0C8F402EE;
        Fri, 10 Apr 2020 20:51:00 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com, haibo.chen@nxp.com
Subject: [PATCH v2 2/2] input: egalax_ts: correct the get_firmware_command
Date:   Fri, 10 Apr 2020 20:43:05 +0800
Message-Id: <1586522585-14296-2-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586522585-14296-1-git-send-email-haibo.chen@nxp.com>
References: <1586522585-14296-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

According to the User Guide, the get firmware command is
{ 0x03, 0x03, 0xa, 0x01, 'D' }, ASCII value of 'D' is 0x44.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/input/touchscreen/egalax_ts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index c816e03ba421..bb0a59d19f34 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -171,10 +171,10 @@ static int egalax_wake_up_device(struct i2c_client *client)
 
 static int egalax_firmware_version(struct i2c_client *client)
 {
-	static const u8 cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x41 };
+	static const u8 get_firmware_cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x44 };
 	int ret;
 
-	ret = i2c_master_send(client, cmd, MAX_I2C_DATA_LEN);
+	ret = i2c_master_send(client, get_firmware_cmd, MAX_I2C_DATA_LEN);
 	if (ret < 0)
 		return ret;
 
-- 
2.17.1

