Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79455B9153
	for <lists+linux-input@lfdr.de>; Thu, 15 Sep 2022 01:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbiINX7Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 19:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiINX7M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 19:59:12 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF8689CC7
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:22 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id v128so13627132ioe.12
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 16:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rcvDP2WJ+fQZJ5qsY5Dl3GZhszdSslMkj/qO46b14mU=;
        b=kDCQFccX2w7tlX6d2bXrWMrcaaS35CZD/Vo0cp8z8vLHUxNox+MW9MuYtm0sNXoyMy
         bqHFfJsYkqcfgCkg5RQOj0p6TD9nX4rjmahMnQJdT1WPBFPjCIBI5vL1/QoluEsfwB2y
         s7ejhz0ldATLHLOq141U+zdmMdaUc3g9XeRNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rcvDP2WJ+fQZJ5qsY5Dl3GZhszdSslMkj/qO46b14mU=;
        b=o5Muw0kFkwYLBePJsPJL9cbrputoCekBntLtfTu3e3IMwzY0tiOR674tiRn4O2emH9
         oEzf4m9WjLTGhYa58TrtsnLLtssnWDNlIzghZ6MzeGg3KxEr7u21itzVgv+JzcJFazVh
         HPcN/8tuD2CO/W/jzkU6XW+cB7thbq9Vyc69b5RhyMtEv1fdnVlqzfP9ztq1jap8/0LX
         qlJa8L2c/+DjwF2fdo1q9vv33KOPP/lnt7JiNGfiNkq7hjUiHdcKH2EDomk9VwhVXIol
         dWgIGJwOJU3e3/Pc6nV2OIyEda8rDAAWAKtLBDx2LEjut0swN2wC/0yFxEIVng3rJGon
         /mMQ==
X-Gm-Message-State: ACgBeo2tcW35tp3ij7/gtppNydHnMIRgGEOWnoXwM4bnJo/ZhasYqPTx
        76UJux5ev3brUfbFa8DngackLw==
X-Google-Smtp-Source: AA6agR7RCrayZe6uYU6txqlWKyIA7Yzw/43TVXUadSMJuymKB6iwV3TNib0B3yWzAVCT8sb/tC8agQ==
X-Received: by 2002:a05:6638:1492:b0:35a:5484:b8db with SMTP id j18-20020a056638149200b0035a5484b8dbmr5460661jak.236.1663199901611;
        Wed, 14 Sep 2022 16:58:21 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id a14-20020a027a0e000000b0034c0e8829c0sm353721jac.0.2022.09.14.16.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 16:58:20 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     jingle.wu@emc.com.tw, rafael@kernel.org,
        andriy.shevchenko@linux.intel.com, mario.limonciello@amd.com,
        hdegoede@redhat.com, linus.walleij@linaro.org, timvp@google.com,
        dmitry.torokhov@gmail.com, Raul E Rangel <rrangel@chromium.org>,
        Alistair Francis <alistair@alistair23.me>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/13] HID: i2c-hid: acpi: Stop setting wakeup_capable
Date:   Wed, 14 Sep 2022 17:57:57 -0600
Message-Id: <20220914155914.v3.9.I2efb7f551e0aa2dc4c53b5fd5bbea91a1cdd9b32@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220914235801.1731478-1-rrangel@chromium.org>
References: <20220914235801.1731478-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is now handled by the i2c-core driver.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

(no changes since v1)

 drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index b96ae15e0ad917..375c77c3db74d9 100644
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
2.37.3.968.ga6b4b080e4-goog

