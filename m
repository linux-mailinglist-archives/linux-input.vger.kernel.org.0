Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAF05B636F
	for <lists+linux-input@lfdr.de>; Tue, 13 Sep 2022 00:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbiILWPO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Sep 2022 18:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiILWOL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Sep 2022 18:14:11 -0400
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083044E63C
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 15:14:00 -0700 (PDT)
Received: by mail-io1-xd2d.google.com with SMTP id y15so4794274iof.13
        for <linux-input@vger.kernel.org>; Mon, 12 Sep 2022 15:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=QR2B9XFP7hD0eI+LTrzBg0C3/y+mm4K/iJoQKs9pnMo=;
        b=Fk6ctCFzMECh1bY3XWsqkS3WXaKaOph6+Oc5x/qYlRnVrgHZy4y/LeVm4E1Hd/ZYcA
         2EQYrTbljtNkWKW4+YTHqfR9GNifArz/K7DjWIZtD7dli+ywJjilvGbl1+9sqAv1P82Q
         eOHZjt7HFn7wPNJLOPzFKu47XSI3OsZQqT2QI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=QR2B9XFP7hD0eI+LTrzBg0C3/y+mm4K/iJoQKs9pnMo=;
        b=c+GLR+h8Oj7Rw9tVGSjs4/ao/CL7HG0O6Xw///Fd5cRdyHljFcWY5XubvA4EdXiSne
         OS0rQJNpKTGi6rnfyrBkyax2+G945JKZDOVgO+sq4flbmfTick1ADNHFu1qzaYLCBUPe
         C3NLzXytA5CVckVKteUHac6kV2kiIMZ+YXUm7CKqpGvwjwElHFCCLhrWaY8QxPYPPmU4
         u4cBzHyryPQrEkR9wVCD1G2gLPXeM89h6jxwxrgCRIMXhUeKa/CWPtAX2Om1aef/HsPp
         VHHcQ+1vFj2l/Fqy2AgE9PKxUuIlWLgdl4GIEqS+ry2YekeKTDah+SyCJU0h55t8Tr8D
         Cgrg==
X-Gm-Message-State: ACgBeo132TxczxyRBa4PjpvhNlyg1naOtZGAyJI9tiWk9eHkKI3YJPDM
        9xjTOM67KqUdMGX8zBcvl9j0yh1OAsSTb/tf
X-Google-Smtp-Source: AA6agR5siZavkQ3Y+x9ZBdSihGgx0LG2wkfUKmKWO1QvkMQnu9M8KGMknizwsPMY/ICY79eLUTSM7Q==
X-Received: by 2002:a05:6602:2cca:b0:657:c59b:f336 with SMTP id j10-20020a0566022cca00b00657c59bf336mr12970833iow.141.1663020839497;
        Mon, 12 Sep 2022 15:13:59 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id 18-20020a056e020cb200b002f16e7021f6sm4077334ilg.22.2022.09.12.15.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 15:13:58 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, jingle.wu@emc.com.tw,
        mario.limonciello@amd.com, timvp@google.com,
        linus.walleij@linaro.org, hdegoede@redhat.com, rafael@kernel.org,
        Raul E Rangel <rrangel@chromium.org>,
        Alistair Francis <alistair@alistair23.me>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, Rob Herring <robh@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] HID: i2c-hid: acpi: Stop setting wakeup_capable
Date:   Mon, 12 Sep 2022 16:13:13 -0600
Message-Id: <20220912160931.v2.9.I2efb7f551e0aa2dc4c53b5fd5bbea91a1cdd9b32@changeid>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220912221317.2775651-1-rrangel@chromium.org>
References: <20220912221317.2775651-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
2.37.2.789.g6183377224-goog

