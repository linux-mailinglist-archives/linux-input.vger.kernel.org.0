Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 264CEA2542
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 20:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728699AbfH2S3i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 14:29:38 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37276 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727897AbfH2S3i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 14:29:38 -0400
Received: by mail-pf1-f194.google.com with SMTP id y9so2636003pfl.4;
        Thu, 29 Aug 2019 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XGj2EADqNYSEMEQUe9U3U+ApBTGiXnfrDASNfm/rl0k=;
        b=EJZkBjHZyK2TkNIpmYxq6WoqIVAXRwdGu23NXoIDPaOSjX8tJu6tQljH6LzAnCo4np
         BXzAwGi59drvalztNdhid4wEMRBoAc7SxMu3H7CX8C4HDyL/LfuWeagFAO2paebIITMs
         hKsM6mPr2ic+PUm5135YP8iIcU9ErJUMe5pWyhb5WCKYUGmL6O98M4lVJX+bYN1hGRh0
         GvKW3JvJZcDyOt4nqDkWL4SUPtVhEwMDZ76K147Kuwo6Fo5mwOeiohtgr9WBYkAuX83c
         KonMCj90wI/gZYTxFuP7dovTs5t95xWpTcKDk1rZOmrregV7jX5Nfof49UJRvk+q3kU9
         dUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XGj2EADqNYSEMEQUe9U3U+ApBTGiXnfrDASNfm/rl0k=;
        b=EzXDLLcHtvkUsWX0Xdt2w6m5qBA1GDeRVNYDCqANzZgC8MUruAri5AskAB9FhjxYZy
         8EfgJBqPpPZYfY7CrZyqAjD4b9AhtKVebeTLsxVjp8hhX57H90XMKxsgq2mJbhrDccES
         dxeov41p2Srd5P7wnDDsFzT3Q0Gkit5X/C+Fm6L65Gchsr5cryU4TNtrY0q+F3VywtVK
         mvb8JLsrAPl6B53KvYzO4B3OcreDPwdYy+u+J3UlvTTwzyLLvDXPXe0e88C0FKIcryZh
         ddUQVbjND9ilIsXcnLYiEwm9QCuYmUmXd8gxDr9xhpIKduGMPLzxBYIr1ikNgIFtlSbw
         P8kw==
X-Gm-Message-State: APjAAAUkdFqJ4G0NAMYvv3YD7AJdZlLsoi9PLr/W+Q7RrKg79GKykUEH
        rphR1/eAedGSmouTb98tK+T/f0Gi
X-Google-Smtp-Source: APXvYqwINcLZPbJV3Fgfb2KivcX+LlmVZBUYduoAEb5JXlXT82AkINQeGDPHs8dxPibj9tDTPryA2Q==
X-Received: by 2002:a17:90a:5d98:: with SMTP id t24mr11366507pji.94.1567103377134;
        Thu, 29 Aug 2019 11:29:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o3sm16680318pje.1.2019.08.29.11.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 11:29:36 -0700 (PDT)
Date:   Thu, 29 Aug 2019 11:29:33 -0700
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     "Johnny.Chuang" <johnny.chuang@emc.com.tw>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        =?utf-8?B?U1RSRDIt6JSh5oOg5ayL?= <jennifer.tsai@emc.com.tw>,
        =?utf-8?B?U1RSRDIt6Zmz5bSH5piO57aT55CG?= <james.chen@emc.com.tw>,
        =?utf-8?B?J+aigeWNmue/lCc=?= <paul.liang@emc.com.tw>,
        'jeff' <jeff.chuang@emc.com.tw>
Subject: Re: [PATCH] Input: elants_i2c - return real value of
 elants_i2c_initialize()
Message-ID: <20190829182933.GD187474@dtor-ws>
References: <1566958886-25756-1-git-send-email-johnny.chuang@emc.com.tw>
 <000601d55d49$05878160$10968420$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000601d55d49$05878160$10968420$@emc.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Johnny,

On Wed, Aug 28, 2019 at 10:33:46AM +0800, Johnny.Chuang wrote:
> The return value of elants_i2c_initialize() was always 0.
> It maybe register input device when initialize fail.

We do not want to return error here, because it will abort probe, and
then we will not be able to initiate firmware flash flow so we can
attempt to recover the device.

If you want to try you can change the ts->iap_mode before trying to
register input device, but then you need to be very careful about
registering and unregistering it later, after flashing or re-flashing
firmware.

> 
> Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/elants_i2c.c
> b/drivers/input/touchscreen/elants_i2c.c
> index d4ad24e..9c9816f 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -571,7 +571,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
>  	if (error)
>  		ts->iap_mode = ELAN_IAP_RECOVERY;
>  
> -	return 0;
> +	return error;
>  }
>  
>  /*
> -- 
> 2.7.4
> 

Thanks.

-- 
Dmitry
