Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49AE983624
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2019 18:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731608AbfHFQEF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Aug 2019 12:04:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41230 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbfHFQEF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Aug 2019 12:04:05 -0400
Received: by mail-pf1-f196.google.com with SMTP id m30so41754953pff.8;
        Tue, 06 Aug 2019 09:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NFpfgZSca4f/il0m1rKI2O4H3v5HdUMXHwHA02nA/gw=;
        b=TE+gQkruCFbNMB/Bu4p0yuUTFx9lKVSAGgQBrtYD6EGsG0av5zdwsHkYq1Sp1GIvtM
         rlzGKiG3YM34heVySo0vYaGr2yyGdDIQ7PogfTxA2MvF8azUoXigPq+H+HidWl+wWWFy
         IS7251UWjAF6tbeVDkz4TsGuQoTfdb5xZn+imMLYwvUFcDYkUlcYJdekV90RUDbLS8ey
         yg9BOjgq3V201eosTOS30qplWsJFoMpdp/cPlXIrWER76kLP14a/gJhDsLkRQhqojDzO
         Ju/gdexcQHujRtqJ/RCpeyUknxZO/nnrBf5O+BsUOvdtkfBI033CqT5w1xmcfpV+mUIR
         JJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NFpfgZSca4f/il0m1rKI2O4H3v5HdUMXHwHA02nA/gw=;
        b=qjYRWpvE+2/tDqRnGLAqUd7DbFVwQX1kAQD/2UY8HJy8NImOK4V5EnRvjzY8qisfg0
         YEfjOM9LtuTIk9aC/b9KtRO0Zj3X2KmPMWyMeBfZuhT5vPYDI0Ss3Ttkp9jtkzNp7AWD
         UZl+G5zbHWVtLW1VaDvEoY4DZOG3HGCebGw0R5vHlI1wq3YKHGNwx0YKoQWG3rsOGtlQ
         mUUzeawoJpR+40pWhNRNbDgYYN/Xws9h6tI2acrFH36uXsi52FSgkAZqati6+I8B2mV7
         lSh83yCUoR9I1auV1LuN2w2uffZxWn+1XUt2pruG/enAqpH2AEbPB06hEU0f83E6zMOz
         6t9Q==
X-Gm-Message-State: APjAAAW86wk0WGL5+LUmr7FITl6lQZmDeSIFerg01TcaRid+tGjxuUDU
        xa7JGmupP+dM2iAoX6KxdkU=
X-Google-Smtp-Source: APXvYqzY19DJR7nKb84UZdsM6H3VktbfteX5pl3p78jNZcz9qG+RZxohnFHnZ7lhZbaKQnQn8Y0+gA==
X-Received: by 2002:a63:b904:: with SMTP id z4mr3605353pge.388.1565107443803;
        Tue, 06 Aug 2019 09:04:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id o24sm162749731pfp.135.2019.08.06.09.04.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 09:04:03 -0700 (PDT)
Date:   Tue, 6 Aug 2019 09:04:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: applespi - use struct_size() helper
Message-ID: <20190806160400.GC178933@dtor-ws>
References: <20190806000638.GA4827@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806000638.GA4827@embeddedor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 05, 2019 at 07:06:38PM -0500, Gustavo A. R. Silva wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct touchpad_protocol {
> 	...
>         struct tp_finger        fingers[0];
> };
> 
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
> 
> So, replace the following form:
> 
> sizeof(*tp) + tp->number_of_fingers * sizeof(tp->fingers[0]);
> 
> with:
> 
> struct_size(tp, fingers, tp->number_of_fingers)
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/applespi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
> index acf34a5ff571..584289b67fb3 100644
> --- a/drivers/input/keyboard/applespi.c
> +++ b/drivers/input/keyboard/applespi.c
> @@ -1494,8 +1494,7 @@ static void applespi_got_data(struct applespi_data *applespi)
>  		size_t tp_len;
>  
>  		tp = &message->touchpad;
> -		tp_len = sizeof(*tp) +
> -			 tp->number_of_fingers * sizeof(tp->fingers[0]);
> +		tp_len = struct_size(tp, fingers, tp->number_of_fingers);
>  
>  		if (le16_to_cpu(message->length) + 2 != tp_len) {
>  			dev_warn_ratelimited(&applespi->spi->dev,
> -- 
> 2.22.0
> 

-- 
Dmitry
