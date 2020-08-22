Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F89824E6F8
	for <lists+linux-input@lfdr.de>; Sat, 22 Aug 2020 12:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbgHVKwK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Aug 2020 06:52:10 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27181 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726222AbgHVKwH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Aug 2020 06:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598093524;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+SEG/nulwT6tfpZWDppSVAvKYND4GxX6OsIBaI8DJPU=;
        b=bwYRFLKB1e+3i3X0J2BWm1X41I2qB0vkX/JqSdX8yzURCfuXZOriEeLJ2lYMCikh3d9bIH
        /u0SBS2Cpayyk5xxItf62ZZrVbIpMYVwO5nYVpYD8PdntimgUPlcvEe4JDjM0xUNul6yDI
        a9AJMWNALc1MbGD+DnQkmcgbvmAwhvA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-sNSmZF2CPDS6lwYVQyJRSQ-1; Sat, 22 Aug 2020 06:52:03 -0400
X-MC-Unique: sNSmZF2CPDS6lwYVQyJRSQ-1
Received: by mail-ed1-f72.google.com with SMTP id d19so1559468eds.4
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 03:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+SEG/nulwT6tfpZWDppSVAvKYND4GxX6OsIBaI8DJPU=;
        b=h/DZMOvAkcMD4kswhPUc6vkFTRBH+P6Dmq2edzPDaBDDBrCuIkOjpDSsVcwmtJ6sDf
         hJUrik/1n1Cp90a97W7j7dItmU6gu+dHSR6QWn20QjMXHoxQmRFZiNmJyRYNQ/uvmWdT
         LWUsQ6DmLHEfFG+8PHmQfxxsYMAyYRyHWcBLfTMx+nGyAHWgC6/5rB31B9FoBDdrPLnc
         mENVEOGEeDowkjX5Of/AALQCXv0P9Fq7WNY1rZXBPD2LM5cdTzUn7OKGv27pWuT9GvZ7
         rD/eKt2zl8NmvA0M8YNF8tIIaNYngkaUFJHg10h3KwsmyDFK2XVheNA/pO0VqSAaOId1
         Ci8Q==
X-Gm-Message-State: AOAM532Ry7/Q3DX7w0AwXWCQDaj6ZicYtEDzbavebfnnOqR/25ldjhzy
        tP98aL6fYhu5qONgLhJzQHPDidgn25+VMguyWcbMuSN9bPSWPRoRCWOKfu34NherOMuNAKKLizw
        yG1q3Jl+gclRO+OpqA+EqEik=
X-Received: by 2002:a17:906:3ac4:: with SMTP id z4mr6485477ejd.65.1598093521686;
        Sat, 22 Aug 2020 03:52:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVMoKl7WHwrsY4Xy+YSzBoqJ79v6cjutqV3wiSqUpSMcjRH05MwAeosLbY+6k7NBgRsUybZw==
X-Received: by 2002:a17:906:3ac4:: with SMTP id z4mr6485463ejd.65.1598093521454;
        Sat, 22 Aug 2020 03:52:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id g11sm2776212edt.88.2020.08.22.03.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Aug 2020 03:52:00 -0700 (PDT)
Subject: Re: Goodix: Obviously wrong reset logic
To:     Marco Felsch <m.felsch@pengutronix.de>, octavian.purdila@intel.com,
        irina.tirdea@intel.com, hadess@hadess.net, mamlinav@gmail.com,
        dmitry.torokhov@gmail.com, yannick.fertre@st.com
Cc:     kernel@pengutronix.de, linux-input@vger.kernel.org
References: <20200819094350.h7sz7uvgnp6btxxj@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <57d15b78-5638-9f37-d3d8-533fad5ccb83@redhat.com>
Date:   Sat, 22 Aug 2020 12:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819094350.h7sz7uvgnp6btxxj@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 8/19/20 11:43 AM, Marco Felsch wrote:
> Hi all,
> 
> since linux v4.5 the goodix touch driver support the reset by commit
> ec6e1b4082d9 ("Input: goodix - reset device at init"). I was a bit
> confused while I read the goodix_reset() function:
> 8<----------------------------------------------------------------------
> static int goodix_reset(struct goodix_ts_data *ts)
> {
> 	int error;
> 
> 	/* begin select I2C slave addr */
> 	error = gpiod_direction_output(ts->gpiod_rst, 0);
> 	if (error)
> 		return error;
> 
> 	msleep(20);				/* T2: > 10ms */
> 
> 	/* HIGH: 0x28/0x29, LOW: 0xBA/0xBB */
> 	error = goodix_irq_direction_output(ts, ts->client->addr == 0x14);
> 	(error)
> 		return error;
> 
> 	usleep_range(100, 2000);		/* T3: > 100us */
> 
> 	error = gpiod_direction_output(ts->gpiod_rst, 1);
> 	if (error)
> 		return error;
> 	
> 	...
> }
> 8<----------------------------------------------------------------------
> because the gpiod_direction_output() takes the logical level and and not
> the physical level. Also it is not intuitive to read. Releasing the reset
> line first and set it after?
> 
> As pointed out by the commit message, the reset logic is based on the
> datasheet GT911 [1] and GT9271[2]. Those datasheets says that the reset
> pin is active low. Setting this in my DT-based board will break
> everything. I checked the DT's already using a goodix device and all of
> them are specifying the pin as active-high. IMHO this is wrong.
> 
> Now the question is: Does the ACPI tables specify it as active high too
> and was this the reason to miss-use the gpiod_ API? If this is the case
> fixing the driver would break everything and in that case we should at
> least mention it within the driver and within the DT-Bindings.

Until recently the goodix code did not use the GPIOs in the ACPI case at
all.

I've recently fixed this and now there is a helper for setting the
direction + output value of the GPIO. This is done though a helper
since on some ACPI platforms the IRQ is modeled as a "direct" IRQ not a
GpioInt, with ACPI methods for setting the direction + value.

This new helper looks like this:

static int goodix_irq_direction_output(struct goodix_ts_data *ts, int value)
{
         switch (ts->irq_pin_access_method) {
         case IRQ_PIN_ACCESS_NONE:
                 dev_err(&ts->client->dev,
                         "%s called without an irq_pin_access_method set\n",
                         __func__);
                 return -EINVAL;
         case IRQ_PIN_ACCESS_GPIO:
                 return gpiod_direction_output(ts->gpiod_int, value);
         case IRQ_PIN_ACCESS_ACPI_GPIO:
                 /*
                  * The IRQ pin triggers on a falling edge, so its gets marked
                  * as active-low, use output_raw to avoid the value inversion.
                  */
                 return gpiod_direction_output_raw(ts->gpiod_int, value);
         case IRQ_PIN_ACCESS_ACPI_METHOD:
                 return goodix_pin_acpi_output_method(ts, value);
         }

         return -EINVAL; /* Never reached */
}

Note how in the ACPI case gpiod_direction_output_raw is used to avoid the
problem you mention. The ACPI table correctly marks the GpioInt (in case
where a GpioInt resource is used) as active low, so I made
goodix_irq_direction_output() use gpiod_direction_output_raw() when the GPIOs
come from ACPI to avoid the exact problem you describe.

If all current DTS users wrongly specify the pin as active-high, as the code
expects, then indeed if you mark it active-low then things will break.

The problem is you cannot just change this, as that will break existing
dts/dtb files some of which may not be part of the kernel...

I guess one option would be to do the same thing as I'm doing in the
devicetree case, and use gpiod_direction_output_raw() ignoring the
active high/low specified in dt/acpi. I'm not sure if that is a good idea
but it is an option.

FWIW I very carefully modeled my patch-series for adding support for the
GPIOs under ACPI to not make any functional changes to the DT case to
avoid regressions. It might be best for you to also play it safe here
and just make the pin active-high in the dts file, maybe with a comment
that that is wrong but it is what the driver expects. Then you don't
run the risk of breaking other peoples working setups.

Regards,

Hans

