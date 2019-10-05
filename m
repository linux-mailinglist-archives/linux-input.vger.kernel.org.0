Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 266D9CC978
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 12:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727612AbfJEKzz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 06:55:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43592 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727597AbfJEKzz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Oct 2019 06:55:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7B93F89810C;
        Sat,  5 Oct 2019 10:55:54 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1C7A55D9DC;
        Sat,  5 Oct 2019 10:55:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 5.4 regression fix] Input: soc_button_array - partial revert of support for newer surface devices
Date:   Sat,  5 Oct 2019 12:55:51 +0200
Message-Id: <20191005105551.353273-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Sat, 05 Oct 2019 10:55:54 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit c394159310d0 ("Input: soc_button_array - add support for newer
surface devices") not only added support for the MSHW0040 ACPI HID,
but for some reason it also makes changes to the error handling of the
soc_button_lookup_gpio() call in soc_button_device_create(). Note ideally
this seamingly unrelated change would have been made in a separate commit,
with a message explaining the what and why of this change.

I guess this change may have been added to deal with -EPROBE_DEFER errors,
but in case of the existing support for PNP0C40 devices, treating
-EPROBE_DEFER as any other error is deliberate, see the comment this
commit adds for why.

The actual returning of -EPROBE_DEFER to the caller of soc_button_probe()
introduced by the new error checking causes a serious regression:

On devices with so called virtual GPIOs soc_button_lookup_gpio() will
always return -EPROBE_DEFER for these fake GPIOs, when this happens
during the second call of soc_button_device_create() we already have
successfully registered our first child. This causes the kernel to think
we are making progress with probing things even though we unregister the
child before again before we return the -EPROBE_DEFER. Since we are making
progress the kernel will retry deferred-probes again immediately ending
up stuck in a loop with the following showing in dmesg:

[  124.022697] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6537
[  124.040764] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6538
[  124.056967] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6539
[  124.072143] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6540
[  124.092373] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6541
[  124.108065] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6542
[  124.128483] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6543
[  124.147141] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6544
[  124.165070] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6545
[  124.179775] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6546
[  124.202726] input: gpio-keys as /devices/platform/INTCFD9:00/gpio-keys.0.auto/input/input6547
<continues on and on and on>

And 1 CPU core being stuck at 100% and udev hanging since it is waiting
for the modprobe of soc_button_array to return.

This patch reverts the soc_button_lookup_gpio() error handling changes,
fixing this regression.

Fixes: c394159310d0 ("Input: soc_button_array - add support for newer surface devices")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205031
Cc: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/misc/soc_button_array.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 97e3639e99d0..97761421d6dd 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -92,11 +92,18 @@ soc_button_device_create(struct platform_device *pdev,
 			continue;
 
 		gpio = soc_button_lookup_gpio(&pdev->dev, info->acpi_index);
-		if (gpio < 0 && gpio != -ENOENT) {
-			error = gpio;
-			goto err_free_mem;
-		} else if (!gpio_is_valid(gpio)) {
-			/* Skip GPIO if not present */
+		if (!gpio_is_valid(gpio)) {
+			/*
+			 * Skip GPIO if not present. Note we deliberately
+			 * ignore -EPROBE_DEFER errors here. On some devices
+			 * Intel is using so called virtual GPIOs which are not
+			 * GPIOs at all but some way for AML code to check some
+			 * random status bits without need a custom opregion.
+			 * In some cases the resources table we parse points to
+			 * such a virtual GPIO, since these are not real GPIOs
+			 * we do not have a driver for these so they will never
+			 * show up, therefor we ignore -EPROBE_DEFER.
+			 */
 			continue;
 		}
 
-- 
2.23.0

