Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B35A044460
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 18:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404066AbfFMQgh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 12:36:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45657 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730673AbfFMH2K (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 03:28:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id f9so19501964wre.12
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 00:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6NtZ5awJS1Cs7Ve+i+/MsF9Xj1RnmQVjFKJj055oDBs=;
        b=gDLmFavItyk9U71onYiZRwLHzRXMvsl3L2pWq3wJpNF03VwVv8uUoOLxekYiz+CMFC
         rOIXoLRblvyqNmZ7xmHI1hpEs3Zr1YsyO1Uj1v1MYkgW1qiUzMGsxFj7Iobm9anAnRXs
         Rpm1tD3zSEqmebHhg//R7pB0n93wpk3gh6TUQN2/ovZeJ7Z04wS5cjwBFB6/zNoCH10D
         sGUXWvNsU/l2SadauEqzU8PEYVt0jmn7gDgw2IxTn+YMO5Tddj4UiN9tacKKXVCWx7Bb
         dNxTxo0FMAmljcxJkkrOjqv1bx65rUZ83jy8Zujr8OzMbA1XCbNYj+S+hghxgJ6AQ9b7
         CfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6NtZ5awJS1Cs7Ve+i+/MsF9Xj1RnmQVjFKJj055oDBs=;
        b=olLrNOIX6wI2qkxCRUh4uah4wU8RdIRW3aizeOuF65ln+R1qac/QYp0c2cHa83nBW3
         h6X+vKktYaP7u2C8F+KjhwXQpadWH84E0EakTMUddCAegxygj4XtV8uRo83Fzf7DXssh
         Cna3V47OJCt4xaazv/+sk/svdsMowXgZ1n7QpLBvYzh67wjDEmgRmejqDxJDCljOadTF
         fSqQFhdXOXfq2Yr+cZGa68sXd9IPYwk7uP1iPiVK8iSiQjz5YX7fBRtpkNSMSXFimjz4
         5u1Cp1bB9IIBNcehkkUSBh+/5t4DjfmDk9w66KzWG6S6rirSwLKfe1xT5Yvk8ZXTRIi8
         BsFA==
X-Gm-Message-State: APjAAAVWaXDG4VRVyi1Gpw/RJAiC0IPsiyMW5L+g+bm2xWUZUAq4HGmv
        5EElrIcv3f6o9v1kYn9MwWc=
X-Google-Smtp-Source: APXvYqzwoxJeKnrUyTxTLOr+2AyWS922ZvkN4CmKQ3HiRRZHlC/scRiZT5lKmvqTwyGFbWKPxobTBg==
X-Received: by 2002:a05:6000:146:: with SMTP id r6mr45321641wrx.237.1560410887021;
        Thu, 13 Jun 2019 00:28:07 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id z17sm1593485wru.21.2019.06.13.00.28.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 00:28:06 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:28:05 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: Re: [PATCH] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
Message-ID: <20190613072805.vjkkp37ui73l2yzy@pali>
References: <20190612070517.20810-1-hui.wang@canonical.com>
 <20190612073817.ju2skswtatl2fxjn@pali>
 <dd3533ab-374d-ee6d-1d02-14fb83534ae3@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd3533ab-374d-ee6d-1d02-14fb83534ae3@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thursday 13 June 2019 10:09:24 Hui Wang wrote:
> 
> On 2019/6/12 下午3:38, Pali Rohár wrote:
> > On Wednesday 12 June 2019 15:05:17 Hui Wang wrote:
> > > On a latest Lenovo laptop, the trackpoint and 3 buttons below it
> > > don't work at all, when we move the trackpoint or press those 3
> > > buttons, the kernel will print out:
> > > "Rejected trackstick packet from non DualPoint device"
> > > 
> > > This device is identified as alps touchpad but the packet has
> > > trackpoint format, so the alps.c drops the packet and prints out
> > > the message above.
> > > 
> > > According to XiaoXiao's explanation, this device is named cs19 and
> > > is trackpoint-only device, its firmware is only for trackpoint, it
> > > is independent of touchpad and is a completely different device from
> > > DualPoint ones.
> > > 
> > > To drive this device with mininal changes to the existing driver, we
> > > just let the alps driver not handle this device, then the trackpoint.c
> > > will be the driver of this device.
> > > 
> > > With the trackpoint.c, this trackpoint and 3 buttons all work well,
> > > they have all features that the trackpoint should have, like
> > > scrolling-screen, drag-and-drop and frame-selection.
> > > 
> > > Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> > > Signed-off-by: Hui Wang <hui.wang@canonical.com>
> > > ---
> > >   drivers/input/mouse/alps.c | 28 ++++++++++++++++++++++++++++
> > >   1 file changed, 28 insertions(+)
> > > 
> > > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> > > index 0a6f7ca883e7..ff522cd980a0 100644
> > > --- a/drivers/input/mouse/alps.c
> > > +++ b/drivers/input/mouse/alps.c
> > > @@ -24,6 +24,7 @@
> > >   #include "psmouse.h"
> > >   #include "alps.h"
> > > +#include "trackpoint.h"
> > >   /*
> > >    * Definitions for ALPS version 3 and 4 command mode protocol
> > > @@ -2864,6 +2865,24 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
> > >   	return NULL;
> > >   }
> > > +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
> > > +{
> > > +	u8 param[2] = { 0 };
> > > +	int error;
> > > +
> > > +	error = ps2_command(&psmouse->ps2dev,
> > > +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
> > > +	if (error)
> > > +		return false;
> > > +
> > > +	if (param[0] == TP_VARIANT_ALPS && param[1] & 0x20) {
> > Hi!
> > 
> > Do we need to check firmware id? Is not check for "any alps trackpoint"
> > enough? If in future there would be more alps trackpoint-only devices it
> > probably have different firmware id.
> > 
> > Also you need to put param[1] & 0x20 into parenthesis due to priority of
> > & and && operators.
> Got it, will drop param[1] & 0x20 and make it work for more alps devices.
> > 
> > Also, what about making trackpoint_start_protocol() function non-static
> > and use it in alps_is_c19_trackpoint implementation? It is doing exactly
> > same thing.
> 
> Suppose users enabled the CONFIG_MOUSE_PS2_ALPS while disabled the
> CONFIG_MOUSE_PS2_TRACKPOINT, there will be some building error.

So in this case support for these trackpoint-only devices is broken,
right? Compile error is for sure a problem. But if trackpoint is
disabled and in alps.c we detected that trackpoint.c is needed, I think
you should issue warning to dmesg that current compiled kernel cannot
properly handle input device (alps.c decided that trackpoint.c handles
this input device, but user decided that trackpoint.c does not compile
into kernel).

> We may change Kconfig to let ALPS depend on TRACKPOINT, but it is not worth
> doing that only for one function.

This dependency is not a good idea. Rather stay with current code when
small function is copy+paste and modified to drop unneeded return
variables (param[]).

> > > +		psmouse_dbg(psmouse, "It is an ALPS trackpoint-only device (CS19)\n");
> > > +		return true;
> > > +	}
> > > +
> > > +	return false;
> > > +}
> > > +
> > >   static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
> > >   {
> > >   	const struct alps_protocol_info *protocol;
> > > @@ -2883,6 +2902,15 @@ static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
> > >   	if ((e6[0] & 0xf8) != 0 || e6[1] != 0 || (e6[2] != 10 && e6[2] != 100))
> > >   		return -EINVAL;
> > > +	/*
> > > +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
> > > +	 * of touchpad. So it is a different device from DualPoint ones, if it
> > > +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
> > > +	 * let trackpoint.c drive this device.
> > > +	 */
> > > +	if (alps_is_cs19_trackpoint(psmouse))
> > > +		return -EINVAL;
> > > +
> > This change is not ideal as this function would be called two times, see
> > alps_detect(). I would suggest to think more about detection and come up
> > with better solution so above trackpoint check would called only once
> > during PS/2 device detection.
> > 
> > Calling that trackpoint check two times is useless and just increase
> > detection time of PS/2 devices.
> 
> OK, I will try to move this checking into the alps_detect(), then it will be
> called once.
> 
> Thanks.
> 
> 
> > 
> > >   	/*
> > >   	 * Now get the "E7" and "EC" reports.  These will uniquely identify
> > >   	 * most ALPS touchpads.

-- 
Pali Rohár
pali.rohar@gmail.com
