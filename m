Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088C86CCF93
	for <lists+linux-input@lfdr.de>; Wed, 29 Mar 2023 03:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjC2Bq3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Mar 2023 21:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjC2Bq1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Mar 2023 21:46:27 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A318D19B2;
        Tue, 28 Mar 2023 18:46:26 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c18so13469158ple.11;
        Tue, 28 Mar 2023 18:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680054386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGJF3zw9bpsw9KwvV5w/b8rbDQOZMSiRG/jlCaUfUw4=;
        b=jQthCR6i7krS4xherxu+OYOa5MW55Ew1zAjQfGewGWlrCni4axXi2qpxhQjZ95O+S/
         o63SSdh6IMKFoaqgXJJk2TcOKr/r3MXfkVgCIBl3K/PJMUQ9+NZvNnzKqAqRB0j2hW/F
         4TUJhhmlsgmtMr4SxRiKFvUMMredpeSPQxFjr7xHemAMbuzWIgOFiZi783G9xL7o4O6a
         IU8eTxq3OeNGylnlbOoVZTZv/h6N5pg/ko/qcpqioQPwANYqrQ3cM1P4PCgpRBL+ynEI
         YoPW8b/YuQRqWRzuLN7+5o0GKWOi1R2K+jN6WjZi9SOiAxM0HsvLZ1PGjgtDunOn6c8W
         tBrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680054386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGJF3zw9bpsw9KwvV5w/b8rbDQOZMSiRG/jlCaUfUw4=;
        b=bNyeQNdYaWf5cXD3vkMgqaa8nlxlYHA1BM5/fqKs0cfNfIrDDrUX8YdGG42U6A2etJ
         saiYDdL/Avv7x/wkpesoEUWpc8Giz61liv0KXQ9lIC24zbijKLZeB76SnPxzJPaeyTdk
         M5d0p+S8svaAO/Btah3GBXNmIUWnixBMfcmdmr5OP8jhElyq18GDim99Sjsj4W1m9nIU
         iOY87FlMY51JZx84lQHw1nMuhJf6GsuXHN+4YGI4vjkzUN7fRVJWdHRuV9l+g19etHJi
         P6VnYpReFRYXzLULtAwy+mHR9S2KDzbz5vy5TixroIGIw5/tcngmkkznMa8Oq7H5sYTH
         amRw==
X-Gm-Message-State: AAQBX9cQX5WFYqtvGkIqQIcmXv6Wyd5jF7drAgfBGHZbaWK04K0D60C9
        VznN4r98NyzTaWa/2jjS8XWTBBPYpq+JhA==
X-Google-Smtp-Source: AKy350Z9pNIDYbtOj43Rd5gPI/FhoBO6flJNiEiyDJy706d1NE9q66EeQss8u8Ku70ne77zWxNbN/Q==
X-Received: by 2002:a17:90b:3b4d:b0:240:3dc7:4939 with SMTP id ot13-20020a17090b3b4d00b002403dc74939mr21470894pjb.27.1680054385859;
        Tue, 28 Mar 2023 18:46:25 -0700 (PDT)
Received: from localhost.localdomain ([47.147.242.129])
        by smtp.gmail.com with ESMTPSA id nv8-20020a17090b1b4800b00233cde36909sm203918pjb.21.2023.03.28.18.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 18:46:25 -0700 (PDT)
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        Gergo Koteles <soyer@irl.hu>,
        Ike Panhc <ike.pan@canonical.com>, linux-input@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 0/2] platform/x86: Add driver for Yoga Tablet mode switch
Date:   Tue, 28 Mar 2023 18:45:57 -0700
Message-Id: <20230329014559.44494-1-kallmeyeras@gmail.com>
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

v1: https://lore.kernel.org/r/20230310041726.217447-1-kallmeyeras@gmail.com/
v2: https://lore.kernel.org/r/20230323025200.5462-1-kallmeyeras@gmail.com/
The diff since v2 is as follows:

--- a/drivers/platform/x86/lenovo-ymc.c
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -21,8 +21,8 @@
 #define LENOVO_YMC_QUERY_METHOD 0x01
 
 static bool ec_trigger __read_mostly;
-module_param(ec_trigger, bool, 0644);
-MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events");
+module_param(ec_trigger, bool, 0444);
+MODULE_PARM_DESC(ec_trigger, "Enable EC triggering work-around to force emitting tablet mode events");
 
 static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
 	{
@@ -43,8 +43,7 @@ struct lenovo_ymc_private {
 static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenovo_ymc_private *priv)
 {
 	int err;
-
-	if (!ec_trigger || !priv || !priv->ec_acpi_dev)
+	if (!priv->ec_acpi_dev)
 		return;
 	err = write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
 	if (err)
@@ -103,11 +102,7 @@ static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
 	lenovo_ymc_trigger_ec(wdev, priv);
 }
 
-static void lenovo_ymc_remove(struct wmi_device *wdev)
-{
-	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
-	acpi_dev_put(priv->ec_acpi_dev);
-}
+static void acpi_dev_put_helper(void *p) { acpi_dev_put(p); }
 
 static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 {
@@ -124,10 +119,18 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 	if (ec_trigger) {
 		pr_debug("Lenovo YMC enable EC triggering.\n");
 		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VPC2004", NULL, -1);
+
 		if (!priv->ec_acpi_dev) {
 			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
 			return -ENODEV;
 		}
+		err = devm_add_action_or_reset(&wdev->dev,
+				acpi_dev_put_helper, priv->ec_acpi_dev);
+		if (err) {
+			dev_err(&wdev->dev,
+				"Could not clean up EC ACPI device: %d\n", err);
+			return err;
+		}
 	}
 
 	input_dev = devm_input_allocate_device(&wdev->dev);
@@ -138,9 +141,6 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 	input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
 	input_dev->id.bustype = BUS_HOST;
 	input_dev->dev.parent = &wdev->dev;
-
-	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
-
 	err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
 	if (err) {
 		dev_err(&wdev->dev,
@@ -177,7 +177,6 @@ static struct wmi_driver lenovo_ymc_driver = {
 	.id_table = lenovo_ymc_wmi_id_table,
 	.probe = lenovo_ymc_probe,
 	.notify = lenovo_ymc_notify,
-	.remove = lenovo_ymc_remove,
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
 drivers/platform/x86/lenovo-ymc.c     | 185 ++++++++++++++++++++++++++
 5 files changed, 349 insertions(+), 134 deletions(-)
 create mode 100644 drivers/platform/x86/ideapad-laptop.h
 create mode 100644 drivers/platform/x86/lenovo-ymc.c

-- 
2.40.0

