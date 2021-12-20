Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43C8047B63D
	for <lists+linux-input@lfdr.de>; Tue, 21 Dec 2021 00:44:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233135AbhLTXn7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 18:43:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbhLTXn7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 18:43:59 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F23C061574
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 15:43:58 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id z26so15398549iod.10
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 15:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U7gfCT4e8tEF3Otc3jGKu2gDoX5PakWDro5ts+abDGE=;
        b=YxZu/YPWyU2AnSsazyq+qxcIZ3Z409yrt6LhZuMx630zssLhbn5w2/gVZ/5qrvV1vj
         05Mlb43Bv98Yja/AAHpIVPAE9ZaQ8Ep1DdxIoYgDG+e7zhoA5v8OYsKfrYAIJYeQNHXw
         s853/lpIHRnNE7VCbm/DFmlTL5EargiFErddY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U7gfCT4e8tEF3Otc3jGKu2gDoX5PakWDro5ts+abDGE=;
        b=nA7OW8+/UQqGFKhrXeVC2rDrjIsnRYU551YC6fFB4DEWDlsh9wN0mZ9JuQTdI5IIv6
         piv/J7+MV23woUP3Mk/VegUP7rUwUVLHAS1oiy0EYChi0IqCPYOMsC9mAKp6OV3c57gW
         Lh6ZFR6HOGTgz56An98g8Rv0AnfBIMxB40neqK2uSLm/ekmQcjWFtlE9wgWnMRplF96+
         f89ylDG504r2u2XpWuwwZf13vQL+7VgESaaktc8wxgrZHWTIZbaSDvv+20sTSEpNgRvF
         EZDV81Sly0LoNx/ehFqO3Z0SH/YgAYt9rHiznVkgYjas/GQrcikBfd2lQldDfIGz3mV2
         NaDQ==
X-Gm-Message-State: AOAM5329sPlJNlWOU+SKX/CXfvWCaMPDkDN5agmufMGWqIHRQEGHFFKD
        T/dzAQSKkWvl40prSZ2y/yU8JQ==
X-Google-Smtp-Source: ABdhPJzryZU8oQ0MchKWRjKQoAN9qnAYWbQhhUUaSNuHjYogepM/WJ4dd4hjqKHJ0ndKKiJ9LyzumQ==
X-Received: by 2002:a05:6638:140e:: with SMTP id k14mr335461jad.251.1640043838339;
        Mon, 20 Dec 2021 15:43:58 -0800 (PST)
Received: from rrangel920.bld.corp.google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id k19sm4077521ilr.34.2021.12.20.15.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 15:43:58 -0800 (PST)
From:   Raul E Rangel <rrangel@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     mario.limonciello@amd.com, linux-input@vger.kernel.org,
        dianders@chromium.org, Raul E Rangel <rrangel@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: [PATCH 1/3] HID: i2c-hid-acpi: Remove explicit device_set_wakeup_capable
Date:   Mon, 20 Dec 2021 16:43:44 -0700
Message-Id: <20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
In-Reply-To: <20211220234346.2798027-1-rrangel@chromium.org>
References: <20211220234346.2798027-1-rrangel@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ACPI subsystem is responsible for managing the power and wake
sources for an ACPI device. By explicitly calling
device_set_wakeup_capable, we are circumvent the ACPI subsystem and
setting wake capabilities on the device when it doesn't support it.

Take the following example:
* We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
`_PRW` so that means the device can't wake the system.
* The IRQ line is active level low for this device and is pulled up by the
power resource defined in `_PR0`/`_PR3`.

Since the i2c-hid driver has set the device as wake capable, the wake
pin gets enabled on suspend. As part of suspend, ACPI will power down
the device since it's not a wake source. When the device is powered
down, the IRQ line will drop, and it will trigger a wake event.

See the following debug log:
[   42.335804] PM: Suspending system (s2idle)
[   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
[   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
[   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
[   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
[   42.535293] PM: Wakeup unrelated to ACPI SCI
[   42.535294] PM: resume from suspend-to-idle

Signed-off-by: Raul E Rangel <rrangel@chromium.org>
---

 drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index a6f0257a26de..fc311a19a19d 100644
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
 				  hid_descriptor_address);
 }
-- 
2.34.1.307.g9b7440fafd-goog

