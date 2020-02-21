Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 644571683FC
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2020 17:48:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbgBUQsB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Feb 2020 11:48:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26031 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726955AbgBUQsA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Feb 2020 11:48:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582303680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WHTRVbOJSnLyD+b9eFeWynm9ZD0sAC98G0y7Pko23xQ=;
        b=b9M9YrVDJQI5HoRvMMAWUNJCgWP4+G7mVAwLZap0F/pDeWb5XsfFZUviRttsAiaFRD9qyZ
        UUh0ojymOh6Ge5O/5h0a6IrKo6eRxu6R73XGuSFigahcRl09FwH4+y2AMH6nt1VYsqnxG2
        vhrNmtH9g2mIkUQ+P8bI+ECCTrqJFuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-O0RZzHb_NdCi3bd1WGZKhg-1; Fri, 21 Feb 2020 11:47:56 -0500
X-MC-Unique: O0RZzHb_NdCi3bd1WGZKhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2B18801E5C;
        Fri, 21 Feb 2020 16:47:54 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-191.ams2.redhat.com [10.36.116.191])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 73FAA6106C;
        Fri, 21 Feb 2020 16:47:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH resend 06/10] Input: goodix - Add support for controlling the IRQ pin through ACPI methods
Date:   Fri, 21 Feb 2020 17:47:31 +0100
Message-Id: <20200221164735.508324-6-hdegoede@redhat.com>
In-Reply-To: <20200221164735.508324-1-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index d178aa33b529..784c4dd8c430 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -35,6 +35,7 @@ enum goodix_irq_pin_access_method {
 	irq_pin_access_none,
 	irq_pin_access_gpio,
 	irq_pin_access_acpi_gpio,
+	irq_pin_access_acpi_method,
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
 	case irq_pin_access_none:
 		dev_err(&ts->client->dev,
@@ -530,6 +534,10 @@ static int goodix_irq_direction_output(struct goodix=
_ts_data *ts,
 		 * as active-low, use output_raw to avoid the value inversion.
 		 */
 		return gpiod_direction_output_raw(ts->gpiod_int, value);
+	case irq_pin_access_acpi_method:
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
 	case irq_pin_access_none:
 		dev_err(&ts->client->dev,
@@ -546,6 +557,10 @@ static int goodix_irq_direction_input(struct goodix_=
ts_data *ts)
 	case irq_pin_access_gpio:
 	case irq_pin_access_acpi_gpio:
 		return gpiod_direction_input(ts->gpiod_int);
+	case irq_pin_access_acpi_method:
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
@@ -690,6 +710,12 @@ static int goodix_add_acpi_gpio_mappings(struct good=
ix_ts_data *ts)
 	} else if (ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D 1) {
 		ts->irq_pin_access_method =3D irq_pin_access_acpi_gpio;
 		gpio_mapping =3D acpi_goodix_int_last_gpios;
+	} else if (ts->gpio_count =3D=3D 1 && ts->gpio_int_idx =3D=3D -1 &&
+		   acpi_has_method(ACPI_HANDLE(dev), "INTI") &&
+		   acpi_has_method(ACPI_HANDLE(dev), "INTO")) {
+		dev_info(dev, "Using ACPI INTI and INTO methods for IRQ pin access\n")=
;
+		ts->irq_pin_access_method =3D irq_pin_access_acpi_method;
+		gpio_mapping =3D acpi_goodix_reset_only_gpios;
 	} else if (is_byt() && ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D=
 -1) {
 		dev_info(dev, "No ACPI GpioInt resource, assuming that the GPIO order =
is reset, int\n");
 		ts->irq_pin_access_method =3D irq_pin_access_acpi_gpio;
@@ -778,6 +804,10 @@ static int goodix_get_gpio_config(struct goodix_ts_d=
ata *ts)
 		if (!ts->gpiod_int || !ts->gpiod_rst)
 			ts->irq_pin_access_method =3D irq_pin_access_none;
 		break;
+	case irq_pin_access_acpi_method:
+		if (!ts->gpiod_rst)
+			ts->irq_pin_access_method =3D irq_pin_access_none;
+		break;
 	default:
 		if (ts->gpiod_int && ts->gpiod_rst) {
 			ts->reset_controller_at_probe =3D true;
--=20
2.25.0

