Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7294FE02AD
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 13:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387790AbfJVLSw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 07:18:52 -0400
Received: from 7.mo177.mail-out.ovh.net ([46.105.61.149]:46149 "EHLO
        7.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387640AbfJVLSv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 07:18:51 -0400
Received: from player770.ha.ovh.net (unknown [10.109.143.189])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id AE5DF10EB09
        for <linux-input@vger.kernel.org>; Tue, 22 Oct 2019 13:18:49 +0200 (CEST)
Received: from etezian.org (85-76-6-59-nat.elisa-mobile.fi [85.76.6.59])
        (Authenticated sender: andi@etezian.org)
        by player770.ha.ovh.net (Postfix) with ESMTPSA id AC9D2B43EB3C;
        Tue, 22 Oct 2019 11:18:40 +0000 (UTC)
Date:   Tue, 22 Oct 2019 14:18:39 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191022111729.GA2913@jack.zhora.eu>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
 <20191021093423.GA1116@gerhold.net>
 <20191021154105.GC2278@jack.zhora.eu>
 <20191021162632.GA83253@gerhold.net>
 <20191021163956.GB1353@jack.zhora.eu>
 <20191022032140.GV35946@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022032140.GV35946@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Ovh-Tracer-Id: 16544254709670396570
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeejgdefkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

> > > > > On Sun, Oct 20, 2019 at 11:28:55PM +0300, Andi Shyti wrote:
> > > > > > The exchange of data to and from the mms114 touchscreen never
> > > > > > exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> > > > > > the interrupt handler while reading the events.
> > > > > > 
> > > > > 
> > > > > i2c_smbus_read_i2c_block_data() is actually limited to
> > > > > I2C_SMBUS_BLOCK_MAX = 32.
> > > > 
> > > > oh sorry, I don't know how I slipped on this.
> > > > 
> > > > But this means that the i2c in the kernel is wrong (or outdated),
> > > > smbus specifies 256 bytes of data[*]. I might have relied on the
> > > > specification more than the code.
> > > > 
> > > > I guess SMBUS needs some update.
> > > 
> > > You are right. It seems like that part of the specification was changed
> > > with SMBus version 3.0 [1]:
> > > 
> > >   D.6 255 Bytes in Process Call:
> > >     The maximum number of bytes allowed in the Block Write-Block Read
> > >     Process Call (Section 6.5.8) was increased from 32 to 255.
> > > 
> > > [1]: http://www.smbus.org/specs/SMBus_3_0_20141220.pdf
> > 
> > yes :)
> > 
> > OK, then I would ask Dmitry to hold on this patch I will try to
> > update the smbus properly.
> 
> 3.0 is from 2014, so we can't simply update the limits. And we need to
> handle the case where device connected to a controller that does not
> implement 3.0 standard.

actually I don't see why, given that devices that were sending
32bytes will keep sending 32bytes and in any case I still haven't
seen a controller that is strictly compliant to SMBUS 2. The
mms114 device is a good example (and I think most of the
touchscreens don't really care of the 32byte limit).

In any case, I agree that I can't simply update the
I2C_SMBUS_BLOCK_MAX because for sure I might have forgotten some
cases and I'm currently looking how to do it. I have a few ideas
but no one is good. I planned to send an RFC sometimes soon in
order to kickstart some discussion.

> If regmap is too much work then as a stop gap we could maybe only
> convert write functions and mention why read needs to be custom.

regmap is not too much work but I don't have the device with me,
I might get one at some point, but can't do anything right now.

Perhaps, for now you can take Stephan's patches and I would
update everything once I get the device. They are not mutually
exclusive, anyway.

Thanks,
Andi
