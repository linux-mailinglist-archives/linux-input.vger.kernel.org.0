Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E563C25368A
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgHZSTB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:19:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:43492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727937AbgHZSS5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:18:57 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66921214F1;
        Wed, 26 Aug 2020 18:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465937;
        bh=IUvTqqXBFc4hRe8hE39JcMQiPU85dhjMfKQTxHNFxas=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WfADOt/TlUwzElF8vASKklglMVOxWZhclG0AOj7/fTodFk6dogEnDdIvtp/4g4bnv
         nEhaXLlXSZe/gB4AOMS5FVFjL/3KpSonsWT9JLBivFJYWSNa2HYazJHuLm6q5QbwUB
         6yBSk+sK1pU/Oxb0ir9kS8sicymtREOp73Wkcxkw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 24/24] Input: sx8643 - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:17:06 +0200
Message-Id: <20200826181706.11098-24-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200826181706.11098-1-krzk@kernel.org>
References: <20200826181706.11098-1-krzk@kernel.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/input/touchscreen/sx8654.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/sx8654.c b/drivers/input/touchscreen/sx8654.c
index de85e57b2486..d2ed9be64c3a 100644
--- a/drivers/input/touchscreen/sx8654.c
+++ b/drivers/input/touchscreen/sx8654.c
@@ -323,13 +323,9 @@ static int sx8654_probe(struct i2c_client *client,
 
 	sx8654->gpio_reset = devm_gpiod_get_optional(&client->dev, "reset",
 						     GPIOD_OUT_HIGH);
-	if (IS_ERR(sx8654->gpio_reset)) {
-		error = PTR_ERR(sx8654->gpio_reset);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev, "unable to get reset-gpio: %d\n",
-				error);
-		return error;
-	}
+	if (IS_ERR(sx8654->gpio_reset))
+		return dev_err_probe(&client->dev, PTR_ERR(sx8654->gpio_reset),
+				     "unable to get reset-gpio\n");
 	dev_dbg(&client->dev, "got GPIO reset pin\n");
 
 	sx8654->data = device_get_match_data(&client->dev);
-- 
2.17.1

