Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4080819A35A
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 03:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731508AbgDABpe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 21:45:34 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:55750 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731506AbgDABpe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 21:45:34 -0400
Received: by mail-pj1-f67.google.com with SMTP id fh8so1939048pjb.5
        for <linux-input@vger.kernel.org>; Tue, 31 Mar 2020 18:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2vd765OLgRTHg17hAuY/hAopvA72fbnGEVglM/x4Qlw=;
        b=GoAbl2HtDE343qV4aDqUN2Ia30tSNWcEwwHhRShHElRHZXHDeQH+p0N9nSYKNzGKuL
         dzlVPq9BSbgHRCE1YRHNA/RnCZeMv7abHU3UtdlJRCKKi5hq5YAMlQtE9TcDuPQt9qRu
         f6j6plfUGWJZahBhrTmJfG+4frPC5Nxwuw+DyuXVQhryhGTRt8Gw86t7erGlZg0E/ZR4
         XrZ8V1pQkke/pAekz31MrBef2NefL3l5JqDCSru4Q+hDKgGRhG9gFf5Xkci6lDDZHzHK
         r/QfKcEjLUB0KEJZIwB6w4Po6H6wB6cbMTiZITCo0hXZtacVx7O6pGblKmBTNVcrCyvf
         hhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2vd765OLgRTHg17hAuY/hAopvA72fbnGEVglM/x4Qlw=;
        b=s9ZpeiIexSNu8x2RyI1qpcQfgVVH0N+TZuVAae28VMwT8uwOMJoP/Dki3KW3DY7EAf
         X4DCSrz64hzUh4Ncg41G40KY2u0z2+SWI0QYekr61Wk+T/quGrdvK/zZYrYYlVF/f5f8
         D0vITLNuwKYXCddTS6b56+tUG7BhFhVdY2FdGDXdaPYXCvTVH4iFresGXcQgaUf040k9
         KUfUVRF2CY4EH5GICjMrEDRBfzb49ntVoemaOvJMYep2ewj1VUjcLPmvrdgKMu6ooD39
         nvuMnIFbWfNaF6qCkHKEBDQjvTB7xHXWwuRe1Lo5zCCst1f8MHo9nRj9xOMmhNgac0ju
         7u3g==
X-Gm-Message-State: ANhLgQ05himEj48ujGbwDuuULjKUyMMFAAPhsz1Rg1pTXHgR0oxD83Al
        gA/cBMB636JEruyARMe4qTw=
X-Google-Smtp-Source: ADFU+vszJTnWVh8EAE7RPTjIA+C2kGMbC7ZMyfTf+XnxmdomCm/hvpx+aQlBI3WDI+RHIuM2SJmpuA==
X-Received: by 2002:a17:902:b48b:: with SMTP id y11mr20159802plr.131.1585705531993;
        Tue, 31 Mar 2020 18:45:31 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id q6sm281100pja.34.2020.03.31.18.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 18:45:31 -0700 (PDT)
Date:   Tue, 31 Mar 2020 18:45:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2] Input: goodix - Fix compilation when ACPI support is
 disabled
Message-ID: <20200401014529.GL75430@dtor-ws>
References: <20200325150246.128463-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325150246.128463-1-hdegoede@redhat.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Wed, Mar 25, 2020 at 04:02:46PM +0100, Hans de Goede wrote:
> acpi_evaluate_object() and acpi_execute_simple_method() are not part of
> the group of ACPI related functions which get stubbed by
> include/linux/acpi.h when ACPI support is disabled, so the
> IRQ_PIN_ACCESS_ACPI_METHOD handling code must be disabled through
> an #ifdef when ACPI support is not enabled.
> 
> For consistency also #ifdef out the IRQ_PIN_ACCESS_ACPI_GPIO code
> and use the same #if condition as which is used to replace
> goodix_add_acpi_gpio_mappings with a stub.

I am not big fun of multiple #ifdefs sprinkled through the code, can we
do more straightforward stubs, like below?

Thanks!

-- 
Dmitry

Input: goodix - fix compilation when ACPI support is disabled

From: Hans de Goede <hdegoede@redhat.com>

acpi_evaluate_object() and acpi_execute_simple_method() are not part of
the group of ACPI related functions which get stubbed by
include/linux/acpi.h when ACPI support is disabled, so the
IRQ_PIN_ACCESS_ACPI_METHOD handling code must be stubbed out.

For consistency use the same #if condition as which is used to replace
goodix_add_acpi_gpio_mappings with a stub.

Fixes: c5fca485320e ("Input: goodix - add support for controlling the IRQ pin through ACPI methods")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
[dtor: stubbed out the ACPI method accessors]
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/goodix.c |   55 +++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 47f812b804c8..02c75ea385e0 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -63,6 +63,11 @@
 #define MAX_CONTACTS_LOC	5
 #define TRIGGER_LOC		6
 
+/* Our special handling for GPIO accesses through ACPI is x86 specific */
+#if defined CONFIG_X86 && defined CONFIG_ACPI
+#define ACPI_GPIO_SUPPORT
+#endif
+
 struct goodix_ts_data;
 
 enum goodix_irq_pin_access_method {
@@ -600,12 +605,42 @@ static int goodix_send_cfg(struct goodix_ts_data *ts, const u8 *cfg, int len)
 	return 0;
 }
 
-static int goodix_irq_direction_output(struct goodix_ts_data *ts,
-				       int value)
+#ifdef ACPI_GPIO_SUPPORT
+static int goodix_pin_acpi_direction_input(struct goodix_ts_data *ts)
 {
-	struct device *dev = &ts->client->dev;
+	acpi_handle handle = ACPI_HANDLE(&ts->client->dev);
 	acpi_status status;
 
+	status = acpi_evaluate_object(handle, "INTI", NULL, NULL);
+	return ACPI_SUCCESS(status) ? 0 : -EIO;
+}
+
+static int goodix_pin_acpi_output_method(struct goodix_ts_data *ts, int value)
+{
+	acpi_handle handle = ACPI_HANDLE(&ts->client->dev);
+	acpi_status status;
+
+	status = acpi_execute_simple_method(handle, "INTO", value);
+	return ACPI_SUCCESS(status) ? 0 : -EIO;
+}
+#else
+static int goodix_pin_acpi_direction_input(struct goodix_ts_data *ts)
+{
+	dev_err(&ts->client->dev,
+		"%s called on device without ACPI support\n", __func__);
+	return -EINVAL;
+}
+
+static int goodix_pin_acpi_output_method(struct goodix_ts_data *ts, int value)
+{
+	dev_err(&ts->client->dev,
+		"%s called on device without ACPI support\n", __func__);
+	return -EINVAL;
+}
+#endif
+
+static int goodix_irq_direction_output(struct goodix_ts_data *ts, int value)
+{
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
 		dev_err(&ts->client->dev,
@@ -621,9 +656,7 @@ static int goodix_irq_direction_output(struct goodix_ts_data *ts,
 		 */
 		return gpiod_direction_output_raw(ts->gpiod_int, value);
 	case IRQ_PIN_ACCESS_ACPI_METHOD:
-		status = acpi_execute_simple_method(ACPI_HANDLE(dev),
-						    "INTO", value);
-		return ACPI_SUCCESS(status) ? 0 : -EIO;
+		return goodix_pin_acpi_output_method(ts, value);
 	}
 
 	return -EINVAL; /* Never reached */
@@ -631,9 +664,6 @@ static int goodix_irq_direction_output(struct goodix_ts_data *ts,
 
 static int goodix_irq_direction_input(struct goodix_ts_data *ts)
 {
-	struct device *dev = &ts->client->dev;
-	acpi_status status;
-
 	switch (ts->irq_pin_access_method) {
 	case IRQ_PIN_ACCESS_NONE:
 		dev_err(&ts->client->dev,
@@ -641,12 +671,11 @@ static int goodix_irq_direction_input(struct goodix_ts_data *ts)
 			__func__);
 		return -EINVAL;
 	case IRQ_PIN_ACCESS_GPIO:
+		return gpiod_direction_input(ts->gpiod_int);
 	case IRQ_PIN_ACCESS_ACPI_GPIO:
 		return gpiod_direction_input(ts->gpiod_int);
 	case IRQ_PIN_ACCESS_ACPI_METHOD:
-		status = acpi_evaluate_object(ACPI_HANDLE(dev), "INTI",
-					      NULL, NULL);
-		return ACPI_SUCCESS(status) ? 0 : -EIO;
+		return goodix_pin_acpi_direction_input(ts);
 	}
 
 	return -EINVAL; /* Never reached */
@@ -710,7 +739,7 @@ static int goodix_reset(struct goodix_ts_data *ts)
 	return 0;
 }
 
-#if defined CONFIG_X86 && defined CONFIG_ACPI
+#ifdef ACPI_GPIO_SUPPORT
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 
