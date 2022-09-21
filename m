Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2593F5C03CF
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 18:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbiIUQMx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 12:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232140AbiIUQM1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 12:12:27 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18639A9EC
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:58:48 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id b23so5397954iof.2
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BLdt6ZhvGr0RaD7VzP2mPYzzyAyFxpk+jb6URS+dUyM=;
        b=NW0DxOZCIOhi7D7pIYBZmi1MjcIGOGN5aKSPvNUUuHsu91/a4vEXXoU9yoKtVcVFy1
         KdBLpQG6bfggGEj+YyGfdWIl7h49HmUDstUFnDxLcYrTNuZABzYm54SCfyQ65BqaDLVZ
         NEk5ON3+abjpYKgiOp6c76ILaDUJNeCAz8ecg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BLdt6ZhvGr0RaD7VzP2mPYzzyAyFxpk+jb6URS+dUyM=;
        b=pMNx8OnICx29820Y2+evRJ+SWcjyq3uwtd+C3wFoZE+9EPiXm6cSEJkh3E0rE9h6ZP
         HvL9fYWpaB5/UefAZiTyDRYF+mfjQ4mrtoVDH5WrVnFEKZZF9wQ9e/WtZ2jo+039abCI
         GxBxaWbjux1MtWy7TQeNgxP7UDMn0MnpmKomtVLGAWsqAzeWJPoRQlfAn+EKOt4xFiw0
         jeIK53Nl2McZYImEbF3G71twaHHDCN1jP1KGlDQ5uOq/GfclGoNQdQ/SsIhupIiILvpi
         nvFVv/vHmaDzI7pnf0eT1T/q+S7Q7OHR/lanfYOfTaGVnBabip7WSexv4qq9lJ6Z1RDP
         DDsQ==
X-Gm-Message-State: ACrzQf0Va9Wyzq5VB8jh26r34xjIkqN+1Yl74paiT70LBqMBNbGM1DID
        q21KYySdrlnSUmqBJZ9URGzhpQ==
X-Google-Smtp-Source: AMsMyM7Imln63wm+6aXB+OaGfTzsZGZphFcReZdUZOOOW5iAvoeaP8vqNuJMBYexE48ezn3l+879nw==
X-Received: by 2002:a05:6638:3a1a:b0:35a:26bc:8856 with SMTP id cn26-20020a0566383a1a00b0035a26bc8856mr13100319jab.47.1663775540394;
        Wed, 21 Sep 2022 08:52:20 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id c14-20020a023b0e000000b0035a8d644a31sm1148061jaa.117.2022.09.21.08.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 08:52:20 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     rafael@kernel.org, timvp@google.com,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        dmitry.torokhov@gmail.com, jingle.wu@emc.com.tw,
        hdegoede@redhat.com, mario.limonciello@amd.com,
        linus.walleij@linaro.org, Raul E Rangel <rrangel@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alistair Francis <alistair@alistair23.me>,
        Jiri Kosina <jikos@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 09/13] HID: i2c-hid: acpi: Stop setting wakeup_capable
Date:   Wed, 21 Sep 2022 09:52:01 -0600
Message-Id: <20220921094736.v5.9.I2efb7f551e0aa2dc4c53b5fd5bbea91a1cdd9b32@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220921155205.1332614-1-rrangel@chromium.org>
References: <20220921155205.1332614-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is now handled by the i2c-core driver.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---

Changes in v5:
- Added Acked-by: Benjamin Tissoires

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

