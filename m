Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DC52304E
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2019 11:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732121AbfETJ1X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from sauhun.de ([88.99.104.3]:49472 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730773AbfETJ1X (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 05:27:23 -0400
Received: from localhost (p54B333DA.dip0.t-ipconnect.de [84.179.51.218])
        by pokefinder.org (Postfix) with ESMTPSA id C88222C5DC5;
        Mon, 20 May 2019 11:27:21 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-input@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH RESEND 1/2] input: da9063_onkey: remove platform_data support
Date:   Mon, 20 May 2019 11:27:10 +0200
Message-Id: <20190520092711.30662-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
References: <20190520092711.30662-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are no in-kernel users anymore, so remove this outdated interface.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>
---
 drivers/input/misc/da9063_onkey.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index 3e9c353d82ef..e3a273c74123 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -22,7 +22,6 @@
 #include <linux/regmap.h>
 #include <linux/of.h>
 #include <linux/mfd/da9063/core.h>
-#include <linux/mfd/da9063/pdata.h>
 #include <linux/mfd/da9063/registers.h>
 #include <linux/mfd/da9062/core.h>
 #include <linux/mfd/da9062/registers.h>
@@ -201,8 +200,6 @@ static void da9063_cancel_poll(void *data)
 
 static int da9063_onkey_probe(struct platform_device *pdev)
 {
-	struct da9063 *da9063 = dev_get_drvdata(pdev->dev.parent);
-	struct da9063_pdata *pdata = dev_get_platdata(da9063->dev);
 	struct da9063_onkey *onkey;
 	const struct of_device_id *match;
 	int irq;
@@ -229,12 +226,8 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
-	if (pdata)
-		onkey->key_power = pdata->key_power;
-	else
-		onkey->key_power =
-			!of_property_read_bool(pdev->dev.of_node,
-					       "dlg,disable-key-power");
+	onkey->key_power = !of_property_read_bool(pdev->dev.of_node,
+						  "dlg,disable-key-power");
 
 	onkey->input = devm_input_allocate_device(&pdev->dev);
 	if (!onkey->input) {
-- 
2.19.1

