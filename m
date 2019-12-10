Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55F15117C4D
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 01:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbfLJATc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 19:19:32 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:61015 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727304AbfLJATU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 19:19:20 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47X0ws4XrzzLy;
        Tue, 10 Dec 2019 01:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575937005; bh=J1UtFVWRaaOezDGDF6HSdi8ypeDqB+/Qknt3TL2K7FU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=i0XscqF4kH3hybzld3O5NYlb83BWA7wvZqt6U1dSV+Yi/eEigU+dnSw2xOscLBczv
         dJ9MnDMXlzGT50VhguhqNFgDoalsjFU1767T7P8yRZ1sufT4KVprNKSmAgiHamlMye
         R1O3uQqYOnxlred+O+jnaBoRadbsTQmouQb9cceczYaDT8bz3v2tpzqiAVPP1nxIKA
         jBFZqnVvbEDrPG+SoC4vXHrvos7+zoIlgo36NWXbxpkmEhg5lKbXXrS7hu8ApP3eru
         H4eHfs8jcJrve3tfTcJZ66ILQH7ekfLCryPRRNAJRtadSZbscfnyhU7EDkix6O8PRU
         IvnuthGoE0KOw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 10 Dec 2019 01:19:18 +0100
Message-Id: <5b017222a771fcef78876a18bcd80603c29c25f0.1575936961.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 4/6] input: elants: detect max_x/y from hardware
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Read max_x/y from hardware when not specified in devicetree.

elants_i2c_initialize() call is moved after inputdev allocation (but
still before making it visible) to allow the function to see DT-provided
values.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 02bd5e3e2171..2e6c9aa60496 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -498,9 +498,11 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
 			 rows, cols, osr);
 	} else {
 		/* translate trace number to TS resolution */
-		ts->prop.max_x = ELAN_TS_RESOLUTION(rows, osr);
+		if (!ts->prop.max_x)
+			ts->prop.max_x = ELAN_TS_RESOLUTION(rows, osr);
 		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, phy_x);
-		ts->prop.max_y = ELAN_TS_RESOLUTION(cols, osr);
+		if (!ts->prop.max_y)
+			ts->prop.max_y = ELAN_TS_RESOLUTION(cols, osr);
 		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, phy_y);
 	}
 
@@ -1235,12 +1237,6 @@ static int elants_i2c_probe(struct i2c_client *client,
 		return -ENXIO;
 	}
 
-	error = elants_i2c_initialize(ts);
-	if (error) {
-		dev_err(&client->dev, "failed to initialize: %d\n", error);
-		return error;
-	}
-
 	ts->input = devm_input_allocate_device(&client->dev);
 	if (!ts->input) {
 		dev_err(&client->dev, "Failed to allocate input device\n");
@@ -1252,6 +1248,12 @@ static int elants_i2c_probe(struct i2c_client *client,
 
 	touchscreen_parse_properties(ts->input, true, &ts->prop);
 
+	error = elants_i2c_initialize(ts);
+	if (error) {
+		dev_err(&client->dev, "failed to initialize: %d\n", error);
+		return error;
+	}
+
 	__set_bit(BTN_TOUCH, ts->input->keybit);
 	__set_bit(EV_ABS, ts->input->evbit);
 	__set_bit(EV_KEY, ts->input->evbit);
-- 
2.20.1

