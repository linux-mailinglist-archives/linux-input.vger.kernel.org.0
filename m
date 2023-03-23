Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6356C5CE2
	for <lists+linux-input@lfdr.de>; Thu, 23 Mar 2023 03:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjCWCyO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Mar 2023 22:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjCWCyN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Mar 2023 22:54:13 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284C42E826;
        Wed, 22 Mar 2023 19:53:53 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso601927pjb.3;
        Wed, 22 Mar 2023 19:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679540032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Am2RzwLg7v4VtB0gE/uR1y64FgPvtIhnflRvSeqC5Mg=;
        b=bW4JkR1ujfFxR5iQwq9DhgjVpyvlGx5eipecuh6VYF6JrhZsrfdbl9qW2Cxyn/0ph9
         S8tupIFc0ws31pzHLbWLH4n04vx1P/xOrhWOgcqg2TPJiSgrx+ohfn6Z+xlRE7Y9Apqg
         Zb12TPPppGl1bQ2q43f6eCTjvAaiNSCTM3nOtddsXp1UnSXC5Va9Bg4obC8CxEKm1stC
         wFnBq78NkYfb9hf9kAe7vOLd9qbVNuccLoSKFik0hjFH5ztRnj1nKmOoZT+Cb0is843d
         hxEQuXAb3PsInoX2f6eTUr+Cr9BI3ISgp+9yMsPZUfAVy72hEqXAt5L4Ez4WybTCbeiP
         FAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679540032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Am2RzwLg7v4VtB0gE/uR1y64FgPvtIhnflRvSeqC5Mg=;
        b=s94dPaV6Dpj5cpP3upeef+lIivgvaiIRBqjNKHFX8o+XkPEsyAOC8c1z2vTHulpDYZ
         wvlY9EJVh1z1cOpGjwGtHutHYhGanPVJZirCJ+EySw1JM9k+ADz2YE7AMGHSkQEmZawC
         MX0jDxJT2TbqdWxGY5nGc2U+hF+AKbUsUkWXRVdSdMEhGVNVkgrcxfsdtUUWkXf0X5mV
         x/wsbhBRoPL/sXm+0OgvfLRiH32Tmmgwvx/ZRwsgl6tawBFpxgOhNGrkAmHPAowpnIYb
         JStQ8L+hp5mXQ7Zz6b0GOHvrLvOPyiibLxOsXJt2CVebcYFk4sXi8lYSgXuWSNp7yrOB
         SbVQ==
X-Gm-Message-State: AAQBX9fUcqtLA7XNfFCixTKXkjhRTfJY6hN3Ksn4hRRIxOyjNGoFcgRF
        692WjwEUyeGpUtEx+8lHckT7y8njaqWAPw==
X-Google-Smtp-Source: AKy350ZjpcbpL2qm08U6K2qaLG4acaE6OOcDLTGgssKqvpXvZwrJAe7obGuk77ZI3EyjMUAtBs0TrA==
X-Received: by 2002:a17:90b:1b05:b0:240:1d2b:1363 with SMTP id nu5-20020a17090b1b0500b002401d2b1363mr1590096pjb.34.1679540032264;
        Wed, 22 Mar 2023 19:53:52 -0700 (PDT)
Received: from localhost.localdomain ([47.147.242.129])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001a1c74554f3sm7623697plb.185.2023.03.22.19.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 19:53:51 -0700 (PDT)
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 0/2] platform/x86: Add driver for Yoga Tablet mode switch
Date:   Wed, 22 Mar 2023 19:51:58 -0700
Message-Id: <20230323025200.5462-1-kallmeyeras@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver maps the Lenovo Yoga tablet mode switch to a SW_TABLET_MODE input
device. This will make the tablet status available to desktop environments.

This patch series is the result of the discussion at
https://lore.kernel.org/r/CAG4kvq9US=-NjyXFMzJYu2zCJryJWtOc7FGZbrewpgCDjdAkbg@mail.gmail.com/

I decided to follow-up on the patch Gergo wrote and respond to the review
comments to get it merged and available for everyone.

Gergo and I have tested this on the Yoga 7 14ARB7, and the Yoga 7 14AIL7
respectively. Additionally, according to reports at
https://github.com/lukas-w/yoga-usage-mode, which uses the same WMI devices,
this driver should work with:
Yoga C940, Ideapad flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7, etc.

The diff since v1 is as follows:
v1: https://lore.kernel.org/platform-driver-x86/20230310041726.217447-1-kallmeyeras@gmail.com/

--- a/drivers/platform/x86/lenovo-ymc.c
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -18,7 +18,7 @@
 #define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
 
 #define LENOVO_YMC_QUERY_INSTANCE 0
-#define LENOVO_YMC_QUERY_METHOD 0xAB
+#define LENOVO_YMC_QUERY_METHOD 0x01
 
 static bool ec_trigger __read_mostly;
 module_param(ec_trigger, bool, 0644);
@@ -103,6 +103,12 @@ static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
 	lenovo_ymc_trigger_ec(wdev, priv);
 }
 
+static void lenovo_ymc_remove(struct wmi_device *wdev)
+{
+	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
+	acpi_dev_put(priv->ec_acpi_dev);
+}
+
 static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 {
 	struct input_dev *input_dev;
@@ -117,7 +123,7 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 
 	if (ec_trigger) {
 		pr_debug("Lenovo YMC enable EC triggering.\n");
-		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VCP2004", NULL, -1);
+		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VPC2004", NULL, -1);
 		if (!priv->ec_acpi_dev) {
 			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
 			return -ENODEV;
@@ -151,7 +157,10 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 
 	priv->input_dev = input_dev;
 	dev_set_drvdata(&wdev->dev, priv);
+
+	// Report the state for the first time on probe
 	lenovo_ymc_trigger_ec(wdev, priv);
+	lenovo_ymc_notify(wdev, NULL);
 	return 0;
 }
 
@@ -168,6 +177,7 @@ static struct wmi_driver lenovo_ymc_driver = {
 	.id_table = lenovo_ymc_wmi_id_table,
 	.probe = lenovo_ymc_probe,
 	.notify = lenovo_ymc_notify,
+	.remove = lenovo_ymc_remove,
 };
 
 module_wmi_driver(lenovo_ymc_driver);

Andrew Kallmeyer (1):
  platform/x86: Move ideapad ACPI helpers to a new header

Gergo Koteles (1):
  platform/x86: Add driver for Yoga Tablet Mode switch

 drivers/platform/x86/Kconfig          |  10 ++
 drivers/platform/x86/Makefile         |   1 +
 drivers/platform/x86/ideapad-laptop.c | 135 +------------------
 drivers/platform/x86/ideapad-laptop.h | 152 +++++++++++++++++++++
 drivers/platform/x86/lenovo-ymc.c     | 187 ++++++++++++++++++++++++++
 5 files changed, 351 insertions(+), 134 deletions(-)
 create mode 100644 drivers/platform/x86/ideapad-laptop.h
 create mode 100644 drivers/platform/x86/lenovo-ymc.c

-- 
2.40.0

