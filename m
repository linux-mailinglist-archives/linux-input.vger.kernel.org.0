Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98C3B19A867
	for <lists+linux-input@lfdr.de>; Wed,  1 Apr 2020 11:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731749AbgDAJOp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Apr 2020 05:14:45 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36291 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732144AbgDAJOp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Apr 2020 05:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585732483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ugq2TewUyGkRW2qdlfdUeSEMakmbDn/jzzPpfeVRSog=;
        b=FaHXFjwmGkUCyNJxwg8DiqIuVw0i0oSLWfF0NInr+KGTAQKce5qvj35o7U9NLyCFneONVX
        bt+tp3krmEP5vvM3YxHIkb4IsJ0x3CpYuhDqgoQ3uAR5n5sfrBNlsnAJTFG90zLQ2fCBQ9
        fSWurGvrjk4U0sYf+j2Q5h2tgSvNyGw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-kuGbK3ZVPCalxwp1vuw_9w-1; Wed, 01 Apr 2020 05:14:39 -0400
X-MC-Unique: kuGbK3ZVPCalxwp1vuw_9w-1
Received: by mail-wm1-f69.google.com with SMTP id s15so1567537wmc.0
        for <linux-input@vger.kernel.org>; Wed, 01 Apr 2020 02:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ugq2TewUyGkRW2qdlfdUeSEMakmbDn/jzzPpfeVRSog=;
        b=LtJoxZFke/OX8Mmb0ImehgAmTDOJSlHldIo2WZK+JzLLzYYAq3Tbm3rIIUf6Ji3sXM
         z+mmPVjZV5gQpz79rig8HNhys9E20zpMdik4o29mkThtDgBlfQLvndg1/zxBks+0rnf7
         mwAv9B2ZitlsywyCBI/khuczNISDHT45exzZ0C6nFmoIyZaVSHQJj3PcL3HMGxoIotVi
         7L2oxHPLbmGbioN4kact8rNA39/H6AvNIsvr5x6HTkAfv77hfPrKdu5P600djDwbE2wf
         +F4b2X553h4Za1NqLbdZK8F8iYlyYuSvIZ0RvxmD/U2OfvGcFhgUnHYTPdi3YqdfKQXs
         8y+g==
X-Gm-Message-State: ANhLgQ1Wo9hmDCAXv582DLe9UHX8MwKJgVLXC+y5sTTekbC+HmN4WvGZ
        2kIyVk5FhfxuM/piqZ/dlTrkYzAva5gcKIWjphFtrGkC0d0Ih0seOm7MlUDFJed68cOXzeft2V5
        NW1DC0QyewezYBTG30SPAx6I=
X-Received: by 2002:a05:6000:11c2:: with SMTP id i2mr26612189wrx.210.1585732478445;
        Wed, 01 Apr 2020 02:14:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vttUPVcDqVfcFbjMs5QHV4hISzCY3RRlcAnCeSjbJ4j/YhSCWGueVI3UVnRNs8/js1FlskuWg==
X-Received: by 2002:a05:6000:11c2:: with SMTP id i2mr26612173wrx.210.1585732478218;
        Wed, 01 Apr 2020 02:14:38 -0700 (PDT)
Received: from x1-7.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id b82sm959681wme.25.2020.04.01.02.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2020 02:14:37 -0700 (PDT)
Subject: Re: [PATCH v2] Input: goodix - Fix compilation when ACPI support is
 disabled
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        kbuild test robot <lkp@intel.com>
References: <20200325150246.128463-1-hdegoede@redhat.com>
 <20200401014529.GL75430@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <939fa592-599c-35cf-908e-d0b29639c992@redhat.com>
Date:   Wed, 1 Apr 2020 11:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401014529.GL75430@dtor-ws>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/1/20 3:45 AM, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Wed, Mar 25, 2020 at 04:02:46PM +0100, Hans de Goede wrote:
>> acpi_evaluate_object() and acpi_execute_simple_method() are not part of
>> the group of ACPI related functions which get stubbed by
>> include/linux/acpi.h when ACPI support is disabled, so the
>> IRQ_PIN_ACCESS_ACPI_METHOD handling code must be disabled through
>> an #ifdef when ACPI support is not enabled.
>>
>> For consistency also #ifdef out the IRQ_PIN_ACCESS_ACPI_GPIO code
>> and use the same #if condition as which is used to replace
>> goodix_add_acpi_gpio_mappings with a stub.
> 
> I am not big fun of multiple #ifdefs sprinkled through the code, can we
> do more straightforward stubs, like below?

The solution you suggested is fine with me.

Regards,

Hans


p.s.

For reference here is Dmitry's solution once again, manually copied
because my email client cut it of as being part of the signature:


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


