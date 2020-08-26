Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C40253678
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgHZSSO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:18:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:41346 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbgHZSSI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:18:08 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E75A7207BC;
        Wed, 26 Aug 2020 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465887;
        bh=yUWk4mxpG57bJBzNpi9hhgtOa+YH60rJgWNHNjOCKYU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mzA/IFNvdnNL84fmvXjdwguBJmeSPEKraTBzx3+o5u5pKwo6uIJ0SfByLdgw7DzOO
         Ysnr5vvRwzUbbTjd5Gy3qNk6QanQaBGlOE92WtwUKV4DwXHcwQSLbauOZrwipujpE9
         mfymSLWIZsaC9Zk1S7jRY/bTvxVnVrXuRZVkzef4=
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
Subject: [PATCH 10/24] Input: bu21029_ts - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:16:52 +0200
Message-Id: <20200826181706.11098-10-krzk@kernel.org>
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
 drivers/input/touchscreen/bu21029_ts.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 49a8d4bbca3a..96c178b606dc 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -360,23 +360,15 @@ static int bu21029_probe(struct i2c_client *client,
 	}
 
 	bu21029->vdd = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(bu21029->vdd)) {
-		error = PTR_ERR(bu21029->vdd);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to acquire 'vdd' supply: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(bu21029->vdd))
+		return dev_err_probe(&client->dev, PTR_ERR(bu21029->vdd),
+				     "failed to acquire 'vdd' supply\n");
 
 	bu21029->reset_gpios = devm_gpiod_get_optional(&client->dev,
 						       "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(bu21029->reset_gpios)) {
-		error = PTR_ERR(bu21029->reset_gpios);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to acquire 'reset' gpio: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(bu21029->reset_gpios))
+		return dev_err_probe(&client->dev, PTR_ERR(bu21029->reset_gpios),
+				     "failed to acquire 'reset' gpio\n");
 
 	in_dev = devm_input_allocate_device(&client->dev);
 	if (!in_dev) {
-- 
2.17.1

