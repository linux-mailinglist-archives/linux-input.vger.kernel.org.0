Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD614FA189
	for <lists+linux-input@lfdr.de>; Sat,  9 Apr 2022 04:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232064AbiDICJS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Apr 2022 22:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiDICJS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Apr 2022 22:09:18 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E40C31092
        for <linux-input@vger.kernel.org>; Fri,  8 Apr 2022 19:07:12 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id s21so4750498pgv.13
        for <linux-input@vger.kernel.org>; Fri, 08 Apr 2022 19:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j74xe2RUOnjhcLbYlJTppi8JOB7Z1zW1PmEUsmSgJis=;
        b=b+lTWbxoZ9F6SXuT52u8iW9B0hlhZ0J86Ys85UQBRMORw1NYrvmLyjAm+nrcfiDdY9
         P6/dXjNLEbP6qjVnv3xyUs4iubZc3Kn8asdtSbGszPLkTMwvip35g5rqEi5Jd3vAW1/C
         6/u3ZKhI5FKL7ZeMI4how+xNmzDOreSclN7pDbOOw7MBpkqh3NRM4tTM/rUQL92hCCYs
         YrphC6AIAYXYYU8tS9m45zoRaDVJn/yLwGfThSZvSr8Kq/OeFPec6uEf2YgT7l7UU3bR
         ZEwaypJE9t2HFs1S9Gn+BF2hxDvI1qBCkoTGcFbuYfHcjyegRqJyep1Bf67ytat6lQXG
         M0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j74xe2RUOnjhcLbYlJTppi8JOB7Z1zW1PmEUsmSgJis=;
        b=Hk+mCExGD3hLSEkwCp/g+/qGJI2hHQ8hPN78s6d5zu3U1HAIi00HDjBx3JTMPdw0OL
         7AZX8Nt6C1hoGEHXfinZimJeWyY1pmLRa0vuyglf1BVRxyN4JaPX/zHHuaz7tuU4YwQP
         ypJgPxjohDVNcvB+GMudNwVbP1GNqvmx78VNMaT4lTyPCK8FERVm3bKozD9Ei/e04o1B
         wm2jkOofw0noZoV1PBVzlj3PH9H8vwF+9v+d5lsJkJmBLeO4kIM1ydaCcK88znDXqt5p
         WWdBKeXU1zxndvflA5qGn4KKhrdDIjbCIgNfWGZ/p6bBQfkY+nklG4lRar8JqDSggXOd
         m34Q==
X-Gm-Message-State: AOAM532C0nOGPOSmW2spcjjl+UKDSXRxjHqXEAWN/1pUnqEY+6k6bkTN
        Y7Wf5Z5iCt8ZJA8MH72C1oc=
X-Google-Smtp-Source: ABdhPJzBCBjZXHvlXK7QwAt8HtuiyOZIHFc0HDrDAIMPIAP7krTE4JUYIFfWFC4aFLSQ2EcJJrIdAg==
X-Received: by 2002:a65:5207:0:b0:399:f87:e9dc with SMTP id o7-20020a655207000000b003990f87e9dcmr17716075pgp.527.1649470032377;
        Fri, 08 Apr 2022 19:07:12 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9186:332c:bcb2:4506])
        by smtp.gmail.com with ESMTPSA id 196-20020a6300cd000000b0039940fd184dsm14298709pga.9.2022.04.08.19.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 19:07:11 -0700 (PDT)
Date:   Fri, 8 Apr 2022 19:07:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chris Morgan <macroalpha82@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Chris Morgan <macromorgan@hotmail.com>,
        Artur Rojek <contact@artur-rojek.eu>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] input: adc-joystick: Stop using scan_index for reading
 data
Message-ID: <YlDqTKuo5rbkIL8V@google.com>
References: <20220408212857.9583-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408212857.9583-1-macroalpha82@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

On Fri, Apr 08, 2022 at 04:28:57PM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> For my Odroid Go Advance I noticed that the adc-joystick driver was
> only reporting the y channel and on the x axis. After debugging, I
> found that the driver was trying to read values from channels 0 and
> 1 even though my device is using channels 1 and 2. By changing the code
> to use the axis index instead of the scan index when unpacking the data
> from the buffer, the joystick begins working as expected.

This sounds like some sort of misconfiguration, as your change
effectively removes the ability of using just some ADC channels for
joystick functionality...

Let's add Jonathan and Arthur for their take on this.

> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/input/joystick/adc-joystick.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/joystick/adc-joystick.c b/drivers/input/joystick/adc-joystick.c
> index 78ebca7d400a..fe3bbd0d4566 100644
> --- a/drivers/input/joystick/adc-joystick.c
> +++ b/drivers/input/joystick/adc-joystick.c
> @@ -32,24 +32,23 @@ static int adc_joystick_handle(const void *data, void *private)
>  {
>  	struct adc_joystick *joy = private;
>  	enum iio_endian endianness;
> -	int bytes, msb, val, idx, i;
> +	int bytes, msb, val, i;
>  	const u16 *data_u16;
>  	bool sign;
>  
>  	bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
>  
>  	for (i = 0; i < joy->num_chans; ++i) {
> -		idx = joy->chans[i].channel->scan_index;
>  		endianness = joy->chans[i].channel->scan_type.endianness;
>  		msb = joy->chans[i].channel->scan_type.realbits - 1;
>  		sign = tolower(joy->chans[i].channel->scan_type.sign) == 's';
>  
>  		switch (bytes) {
>  		case 1:
> -			val = ((const u8 *)data)[idx];
> +			val = ((const u8 *)data)[i];
>  			break;
>  		case 2:
> -			data_u16 = (const u16 *)data + idx;
> +			data_u16 = (const u16 *)data + i;
>  
>  			/*
>  			 * Data is aligned to the sample size by IIO core.
> -- 
> 2.25.1
> 

Thanks.

-- 
Dmitry
