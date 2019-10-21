Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A94DDF2D1
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 18:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfJUQTp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 12:19:45 -0400
Received: from 6.mo173.mail-out.ovh.net ([46.105.43.93]:49561 "EHLO
        6.mo173.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbfJUQTo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 12:19:44 -0400
X-Greylist: delayed 1801 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 12:19:43 EDT
Received: from player795.ha.ovh.net (unknown [10.109.159.123])
        by mo173.mail-out.ovh.net (Postfix) with ESMTP id 5105B11A852
        for <linux-input@vger.kernel.org>; Mon, 21 Oct 2019 17:41:17 +0200 (CEST)
Received: from etezian.org (85-76-6-59-nat.elisa-mobile.fi [85.76.6.59])
        (Authenticated sender: andi@etezian.org)
        by player795.ha.ovh.net (Postfix) with ESMTPSA id 0A56EB099834;
        Mon, 21 Oct 2019 15:41:10 +0000 (UTC)
Date:   Mon, 21 Oct 2019 18:41:05 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191021154105.GC2278@jack.zhora.eu>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
 <20191021093423.GA1116@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021093423.GA1116@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Ovh-Tracer-Id: 15104228728113840877
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeehgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Stephan,

> Not sure if you saw my comment regarding your patch [1],
> so I'll just repeat it properly inline here:
> 
> [1]: https://patchwork.kernel.org/patch/11178515/#22927311
> 
> On Sun, Oct 20, 2019 at 11:28:55PM +0300, Andi Shyti wrote:
> > The exchange of data to and from the mms114 touchscreen never
> > exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> > the interrupt handler while reading the events.
> > 
> 
> i2c_smbus_read_i2c_block_data() is actually limited to
> I2C_SMBUS_BLOCK_MAX = 32.

oh sorry, I don't know how I slipped on this.

But this means that the i2c in the kernel is wrong (or outdated),
smbus specifies 256 bytes of data[*]. I might have relied on the
specification more than the code.

I guess SMBUS needs some update.

> > diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
> > index a5ab774da4cc..170dcb5312b9 100644
> > --- a/drivers/input/touchscreen/mms114.c
> > +++ b/drivers/input/touchscreen/mms114.c
> > @@ -204,14 +204,15 @@ static irqreturn_t mms114_interrupt(int irq, void *dev_id)
> >  	}
> >  	mutex_unlock(&input_dev->mutex);
> >  
> > -	packet_size = mms114_read_reg(data, MMS114_PACKET_SIZE);
> > +	packet_size = i2c_smbus_read_byte_data(data->client,
> > +					       MMS114_PACKET_SIZE);
> >  	if (packet_size <= 0)
> >  		goto out;
> >  
> >  	touch_size = packet_size / MMS114_PACKET_NUM;
> >  
> > -	error = __mms114_read_reg(data, MMS114_INFORMATION, packet_size,
> > -			(u8 *)touch);
> > +	error = i2c_smbus_read_i2c_block_data(data->client, MMS114_INFORMATION,
> > +					      packet_size, (u8 *)touch);
> 
> ... and here we try to read up to 80 bytes, as you mentioned.
> 
> i2c_smbus_read_i2c_block_data() will silently fall back to reading only
> 32 bytes. Therefore, if we try to read more than 32 bytes here we will
> later read uninitialized data.
> 
> With this change, if you use more than 4 fingers you can easily trigger
> a situation where one of the fingers gets "stuck", together with:
>   mms114 4-0048: Wrong touch type (0)

yes, it can be that for this there might be some delays or miss
reads.

> So we still need the custom functions here, or maybe avoid the problem
> by using regmap instead.

This was what Dmitry was proposing almost a couple of years ago,
but then I stopped working on this.

> > +		error = i2c_smbus_read_i2c_block_data(data->client,
> > +						      MMS152_FW_REV, 3, buf);
> >  		if (error)
> 
> i2c_smbus_read_i2c_block_data() returns the number of read bytes,
> therefore this check will always fail.
> 
> It should be: if (error < 0)

> > +		error = i2c_smbus_read_i2c_block_data(data->client,
> > +						      MMS114_TSP_REV, 6, buf);
> >  		if (error)
> 
> As above.

Yes, an oversight in these two cases. Thanks!

Well, I guess some more rework needs to be done in this patch...
at the end Dmitry was right :)

Thanks,
Andi

[*] http://www.smbus.org/specs/
