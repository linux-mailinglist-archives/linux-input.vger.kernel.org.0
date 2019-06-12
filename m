Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03A1F4490F
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728978AbfFMRN0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:13:26 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42407 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728965AbfFLWAW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 18:00:22 -0400
Received: by mail-pg1-f195.google.com with SMTP id l19so7058562pgh.9
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 15:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4ZiICsO9npg8vRxECYGtLGiQz+AEgE8oBlLh03j4sUo=;
        b=NR0Py/ue9d7OQkTLH7znB6RCyMLvWlBwqQqdh4/XFEqy4u5aVJ8d+tXc5qaZKITLVc
         geawCzObBmkJMEc1gb9Eztz55WehykLDSl5hj5F+SaIcCZAdQz0vFNewto4X9q4cOseK
         M+axaSurrGlOlpWwh9SwHd4nZgyiFxYlRl3Te9mr1oirC0Al1qgMmGt6llRmLVH7z+rj
         QZLIPDIDdlcDUfTgkzuWJFuL5iSTvwSR81kEMD9FfsbGQfW18HUS6Q1yliqbdwlO11d/
         rDF3ipIyTkPnmpjoOMeRzzR4az5FVTRf8oJhB/ze2mUKIDDgSI3hku8X/qLOkErdFxa0
         duVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4ZiICsO9npg8vRxECYGtLGiQz+AEgE8oBlLh03j4sUo=;
        b=Tq3EYe3hCaXjv0cQJeTc7LmbRcLAh5Er/IV2xEahQpXWaBS2uQVnTyFvr6krXRto+7
         b0QyLNiSTRFP/ftDK+UaL6LiMSUxBxWwOTJufz2P+veHNUnN/e4hzklRxe+vhYMnwPi5
         JIatdZMW8kfpGpaII9ygyeieQrz9FakhpOTVjkSJYXI1TIgh/PQZDcpWUYIQg2hcQEKT
         BlNlAL8Mcr0QGon+MFx6g1alK7IslyaiTG594DRESt+RyeekMtmffx1VqeCiFVYmvhaa
         SzZnTJsPIvIYW0HEI38v9vh35LRV2/JIynVpQRpeSD7DQqosmdWPpOQuAn3owq41cr1e
         6v7w==
X-Gm-Message-State: APjAAAXXf7c0zwF92jtQl+e/yR9PSCCwi3j4bE25aCq7mDpM9TI2/+jO
        fUcljtiyub9xi3WVl2VZbjOYcpKJ
X-Google-Smtp-Source: APXvYqx3k0zDnmK41y5tsaXGjvuFyVJRbR/Jn5QD7qPuvQ+7fm8FbSx8dmWdpsEH86qDzF212T1hhQ==
X-Received: by 2002:a62:e511:: with SMTP id n17mr80495828pff.181.1560376821276;
        Wed, 12 Jun 2019 15:00:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id s5sm366273pji.9.2019.06.12.15.00.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 15:00:20 -0700 (PDT)
Date:   Wed, 12 Jun 2019 15:00:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc:     Alexander Mikhaylenko <exalm7659@gmail.com>, teika@gmx.com,
        linux-input <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: synaptics - enable SMBus on ThinkPad E480 and E580
Message-ID: <20190612220018.GC40779@dtor-ws>
References: <20190421131156.9631-1-exalm7659@gmail.com>
 <CAN+gG=EVcWWW5sbuN2LbQtRFCY+2eMEXq3K0-nPRU18=Kft1gQ@mail.gmail.com>
 <CAN+gG=ErURu-_9dbRJWh+9go_YyqeNKRVWuKr6tzhc_2ywuxaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAN+gG=ErURu-_9dbRJWh+9go_YyqeNKRVWuKr6tzhc_2ywuxaw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 15, 2019 at 09:03:39AM +0200, Benjamin Tissoires wrote:
> [resending with proper email of Dmitry]
> 
> On Wed, May 15, 2019 at 9:02 AM Benjamin Tissoires
> <benjamin.tissoires@gmail.com> wrote:
> >
> > On Sun, Apr 21, 2019 at 3:27 PM Alexander Mikhaylenko
> > <exalm7659@gmail.com> wrote:
> > >
> > > They are capable of using intertouch and it works well with
> > > psmouse.synaptics_intertouch=1, so add them to the list.
> > >
> > > Without it, scrolling and gestures are jumpy, three-finger pinch gesture
> > > doesn't work and three- or four-finger swipes sometimes get stuck.
> > >
> > > Signed-off-by: Alexander Mikhaylenko <exalm7659@gmail.com>

Applied, thank you.

> > > ---
> >
> > Based on comments about suspend/resume in the thread:
> > Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > Teika: note that you are welcome to provide a reviewed-by in any
> > cases, even if you "are not a kernel developer", you know enough to
> > say if this kind of patch is valid or not :)
> >
> > Cheers,
> > Benjamin
> >
> > >  drivers/input/mouse/synaptics.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
> > > index b6da0c1267e3..8e6077d8e434 100644
> > > --- a/drivers/input/mouse/synaptics.c
> > > +++ b/drivers/input/mouse/synaptics.c
> > > @@ -179,6 +179,8 @@ static const char * const smbus_pnp_ids[] = {
> > >         "LEN0096", /* X280 */
> > >         "LEN0097", /* X280 -> ALPS trackpoint */
> > >         "LEN200f", /* T450s */
> > > +       "LEN2054", /* E480 */
> > > +       "LEN2055", /* E580 */
> > >         "SYN3052", /* HP EliteBook 840 G4 */
> > >         "SYN3221", /* HP 15-ay000 */
> > >         NULL
> > > --
> > > 2.21.0
> > >

-- 
Dmitry
