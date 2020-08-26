Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D52B825366A
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 20:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgHZSRb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 14:17:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:39832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726880AbgHZSR1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 14:17:27 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A164208E4;
        Wed, 26 Aug 2020 18:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598465847;
        bh=TiIrBmN1ONi32fa4mRcnLGuieT5Nl7bSCxSC4PoSTzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZZO5SlWvjTrCiD6iyjn4f+q3YCxVbTXwCS87P9oriwT8n5rVtd0bNP9Jg3CMmH+C9
         urThHpiJAUtBGrV3yMy26stL6qsNaSFnFQzKomWLHhNyhxG1FvuRDHuJsHy0IUkFXC
         /03lSd0CFt6070MWGRfWEB7BXOJ0//sJGpEkuscQ=
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
Subject: [PATCH 03/24] Input: gpio_keys_polled - Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 20:16:45 +0200
Message-Id: <20200826181706.11098-3-krzk@kernel.org>
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
 drivers/input/keyboard/gpio_keys_polled.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/gpio_keys_polled.c b/drivers/input/keyboard/gpio_keys_polled.c
index c3937d2fc744..ba00ecfbd343 100644
--- a/drivers/input/keyboard/gpio_keys_polled.c
+++ b/drivers/input/keyboard/gpio_keys_polled.c
@@ -299,13 +299,9 @@ static int gpio_keys_polled_probe(struct platform_device *pdev)
 							     NULL, GPIOD_IN,
 							     button->desc);
 			if (IS_ERR(bdata->gpiod)) {
-				error = PTR_ERR(bdata->gpiod);
-				if (error != -EPROBE_DEFER)
-					dev_err(dev,
-						"failed to get gpio: %d\n",
-						error);
 				fwnode_handle_put(child);
-				return error;
+				return dev_err_probe(dev, PTR_ERR(bdata->gpiod),
+						     "failed to get gpio\n");
 			}
 		} else if (gpio_is_valid(button->gpio)) {
 			/*
-- 
2.17.1

