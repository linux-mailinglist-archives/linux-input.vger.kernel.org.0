Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A12212CAAA
	for <lists+linux-input@lfdr.de>; Sun, 29 Dec 2019 20:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbfL2Tjf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 14:39:35 -0500
Received: from relay-b01.edpnet.be ([212.71.1.221]:45902 "EHLO
        relay-b01.edpnet.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727048AbfL2Tjf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 14:39:35 -0500
X-ASG-Debug-ID: 1577647294-0a7ff5137c265c4e0001-vblZzk
Received: from zotac.vandijck-laurijssen.be (77.109.105.251.adsl.dyn.edpnet.net [77.109.105.251]) by relay-b01.edpnet.be with ESMTP id Gs1YSSfSsOjvDBLS; Sun, 29 Dec 2019 20:21:34 +0100 (CET)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.105.251.adsl.dyn.edpnet.net[77.109.105.251]
X-Barracuda-Apparent-Source-IP: 77.109.105.251
Received: from x1.vandijck-laurijssen.be (x1.vandijck-laurijssen.be [192.168.0.36])
        by zotac.vandijck-laurijssen.be (Postfix) with ESMTPSA id A6268C02E4C;
        Sun, 29 Dec 2019 20:21:33 +0100 (CET)
From:   Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
To:     linux-input@vger.kernel.org
Cc:     linux-can@vger.kernel.org,
        Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Subject: [PATCH 2/6] cap11xx: support cap1208
Date:   Sun, 29 Dec 2019 20:21:13 +0100
X-ASG-Orig-Subj: [PATCH 2/6] cap11xx: support cap1208
Message-Id: <1577647277-8298-3-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Mailer: git-send-email 1.8.5.rc3
In-Reply-To: <1577647277-8298-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
References: <1577647277-8298-1-git-send-email-dev.kurt@vandijck-laurijssen.be>
X-Barracuda-Connect: 77.109.105.251.adsl.dyn.edpnet.net[77.109.105.251]
X-Barracuda-Start-Time: 1577647294
X-Barracuda-URL: https://212.71.1.221:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1419
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.6265 1.0000 0.8828
X-Barracuda-Spam-Score: 0.88
X-Barracuda-Spam-Status: No, SCORE=0.88 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.78985
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------------------------
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 drivers/input/keyboard/cap11xx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/keyboard/cap11xx.c b/drivers/input/keyboard/cap11xx.c
index 16287ab..092dcd2 100644
--- a/drivers/input/keyboard/cap11xx.c
+++ b/drivers/input/keyboard/cap11xx.c
@@ -97,12 +97,14 @@ enum {
 	CAP1106,
 	CAP1126,
 	CAP1188,
+	CAP1208,
 };
 
 static const struct cap11xx_hw_model cap11xx_devices[] = {
 	[CAP1106] = { .product_id = 0x55, .num_channels = 6, .num_leds = 0 },
 	[CAP1126] = { .product_id = 0x53, .num_channels = 6, .num_leds = 2 },
 	[CAP1188] = { .product_id = 0x50, .num_channels = 8, .num_leds = 8 },
+	[CAP1208] = { .product_id = 0x6b, .num_channels = 8, .num_leds = 0 },
 };
 
 static const struct reg_default cap11xx_reg_defaults[] = {
@@ -472,6 +474,7 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client,
 	{ .compatible = "microchip,cap1106", },
 	{ .compatible = "microchip,cap1126", },
 	{ .compatible = "microchip,cap1188", },
+	{ .compatible = "microchip,cap1208", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, cap11xx_dt_ids);
@@ -480,6 +483,7 @@ static int cap11xx_i2c_probe(struct i2c_client *i2c_client,
 	{ "cap1106", CAP1106 },
 	{ "cap1126", CAP1126 },
 	{ "cap1188", CAP1188 },
+	{ "cap1208", CAP1208 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, cap11xx_i2c_ids);
-- 
1.8.5.rc3

