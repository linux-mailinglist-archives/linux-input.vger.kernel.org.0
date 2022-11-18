Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970C66304F7
	for <lists+linux-input@lfdr.de>; Sat, 19 Nov 2022 00:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236900AbiKRXts (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Nov 2022 18:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231802AbiKRXtT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Nov 2022 18:49:19 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A31FEC09B
        for <linux-input@vger.kernel.org>; Fri, 18 Nov 2022 15:26:30 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8S-00020d-Rs; Fri, 18 Nov 2022 23:47:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8Q-0058PS-18; Fri, 18 Nov 2022 23:46:58 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1owA8Q-000064-96; Fri, 18 Nov 2022 23:46:58 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        =?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 222/606] Input: synaptics_i2c - Convert to i2c's .probe_new()
Date:   Fri, 18 Nov 2022 23:39:16 +0100
Message-Id: <20221118224540.619276-223-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/mouse/synaptics_i2c.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
index 987ee67a1045..6487c8c60d5e 100644
--- a/drivers/input/mouse/synaptics_i2c.c
+++ b/drivers/input/mouse/synaptics_i2c.c
@@ -521,8 +521,7 @@ static struct synaptics_i2c *synaptics_i2c_touch_create(struct i2c_client *clien
 	return touch;
 }
 
-static int synaptics_i2c_probe(struct i2c_client *client,
-			       const struct i2c_device_id *dev_id)
+static int synaptics_i2c_probe(struct i2c_client *client)
 {
 	int ret;
 	struct synaptics_i2c *touch;
@@ -651,7 +650,7 @@ static struct i2c_driver synaptics_i2c_driver = {
 		.pm	= &synaptics_i2c_pm,
 	},
 
-	.probe		= synaptics_i2c_probe,
+	.probe_new	= synaptics_i2c_probe,
 	.remove		= synaptics_i2c_remove,
 
 	.id_table	= synaptics_i2c_id_table,
-- 
2.38.1

