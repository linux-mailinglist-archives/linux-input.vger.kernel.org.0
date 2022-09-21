Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B1B5BF65A
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 08:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbiIUGbD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 02:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiIUGav (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 02:30:51 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADC629CB5
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:49 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id u28so3348918qku.2
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/093o1NxENUaTouo0Mdw75upRRId/THkS7GyiJgLLTE=;
        b=FgUmzi1dfdXBxW+EWGXKjLCCuHAwhBsR5vQEA9muOyMr3dKPjhQ2mBAg9784oU0vcW
         QOuE694beWFUhq9p6GmdXGsPjvjTIQJTbxYECtkIYuUDiq6qZBgne0upMcPEUNhDym1E
         XX6BATaZn61RKYAd5Gzu/uG0Z07kB76Sgdx3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/093o1NxENUaTouo0Mdw75upRRId/THkS7GyiJgLLTE=;
        b=JLEYZX+WbHdoA1QDB0iAPc27somu+/HSnx9bUYjNVT/cGPinOa4j07cUgiwtOXmybY
         4iuSWet4QWYMrUJDCQEwLmqe2WKocCq+RraXl6HmjWT2Cbd3jc9Tr5vBXpFxPbgMtLma
         XCUFsclgloiCvNUYmmiC6GNMQVnibWPCcsj8Xe2N24HJFPd7kd6ghLskQT7PSYTK7l/4
         1GIsv3CiV0q6zf/lBXnt5jT+ognaTzx5m9H19af2mNMYJx4HWA2BWM6z+KcHoo9q9iAJ
         lHVKsuNET9A5yL5pTqFYhaSeJsF8XRlOZlowC2dX+lZbcKMFdkrqjQLUa5aTiClHDo8e
         o+7w==
X-Gm-Message-State: ACrzQf1ebf7V+6KnIfihe8PFY0YGfQ8EdbG8XVsNuPOl9O4b0sXXny9w
        TfERNhEOhCbEZf2YRDlkeiJrxCU11G819eK4D+c=
X-Google-Smtp-Source: AMsMyM7VVlNQFM2jb19B9vU1xma0PWwNFZ9Hwj6vv6nqxc1WcJIo9JThqwHvdsmROp7UflCFr+TP6w==
X-Received: by 2002:a05:620a:4809:b0:6ce:496c:7e78 with SMTP id eb9-20020a05620a480900b006ce496c7e78mr18631613qkb.470.1663741848731;
        Tue, 20 Sep 2022 23:30:48 -0700 (PDT)
Received: from localhost.localdomain ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id m10-20020ac807ca000000b00342f05defd1sm1060855qth.66.2022.09.20.23.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:30:48 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v4 1/5] i2c: muxes: ltc4306: fix future recursive dependencies
Date:   Tue, 20 Sep 2022 23:30:22 -0700
Message-Id: <20220921063026.89619-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921063026.89619-1-matt.ranostay@konsulko.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When using 'imply IIO' for other configurations which have 'select GPIOLIB'
the following recursive dependency is detected for I2C_MUX_LTC4306

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

