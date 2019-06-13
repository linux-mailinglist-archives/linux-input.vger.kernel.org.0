Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE50944444
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 18:37:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392499AbfFMQfy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 12:35:54 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35911 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730695AbfFMHgN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 03:36:13 -0400
Received: by mail-wm1-f67.google.com with SMTP id u8so8974632wmm.1
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 00:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ULLGD+kLzzUYj4fCvOPuVc0o75pxtC6VaprySH/qDBA=;
        b=va0iRPkGaFC8lZTtUqUDeLTQuD51FjeR38zNdUlMz1VzIztTego54zVL5wR2K02e1B
         +P9LYTVbN14yTZcpsMSa9bDAwq7Z9yVXN+PuIhMywSgAyBzTgwyYDXDBp0RzlIfXu4cS
         0dp0Ifd8DhFXL1BX+SDTmhT71Cw2m7/nJ0ML+LDEMxbrQHcfk6tZouyRfirqu0B28wCH
         8scy+a7lWqeiQjcFE39gQn8wEDDu3I53qyzAJ3Lxlf5+hp7DHOitJVnCZYyv/eAWwZOH
         XIRQPMoY98NtHTNMh0kXwp9N3fta2dSA8cMIZ6XQHm92AvzmTB2AqxXq1ESISqPxOqZq
         rXBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ULLGD+kLzzUYj4fCvOPuVc0o75pxtC6VaprySH/qDBA=;
        b=cInA5mOdo4sPM9Ibe+0PN/zQBbZtDR0nnVDRDows4GNVfiSgeLNM2mRa7pAtfys2P5
         SB8NngGEJS0QjqUQs9Ixc5jloe54yjuIhrxhOJwDnCwPkj5Cb5R/3s3R/P5T5v57/Ybv
         LBUmltYw3ryeKP8G0SNrGoSMVbuJzEtFzq1qHQqYdDMu/tStxeJkkr/mVpJXM/QGLB72
         CrvsuXOly55aEET+uUEHMSMBgqzWpITDTtdGJngdoWuYKdiATD+yAJwEG5+NbEJ/uEYa
         KBSPTxg477sbdhwPeUPAg4dBSCSLH/f1nwbtB5nH5q2EOfVJzZfxjz3TmmFLoCFEJoRZ
         yg1w==
X-Gm-Message-State: APjAAAW0JfFMRLjQM7m19gKUx0Z9oMM3f6ZofpfAvSjyn2xzQpccTc2o
        etb+i+gIJjyHzCRF3JyD25VLl5a+wWs=
X-Google-Smtp-Source: APXvYqyJ57dfQIlRK6vy4w3Mwz7lPD6nfzTxg+KklTJCryP2m/Mt6CZRQCjrcLXyhuRYb1vXNv1/8A==
X-Received: by 2002:a7b:cc81:: with SMTP id p1mr2285415wma.107.1560411370215;
        Thu, 13 Jun 2019 00:36:10 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id b2sm3098610wrp.72.2019.06.13.00.36.09
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 00:36:09 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:36:08 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>
Cc:     Hui Wang <hui.wang@canonical.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "sliuuxiaonxiao@gmail.com" <sliuuxiaonxiao@gmail.com>,
        Xiaojian Cao <xiaojian.cao@cn.alps.com>,
        Naoki Saito <naoki.saito@alpsalpine.com>,
        Hideo Kawase <hideo.kawase@alpsalpine.com>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQ0g=?= =?utf-8?Q?=5D?= Input: alps -
 Don't handle ALPS cs19 trackpoint-only device
Message-ID: <20190613073608.5ux4idy2hzt6datx@pali>
References: <20190612070517.20810-1-hui.wang@canonical.com>
 <20190612073817.ju2skswtatl2fxjn@pali>
 <OSBPR01MB4855855F58C638F2F23AA1BBDAEF0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSBPR01MB4855855F58C638F2F23AA1BBDAEF0@OSBPR01MB4855.jpnprd01.prod.outlook.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

On Thursday 13 June 2019 04:00:14 Xiaoxiao Liu wrote:
> Hi Pali,
> 
> Do we need to check firmware id? Is not check for "any alps trackpoint"
> enough? If in future there would be more alps trackpoint-only devices it probably have different firmware id.
>    -> Yes ,we need the firmware version to check if the device is trackpoint-only.
>         This method fit all the current alps trackpoint device.

Ok, if you as authority from ALPS says it is really needed, then please
use that firmware version check for ALPS trackpoint-only detection.

> Calling that trackpoint check two times is useless and just increase detection time of PS/2 devices.
>   ->  what the twice means?
>   ->  Do you means  ps2_command(&psmouse->ps2dev,    param, MAKE_PS2_CMD(0, 2, TP_READ_ID)) used in the alps.c and trackpoint.c  or   in function  alps_detect twice?(because the alps_identify was called twice.)
>   ->  we must use this command in alps.c to filter the trackpoint-only device.
>   -> We can move it into alps_detect function to reduce calls. How about this?

alps_detect() calls functions in this order:
 1. alps_identify(with priv = NULL)
 2. psmouse_reset()
 3. alps_identify(with priv = allocated memory)

It is because of proper detection on Dell Latitude machines, see
comments in alps_detect() function or commit messages via git blame for
more details.

So if you introduce check for ALPS trackpoint-only device into
alsp_identify() function, you slow down detection of all ALPS devices as
this check function would be called 2 times from alps_detect().

And then this function is called third time from trackpoint.c, but I do
not have an idea how to avoid this.

So instead of calling that detection function 3 times (2 times in alps.c
and one time in trackpoint.c), alps.c should be modified so detection
function is called only two times (one time in alps.c and one time in
trackpoint.c).

Or if you have an idea how to decrease just to one call, feel free to
propose solution and patch.

Or... Dmitry, what do you think about it? Maybe you could have something
in your mind how to avoid these inter-detection problems between two
drivers/protocols.

> Best Regards
> Shona
> -----邮件原件-----
> 发件人: Pali Rohár <pali.rohar@gmail.com> 
> 发送时间: Wednesday, June 12, 2019 3:38 PM
> 收件人: Hui Wang <hui.wang@canonical.com>
> 抄送: linux-input@vger.kernel.org; dmitry.torokhov@gmail.com; 劉 曉曉 Xiaoxiao Liu <xiaoxiao.liu-1@cn.alps.com>; sliuuxiaonxiao@gmail.com; 曹 曉建 Xiaojian Cao <xiaojian.cao@cn.alps.com>; 斉藤 直樹 Naoki Saito <naoki.saito@alpsalpine.com>; 川瀬 英夫 Hideo Kawase <hideo.kawase@alpsalpine.com>
> 主题: Re: [PATCH] Input: alps - Don't handle ALPS cs19 trackpoint-only device
> 
> On Wednesday 12 June 2019 15:05:17 Hui Wang wrote:
> > On a latest Lenovo laptop, the trackpoint and 3 buttons below it don't 
> > work at all, when we move the trackpoint or press those 3 buttons, the 
> > kernel will print out:
> > "Rejected trackstick packet from non DualPoint device"
> > 
> > This device is identified as alps touchpad but the packet has 
> > trackpoint format, so the alps.c drops the packet and prints out the 
> > message above.
> > 
> > According to XiaoXiao's explanation, this device is named cs19 and is 
> > trackpoint-only device, its firmware is only for trackpoint, it is 
> > independent of touchpad and is a completely different device from 
> > DualPoint ones.
> > 
> > To drive this device with mininal changes to the existing driver, we 
> > just let the alps driver not handle this device, then the trackpoint.c 
> > will be the driver of this device.
> > 
> > With the trackpoint.c, this trackpoint and 3 buttons all work well, 
> > they have all features that the trackpoint should have, like 
> > scrolling-screen, drag-and-drop and frame-selection.
> > 
> > Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> > Signed-off-by: Hui Wang <hui.wang@canonical.com>
> > ---
> >  drivers/input/mouse/alps.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c 
> > index 0a6f7ca883e7..ff522cd980a0 100644
> > --- a/drivers/input/mouse/alps.c
> > +++ b/drivers/input/mouse/alps.c
> > @@ -24,6 +24,7 @@
> >  
> >  #include "psmouse.h"
> >  #include "alps.h"
> > +#include "trackpoint.h"
> >  
> >  /*
> >   * Definitions for ALPS version 3 and 4 command mode protocol @@ 
> > -2864,6 +2865,24 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
> >  	return NULL;
> >  }
> >  
> > +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse) {
> > +	u8 param[2] = { 0 };
> > +	int error;
> > +
> > +	error = ps2_command(&psmouse->ps2dev,
> > +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
> > +	if (error)
> > +		return false;
> > +
> > +	if (param[0] == TP_VARIANT_ALPS && param[1] & 0x20) {
> 
> Hi!
> 
> Do we need to check firmware id? Is not check for "any alps trackpoint"
> enough? If in future there would be more alps trackpoint-only devices it probably have different firmware id.
> 
> Also you need to put param[1] & 0x20 into parenthesis due to priority of & and && operators.
> 
> Also, what about making trackpoint_start_protocol() function non-static and use it in alps_is_c19_trackpoint implementation? It is doing exactly same thing.
> 
> > +		psmouse_dbg(psmouse, "It is an ALPS trackpoint-only device (CS19)\n");
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> >  static int alps_identify(struct psmouse *psmouse, struct alps_data 
> > *priv)  {
> >  	const struct alps_protocol_info *protocol; @@ -2883,6 +2902,15 @@ 
> > static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
> >  	if ((e6[0] & 0xf8) != 0 || e6[1] != 0 || (e6[2] != 10 && e6[2] != 100))
> >  		return -EINVAL;
> >  
> > +	/*
> > +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
> > +	 * of touchpad. So it is a different device from DualPoint ones, if it
> > +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
> > +	 * let trackpoint.c drive this device.
> > +	 */
> > +	if (alps_is_cs19_trackpoint(psmouse))
> > +		return -EINVAL;
> > +
> 
> This change is not ideal as this function would be called two times, see alps_detect(). I would suggest to think more about detection and come up with better solution so above trackpoint check would called only once during PS/2 device detection.
> 
> Calling that trackpoint check two times is useless and just increase detection time of PS/2 devices.
> 
> >  	/*
> >  	 * Now get the "E7" and "EC" reports.  These will uniquely identify
> >  	 * most ALPS touchpads.
> 
> --
> Pali Rohár
> pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
