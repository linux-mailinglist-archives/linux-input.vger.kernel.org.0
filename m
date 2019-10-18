Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB03DD081
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 22:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388090AbfJRUjG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 16:39:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:36167 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732271AbfJRUjG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 16:39:06 -0400
Received: by mail-pl1-f193.google.com with SMTP id j11so3404320plk.3;
        Fri, 18 Oct 2019 13:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sA9QYMiGhI7MttA/PLlqrtMzG0s83akjTEVC2Hk0Y0Y=;
        b=DN5MEvFgVMu4M4/XCLw9BRIhFBFz5/fxRslD8rf+iBz/h2hn6x8mBLdHOrnXuEO4cf
         vCZZ3UVlc1wh7a40ehAmlIXKkUx76Z/vfG+pIworaMVo9p1R2FuXCucWWS84hmof1jfX
         hBEPTm5IBCXfvNU9ZsmPS3MVRpbXxmym8TAwhZ7tHD9vtpbt99ui/Qb+DwxKB69ExLRQ
         S8dDorBNDNK51e8KQpVTnyU1cXa/9sijPaH20LMzhui9CVrfHwVpiDXjMsMciohHfbMu
         eHVms76z/2lQhmX9raIBDs5TQGc1rIGb2eMvJS1W8RDwF9Oe8fWetD//OkFfRZ9eV/2E
         boRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sA9QYMiGhI7MttA/PLlqrtMzG0s83akjTEVC2Hk0Y0Y=;
        b=adt3gNuqyt/lMmjK2iQp1upxDqVHEKv+i95fjo/dKCJGDydSlbnjutW8RsxCsvhDNn
         yPWhcdU73yTUgY9RXcvqusoS17YO+3Brr13q2MIB+gTDPcfvj4s34yYEpe4R2PBjoNd/
         JZyaN8XuuyjZkCJ95B3Z4Gd03Jju55i0o6dKrJ9XX4l65Qw0bMUJjp4Fr6pasWHMfPO2
         87rfCZnh80uaaEw4qylRlEacE9PL4tWnpRrv+M2HcZgqVdMWTLnX6elyWLXinZBZHanV
         D440aPJMDMrKz7++3aaxdzB01vv8ZCgt+LQQq/rJELUDA1zioEh1KPByJ+1VcptJLdvm
         UMrQ==
X-Gm-Message-State: APjAAAWgBtzq4oVvlk5l7J1hh/rOokuwIW/yKswYODKY8sk9TfKLh8Hb
        +bCrrauCjsGQa+ey246ja0g=
X-Google-Smtp-Source: APXvYqyIxdE8kbIPAupy1VRv2Z5sSpuL6L3+Lx1OQzb/YVFns+e38GVIZHMuR66stuh9mPN8FKSWQA==
X-Received: by 2002:a17:902:ff14:: with SMTP id f20mr1803901plj.216.1571431145094;
        Fri, 18 Oct 2019 13:39:05 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id 196sm7859249pfz.99.2019.10.18.13.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 13:39:04 -0700 (PDT)
Date:   Fri, 18 Oct 2019 13:39:02 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Subject: Re: Fwd: [PATCH 29/46] Input: touchscreen: use wrapper for pxa2xx
 ac97 registers
Message-ID: <20191018203902.GQ35946@dtor-ws>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-29-arnd@arndb.de>
 <20191018184815.GP35946@dtor-ws>
 <CAK8P3a27==9TeS-RWEvrpnxh+6McqRF-xeb8WPj9pHOn+0zbOQ@mail.gmail.com>
 <CAK8P3a0AP8q9Hk1DB+E=xFGV5RqXnkjkcZRobgU1NRDFMH00AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0AP8q9Hk1DB+E=xFGV5RqXnkjkcZRobgU1NRDFMH00AA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 09:39:31PM +0200, Arnd Bergmann wrote:
> On Fri, Oct 18, 2019 at 8:48 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, Oct 18, 2019 at 05:41:44PM +0200, Arnd Bergmann wrote:
> > > To avoid a dependency on the pxa platform header files with
> > > hardcoded registers, change the driver to call a wrapper
> > > in the pxa2xx-ac97-lib that encapsulates all the other
> > > ac97 stuff.
> >
> > Not supper happy about adding module dependencies. Can we include
> > mach/regs-ac97.h from include/sound/pxa2xx-lib.h and use static inlines?
> > Someone needs to include mach/regs-ac97.h in the end...
> >
> > Or there is something later in the series that needs it?
> 
> One of the goals of the series is to completely remove all mach/*.h headers
> and place them somewhere else, ideally inaccessible to device drivers.
> 
> In case of mach/regs-ac97.h, the later patch "ASoC: pxa: ac97: use normal
> MMIO accessors" passes the physical register base address as a platform
> device resource that gets ioremapped in the ac97 driver, rather than
> hardcoding the virtual address in a global header.
> 
> I agree that the exported function is still ugly, but I hope it's enough of
> an improvement over the previous state that we can do it anyway.
> 
> If you have any better ideas though, I can give that a try, too.
> One possibility would be a higher-level interface exported on top
> of 'struct snd_ac97', but I could not figure out how to do this.

No, I do mot really have better ideas given your stated goals and I
guess there is not really much benefit on spending too much effort
polishing essentially one driver.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry
