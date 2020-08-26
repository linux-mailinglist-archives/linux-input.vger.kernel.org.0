Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D51253475
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 18:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgHZQM1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 12:12:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgHZQM0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 12:12:26 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A09C061574
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 09:12:26 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h2so1113746plr.0
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 09:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vCC6VIFL/8vbneGa9TCjtGewPaPoIkGUkGSrSp6SBYo=;
        b=mU5mHLFBrcL9FdlRJXV9jmQ7l9CKe5sTWfuDpXyIsG9XMqa5OcqzzjHQO/QOPY36DG
         gbA0EpMvlFVHU977sKx0d62vlrUbcRnqo8G4zbC3jrNfSRj5qNIcmJ0Xn3PW1lD9Up7B
         TKpSzrOZBMsUz0FQ5gnnkWDvLlWKQ/IXSYppCGC/wcaIyPwt6kBHXIkRMIfyyoXc3RTM
         TQVmRfZMRPJyNlLLyujTPMoCkWoeinnBXUj9ZnfJRTOphjAphQWnx8K8KXmGmDTb9SNT
         bJaTli1KLZul4XhVsV1H3JESdakCzAcAYSsAHPR80BfHKk2vx9Yn7i5dpu/WRKe65w7x
         6x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vCC6VIFL/8vbneGa9TCjtGewPaPoIkGUkGSrSp6SBYo=;
        b=oa0oC7cWmWnOGEYbNIHGpPD3WDOWHLbIQO4c6HTrdKGGIy8NO2PUBKlgrmKxLpaCWR
         uNLZQT1EC/9C+6F5ke/fsrDa0Wi0K2sJr4yQZ50nKdb+GFmpP2wsuuF46QKp8RqMfluG
         +62DNFvTf3y59B3FPMD2CpKJkZiGBLhx6ZiJ9d0jkC1VdMoZ4mjECitQvVDzCMv8j1sR
         CWZhLPW4GNhluSy+gaVG9hQhW12OrNoUuXO2LxG1QQ8LCA0Xyxh85VI9iSAi7unoELKE
         yKrRMS4g40ZLtEVMBaKKoCpwMgkHflhAoWGTU8U+L7Em4lCKSCw+YPIjWR7F0SJfrewB
         379w==
X-Gm-Message-State: AOAM530PuDtbcnHmvfCSq1tqlsgpg6HfdbIM8vxLiUhWifxYx1M3dN2+
        p+9bzGLSdso4EQEPT6c+Zpw=
X-Google-Smtp-Source: ABdhPJyhmcLJ1YQ8U2/6jG0tg/PsMPw8FeQRjej1dJ1/x8O375Ov5EU269+O2J2jB2V4gxy9yn8P0w==
X-Received: by 2002:a17:90a:c715:: with SMTP id o21mr6510642pjt.41.1598458345412;
        Wed, 26 Aug 2020 09:12:25 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q25sm3452093pfn.181.2020.08.26.09.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:12:24 -0700 (PDT)
Date:   Wed, 26 Aug 2020 09:12:22 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/5] Make gpio_keys accept board descriptors
Message-ID: <20200826161222.GA1665100@dtor-ws>
References: <20171124093045.5961-1-linus.walleij@linaro.org>
 <20171125233324.afdt4netamvkrkm2@dtor-ws>
 <CACRpkdb6kt8Bb0FnPoixw97R9oktK9h3uTS7JfdxoCKfLo4yhA@mail.gmail.com>
 <20200826143543.GC813478@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826143543.GC813478@kuha.fi.intel.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 26, 2020 at 05:35:43PM +0300, Heikki Krogerus wrote:
> On Wed, Aug 26, 2020 at 03:20:14PM +0200, Linus Walleij wrote:
> > Hi Dmitry,
> > 
> > On Sun, Nov 26, 2017 at 12:33 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Fri, Nov 24, 2017 at 10:30:40AM +0100, Linus Walleij wrote:
> > 
> > > > The goal I'm working toward is to rid the kernel of the global
> > > > GPIO numberspace.
> > > >
> > > > This means GPIO lines should be references by the local offset
> > > > on the GPIO chip.
> > > >
> > > > This patch set starts to move gpio_keys toward using GPIO
> > > > look-up tables instead of global GPIO numbers to find their
> > > > GPIOs.
> > > >
> > > > As an example I did (I think) the necessary patches to
> > > > convert DaVinci and i.MX to use this. There are several users
> > > > also x86 platform devices.
> > (...)
> > > I think this is a worthy goal, but I wonder if we could get static GPIO
> > > descriptors work with fwnode_get_named_gpiod() so we could retire the
> > > platform data parsing altogether. We'd need to extend static device
> > > properties to have notion of children though.
> > 
> > Do we have this now? I've looked at Heikki's et al work
> > on software nodes but I cannot see whether we are there now.
> > 
> > We have fwnode_create_software_node() and friends, but
> > I haven't seen if this can be used with input and GPIO descriptors
> > are still a bit on the side. I can create a lot of properties but
> > not really add a descriptor table as a software node as far as
> > I can tell. I'm also a bit lost on whether it will be possible
> > to get there sadly :/
> 
> I'm sorry but I'm not completely sure what is this about? Are software
> nodes still missing something that would prevent us from for example
> using them to describe the GPIO information exactly the same way it is
> described in DT? I don't know if that is what we want, but I'm just
> trying to understand what is still missing? Dmitry?

No, my changes to improve the fwnode handling of references have landed,
a while ago, so now I need to refresh the series of patches to gpiolib I
was working on around Plumbers time last year. Linus seemed mostly OK
with them, so it just a matter of finding time and picking this up
again.

Thanks.

-- 
Dmitry
