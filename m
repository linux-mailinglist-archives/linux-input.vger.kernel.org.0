Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9864F5B4B3C
	for <lists+linux-input@lfdr.de>; Sun, 11 Sep 2022 03:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiIKBlN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 21:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiIKBlL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 21:41:11 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ECD33424
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 18:41:10 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id c19so1961689qkm.7
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 18:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=wUfUODMZKfU/KRMGIPcJ/EprHfUIajE7CfzqJDq54Sc=;
        b=X/wGV2VLKPM41GBNPVmj/Ik9dl6bKc59iC9TiPfHcpc9QgI8SbLKntgeQCqoA7MqgV
         g1zOHz7umwNdtI6zKQiKh8JOftpweA418DhQmaGp5+OPfME2mCYYl7B9fwE2iNnud3vl
         XYdECviAx0Nci2jpYOOCS8wnuD4vYFRXSz3ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=wUfUODMZKfU/KRMGIPcJ/EprHfUIajE7CfzqJDq54Sc=;
        b=dEAqBSgmNnMxRw2ZdK4N+Ymb2kSbVd6lw5EkFjAu/eBqUauxSSSYnpezjQD2hc33W4
         bJU+loyx+RYj0ARSmfZtNga8XadOCU+pnMJXhgfEm7mSV7FstypRvNE0qzRcxDmkiZeG
         C8uNAXCKzW7NcPLbEqe3bTWqIrWHYKBkxuKbyWFzcaKDDJiqmym92uz6eQs/ePyj2LcV
         mM9iGqgaVebk6xSOYxYUOw9IJjZBn/j/lXN3sMM8olLBF0hOjltcvkb815zMcdhYzoDB
         4Mj88Aov6eVeh/dXn4l9bNfE6Sm26DkeYhtQKdW6gB3F4T46qIS1ykPtEt7Ivw7U9QPe
         w8Zg==
X-Gm-Message-State: ACgBeo3e+TZHIksEJIc5Ope3GSoE4ClNBhRH2CteIlWnEUY4HvWp8yH7
        UNT4jtY9wSb7UH8uqlOEGmu/ZA==
X-Google-Smtp-Source: AA6agR7gtrVhQaNCx+8D8JtPVoCa7mQHb9j8E6uOWozp39f7/GAVTA8jFLa/bqQYpCgkpB1zm3OQWw==
X-Received: by 2002:a37:68c6:0:b0:6cd:e798:f07c with SMTP id d189-20020a3768c6000000b006cde798f07cmr5503925qkc.596.1662860469940;
        Sat, 10 Sep 2022 18:41:09 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:09 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v2 3/5] iio: dac: fix future recursive dependencies
Date:   Sat, 10 Sep 2022 18:40:46 -0700
Message-Id: <20220911014048.64235-4-matt.ranostay@konsulko.com>
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
the following recursive dependency detected happens for AD5592R and AD5593R.

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

