Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB6B4C69FD
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 12:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiB1LRF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 06:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbiB1LRE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 06:17:04 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AEBE0BF2
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 03:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646046984;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=WDq8TeqQXRgYHonCGhqBHu6sMuygnuHfZ4PuHtNiFEg=;
        b=YjZS7QUkPRQ+PTBOxQ+sS9WXipc1h1Fy+82zjC5DEnaujPz3G8MCJMQakXaktn3VBrV7WS
        8VLV6NbZj0yu6Kwv7owxGhc6engpS9VnQreGqg3qfcXptEw8hmsNJ/r85GOOqNOTWMdGGL
        +nK0HMj97nRO2VhGs0p3Mhn+cv9zrns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-7Vys7GqGPwCabJRDLCxfoA-1; Mon, 28 Feb 2022 06:16:23 -0500
X-MC-Unique: 7Vys7GqGPwCabJRDLCxfoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01944180FD71;
        Mon, 28 Feb 2022 11:16:22 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.120])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 987B373696;
        Mon, 28 Feb 2022 11:16:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: goodix - Workaround Cherry Trail devices with a bogus ACPI Interrupt() resource
Date:   Mon, 28 Feb 2022 12:16:13 +0100
Message-Id: <20220228111613.363336-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

ACPI/x86 devices with a Cherry Trail SoC should have a GpioInt + a regular
GPIO ACPI resource in their ACPI tables.

Some CHT devices have a bug, where the also is bogus Interrupt resource
(likely copied from a previous Bay Trail based generation of the device).

The i2c-core-acpi code will assign the bogus, non-working, Interrupt
resource to client->irq. Add a workaround to fix this up.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=2043960
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note this depends on "[PATCH v2 5/5] Input: goodix - Use the new
soc_intel_is_byt() helper" from this series:
https://lore.kernel.org/linux-input/20220131143539.109142-1-hdegoede@redhat.com/
---
 drivers/input/touchscreen/goodix.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index dac19a790c35..3ad9870db108 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -854,7 +854,7 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
 	const struct acpi_gpio_mapping *gpio_mapping = NULL;
 	struct device *dev = &ts->client->dev;
 	LIST_HEAD(resources);
-	int ret;
+	int irq, ret;
 
 	ts->gpio_count = 0;
 	ts->gpio_int_idx = -1;
@@ -867,6 +867,20 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
 
 	acpi_dev_free_resource_list(&resources);
 
+	/*
+	 * CHT devices should have a GpioInt + a regular GPIO ACPI resource.
+	 * Some CHT devices have a bug (where the also is bogus Interrupt
+	 * resource copied from a previous BYT based generation). i2c-core-acpi
+	 * will use the non-working Interrupt resource, fix this up.
+	 */
+	if (soc_intel_is_cht() && ts->gpio_count == 2 && ts->gpio_int_idx != -1) {
+		irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(dev), 0);
+		if (irq > 0 && irq != ts->client->irq) {
+			dev_warn(dev, "Overriding IRQ %d -> %d\n", ts->client->irq, irq);
+			ts->client->irq = irq;
+		}
+	}
+
 	if (ts->gpio_count == 2 && ts->gpio_int_idx == 0) {
 		ts->irq_pin_access_method = IRQ_PIN_ACCESS_ACPI_GPIO;
 		gpio_mapping = acpi_goodix_int_first_gpios;
-- 
2.35.1

