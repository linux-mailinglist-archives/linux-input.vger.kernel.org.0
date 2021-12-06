Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508E246A1C2
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 17:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238218AbhLFQv0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 11:51:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34316 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238986AbhLFQv0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 11:51:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638809276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iLfHLDvfxG2cRSVV6Ut4uFvNTziq8Csx1f1+LZvT8pc=;
        b=bczI+a1jb88A3oTkfaTfg2JvKGheOhYgdiNOTp1RPPwAatng5klQezbSM4/HaemvyzQqov
        b0X180UJ1MHsRtQgPAiktHKwKmeLjfIExePD3OC85NF6oW1546+dkODgHqai8FQZvpBJTh
        3Yu6fAWzFMnlTe0KPIWleNUJkWqyeb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-545-9O0nu0DtN5a3aDHNJpYPQQ-1; Mon, 06 Dec 2021 11:47:53 -0500
X-MC-Unique: 9O0nu0DtN5a3aDHNJpYPQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 437AA1853041;
        Mon,  6 Dec 2021 16:47:52 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.105])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3F36C7945A;
        Mon,  6 Dec 2021 16:47:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 2/4] Input: goodix - Improve gpiod_get() error logging
Date:   Mon,  6 Dec 2021 17:47:45 +0100
Message-Id: <20211206164747.197309-3-hdegoede@redhat.com>
In-Reply-To: <20211206164747.197309-1-hdegoede@redhat.com>
References: <20211206164747.197309-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

goodix_get_gpio_config() errors are fatal (abort probe()) so log them
at KERN_ERR level rather then as debug messages.

This change uses dev_err_probe() to automatically suppress the errors
in case of -EPROBE_DEFER.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index aaa3c455e01e..73f3b24f7f1e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -854,13 +854,10 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 retry_get_irq_gpio:
 	/* Get the interrupt GPIO pin number */
 	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
-	if (IS_ERR(gpiod)) {
-		error = PTR_ERR(gpiod);
-		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
-				GOODIX_GPIO_INT_NAME, error);
-		return error;
-	}
+	if (IS_ERR(gpiod))
+		return dev_err_probe(dev, PTR_ERR(gpiod), "getting %s GPIO\n",
+				     GOODIX_GPIO_INT_NAME);
+
 	if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings) {
 		added_acpi_mappings = true;
 		if (goodix_add_acpi_gpio_mappings(ts) == 0)
@@ -871,13 +868,9 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 
 	/* Get the reset line GPIO pin number */
 	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, ts->gpiod_rst_flags);
-	if (IS_ERR(gpiod)) {
-		error = PTR_ERR(gpiod);
-		if (error != -EPROBE_DEFER)
-			dev_dbg(dev, "Failed to get %s GPIO: %d\n",
-				GOODIX_GPIO_RST_NAME, error);
-		return error;
-	}
+	if (IS_ERR(gpiod))
+		return dev_err_probe(dev, PTR_ERR(gpiod), "getting %s GPIO\n",
+				     GOODIX_GPIO_RST_NAME);
 
 	ts->gpiod_rst = gpiod;
 
-- 
2.33.1

