Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5250EF137
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 00:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbfKDXg1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Nov 2019 18:36:27 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39255 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729757AbfKDXg1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Nov 2019 18:36:27 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so10490640pfo.6;
        Mon, 04 Nov 2019 15:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9z+GNj/QX4pIfvHfYOF0OvhW5R7ZpOiiJgoQrjngeaY=;
        b=JzzrPmXvN/7jKjL5aum+P8iuWlpi8OL+e9AQkw1gOYw/+Gd7R34f4w7uMakFtqdTpj
         ASvUZHnLWrEV03hkEQu0xVg9Z0uutuX/a4NafNIPtnNtGqd+6VSuTJkt2ZqbDv+OGbN9
         7dHgWINGN3UoCeROP9ULfHVGaJdY8WoZEexmiFooZr7QbtN2S9tK8r7SKst7jNbiUUM4
         Y2N4XF5nM7Fo+CXM4wMwQ/MeBxHMDOPKQKgdzX6UVqf49xl18bwIIZB9WEI5/GBOlCSc
         7U4y2juF+bRzRy4J+W/dUMqlQ/Mu4eB0EZyaTmuCkzYmsqu3z2++uDrvrxOoB7Fnc32l
         nptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9z+GNj/QX4pIfvHfYOF0OvhW5R7ZpOiiJgoQrjngeaY=;
        b=F5yaGkxhx5jMPl6i1gBtOh4RYnRI6/hI5GGBqZnpNffWat0hvkEzf1A72rjlISf4/i
         7sovRAghJMV+rk6ry2o7TOxb4Y4MxwGvnOfZ07Hb9pkdkknvRVp/I2dNsOhbEQrbIp76
         TUJ6rtQf3ZqzyqPXNMQm3DKXCJkhWXMCo+3VfkhV+29xczUHE8Pw1BQ3De5DJesX3RDq
         riSkIpJ7ET2KUDTv/Mxcdlk2dxZJxu/L4+Lk/GM/9ahS3EqK9PfoK+JKi/QtHdK2W6CZ
         pgJrKsn7inJrZEKAlwQSAC1QkpOANFWIGQijFDRrwob9JXSotudefUx6Wm/Mw8t8P6jT
         VcVg==
X-Gm-Message-State: APjAAAUqybXMGqdemEfHRFJPN41mYitydWfWBnHm9KvtUBwssT1DVAS1
        dFXdVFwZ5VNNl03sWxfngyw=
X-Google-Smtp-Source: APXvYqyICdjbwVezL56iEnQ5lz/Bfz/X6up+TxBGK2/WDrFnghYnhAu10W5C/leHV90rZoBEiksCYA==
X-Received: by 2002:a63:352:: with SMTP id 79mr32731110pgd.4.1572910584957;
        Mon, 04 Nov 2019 15:36:24 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id e198sm19351630pfh.83.2019.11.04.15.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 15:36:24 -0800 (PST)
Date:   Mon, 4 Nov 2019 15:36:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Sven Van Asbroeck <thesven73@gmail.com>,
        Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
Message-ID: <20191104233621.GP57214@dtor-ws>
References: <20191104070116.GM57214@dtor-ws>
 <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 04, 2019 at 05:25:23PM -0600, Adam Ford wrote:
> On Mon, Nov 4, 2019 at 3:43 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
> >
> > Hi Adam,
> >
> > On Mon, Nov 4, 2019 at 4:28 PM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > I am using IRQ_TYPE_EDGE_RISING for the 2117A.  Is that correct?  For
> > > my touchscreen, the IRQ line is low until a touch is detected, so I
> > > assume we want to capure on the rising edge.
> >
> > That is correct for the 2117A, as far as I know. I am using the same
> > setting.
> >
> > >
> > > Regarding Dmitry's patch,
> > > Is it a good idea to use msleep in an IRQ?  It seems like using the
> > > schedule_delayed_work() call seems like it will get in and get out of
> > > the ISR faster.
> > >
> > > If we use msleep and scan again, isn't it possible to starve other processes?
> >
> > I believe using msleep() is ok because this is not a "real" interrupt handler,
> > but a threaded one. It runs in a regular kernel thread, with its interrupt
> > turned off (but all other interrupts remain enabled). Its interrupt is
> > re-enabled automatically after the threaded handler returns.
> >
> > See
> > https://elixir.bootlin.com/linux/latest/source/include/linux/interrupt.h#L50
> >
> > > > @@ -268,7 +278,7 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
> > > >                 }
> > > >
> > > >                 touch = ili210x_report_events(priv, touchdata);
> > > > -               keep_polling = touch || chip->continue_polling(touchdata);
> > > > +               keep_polling = chip->continue_polling(touchdata, touch);
> > > >                 if (keep_polling)
> > >
> > > Why not just check the value of touch instead of invoking the function
> > > pointer which takes the value of touch in as a parameter?
> > >
> >
> > The value of touch must be checked inside the callback, because
> > some variants use it to decide if they should poll again, and
> > some do not, such as the ili211x.
> 
> That makes sense.
> >
> > If I have misinterpreted your suggestion, could you perhaps
> > express it in C, so I can understand better?
> 
> You explained it.
> I'm good.

OK, I refreshed the branch with fixes and a couple of new patches. It is
on top of 5.3 now. If this works for you guys I will be merging it for
5.5.

Thanks.

-- 
Dmitry
