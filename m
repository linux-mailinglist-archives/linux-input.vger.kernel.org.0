Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524CEED9BB
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 08:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfKDHCO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 02:02:14 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36279 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728269AbfKDHCN (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 02:02:13 -0500
Received: by mail-pf1-f195.google.com with SMTP id v19so11534732pfm.3;
        Sun, 03 Nov 2019 23:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=v+Wl1Sx2mI67wtuMY0EGp0iJXT9WiLXyzWaJORWXPX4=;
        b=RBjNI+CUISpozJIFKnX3ESzdkxuXvmxyHk7MnHfon5YSkuHTUUxQyfbtuEDf8SImwY
         6L6GPAQP6TvI8ld0BjDJPI22VTKaEj6ksMlr6mKX4d9Z1hHYCqhmB6q0Wcgwx8BRHNoZ
         bBojmbpRCkttNFO1fC3eW/T7/cEI3WcokemYa7zu2PbnNq2Id5f/PoHnMyizJVxobQoy
         q4SyH8pyWgrTh3cEJagRg/36FaH873MX+9wdBbAbQwImRDMnHu4PIJiZWVNHmfjZ0eoD
         /ihydKUtrPV8lSPB9mWvNKbkr0f6X1yGsGv3qSuDLhYAGYiEHXm7/clAf0O6/i4dv5i3
         3dBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v+Wl1Sx2mI67wtuMY0EGp0iJXT9WiLXyzWaJORWXPX4=;
        b=nzOiNbuADN2QXgDakV8hjGejhTUSlWpzCu+u569cqqYDGHZokNexjARgjYY8rve5Db
         GwLEgPSv3dvDK4mgA9e6KCVLMGczb/HniRuawVkCZ0JiZsSb5GREp7FAccTHHz4mAzE7
         XKnDiZlunZpiQjqAer309bLe6WPNzym+TOxSdKAHRj/UcDUzNkMP3aoyC+l0fmdSH9hQ
         mN9BEKQvqz8P/LWMpglK/s3GgIhCpNS7RPeehpr4p4alWgvjLSiGFeJR20tgjgug7CuF
         K2a9kuBvWkfk4lVXsEpz+Wt5rAUP/IlGh2234Q/68s3hZb0FC/2xNinAu1aRP2RmTm4Q
         ylQw==
X-Gm-Message-State: APjAAAU2qCu8TLorm7bGvsoXXKQBVjoXU43XLgMelhxkJ+KYIFR6IsV3
        uXwHBcA9zBseU+v1ToBzB1S0I6k9
X-Google-Smtp-Source: APXvYqzeqvkV7mcRUEFGbGuvApEdG99J5f5TUvGxPvMbuJn9ryn1qnvQyPKa7mHl8rkAalmSrvf06w==
X-Received: by 2002:a17:90a:a45:: with SMTP id o63mr33024831pjo.45.1572850932357;
        Sun, 03 Nov 2019 23:02:12 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j10sm13867431pfn.128.2019.11.03.23.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2019 23:02:11 -0800 (PST)
Date:   Sun, 3 Nov 2019 23:02:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     Adam Ford <aford173@gmail.com>,
        Sven Van Asbroeck <thesven73@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20191104070209.GN57214@dtor-ws>
References: <20190302141704.32547-1-marex@denx.de>
 <20191101204801.16328-1-TheSven73@gmail.com>
 <CAHCN7xL4aNDf+4TiStSp4PMiA_FKj9VOmCpe-o42WBhMdoj_Ew@mail.gmail.com>
 <af0b175c-ced0-1a01-9a19-7e49fdb3386d@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0b175c-ced0-1a01-9a19-7e49fdb3386d@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 04, 2019 at 01:16:21AM +0100, Marek Vasut wrote:
> On 11/4/19 12:55 AM, Adam Ford wrote:
> > On Fri, Nov 1, 2019 at 3:48 PM Sven Van Asbroeck wrote:
> >>
> >> Dmitry / Marek,
> >>
> >> There have been two attempts to add ILI2117 touch controller support.
> >> I was about to add a third, but luckily I checked the mailing list
> >> before writing any code :)
> >>
> >> Adding this support would clearly be beneficial for the common good.
> >> What can we do to get this in motion again?
> >>
> >> Last time I checked, Marek posted a patch which added the 2117, but Dmitry
> >> objected, because the code became too unwieldy. Dmitry then posted a cleanup
> >> patch, which did not work for Marek. So everything came to a halt.
> >> See:
> >> https://patchwork.kernel.org/patch/10836651/
> >> https://www.spinics.net/lists/linux-input/msg62670.html
> >>
> >> Dmitry, would you perhaps be willing to accept Marek's patch, and perform the
> >> cleanup later?
> >>
> >> Marek, would you perhaps be willing to invest some time to debug Dmitry's
> >> cleanup patch?
> >>
> >> On my end, I've reviewed Dmitry's patch and it looks mostly ok. I saw one
> >> difference with ILI210X which could explain Marek's results, but I can't be
> >> sure - because I could not locate the 210X's register layout on the web.
> >>
> >> In Dmitry's patch, we see:
> >>
> >>         touch = ili210x_report_events(priv, touchdata);
> >>         if (touch || chip->continue_polling(touchdata))
> >>                 schedule_delayed_work(&priv->dwork,
> >>                                       msecs_to_jiffies(priv->poll_period));
> >>
> >> but this is not exactly equivalent to the original. Because in the original,
> >> the 210X's decision to kick off delayed work is completely independent of
> >> the value of touch.
> >>
> > 
> > If anyone is interested, I posted a patch to add ili2117A.
> > https://patchwork.kernel.org/patch/10849877/
> > 
> > I am not sure if it's compatible with the non-A version.
> 
> This patch could've gone in as-is, the rework was not necessary (and
> indeed, didn't work). I don't know why this patch wasn't applied in the
> end, maybe it was just missed.

Do we really need a brand new driver here? It looks pretty similar to
the other flavors...

Thanks.

-- 
Dmitry
