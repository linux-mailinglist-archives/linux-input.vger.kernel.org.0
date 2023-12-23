Return-Path: <linux-input+bounces-953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F6B81D491
	for <lists+linux-input@lfdr.de>; Sat, 23 Dec 2023 15:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 318681F21F8A
	for <lists+linux-input@lfdr.de>; Sat, 23 Dec 2023 14:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB25CDDD9;
	Sat, 23 Dec 2023 14:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bZjMzxup"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CB4DDB3
	for <linux-input@vger.kernel.org>; Sat, 23 Dec 2023 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703341754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHSyiTCOjteldeUh/y1HbzLpEQ++gpH1vlW7eMjsOUk=;
	b=bZjMzxupzOhzwo28al5Ef8zbLv9c6sePiw/M15EP4fhp1WEUdibVyxKG5XbC+vgAD7wWYI
	1eBdBM9CVqro2AIEPsBaes4YkuL4Oa1JG0+nw4UWBcELbOdFJIeEBUccrX1qpeAHNcThmm
	iprEOJIMrNjiJ1Oh3nWwW18iLz9naA0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-nNpcheYKPWKwRIzfEp6THQ-1; Sat, 23 Dec 2023 09:29:12 -0500
X-MC-Unique: nNpcheYKPWKwRIzfEp6THQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a26d7fd823fso22611166b.2
        for <linux-input@vger.kernel.org>; Sat, 23 Dec 2023 06:29:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703341751; x=1703946551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHSyiTCOjteldeUh/y1HbzLpEQ++gpH1vlW7eMjsOUk=;
        b=jQ97C6twqpZlJhTdaj4cfbYdb0Un7/Sf4NboQcw+CV/9MqDoz7Cqrr8TZYlZ0xB/V2
         hbsu4/hoqoGvfxjWioh+BAGABt2alecIkA73oG62PhxFnFCRqua52+9Nb3HbPRUkHIXx
         DPxPHoQYnP5STdp6QP8lx3artxWp5K7JHJolKpa2xGq04Frat9ijeDnEvyeIFBlqjiRQ
         4me/tq4WH0t+zuFJKYXxRdYDHddIyNw1F2MftqfjGqDbiAVxIAOUmjZTBfPk0cEkLPLu
         cqRv6NfuXQhQQSz7v/Ro5x1qisi7mNk+11UbHF/92plqW37ofJMPmHy+BDbBZgTXsBOn
         4B+A==
X-Gm-Message-State: AOJu0YxpfciCsUWd6uJMV1m6pYTKx9tAtlqgcmg2QeRU/zkrBujTTFXc
	CPE3CVEtkUExPo+frDIZrzb+fFrdY2iW5X7H1NuoM9bs5PJUmsexx7ahEo9QAWhxeIIXMzuavAV
	ftsUvOwEJ3tgGWEKsexmlaOHs1pmL9a0=
X-Received: by 2002:a17:906:74cb:b0:a1d:b924:1042 with SMTP id z11-20020a17090674cb00b00a1db9241042mr1292525ejl.13.1703341751434;
        Sat, 23 Dec 2023 06:29:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDQwVaTENm8wQXvQjKnxiw+vOr3c21BfU5jN1Ed7TJGLGTQ5+p7Pliv3JUzmmXwI7r8b3W+g==
X-Received: by 2002:a17:906:74cb:b0:a1d:b924:1042 with SMTP id z11-20020a17090674cb00b00a1db9241042mr1292520ejl.13.1703341750955;
        Sat, 23 Dec 2023 06:29:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g9-20020a1709063b0900b00a2366090bcfsm3117559ejf.212.2023.12.23.06.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Dec 2023 06:29:10 -0800 (PST)
Message-ID: <954f6537-15d5-42db-94b5-d148d4942870@redhat.com>
Date: Sat, 23 Dec 2023 15:29:09 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Content-Language: en-US, nl
To: Paul Cercueil <paul@crapouillou.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Hutterer <peter.hutterer@who-t.net>,
 Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
 svv@google.com, biswarupp@google.com, contact@artur-rojek.eu,
 Chris Morgan <macromorgan@hotmail.com>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
 <20231219235149.GA3401344@quokka>
 <f77b98bf015bf3f8716422ac70c4fd6051e66376.camel@crapouillou.net>
 <ZYJJC-ID4SyHhuuA@google.com>
 <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4e902e8ff60e21a74a87887e272f6751d3837c71.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On 12/20/23 14:39, Paul Cercueil wrote:
> Hi Dmitry,
> 
> Le mardi 19 décembre 2023 à 17:53 -0800, Dmitry Torokhov a écrit :
>> Hi Paul,
>>
>> On Wed, Dec 20, 2023 at 01:38:39AM +0100, Paul Cercueil wrote:
>>> Hi Peter,
>>>
>>> Le mercredi 20 décembre 2023 à 09:51 +1000, Peter Hutterer a
>>> écrit :
>>>> On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
>>>>> From: Chris Morgan <macromorgan@hotmail.com>
>>>>>
>>>>> Stop checking if the minimum abs value is greater than the
>>>>> maximum
>>>>> abs
>>>>> value. When the axis is inverted this condition is allowed.
>>>>> Without
>>>>> relaxing this check, it is not possible to use uinput on
>>>>> devices in
>>>>> userspace with an inverted axis, such as the adc-joystick found
>>>>> on
>>>>> many handheld gaming devices.
>>>>
>>>> As mentioned in the other thread [1] a fair bit of userspace
>>>> relies
>>>> on
>>>> that general assumption so removing it will likely cause all
>>>> sorts of
>>>> issues.
>>>
>>> There is some userspace that works with it though, so why restrict
>>> it
>>> artificially?
>>>
>>> The fact that some other userspace code wouldn't work with it
>>> sounds a
>>> bit irrelevant. They just never encountered that min>max usage
>>> before.
>>>
>>> And removing this check won't cause all sort of issues, why would
>>> it?
>>> It's not like the current software actively probes min>max and
>>> crash
>>> badly if it doesn't return -EINVAL...
>>
>> It will cause weird movements because calculations expect min be the
>> minimum, and max the maximum, and not encode left/right or up/down.
>> Putting this into adc joystick binding was a mistake.
> 
> I don't see why it was a mistake, it's only one of the ways to specify
> that the axis is inverted. This information is between the firmware
> (DT) and the kernel, that doesn't mean the information has to be
> relayed as-is to the userspace.
> 
> Unlike what you wrote in your other answer, when talking about input
> the kernel doesn't really normalize anything - it gives you the min/max
> values, and the raw samples, not normalized samples (they don't get
> translated to a pre-specified range, or even clamped).
> 
> I don't really like the idea of having the driver tamper with the
> samples, but if the specification really is that max>min, then it would
> be up to evdev/joydev (if the individual drivers are allowed min>max)
> or adc-joystick (if they are not) to process the samples.

I don't see why a driver, especially a userspace driver which
then injects things back into the kernel using uinput, would
not take care of inverting the samples itself and then just
present userspace with normalized data where min is simply 0
(as result of normalization as part of inversion) and
max is (original_max - original_min).

Note that this is exactly what is being done for touchscreens,
where having the touchscreen mounted e.g. upside-down is
a long standing issue and this is thus also a long solved issue,
see: drivers/input/touchscreen.c which contains generic
code for parsing device-properties including swapped / inverted
axis as well as generic code for reporting the position to the
input core, where the helpers from drivers/input/touchscreen.c
take care of the swap + invert including normalization when
doing inversion.

Specifically this contains in touchscreen_parse_properties() :

        prop->max_x = input_abs_get_max(input, axis_x);
        prop->max_y = input_abs_get_max(input, axis_y);

        if (prop->invert_x) {
                absinfo = &input->absinfo[axis_x];
                absinfo->maximum -= absinfo->minimum;
                absinfo->minimum = 0;
        }

        if (prop->invert_y) {
                absinfo = &input->absinfo[axis_y];
                absinfo->maximum -= absinfo->minimum;
                absinfo->minimum = 0;
        }

and then when reporting touches:

void touchscreen_report_pos(struct input_dev *input,
                            const struct touchscreen_properties *prop,
                            unsigned int x, unsigned int y,
                            bool multitouch)
{
        if (prop->invert_x)
                x = prop->max_x - x;

        if (prop->invert_y)
                y = prop->max_y - y;

        if (prop->swap_x_y)
                swap(x, y);

        input_report_abs(input, multitouch ? ABS_MT_POSITION_X : ABS_X, x);
        input_report_abs(input, multitouch ? ABS_MT_POSITION_Y : ABS_Y, y);
}

One of the tasks of a driver / the kernel is to provide some
level of hardware abstraction to isolate userspace from
hw details. IMHO taking care of the axis-inversion for userspace
with something like the above is part of the kernels' HAL task.

Regards,

Hans




