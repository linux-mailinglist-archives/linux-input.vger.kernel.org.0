Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8325D6E1D09
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 09:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjDNHWK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 03:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjDNHWJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 03:22:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7464C06
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681456884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=jHlI4DTb/cCkvdxPoy65g67YEcoUlsmTkMzv/kqSTJg=;
        b=QB7+P9g2PSuo7IuaeXLbMAZW7j2pnHme8PfQ0PkWdeZRWKeIxovFBUIOV561+FwFF7/PVh
        WZrVy+ckM/MG6TLBz2gJz13Ct2LjAHktf7lrhI0pEIqDaigm/78On8uEbcTtJgE9heMuS5
        PvlBH8WeFBlWe9EEPrS9r3pA0CS/xJ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-vPxewyHkNVmMLfH_zfKdMA-1; Fri, 14 Apr 2023 03:21:23 -0400
X-MC-Unique: vPxewyHkNVmMLfH_zfKdMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9BF93802AC2;
        Fri, 14 Apr 2023 07:21:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3F5A4492B00;
        Fri, 14 Apr 2023 07:21:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: soc_button_array - Add invalid acpi_index DMI quirk handling
Date:   Fri, 14 Apr 2023 09:21:16 +0200
Message-Id: <20230414072116.4497-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices have a wrong entry in their button array which points to
a GPIO which is required in another driver, so soc_button_array must
not claim it.

A specific example of this is the Lenovo Yoga Book X90F / X90L,
where the PNP0C40 home button entry points to a GPIO which is not
a home button and which is required by the lenovo-yogabook driver.

Add a DMI quirk table which can specify an ACPI GPIO resource index which
should be skipped; and add an entry for the Lenovo Yoga Book X90F / X90L
to this new DMI quirk table.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 09489380afda..e79f5497948b 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -108,6 +108,27 @@ static const struct dmi_system_id dmi_use_low_level_irq[] = {
 	{} /* Terminating entry */
 };
 
+/*
+ * Some devices have a wrong entry which points to a GPIO which is
+ * required in another driver, so this driver must not claim it.
+ */
+static const struct dmi_system_id dmi_invalid_acpi_index[] = {
+	{
+		/*
+		 * Lenovo Yoga Book X90F / X90L, the PNP0C40 home button entry
+		 * points to a GPIO which is not a home button and which is
+		 * required by the lenovo-yogabook driver.
+		 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "YETI-11"),
+		},
+		.driver_data = (void *)1l,
+	},
+	{} /* Terminating entry */
+};
+
 /*
  * Get the Nth GPIO number from the ACPI object.
  */
@@ -137,6 +158,8 @@ soc_button_device_create(struct platform_device *pdev,
 	struct platform_device *pd;
 	struct gpio_keys_button *gpio_keys;
 	struct gpio_keys_platform_data *gpio_keys_pdata;
+	const struct dmi_system_id *dmi_id;
+	int invalid_acpi_index = -1;
 	int error, gpio, irq;
 	int n_buttons = 0;
 
@@ -154,10 +177,17 @@ soc_button_device_create(struct platform_device *pdev,
 	gpio_keys = (void *)(gpio_keys_pdata + 1);
 	n_buttons = 0;
 
+	dmi_id = dmi_first_match(dmi_invalid_acpi_index);
+	if (dmi_id)
+		invalid_acpi_index = (long)dmi_id->driver_data;
+
 	for (info = button_info; info->name; info++) {
 		if (info->autorepeat != autorepeat)
 			continue;
 
+		if (info->acpi_index == invalid_acpi_index)
+			continue;
+
 		error = soc_button_lookup_gpio(&pdev->dev, info->acpi_index, &gpio, &irq);
 		if (error || irq < 0) {
 			/*
-- 
2.39.1

