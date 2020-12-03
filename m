Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FDD2CD69B
	for <lists+linux-input@lfdr.de>; Thu,  3 Dec 2020 14:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgLCNWx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Dec 2020 08:22:53 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:19833 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387653AbgLCNWx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Dec 2020 08:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607001600;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8SMbI6yVkHj4NPQvjTU7H4z9LztqFgyOWjDtBzDt84k=;
        b=nqPqCV7my3ZsGJaLNUnMb6+6nYtk5a7LocgPls+KqkuL2fgoeIriDKbcMLCta8EZW7
        lELBdwqxd9pjInxo12fb+ka3ijU9ciuFzpT2hJ1tzjYOlHgC9DSrj7GYJKIXHgSf5496
        OXZ6YNscxqJ0DV+hYfCpvB8aHYx06GJGV8/ME3Ixa0lp4QY7lZ/toxfGWkdICjcC61Vi
        p5WpTw+s3mn6BrKmPtaj2uM9RgLEtxPooya8C+7XnaItnQAiSt1tHH44/5UKmmcr4ta2
        bEcMRQrc5Xu1fRelqE7+V34mCH33z4q34+qilkQNcfGA7laNT1gRaqH+cz+6B2SGyotW
        rqnQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5G6JlbU="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id Z061efwB3DDwqif
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 3 Dec 2020 14:13:58 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] Input: tm2-touchkey - add vddio regulator
Date:   Thu,  3 Dec 2020 14:12:42 +0100
Message-Id: <20201203131242.44397-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203131242.44397-1-stephan@gerhold.net>
References: <20201203131242.44397-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Samsung touchkey controllers are often used with external pull-up
for the interrupt line and the I2C lines, so we might need to enable
a regulator to bring the lines into usable state. Otherwise, this might
cause spurious interrupts and reading from I2C will fail.

Implement support for a "vddio-supply" that is enabled by the
tm2-touchkey driver so that the regulator gets enabled when needed.

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/input/keyboard/tm2-touchkey.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboard/tm2-touchkey.c
index fb078e049413..6218b1c682ef 100644
--- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -48,7 +48,7 @@ struct tm2_touchkey_data {
 	struct input_dev *input_dev;
 	struct led_classdev led_dev;
 	struct regulator *vdd;
-	struct regulator_bulk_data regulators[2];
+	struct regulator_bulk_data regulators[3];
 	const struct touchkey_variant *variant;
 	u32 keycodes[4];
 	int num_keycodes;
@@ -204,6 +204,7 @@ static int tm2_touchkey_probe(struct i2c_client *client,
 
 	touchkey->regulators[0].supply = "vcc";
 	touchkey->regulators[1].supply = "vdd";
+	touchkey->regulators[2].supply = "vddio";
 	error = devm_regulator_bulk_get(&client->dev,
 					ARRAY_SIZE(touchkey->regulators),
 					touchkey->regulators);
-- 
2.29.2

