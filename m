Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6B645B4B3A
	for <lists+linux-input@lfdr.de>; Sun, 11 Sep 2022 03:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiIKBlM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Sep 2022 21:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiIKBlK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Sep 2022 21:41:10 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3F533414
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 18:41:09 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id m9so4247677qvv.7
        for <linux-input@vger.kernel.org>; Sat, 10 Sep 2022 18:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YEluTMkVQhnCulwc8lwLW2vyLgQvDTIQ3djmLSBHRwA=;
        b=PGqMJMAvDWyttgnWm0pTyDnKcUYAigL+jt5p10BN4nhxbUYKdD0mM5Sx9Rb9coaNMp
         GKCLFsWg9iZYxt9eHTvm4Y2SLxZH+N1+wqPM103T6qU3fZ9nBxLqeUYBfT3iOV2exiTm
         Y2O2bNywBgw1+A6PD5S/PmdQEw8xmt+iLK36Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YEluTMkVQhnCulwc8lwLW2vyLgQvDTIQ3djmLSBHRwA=;
        b=Mf1jPsA/Im2AnkjUwUQHGF7yog/lZJovKymIx8HjZ0CQRdpniREYqsMOuiLQuh2odt
         9RgMjhz5PTc53PhPRZZPqGLrJZkBAr47hXYBoPzN0j5prqJyNlkt8DwRrHkCeLqZZTOV
         YxsbQT0EWpw73zG346nOfR2xESHIghpmMmmYhtgMAx+QNFEljhaTvaeadq60GB1G8vQF
         EdyYoGZanDAPjEgzAuanOui9GwqTHC59g9W7yu2PaYdTiFT4JgSxPXl5sobidEklAMuu
         a+Mgv2CfaW7+ei0BVbfGf8JLYXFCXf7NcSpCLOuKKaey708FCZavnef/qTxQ8gVHmk6A
         z05w==
X-Gm-Message-State: ACgBeo3J5DlJkmHmi8BftWuVIzyCqrvBLS4WuWceQ7/2xOXUwaj4IrqK
        Dja6nK1HdSlYMtDnTae9vlo0zw==
X-Google-Smtp-Source: AA6agR49EZ9pGn5pO7p824CWVfWBv3bH2r7zOT5v+m9hhUjZTTPRCXQBLcb0Ut+1YsJi8/fnL/E4fA==
X-Received: by 2002:a05:6214:2588:b0:49e:5dea:8e66 with SMTP id fq8-20020a056214258800b0049e5dea8e66mr17942488qvb.21.1662860468523;
        Sat, 10 Sep 2022 18:41:08 -0700 (PDT)
Received: from localhost.localdomain ([159.65.38.31])
        by smtp.gmail.com with ESMTPSA id q26-20020ac8451a000000b003438a8e842fsm3542973qtn.44.2022.09.10.18.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 18:41:08 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     jic23@kernel.org, gupt21@gmail.com
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v2 2/5] iio: addac: stx104: fix future recursive dependencies
Date:   Sat, 10 Sep 2022 18:40:45 -0700
Message-Id: <20220911014048.64235-3-matt.ranostay@konsulko.com>
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

