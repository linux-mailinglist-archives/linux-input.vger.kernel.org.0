Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 826F5144B98
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 07:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbgAVGEb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 01:04:31 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35223 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgAVGEb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 01:04:31 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so2885799pgk.2;
        Tue, 21 Jan 2020 22:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lkotT+VIN49LQxxslEF7HnUwRBMxmFG9jiiMFYkjH24=;
        b=COOv/yN8Hr9Qv/dJ/at5bJVhdv56MSgYxTN2HWJwzWggjM43m3cRADshESDiSPLUec
         9ORozsiL+0X1DO59eWQ7I0EJgQGWyCHqCG/MMRpbX6ey+0oHV6qXt2VAMtM/ttCHT918
         A6l/u9uZ4Q+Qb7s3buZodApba1gECdpwr7S9yidvB0vmJpB1pXJ55o+1300jMPhbRB1O
         mvflAzITgnazXEzKt/Vu6drNh3c2/Wcwuvy+r9VGDSCXb+yrFn1WyrLK2sKOCAlH5dP2
         qjLy6LZ/MAn3hv010szv15Jy1DmY/grQ/dnrWQ6TddEiF2JHHvJ81CjQuKTLpvqV6rgg
         cBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lkotT+VIN49LQxxslEF7HnUwRBMxmFG9jiiMFYkjH24=;
        b=JyKePPuGbR6ZFzUYdXU7HDG671Ktw0yFNzgWVF9aog4eSJI/pAkSmpamwXST4nyKmC
         PBh2J1h7zbLVAgWDPCpUaU/gF78VzIDlzdycsZ06TQv4dV6jUKV4VrezkM7Xj5Wnj+gF
         TMbKjS+Qt8oESfJNaqXjdTGuLfOk/4/QdUcNu8KRn73oZG+9BoUvSLVq89a38AY8l7UL
         jcULghZIKdMUwtEH6CBlZTzxCfUnnqi/L7iJbbQNS8CFjT3mhmsbPiKowg4BfALAIPmR
         iZnVWFUIVKaTOXeszaeg0KNmurCQRgMOlDThb/q4aqcn9ltYkveSj5XnegW4LyOm4F7g
         f/xw==
X-Gm-Message-State: APjAAAVHNEl3odn4ptUHd185cVFtyKZHAikD5ejJ5n5kGYTTF1QsX/5b
        5FEHSYnsy/C2RQS5zkO92f8=
X-Google-Smtp-Source: APXvYqzkTzpBmuKa0MJoE3Hq8kdtmUnbXTtll2x5ntATw1aMStSummcDgyIm1/zF6ppqg7UAH92WkA==
X-Received: by 2002:a63:f410:: with SMTP id g16mr9371594pgi.193.1579673070349;
        Tue, 21 Jan 2020 22:04:30 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a28sm44975723pfh.119.2020.01.21.22.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 22:04:29 -0800 (PST)
Date:   Tue, 21 Jan 2020 22:04:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 2/2] Input: axp20x-pek - Enable wakeup for all AXP
 variants
Message-ID: <20200122060427.GE110084@dtor-ws>
References: <20200115051253.32603-1-samuel@sholland.org>
 <20200115051253.32603-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200115051253.32603-3-samuel@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 14, 2020 at 11:12:53PM -0600, Samuel Holland wrote:
> There are many devices, including several mobile battery-powered
> devices, using other AXP variants as their PMIC. Allow them to use
> the power key as a wakeup source.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied, thank you.

> ---
>  drivers/input/misc/axp20x-pek.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
> index 0ace3fe3d7dc..1872607e87c3 100644
> --- a/drivers/input/misc/axp20x-pek.c
> +++ b/drivers/input/misc/axp20x-pek.c
> @@ -279,8 +279,7 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
>  		return error;
>  	}
>  
> -	if (axp20x_pek->axp20x->variant == AXP288_ID)
> -		device_init_wakeup(&pdev->dev, true);
> +	device_init_wakeup(&pdev->dev, true);
>  
>  	return 0;
>  }
> -- 
> 2.23.0
> 

-- 
Dmitry
