Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D2D41D47
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 09:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405266AbfFLHOt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 03:14:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40097 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408001AbfFLHOs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 03:14:48 -0400
Received: by mail-wr1-f66.google.com with SMTP id p11so15634626wre.7;
        Wed, 12 Jun 2019 00:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=G3Zep49WMIUsIvEAAzPZd7aGwgY5s3kxqA8JCa4j+gc=;
        b=gILw5H6DZdxsFFgWh6hXWZnntDgjLGrkLuYKCZTbfJuOWtMvFadGP+y+K9IlMLAU+n
         5IfvOzEWs8V/GGY5/9LS2VAsps/ikQK4pZjn2lq25yC/KP/bjN5G+kHIDZylUy1IcjSS
         RZu3t2rzkGZED3jq0NvPh4uHsMkAn3SaG7UM9Zy+evez+ML4Zke1yFqRuPA6DtJoWFxq
         ZHrYwER6h8FeEl1q2bfWi6zMdgqYdLf40gkxZ5renpcH+hNzDgbxoU5rV7X3NJhbJwUW
         wSa0JI9AiOFiT9aSGxJz0k9s1540jy2aUi4BdDDrvXBVFsV038RjYlUfzNChXj+5s6YZ
         HLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=G3Zep49WMIUsIvEAAzPZd7aGwgY5s3kxqA8JCa4j+gc=;
        b=uc330oXyQdaCuAJIbehoN9++xz6dj+U+MdaXuhDiNx79lrsV0b54oU+1T8iF6SuGT0
         Z8LtRbCziBXZHN5Zbh0Z8o14WOwwtgC1bCEpmGGoSTgRFiPmr66TgsFJa8CxJgbgchen
         Q2w8tcNimHn0z9CGgTRbPdNo1oZP4qhrIdTOxRATzFYT/K9pTkbLs3rBW5NFzxnDURT0
         bsg+R6+PGMDIgBZoMW/hsYEM+WsS0+P5LGp42qHYhQ96Vz62nFC5EOHMQdnkcn1n0DBu
         +azmhc9JfR/N1udHCukBpaAJ5WV/MP7XBdm+LnIlwb+ZdU92C8HoaWfOFmQwbv1klvNX
         Qlcw==
X-Gm-Message-State: APjAAAWJHsz/NrY44KMZE9dw4sucCPE53ynKG5ZyxfzBy9nh+UWXvssO
        HktNWcNvKTZBOBFQPIPkb/A=
X-Google-Smtp-Source: APXvYqzVLK0F28+fxDSHF8F46SEt+7QEUriAkxmk532TNptWZ33Lq2rHIiUiYEPBFJjPy0FvW35phg==
X-Received: by 2002:a5d:4086:: with SMTP id o6mr3456746wrp.185.1560323686520;
        Wed, 12 Jun 2019 00:14:46 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z17sm14336475wru.21.2019.06.12.00.14.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 00:14:45 -0700 (PDT)
Date:   Wed, 12 Jun 2019 09:14:44 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Joe Perches <joe@perches.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: alps: Drop unlikely before IS_ERR(_OR_NULL)
Message-ID: <20190612071444.5uih6em5o73dbvtf@pali>
References: <20190605142428.84784-1-wangkefeng.wang@huawei.com>
 <20190605142428.84784-5-wangkefeng.wang@huawei.com>
 <20190605144240.pfrvlgxsdpacpwxf@pali>
 <36eac452-5477-3670-7980-765d0879ead4@huawei.com>
 <a1908a998b6d1d1e4cdd097a50b9c9ac9b00caae.camel@perches.com>
 <20190612005913.GJ143729@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612005913.GJ143729@dtor-ws>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tuesday 11 June 2019 17:59:13 Dmitry Torokhov wrote:
> Hi Joe,
> 
> On Wed, Jun 05, 2019 at 07:28:53PM -0700, Joe Perches wrote:
> > On Thu, 2019-06-06 at 09:08 +0800, Kefeng Wang wrote:
> > > On 2019/6/5 22:42, Pali Rohár wrote:
> > > > On Wednesday 05 June 2019 22:24:28 Kefeng Wang wrote:
> > > > > IS_ERR(_OR_NULL) already contain an 'unlikely' compiler flag,
> > > > > so no need to do that again from its callers. Drop it.
> > > > Hi! I already reviewed this patch and rejected it, see:
> > > > https://patchwork.kernel.org/patch/10817475/
> > > OK, please ignore it.
> > 
> > I think the stated reason of better readability isn't
> > particularly sensible as the object code produced is
> > actually slightly larger.
> > 
> > x86-64 defconfig (gcc 8.3.0)
> > 
> > $ size drivers/input/mouse/alps.o*
> >    text	   data	    bss	    dec	    hex	filename
> >   29416	     56	      0	  29472	   7320	drivers/input/mouse/alps.o.new
> >   29432	     56	      0	  29488	   7330	drivers/input/mouse/alps.o.old
> 
> If gcc produces worse code for double unlikely, you should probably
> report it to gcc folks, no? Or double unlikely turns into likely?

Is measured size of stripped or unstripped binary? Plus with or without
debug symbols? Double unlikely version should have more debug symbols
and therefore also larger size.

But if unstripped version with double unlikely is larger then it is for
sure compiler bug.

-- 
Pali Rohár
pali.rohar@gmail.com
