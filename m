Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A761D9F57
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 20:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729276AbgESSZG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 14:25:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56190 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728948AbgESSZF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 14:25:05 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 24A5F2A2605
Received: by jupiter.universe (Postfix, from userid 1000)
        id 98BAD480101; Tue, 19 May 2020 20:25:01 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv2 2/5] Input: EXC3000: switch to i2c's probe_new API
Date:   Tue, 19 May 2020 20:24:44 +0200
Message-Id: <20200519182447.73405-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519182447.73405-1-sebastian.reichel@collabora.com>
References: <20200519182447.73405-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Switch to the "new" I2C probe API.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/input/touchscreen/exc3000.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index e007e2e8f626..555a14305cd4 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -145,8 +145,7 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static int exc3000_probe(struct i2c_client *client,
-			 const struct i2c_device_id *id)
+static int exc3000_probe(struct i2c_client *client)
 {
 	struct exc3000_data *data;
 	struct input_dev *input;
@@ -210,7 +209,7 @@ static struct i2c_driver exc3000_driver = {
 		.of_match_table = of_match_ptr(exc3000_of_match),
 	},
 	.id_table	= exc3000_id,
-	.probe		= exc3000_probe,
+	.probe_new	= exc3000_probe,
 };
 
 module_i2c_driver(exc3000_driver);
-- 
2.26.2

