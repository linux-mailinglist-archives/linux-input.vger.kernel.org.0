Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF83B8E053
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2019 00:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728432AbfHNWG3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Aug 2019 18:06:29 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33737 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727975AbfHNWG3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Aug 2019 18:06:29 -0400
Received: by mail-pg1-f196.google.com with SMTP id n190so305654pgn.0;
        Wed, 14 Aug 2019 15:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FLFblGnxzQ1wI2QM5HelENy2vNVHmhf51uAkZDB+jpI=;
        b=T6rUo53R9JDRHIkMfoGdrnDrsfMPkMGgqRTP3o5lVIOOcp2qrBarQDVb1rpfBmja8n
         hb29IYPLiS+4SjkOcCclg6MMZoxlIVyTqswgEgSR7V8KdraVWdIS/Y9f7EuAGynkNAUW
         q7mxLhX+gUtvRob9dALNvXjLvJG5SmqDsEzgqhzg+mcldPILPgMEgQ9DisII1gmhy1CL
         btdIuPVtWn3qLlsf15RY2HYGl/QYNwAKfpBflkrRimTHbAPcEzBdlCUpDqEI8N1wIQSP
         Xy9dZAyXPOS14n1PtzcJdAys2fGt8RKD+ZON5r/jZSwRi0T4BB1FTRf33dgs6plfiXK6
         LSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FLFblGnxzQ1wI2QM5HelENy2vNVHmhf51uAkZDB+jpI=;
        b=eh/L90nKRH9z2jqp8p0wGn7B1Vs8g4S5WA3MjPQTNQIiu8niW4CrwE8VDLzKZA+wEI
         UJXtzgpP21AYm9aendTIXQRe+t58+TRMgbGtyMeOfb6YRTsmXo79fNL9tesOcUp6OPLC
         w/infUNvQ6O2MxYdZdriWBoQMvEFEaFyTZ07RiwnS5VAsyfieVev2WRdCzpv9SqgI688
         RZSGQzidNkzxwBwcgB63iiXeHAxG/s2rbIEYISS7gqXmOAZE8o2K9nb8LS6IorvsqWx7
         XgTfJdniHmkExS4XrixNSI7Oev8jiDmAh6EriboAfrd5jK8Ik6FqJQbt5kAJxIeF8D5B
         Wq6Q==
X-Gm-Message-State: APjAAAWA4Y/cguNq3u0Zau0q4PdL6pD+gCGDBYu+7DJnnOnov8/SvcjJ
        1XdNEDG2+6h8zKSjNTVF58LWYbYy
X-Google-Smtp-Source: APXvYqxOv2+QJT56iITOcewqwm/svzN0f2xI1RFG9HZpdRwcds+DscI/HKfjP2Yj28OcgA1qHhUUzg==
X-Received: by 2002:a63:40a:: with SMTP id 10mr1072437pge.317.1565820388356;
        Wed, 14 Aug 2019 15:06:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id i9sm5475pjj.2.2019.08.14.15.06.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 14 Aug 2019 15:06:27 -0700 (PDT)
Date:   Wed, 14 Aug 2019 15:06:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Fei Shao <fshao@chromium.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Ting Shen <phoenixshen@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add back missing mask for event_type
Message-ID: <20190814220625.GD121898@dtor-ws>
References: <20190813093821.74158-1-fshao@chromium.org>
 <CANMq1KCNFfWA=ApVUFoPctgTftHDSAvGjtk-Xu2hcKWBq9R1zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANMq1KCNFfWA=ApVUFoPctgTftHDSAvGjtk-Xu2hcKWBq9R1zw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 13, 2019 at 05:47:22PM +0800, Nicolas Boichat wrote:
> On Tue, Aug 13, 2019 at 5:38 PM Fei Shao <fshao@chromium.org> wrote:
> >
> > In the previous patch we didn't mask out event_type in case statement,
> > so switches are always picked instead of buttons, which results in
> > ChromeOS devices misbehaving when power button is pressed.
> > This patch adds back the missing mask.
> >
> > Fixes: d096aa3eb604 ("Input: cros_ec_keyb: mask out extra flags in event_type")
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> 
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

Applied, thank you.

> 
> > ---
> >  drivers/input/keyboard/cros_ec_keyb.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> > index 38cb6d82d8fe..bef7bee6f05e 100644
> > --- a/drivers/input/keyboard/cros_ec_keyb.c
> > +++ b/drivers/input/keyboard/cros_ec_keyb.c
> > @@ -226,6 +226,8 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
> >  {
> >         struct cros_ec_keyb *ckdev = container_of(nb, struct cros_ec_keyb,
> >                                                   notifier);
> > +       uint8_t mkbp_event_type = ckdev->ec->event_data.event_type &
> > +                                 EC_MKBP_EVENT_TYPE_MASK;
> >         u32 val;
> >         unsigned int ev_type;
> >
> > @@ -237,7 +239,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
> >         if (queued_during_suspend && !device_may_wakeup(ckdev->dev))
> >                 return NOTIFY_OK;
> >
> > -       switch (ckdev->ec->event_data.event_type & EC_MKBP_EVENT_TYPE_MASK) {
> > +       switch (mkbp_event_type) {
> >         case EC_MKBP_EVENT_KEY_MATRIX:
> >                 pm_wakeup_event(ckdev->dev, 0);
> >
> > @@ -264,7 +266,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
> >         case EC_MKBP_EVENT_SWITCH:
> >                 pm_wakeup_event(ckdev->dev, 0);
> >
> > -               if (ckdev->ec->event_data.event_type == EC_MKBP_EVENT_BUTTON) {
> > +               if (mkbp_event_type == EC_MKBP_EVENT_BUTTON) {
> >                         val = get_unaligned_le32(
> >                                         &ckdev->ec->event_data.data.buttons);
> >                         ev_type = EV_KEY;
> > --
> > 2.23.0.rc1.153.gdeed80330f-goog

-- 
Dmitry
