Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD945BF65C
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 08:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiIUGbE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 02:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbiIUGaw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 02:30:52 -0400
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CD3F45044
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:51 -0700 (PDT)
Received: by mail-qv1-xf30.google.com with SMTP id s13so3759023qvq.10
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 23:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=EEEIkVBJ75c1He7ol3L/GMy6O2j7bpfcaiLKZ3AKsE0=;
        b=ZJDah8N78ksArxAT6Gozi9vW0xRjIitzUcmHaXdaTbK3H/Wx4Aesa5+XuZ+rkXBofR
         I1VJveiMvxCLoCLCCHKrHF4U3TBbStkfwx127M/5S5vPrYdkSCMnpwHTxWYufGDhoUz1
         +HOYLpeGcNuRmzR0wS9wLvdxwtSjqq9/GgShU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=EEEIkVBJ75c1He7ol3L/GMy6O2j7bpfcaiLKZ3AKsE0=;
        b=CLCttDFF4M/XXymvVFlgdYWkt+OukIaqFvvBKsYTpr8Ka4Nbcp8W9kK2DSX03YJ2yH
         AHBNp3HJzd+75UY2zQOzvcbGvSnKjypPJYfvxYTxJfomGXO+iD1c4/K+4wwSOjC2+tEQ
         TkrQrVKE27/Ywb3qyDKMPaHIDoKmJEJ0UMt8en3K+On869E8ou+R9lRPhJlkXE3i94fe
         xdGrRnx2yNNZWidB/XqAZvpk+oMFykWYlwfL87JsI/5JsjGBCir6y1DE9DjyCLph6kIp
         SKnv21anSAK57dtjbkrscNYXyXc6XHy1j2jD3ztNxXmx0Fco//z+nKEBJkZBQ+pUAPkm
         OjxQ==
X-Gm-Message-State: ACrzQf2n4IpYXSFrqe+qjZ6a2Fja8FtMLJ2wMdSEWCndaQn0O29rOTos
        PsBWX9q2o4OyS4IDg5jALzFuLQ==
X-Google-Smtp-Source: AMsMyM7+rfhHP0WFlK4pb4y4HRfC9wcWDXLEEq2JWTqgV/VHCrznChHrIGbQHc54zQmtykzCJZDJKA==
X-Received: by 2002:a05:6214:2468:b0:4ac:8786:f20e with SMTP id im8-20020a056214246800b004ac8786f20emr21853047qvb.50.1663741850700;
        Tue, 20 Sep 2022 23:30:50 -0700 (PDT)
Received: from localhost.localdomain ([164.92.70.235])
        by smtp.gmail.com with ESMTPSA id m10-20020ac807ca000000b00342f05defd1sm1060855qth.66.2022.09.20.23.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 23:30:50 -0700 (PDT)
From:   Matt Ranostay <matt.ranostay@konsulko.com>
To:     gupt21@gmail.com, jic23@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v4 2/5] iio: addac: stx104: fix future recursive dependencies
Date:   Tue, 20 Sep 2022 23:30:23 -0700
Message-Id: <20220921063026.89619-3-matt.ranostay@konsulko.com>
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
the following recursive dependency is detected for STX1040

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

