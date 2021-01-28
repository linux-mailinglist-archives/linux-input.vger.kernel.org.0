Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F9463075D4
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 13:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhA1MTr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 07:19:47 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:38598 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbhA1MTq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 07:19:46 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l56GN-0001Zy-Hp; Thu, 28 Jan 2021 12:19:03 +0000
From:   Colin King <colin.king@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] Input: iqs5xx: Ensure error_bl is initialized on error exit path
Date:   Thu, 28 Jan 2021 12:19:03 +0000
Message-Id: <20210128121903.636652-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the call to qs5xx_fw_file_parse fails the error return
exit path will read the uninitialized variable error_bl. Fix this
by ensuring error_bl is initialized to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 2539da6677b6 ("Input: iqs5xx - preserve bootloader errors")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/touchscreen/iqs5xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 05e0c6ff217b..54f30038dca4 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -852,7 +852,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
-	int error, error_bl;
+	int error, error_bl = 0;
 	u8 *pmap;
 
 	if (iqs5xx->bl_status == IQS5XX_BL_STATUS_NONE)
-- 
2.29.2

