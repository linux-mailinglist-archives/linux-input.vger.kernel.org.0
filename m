Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43A6034A80C
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 14:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbhCZNY3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Mar 2021 09:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhCZNY1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Mar 2021 09:24:27 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD61C0613AA;
        Fri, 26 Mar 2021 06:24:26 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 15so7427103ljj.0;
        Fri, 26 Mar 2021 06:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GV+IkmaeyVjfFxZtZKsjFDIv0K2oiUvswXjmilRzmbk=;
        b=oQbfOtw8lKNVyi0lhUdLntzpuMpE25nTvsHsmI0TCy9oeQlmJ1pEtzqiskM0X5i8/f
         q2HLzlaQpbsE0Bbn9QejWDuA46m9stYDR2QvNQo148WCziTXJys9+hDtKEAVXEAgge1v
         jWP3SNK/h1TLjC/l5UDwLc70W1ZmyawbsARg8Nql8ezynQ1cl22/Il6fdvhbCcqLUAN0
         8YJPO3D3gf+VLQ88nScB5+ayIerEtH8jQJcyEV9n3fzXmMcYskUAsjT/GZCrN/5QzvWP
         jO8cse//nYZ61w6HOtZlb0PZ6lRU8muN3DYnD1fg0LMXh7QxoF0oOQsTM6tmX5ScqHG1
         RnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GV+IkmaeyVjfFxZtZKsjFDIv0K2oiUvswXjmilRzmbk=;
        b=icM5l0UBA0SkPaOVucP7GpMuEAC+SJFbLX/x5uVbPRrewu9EPueBGNJhTyjT5rO6H/
         /RpIwh/JiUoyJOSu/iyqKMoUHljbSBa95t7neMkzvZt4YzH0Uoa2cQMMM2tmBBprTxhX
         Ms8ZL89DpJbLnK2x5+rXGLMTL+3Pyry8L+ijT7KaqzWqbUXUKFt2CNUKk0Brx4RrdinJ
         qLuYi9LTcEC2kSjiDLRg7PvbI1xk0Aru/Y0Qbu+BRaRDN+fvo28b9Y8mrCfhoYFp0Ixo
         hIzcsWFjLzbmvN5EO6QO1Lw+VJ3ceW1zt0LWziwW41YsqOImtf4LiO5gvDyGmzWl6D2z
         QEZQ==
X-Gm-Message-State: AOAM530K6O9aSyTGt2oX4LBy/VQLJvqx7k5u9GTW3bUJFb1wzmyLOHJR
        i83hxunmbgGhtp7Mh77Q0YTNlSf0Z3U3/A==
X-Google-Smtp-Source: ABdhPJzxQVMAUueHkOyqzjT6R478LgStf4wPn+yRyhhoFXiSxmrd3aDjyZU7AA0Mu/PoIWRyBet+2A==
X-Received: by 2002:a2e:b4b4:: with SMTP id q20mr8918602ljm.45.1616765064911;
        Fri, 26 Mar 2021 06:24:24 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:99a9:a10:76ff:fe69:21b6? ([2a00:1370:814d:99a9:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id n25sm868961lfe.86.2021.03.26.06.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Mar 2021 06:24:24 -0700 (PDT)
Subject: Re: [PATCH v1] Input: elants_i2c - fix division by zero if firmware
 reports zero phys size
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210302100824.3423-1-digetx@gmail.com>
Message-ID: <bfd65c47-a571-9273-b1c2-82d9857aec95@gmail.com>
Date:   Fri, 26 Mar 2021 16:24:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210302100824.3423-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

02.03.2021 13:08, Dmitry Osipenko пишет:
> Touchscreen firmware of ASUS Transformer TF700T reports zeros for the phys
> size. Hence check whether the size is zero and don't set the resolution in
> this case.
> 
> Reported-by: Jasper Korten <jja2000@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> Please note that ASUS TF700T isn't yet supported by upstream kernel,
> hence this is not a critical fix.
> 
>  drivers/input/touchscreen/elants_i2c.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 4c2b579f6c8b..a2e1cc4192b0 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1441,14 +1441,16 @@ static int elants_i2c_probe(struct i2c_client *client,
>  
>  	touchscreen_parse_properties(ts->input, true, &ts->prop);
>  
> -	if (ts->chip_id == EKTF3624) {
> +	if (ts->chip_id == EKTF3624 && ts->phy_x && ts->phy_y) {
>  		/* calculate resolution from size */
>  		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, ts->phy_x);
>  		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, ts->phy_y);
>  	}
>  
> -	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> -	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> +	if (ts->x_res > 0)
> +		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> +	if (ts->y_res > 0)
> +		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
>  	if (ts->major_res > 0)
>  		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);
>  
> 

Hi,

This is a very minor fix, but still will be nice if we could get it into
5.13 in order to have one less patch to care about. Thanks in advance!
