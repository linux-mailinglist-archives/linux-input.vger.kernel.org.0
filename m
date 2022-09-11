Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209FD5B4B38
	for <lists+linux-input@lfdr.de>; Sun, 11 Sep 2022 03:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiIKBlM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 21:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbiIKBlJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 21:41:09 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB6732DA4
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 18:41:07 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id l5so4230637qvs.13
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 18:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=TVCgLHI6doxJO+C8xmrBxNy2DyFsnEYY2dswoZKE5JM=;
        b=oeoaIkxV0Fuf+OqJSjW+T81ab/aP9Fg5NTRvgrXw7z46AbDt4qN44e050xDr2FKgIZ
         FwYJjVPvdalFc2rVV/OPkhuxaVm9CFHHwL0BsHGR4/9APHGFMZMSimDl6GyIqKPTgEMQ
         +k33C3tcZ9S8IlnS0Kl11cWBGccWB7LtOfayE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=TVCgLHI6doxJO+C8xmrBxNy2DyFsnEYY2dswoZKE5JM=;
        b=oSzf9yYJvdKP4UKgP3UrAdJ4ledQuepPGStw+0xZumpdL2mog9gpO4Agvj0SCg84ko
         SWzu6U7o/YIXr+8Gbr57nM0wLtD448kVyOGfeZIDGNj1htyFym7zGcAwpMg0kx8iCha1
         Ww7n/hTbDPNhrCNt+vST36VRFsHIJnnM789+/CUrwa4dUYG4Zl8eEEZKI8/DG5dd/FSN
         Nn+AlF+zVTUD7XyBMpMUSPy8bsBEvGeQomfA+oJWA7UwzP8hJCNkDXeIUzUjuzuxAhz7
         PeE/Zy6fe2O4glL0nUv82T67zLn02dmlgsYr/49vRED7z6l0OnOy1PbGo0rX5P1LpBaT
         wCtg==
X-Gm-Message-State: ACgBeo2Te0USopN4f6e/KDCAJtVGTd9RYPuLjluI8CuPIT2zkylVGN5z
        yrcRupG/Ny3gkjaKv5ImOfHpH3CavuPD3s+xarQ=
X-Google-Smtp-Source: AA6agR6dbbSLsAlHCay/8aZh/7yY8ZouRstyZCThCYHwwTqxn4RetkzUX74LqLnee1WzVt6w3HVDsg==
X-Received: by 2002:a05:6214:2a81:b0:473:af82:9a95 with SMTP id jr1-20020a0562142a8100b00473af829a95mr17908794qvb.44.1662860467002;
        Sat, 10 Sep 2022 18:41:07 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:06 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v2 1/5] i2c: muxes: ltc4306: fix future recursive dependencies
Date:   Sat, 10 Sep 2022 18:40:44 -0700
Message-Id: <20220911014048.64235-2-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220911014048.64235-1-matt.ranostay@konsulko.com>
References: <20220911014048.64235-1-matt.ranostay@konsulko.com>
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

