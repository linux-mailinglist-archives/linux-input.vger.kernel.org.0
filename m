Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEC0E43E2B
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 17:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728643AbfFMPsA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 11:48:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35261 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731747AbfFMJZv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 05:25:51 -0400
Received: by mail-wr1-f68.google.com with SMTP id m3so963992wrv.2
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 02:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HnnyJWMe1R0BRUFjMWaMypdyT/+W8iUJSqpHlS8xnkk=;
        b=Wu9HuVqPCXw7psj5jpnnmWMszQIopHUC1/mSxi2+uzukqLwdmj4vnMqE+LPn6bUwgE
         7ZPEWYgqwAhbHWN76ljoExVV1dwrYOvE+a1ZCNdsLSPuPyLie302eZ+f7rC56QwdNWoT
         r792u/N1qMcG+HP0Shtw3+yx1NdGUTxyfdF1ghCHHS5992DiriEPpUJv5EHTJuTqs039
         AfVmDbkp1G+TCmrLhvbgXYI/T+frJ0/nF3x5tw3s3pcgqCc0KZcx6uR9UfuhSrgxkSJ0
         ZNH8ZEe/NZyQzTI8/Q/Y2tK5KknQ1lAI8LHmpv7OYuWfzkd/3khyv4Mp8i9Opc3GWSal
         JBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HnnyJWMe1R0BRUFjMWaMypdyT/+W8iUJSqpHlS8xnkk=;
        b=FJc8OgXLo6YxqDudCmwz9uMK97CiooYqgF36vqVa6WzU+7yno9S+wZKVyPa1InZtge
         chPqy1c7NsU4jBDfOF1wKp+J2LgyNFTH5VfPlAj3YCxjZ6v1cmwhYi1uisrSRnuorEMh
         WPw0BST4x17BegvmCocFzgQqF/7swx/UDu4RwYbGLWN8pcRK2tcLFQBKZEqDwVCkp+de
         cj1gy9xRtL/pxJyYqKnS41uxdRpk2MAWjeF9cLsUcvFqg3Z9JhAoHE869sMdOkbAaM8H
         /he281fJPW6aBaRxfDzeJjH8FS1ubSR1XbL9MdeQSaX1+9DtYzVTGjTuXl+jQ1lfGSCe
         4P3A==
X-Gm-Message-State: APjAAAWWeZiRdIc5R2/VtvUZ0Jvh7lhe/x5VREee8inr9d2SQndMKt7I
        AJj0G9Wm+Yjs7eUoalAu+Ws=
X-Google-Smtp-Source: APXvYqzpGvK/4BmoVUHp+UGN7ar+IsgBaPDHvcCSSh4Lw+HCWWf0bOJzM8YwLiEpl+QFrSjgH4DSsg==
X-Received: by 2002:a5d:430c:: with SMTP id h12mr3130678wrq.163.1560417948106;
        Thu, 13 Jun 2019 02:25:48 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id l16sm2179439wrw.42.2019.06.13.02.25.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 02:25:47 -0700 (PDT)
Date:   Thu, 13 Jun 2019 11:25:46 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: Re: [PATCH v2] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
Message-ID: <20190613092546.pegdq52ahsdzuyrq@pali>
References: <20190613033249.20307-1-hui.wang@canonical.com>
 <20190613074518.jf55wmug5njddzn4@pali>
 <63493fb3-d670-fae3-1e71-42188e15761d@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <63493fb3-d670-fae3-1e71-42188e15761d@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thursday 13 June 2019 16:36:03 Hui Wang wrote:
> 
> On 2019/6/13 下午3:45, Pali Rohár wrote:
> > On Thursday 13 June 2019 11:32:49 Hui Wang wrote:
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
> > > In the v2, I move the cs19 checking to alsp_detect(), and
> > > drop the param[1] checking. And because after executing
> > > alps_indetify(), the device is not in the command mode,
> > > i rewrite teh alsp_is_cs19_trackpoint() to add enter/exit_command_mode().
> > > 
> > >   drivers/input/mouse/alps.c | 32 ++++++++++++++++++++++++++++++++
> > >   1 file changed, 32 insertions(+)
> > > 
> > > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> > > index 0a6f7ca883e7..6f227e8ddd7e 100644
> > > --- a/drivers/input/mouse/alps.c
> > > +++ b/drivers/input/mouse/alps.c
> > > @@ -24,6 +24,7 @@
> > >   #include "psmouse.h"
> > >   #include "alps.h"
> > > +#include "trackpoint.h"
> > >   /*
> > >    * Definitions for ALPS version 3 and 4 command mode protocol
> > > @@ -2864,6 +2865,28 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
> > >   	return NULL;
> > >   }
> > > +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
> > > +{
> > > +	u8 param[2] = { 0 };
> > > +
> > > +	if (alps_enter_command_mode(psmouse))
> > > +		return false;
> > Ufff... is this correct? Entering to command mode e.g. on rushmore
> > devices put ALPS touchpad into passthrough mode, when touchpad forwards
> > all packets from trackstick (connected to touchpad) directly to the
> > host.
> > 
> > I understood that ALPS trackpoint-only device do not have any touchpad,
> > so how is command mode suppose to work? What passthrough mean there?
> > 
> > Also does not it break e.g. ALPS rushmore devices?
> > 
> > I would suggest if you can provide architecture how this trackpoint-only
> > device is connected and which protocols it understand. Seems that there
> > are missing for us important details, like why is passthrough mode
> > needed and where it passthrough (there is a second device? which?).
> I don't want to put the controller into the passthrough mode,  I add the
> alps_enter_command_mode() just because the alps_identify() calls the
> alps_exit_command_mode().

So main problem is there to know how are those devices connected.

I played a bit with some ALPS rushomore device on laptop and they are
connected in this way:

  kernel/host  <--PS/2-->  EC  <--PS/2-->  external PS/2 mouse
                            |
                            <--PS/2-->  touchpad   <--PS/2--> trackstick
                                       (registers)            (registers)

EC mixes packets from external PS/2 mouse and from touchpad, kernel see
only one PS/2 mouse device. If external PS/2 mouse device is
disconnected then EC forwards all packets to ALPS rushmore touchpad.
ALPS rushmore touchpads has some registers which can be queries or
modified via special PS/2 commands; including the way to switch touchpad
between "bare 3byte PS/2 protocol" and ALPS 6byte PS/2 protocol. Via
special PS/2 packet touchpad can be instructed to passthrough all
following packets to trackstick device, which has also registers which
can be configured or changed PS/2 protocol.

So for correct setup you need to know diagram / HW architecture how is
which device connected and how you can send/receive packet from
particular device.

Correct setup needs to instruct every PS/2 device to enter into
"extended" PS/2 mode to start producing packets in correct format. And
this is what alps.c is doing in its setup phase.

So... how are those trackpoint-only ALPS devices connected?

> > 
> > > +	if (ps2_command(&psmouse->ps2dev,
> > > +			param, MAKE_PS2_CMD(0, 2, TP_READ_ID)))
> > > +		return false;
> > So if ps2_command fails then device stay in passthrough mode forever.
> > And in past I was told by ALPS people that some ALPS rushmore devices
> > have a firmware bug that PS/2 reset command does not exit from
> > passthrough mode. So this code put some ALPS devices into fully
> > unusable and unresetable mode. And full machine power off is needed.
> 
> Yes, this is a problem, I thought the immediate followed psmouse_reset()
> will reset the controller to normal state.

Such assumption always should have a comment in code. It is not so
obvious for reviewer (and future) reader without diagram / HW
architecture which I asked.

> And I just tested to remove the enter_command_mode() and
> exit_command_mode(), the device still worked well, it could read the TP_ID
> through the ps2_command(&psmouse->ps2dev, param, MAKE_PS2_CMD(0, 2,
> TP_READ_ID))), so if removing enter/exit_command_mode() and only keep the
> ps2_command(...), do you think it is safe for other alps devices?

That command is generic PS/2 command for detecting if device is
trackstick. It is already called for every PS/2 device once psmouse-base
starts code for detecting IBM trackpoint protocol.

So I guess it should be safe. But definite answer would give us only
engineers from ALPS.

> Thanks,
> 
> Hui.
> 
> 
> > 
> > > +	if (alps_exit_command_mode(psmouse))
> > > +		return false;
> > > +
> > > +	if (param[0] == TP_VARIANT_ALPS) {
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
> > > @@ -3164,6 +3187,15 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
> > >   	if (error)
> > >   		return error;
> > > +	/*
> > > +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
> > > +	 * of touchpad. So it is a different device from DualPoint ones, if it
> > > +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
> > > +	 * let trackpoint.c to drive this device.
> > > +	 */
> > > +	if (alps_is_cs19_trackpoint(psmouse))
> > > +		return -EINVAL;
> > > +
> > >   	/*
> > >   	 * Reset the device to make sure it is fully operational:
> > >   	 * on some laptops, like certain Dell Latitudes, we may
> > > -- 
> > > 2.17.1
> > > 

-- 
Pali Rohár
pali.rohar@gmail.com
