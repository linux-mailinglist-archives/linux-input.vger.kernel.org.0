Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CEE5EFA34
	for <lists+linux-input@lfdr.de>; Thu, 29 Sep 2022 18:21:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236266AbiI2QU4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Sep 2022 12:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236165AbiI2QTm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Sep 2022 12:19:42 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185E61E1110
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 09:19:31 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id a4so943130ilj.8
        for <linux-input@vger.kernel.org>; Thu, 29 Sep 2022 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7X+A3HUjv/AFbiPoz+UjvIQeQtBXjNPEmQGM5tZ7iJk=;
        b=meJY3jLHRLWTQsoLhEUKky21w26HmTTsiESdfNlO5GSDiaXS4j9Amf1boWrOO0y9d0
         ylDxFCo9jLT2b0N5GfRnmspc4uH3ftvwm+Pgusgaa3x287LgoAu4HzLeH8M01gnuQ+WO
         N4KETVF/8sRbQcAGT7HYjRYAkcenDj/PC7p5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7X+A3HUjv/AFbiPoz+UjvIQeQtBXjNPEmQGM5tZ7iJk=;
        b=dGOjVcnhGjqItizqKdk3DpURwXQVInCNY4Wgay7j0C3iRLuqV+QSP3I0WDQ1GE4t4N
         UZ/5A+dwXnNTNcQZPoPtraVybus9d7uZceL0P8vM+VARLUpEI9OnUysLRToOHhrpO50p
         i10Ou4rVgf+2MHT/ZbjNIabmp9DjEz5mfsc2BSRkt+u1mwUcN1olC64/ml0vYEdsRov/
         9xmPNELVp6i2IzEO3qFhZNwYgrR8zPRMBKmiaDc+mw3VAPp5BRhNsponsUzWdlTJm8dG
         Iem2BmS19ENV+3taBmaZTUb4QC3cmiVPjWPm+PK7zsXa64Yb1M0wiDxc4pyrQIWOFICq
         Yvuw==
X-Gm-Message-State: ACrzQf2D5jD6C2ze3/l1nVl79UHk6sV62Xnoa99uM9ymCPsUW22492bN
        ajEuZiTOh4uv+KNkoX72zjT6nw==
X-Google-Smtp-Source: AMsMyM5aX7F0SJTzm8JxLI2ppMOvrPSeAeJki/ssVM0GbTND5Fy5gTpiwJ18cDresOqR7V64JL2vZA==
X-Received: by 2002:a05:6e02:1bac:b0:2f2:45c2:235c with SMTP id n12-20020a056e021bac00b002f245c2235cmr2076837ili.128.1664468370357;
        Thu, 29 Sep 2022 09:19:30 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id f12-20020a02848c000000b0035aab2f1ab1sm2965451jai.134.2022.09.29.09.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 09:19:30 -0700 (PDT)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-acpi@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com, dmitry.torokhov@gmail.com,
        hdegoede@redhat.com, rafael@kernel.org,
        mika.westerberg@linux.intel.com, mario.limonciello@amd.com,
        timvp@google.com, linus.walleij@linaro.org, jingle.wu@emc.com.tw,
        Raul E Rangel <rrangel@chromium.org>,
        Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/13] ACPI: PM: Take wake IRQ into consideration when entering suspend-to-idle
Date:   Thu, 29 Sep 2022 10:19:12 -0600
Message-Id: <20220929093200.v6.8.I7d9202463f08373feccd6e8fd87482c4f40ece5d@changeid>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220929161917.2348231-1-rrangel@chromium.org>
References: <20220929161917.2348231-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

Changes in v6:
- Refactored to leave else clause

Changes in v5:
- Go back to using adev->wakeup.flags.valid to keep the diff cleaner
- Fix a typo in comment

 drivers/acpi/device_pm.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
index 9dce1245689ca25..b657998ce728e4c 100644
--- a/drivers/acpi/device_pm.c
+++ b/drivers/acpi/device_pm.c
@@ -681,7 +681,22 @@ static int acpi_dev_pm_get_state(struct device *dev, struct acpi_device *adev,
 		d_min = ret;
 		wakeup = device_may_wakeup(dev) && adev->wakeup.flags.valid
 			&& adev->wakeup.sleep_state >= target_state;
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
 	} else {
+		/* ACPI GPE is specified in _PRW. */
 		wakeup = adev->wakeup.flags.valid;
 	}
 
-- 
2.37.3.998.g577e59143f-goog

