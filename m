Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1332E22281
	for <lists+linux-input@lfdr.de>; Sat, 18 May 2019 11:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfERJJC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 May 2019 05:09:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33404 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfERJJB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 May 2019 05:09:01 -0400
Received: by mail-lf1-f66.google.com with SMTP id x132so7006257lfd.0;
        Sat, 18 May 2019 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JMJMxJ4pxlUz8asklfXu2+f43mE5Z5/GW0LwxKJU/nI=;
        b=Ctp4zeKDTdrgBiXbI4X8Zcrd9YuEgiitY8MhoX5s6yaOPgi3ig821+yXq3T3EYw2Hv
         8rAnvJrac4pPcY1mZmlqCQ12K77lOlFTfuQJ5f6hfssXLukOlcGLhyY+WmzvcdGs3lOd
         qs1QudsMYyz3+0VdkKCCn8FUkJu5t5dlBgtd4CzgC5D+C0V/aoFjFz6hWkWKhapSkEwY
         S3gtNWLfL6A/SHFn20zzJWhakp7mjc4vEJjBX1lpofL/aKXti4XyhsPstG9qaZ2hUHQ1
         BFguhbaSwauVckqL3Fv6eiM/V9e0PNXd2xIThaq8QEGkmB3R/Qfl+BAZMYIAM0l1Gr+L
         gnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JMJMxJ4pxlUz8asklfXu2+f43mE5Z5/GW0LwxKJU/nI=;
        b=I8pHsiHi8Zs+1R9n6x8Ba5OwiI4R9G040zwC+JNvNejLw2Lm5zrQEV8200mPtGmLI7
         GsVU9PyynyVIIg1DsbZwg0d/PP+8kBltQqaXxDJc0E9XY8BYYMyZ8bXhxTB9pN2Bmh3S
         tbrG8GbR2kl5gn/y5flDpfWGrorA6ipqY4F32Ap3ItFTaSmuZiM2yQwqLNtGamZmFP4w
         APceDaicNHyPiFXrqNybqnHkkKB5lCv7pCm+h1jo2h+73IsWzGCW7r0UZKhicAsEAbtP
         ahV4qIzTY0uAjMBjsxOvS9sBhDDq9aGAdGhb4AWuuEVY+JXYMLtI2SG+7qw56+56jGe0
         KIMw==
X-Gm-Message-State: APjAAAXeR+4Z1Ow3UQuql2/v8elH3RUReJAw/BnAgdp2orQaKr0zv2P5
        S/z+v4nNYI4vc84c4ppMbeBLig+a2aw=
X-Google-Smtp-Source: APXvYqy0r9DsbizCqrexPf9rUX12ja5WC7syNRm9Q4CKHVB7psLJiiPZPg+vaEdPhLPIeeqlAA81mw==
X-Received: by 2002:a05:6512:309:: with SMTP id t9mr29680176lfp.103.1558170539702;
        Sat, 18 May 2019 02:08:59 -0700 (PDT)
Received: from [192.168.1.111] ([77.123.15.14])
        by smtp.googlemail.com with ESMTPSA id f21sm2211511ljk.94.2019.05.18.02.08.58
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 18 May 2019 02:08:58 -0700 (PDT)
Subject: Re: [PATCH v3] HID: fix A4Tech horizontal scrolling
To:     =?UTF-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>
Cc:     peter.hutterer@who-t.net, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190507050029.GA5197@jelly>
 <20190512203313.18756-1-spaz16@wp.pl>
From:   Igor Kushnir <igorkuo@gmail.com>
Message-ID: <858498ef-b43a-f382-bfbc-e3a2ac9935e4@gmail.com>
Date:   Sat, 18 May 2019 12:08:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190512203313.18756-1-spaz16@wp.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: uk-UA
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

I have verified that the PATCH v3 applied to kernel 5.0.15 fixes 
horizontal scrolling for my A4Tech WOP-49Z mouse just as well as the 
previous patch did.

Thank you,
Igor

On 5/12/19 11:33 PM, Błażej Szczygieł wrote:
> Since recent high resolution scrolling changes the A4Tech driver must
> check for the "REL_WHEEL_HI_RES" usage code.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=203369
> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e ("HID: input: use the
> Resolution Multiplier for high-resolution scrolling")
> 
> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>
> ---
> Changes in v2:
> - changed commit message
> 
> Changes in v3:
> - send also high resolution events
> 
>   drivers/hid/hid-a4tech.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
> index 9428ea7cdf8a..c3a6ce3613fe 100644
> --- a/drivers/hid/hid-a4tech.c
> +++ b/drivers/hid/hid-a4tech.c
> @@ -38,8 +38,10 @@ static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>   {
>   	struct a4tech_sc *a4 = hid_get_drvdata(hdev);
>   
> -	if (usage->type == EV_REL && usage->code == REL_WHEEL)
> +	if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
>   		set_bit(REL_HWHEEL, *bit);
> +		set_bit(REL_HWHEEL_HI_RES, *bit);
> +	}
>   
>   	if ((a4->quirks & A4_2WHEEL_MOUSE_HACK_7) && usage->hid == 0x00090007)
>   		return -1;
> @@ -60,7 +62,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>   	input = field->hidinput->input;
>   
>   	if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8) {
> -		if (usage->type == EV_REL && usage->code == REL_WHEEL) {
> +		if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
>   			a4->delayed_value = value;
>   			return 1;
>   		}
> @@ -68,6 +70,8 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>   		if (usage->hid == 0x000100b8) {
>   			input_event(input, EV_REL, value ? REL_HWHEEL :
>   					REL_WHEEL, a4->delayed_value);
> +			input_event(input, EV_REL, value ? REL_HWHEEL_HI_RES :
> +					REL_WHEEL_HI_RES, a4->delayed_value * 120);
>   			return 1;
>   		}
>   	}
> @@ -77,8 +81,9 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>   		return 1;
>   	}
>   
> -	if (usage->code == REL_WHEEL && a4->hw_wheel) {
> +	if (usage->code == REL_WHEEL_HI_RES && a4->hw_wheel) {
>   		input_event(input, usage->type, REL_HWHEEL, value);
> +		input_event(input, usage->type, REL_HWHEEL_HI_RES, value * 120);
>   		return 1;
>   	}
>   
> 
