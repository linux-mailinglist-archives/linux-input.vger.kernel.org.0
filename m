Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E741D46A1C3
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 17:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238587AbhLFQv1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 11:51:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23006 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238986AbhLFQv0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 11:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638809277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D1pbM5cTC1SRSeszni8lqmPfb+wAktXXqaIxtOytK0I=;
        b=d5+vxuXZYx0XzDijPzJL7tbKez0g2Peuegn+Lp8pmjDnYbujUfj23amQ07jmuE8zfxvz4t
        5omEDXLeh6m91nOrjBzHvdCVxoo2wme1uuKDqZ46M6wUhsDg+9k4Kgv67m5heBL2WV0r/5
        TxEFN29YcRS6z9QcNO4QeoTkUbPJsCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-IIng81iQMKCZZlNjP6htYg-1; Mon, 06 Dec 2021 11:47:54 -0500
X-MC-Unique: IIng81iQMKCZZlNjP6htYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87FC381C9A9;
        Mon,  6 Dec 2021 16:47:53 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.105])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8D3F979458;
        Mon,  6 Dec 2021 16:47:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 3/4] Input: goodix - Use the new soc_intel_is_byt() helper
Date:   Mon,  6 Dec 2021 17:47:46 +0100
Message-Id: <20211206164747.197309-4-hdegoede@redhat.com>
In-Reply-To: <20211206164747.197309-1-hdegoede@redhat.com>
References: <20211206164747.197309-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use the new soc_intel_is_byt() helper from
linux/platform_data/x86/soc.h.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 73f3b24f7f1e..2d38a941e7e4 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
@@ -686,21 +687,6 @@ static int goodix_reset(struct goodix_ts_data *ts)
 }
 
 #ifdef ACPI_GPIO_SUPPORT
-#include <asm/cpu_device_id.h>
-#include <asm/intel-family.h>
-
-static const struct x86_cpu_id baytrail_cpu_ids[] = {
-	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT, X86_FEATURE_ANY, },
-	{}
-};
-
-static inline bool is_byt(void)
-{
-	const struct x86_cpu_id *id = x86_match_cpu(baytrail_cpu_ids);
-
-	return !!id;
-}
-
 static const struct acpi_gpio_params first_gpio = { 0, 0, false };
 static const struct acpi_gpio_params second_gpio = { 1, 0, false };
 
@@ -784,7 +770,7 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
 		dev_info(dev, "Using ACPI INTI and INTO methods for IRQ pin access\n");
 		ts->irq_pin_access_method = IRQ_PIN_ACCESS_ACPI_METHOD;
 		gpio_mapping = acpi_goodix_reset_only_gpios;
-	} else if (is_byt() && ts->gpio_count == 2 && ts->gpio_int_idx == -1) {
+	} else if (soc_intel_is_byt() && ts->gpio_count == 2 && ts->gpio_int_idx == -1) {
 		dev_info(dev, "No ACPI GpioInt resource, assuming that the GPIO order is reset, int\n");
 		ts->irq_pin_access_method = IRQ_PIN_ACCESS_ACPI_GPIO;
 		gpio_mapping = acpi_goodix_int_last_gpios;
-- 
2.33.1

