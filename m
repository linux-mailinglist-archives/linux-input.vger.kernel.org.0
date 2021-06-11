Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32D3C3A48B8
	for <lists+linux-input@lfdr.de>; Fri, 11 Jun 2021 20:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbhFKSfl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Jun 2021 14:35:41 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:41502 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhFKSfl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Jun 2021 14:35:41 -0400
Received: by mail-pf1-f169.google.com with SMTP id x73so5134377pfc.8;
        Fri, 11 Jun 2021 11:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pAPGs1LNbp3j6HV6z8Xo20/Fw8JrM4KOovl5BHElSDk=;
        b=mnZQhThDrehxSOK3GoYzr5ibsg0sLrjm+4nzpjwtKt8xIL+QZXYdRaszlCUQs3s32V
         ZcJ8A3VkNqH+JTUKeQjjwo6izIna7960c3CHKJksdopBJ3SCwcxAS0pEN2m8kJwgBiFi
         JVDxR4+UwhjFQBd59wSAbhgQv5ui6Oh3yk8ziGsqBe+uvUNXGWSQ0nnRTkewm0i+zc0M
         r3Uy+A9RhjGDmihkuV5BhI64f95P+CFaH0GHRnAMpCxM407zp5N5C0XJczyh/ecKXJ7F
         prLWqRzq6VO2kqi5RisfxyOlSPMxBEs9FEdrLl8wDmRFceNCMuGxi4zUxlnR7u+Ox9bS
         eVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pAPGs1LNbp3j6HV6z8Xo20/Fw8JrM4KOovl5BHElSDk=;
        b=rQuSkqmVLG5jmtB4RiQTkN9tkl9J7X9lQCTZUBZBSmpQGOtgvfWsSGvNeKNow6W/iY
         jtOtY9un5Yp52ySVsqGWxiuEJ4TDo1GrSj+DO4i7bfbNpva0FKjfvSWc4uqXsbHEbZJO
         8MmH8xrm+nD0BMMiQfmdRAfMXEhZioxQmEA7M1o7BNxJiAyaEd8jF7b8fp91MPoZez6/
         nJBJpUp7d6BEk/2IEcD2qoU79bAJVa0ulsoroptu3Xpt6BXuluhBeI8EAD61SBmYV1vA
         YTLMCKpp7pOaUyClVN6/NGkrVC80Zf7/91uiKjkznhB5WHsc+qB5SaipD81UY57vvTaa
         tmiw==
X-Gm-Message-State: AOAM533JC80HTe9b9b+kzHx6H+2vWrn3Tki+BJFNG5pk3eO4HuuLG7Ze
        tzKLkcvNMF9kgpvd4RU9kWk=
X-Google-Smtp-Source: ABdhPJyIbJDNOi6dyFmAlH/mze2ZGBMW8H3yahSB2BamCGGUDK69YX2Q8ST0cS+t+ovPFsbVooKDpg==
X-Received: by 2002:a63:e205:: with SMTP id q5mr4944767pgh.404.1623436363271;
        Fri, 11 Jun 2021 11:32:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a379:e0b0:67f9:6c5f])
        by smtp.gmail.com with ESMTPSA id p1sm5544765pfn.212.2021.06.11.11.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 11:32:42 -0700 (PDT)
Date:   Fri, 11 Jun 2021 11:32:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Vasut <marex@denx.de>, Rob Herring <robh+dt@kernel.org>,
        Joe Hung <joe_hung@ilitek.com>,
        linux-input <linux-input@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: input: touchscreen: ilitek_ts_i2c: Absorb
 ili2xxx bindings
Message-ID: <YMOsRzfDnZ/iApwD@google.com>
References: <c381ee2526074e02b6058c489f85cfdaee582713.1623419587.git.geert+renesas@glider.be>
 <9b1b2a44-348e-5453-d767-d5c69a0869a7@denx.de>
 <CAMuHMdXE0kipUm6wqHsrFurFkviU_nRJJB7cg6z1XwEvpEewGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXE0kipUm6wqHsrFurFkviU_nRJJB7cg6z1XwEvpEewGQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Geert, Maerek,

On Fri, Jun 11, 2021 at 08:23:10PM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Fri, Jun 11, 2021 at 4:20 PM Marek Vasut <marex@denx.de> wrote:
> > On 6/11/21 3:54 PM, Geert Uytterhoeven wrote:
> > > While Linux uses a different driver, the Ilitek
> > > ILI210x/ILI2117/ILI2120/ILI251x touchscreen controller Device Tree
> > > binding documentation is very similar.
> > >
> > >    - Drop the fixed reg value, as some controllers use a different
> > >      address,
> > >    - Make reset-gpios optional, as it is not always wired.
> >
> > It looks like there are now two drivers for the same hardware,
> > drivers/input/touchscreen/ili210x.c
> > drivers/input/touchscreen/ilitek_ts_i2c.c
> > The ilitek_ts_i2c (newer) seems to be derived from the ilitek example
> > code / driver, while the ili210x was written from scratch as far as I
> > can tell.
> 
> I'm not so sure they're for the same hardware, but you may know better?
> https://www.displayvisions.us/fileadmin/html-seiten/eng/pdf/zubehoer/ILITek_TP_Programming_Guide_V1.50.pdf
> lists only Ilitek parts handled by ilitek_ts_i2c.c.

Ilitek folks said that the new driver is for their "Lego" series
controllers, whereas ili210x.c is for older hardware.

Thanks.

-- 
Dmitry
