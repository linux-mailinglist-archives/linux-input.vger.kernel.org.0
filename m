Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 044031925A9
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 11:33:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgCYKd4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 06:33:56 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:44133 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726103AbgCYKdz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 06:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585132434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=BPR3FlxyC5kK5PpI1OFPZ2Sj1DbpRSqsmjQxPhq5n8Q=;
        b=BG18qvhQilpXhrKfLi3ECD1UtttarVGPOE4zgS9hyPkmR8Ijk7WRP7G7dLB21n6jfIdCuC
        qzYNgO2T++xifwnMoDQN4GMF+lgAcmoi22/eAZ74nmbE4XKildVdIb2rWIRII8xTqGO0LK
        sMqk6rTWqeR6QwEoffzY3anmvgnS5ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-DpMzGr-JOMiTgKbMks5CeQ-1; Wed, 25 Mar 2020 06:33:52 -0400
X-MC-Unique: DpMzGr-JOMiTgKbMks5CeQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E496107ACC4;
        Wed, 25 Mar 2020 10:33:51 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-115-75.ams2.redhat.com [10.36.115.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 397CB46;
        Wed, 25 Mar 2020 10:33:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] Input: goodix - Fix compilation when ACPI support is disabled
Date:   Wed, 25 Mar 2020 11:33:48 +0100
Message-Id: <20200325103348.108792-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

acpi_execute_simple_method() is not part of the group of ACPI
related functions which get stubbed by include/linux/acpi.h
when ACPI support is disabled, so the IRQ_PIN_ACCESS_ACPI_METHOD
handling code must be disabled through an #ifdef when ACPI support
is not enabled.

For consistency also #ifdef out the IRQ_PIN_ACCESS_ACPI_GPIO code
and use the same #if condition as which is used to replace
goodix_add_acpi_gpio_mappings with a stub.

Fixes: c5fca485320e ("Input: goodix - add support for controlling the IRQ=
 pin through ACPI methods")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 2c9cd1bfb860..a593ca38b35b 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -68,8 +68,10 @@ struct goodix_ts_data;
 enum goodix_irq_pin_access_method {
 	IRQ_PIN_ACCESS_NONE,
 	IRQ_PIN_ACCESS_GPIO,
+#if defined CONFIG_X86 && defined CONFIG_ACPI
 	IRQ_PIN_ACCESS_ACPI_GPIO,
 	IRQ_PIN_ACCESS_ACPI_METHOD,
+#endif
 };
=20
 struct goodix_chip_data {
@@ -572,9 +574,6 @@ static int goodix_send_cfg(struct goodix_ts_data *ts,=
 const u8 *cfg, int len)
 static int goodix_irq_direction_output(struct goodix_ts_data *ts,
 				       int value)
 {
-	struct device *dev =3D &ts->client->dev;
-	acpi_status status;
-
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
 		dev_err(&ts->client->dev,
@@ -583,26 +582,29 @@ static int goodix_irq_direction_output(struct goodi=
x_ts_data *ts,
 		return -EINVAL;
 	case IRQ_PIN_ACCESS_GPIO:
 		return gpiod_direction_output(ts->gpiod_int, value);
+#if defined CONFIG_X86 && defined CONFIG_ACPI
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		/*
 		 * The IRQ pin triggers on a falling edge, so its gets marked
 		 * as active-low, use output_raw to avoid the value inversion.
 		 */
 		return gpiod_direction_output_raw(ts->gpiod_int, value);
-	case IRQ_PIN_ACCESS_ACPI_METHOD:
+	case IRQ_PIN_ACCESS_ACPI_METHOD: {
+		struct device *dev =3D &ts->client->dev;
+		acpi_status status;
+
 		status =3D acpi_execute_simple_method(ACPI_HANDLE(dev),
 						    "INTO", value);
 		return ACPI_SUCCESS(status) ? 0 : -EIO;
 	}
+#endif
+	}
=20
 	return -EINVAL; /* Never reached */
 }
=20
 static int goodix_irq_direction_input(struct goodix_ts_data *ts)
 {
-	struct device *dev =3D &ts->client->dev;
-	acpi_status status;
-
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
 		dev_err(&ts->client->dev,
@@ -610,13 +612,20 @@ static int goodix_irq_direction_input(struct goodix=
_ts_data *ts)
 			__func__);
 		return -EINVAL;
 	case IRQ_PIN_ACCESS_GPIO:
+		return gpiod_direction_input(ts->gpiod_int);
+#if defined CONFIG_X86 && defined CONFIG_ACPI
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		return gpiod_direction_input(ts->gpiod_int);
-	case IRQ_PIN_ACCESS_ACPI_METHOD:
+	case IRQ_PIN_ACCESS_ACPI_METHOD: {
+		struct device *dev =3D &ts->client->dev;
+		acpi_status status;
+
 		status =3D acpi_evaluate_object(ACPI_HANDLE(dev), "INTI",
 					      NULL, NULL);
 		return ACPI_SUCCESS(status) ? 0 : -EIO;
 	}
+#endif
+	}
=20
 	return -EINVAL; /* Never reached */
 }
@@ -862,6 +871,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 	ts->gpiod_rst =3D gpiod;
=20
 	switch (ts->irq_pin_access_method) {
+#if defined CONFIG_X86 && defined CONFIG_ACPI
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		/*
 		 * We end up here if goodix_add_acpi_gpio_mappings() has
@@ -878,6 +888,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 		if (!ts->gpiod_rst)
 			ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_NONE;
 		break;
+#endif
 	default:
 		if (ts->gpiod_int && ts->gpiod_rst) {
 			ts->reset_controller_at_probe =3D true;
--=20
2.26.0.rc2

