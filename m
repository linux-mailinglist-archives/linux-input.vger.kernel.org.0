Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEDA6B5426
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 19:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731092AbfIQR1E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 13:27:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46144 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731078AbfIQR1C (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 13:27:02 -0400
Received: by mail-pg1-f194.google.com with SMTP id a3so2346849pgm.13;
        Tue, 17 Sep 2019 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=08yIlGXulR0q2Y+P1WoRh1NvFrYBY1yujbeCgRRCU0A=;
        b=eDxJbcKR4jlox7gswt475JZ4rpnI1dLCj9qhLpgc5lfFD23Xh3Yw7he7kJJI7gHARu
         t9Xa2rqLu6XFDI6j+JhVL8CDgovZBT124eZtWS+TNsK4RxIwXhGzNM6vrFfWFOEIUupK
         FpECVIljdur8YyANBY7oAo80L57ini8bghlI1vSpOc+Isn610fXTRfRr+oFD5U5v2Lj9
         Us24zEMwzI32Qgowb/ARX/hv5zrtStNHNdkAlY78O8eljj9yhzxTJ6xmBUv09PK0pPKs
         ei252Jtz8WqhbwBwOMvbb8ZeC5osP+CPRAti0qipOlcGns6DfOQkT65iM85IiAdv7nYM
         tybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=08yIlGXulR0q2Y+P1WoRh1NvFrYBY1yujbeCgRRCU0A=;
        b=qFlSjPkuLbD3WEQriT5VE7DA6qOiplbl1S5r1vUdehhbkcqMThR0Md5FWl2JHTSdze
         m0N1M909jSeLNMB9LsEMSO/2Nls/EmoeQ+vlecMv5qbt5sZ8mgnjc5xwH1wPxuK2u5BV
         cnMgPF1i0U+AtaYdsiYfemfDpoclsx+sUIgPUPDVeNS2ZKnwpev95O2icS/k22xiTyk2
         GJAZTTimID8UTmtPH4jS3DuodlcvAHEjQQwu3dGydm95zaXjLeZkKNu9cN4refskpuHQ
         kTdjubNzHsH29eOPtVe2L1kgxbjJxymjXCXmJ8XbltAKcmcX1XHCCZofRwygveDIp7cH
         xc3g==
X-Gm-Message-State: APjAAAX0Vk9WHQVdOxZWnPcuxGiBzpnQ49gG/6H6FuY3LDSZYAZoTZI0
        tzFsgaQMyvFbv2gq5438YOf32101
X-Google-Smtp-Source: APXvYqw8MpsyR45p3gKRwP1ZTDs/Js1EX14w2ZLo+Kl/2c6vnzwLJ0mAYrZSumOxqEetT17OrLi/sw==
X-Received: by 2002:a63:1341:: with SMTP id 1mr7184pgt.48.1568741221327;
        Tue, 17 Sep 2019 10:27:01 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id g3sm2506675pjx.32.2019.09.17.10.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:27:00 -0700 (PDT)
Date:   Tue, 17 Sep 2019 10:26:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        bparrot@ti.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20190917172658.GQ237523@dtor-ws>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
 <20190917171814.owcttekv56xgmsts@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917171814.owcttekv56xgmsts@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 07:18:14PM +0200, Marco Felsch wrote:
> Hi Dmitry,
> 
> On 19-09-17 10:07, Dmitry Torokhov wrote:
> > On Tue, Sep 17, 2019 at 05:58:04PM +0200, Marco Felsch wrote:
> > > The default driver behaviour is to enable the wakeup-source everytime.
> > > There are hardware designs which have a dedicated gpio to act as wakeup
> > > device. So it must be allowed to disable the wakeup-source capability.
> > > 
> > > This patch adds the binding documentation to disable the wakeup-source
> > > capability.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt      | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > index 870b8c5cce9b..4d6524fe3cf4 100644
> > > --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> > > @@ -35,6 +35,10 @@ Optional properties:
> > >   - pinctrl-0:   a phandle pointing to the pin settings for the
> > >                  control gpios
> > >  
> > > + - edt,disable-wakeup-source: If left the device will act as wakeup-source
> > > +			      (for legacy compatibility). Add the property
> > > +			      so the device won't act as wakeup-source.
> > 
> > I think this is too ugly and I consider it being a bug in the driver
> > that it enables wakeup unconditionally.
> 
> That's right.
> 
> > Let's just update DTS in tree for devices that actually want it (I am
> > curious how many that do not declare "wakeup-source" have it working and
> > actually want it) and key the dirver behavior off the standard property.
> 
> There are a few DTS using this driver and the current driver behaviour.
> We need to keep the backward compatibility since the DTB is part of the
> firmware and firmware isn't always included during a system-update. I
> know its ugly but IMHO that's the right way to go to keep the backward
> compatibility. Let us see what the DT-folk says.
> 
> > Until we start seeing this controller in devices that actually have DTS
> > in hardware device tree I think it is better to use standard property.
> 
> Sorry, I didn't get you here..

What I was trying to say is that I have not actually seen DTB that is
part of hardware or separately upgradable frimware (not talking about
ppc or sparc boxes, but ones that might be using this driver). It is
always built into the kernel in my experience, so backward compatibility
is simply a tool that is being used to prevent us from being too wild
with hacking on bindings, but rarely a practical concern.

In cases like this I think it is worthwhile to simply update in-tree
DTS and arrive at a sane binding.

Thanks.

-- 
Dmitry
