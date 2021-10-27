Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5E6E43D0B6
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243551AbhJ0S2F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:28:05 -0400
Received: from box.trvn.ru ([194.87.146.52]:49831 "EHLO box.trvn.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243549AbhJ0S2E (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:28:04 -0400
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.trvn.ru (Postfix) with ESMTPSA id 1239440519;
        Wed, 27 Oct 2021 23:15:27 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
        t=1635358527; bh=ar/AyF5GUE1L2gpjDkjuwKzVAeg5SZPXsABa6hsTHcM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0S1XCdVeGxOHY+WyN5YS5cxkwDHPZVjvBOIf+zO7aGh+uBJqvS1F3u7/V34XwAdZ8
         yGJaGjgftDXNHqj5OTbOeexmnjLTKKIVD6ulnRQUgbtGvg2CWbbxp00I32Po5oBFyx
         FJBiuH4XgHf08y2wV2++pPuAl9utWYHVbp71JULEigZiL150QLSt/zLI3DkNYgb4IE
         nFyygfmW/HiiT/0WZ5vXyPAuPG5xkyBf7WJf5yQs02upcdXE4NewIcgK+0uBrbyhlc
         UOMOfearjy4asHZr7Y9YzTsVfRJhD0+xflFq3zeIUbeHA+IVjoRyIoRfhjPo4wt4dN
         TIrhDA6vRm4zQ==
From:   Nikita Travkin <nikita@trvn.ru>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 3/6] Input: zinitix - Handle proper supply names
Date:   Wed, 27 Oct 2021 23:13:47 +0500
Message-Id: <20211027181350.91630-4-nikita@trvn.ru>
In-Reply-To: <20211027181350.91630-1-nikita@trvn.ru>
References: <20211027181350.91630-1-nikita@trvn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

The supply names of the Zinitix touchscreen were a bit confused, the new
bindings rectifies this.

To deal with old and new devicetrees, first check if we have "vddo" and in
case that exists assume the old supply names. Else go and look for the new
ones.

We cannot just get the regulators since we would get an OK and a dummy
regulator: we need to check explicitly for the old supply name.

Use struct device *dev as a local variable instead of the I2C client since
the device is what we are actually obtaining the resources from.

Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Srba <Michael.Srba@seznam.cz>
Cc: phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
[Slightly changed the legacy regulator detection]
Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
This patch was previously submitted here:
https://lore.kernel.org/linux-input/20210625113435.2539282-2-linus.walleij@linaro.org/

Changes since the original patch:
 - Adress the review comments by Dmitry:
   Drop explict OF check and use of_find_property()
---
 drivers/input/touchscreen/zinitix.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 1e70b8d2a8d7..d4e06a88a883 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -252,16 +252,27 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 
 static int zinitix_init_regulators(struct bt541_ts_data *bt541)
 {
-	struct i2c_client *client = bt541->client;
+	struct device *dev = &bt541->client->dev;
 	int error;
 
-	bt541->supplies[0].supply = "vdd";
-	bt541->supplies[1].supply = "vddo";
-	error = devm_regulator_bulk_get(&client->dev,
+	/*
+	 * Some older device trees have erroneous names for the regulators,
+	 * so check if "vddo" is present and in that case use these names
+	 * and warn. Else use the proper supply names on the component.
+	 */
+	if (of_find_property(dev->of_node, "vddo-supply", NULL)) {
+		bt541->supplies[0].supply = "vdd";
+		bt541->supplies[1].supply = "vddo";
+	} else {
+		/* Else use the proper supply names */
+		bt541->supplies[0].supply = "vcca";
+		bt541->supplies[1].supply = "vdd";
+	}
+	error = devm_regulator_bulk_get(dev,
 					ARRAY_SIZE(bt541->supplies),
 					bt541->supplies);
 	if (error < 0) {
-		dev_err(&client->dev, "Failed to get regulators: %d\n", error);
+		dev_err(dev, "Failed to get regulators: %d\n", error);
 		return error;
 	}
 
-- 
2.30.2

