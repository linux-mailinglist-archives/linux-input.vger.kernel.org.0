Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5BB417CE0E
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCGMPU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:20 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55859 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726269AbgCGMPT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cnKcbPphidtkGabSjX8PIDIAcAA8gL63iT1b05D7Ej0=;
        b=EHgOdFrbxxaFG3fX1CGo/8vqwpnrk922R+P99HWHUHLu72oSyztvu1D/Co9VE+CxbO5m3J
        zdcW9ckUQdjR7gR70o5o+llBAIZiCtCi9FEq2jahXExmLuGihKeDU+0Wb5BmgnSmFKnPqD
        RIpXob9ZRHf3dKPUOzyYHcGhC8wNJnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-36hDPot7MqSKGsUoOqJkPw-1; Sat, 07 Mar 2020 07:15:14 -0500
X-MC-Unique: 36hDPot7MqSKGsUoOqJkPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F284B13EA;
        Sat,  7 Mar 2020 12:15:12 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D5E6A1BC6D;
        Sat,  7 Mar 2020 12:15:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v3 04/11] Input: goodix - Add support for getting IRQ + reset GPIOs on Cherry Trail devices
Date:   Sat,  7 Mar 2020 13:14:58 +0100
Message-Id: <20200307121505.3707-4-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
:

Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
{
    Name (RBUF, ResourceTemplate ()
    {
        I2cSerialBusV2 (0x0014, ControllerInitiated, 0x00061A80,
            AddressingMode7Bit, "\\_SB.PCI0.I2C2",
            0x00, ResourceConsumer, , Exclusive,
            )
        GpioInt (Edge, ActiveLow, Shared, PullDefault, 0x0000,
            "\\_SB.GPO1", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0013
            }
        GpioIo (Shared, PullDefault, 0x0000, 0x0000,
            IoRestrictionOutputOnly,
            "\\_SB.GPO1", 0x00, ResourceConsumer, ,
            )
            {   // Pin list
                0x0019
            }
    })
    Return (RBUF) /* \_SB_.PCI0.I2C2.TCS1._CRS.RBUF */
}

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
Changes in v2:
- Add example _CRS method to commit message
- Add some extra comments to clarify the code
---
 drivers/input/touchscreen/goodix.c | 128 ++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 43c61f7c6f1e..794617a57910 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -34,6 +34,7 @@ struct goodix_ts_data;
 enum goodix_irq_pin_access_method {
 	IRQ_PIN_ACCESS_NONE,
 	IRQ_PIN_ACCESS_GPIO,
+	IRQ_PIN_ACCESS_ACPI_GPIO,
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
 	case IRQ_PIN_ACCESS_GPIO:
 		return gpiod_direction_output(ts->gpiod_int, value);
+	case IRQ_PIN_ACCESS_ACPI_GPIO:
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
 	case IRQ_PIN_ACCESS_GPIO:
+	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		return gpiod_direction_input(ts->gpiod_int);
 	}
=20
@@ -599,6 +609,94 @@ static int goodix_reset(struct goodix_ts_data *ts)
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
+/*
+ * This function gets called in case we fail to get the irq GPIO directl=
y
+ * because the ACPI tables lack GPIO-name to APCI _CRS index mappings
+ * (no _DSD UUID daffd814-6eba-4d8c-8a91-bc9bbf4aa301 data).
+ * In that case we add our own mapping and then goodix_get_gpio_config()
+ * retries to get the GPIOs based on the added mapping.
+ */
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
+		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_ACPI_GPIO;
+		gpio_mapping =3D acpi_goodix_int_first_gpios;
+	} else if (ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D 1) {
+		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_ACPI_GPIO;
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
@@ -609,6 +707,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 	int error;
 	struct device *dev;
 	struct gpio_desc *gpiod;
+	bool added_acpi_mappings =3D false;
=20
 	if (!ts->client)
 		return -EINVAL;
@@ -632,6 +731,7 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
 		return error;
 	}
=20
+retry_get_irq_gpio:
 	/* Get the interrupt GPIO pin number */
 	gpiod =3D devm_gpiod_get_optional(dev, GOODIX_GPIO_INT_NAME, GPIOD_IN);
 	if (IS_ERR(gpiod)) {
@@ -641,6 +741,11 @@ static int goodix_get_gpio_config(struct goodix_ts_d=
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
@@ -656,10 +761,25 @@ static int goodix_get_gpio_config(struct goodix_ts_=
data *ts)
=20
 	ts->gpiod_rst =3D gpiod;
=20
-	if (ts->gpiod_int && ts->gpiod_rst) {
-		ts->reset_controller_at_probe =3D true;
-		ts->load_cfg_from_disk =3D true;
-		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_GPIO;
+	switch (ts->irq_pin_access_method) {
+	case IRQ_PIN_ACCESS_ACPI_GPIO:
+		/*
+		 * We end up here if goodix_add_acpi_gpio_mappings() has
+		 * called devm_acpi_dev_add_driver_gpios() because the ACPI
+		 * tables did not contain name to index mappings.
+		 * Check that we successfully got both GPIOs after we've
+		 * added our own acpi_gpio_mapping and if we did not get both
+		 * GPIOs reset irq_pin_access_method to IRQ_PIN_ACCESS_NONE.
+		 */
+		if (!ts->gpiod_int || !ts->gpiod_rst)
+			ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_NONE;
+		break;
+	default:
+		if (ts->gpiod_int && ts->gpiod_rst) {
+			ts->reset_controller_at_probe =3D true;
+			ts->load_cfg_from_disk =3D true;
+			ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_GPIO;
+		}
 	}
=20
 	return 0;
--=20
2.25.1

