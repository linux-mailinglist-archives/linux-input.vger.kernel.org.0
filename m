Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78781326B0
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 04:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfFCCiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Jun 2019 22:38:14 -0400
Received: from p3plsmtpa11-03.prod.phx3.secureserver.net ([68.178.252.104]:44472
        "EHLO p3plsmtpa11-03.prod.phx3.secureserver.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726270AbfFCCiO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 2 Jun 2019 22:38:14 -0400
Received: from localhost.localdomain ([136.49.227.119])
        by :SMTPAUTH: with ESMTPSA
        id XcrThuKFIhaCsXcrVhqPcS; Sun, 02 Jun 2019 19:38:14 -0700
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, rydberg@bitmath.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH] Input: iqs5xx - get axis info before calling input_mt_init_slots()
Date:   Sun,  2 Jun 2019 21:38:01 -0500
Message-Id: <1559529481-3817-1-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
X-CMAE-Envelope: MS4wfLM0Z/9gUOEpD6FXF9w75MpAYeKOj+alkjMT06a2EcK2TWXd2KcxJaVTiDkOaWDJYhJ47NOE1npoPnxMhrfAf95e+cjhFNUGseYo0Fjmrjo9Y7uAUsdc
 og7Qk1nSgGejSziognAnzy7/1Dqr0LjI56JQpP3Ol9bPYMbQsI4sMDFwCLbFiTwkAg9Bced2YMF6pPjEkZ7zyLD5t9H8z+0ZSy2Cjn0E4yNyDOi48HZCA4EU
 9UErTksPBzCd5x6C5KWysCVosOXbOqJg97VtusQB4cMmZCxoyiVG4culOcW+Jmp/
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
 drivers/input/touchscreen/iqs5xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 1587078..dd7a925 100644
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
@@ -580,6 +572,14 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 		max_y = (u16)prop.max_y;
 	}
 
+	error = input_mt_init_slots(iqs5xx->input, IQS5XX_NUM_CONTACTS,
+				    INPUT_MT_DIRECT);
+	if (error) {
+		dev_err(&client->dev, "Failed to initialize slots: %d\n",
+			error);
+		return error;
+	}
+
 	/*
 	 * Write horizontal and vertical resolution to the device in case its
 	 * original defaults were overridden or swapped as per the properties
-- 
2.7.4

