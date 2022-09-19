Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58F75BD1A6
	for <lists+linux-input@lfdr.de>; Mon, 19 Sep 2022 18:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiISQAQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Sep 2022 12:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiISP7l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Sep 2022 11:59:41 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1559EC6
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:59:27 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id m16so1679900iln.9
        for <linux-input@vger.kernel.org>; Mon, 19 Sep 2022 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=F4E89pQ2FrSepPnER/REAyEkKBd4VwJQnWtxeznDInw=;
        b=iFJyZLoTNe7+opOt+z3rUQwztfNt/FK4EYWkMUwYtkKWivqYMWX4oRAj8/WgM8D8hT
         XLVEJFNpUSuxDT9BKpCVUISLK8n+KtT3pbkARlzUy56+QnmMZDWCDiLULv6kZnJHcmb0
         PjpvNExYUFPOiMS/5WO5lEedVMaBChBMXBkDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=F4E89pQ2FrSepPnER/REAyEkKBd4VwJQnWtxeznDInw=;
        b=stnNcm3FkppYhQaYvAE+1NoF1SJMTK2Tt0sYy76kTnjAw2juB9gxn0HuL6BBS3PTxk
         WUEivaQgX2rlh4XCMWAK+3KrlZP1+460OIQld0sHkUEifUFw9w2m4WeHFYOawTUMIUpl
         0HtqCxnMvVXrYQjP71/VUY8WpEhT/PR5h/Aj0/Op8Ie0GZvFjrHVDPL15J809naWjovG
         Iuct1ZZStAonI89e+bNHioZWPoY5GEsJkb7rA7ORRF5/Orw6IywYhQFx+GFRbNSnLKe+
         vZf2TMJMkD2m13dR2ADMKiRocIN5VmqcPvpv6CEb2zgaS0dqcRVZUI08uow6Fqo4GT16
         xJJA==
X-Gm-Message-State: ACrzQf0Uyu0uU4hEG6MuhZieC6tQiFmizfoe41J11PV8UopnGKIY+H9V
        tdWBINj11vN5odQM/b3dB7W7a4sKTpx00g==
X-Google-Smtp-Source: AMsMyM74MaxgKJOfvmWy1ebOERp87QX10dA8/v0WHA9glnbmsbgaHQWtCcDmpHn38HRQ/7/SP9seeg==
X-Received: by 2002:a05:6e02:218d:b0:2f5:45c6:fd12 with SMTP id j13-20020a056e02218d00b002f545c6fd12mr4567137ila.77.1663603167576;
        Mon, 19 Sep 2022 08:59:27 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id t70-20020a025449000000b00349fb9b1abesm5634154jaa.106.2022.09.19.08.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 08:59:27 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     timvp@google.com, hdegoede@redhat.com,
        andriy.shevchenko@linux.intel.com, rafael@kernel.org,
        mario.limonciello@amd.com, jingle.wu@emc.com.tw,
        mika.westerberg@linux.intel.com, dmitry.torokhov@gmail.com,
        linus.walleij@linaro.org, Raul E Rangel <rrangel@chromium.org>,
        Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 08/13] ACPI: PM: Take wake IRQ into consideration when entering suspend-to-idle
Date:   Mon, 19 Sep 2022 09:59:10 -0600
Message-Id: <20220919095504.v4.8.I7d9202463f08373feccd6e8fd87482c4f40ece5d@changeid>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220919155916.1044219-1-rrangel@chromium.org>
References: <20220919155916.1044219-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This change adds support for ACPI devices that use ExclusiveAndWake or
SharedAndWake in their _CRS GpioInt definition (instead of using _PRW),
and also provide power resources. Previously the ACPI subsystem had no
idea if the device had a wake capable interrupt armed. This resulted
in the ACPI device PM system placing the device into D3Cold, and thus
cutting power to the device. With this change we will now query the
_S0W method to figure out the appropriate wake capable D-state.

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

(no changes since v1)

 drivers/acpi/device_pm.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 9dce1245689ca2..6bc81f525d5160 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -681,8 +681,23 @@ static int acpi_dev_pm_get_state(struct device *dev, struct acpi_device *adev,
 		d_min = ret;
 		wakeup = device_may_wakeup(dev) && adev->wakeup.flags.valid
 			&& adev->wakeup.sleep_state >= target_state;
-	} else {
-		wakeup = adev->wakeup.flags.valid;
+	} else if (acpi_device_can_wakeup(adev)) {
+		/* ACPI GPE from specified by _PRW. */
+		wakeup = true;
+	} else if (device_may_wakeup(dev) && dev->power.wakeirq) {
+		/*
+		 * The ACPI subsystem doesn't manage the wake bit for IRQs
+		 * defined with ExclusiveAndWake and SharedAndWake. Instead we
+		 * expect them to be managed via the PM subsystem. Drivers
+		 * should call dev_pm_set_wake_irq to register an IRQ as a wake
+		 * source.
+		 *
+		 * If a device has a wake IRQ attached we need to check the
+		 * _S0W method to get the correct wake D-state. Otherwise we
+		 * end up putting the device into D3Cold which will more than
+		 * likely disable wake functionality.
+		 */
+		wakeup = true;
 	}
 
 	/*
-- 
2.37.3.968.ga6b4b080e4-goog

