Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F6C138F93
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 11:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgAMKtD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 05:49:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32073 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726109AbgAMKtB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 05:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578912539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Sryvnw5c3b3zpqJMiVPTxRZdIpZiMK/8zQVbtOgTuVs=;
        b=RDdqkSzk5Ks7zXf41JSdQx5g1i82wm/G6A2b0CGCEbL79CFrPxZH+6PyP96xtsBNtxt+sR
        pegu2ZJh7s2k+y80CDnhjHByk2cSOMaPriocNwVnR3SE56hwFh5Rss03NxLwbCB4b0IxMN
        mETT74x/pgjUU1LGrbA0tv/PPhbcJ9o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-wuKpxoQaMta-tFy-PaBR5Q-1; Mon, 13 Jan 2020 05:48:56 -0500
X-MC-Unique: wuKpxoQaMta-tFy-PaBR5Q-1
Received: by mail-wr1-f69.google.com with SMTP id w6so4786685wrm.16
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 02:48:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sryvnw5c3b3zpqJMiVPTxRZdIpZiMK/8zQVbtOgTuVs=;
        b=Hk16eWY/wYNVlyHADrcUlxfsoQCydxjj11B6+kb3HB5t212AnZvtYzbyDHgC/QTjYr
         AV5BU9zXFa6l5oMmpZLV2ptAzkVI+qNT18yfLx+0M0t8Q5rQcny+zQ1w5+4lejjdygib
         /h7xTxyCaafpfJxF7tlzjU/Y/QneBmOtVfT2Y5ZNdvbJQJaqiPpd3iUonGqreEJoutIV
         SZtVGnuVh06NDlZYzP0/lbOBafkRcwWMlECTpzZH3CZKCeNdtTyx8DoIeyj612Cs/G+S
         32NVUWMFLUgFd4O2fbNix+OqW9cwsN0GIfSY3A8wnmRUbwINUWK8M6DSUJzpFjYz+PDQ
         F30w==
X-Gm-Message-State: APjAAAW7auShKC09EhEb/E6zld9YZPU7RlQWQr7n2wrb+SFsANZz14vH
        VQj9vueD/3mZtdIwXb0rwj/jEqU23SCLB3kDCiCvRNawbxXcDA/UbXjEabM1inFmgCnV461t6CM
        GMHV8YLs0XeQoBu7QKRa51dE=
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr19608572wmh.71.1578912535563;
        Mon, 13 Jan 2020 02:48:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxHsSmjB3vJPcprLV9sr9PcVhPuEt/0W/kXtaQfjrdzo0qLW3rNyS4UYnlXW4g1kjsBPPVo2w==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr19608552wmh.71.1578912535410;
        Mon, 13 Jan 2020 02:48:55 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id t25sm13820084wmj.19.2020.01.13.02.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2020 02:48:54 -0800 (PST)
Subject: Re: [PATCH 3/3] Input: axp20x-pek - Enable wakeup for all AXP
 variants
To:     Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
References: <20200113032032.38709-1-samuel@sholland.org>
 <20200113032032.38709-3-samuel@sholland.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <95bea397-ed7c-2040-a3af-61ded13aca27@redhat.com>
Date:   Mon, 13 Jan 2020 11:48:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113032032.38709-3-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 13-01-2020 04:20, Samuel Holland wrote:
> There are many devices, including several mobile battery-powered
> devices, using other AXP variants as their PMIC. Enable them to use
> the power key as a wakeup source.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>


Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>   drivers/input/misc/axp20x-pek.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
> index 38cd4a4aeb65..b910c1798e4e 100644
> --- a/drivers/input/misc/axp20x-pek.c
> +++ b/drivers/input/misc/axp20x-pek.c
> @@ -279,8 +279,7 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
>   		return error;
>   	}
>   
> -	if (axp20x_pek->axp20x->variant == AXP288_ID)
> -		device_init_wakeup(&pdev->dev, true);
> +	device_init_wakeup(&pdev->dev, true);
>   
>   	return 0;
>   }
> 

