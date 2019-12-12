Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1CC11C186
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 01:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727264AbfLLAey (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 19:34:54 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:45395 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbfLLAey (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 19:34:54 -0500
Received: by mail-lj1-f195.google.com with SMTP id d20so189904ljc.12;
        Wed, 11 Dec 2019 16:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5L40IYt4QXnAL9ClYzbub20H962D5Pu7HKoLLeNuUdo=;
        b=m1IaqH10vIaHXN6VNlyeOfJLb9buzmFjVIC4KYp08bUQuVhqAojCur8tj9aX1LOZ29
         x+EdwwuB2v2YSPyvrtqm48VBgzl8CcUz1eDmDQSXsbxSaD9x8yEBwhrB7C25mPCk1R3l
         VdMhDxxk0z3qJUGU48DZkVjJgJtjz6bMzI5EgdyMEDmx0AxYXRbG+p7Z8eYMODJJpDC6
         630/8QzEvI9uSnr+L6FUmnZM8yIhXEwavNoSIXCwrw+U7tpWf1NVkgb++vc2N2HUC4d5
         kjnw/mCgwlT8nwOvIR8/0RAJrrVjO4Dxu87f3QdUqv1qNdPl9d+gdE7x8NoKRHG7yANK
         W6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5L40IYt4QXnAL9ClYzbub20H962D5Pu7HKoLLeNuUdo=;
        b=Ws/J+pZ57s3oGFMd+fBzk9tSqrGo//EJdSU6m4PjJBJ8e0+bvnCqNaejiDyb/uO8gC
         0cv4UicMWUy8Hfs/gA3ryeDoTNZw8YrscrmjPwliY7E+19wdSWayV72pfTawWdVgpaOH
         wKLkrToTgC5ZEKdqYsrKxVlNq1Q7h1Ld3X3JprVzOhDNSgJVQnB9D15uVAxmOPmw4Drw
         z19GvlD2++S6IBve8syAxW0EwcPB9dOFqwGF+M8P4xczUcWPbPXqVwVQRuuqteH66HEM
         J2S7VSpwJvsh+rkcss8y25icRmhmGd8XXeBjNV5R7ki/A7kvatxkx6Yw8wYieyHQXoqs
         ZhzQ==
X-Gm-Message-State: APjAAAUsf7p03/tcYEbLYQwfKF0zvZtUGfu8KLocZ8Wva8ygCniW4qE1
        jIRKLdg60FQ+K1JGPEPeTfmJJxDX
X-Google-Smtp-Source: APXvYqyFtG8+RJ4TkZDqZBHilLvwxAbNyIJyp42lDcIggvRmqFLbgKKr2DuOhN+D8VrBqPDUaCeLvw==
X-Received: by 2002:a2e:7a1a:: with SMTP id v26mr3999518ljc.76.1576110892255;
        Wed, 11 Dec 2019 16:34:52 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id u20sm1939954lju.34.2019.12.11.16.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:34:51 -0800 (PST)
Subject: Re: [PATCH v2 3/9] input: elants: remove unused axes
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <fba33fca7c1e8a21cc1dc9e9aca975e871468e22.1576079249.git.mirq-linux@rere.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <84eb5d89-f26c-fab6-5424-c962d8e184d9@gmail.com>
Date:   Thu, 12 Dec 2019 03:34:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <fba33fca7c1e8a21cc1dc9e9aca975e871468e22.1576079249.git.mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

11.12.2019 19:03, Michał Mirosław пишет:
> Driver only ever reports MT events. Clear capabilities of all others.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index eadd26d5a06f..ab9d63239ff5 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1251,17 +1251,6 @@ static int elants_i2c_probe(struct i2c_client *client,
>  	ts->input->name = "Elan Touchscreen";
>  	ts->input->id.bustype = BUS_I2C;
>  
> -	__set_bit(BTN_TOUCH, ts->input->keybit);
> -	__set_bit(EV_ABS, ts->input->evbit);
> -	__set_bit(EV_KEY, ts->input->evbit);
> -
> -	/* Single touch input params setup */
> -	input_set_abs_params(ts->input, ABS_X, 0, ts->x_max, 0, 0);
> -	input_set_abs_params(ts->input, ABS_Y, 0, ts->y_max, 0, 0);
> -	input_set_abs_params(ts->input, ABS_PRESSURE, 0, 255, 0, 0);
> -	input_abs_set_res(ts->input, ABS_X, ts->x_res);
> -	input_abs_set_res(ts->input, ABS_Y, ts->y_res);
> -
>  	/* Multitouch input params setup */
>  	error = input_mt_init_slots(ts->input, MAX_CONTACT_NUM,
>  				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
