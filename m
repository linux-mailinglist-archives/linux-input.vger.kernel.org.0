Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D982AF59B
	for <lists+linux-input@lfdr.de>; Wed, 11 Sep 2019 08:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbfIKGJC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Sep 2019 02:09:02 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38616 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbfIKGJC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Sep 2019 02:09:02 -0400
Received: by mail-pg1-f196.google.com with SMTP id d10so10971853pgo.5
        for <linux-input@vger.kernel.org>; Tue, 10 Sep 2019 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hC0SHuDjU8XAa36ILPAtmNCLbS8BSxPkEi/m0Il2T6A=;
        b=pOSUzC4PEcD/6B2Tn2z7TUae3zGLlJQDnFcdtSTHayWE48nAzfgTXKu99EN4ze21Fm
         73OmASw3Qq+CQncPSHWNcLLOSOzn9npDKOrS8gua+/3vu9xf8Hk8ayryzY64dMM/sN7R
         KCS0CItJU7xxeO8jgNW+GClFx9JwfEwEfR3ru4g5FtJtjBBDQanjAUFRMXvE6eBz0xuW
         QHZeHoh6MZK166TCfWYmSYaAr4fnGK8Uv87cOqRXfKPhR6bdrh3+s7vGZ470ClgtgxlS
         714n94Aq25MANft0B5iX7y5++Yd7BAEGvs7pkgg8iuGI8gVUKbwVllFYJyJFuBFXsZkh
         Se7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hC0SHuDjU8XAa36ILPAtmNCLbS8BSxPkEi/m0Il2T6A=;
        b=lJkjqON1KILes6Vh8KtNX5r+q+ODY5iMecy6SqmrjpSHmbxQY7Il5SjEPP7JVRLaTO
         HtqfqaCT6WYyCplk2BtpPrOxAW8MipME2yxSMpgAsWpOx4ExPIANaWbUf+NeGRZR0op4
         jB+PlM7kx4SmuEtvxOt8nVwYPqxfRru2Shti8RLUx0wKO9NxZAg1z0JPzGKbQ/2A4uJ0
         NPQo4+M8cnQMYZ8iP2M01AamPX006SqnjOljgIz8aPj2ZUcN7KRRjuJ3l1K3wkUQNrA3
         d9zc/jS9KaVPxTv7ZeMu1282gtPDi2hbG4vKqIXjEKydQDJaX5EOMoXeTmfCWpr8ZPlY
         EF5Q==
X-Gm-Message-State: APjAAAU/I3NZ0nO6JBdD0l6xSO0CNxrgNRhrPQ0GwP62cbh06d0P1qtn
        OIOpe4Cj6mJOQ/Rj5T+ItJM=
X-Google-Smtp-Source: APXvYqy9sz/TskbGdZV0KhbV/bRTQoW6eKeykWcZ9VHU2h/VLlB0If3ANaSnSOXsXcEXKyzf8IGVGw==
X-Received: by 2002:a65:4243:: with SMTP id d3mr32304055pgq.119.1568182139818;
        Tue, 10 Sep 2019 23:08:59 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id bb7sm1408121pjb.2.2019.09.10.23.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 23:08:59 -0700 (PDT)
Date:   Tue, 10 Sep 2019 23:08:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kbuild test robot <lkp@intel.com>, kbuild-all@01.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Subject: Re: [input:next 2311/2342] arch/arm/mach-w90x900/dev.c:38:10: fatal
 error: linux/platform_data/keypad-w90p910.h: No such file or directory
Message-ID: <20190911060857.GE145199@dtor-ws>
References: <201909071756.9uCG4IvK%lkp@intel.com>
 <CAK8P3a3AtpcpAkwMgLwWTJO7yaHKAk5d5eBnYZk3TM4AWyiCgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3AtpcpAkwMgLwWTJO7yaHKAk5d5eBnYZk3TM4AWyiCgQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 07, 2019 at 02:41:32PM +0200, Arnd Bergmann wrote:
> On Sat, Sep 7, 2019 at 11:17 AM kbuild test robot <lkp@intel.com> wrote:
> >
> > tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/dtor/input.git next
> > head:   410f25de467ee94c1a577c6ee7370c37b376c17c
> > commit: 060157e1dbc133075a2e20786d6ff6d4b41909f9 [2311/2342] Input: remove w90x900 keyboard driver
> > config: arm-nuc960_defconfig (attached as .config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 7.4.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout 060157e1dbc133075a2e20786d6ff6d4b41909f9
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=7.4.0 make.cross ARCH=arm
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> arch/arm/mach-w90x900/dev.c:38:10: fatal error: linux/platform_data/keypad-w90p910.h: No such file or directory
> >     #include <linux/platform_data/keypad-w90p910.h>
> >              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    compilation terminated.
> >
> > vim +38 arch/arm/mach-w90x900/dev.c
> 
> Ah, right: this happens when we remove the driver before the platform.
> As both are queued for 5.4, I'm not worried about it at all.
> 
> Dmitry: if you'd rather avoid having this in your tree, I can instead merge
> it through the arm/soc branch on top of the removal of the platform code.

I think it is fine if we leave it as is for a few weeks, and then we'll
sync up and it will go away.

Thanks.

-- 
Dmitry
