Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87EABC2AA2
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2019 01:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbfI3XLs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 19:11:48 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46617 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727497AbfI3XLs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 19:11:48 -0400
Received: by mail-oi1-f196.google.com with SMTP id k25so12679557oiw.13;
        Mon, 30 Sep 2019 16:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=06F7PUGi7KU5AKcLl29ZsDl92GOwcK15ezbne47LRD8=;
        b=GzYwk3DJj7hUs/KNUE7FdtcflgQb9eyPsgSQNl+52EwuIKKG9P9GpkaInNI4GTJOC7
         UkfsPlsCjFizSvOJ19qHikfZBrsuWt1kZj+Tv831gwTRd5Kz2GwYRBBmgfs8q81tH87R
         IXfFSkZTRTkdEnuB88j6joPVGp5LNnZwDPrqEIJQbWKfb8/PdFqFuK9ISS7p+XQXhUEL
         +5nWhKev4Ne79pW+aVYFh2R+hAhc9nyv/BZORR7o6rCZnCv7fsQjdHFZ60tur3krowSp
         37/yZVE42p4KOuUVvHQKCkGZaPj8F/9dj2IP8kMSKuUZMnA6por+ouuHKrXGJlJTD6HM
         070w==
X-Gm-Message-State: APjAAAUFBrfu/LSYAWybpql7lYUbN2U9fObaE2L+L4g6iHYhCJOSfHc8
        q7F3iqwjwUi877oE3i2/BA==
X-Google-Smtp-Source: APXvYqzoKEn8xvPUfT6GBXrFmF4Lo3HvjKmN9mEcZJO1reEb+9MpmGeujmmTrovyF+eSEi5Vh8AK9Q==
X-Received: by 2002:aca:fcc2:: with SMTP id a185mr1304654oii.43.1569885107360;
        Mon, 30 Sep 2019 16:11:47 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s66sm4259026otb.65.2019.09.30.16.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 16:11:46 -0700 (PDT)
Date:   Mon, 30 Sep 2019 18:11:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        andriy.shevchenko@linux.intel.com, bparrot@ti.com,
        andy.shevchenko@gmail.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20190930231146.GA30010@bogus>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
 <20190917171814.owcttekv56xgmsts@pengutronix.de>
 <20190917172658.GQ237523@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917172658.GQ237523@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 10:26:58AM -0700, Dmitry Torokhov wrote:
> On Tue, Sep 17, 2019 at 07:18:14PM +0200, Marco Felsch wrote:
> > Hi Dmitry,
> > 
> > On 19-09-17 10:07, Dmitry Torokhov wrote:
> > > On Tue, Sep 17, 2019 at 05:58:04PM +0200, Marco Felsch wrote:
> > > > The default driver behaviour is to enable the wakeup-source everytime.
> > > > There are hardware designs which have a dedicated gpio to act as wakeup
> > > > device. So it must be allowed to disable the wakeup-source capability.
> > > > 
> > > > This patch adds the binding documentation to disable the wakeup-source
> > > > capability.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > index 870b8c5cce9b..4d6524fe3cf4 100644
> > > > --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > > @@ -35,6 +35,10 @@ Optional properties:
> > > >   - pinctrl-0:   a phandle pointing to the pin settings for the
> > > >                  control gpios
> > > >  
> > > > + - edt,disable-wakeup-source: If left the device will act as wakeup-source
> > > > +			      (for legacy compatibility). Add the property
> > > > +			      so the device won't act as wakeup-source.
> > > 
> > > I think this is too ugly and I consider it being a bug in the driver
> > > that it enables wakeup unconditionally.
> > 
> > That's right.
> > 
> > > Let's just update DTS in tree for devices that actually want it (I am
> > > curious how many that do not declare "wakeup-source" have it working and
> > > actually want it) and key the dirver behavior off the standard property.
> > 
> > There are a few DTS using this driver and the current driver behaviour.
> > We need to keep the backward compatibility since the DTB is part of the
> > firmware and firmware isn't always included during a system-update. I
> > know its ugly but IMHO that's the right way to go to keep the backward
> > compatibility. Let us see what the DT-folk says.
> > 
> > > Until we start seeing this controller in devices that actually have DTS
> > > in hardware device tree I think it is better to use standard property.
> > 
> > Sorry, I didn't get you here..
> 
> What I was trying to say is that I have not actually seen DTB that is
> part of hardware or separately upgradable frimware (not talking about
> ppc or sparc boxes, but ones that might be using this driver). It is
> always built into the kernel in my experience, so backward compatibility
> is simply a tool that is being used to prevent us from being too wild
> with hacking on bindings, but rarely a practical concern.

Well, that's self fulfilling...

> In cases like this I think it is worthwhile to simply update in-tree
> DTS and arrive at a sane binding.

Get the maintainers of the affected platforms to agree to the changes.

Rob
