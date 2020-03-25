Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5C6192BB1
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 16:02:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgCYPCz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 11:02:55 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:39953 "EHLO
        us-smtp-delivery-74.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727123AbgCYPCz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 11:02:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585148575;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LBRk15qcseZE/DMFtlfR6DfU4yD+asSgWsEr8EdCn6U=;
        b=EwysWyAy+xzAcBTCwEP6oI4RIJAolGttvKi65xGPvktTeXh8a69nwznb1pWyJvFUOGmqz6
        J/rtYFUHznxf5IWeSbeB9hHXvi+Ihpj5RH1rp5nY0I4q57NSNmStQYNTybJabF89PTDYJz
        aXgxBPNsPy096DmnjsGN0tjnArb+jnE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-2U0xbz15NxmV6F7hjgX5Dg-1; Wed, 25 Mar 2020 11:02:51 -0400
X-MC-Unique: 2U0xbz15NxmV6F7hjgX5Dg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE64F800D5E;
        Wed, 25 Mar 2020 15:02:49 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-213.ams2.redhat.com [10.36.112.213])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3AAA510002A7;
        Wed, 25 Mar 2020 15:02:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH v2] Input: goodix - Fix compilation when ACPI support is disabled
Date:   Wed, 25 Mar 2020 16:02:46 +0100
Message-Id: <20200325150246.128463-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

acpi_evaluate_object() and acpi_execute_simple_method() are not part of
the group of ACPI related functions which get stubbed by
include/linux/acpi.h when ACPI support is disabled, so the
IRQ_PIN_ACCESS_ACPI_METHOD handling code must be disabled through
an #ifdef when ACPI support is not enabled.

For consistency also #ifdef out the IRQ_PIN_ACCESS_ACPI_GPIO code
and use the same #if condition as which is used to replace
goodix_add_acpi_gpio_mappings with a stub.

Fixes: c5fca485320e ("Input: goodix - add support for controlling the IRQ=
 pin through ACPI methods")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Introduce ACPI_GPIO_SUPPORT helper define
- Use __maybe_unused for variables which will be unused when
  ACPI_GPIO_SUPPORT is not set
---
 drivers/input/touchscreen/goodix.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 2c9cd1bfb860..7ccd8e436297 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -63,13 +63,20 @@
 #define MAX_CONTACTS_LOC	5
 #define TRIGGER_LOC		6
=20
+/* Our special handling for GPIO accesses through ACPI is x86 specific *=
/
+#if defined CONFIG_X86 && defined CONFIG_ACPI
+#define ACPI_GPIO_SUPPORT
+#endif
+
 struct goodix_ts_data;
=20
 enum goodix_irq_pin_access_method {
 	IRQ_PIN_ACCESS_NONE,
 	IRQ_PIN_ACCESS_GPIO,
+#ifdef ACPI_GPIO_SUPPORT
 	IRQ_PIN_ACCESS_ACPI_GPIO,
 	IRQ_PIN_ACCESS_ACPI_METHOD,
+#endif
 };
=20
 struct goodix_chip_data {
@@ -572,8 +579,8 @@ static int goodix_send_cfg(struct goodix_ts_data *ts,=
 const u8 *cfg, int len)
 static int goodix_irq_direction_output(struct goodix_ts_data *ts,
 				       int value)
 {
-	struct device *dev =3D &ts->client->dev;
-	acpi_status status;
+	struct device *dev __maybe_unused =3D &ts->client->dev;
+	acpi_status status __maybe_unused;
=20
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
@@ -583,6 +590,7 @@ static int goodix_irq_direction_output(struct goodix_=
ts_data *ts,
 		return -EINVAL;
 	case IRQ_PIN_ACCESS_GPIO:
 		return gpiod_direction_output(ts->gpiod_int, value);
+#ifdef ACPI_GPIO_SUPPORT
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		/*
 		 * The IRQ pin triggers on a falling edge, so its gets marked
@@ -593,6 +601,7 @@ static int goodix_irq_direction_output(struct goodix_=
ts_data *ts,
 		status =3D acpi_execute_simple_method(ACPI_HANDLE(dev),
 						    "INTO", value);
 		return ACPI_SUCCESS(status) ? 0 : -EIO;
+#endif
 	}
=20
 	return -EINVAL; /* Never reached */
@@ -600,8 +609,8 @@ static int goodix_irq_direction_output(struct goodix_=
ts_data *ts,
=20
 static int goodix_irq_direction_input(struct goodix_ts_data *ts)
 {
-	struct device *dev =3D &ts->client->dev;
-	acpi_status status;
+	struct device *dev __maybe_unused =3D &ts->client->dev;
+	acpi_status status __maybe_unused;
=20
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
@@ -610,12 +619,15 @@ static int goodix_irq_direction_input(struct goodix=
_ts_data *ts)
 			__func__);
 		return -EINVAL;
 	case IRQ_PIN_ACCESS_GPIO:
+		return gpiod_direction_input(ts->gpiod_int);
+#ifdef ACPI_GPIO_SUPPORT
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		return gpiod_direction_input(ts->gpiod_int);
 	case IRQ_PIN_ACCESS_ACPI_METHOD:
 		status =3D acpi_evaluate_object(ACPI_HANDLE(dev), "INTI",
 					      NULL, NULL);
 		return ACPI_SUCCESS(status) ? 0 : -EIO;
+#endif
 	}
=20
 	return -EINVAL; /* Never reached */
@@ -679,7 +691,7 @@ static int goodix_reset(struct goodix_ts_data *ts)
 	return 0;
 }
=20
-#if defined CONFIG_X86 && defined CONFIG_ACPI
+#ifdef ACPI_GPIO_SUPPORT
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
=20
@@ -862,6 +874,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 	ts->gpiod_rst =3D gpiod;
=20
 	switch (ts->irq_pin_access_method) {
+#ifdef ACPI_GPIO_SUPPORT
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		/*
 		 * We end up here if goodix_add_acpi_gpio_mappings() has
@@ -878,6 +891,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
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

