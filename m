Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724525EFA35
	for <lists+linux-input@lfdr.de>; Thu, 29 Sep 2022 18:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbiI2QVE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Sep 2022 12:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236189AbiI2QTm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Sep 2022 12:19:42 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B590D77
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 09:19:31 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id a17so458814ilq.1
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2T8BuI3no24teUYYIo0mu0zp3pTsUlj5QnA0Co7tqM=;
        b=UwPP1YFFYnXM+Ku/9y9p8KGX0YX47OhXCxxVWY5lkFnmxvZJcYEFbJBsCkG0PgO566
         bvD24Zr5UdcNL/cdHYxVmpZTF6SXfmCe+thOLu6AjMnxn5Cd2mu4SpV39hqOI4p48t3o
         svRAwaOXpRJnpwcv4yvarO7idPNktzR5kQUDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2T8BuI3no24teUYYIo0mu0zp3pTsUlj5QnA0Co7tqM=;
        b=jsZPVCWumRyhV/yWDh7GI20P4jGaUs1wFKl2gFaGugu0pthV+K4bBHED+ai/LQP6YS
         XhEO2OKwgz4nc/+RvRXCoAcM1MOTxkJ7vcTuaoM9CaKJftjsvOPLyINFT68QXPGndylr
         0TqKFIbaxKxcWx2ilWGUUE8uwH3SmU1OpSFwyP4C12LgjlpXCyUWCTSHCP4OLZB9mmjR
         cLkb0i2x3SAKt8+kv6sAknVVhX60yEnpk5SycZSBqJUu3/l9DlBDHux6l+mDSXZ93V8J
         xBDf4ailevaCj9mR2xNbjERyyDRdVKY9EygIw/rbCThULJjy6clxJy9rctxS6kWAX9VV
         y7cg==
X-Gm-Message-State: ACrzQf0QZ9pVGyvQimFCWTLuvMcj8AupCjPmdSEFiAEBgtZ1T261XHA9
        NyDAKIQ8iB7CJsXS+lATiodWPw==
X-Google-Smtp-Source: AMsMyM5az6ilUptS6Jcem1rQWz0X20XO2/hi/bE9rH/EA2zlCEfoEO/nwkxfkjunPAyuL5vWVcJHqw==
X-Received: by 2002:a05:6e02:1bcf:b0:2f6:a41b:cc11 with SMTP id x15-20020a056e021bcf00b002f6a41bcc11mr1999439ilv.103.1664468371628;
        Thu, 29 Sep 2022 09:19:31 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id f12-20020a02848c000000b0035aab2f1ab1sm2965451jai.134.2022.09.29.09.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:19:31 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com,
        hdegoede@redhat.com, rafael@kernel.org,
        mika.westerberg@linux.intel.com, mario.limonciello@amd.com,
        timvp@google.com, linus.walleij@linaro.org, jingle.wu@emc.com.tw,
        Raul E Rangel <rrangel@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Jiri Kosina <jikos@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/13] HID: i2c-hid: acpi: Stop setting wakeup_capable
Date:   Thu, 29 Sep 2022 10:19:13 -0600
Message-Id: <20220929093200.v6.9.I2efb7f551e0aa2dc4c53b5fd5bbea91a1cdd9b32@changeid>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220929161917.2348231-1-rrangel@chromium.org>
References: <20220929161917.2348231-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is now handled by the i2c-core driver.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---

(no changes since v5)

Changes in v5:
- Added Acked-by: Benjamin Tissoires

 drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index b96ae15e0ad917e..375c77c3db74d92 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -105,11 +105,6 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
 
 	acpi_device_fix_up_power(adev);
 
-	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
-		device_set_wakeup_capable(dev, true);
-		device_set_wakeup_enable(dev, false);
-	}
-
 	return i2c_hid_core_probe(client, &ihid_acpi->ops,
 				  hid_descriptor_address, 0);
 }
-- 
2.37.3.998.g577e59143f-goog

