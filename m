Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC2F1E24AD
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 22:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405590AbfJWUi7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Oct 2019 16:38:59 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35535 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405522AbfJWUi6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Oct 2019 16:38:58 -0400
Received: by mail-pl1-f196.google.com with SMTP id c3so10677864plo.2;
        Wed, 23 Oct 2019 13:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8f7IrMSbvpjFtXlpHUjBOlDC33yOIHb/ggFK6CJvudQ=;
        b=rl+hNwHrrNJWbqXWysGjgmJd07u5S7dOawxW+16SnKRivqM0nE2hpIZi/I/YJCYluj
         tF0zt1cFoQEMlcHoFfcVTnDEiUZ+DvjtdbskoQ/5dHsFxut7ys++v9rJaQ7lyCtPcAko
         yrV2L4hNKJ/s58ST1r1hMkwaBNIe7Ta7fP9psD3VB6lLqhH78feycvVqlNy/VObGVKm1
         lUvmM7h7gh9daVNbkPEBO6dETUZ8JO82WLHkxcDYT9LT4tVyFHL5x4zT9ZK3xLUibm7T
         dDSwWba9Yng/kKk6obZHjFRs9pZ8PpBXXb1W5pPjJ4/qUXy3OIhYXZPMKhsyTHT/ZbPt
         EiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8f7IrMSbvpjFtXlpHUjBOlDC33yOIHb/ggFK6CJvudQ=;
        b=OiqRIeAHp3NpsQ3n9UQaQIz1vAtPgh1UkjxWGYH/ylHR3dspw9j3MpmP7LKLUC1k6+
         7KrEHOePE9QiyVQ9K35P7JW6pyFeR5D+ToYQ9XLOwhmEPx244ka50KaKxlQJgOwmUmJm
         TQwgXhLFFMPpxj1BUdihsoPL+AKrbJBp7NP2HSTLNKWyIO5GFNZuwi5HWcPI4rtCJ6eV
         BiJJbvqFETg+KOSyuLLGXrvdC39ZkOQ/db7YFjGGDFouDmRrzTsi6TF4oNwuCIAUVh2M
         2X9qipSMtuOKRM/jbel9QNkye7HORnJ/41MWKHXtgya2xc8a5FYND0+Yb0EJNFV/QOyA
         E2rg==
X-Gm-Message-State: APjAAAWdQfR95LIv1HDIuwg57EzTYlQZTtuNv5c7ovEJCwMU/+1med9U
        K3qWnt2P/Ear2mUTpQ3qbVk=
X-Google-Smtp-Source: APXvYqxxcOo/N/Ts5Kn7Xbngib0ACRwQkI5C0/N3SZevK2fTaSvoZnR2fbc5v23KwQOs3Q4spFPelw==
X-Received: by 2002:a17:902:8a96:: with SMTP id p22mr11488782plo.272.1571863137832;
        Wed, 23 Oct 2019 13:38:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id f14sm30248243pfq.187.2019.10.23.13.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 13:38:56 -0700 (PDT)
Date:   Wed, 23 Oct 2019 13:38:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Helge Deller <deller@gmx.de>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-parisc@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: hp_sdc_rtc - remove dead chardev code
Message-ID: <20191023203855.GZ35946@dtor-ws>
References: <20191023142521.3643152-1-arnd@arndb.de>
 <20191023152222.GP3125@piout.net>
 <50a48356-294d-516d-6448-ee06273fd014@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50a48356-294d-516d-6448-ee06273fd014@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 23, 2019 at 09:06:29PM +0200, Helge Deller wrote:
> On 23.10.19 17:22, Alexandre Belloni wrote:
> > On 23/10/2019 16:25:02+0200, Arnd Bergmann wrote:
> > > The driver contains half of the implementation of /dev/rtc, but this
> > > was never completed, and it is now incompatible with the drivers/rtc
> > > framework.
> > > 
> > > Remove the chardev completely. If anyone wants to add the functionality
> > > later, that shoudl be done through rtc_register_device().
> > > 
> > > The remaining portions of the driver basically implement a single
> > > procfs file that may or may not be used anywhere. Not sure why this
> > > is in drivers/input/ though.
> > > 
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> A year ago I did actually converted this driver to the RTC framework.
> But after some testing on my physical box (a 715/64 PA-RISC machine
> with HIL connector) I realized that the SDC in that machine doesn't
> provide a functional RTC, and even more important, on that box we don't
> need this RTC because the system provides a built-in RTC on-mainboard instead.
> So, I never pushed my changes upstream, which can still be found here:
> https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/commit/?h=hp_sdc_rtc_conversion&id=0d4250dbcfa2bb8b326ce7721e19e10a66f1eb92
> 
> So, I don't think any PA-RISC machine needs this driver, and as such
> I'm happy to give my:
> Acked-by: Helge Deller <deller@gmx.de>

Applied, thank you.

> 
> I even think the whole driver can go away...
> 
> Helge
> 
> PS: Maybe some really old 68000-based HP machines needed that, but
> I don't know if any recent Linux kernel runs on those old boxes any
> longer...

Well, if you think it is unlikely that we need this driver just send me
a patch. We can always restore it if someone yells.

Thanks.

-- 
Dmitry
