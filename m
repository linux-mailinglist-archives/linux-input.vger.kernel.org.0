Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22D05BF65E
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 08:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiIUGbF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 02:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiIUGay (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 02:30:54 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AEC4F196
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:53 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id d1so3822304qvs.0
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3OBHFG8N1Wi/0+IDhzqdlFHWU7KQ36OfnHlG8UgKWrs=;
        b=guDbos8H+2MulL5VMihZeNnAKhgf5f7tTlWaiadNPoot+VqaoIjDN+78BC+UdAl3nt
         YFVMuCtgffobaeY3UYySVas8gJlgyOl7w37Kjj9hMHvJnsoTmHazpfiRPc+rp+Ev0RYH
         FOKrLxndUHSLj6N41V4mNFZp2HzCBgz7vH3M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3OBHFG8N1Wi/0+IDhzqdlFHWU7KQ36OfnHlG8UgKWrs=;
        b=2sxn+JIvmBYMEB+KTyPT3/HeCnismA7Zw+jmWKyHCfafcSAhm0Q3pF/G2D9t1GdI7E
         FG7C7coGWW8i8pbOb63yalXDjiEwSOa1LnbAtASxtsiPQTFdIFcAExiJFr9x4/c0yHf3
         je2BwO3V9E9kNrtbJ2TQqe2T3y4F8x0e2EVFIxWeA2ii5dZrD6CYEUi/BiKHrGfjqSxT
         08n56Uewkin5hYcN9gQjmpa27iR5ic+ZNsMUzwtH71xWPOfr1Yi84CRE1SoAFsMCtdg1
         NfrNO5uQMNpNjw0jgSwbWoJndqrfsyaZQ/GbrqzrfxsRDLGmtEFGq7Mkfi5k0VM31vZ2
         KzoA==
X-Gm-Message-State: ACrzQf1udIVKk8xYoqxFVnZxLPo+TrcZJU/RzCfnJEXQX26GXWTY/bOH
        9jGucoKAvT8IbwChl3u4PFlIRQ==
X-Google-Smtp-Source: AMsMyM7zFvK7QiqfmPImkZGwRtcWCoH4lq1sjNgZgk8F/zIlG7fpfDbQC9BVrs9Do3P7lyUFBIXuuA==
X-Received: by 2002:a05:6214:2588:b0:49e:5dea:8e66 with SMTP id fq8-20020a056214258800b0049e5dea8e66mr22486940qvb.21.1663741852744;
        Tue, 20 Sep 2022 23:30:52 -0700 (PDT)
Received: from localhost.localdomain ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id m10-20020ac807ca000000b00342f05defd1sm1060855qth.66.2022.09.20.23.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:30:52 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v4 3/5] iio: dac: fix future recursive dependencies
Date:   Tue, 20 Sep 2022 23:30:24 -0700
Message-Id: <20220921063026.89619-4-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220921063026.89619-1-matt.ranostay@konsulko.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When using 'imply IIO' for other configurations which have 'select GPIOLIB'
the following recursive dependency is detected for AD5592R/AD5593R

Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
recommendation in kconfig-language.rst

drivers/gpio/Kconfig:14:error: recursive dependency detected!
drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by AD5592R
drivers/iio/dac/Kconfig:93:     symbol AD5592R depends on IIO
drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/iio/dac/Kconfig | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 80521bd28d0f..b93003e80b70 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -92,8 +92,7 @@ config AD5592R_BASE
 
 config AD5592R
 	tristate "Analog Devices AD5592R ADC/DAC driver"
-	depends on SPI_MASTER
-	select GPIOLIB
+	depends on SPI_MASTER && GPIOLIB
 	select AD5592R_BASE
 	help
 	  Say yes here to build support for Analog Devices AD5592R
@@ -104,8 +103,7 @@ config AD5592R
 
 config AD5593R
 	tristate "Analog Devices AD5593R ADC/DAC driver"
-	depends on I2C
-	select GPIOLIB
+	depends on I2C && GPIOLIB
 	select AD5592R_BASE
 	help
 	  Say yes here to build support for Analog Devices AD5593R
-- 
2.37.2

