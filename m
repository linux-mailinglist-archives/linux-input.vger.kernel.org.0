Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4089217CE0C
	for <lists+linux-input@lfdr.de>; Sat,  7 Mar 2020 13:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgCGMPT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 07:15:19 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31256 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726271AbgCGMPS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Mar 2020 07:15:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583583317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lhcq6LRizjEua8gQSbb+w6xt3NkGmx1pnL3KYQZlPng=;
        b=M1dK+bO6dBwchfwYpQP5mJrMS2MyEpKKPCbJRGp2dL9f3s73MTl5BUn4pVGN7YuTTx60mL
        65P0oHlAb8XdmJ3FJlZuTzNIbmGLXBVtLRHYwE6YaA83PvIrgpUrRODq2JVUilg8w3FDOm
        N2EZx8E8EJgO0JTFNbYLjALbjVlz4ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-LyU5iIhKOrKshuNEwGLXQw-1; Sat, 07 Mar 2020 07:15:15 -0500
X-MC-Unique: LyU5iIhKOrKshuNEwGLXQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5CDA9184C800;
        Sat,  7 Mar 2020 12:15:14 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-27.ams2.redhat.com [10.36.116.27])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 43D761BC6D;
        Sat,  7 Mar 2020 12:15:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Dmitry Mastykin <mastichi@gmail.com>
Subject: [PATCH v3 05/11] Input: goodix - Add support for getting IRQ + reset GPIOs on Bay Trail devices
Date:   Sat,  7 Mar 2020 13:14:59 +0100
Message-Id: <20200307121505.3707-5-hdegoede@redhat.com>
In-Reply-To: <20200307121505.3707-1-hdegoede@redhat.com>
References: <20200307121505.3707-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On most Bay Trail (x86, UEFI + ACPI) devices the ACPI tables do not have
a _DSD with a "daffd814-6eba-4d8c-8a91-bc9bbf4aa301" UUID, adding
"irq-gpios" and "reset-gpios" mappings, so we cannot get the GPIOS by nam=
e
without first manually adding mappings ourselves.

These devices contain 2 GpioIo resource in their _CRS table, on all 4 suc=
h
devices which I have access to, the order of the 2 GPIOs is reset, int.

Note that the GPIO to which the touchscreen controller irq pin is connect=
ed
is configured in direct-irq mode on these Bay Trail devices, the
pinctrl-baytrail.c driver still allows controlling the pin as a GPIO in
this case, but this is not necessarily the case on other X86 ACPI
platforms, nor do we have a guarantee that the GPIO order is the same
elsewhere, so we limit the use of a _CRS table with 2 GpioIo resources
to Bay Trail devices only.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1786317
BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=3D199207
Cc: Dmitry Mastykin <mastichi@gmail.com>
Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscre=
en/goodix.c
index 794617a57910..712ca0273cfc 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -610,6 +610,21 @@ static int goodix_reset(struct goodix_ts_data *ts)
 }
=20
 #if defined CONFIG_X86 && defined CONFIG_ACPI
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
+static const struct x86_cpu_id baytrail_cpu_ids[] =3D {
+	{ X86_VENDOR_INTEL, 6, INTEL_FAM6_ATOM_SILVERMONT, X86_FEATURE_ANY, },
+	{}
+};
+
+static inline bool is_byt(void)
+{
+	const struct x86_cpu_id *id =3D x86_match_cpu(baytrail_cpu_ids);
+
+	return !!id;
+}
+
 static const struct acpi_gpio_params first_gpio =3D { 0, 0, false };
 static const struct acpi_gpio_params second_gpio =3D { 1, 0, false };
=20
@@ -682,6 +697,10 @@ static int goodix_add_acpi_gpio_mappings(struct good=
ix_ts_data *ts)
 	} else if (ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D 1) {
 		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_ACPI_GPIO;
 		gpio_mapping =3D acpi_goodix_int_last_gpios;
+	} else if (is_byt() && ts->gpio_count =3D=3D 2 && ts->gpio_int_idx =3D=3D=
 -1) {
+		dev_info(dev, "No ACPI GpioInt resource, assuming that the GPIO order =
is reset, int\n");
+		ts->irq_pin_access_method =3D IRQ_PIN_ACCESS_ACPI_GPIO;
+		gpio_mapping =3D acpi_goodix_int_last_gpios;
 	} else {
 		dev_warn(dev, "Unexpected ACPI resources: gpio_count %d, gpio_int_idx =
%d\n",
 			 ts->gpio_count, ts->gpio_int_idx);
--=20
2.25.1

