Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3644617CE0F
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbgCGMPU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:20 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42958 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726271AbgCGMPU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tou7V5bOOjk/BEzM4E4MQAoR4VhA2W0il1PSCWAthwg=;
        b=Z2JHOtxfX0zFv0S+lfLbOMB74focprIbZL7G+GTI7giHR77vQLRN48RDm+Y2uhjHMS/zjh
        N4d1yJ8WzVX7qWYVVkCg9xthG9i+BctN62KcKR2q1qg9ilTonPsA1QVsjvLC88NPTFGCUS
        jc/ytFgfxp0HKKOPLNUehZzYDB4Hx/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-yOSyjbA6M-Klg75K4Rqbjg-1; Sat, 07 Mar 2020 07:15:17 -0500
X-MC-Unique: yOSyjbA6M-Klg75K4Rqbjg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE508800D50;
        Sat,  7 Mar 2020 12:15:15 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A33121BC6D;
        Sat,  7 Mar 2020 12:15:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v3 06/11] Input: goodix - Add support for controlling the IRQ pin through ACPI methods
Date:   Sat,  7 Mar 2020 13:15:00 +0100
Message-Id: <20200307121505.3707-6-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some Apollo Lake (x86, UEFI + ACPI) devices only list the reset GPIO
in their _CRS table and the bit-banging of the IRQ line necessary to
wake-up the controller from suspend can be done by calling 2 Goodix
custom / specific ACPI methods.

This commit adds support for controlling the IRQ line in this matter,
allowing us to properly suspend the touchscreen controller on such
devices.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 712ca0273cfc..3ff05a35ac1e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -35,6 +35,7 @@ enum goodix_irq_pin_access_method {
 	IRQ_PIN_ACCESS_NONE,
 	IRQ_PIN_ACCESS_GPIO,
 	IRQ_PIN_ACCESS_ACPI_GPIO,
+	IRQ_PIN_ACCESS_ACPI_METHOD,
 };
=20
 struct goodix_chip_data {
@@ -516,6 +517,9 @@ static int goodix_send_cfg(struct goodix_ts_data *ts,
 static int goodix_irq_direction_output(struct goodix_ts_data *ts,
 				       int value)
 {
+	struct device *dev =3D &ts->client->dev;
+	acpi_status status;
+
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
 		dev_err(&ts->client->dev,
@@ -530,6 +534,10 @@ static int goodix_irq_direction_output(struct goodix=
_ts_data *ts,
 		 * as active-low, use output_raw to avoid the value inversion.
 		 */
 		return gpiod_direction_output_raw(ts->gpiod_int, value);
+	case IRQ_PIN_ACCESS_ACPI_METHOD:
+		status =3D acpi_execute_simple_method(ACPI_HANDLE(dev),
+						    "INTO", value);
+		return ACPI_SUCCESS(status) ? 0 : -EIO;
 	}
=20
 	return -EINVAL; /* Never reached */
@@ -537,6 +545,9 @@ static int goodix_irq_direction_output(struct goodix_=
ts_data *ts,
=20
 static int goodix_irq_direction_input(struct goodix_ts_data *ts)
 {
+	struct device *dev =3D &ts->client->dev;
+	acpi_status status;
+
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
 		dev_err(&ts->client->dev,
@@ -546,6 +557,10 @@ static int goodix_irq_direction_input(struct goodix_=
ts_data *ts)
 	case IRQ_PIN_ACCESS_GPIO:
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		return gpiod_direction_input(ts->gpiod_int);
+	case IRQ_PIN_ACCESS_ACPI_METHOD:
+		status =3D acpi_evaluate_object(ACPI_HANDLE(dev), "INTI",
+					      NULL, NULL);
+		return ACPI_SUCCESS(status) ? 0 : -EIO;
 	}
=20
 	return -EINVAL; /* Never reached */
@@ -640,6 +655,11 @@ static const struct acpi_gpio_mapping acpi_goodix_in=
t_last_gpios[] =3D {
 	{ },
 };
=20
+static const struct acpi_gpio_mapping acpi_goodix_reset_only_gpios[] =3D=
 {
+	{ GOODIX_GPIO_RST_NAME "-gpios", &first_gpio, 1 },
+	{ },
+};
+
 static int goodix_resource(struct acpi_resource *ares, void *data)
 {
 	struct goodix_ts_data *ts =3D data;
@@ -697,6 +717,12 @@ static int goodix_add_acpi_gpio_mappings(struct good=
ix_ts_data *ts)
 	} else if (ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D 1) {
 		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_ACPI_GPIO;
 		gpio_mapping =3D acpi_goodix_int_last_gpios;
+	} else if (ts->gpio_count =3D=3D 1 && ts->gpio_int_idx =3D=3D -1 &&
+		   acpi_has_method(ACPI_HANDLE(dev), "INTI") &&
+		   acpi_has_method(ACPI_HANDLE(dev), "INTO")) {
+		dev_info(dev, "Using ACPI INTI and INTO methods for IRQ pin access\n")=
;
+		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_ACPI_METHOD;
+		gpio_mapping =3D acpi_goodix_reset_only_gpios;
 	} else if (is_byt() && ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D=
 -1) {
 		dev_info(dev, "No ACPI GpioInt resource, assuming that the GPIO order =
is reset, int\n");
 		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_ACPI_GPIO;
@@ -793,6 +819,10 @@ static int goodix_get_gpio_config(struct goodix_ts_d=
ata *ts)
 		if (!ts->gpiod_int || !ts->gpiod_rst)
 			ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_NONE;
 		break;
+	case IRQ_PIN_ACCESS_ACPI_METHOD:
+		if (!ts->gpiod_rst)
+			ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_NONE;
+		break;
 	default:
 		if (ts->gpiod_int && ts->gpiod_rst) {
 			ts->reset_controller_at_probe =3D true;
--=20
2.25.1

