Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 269185B5F58
	for <lists+linux-input@lfdr.de>; Mon, 12 Sep 2022 19:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiILRcZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Sep 2022 13:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbiILRcY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Sep 2022 13:32:24 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D68B8255A6
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 10:32:22 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id 3so6160786qka.5
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 10:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YEluTMkVQhnCulwc8lwLW2vyLgQvDTIQ3djmLSBHRwA=;
        b=lgj5k5WWPKvkPTZvPgBnH+Z8PQ6d5iVrT9qtPK+SlRvbwMQXm1tA3KijkKbk40pMlI
         OHCZMdByFkaF1NEMGuU8Q61QxXYlsiTyAEEwMeJIqQKCJt+DVbpfsA83VeaGuRlvDHmU
         9WVHsoDbMHkldAVlaRs+NUmj5z0VMKbvw5/YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YEluTMkVQhnCulwc8lwLW2vyLgQvDTIQ3djmLSBHRwA=;
        b=GYgy5yPH4Q3whqxfBRo7wLYUiblkRJfKQULjwEPb/c+eFzqlXn3E2VzpRJq3efnUxn
         YrGeqwSj0ULcbs1+4hbc3oyV+pUT7vz7QG6d81+oMtB8hIeqKhOaLktRpiMxcB2YPjWT
         R7LoJWinP+hbwMQIrE2zK70BP/xW7in00suoFsMXAmD13shFr/nGthnviqtSLQ3US6WQ
         QNWzsTQGxTkKV017R5Mtl4Xr9uAaHYZi4gLGFhKn0guK1e+yHsEqRUYtTjVf4EHw5Dq/
         lEILxwN1wZg43uOkZK3go53SXe8MxAm2262s3Af5YOROQG6Me/GZYe7RaGjhyzE1cXAW
         tHLA==
X-Gm-Message-State: ACgBeo2aaW59pBB63UFT4yKfPUFbjVYC96szHTJmjEvGCM8/hD0NvV91
        6cptddYqHynfN66nxhejb6naNQ==
X-Google-Smtp-Source: AA6agR7jD/N/A5Mqe4C+ePHGGjcU6jhoG9397WhahTmz6Tha0Hs+fNrk1RG7+KT1oxUX/n4jaa4tEw==
X-Received: by 2002:a05:620a:4155:b0:6ce:3e4f:9b1c with SMTP id k21-20020a05620a415500b006ce3e4f9b1cmr3563613qko.744.1663003942012;
        Mon, 12 Sep 2022 10:32:22 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id h63-20020a376c42000000b006b8d1914504sm8289394qkc.22.2022.09.12.10.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 10:32:21 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v3 2/5] iio: addac: stx104: fix future recursive dependencies
Date:   Mon, 12 Sep 2022 10:31:59 -0700
Message-Id: <20220912173202.16723-3-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912173202.16723-1-matt.ranostay@konsulko.com>
References: <20220912173202.16723-1-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When using 'imply IIO' for other configurations which have 'select GPIOLIB'
the following recursive dependency detected happens for STX1040

Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
recommendation in kconfig-language.rst

drivers/gpio/Kconfig:14:error: recursive dependency detected!
drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by STX104
drivers/iio/addac/Kconfig:20:   symbol STX104 depends on IIO
drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/iio/addac/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/addac/Kconfig b/drivers/iio/addac/Kconfig
index fcf6d2269bfc..494790816ac7 100644
--- a/drivers/iio/addac/Kconfig
+++ b/drivers/iio/addac/Kconfig
@@ -19,9 +19,8 @@ config AD74413R
 
 config STX104
 	tristate "Apex Embedded Systems STX104 driver"
-	depends on PC104 && X86
+	depends on PC104 && X86 && GPIOLIB
 	select ISA_BUS_API
-	select GPIOLIB
 	help
 	  Say yes here to build support for the Apex Embedded Systems STX104
 	  integrated analog PC/104 card.
-- 
2.37.2

