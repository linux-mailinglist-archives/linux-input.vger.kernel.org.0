Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC6A65B5F54
	for <lists+linux-input@lfdr.de>; Mon, 12 Sep 2022 19:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbiILRcY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Sep 2022 13:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbiILRcW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Sep 2022 13:32:22 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8C21EC5E
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 10:32:21 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id b23so1839951qtr.13
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 10:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TVCgLHI6doxJO+C8xmrBxNy2DyFsnEYY2dswoZKE5JM=;
        b=RvNoI+RXBUolsFk9NDjJyaJaLEEqnkmDehbv2qaSWEKZjSasX7ODEEHGu2eu8uprJj
         NfHE+A9P80Mivo8zajIXc43GejzE+Jc+B27gvA0/J3Z4akyaEoVovaZINquyL9jp7gr0
         gabhCt6cDtkddjdWp23ca1ZHRXQqwqC8ybsto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TVCgLHI6doxJO+C8xmrBxNy2DyFsnEYY2dswoZKE5JM=;
        b=UZ3VAr0xUn0BPTPOulvDSvjK4Gq0opPPW1s3ywy9SmLZzXUzX3CHQRHZNAhgJ/9O1I
         d1b1ip/HVHaZ752/ugJkwjPSfaa0z9KkXDxoMtUoDEOGpSLCMu6+3mDayepBpafcW944
         u+YvAg894aXDpKJgKOpPNdhc+Lc1Ge9Os/uXVq8z9dnxjgbAYkK5lKoH2RjnffRcMT9q
         KHcaNZrdOSgyrO/zSSB/pQcRC+dNj16pzCn3ZoQ5DTp+QVKc2la8HkJqIT2XDlI/V674
         onyV9eVX9OuGBxw6UT9fxf93bwt/HQAs7dq16+w83CCvnEkpJOIxvw8z7oHej+uKoOIe
         kEwA==
X-Gm-Message-State: ACgBeo3GSN90WMsm3F7IFew0/DkbDm6MnkDFRb7CTw65mO6il8u+mFgP
        5Mfp9RuhVNGMNPAc6+xC5u1K3scajasoXPId
X-Google-Smtp-Source: AA6agR55qCs0zERnpRPB5l4Br0DRhsycobSsxD/32DEs/WDcB9gwWY3p+3Nc+dzJz7Qxe922lzACYA==
X-Received: by 2002:a05:622a:199c:b0:344:7645:9ba1 with SMTP id u28-20020a05622a199c00b0034476459ba1mr24647270qtc.629.1663003940345;
        Mon, 12 Sep 2022 10:32:20 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id h63-20020a376c42000000b006b8d1914504sm8289394qkc.22.2022.09.12.10.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 10:32:20 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v3 1/5] i2c: muxes: ltc4306: fix future recursive dependencies
Date:   Mon, 12 Sep 2022 10:31:58 -0700
Message-Id: <20220912173202.16723-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912173202.16723-1-matt.ranostay@konsulko.com>
References: <20220912173202.16723-1-matt.ranostay@konsulko.com>
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

When using 'imply IIO' for other configurations which have 'select GPIOLIB'
the following recursive dependency detected happens for I2C_MUX_LTC4306

Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
recommendation in kconfig-language.rst

drivers/gpio/Kconfig:14:error: recursive dependency detected!
drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by I2C_MUX_LTC4306
drivers/i2c/muxes/Kconfig:47:   symbol I2C_MUX_LTC4306 depends on I2C_MUX
drivers/i2c/Kconfig:62: symbol I2C_MUX is selected by MPU3050_I2C
drivers/iio/gyro/Kconfig:127:   symbol MPU3050_I2C depends on IIO
drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/i2c/muxes/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
index ea838dbae32e..7b6a68df4a39 100644
--- a/drivers/i2c/muxes/Kconfig
+++ b/drivers/i2c/muxes/Kconfig
@@ -46,7 +46,7 @@ config I2C_MUX_GPMUX
 
 config I2C_MUX_LTC4306
 	tristate "LTC LTC4306/5 I2C multiplexer"
-	select GPIOLIB
+	depends on GPIOLIB
 	select REGMAP_I2C
 	help
 	  If you say yes here you get support for the Analog Devices
-- 
2.37.2

