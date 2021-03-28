Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12C3C34BD89
	for <lists+linux-input@lfdr.de>; Sun, 28 Mar 2021 19:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhC1RV2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 28 Mar 2021 13:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231340AbhC1RVF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 28 Mar 2021 13:21:05 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C17A8C061756;
        Sun, 28 Mar 2021 10:21:04 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m12so14902784lfq.10;
        Sun, 28 Mar 2021 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=m5n0YXOwW9Hi1GIX7USstKgF3p3m11IaefFXa7cKRmM=;
        b=KG3dCp5GSUH47Hc4LdQZI/2q+2sU74KRV1LkWlb44jlV8t0LNd9rAUJchmXnEREkEq
         /kYJkVSUl3siYQIm385XNBBQ9C77ekcH/01si1fudYx3Y2b5V6zQwbcbADBSQI/MakQM
         1V5T9CO7mhb93jWtlxvISFxEbNj7t1sydOSow4uf5u9CcvVjpys3Wes/upgxBps4D3lG
         SmD6mqXf6605g9NgIsHVWzzHmrivf+XsXl4MNwNLXplZ0JHin6I7QRMgrNAenXcmTXYE
         6yvMddvTR02ywUBh8bQ/6Fj2AXxiLd+jj8/sFViDJc25fABhQSLRvgVmmpKbDy2NW9A2
         KWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m5n0YXOwW9Hi1GIX7USstKgF3p3m11IaefFXa7cKRmM=;
        b=s+tRyqFmhpBmaPanx8yEKxE4AIckLdXfdJ/XIdUYEKPdDFpWBKsDKd478aM7Hx84I5
         CqrKYOYCupMer7oPCADM5+V3iw27pQnZBWlanIG2xPQZ0w6JQYGqXIWY4S0tb3sF5chL
         7c4ICVbD3TK2BbolcNGSVPjRhTKcGBBghh2rpFT2e+M1QEPLSErpubwGqUrkYVqeuDvy
         L/tTU3cdHr1BCTLbD2ztJ52BYpP+ikgbORP6gdc7Cd093uecU8wfs734oSPqYGBwYQPj
         LGEPJgM7BUgbv7idSBSHsuPjvjTrmHi19EC9rvZEsGCtoggeslPizy3a9Eh896wB4kfe
         sWSw==
X-Gm-Message-State: AOAM5307zu2+JTaztGDEpWPXwWSlsiBKl7FGMmV4Aksb3iN3ovDDacYr
        cLXv7qmDlb7SzgZHHIOitlDk2LE6Qow=
X-Google-Smtp-Source: ABdhPJzOcVq18vABympiFDVg8EaHQrSG8xdwAihOObkL26wxulKBKB82BxgIOg9JVbo/eOe1tKdBFQ==
X-Received: by 2002:a05:6512:b97:: with SMTP id b23mr14338302lfv.101.1616952063168;
        Sun, 28 Mar 2021 10:21:03 -0700 (PDT)
Received: from ?IPv6:2a00:1370:814d:b259:a10:76ff:fe69:21b6? ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id f26sm1534567lfe.118.2021.03.28.10.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 10:21:02 -0700 (PDT)
Subject: Re: [PATCH v1] Input: elants_i2c - fix division by zero if firmware
 reports zero phys size
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Jasper Korten <jja2000@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-input@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210302100824.3423-1-digetx@gmail.com>
 <YGAJmGqNitQ9XwVl@google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ee24fc68-0e58-df10-8b3f-a1b18f95e4ad@gmail.com>
Date:   Sun, 28 Mar 2021 20:21:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YGAJmGqNitQ9XwVl@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

28.03.2021 07:44, Dmitry Torokhov пишет:
> Hi Dmitry,
> 
> On Tue, Mar 02, 2021 at 01:08:24PM +0300, Dmitry Osipenko wrote:
>> Touchscreen firmware of ASUS Transformer TF700T reports zeros for the phys
>> size. Hence check whether the size is zero and don't set the resolution in
>> this case.
>>
>> Reported-by: Jasper Korten <jja2000@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>
>> Please note that ASUS TF700T isn't yet supported by upstream kernel,
>> hence this is not a critical fix.
>>
>>  drivers/input/touchscreen/elants_i2c.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
>> index 4c2b579f6c8b..a2e1cc4192b0 100644
>> --- a/drivers/input/touchscreen/elants_i2c.c
>> +++ b/drivers/input/touchscreen/elants_i2c.c
>> @@ -1441,14 +1441,16 @@ static int elants_i2c_probe(struct i2c_client *client,
>>  
>>  	touchscreen_parse_properties(ts->input, true, &ts->prop);
>>  
>> -	if (ts->chip_id == EKTF3624) {
>> +	if (ts->chip_id == EKTF3624 && ts->phy_x && ts->phy_y) {
>>  		/* calculate resolution from size */
>>  		ts->x_res = DIV_ROUND_CLOSEST(ts->prop.max_x, ts->phy_x);
>>  		ts->y_res = DIV_ROUND_CLOSEST(ts->prop.max_y, ts->phy_y);
>>  	}
>>  
>> -	input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
>> -	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
>> +	if (ts->x_res > 0)
>> +		input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->x_res);
> 
> There is absolutely no difference between setting respluton to 0 vs not
> setting it at all, so I dropped the conditionals and applied.
> 
>> +	if (ts->y_res > 0)
>> +		input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
>>  	if (ts->major_res > 0)
> 
> We could drop this condition as well.
> 
>>  		input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, ts->major_res);

I'll make a follow up patch to clean up this condition, if you haven't
done it yet. Thanks!
