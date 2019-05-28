Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB252BCCC
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2019 03:21:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfE1BVG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 21:21:06 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:33189 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727654AbfE1BVF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 21:21:05 -0400
Received: by mail-io1-f65.google.com with SMTP id u13so5724756iop.0;
        Mon, 27 May 2019 18:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=27QYXSJfDgkMs3NQuGOEzR0yDkUyXNJXs5ev5CL6ZEM=;
        b=nT+DvN/0OIhvaSUXXRi5THTkbcE3b3seQVvcDpS6RIqPYPDK2bXU+Lv+KY5xzabLnJ
         XKB0wSctU7XyXcVV5Q7xlEiMSlSqg2Sb5jzWyLcMJLZXvW6Pe7xifZxmUm3uvNu/2hn3
         iT98EwMvK2QevvafoL4fKbYnhOsoSbgKjfycPyFAYmlEyo7MyHXjPCFm1RLMmu28XpDD
         4L8jqentZMSvKCvYwRIV8fMV6UBqYHSue8GhUz7zLi4wMtRjnBv2FpnmfHwLn81utCVu
         C/IcMbMRHO90ZctMT9qU/UkqcgtPQgkNCYgX7n9u61esW/ObbAbMJ5IUbcpRuBBcJmM+
         LIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=27QYXSJfDgkMs3NQuGOEzR0yDkUyXNJXs5ev5CL6ZEM=;
        b=knVZdfhW5loWAwiO25WPi3GJvdDcovdJIUJxTtfhvGlO4AGHL1JU63LapYqpUQCCnP
         4dErlB6B/wtslSPzw/I0wF/JxzSmWxnNiXyuhe1PYQ4sOYrh5PCTcYI6J0ynoyV9bwo4
         FrM798v1iqAM0Lsh5Use9ZurWTk/3fSmu7wgSEUO0k1pdAFBBC4Da/RBZI1kwF/VNz6G
         zKHZzT1t31tq9PuHTy1bv/hFRplGM2bzVCMsl0hx7WS4KqALfMAn2PZuJzDLW1t2OlGQ
         0SULGErw14+RkYy4Tt81Mu5R/+TT/nGV/PA352MmMXpk0ufoD63GWA8ScVWpjo4FbW19
         HTLg==
X-Gm-Message-State: APjAAAU6WmtkQeRUvs/MW4qnxe0NJMYR1oTrMlUDpRn5lpv8Q+0v9usC
        hlGObDXJ2KMFtiOWV+sQWtE=
X-Google-Smtp-Source: APXvYqwxXyAmZLivswwyp3sPGnfA8UGWOu4zULOfo6zFppR956+KKb5kvtHuXgAEGDCi18UdIvkGaQ==
X-Received: by 2002:a6b:e615:: with SMTP id g21mr7223419ioh.178.1559006464224;
        Mon, 27 May 2019 18:21:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a15sm2393824ioc.27.2019.05.27.18.21.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 18:21:03 -0700 (PDT)
Date:   Mon, 27 May 2019 18:21:01 -0700
From:   'Dmitry Torokhov' <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>
Cc:     'Benjamin Tissoires' <benjamin.tissoires@redhat.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Aaron Ma' <aaron.ma@canonical.com>,
        'Hans de Goede' <hdegoede@redhat.com>,
        "'open list:HID CORE LAYER'" <linux-input@vger.kernel.org>,
        'lkml' <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, Harry Cutts <hcutts@chromium.org>
Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height
Message-ID: <20190528012101.GA193221@dtor-ws>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
 <20190521132712.2818-9-benjamin.tissoires@redhat.com>
 <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com>
 <00f901d5143f$f5ea8420$e1bf8c60$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00f901d5143f$f5ea8420$e1bf8c60$@emc.com.tw>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin, KT,

On Mon, May 27, 2019 at 11:55:01AM +0800, 廖崇榮 wrote:
> Hi
> 
> -----Original Message-----
> From: Benjamin Tissoires [mailto:benjamin.tissoires@redhat.com] 
> Sent: Friday, May 24, 2019 5:37 PM
> To: Dmitry Torokhov; KT Liao; Rob Herring; Aaron Ma; Hans de Goede
> Cc: open list:HID CORE LAYER; lkml; devicetree@vger.kernel.org
> Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height
> 
> On Tue, May 21, 2019 at 3:28 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> >
> > The width/height is actually in the same unit than X and Y. So we 
> > should not tamper the data, but just set the proper resolution, so 
> > that userspace can correctly detect which touch is a palm or a finger.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > --
> >
> > new in v2
> > ---
> >  drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/input/mouse/elan_i2c_core.c 
> > b/drivers/input/mouse/elan_i2c_core.c
> > index 7ff044c6cd11..6f4feedb7765 100644
> > --- a/drivers/input/mouse/elan_i2c_core.c
> > +++ b/drivers/input/mouse/elan_i2c_core.c
> > @@ -45,7 +45,6 @@
> >  #define DRIVER_NAME            "elan_i2c"
> >  #define ELAN_VENDOR_ID         0x04f3
> >  #define ETP_MAX_PRESSURE       255
> > -#define ETP_FWIDTH_REDUCE      90
> >  #define ETP_FINGER_WIDTH       15
> >  #define ETP_RETRY_COUNT                3
> >
> > @@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp_data *data,
> >                         return;
> >                 }
> >
> > -               /*
> > -                * To avoid treating large finger as palm, let's reduce the
> > -                * width x and y per trace.
> > -                */
> > -               area_x = mk_x * (data->width_x - ETP_FWIDTH_REDUCE);
> > -               area_y = mk_y * (data->width_y - ETP_FWIDTH_REDUCE);
> > +               area_x = mk_x * data->width_x;
> > +               area_y = mk_y * data->width_y;
> >
> >                 major = max(area_x, area_y);
> >                 minor = min(area_x, area_y); @@ -1123,8 +1118,10 @@ 
> > static int elan_setup_input_device(struct elan_tp_data *data)
> >                              ETP_MAX_PRESSURE, 0, 0);
> >         input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
> >                              ETP_FINGER_WIDTH * max_width, 0, 0);
> > +       input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, data->x_res);
> >         input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
> >                              ETP_FINGER_WIDTH * min_width, 0, 0);
> > +       input_abs_set_res(input, ABS_MT_TOUCH_MINOR, data->y_res);
> 
> I had a chat with Peter on Wednesday, and he mentioned that this is dangerous as Major/Minor are max/min of the width and height. And given that we might have 2 different resolutions, we would need to do some computation in the kernel to ensure the data is correct with respect to the resolution.
> 
> TL;DR: I don't think we should export the resolution there :(
> 
> KT, should I drop the patch entirely, or is there a strong argument for keeping the ETP_FWIDTH_REDUCE around?
> I suggest you apply the patch, I have no idea why ETP_FWIDTH_REDUCE existed. 
> Our FW team know nothing about ETP_FWIDTH_REDUCE ether.
> 
> The only side effect will happen on Chromebook because such computation have stayed in ChromeOS' kernel for four years.
> Chrome's finger/palm threshold may be different from other Linux distribution.
> We will discuss it with Google once the patch picked by chrome and cause something wrong.

Chrome has logic that contact with maximum major/minor is treated as a
palm, so here the driver (which originally came from Chrome OS)
artificially reduces the contact size to ensure that palm rejection
logic does not trigger.

I'm adding Harry to confirm whether we are still using this logic and to
see if we can adjust it to be something else.

Thanks.

-- 
Dmitry
