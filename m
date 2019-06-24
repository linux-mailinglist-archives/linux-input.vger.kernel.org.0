Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7AB950A96
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2019 14:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbfFXMUz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jun 2019 08:20:55 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57960 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbfFXMUz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jun 2019 08:20:55 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OCK22H005047;
        Mon, 24 Jun 2019 07:20:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1561378802;
        bh=Krm1ng6sEwbBnXkhtb2p05GFEfZus+RD81OkWvgmAlA=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=bY0p7VGuVzt/RUM9Ys68FE/URbB6yuzPYGEJhVhieFRCxUwLX05tT6XfmU1ROYMts
         Ovji8nVCntG6Uz6x29Qg+4Me1rcniw7WCYkOU+/YfflgPCiYsEiUhc9V95iHwDyD8i
         48jYT45SH1yAc0k7olhFZ0vb3vt14s17G0xqf3nU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OCK2Cq063885
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Jun 2019 07:20:02 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 07:20:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 07:20:01 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with SMTP id x5OCK16g088278;
        Mon, 24 Jun 2019 07:20:01 -0500
Date:   Mon, 24 Jun 2019 07:21:20 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Patch 1/1] Input: edt-ft5x06 - disable irq handling during
 suspend
Message-ID: <20190624122120.hq7of57loegwudiv@ti.com>
References: <20190621185124.28966-1-bparrot@ti.com>
 <CAHp75VdcAfmn8u0du-Y95SjMcmuJa2402tdXCNHMcme1Y925xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHp75VdcAfmn8u0du-Y95SjMcmuJa2402tdXCNHMcme1Y925xg@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Andy Shevchenko <andy.shevchenko@gmail.com> wrote on Sat [2019-Jun-22 13:37:10 +0300]:
> On Fri, Jun 21, 2019 at 9:53 PM Benoit Parrot <bparrot@ti.com> wrote:
> >
> > As a wakeup source when the system is in suspend there is little point
> > trying to access a register across the i2c bus as it is probably still
> > inactive. We need to prevent the irq handler from being called during
> > suspend.
> >
> 
> Hmm... But how OS will know what the event to handle afterwards?
> I mean shouldn't we guarantee somehow the delivery of the event to the
> input, in this case, subsystem followed by corresponding user space?

I am not sure I understand, do you mean that you want the input wake up event
being processed by the edt_ft50x6 driver as it happens? How can we do that
if we can't access the device through the bus? Are we trying to capture
specific gesture here (given that the display should be off during
sleep/suspend)?

Anyhow here I am just trying to eliminate the runtime error caused by
trying to access a resource which we know is unavailable at the time.
What method would you suggest we use to achieve this? 

Benoit

> 
> > Without this modification upon wakeup you would see the following kernel
> > error:
> >
> > [ 118.733717] PM: Wakeup source GPIO0
> > [ 118.751933] edt_ft5x06 1-0038: Unable to fetch data, error: -13
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/input/touchscreen/edt-ft5x06.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index c639ebce914c..c885bfe783a4 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -1200,8 +1200,10 @@ static int __maybe_unused edt_ft5x06_ts_suspend(struct device *dev)
> >  {
> >         struct i2c_client *client = to_i2c_client(dev);
> >
> > -       if (device_may_wakeup(dev))
> > +       if (device_may_wakeup(dev)) {
> >                 enable_irq_wake(client->irq);
> > +               disable_irq(client->irq);
> > +       }
> >
> >         return 0;
> >  }
> > @@ -1210,8 +1212,10 @@ static int __maybe_unused edt_ft5x06_ts_resume(struct device *dev)
> >  {
> >         struct i2c_client *client = to_i2c_client(dev);
> >
> > -       if (device_may_wakeup(dev))
> > +       if (device_may_wakeup(dev)) {
> >                 disable_irq_wake(client->irq);
> > +               enable_irq(client->irq);
> > +       }
> >
> >         return 0;
> >  }
> > --
> > 2.17.1
> >
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
