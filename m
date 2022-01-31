Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF6894A4956
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 15:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236803AbiAaObq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 09:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34658 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234026AbiAaObq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 09:31:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643639506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nnnu0IuSnUc6HOAJN73fOFJWi2VzdyWpsYxiD/gWHC0=;
        b=SVb67I/yp5KoRQz/p7dl+C+xhuCPQWsoe4yc2233ynrPI1CfPfgGOcZqXE2Mic+BSstOe3
        TBKS/jKIjUmBDpYAoA5OGq7sfmJIYqzHRFqWRitHV16vdZRVlj/KIGCAo1djfr5HCiP0iF
        fHlI1NJrw8OiMIosWIVemKNhM1lXhCE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-8E_WItabOjSFodUjspN6PA-1; Mon, 31 Jan 2022 09:31:44 -0500
X-MC-Unique: 8E_WItabOjSFodUjspN6PA-1
Received: by mail-ej1-f69.google.com with SMTP id 9-20020a170906218900b0065e2a9110b9so5078570eju.11
        for <linux-input@vger.kernel.org>; Mon, 31 Jan 2022 06:31:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nnnu0IuSnUc6HOAJN73fOFJWi2VzdyWpsYxiD/gWHC0=;
        b=vgcxDhCD5LCSPC167LSvPT9YswwCLbltm9hH6PaNXlHABh3whHeekWDFEIE0jOXdsc
         d5YYQH2K+Y/Jp7VsQs9BMzg307Qiumaesxhyp0GEewZnYOrZclvejN7/9l8sgjQ8Tcee
         EyUMGQvUl+C9oudBkOpzu9obNjkLgH32XcO3RVAo/O3/sg+wAQWj+sOLYqLBCnXUPjkM
         GErAZpV3Wljml60DTpkbLJJqipSoXhFMkbwvT4W/lWwcBa8jHrKr0Z0sUaoahPyR5NFk
         Quc8l08o3+9/nxu7q7Nz/0NjsKzlmxijW6vhErMrOsmgxIIbvJG4yplWtg2caJ69qOTz
         4qGw==
X-Gm-Message-State: AOAM531p9l/W3R+nGRMunlPjPWaOIYsrG6jhYiVbLJuieFvxADbVns24
        bz5Uf94cqPlmMBj+roFx75UWe9Yo7v5pqHA1md3hqGnvkln8tgcQwX3+i+zRjI/kuo8Ck4Zu6Rj
        Z39Fq6BXvIwjOTGmh+YMXWjw=
X-Received: by 2002:a05:6402:1395:: with SMTP id b21mr20959635edv.305.1643639501854;
        Mon, 31 Jan 2022 06:31:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk3qVsFXaDAIREQBWoL5+ZUnQ+3ZMeMz+eTWxiV4OC+DbLjmlXPeMF5PsKxBxOcKVv8jbOZA==
X-Received: by 2002:a05:6402:1395:: with SMTP id b21mr20959623edv.305.1643639501681;
        Mon, 31 Jan 2022 06:31:41 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k7sm13354414eje.162.2022.01.31.06.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 06:31:40 -0800 (PST)
Message-ID: <625e49cb-776a-03d1-9fb8-68a55f7d0abb@redhat.com>
Date:   Mon, 31 Jan 2022 15:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 5/5] Input: goodix - Fix race on driver unbind
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20211212124242.81019-1-hdegoede@redhat.com>
 <20211212124242.81019-6-hdegoede@redhat.com> <YbbSe/G6wv7FMwjB@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YbbSe/G6wv7FMwjB@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 12/13/21 05:56, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Sun, Dec 12, 2021 at 01:42:42PM +0100, Hans de Goede wrote:
>> Because there is no way to detect if the touchscreen has pen support,
>> the driver is allocating and registering the input_pen input_dev on
>> receiving the first pen event.
>>
>> But this means that the input_dev gets allocated after the request_irq()
>> call which means that the devm framework will free it before disabling
>> the irq, leaving a window where the irq handler may run and reference the
>> free-ed input_dev.
>>
>> To fix this move the allocation of the input_pen input_dev to before
>> the request_irq() call, while still only registering it on the first pen
>> event so that the driver does not advertise pen capability on touchscreens
>> without it (most goodix touchscreens do not have pen support).
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/touchscreen/goodix.c | 32 ++++++++++++++++++------------
>>  drivers/input/touchscreen/goodix.h |  1 +
>>  2 files changed, 20 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>> index 04baf5a770f5..1ada40fa6de6 100644
>> --- a/drivers/input/touchscreen/goodix.c
>> +++ b/drivers/input/touchscreen/goodix.c
>> @@ -297,14 +297,14 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
>>  	return -ENOMSG;
>>  }
>>  
>> -static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
>> +static int goodix_create_pen_input(struct goodix_ts_data *ts)
>>  {
>>  	struct device *dev = &ts->client->dev;
>>  	struct input_dev *input;
>>  
>>  	input = devm_input_allocate_device(dev);
>>  	if (!input)
>> -		return NULL;
>> +		return -ENOMEM;
>>  
>>  	input_copy_abs(input, ABS_X, ts->input_dev, ABS_MT_POSITION_X);
>>  	input_copy_abs(input, ABS_Y, ts->input_dev, ABS_MT_POSITION_Y);
>> @@ -331,23 +331,18 @@ static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
>>  		input->id.product = 0x1001;
>>  	input->id.version = ts->version;
>>  
>> -	if (input_register_device(input) != 0) {
>> -		input_free_device(input);
>> -		return NULL;
>> -	}
>> -
>> -	return input;
>> +	ts->input_pen = input;
>> +	return 0;
>>  }
>>  
>>  static void goodix_ts_report_pen_down(struct goodix_ts_data *ts, u8 *data)
>>  {
>> -	int input_x, input_y, input_w;
>> +	int input_x, input_y, input_w, error;
>>  	u8 key_value;
>>  
>> -	if (!ts->input_pen) {
>> -		ts->input_pen = goodix_create_pen_input(ts);
>> -		if (!ts->input_pen)
>> -			return;
>> +	if (!ts->pen_input_registered) {
>> +		error = input_register_device(ts->input_pen);
>> +		ts->pen_input_registered = error == 0;
> 
> I do not think you want to try and re-register input device if first
> registration failed. You probably also don't want to waste time and
> return early from here in case of failures.

Ack, I've fixed both for v2 of this patch-series.

Regards,

Hans

