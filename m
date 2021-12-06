Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBAFE469219
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 10:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240135AbhLFJOz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 04:14:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56818 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240113AbhLFJOy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 04:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638781886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wa3WpmpH0IbGokyHbF+rFyNHzMjiOuSen/H5CZS+YdI=;
        b=SkLL0SgXiz9gsUAwIBHTVYdnPF095rrmA+hsbNrylaxvlvnQzKv+YvobUF28041y35lKwi
        5XwAsfNYeF5tuRebCYtYXc8y0kVGc3O+4kHduVk6MWPwBGu3SXMqucJD8c499bjhGUDCO5
        o3lu5N5Wbm4zsaOloHhbDSe/gSQo31M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-6-QMwYcMNKmYMH4okz9ZaA-1; Mon, 06 Dec 2021 04:11:23 -0500
X-MC-Unique: 6-QMwYcMNKmYMH4okz9ZaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B576F1006AA0;
        Mon,  6 Dec 2021 09:11:19 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.76])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C34DA1000324;
        Mon,  6 Dec 2021 09:11:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH regression fix 1/1] Input: goodix - Try not to touch the reset-pin on x86/ACPI devices
Date:   Mon,  6 Dec 2021 10:11:16 +0100
Message-Id: <20211206091116.44466-2-hdegoede@redhat.com>
In-Reply-To: <20211206091116.44466-1-hdegoede@redhat.com>
References: <20211206091116.44466-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unless the controller is not responding at boot or after suspend/resume,
the driver never resets the controller on x86/ACPI platforms. The driver
still requesting the reset pin at probe() though in case it needs it.

Until now the driver has always requested the reset pin with GPIOD_IN
as type. The idea being to put the pin in high-impedance mode to save
power until the driver actually wants to issue a reset.

But this means that just requesting the pin can cause issues, since
requesting it in another mode then GPIOD_ASIS may cause the pinctrl
driver to touch the pin settings. We have already had issues before
due to a bug in the pinctrl-cherryview.c driver which has been fixed in
commit 921daeeca91b ("pinctrl: cherryview: Preserve
CHV_PADCTRL1_INVRXTX_TXDATA flag on GPIOs").

And now it turns out that requesting the reset-pin as GPIOD_IN also stops
the touchscreen from working on the GPD P2 max mini-laptop. The behavior
of putting the pin in high-impedance mode relies on there being some
external pull-up to keep it high and there seems to be no pull-up on the
GPD P2 max, causing things to break.

This commit fixes this by requesting the reset pin as is when using
the x86/ACPI code paths to lookup the GPIOs; and by not dropping it
back into input-mode in case the driver does end up issuing a reset
for error-recovery.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209061
Fixes: a7d4b171660c ("Input: goodix - add support for getting IRQ + reset GPIOs on Cherry Trail devices")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 30 +++++++++++++++++++++++++-----
 drivers/input/touchscreen/goodix.h |  1 +
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index b5cc91788195..eaa659969097 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -650,10 +650,16 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
 
 	usleep_range(6000, 10000);		/* T4: > 5ms */
 
-	/* end select I2C slave addr */
-	error = gpiod_direction_input(ts->gpiod_rst);
-	if (error)
-		goto error;
+	/*
+	 * Put the reset pin back in to input / high-impedance mode to save
+	 * power. Only do this in the non ACPI case since some ACPI boards
+	 * don't have a pull-up, so there the reset pin must stay active-high.
+	 */
+	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
+		error = gpiod_direction_input(ts->gpiod_rst);
+		if (error)
+			goto error;
+	}
 
 	return 0;
 
@@ -787,6 +793,14 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
 		return -EINVAL;
 	}
 
+	/*
+	 * Normally we put the reset pin in input / high-impedance mode to save
+	 * power. But some x86/ACPI boards don't have a pull-up, so for the ACPI
+	 * case, leave the pin as is. This results in the pin not being touched
+	 * at all on x86/ACPI boards, except when needed for error-recover.
+	 */
+	ts->gpiod_rst_flags = GPIOD_ASIS;
+
 	return devm_acpi_dev_add_driver_gpios(dev, gpio_mapping);
 }
 #else
@@ -812,6 +826,12 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 		return -EINVAL;
 	dev = &ts->client->dev;
 
+	/*
+	 * By default we request the reset pin as input, leaving it in
+	 * high-impedance when not resetting the controller to save power.
+	 */
+	ts->gpiod_rst_flags = GPIOD_IN;
+
 	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
 	if (IS_ERR(ts->avdd28)) {
 		error = PTR_ERR(ts->avdd28);
@@ -849,7 +869,7 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
 	ts->gpiod_int = gpiod;
 
 	/* Get the reset line GPIO pin number */
-	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, GPIOD_IN);
+	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, ts->gpiod_rst_flags);
 	if (IS_ERR(gpiod)) {
 		error = PTR_ERR(gpiod);
 		if (error != -EPROBE_DEFER)
diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
index 62138f930d1a..02065d1c3263 100644
--- a/drivers/input/touchscreen/goodix.h
+++ b/drivers/input/touchscreen/goodix.h
@@ -87,6 +87,7 @@ struct goodix_ts_data {
 	struct gpio_desc *gpiod_rst;
 	int gpio_count;
 	int gpio_int_idx;
+	enum gpiod_flags gpiod_rst_flags;
 	char id[GOODIX_ID_MAX_LEN + 1];
 	char cfg_name[64];
 	u16 version;
-- 
2.33.1

