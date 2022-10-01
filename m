Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90A4C5F17AB
	for <lists+linux-input@lfdr.de>; Sat,  1 Oct 2022 02:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbiJAAwf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Sep 2022 20:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231758AbiJAAwe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Sep 2022 20:52:34 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD06157B9E
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 17:52:33 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id b23so3634726qtr.13
        for <linux-input@vger.kernel.org>; Fri, 30 Sep 2022 17:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=43gzEa2PJ7BwB8QNFJAKxtAPXq825c9gJhzxVtgpXYU=;
        b=gCL0o32ELkJnWqHRNTnsP6xIKkDAUr6r8ssfKQeZIThUxYB3urPC6CTLHqWDhMRfOG
         rti47f5kn/2jTKY4SRrtNz1jNVXaEfEp11rCEWWGro/c19syTjKGW4minl3AZ+XCW0+N
         d/cwCADQiRgXOwuGZkCxKkXk2ZIumLrTCK+rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=43gzEa2PJ7BwB8QNFJAKxtAPXq825c9gJhzxVtgpXYU=;
        b=pAUEt71N79pPKGJZchmDChmyOKwC/Dx5RLXCIeAwynCLhGBHz2WAhtcy3gP2cZfwCR
         l4dKrK8vVJa7gJUhCs5kurblwDLOsCfdV/e9CDh9QoKEeeGM17WnqjvJbguhNCwKl4PS
         dnDhK4H0CuucpEn7VpOKFYHzc5yV1aVUHLKjzpe8MRmuagyrEcClcSjy4sRpIxUOfhmx
         knu1FIwGHNRv1V940P2o3qfjfIjuTkegDlzQM5XcG+/9YyOWeX8KQx/Hwgf+koxV3ZAf
         YI09/0CfV3VkGAZN5DJHov9c7Ui+T1QD6/23y/5xtqR3LGh/J9ULmlNncmhAihbbZF0e
         HMuA==
X-Gm-Message-State: ACrzQf2+/I0abhYx9tBLskdXB0K/R8ydsQb+WpaBYCd6e+wD4H/XBnRZ
        9i48/DZo30Lad9nrEudp8JQrNg==
X-Google-Smtp-Source: AMsMyM5wOUMSFzTFjMEkSPzbPyBHI15ta9wP8AM4Ym2l1rCQqx43ikewMl5EhIbgKpaHRdCDOpunZg==
X-Received: by 2002:a05:622a:1390:b0:35d:1f0a:dd99 with SMTP id o16-20020a05622a139000b0035d1f0add99mr9371443qtk.403.1664585553133;
        Fri, 30 Sep 2022 17:52:33 -0700 (PDT)
Received: from localhost.localdomain ([185.193.125.71])
        by smtp.gmail.com with ESMTPSA id r10-20020a05622a034a00b0035ce8965045sm3224817qtw.42.2022.09.30.17.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 17:52:32 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org
Cc:     linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v6 2/3] HID: mcp2221: change 'select GPIOLIB' to imply
Date:   Fri, 30 Sep 2022 17:52:07 -0700
Message-Id: <20221001005208.8010-3-matt.ranostay@konsulko.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221001005208.8010-1-matt.ranostay@konsulko.com>
References: <20221001005208.8010-1-matt.ranostay@konsulko.com>
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

To avoid recursive dependencies on GPIOLIB when 'imply IIO' is requested
with other drivers we should switch GPIOLIB to an imply.

This isn't the most ideal solution but avoids modifiying the Kconfig for
other drivers, and only requires a singular IS_REACHABLE(CONFIG_GPIOLIB)
check.

Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 drivers/hid/Kconfig       | 2 +-
 drivers/hid/hid-mcp2221.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 185a077d59cd..745fc38794ad 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -1252,7 +1252,7 @@ config HID_ALPS
 config HID_MCP2221
 	tristate "Microchip MCP2221 HID USB-to-I2C/SMbus host support"
 	depends on USB_HID && I2C
-	depends on GPIOLIB
+	imply GPIOLIB
 	help
 	Provides I2C and SMBUS host adapter functionality over USB-HID
 	through MCP2221 device.
diff --git a/drivers/hid/hid-mcp2221.c b/drivers/hid/hid-mcp2221.c
index 4d10a24e3e13..fb54f1c6fd9c 100644
--- a/drivers/hid/hid-mcp2221.c
+++ b/drivers/hid/hid-mcp2221.c
@@ -915,9 +915,11 @@ static int mcp2221_probe(struct hid_device *hdev,
 	mcp->gc->can_sleep = 1;
 	mcp->gc->parent = &hdev->dev;
 
+#if IS_REACHABLE(CONFIG_GPIOLIB)
 	ret = devm_gpiochip_add_data(&hdev->dev, mcp->gc, mcp);
 	if (ret)
 		return ret;
+#endif
 
 	return 0;
 }
-- 
2.37.2

