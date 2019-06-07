Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFF9382DD
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2019 04:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfFGCpt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 22:45:49 -0400
Received: from p3plsmtpa06-06.prod.phx3.secureserver.net ([173.201.192.107]:38037
        "EHLO p3plsmtpa06-06.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726173AbfFGCpt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 6 Jun 2019 22:45:49 -0400
X-Greylist: delayed 438 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 Jun 2019 22:45:49 EDT
Received: from localhost.localdomain ([136.49.227.119])
        by :SMTPAUTH: with ESMTPSA
        id Z4lwhpEcHwmHdZ4lyhdRx1; Thu, 06 Jun 2019 19:38:31 -0700
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, rydberg@bitmath.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2] Input: iqs5xx - get axis info before calling input_mt_init_slots()
Date:   Thu,  6 Jun 2019 21:38:05 -0500
Message-Id: <1559875085-21880-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
X-CMAE-Envelope: MS4wfOeHIbq24mZtGjg7uhwQA/QtcSxKvDLfOZ9fgyPJMgoP8yGz605pc1Tl2NwrcqExIFf3SQcmQJtUQZTcSejcbd1mZf1AN1PmSINUn6VgpU1+783K9bcX
 ICLRgNpH+d6VOgDDzlU/XwBRdcxgUjvhRZZEFWCtmEmX3ufdwV2xhrqzoHm+BHsY/IzCsebdCJd9mxkBxO1zabjpU0PjzpkGy+YcWocZ3uODTA9S8NI46VqP
 3955VPxNFGVcSV+9KSBDAg+vktWNSoMFWcYRDSDBXEpsLhmHJAPVPre7jnVx0L7g
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Calling input_mt_init_slots() copies ABS_MT_POSITION_X to ABS_X and
so on, but doing so before calling touchscreen_parse_properties()
leaves ABS_X min = max = 0 which may prompt an X server to ignore
the device.

To solve this problem, wait to call input_mt_init_slots() until all
absolute axis information has been resolved (whether that's through
device tree via touchscreen_parse_properties() or from reading from
the device directly).

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
  - Moved the call to input_mt_init_slots to the very end of iqs5xx_axis_init
    to keep operations on max_x and max_y close to each other for readability

 drivers/input/touchscreen/iqs5xx.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 1587078..5875bb1 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -502,14 +502,6 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 		input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
 		input_set_capability(input, EV_ABS, ABS_MT_PRESSURE);

-		error = input_mt_init_slots(input,
-				IQS5XX_NUM_CONTACTS, INPUT_MT_DIRECT);
-		if (error) {
-			dev_err(&client->dev,
-				"Failed to initialize slots: %d\n", error);
-			return error;
-		}
-
 		input_set_drvdata(input, iqs5xx);
 		iqs5xx->input = input;
 	}
@@ -591,9 +583,19 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 	if (error)
 		return error;

-	return iqs5xx_write_word(client,
-				 prop.swap_x_y ? IQS5XX_X_RES : IQS5XX_Y_RES,
-				 max_y);
+	error = iqs5xx_write_word(client,
+				  prop.swap_x_y ? IQS5XX_X_RES : IQS5XX_Y_RES,
+				  max_y);
+	if (error)
+		return error;
+
+	error = input_mt_init_slots(iqs5xx->input, IQS5XX_NUM_CONTACTS,
+				    INPUT_MT_DIRECT);
+	if (error)
+		dev_err(&client->dev, "Failed to initialize slots: %d\n",
+			error);
+
+	return error;
 }

 static int iqs5xx_dev_init(struct i2c_client *client)
--
2.7.4

