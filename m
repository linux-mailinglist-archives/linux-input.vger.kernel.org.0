Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7E7417B117
	for <lists+linux-input@lfdr.de>; Thu,  5 Mar 2020 23:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgCEWBn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Mar 2020 17:01:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40931 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726177AbgCEWBn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 5 Mar 2020 17:01:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583445701;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MGn3sS5Coc011eZD68ygqWoytHfSDgGTKJeqUj3CCa0=;
        b=bfWOspk5IOpNcj38gShjpmUOaExdOIg4ezFRjCF2LRuIxh3fwfaA5/zoT+3Ua+8mOdU/80
        7/qcvXaG5p+OGsTumcgZznkVi2IlPQfvaqt8t8bOBQ718M/WpV/KlN42sik/1YokfYSrG6
        3IbwhS/qRfa5iikVSCtDNK4gSU/auPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-FQ-MrzMgOiqOX5NYZopFhA-1; Thu, 05 Mar 2020 17:01:36 -0500
X-MC-Unique: FQ-MrzMgOiqOX5NYZopFhA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BCBA140D;
        Thu,  5 Mar 2020 22:01:35 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5A471272D3;
        Thu,  5 Mar 2020 22:01:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v2 01/11] Input: goodix - Refactor IRQ pin GPIO accesses
Date:   Thu,  5 Mar 2020 23:01:22 +0100
Message-Id: <20200305220132.228722-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Suspending Goodix touchscreens requires changing the interrupt pin to
output before sending them a power-down command. Followed by wiggling
the interrupt pin to wake the device up, after which it is put back
in input mode.

So far we have only effectively supported this on devices which use
devicetree. On X86 ACPI platforms both looking up the pins; and using a
pin as both IRQ and GPIO is a bit more complicated. E.g. on some devices
we cannot directly access the IRQ pin as GPIO and we need to call ACPI
methods to control it instead.

This commit adds a new irq_pin_access_method field to the goodix_chip_dat=
a
struct and adds goodix_irq_direction_output and goodix_irq_direction_inpu=
t
helpers which together abstract the GPIO accesses to the IRQ pin.

This is a preparation patch for adding support for properly suspending th=
e
touchscreen on X86 ACPI platforms.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Make enum member names upper-case
---
 drivers/input/touchscreen/goodix.c | 62 ++++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 0403102e807e..9cfbcf3cbca8 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -31,6 +31,11 @@
=20
 struct goodix_ts_data;
=20
+enum goodix_irq_pin_access_method {
+	IRQ_PIN_ACCESS_NONE,
+	IRQ_PIN_ACCESS_GPIO,
+};
+
 struct goodix_chip_data {
 	u16 config_addr;
 	int config_len;
@@ -53,6 +58,7 @@ struct goodix_ts_data {
 	const char *cfg_name;
 	struct completion firmware_loading_complete;
 	unsigned long irq_flags;
+	enum goodix_irq_pin_access_method irq_pin_access_method;
 	unsigned int contact_size;
 };
=20
@@ -502,17 +508,48 @@ static int goodix_send_cfg(struct goodix_ts_data *t=
s,
 	return 0;
 }
=20
+static int goodix_irq_direction_output(struct goodix_ts_data *ts,
+				       int value)
+{
+	switch (ts->irq_pin_access_method) {
+	case IRQ_PIN_ACCESS_NONE:
+		dev_err(&ts->client->dev,
+			"%s called without an irq_pin_access_method set\n",
+			__func__);
+		return -EINVAL;
+	case IRQ_PIN_ACCESS_GPIO:
+		return gpiod_direction_output(ts->gpiod_int, value);
+	}
+
+	return -EINVAL; /* Never reached */
+}
+
+static int goodix_irq_direction_input(struct goodix_ts_data *ts)
+{
+	switch (ts->irq_pin_access_method) {
+	case IRQ_PIN_ACCESS_NONE:
+		dev_err(&ts->client->dev,
+			"%s called without an irq_pin_access_method set\n",
+			__func__);
+		return -EINVAL;
+	case IRQ_PIN_ACCESS_GPIO:
+		return gpiod_direction_input(ts->gpiod_int);
+	}
+
+	return -EINVAL; /* Never reached */
+}
+
 static int goodix_int_sync(struct goodix_ts_data *ts)
 {
 	int error;
=20
-	error =3D gpiod_direction_output(ts->gpiod_int, 0);
+	error =3D goodix_irq_direction_output(ts, 0);
 	if (error)
 		return error;
=20
 	msleep(50);				/* T5: 50ms */
=20
-	error =3D gpiod_direction_input(ts->gpiod_int);
+	error =3D goodix_irq_direction_input(ts);
 	if (error)
 		return error;
=20
@@ -536,7 +573,7 @@ static int goodix_reset(struct goodix_ts_data *ts)
 	msleep(20);				/* T2: > 10ms */
=20
 	/* HIGH: 0x28/0x29, LOW: 0xBA/0xBB */
-	error =3D gpiod_direction_output(ts->gpiod_int, ts->client->addr =3D=3D=
 0x14);
+	error =3D goodix_irq_direction_output(ts, ts->client->addr =3D=3D 0x14)=
;
 	if (error)
 		return error;
=20
@@ -617,6 +654,9 @@ static int goodix_get_gpio_config(struct goodix_ts_da=
ta *ts)
=20
 	ts->gpiod_rst =3D gpiod;
=20
+	if (ts->gpiod_int && ts->gpiod_rst)
+		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_GPIO;
+
 	return 0;
 }
=20
@@ -889,7 +929,7 @@ static int goodix_ts_probe(struct i2c_client *client,
 	if (error)
 		return error;
=20
-	if (ts->gpiod_int && ts->gpiod_rst) {
+	if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_GPIO) {
 		/* reset the controller */
 		error =3D goodix_reset(ts);
 		if (error) {
@@ -912,7 +952,7 @@ static int goodix_ts_probe(struct i2c_client *client,
=20
 	ts->chip =3D goodix_get_chip_data(ts->id);
=20
-	if (ts->gpiod_int && ts->gpiod_rst) {
+	if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_GPIO) {
 		/* update device config */
 		ts->cfg_name =3D devm_kasprintf(&client->dev, GFP_KERNEL,
 					      "goodix_%d_cfg.bin", ts->id);
@@ -943,7 +983,7 @@ static int goodix_ts_remove(struct i2c_client *client=
)
 {
 	struct goodix_ts_data *ts =3D i2c_get_clientdata(client);
=20
-	if (ts->gpiod_int && ts->gpiod_rst)
+	if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_GPIO)
 		wait_for_completion(&ts->firmware_loading_complete);
=20
 	return 0;
@@ -956,7 +996,7 @@ static int __maybe_unused goodix_suspend(struct devic=
e *dev)
 	int error;
=20
 	/* We need gpio pins to suspend/resume */
-	if (!ts->gpiod_int || !ts->gpiod_rst) {
+	if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_NONE) {
 		disable_irq(client->irq);
 		return 0;
 	}
@@ -967,7 +1007,7 @@ static int __maybe_unused goodix_suspend(struct devi=
ce *dev)
 	goodix_free_irq(ts);
=20
 	/* Output LOW on the INT pin for 5 ms */
-	error =3D gpiod_direction_output(ts->gpiod_int, 0);
+	error =3D goodix_irq_direction_output(ts, 0);
 	if (error) {
 		goodix_request_irq(ts);
 		return error;
@@ -979,7 +1019,7 @@ static int __maybe_unused goodix_suspend(struct devi=
ce *dev)
 				    GOODIX_CMD_SCREEN_OFF);
 	if (error) {
 		dev_err(&ts->client->dev, "Screen off command failed\n");
-		gpiod_direction_input(ts->gpiod_int);
+		goodix_irq_direction_input(ts);
 		goodix_request_irq(ts);
 		return -EAGAIN;
 	}
@@ -999,7 +1039,7 @@ static int __maybe_unused goodix_resume(struct devic=
e *dev)
 	struct goodix_ts_data *ts =3D i2c_get_clientdata(client);
 	int error;
=20
-	if (!ts->gpiod_int || !ts->gpiod_rst) {
+	if (ts->irq_pin_access_method =3D=3D IRQ_PIN_ACCESS_NONE) {
 		enable_irq(client->irq);
 		return 0;
 	}
@@ -1008,7 +1048,7 @@ static int __maybe_unused goodix_resume(struct devi=
ce *dev)
 	 * Exit sleep mode by outputting HIGH level to INT pin
 	 * for 2ms~5ms.
 	 */
-	error =3D gpiod_direction_output(ts->gpiod_int, 1);
+	error =3D goodix_irq_direction_output(ts, 1);
 	if (error)
 		return error;
=20
--=20
2.25.1

