Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 101BA1683F9
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2020 17:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgBUQrz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Feb 2020 11:47:55 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:31018 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726773AbgBUQry (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Feb 2020 11:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582303674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J+h2xlAvTezctGFT/NJBPoQsJzOw3OP+xAZSoYzr4MQ=;
        b=c6isjIR3HsqrCToh/e/tog25gEBPciORAwc8VGU1k1AHnlOYhgLytf0oOURrQFY2EzYTJ9
        Z5AJMMgItGA4MCeU6jcTD4gx0i9bD7JtSQzgT37Xs11KFsqv7hKbSTmRIgCcdpgev/mrkC
        PQOrWtWe1fp06wc4Le/hLOKbm45p7qU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-EcSHNCniNfy1_dSIHoqB-A-1; Fri, 21 Feb 2020 11:47:52 -0500
X-MC-Unique: EcSHNCniNfy1_dSIHoqB-A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CE6118A6ECE;
        Fri, 21 Feb 2020 16:47:51 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-191.ams2.redhat.com [10.36.116.191])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F09B960BE0;
        Fri, 21 Feb 2020 16:47:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH resend 04/10] Input: goodix - Add support for getting IRQ + reset GPIOs on Cherry Trail devices
Date:   Fri, 21 Feb 2020 17:47:29 +0100
Message-Id: <20200221164735.508324-4-hdegoede@redhat.com>
In-Reply-To: <20200221164735.508324-1-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On most Cherry Trail (x86, UEFI + ACPI) devices the ACPI tables do not ha=
ve
a _DSD with a "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID, adding
"irq-gpios" and "reset-gpios" mappings, so we cannot get the GPIOS by nam=
e
without first manually adding mappings ourselves.

These devices contain 1 GpioInt and 1 GpioIo resource in their _CRS table=
.
There is no fixed order for these 2. This commit adds code to check that
there is 1 of each as expected and then registers a mapping matching thei=
r
order using devm_acpi_dev_add_driver_gpios().

This gives us access to both GPIOs allowing us to properly suspend the
controller during suspend, and making it possible to reset the controller
if necessary.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 113 ++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index dd5a8f9e8ada..9de2f325ac6e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -34,6 +34,7 @@ struct goodix_ts_data;
 enum goodix_irq_pin_access_method {
 	irq_pin_access_none,
 	irq_pin_access_gpio,
+	irq_pin_access_acpi_gpio,
 };
=20
 struct goodix_chip_data {
@@ -53,6 +54,8 @@ struct goodix_ts_data {
 	struct regulator *vddio;
 	struct gpio_desc *gpiod_int;
 	struct gpio_desc *gpiod_rst;
+	int gpio_count;
+	int gpio_int_idx;
 	u16 id;
 	u16 version;
 	const char *cfg_name;
@@ -521,6 +524,12 @@ static int goodix_irq_direction_output(struct goodix=
_ts_data *ts,
 		return -EINVAL;
 	case irq_pin_access_gpio:
 		return gpiod_direction_output(ts->gpiod_int, value);
+	case irq_pin_access_acpi_gpio:
+		/*
+		 * The IRQ pin triggers on a falling edge, so its gets marked
+		 * as active-low, use output_raw to avoid the value inversion.
+		 */
+		return gpiod_direction_output_raw(ts->gpiod_int, value);
 	}
=20
 	return -EINVAL; /* Never reached */
@@ -535,6 +544,7 @@ static int goodix_irq_direction_input(struct goodix_t=
s_data *ts)
 			__func__);
 		return -EINVAL;
 	case irq_pin_access_gpio:
+	case irq_pin_access_acpi_gpio:
 		return gpiod_direction_input(ts->gpiod_int);
 	}
=20
@@ -599,6 +609,87 @@ static int goodix_reset(struct goodix_ts_data *ts)
 	return 0;
 }
=20
+#if defined CONFIG_X86 && defined CONFIG_ACPI
+static const struct acpi_gpio_params first_gpio =3D { 0, 0, false };
+static const struct acpi_gpio_params second_gpio =3D { 1, 0, false };
+
+static const struct acpi_gpio_mapping acpi_goodix_int_first_gpios[] =3D =
{
+	{ GOODIX_GPIO_INT_NAME "-gpios", &first_gpio, 1 },
+	{ GOODIX_GPIO_RST_NAME "-gpios", &second_gpio, 1 },
+	{ },
+};
+
+static const struct acpi_gpio_mapping acpi_goodix_int_last_gpios[] =3D {
+	{ GOODIX_GPIO_RST_NAME "-gpios", &first_gpio, 1 },
+	{ GOODIX_GPIO_INT_NAME "-gpios", &second_gpio, 1 },
+	{ },
+};
+
+static int goodix_resource(struct acpi_resource *ares, void *data)
+{
+	struct goodix_ts_data *ts =3D data;
+	struct device *dev =3D &ts->client->dev;
+	struct acpi_resource_gpio *gpio;
+
+	switch (ares->type) {
+	case ACPI_RESOURCE_TYPE_GPIO:
+		gpio =3D &ares->data.gpio;
+		if (gpio->connection_type =3D=3D ACPI_RESOURCE_GPIO_TYPE_INT) {
+			if (ts->gpio_int_idx =3D=3D -1) {
+				ts->gpio_int_idx =3D ts->gpio_count;
+			} else {
+				dev_err(dev, "More then one GpioInt resource, ignoring ACPI GPIO res=
ources\n");
+				ts->gpio_int_idx =3D -2;
+			}
+		}
+		ts->gpio_count++;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
+{
+	const struct acpi_gpio_mapping *gpio_mapping =3D NULL;
+	struct device *dev =3D &ts->client->dev;
+	LIST_HEAD(resources);
+	int ret;
+
+	ts->gpio_count =3D 0;
+	ts->gpio_int_idx =3D -1;
+	ret =3D acpi_dev_get_resources(ACPI_COMPANION(dev), &resources,
+				     goodix_resource, ts);
+	if (ret < 0) {
+		dev_err(dev, "Error getting ACPI resources: %d\n", ret);
+		return ret;
+	}
+
+	acpi_dev_free_resource_list(&resources);
+
+	if (ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D 0) {
+		ts->irq_pin_access_method =3D irq_pin_access_acpi_gpio;
+		gpio_mapping =3D acpi_goodix_int_first_gpios;
+	} else if (ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D 1) {
+		ts->irq_pin_access_method =3D irq_pin_access_acpi_gpio;
+		gpio_mapping =3D acpi_goodix_int_last_gpios;
+	} else {
+		dev_warn(dev, "Unexpected ACPI resources: gpio_count %d, gpio_int_idx =
%d\n",
+			 ts->gpio_count, ts->gpio_int_idx);
+		return -EINVAL;
+	}
+
+	return devm_acpi_dev_add_driver_gpios(dev, gpio_mapping);
+}
+#else
+static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
+{
+	return -EINVAL;
+}
+#endif /* CONFIG_X86 && CONFIG_ACPI */
+
 /**
  * goodix_get_gpio_config - Get GPIO config from ACPI/DT
  *
@@ -609,6 +700,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 	int error;
 	struct device *dev;
 	struct gpio_desc *gpiod;
+	bool added_acpi_mappings =3D false;
=20
 	if (!ts->client)
 		return -EINVAL;
@@ -632,6 +724,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 		return error;
 	}
=20
+retry_get_irq_gpio:
 	/* Get the interrupt GPIO pin number */
 	gpiod =3D devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
 	if (IS_ERR(gpiod)) {
@@ -641,6 +734,11 @@ static int goodix_get_gpio_config(struct goodix_ts_d=
ata *ts)
 				GOODIX_GPIO_INT_NAME, error);
 		return error;
 	}
+	if (!gpiod && has_acpi_companion(dev) && !added_acpi_mappings) {
+		added_acpi_mappings =3D true;
+		if (goodix_add_acpi_gpio_mappings(ts) =3D=3D 0)
+			goto retry_get_irq_gpio;
+	}
=20
 	ts->gpiod_int =3D gpiod;
=20
@@ -656,10 +754,17 @@ static int goodix_get_gpio_config(struct goodix_ts_=
data *ts)
=20
 	ts->gpiod_rst =3D gpiod;
=20
-	if (ts->gpiod_int && ts->gpiod_rst) {
-		ts->reset_controller_at_probe =3D true;
-		ts->load_cfg_from_disk =3D true;
-		ts->irq_pin_access_method =3D irq_pin_access_gpio;
+	switch (ts->irq_pin_access_method) {
+	case irq_pin_access_acpi_gpio:
+		if (!ts->gpiod_int || !ts->gpiod_rst)
+			ts->irq_pin_access_method =3D irq_pin_access_none;
+		break;
+	default:
+		if (ts->gpiod_int && ts->gpiod_rst) {
+			ts->reset_controller_at_probe =3D true;
+			ts->load_cfg_from_disk =3D true;
+			ts->irq_pin_access_method =3D irq_pin_access_gpio;
+		}
 	}
=20
 	return 0;
--=20
2.25.0

