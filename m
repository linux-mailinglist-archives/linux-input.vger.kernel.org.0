Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A73F8A464D
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 23:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbfHaVEE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Aug 2019 17:04:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36475 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728327AbfHaVEE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Aug 2019 17:04:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id l21so5280616pgm.3;
        Sat, 31 Aug 2019 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=JOkt1Xq1yrsHfK/1NpnOnxpeuczROWMDFL17g6IfVAA=;
        b=pV/9auGEPtAoN12YoL+WtRizQy+cGjQu2nV8KDGbUbXYnlnNQFLkITroADOozo/bVk
         3RR24DJpQDUxnJqfupZIw/meeyUoQ120UzhQP4/fevuzjLt1lEWt8IEldCxg7mQxgsta
         Aha25WCZZ/gc7MaeqmiciWpYwcsNmYpf+Zl0M201YWCAJu7Ez/9Fa6fZf8CdpsDaggcC
         sPMsPJZp9ciwcfq4v6bE0BnT0yp5q6Qq6CUMWCBMJulsMpLMVcmLGnFiNcnIewRsraaE
         XtxK0jm/a+Yb4TZBG9PH9a+SU6z52+BGVNu4p7hIe+ex4CZ+yfoqM3yrfZRayCYZAmOA
         ezWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=JOkt1Xq1yrsHfK/1NpnOnxpeuczROWMDFL17g6IfVAA=;
        b=XPqVjstYr3aFhr35e7wl034unS5hS0xeQQLUHGik5sXQv52rFC6QJPD05JvvQ0y7HC
         j1LA4+xgcw586AsLvs7GbSs6i/hx9B27Nm/yHjikaET2CExJNMODNORkOu2pulmpdnP/
         cPWBtXlGNCHiYFRBYPebKvjMqw5bVzUGnTpWPP9VGxy12t4kf09mIyOyJwX+8wnA4XQD
         bwuzNWUwnXWTThgNOoAoOk8ymv+ffwBp2bx8kvKlVo1suciCKITVC7J/lKmT5+yp9s0d
         IHTRPfC+abZITZeeynVo0NroL5pQVXVNBnFz/hC350tXV7kCML2Cv1oGPC13a2FWoyBx
         /ARg==
X-Gm-Message-State: APjAAAUGdL4kcG4cQFiCBJLu8KNElOkPglSts1vCFbvBHubIOf1SQ2Rh
        PIXJ8RjWeeR2pVejyOt0YYQ=
X-Google-Smtp-Source: APXvYqzdaNFWsM3zFbednYIknaU60A9528Id43oO8nAEdhY30GFnFt0YgFp5NBg0nx83Gr3h0aS3vA==
X-Received: by 2002:a17:90a:8914:: with SMTP id u20mr5249657pjn.111.1567285443314;
        Sat, 31 Aug 2019 14:04:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r28sm7774474pfg.62.2019.08.31.14.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2019 14:03:59 -0700 (PDT)
Date:   Sat, 31 Aug 2019 14:03:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 09/11] Input: alps - remove unlikely() from IS_ERR*()
 condition
Message-ID: <20190831210356.GI187474@dtor-ws>
References: <20190829165025.15750-1-efremov@linux.com>
 <20190829165025.15750-9-efremov@linux.com>
 <20190829175039.GA187474@dtor-ws>
 <20190831152500.eg7xqo5ace6wu427@pali>
 <762056d9c081c40f3fc760c9af79d6851f0a65e5.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <762056d9c081c40f3fc760c9af79d6851f0a65e5.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 31, 2019 at 01:32:02PM -0700, Joe Perches wrote:
> On Sat, 2019-08-31 at 17:25 +0200, Pali Rohár wrote:
> > On Thursday 29 August 2019 10:50:39 Dmitry Torokhov wrote:
> > > On Thu, Aug 29, 2019 at 07:50:23PM +0300, Denis Efremov wrote:
> > > > "unlikely(IS_ERR_OR_NULL(x))" is excessive. IS_ERR_OR_NULL() already uses
> > > > unlikely() internally.
> > > 
> > > The keyword here is _internally_.
> > > 
> > > https://lore.kernel.org/lkml/20190821174857.GD76194@dtor-ws/
> > > 
> > > So please no.
> 
> I think it poor form not to simply restate your original
> objection from 4 message levels below this link

Thank you for the lesson in etiquette, but I posted reference to the
very message I wanted.

> 
> https://lists.gt.net/linux/kernel/2269724
> 
>    Hm... I do not like this change. If I read code 
>     
>     if (unlikely(IS_ERR_OR_NULL(priv->dev3))) 
>     
>    then I know that it is really unlikely that condition will be truth and 
>    so this is some case of error/exception or something that normally does 
>    not happen too much. 
>     
>    But if I read code 
>     
>     if (IS_ERR_OR_NULL(priv->dev3)) 
>     
>    I know nothing about chance that this condition will be truth. Explicit 
>    unlikely in previous example give me more information. 
>     
> I alslo think this argument is dubious as it also applies
> to any IS_ERR and all the unlikely uses have been removed
> from those.

No, if you read the reference I posted, the argument does not apply to
all IS_ERR() instances. Majority of them are in probe() paths where we
do not really care about likely/unlikely. Here we are dealing with
IS_ERR in a [fairly] hot path.

Thanks.

-- 
Dmitry
