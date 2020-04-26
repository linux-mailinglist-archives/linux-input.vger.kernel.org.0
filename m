Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02CCD1B8C7B
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 07:13:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgDZFM5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 01:12:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgDZFM5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 01:12:57 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85A23C061A0C;
        Sat, 25 Apr 2020 22:12:57 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w3so5565359plz.5;
        Sat, 25 Apr 2020 22:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bTnYIaXCznXChV+MpXcHpI6ZlmfvW//sWW/RWexRGj8=;
        b=kBRDOi5nUO1f/k0iKEGfnNHlbAA/UE46issqMq2x5EvpUU0Q0sQHml/UpGvE5GPcju
         /CpxzDRYc7Zl55eP4/szMAhMCMrpHT9TwpuTGNPKrtjqXU1RswWGELOaF44XdtQdM/8G
         bHYquQLqdPFR8ntWb7Xg0D36tqMlhfSU7sGH/tgAK60Escg8GxEC4DVFpOHQQY3RdY47
         ik3tkyTiYRjt9oy9L0bJ0KdyeSw59Hf6p/1Nup+T7uNlQzevYtfQFn6yQiCV8U/hcYys
         8a6v9HjtfZiAgk7XmQP0wZjrYJP3zjq4QAA+T3XWXJj0es8hge05g4I18VsC/5dnPAGN
         uiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bTnYIaXCznXChV+MpXcHpI6ZlmfvW//sWW/RWexRGj8=;
        b=tCYnRTf/1wtvNePXQ37PojoND7IhvQD1cglBDX4J1glLVe+TAcVhs5Lnngcvx9qyBG
         m5M7cjqMuxqn0gUur8iizO8EmztqYHOoedtsi23UcyIaHvJX8YzCLTVZj8npghZoPZTq
         jX/qz3zsodyGbKfIjO4f4OP360BHZgeX9MJxstwDRTe7GKojfSG2cVPD7teD4RDTe2PA
         4ULjbIMwrP6RnLWc2jUcnuqlJdRKYKT623opV1VGIw0pYV9wwf7TSk/3WDk2RKWBsYj5
         Zjz+DZaulfOVGsnU+Fg7C6GKIARR8XEtsKa+SO2LVQAk1Hau9q+/mC0UQ3neJh6Ve6sl
         PCow==
X-Gm-Message-State: AGi0PuZlGLBPIAoJemQSBnQW1dBGVB15dQdjCqV3U1RuFP0Zty+L/l2P
        2rPneYGJAXK7dp3+BX0Ynv4=
X-Google-Smtp-Source: APiQypJvKrNIoq54zM7ItzWvxPgPmUjltkzUe/vbC5X9rQ9ObfKBqKCTb9tN/4fsjG9pCVnc+v3i2w==
X-Received: by 2002:a17:902:b617:: with SMTP id b23mr18235167pls.194.1587877976985;
        Sat, 25 Apr 2020 22:12:56 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m7sm9392310pfb.48.2020.04.25.22.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 22:12:56 -0700 (PDT)
Date:   Sat, 25 Apr 2020 22:12:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/9] input: elants: override touchscreen info with DT
 properties
Message-ID: <20200426051254.GR125362@dtor-ws>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <cb3834494e837289fa792615925f06dbd91c1f75.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426051122.GQ125362@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200426051122.GQ125362@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 25, 2020 at 10:11:22PM -0700, Dmitry Torokhov wrote:
> On Mon, Apr 13, 2020 at 03:32:24PM +0200, Michał Mirosław wrote:
> > Allow overriding of information from hardware and support additional
> > common DT properties like axis inversion. This is required for eg.
> > Nexus 7 and TF300T where the programmed values in firmware differ
> > from reality.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > [moved "prop" before DMA buffer]
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> 
> This needs a companion patch for the DT bindings.

Ah, sorry, I missed the fact that it was later in the sequence.

> 
> > ---
> >  drivers/input/touchscreen/elants_i2c.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> > index fcd3d189f184..87d686ce08f2 100644
> > --- a/drivers/input/touchscreen/elants_i2c.c
> > +++ b/drivers/input/touchscreen/elants_i2c.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/firmware.h>
> >  #include <linux/input/mt.h>
> > +#include <linux/input/touchscreen.h>
> >  #include <linux/acpi.h>
> >  #include <linux/of.h>
> >  #include <linux/gpio/consumer.h>
> > @@ -150,6 +151,7 @@ struct elants_data {
> >  	unsigned int y_res;
> >  	unsigned int x_max;
> >  	unsigned int y_max;
> > +	struct touchscreen_properties prop;
> >  
> >  	enum elants_state state;
> >  	enum elants_iap_mode iap_mode;
> > @@ -894,8 +896,7 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
> >  
> >  			input_mt_slot(input, i);
> >  			input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
> > -			input_event(input, EV_ABS, ABS_MT_POSITION_X, x);
> > -			input_event(input, EV_ABS, ABS_MT_POSITION_Y, y);
> > +			touchscreen_report_pos(input, &ts->prop, x, y, true);
> >  			input_event(input, EV_ABS, ABS_MT_PRESSURE, p);
> >  			input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, w);
> >  
> > @@ -1329,6 +1330,8 @@ static int elants_i2c_probe(struct i2c_client *client,
> >  	input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->y_res);
> >  	input_abs_set_res(ts->input, ABS_MT_TOUCH_MAJOR, 1);
> >  
> > +	touchscreen_parse_properties(ts->input, true, &ts->prop);
> > +
> >  	error = input_register_device(ts->input);
> >  	if (error) {
> >  		dev_err(&client->dev,
> > -- 
> > 2.20.1
> > 
> 
> -- 
> Dmitry

-- 
Dmitry
