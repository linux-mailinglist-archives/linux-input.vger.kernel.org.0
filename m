Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CAB419C7
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 02:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405497AbfFLA7R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Jun 2019 20:59:17 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33364 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404906AbfFLA7R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Jun 2019 20:59:17 -0400
Received: by mail-pg1-f196.google.com with SMTP id k187so7427288pga.0;
        Tue, 11 Jun 2019 17:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/PPIjQFyfTkfzuR15arYhai8Ecn9PF3DgttDvytbBEs=;
        b=fRbpPbZmWMBO2LmKWljmW5qW2yJisw3oJ6EHD64jrKLYLIkx4A4CNJVQDgILcAoOf/
         /R00cHT/1+MPVpakLW6g29V8UCcAHYY366Gia3aQhX/vpqjLv01eA2LGqAjCmIkMG17q
         7De/HRdIf0hGPWEvoboV00jrHzbOPCsckHhxMzXgqX+Xt78ncLv0JnhALTAM24Lg+Fpf
         t5cPOa37iZkEJJ08ZEPRx8wU7C3Ng9AQP6gYMRtKnUpbYlU0/du7YSk8gT0KG7XoKwXD
         7Qakh3qE91hTIJnJdWgWCpzJKHrdyW47QKl+fY1jpaR2NUNEmaji4dvI5xNY+HzT4+9C
         BjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/PPIjQFyfTkfzuR15arYhai8Ecn9PF3DgttDvytbBEs=;
        b=jCUbGGXYNYyJgx9wZ2DH64iYma199SzcdcpEaK6av+1C7EH5fnXbVdrbj1soBZ4p4Q
         QikGMe8Y+jOhlQeUaTh18JrdMrYO9J644g9ySNobkUtp0++zwyHfUYwCWzBahqS1zrH5
         dJOShnwCrXlbYu4RhKW1BKiYks7NV0J2GLDq8najMdfwS613u4x2Ac61bLQM3Kp4t+0y
         od2JY/WXdcNU9eKgcszAgbX8tG0RHiQuOJjsZYAx0bpp1AKAi/RmGKbeDWkxpkcqbkQ3
         KAHqVI9TPf/BSRZfQHzxXKCTzZzibCMynMFYmpwStrY1yRKrsKo3rRZM2ITqwClSbL4y
         j1Ww==
X-Gm-Message-State: APjAAAWE3n4+qSXB/9Dsx4lviYkq0ZecQCHS0E3wBmdz8+Cc4U1UpKUD
        1RYDAO/Z1/XBVnmeAf2Wukc=
X-Google-Smtp-Source: APXvYqwuxEGCVtjkQGENZNWYuWf2GznvMIcBahV96dW1H6qlzZ2xG8KkHCZIsfB9Q0bS/K1mmdKrxw==
X-Received: by 2002:a17:90a:bc08:: with SMTP id w8mr30345882pjr.45.1560301156268;
        Tue, 11 Jun 2019 17:59:16 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j19sm12544044pfi.72.2019.06.11.17.59.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 17:59:15 -0700 (PDT)
Date:   Tue, 11 Jun 2019 17:59:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: alps: Drop unlikely before IS_ERR(_OR_NULL)
Message-ID: <20190612005913.GJ143729@dtor-ws>
References: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
 <20190605142428.84784-5-wangkefeng.wang@huawei.com>
 <20190605144240.pfrvlgxsdpacpwxf@pali>
 <36eac452-5477-3670-7980-765d0879ead4@huawei.com>
 <a1908a998b6d1d1e4cdd097a50b9c9ac9b00caae.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1908a998b6d1d1e4cdd097a50b9c9ac9b00caae.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Wed, Jun 05, 2019 at 07:28:53PM -0700, Joe Perches wrote:
> On Thu, 2019-06-06 at 09:08 +0800, Kefeng Wang wrote:
> > On 2019/6/5 22:42, Pali Rohár wrote:
> > > On Wednesday 05 June 2019 22:24:28 Kefeng Wang wrote:
> > > > IS_ERR(_OR_NULL) already contain an 'unlikely' compiler flag,
> > > > so no need to do that again from its callers. Drop it.
> > > Hi! I already reviewed this patch and rejected it, see:
> > > https://patchwork.kernel.org/patch/10817475/
> > OK, please ignore it.
> 
> I think the stated reason of better readability isn't
> particularly sensible as the object code produced is
> actually slightly larger.
> 
> x86-64 defconfig (gcc 8.3.0)
> 
> $ size drivers/input/mouse/alps.o*
>    text	   data	    bss	    dec	    hex	filename
>   29416	     56	      0	  29472	   7320	drivers/input/mouse/alps.o.new
>   29432	     56	      0	  29488	   7330	drivers/input/mouse/alps.o.old

If gcc produces worse code for double unlikely, you should probably
report it to gcc folks, no? Or double unlikely turns into likely?

> 
> Also if this unlikely is _really_ useful, perhaps the
> !IS_ERR immediately after could also use likely as the
> test seems only done for an OOM condition.

No, once you take the IS_ERR_OR_NULL(priv->dev3) == true branch it stops
being hot path and additional annotations are completely unneeded.

And if we failed to create and register priv->dev3 device - that's an
error and system is degraded. Can't do much here.

Thanks.

-- 
Dmitry
