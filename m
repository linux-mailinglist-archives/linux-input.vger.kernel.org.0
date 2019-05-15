Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 678281FCB7
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 01:15:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfEOXPW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 19:15:22 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40217 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfEOXPW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 19:15:22 -0400
Received: by mail-pf1-f196.google.com with SMTP id u17so755015pfn.7;
        Wed, 15 May 2019 16:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XJZhWh1SMqVbnfDN/H36cTG2oQhVsmiYdQ8OcDDR5lI=;
        b=BIFAr/kEEO0si6HtLJyKiKMMV3w8VLMwFao6/qhPQ6w4QDOIbe1da9Re6egqkQCMiI
         0w9C3AtUxqSozmTNb82mv/nS4+oMRvcmhgUTsk+yebxr4lBAqwjc1HmuqutCuLqMJMWC
         3gfLGOORTeIkO+J9fCVCpFv1nyzwbSBTBG+NTCr9owgbfIVG5mMXBbJpV0g0q3pj3sm2
         JDdZi6oVe+U4JElzuJe3up90h+vJXC9077/MGFbit1y7M+wTf9RL3QzX+DGJAignXg3t
         02WpVhfC+jaskoQsxHWxFPOl3u2I4yW7Z13T6Cp7vK4ntnmBje8xUrIzZL87fKqkpnSg
         6I6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XJZhWh1SMqVbnfDN/H36cTG2oQhVsmiYdQ8OcDDR5lI=;
        b=eZgCq9aeKr83m6uoW0I2MhdQ58msY4mSWB8jYbPCa407IWr6WCcJ92n0pjUF2bUhfC
         KgeOstlw+fOTC2ErUDNMMNXtu/GPb11FqE4yMrD1pGthD8zrVsqQl6+fHiA13fyoImX3
         T/2Xobjj8iSPRak/kO+Bj/804YsB5u1RjlRyrsCdN2wkWAg3EZFF3t2XrVmixW/IQKNZ
         v4QifK1kLMpQ0UKpnWUa8vDjGvOwK2aE3Z4D9nP3N73aJLJj7LWAao0r/MXmqtZ5qlcn
         +2mL3sbpQGxnrIrsF8bHaQ3EUOMKiuXqZye3f1Ga3sH7Lurkfga2z/BIdNHxHDvuemKb
         TUzA==
X-Gm-Message-State: APjAAAVkn54r5+FHziAI9AginbBiX4C9xRDNBWh7QHcum2N5DcEdw0id
        exsurxW+x57IWt2vH5ulLxV8c6zX
X-Google-Smtp-Source: APXvYqzqDK5MSA3hl87Zw8ORnfoHa+i4OuTZkZbi3ZC12aTOAib81nLkfG6+V953lMGFxfE/JWIr/A==
X-Received: by 2002:aa7:864e:: with SMTP id a14mr39140447pfo.132.1557962121374;
        Wed, 15 May 2019 16:15:21 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y10sm4807757pfm.27.2019.05.15.16.15.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 16:15:20 -0700 (PDT)
Date:   Wed, 15 May 2019 16:15:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Ravi Chandra Sadineni <ravisadineni@chromium.org>
Cc:     =?utf-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Abhishek Bhardwaj <abhishekbh@google.com>,
        Todd Broch <tbroch@google.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH V1] elan_i2c: Increment wakeup count if wake source.
Message-ID: <20190515231519.GA134544@dtor-ws>
References: <20190513220610.177489-1-ravisadineni@chromium.org>
 <CAKdAkRQ_J6QWxtWpoRQnNWKcJpXox6xVDZWcWYOXkBhPSn99Rw@mail.gmail.com>
 <CAEZbON4Z5GKYvMZJ8ojko_f1xzv2rf4uR6cDz2LMxu+XvzTzog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEZbON4Z5GKYvMZJ8ojko_f1xzv2rf4uR6cDz2LMxu+XvzTzog@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 15, 2019 at 09:17:59AM -0700, Ravi Chandra Sadineni wrote:
> Hi Dmitry,
> 
> On Mon, May 13, 2019 at 4:29 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Ravi,
> >
> > On Mon, May 13, 2019 at 3:06 PM Ravi Chandra Sadineni
> > <ravisadineni@chromium.org> wrote:
> > >
> > > Notify the PM core that this dev is the wake source. This helps
> > > userspace daemon tracking the wake source to identify the origin of the
> > > wake.
> >
> > I wonder if we could do that form the i2c core instead of individual drivers?
> I am sorry, I don't see a way how this could be done.

Sorry, brain fart on my part. Applied, thank you.

> >
> > >
> > > Signed-off-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
> > > ---
> > >  drivers/input/mouse/elan_i2c_core.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> > > index f9525d6f0bfe..2c0561e20b7f 100644
> > > --- a/drivers/input/mouse/elan_i2c_core.c
> > > +++ b/drivers/input/mouse/elan_i2c_core.c
> > > @@ -981,6 +981,8 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
> > >         if (error)
> > >                 goto out;
> > >
> > > +       pm_wakeup_event(dev, 0);
> > > +
> > >         switch (report[ETP_REPORT_ID_OFFSET]) {
> > >         case ETP_REPORT_ID:
> > >                 elan_report_absolute(data, report);
> > > --
> > > 2.20.1
> > >
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> Thanks,
> Ravi

-- 
Dmitry
