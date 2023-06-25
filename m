Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C6A073D240
	for <lists+linux-input@lfdr.de>; Sun, 25 Jun 2023 18:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjFYQ3S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Jun 2023 12:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231277AbjFYQ3A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Jun 2023 12:29:00 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5D41987
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:43 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98dfb3f9af6so224213366b.2
        for <linux-input@vger.kernel.org>; Sun, 25 Jun 2023 09:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687710521; x=1690302521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5+luIM4oVY6m4zwxYa0g/reTrWlxSPcpRwy11iCAXI=;
        b=IQ2yWkgTiwDkHCY0+Tqkm2zbfLKoJml0PgbbWrjnchB8GS1SAX3Y+H7ulDlOPz1B3N
         EPQ8m31vpqjV0EHG0hR3oPHA0c0EspOE5kT8TLcObZc2EkDq0kqH+hoSluV4YbjSo5aE
         PKxB0TTagHMQk5X8R1qRINRPA3BdHBZls693D3yFg28xyBDHYBTrL5hlz7uONvZ1Pkuz
         pZFNQ20pJAtACzMnczzwIQ4JCxoNb7fg2JDQMcq6zaDyI9dafAigsTedjlD2wMaaY9Qr
         ntBr6Qq9E+b9mWdS+I/13PNrkrh80t2CayU27HjI3NgzW6BFt4eX5KOU9UzROrBJlDNo
         qpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687710521; x=1690302521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5+luIM4oVY6m4zwxYa0g/reTrWlxSPcpRwy11iCAXI=;
        b=FnboolvKO8FKradPF33BRpHyXp/yIoMOF85w1IUTDWLQ3KemGPUtLVKi+XycUxi/w5
         Z1A9ybbtowN5GoQvtzHlsDPQYxpa+OQ+oXrtaVOlYQOU/xmBW9HBIq3sJH1qUwswksqW
         4ciLdRsgWm3gWH33SDuCBqSIvaihXyhiEJeYOWHO5Aoaosk+vEWJJT5Ex7Gy/nX8gtUg
         j7S9TXvMqJt/n7JyJsc5z9lUWVy1NiSwLBfnvZXOsKBifN3jOzcGMdDJgsxkYTfyeUR2
         Nlws2rhW3tT6Gh6vOlWfS3k2LEQgUl6cXkoUn4RF34DGzog2X6mnu5xeoubHNPBSbxUe
         uMGA==
X-Gm-Message-State: AC+VfDx05A8aWAX8e5+Ki28OezRcW5IQtGc/cHiHzQfUFhfY9OcFekxh
        Co8CClj0aqozTc+OHA1J97WtMw==
X-Google-Smtp-Source: ACHHUZ6vsiA9/DSLRqNIlnxoU4ovUfE9V6n7VWjRWzRhGHUCuO6OrEWd4hhBWENte2ulXVTrOwwrBA==
X-Received: by 2002:a17:907:847:b0:977:d53e:4055 with SMTP id ww7-20020a170907084700b00977d53e4055mr23345868ejb.58.1687710521262;
        Sun, 25 Jun 2023 09:28:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ec10-20020a170906b6ca00b00982be08a9besm2277731ejb.172.2023.06.25.09.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 09:28:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v4 10/24] Input: edf-ft5x06 - Simplify with dev_err_probe()
Date:   Sun, 25 Jun 2023 18:28:03 +0200
Message-Id: <20230625162817.100397-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 795c7dad22bf..457d53337fbb 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1168,13 +1168,9 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	tsdata->max_support_points = chip_data->max_support_points;
 
 	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(tsdata->vcc)) {
-		error = PTR_ERR(tsdata->vcc);
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"failed to request regulator: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(tsdata->vcc))
+		return dev_err_probe(&client->dev, PTR_ERR(tsdata->vcc),
+				     "failed to request regulator\n");
 
 	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
 	if (IS_ERR(tsdata->iovcc)) {
-- 
2.34.1

