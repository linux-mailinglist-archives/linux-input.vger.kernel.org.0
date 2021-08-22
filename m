Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681713F4051
	for <lists+linux-input@lfdr.de>; Sun, 22 Aug 2021 18:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbhHVQCV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Aug 2021 12:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbhHVQCU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Aug 2021 12:02:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AEE2C061575;
        Sun, 22 Aug 2021 09:01:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y34so32357497lfa.8;
        Sun, 22 Aug 2021 09:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f2OqFdb/WJEzbDA3MkFCfBJj2Q30cTEQaI3c7ZeSsAw=;
        b=HQYlJebuMoFAVjgMt3iTWdJQrHmc47aSiBGZ2oXhl6LmKz8+wNuDRe/fRsAjc2b6Cs
         5ZPH/nGYIZFHhYBBK3o2cvcUB6f0uoOcXieTGden23oSoCV83tIpdoU7Z5o/kvZZyrTd
         Ig7L/cyEfvB99hWWvRFLSiOhMlUkGXvTCpULZiozRZR7z9pJ4z6OCngsIh3c2gTF0NSn
         yHJgxauHbhqYEgKlEmAqy922Fs7IqpIVh/kbEvwVZDE7JovSVX+6kTbbkIJb3sBZroj5
         hoM/22tA6xDCqkGZh55N27ZuLa/ZGNdoJqxOWKjp5kjeKEm2JRGq33EtVmS+72x8wqLl
         e2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f2OqFdb/WJEzbDA3MkFCfBJj2Q30cTEQaI3c7ZeSsAw=;
        b=d6VZq78ZQmgvDwrhQ8URFGLvBAZB+of7E365iRAYOnP6BryI3PW+MEpogprSWCdX/v
         jJ/nDxwFSqersouv/tHrFtjxd4dUwPp3JSE+oAgV6yyFQLj7OJBuUh0kI8qsW5Lx1P4x
         LtZUwfMV2Pxg6NucD1CoUeaWUg3mrxslRZv8PQaj6gQAK+Gw1agS4ZeiBmvAmdAh5Tpr
         0kh1tbOMxXkz6r3ubbSiDn0IJ7CGMwA/i3Pp2nvIcmbEdCkgoOmQnsOTidIzjmd4IQKZ
         QIQlZzYFhb86tKoUVJydrdOj2mwwTMcMJFZieyOPAaiOEFN+YysRYIJBGzqeC/SSTtye
         FrVg==
X-Gm-Message-State: AOAM533PuzTUU+cIAGN/QqKAm5hKNnWlS4IasCxVHm/adsvtIkyRg5AN
        x3szVVkTVHPyYfwCYhuXGwAWVbCzpQQ8P2UZ
X-Google-Smtp-Source: ABdhPJzHQPRenD/KTNBsqtPUlof70h2SmK6Ey0RnHIzzVS+vQRPSThnWy2vkRZIbvwm5pYIJRbISkQ==
X-Received: by 2002:a05:6512:3e07:: with SMTP id i7mr9220983lfv.273.1629648097433;
        Sun, 22 Aug 2021 09:01:37 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.66.127])
        by smtp.gmail.com with ESMTPSA id y3sm1136039ljj.121.2021.08.22.09.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Aug 2021 09:01:37 -0700 (PDT)
Subject: Re: [PATCH v2] HID: betop: fix slab-out-of-bounds Write in
 betop_probe
To:     "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>, jikos@kernel.org,
        benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210816201544.26405-1-asha.16@itfac.mrt.ac.lk>
 <20210822134319.3738-1-asha.16@itfac.mrt.ac.lk>
From:   Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <a4ada71d-4827-a6d7-6488-486cae76c257@gmail.com>
Date:   Sun, 22 Aug 2021 19:01:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210822134319.3738-1-asha.16@itfac.mrt.ac.lk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/22/21 4:43 PM, F.A.Sulaiman wrote:
> Syzbot reported slab-out-of-bounds Write bug in hid-betopff driver.
> The problem is the driver assumes the device must have an input report but
> some malicious devices violate this assumption.
> 
> So this patch checks hid_device's input is non empty before it's been used.
> 
> Reported-by: syzbot+07efed3bc5a1407bd742@syzkaller.appspotmail.com
> Signed-off-by: F.A. SULAIMAN <asha.16@itfac.mrt.ac.lk>
> ---
>   drivers/hid/hid-betopff.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hid/hid-betopff.c b/drivers/hid/hid-betopff.c
> index 0790fbd3fc9a..2d62bde21413 100644
> --- a/drivers/hid/hid-betopff.c
> +++ b/drivers/hid/hid-betopff.c
> @@ -116,6 +116,11 @@ static int betop_probe(struct hid_device *hdev, const struct hid_device_id *id)
>   {
>   	int ret;
>   
> +	if (list_empty(&hdev->inputs)) {
> +		hid_err(hdev, "no inputs found\n");
> +		return -ENODEV;
> +	}
> +
>   	if (id->driver_data)
>   		hdev->quirks |= HID_QUIRK_MULTI_INPUT;
>   
> 

I am still able to trigger reported slab-out-bound with this patch 
applied, please move this sanity check inside betopff_init().


Jiri, does it make sense to add proper error handling of betopff_init()? 
Nowadays betop_probe() just ignores betopff_init() return value. It 
looks wrong to me.


I think, Asha can prepare a patch series with these 2 changes



With regards,
Pavel Skripkin
