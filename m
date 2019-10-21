Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7414DF408
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 19:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727017AbfJURS6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 13:18:58 -0400
Received: from 8.mo177.mail-out.ovh.net ([46.105.61.98]:40416 "EHLO
        8.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbfJURS6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 13:18:58 -0400
X-Greylist: delayed 1201 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 13:18:58 EDT
Received: from player758.ha.ovh.net (unknown [10.109.159.68])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id 34BC210E096
        for <linux-input@vger.kernel.org>; Mon, 21 Oct 2019 18:40:06 +0200 (CEST)
Received: from etezian.org (81-175-223-118.bb.dnainternet.fi [81.175.223.118])
        (Authenticated sender: andi@etezian.org)
        by player758.ha.ovh.net (Postfix) with ESMTPSA id 19CACB426C0A;
        Mon, 21 Oct 2019 16:39:59 +0000 (UTC)
Date:   Mon, 21 Oct 2019 19:39:56 +0300
From:   Andi Shyti <andi@etezian.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andi Shyti <andi@etezian.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191021163956.GB1353@jack.zhora.eu>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
 <20191021093423.GA1116@gerhold.net>
 <20191021154105.GC2278@jack.zhora.eu>
 <20191021162632.GA83253@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021162632.GA83253@gerhold.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Ovh-Tracer-Id: 16097553919637963501
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeehgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> > > On Sun, Oct 20, 2019 at 11:28:55PM +0300, Andi Shyti wrote:
> > > > The exchange of data to and from the mms114 touchscreen never
> > > > exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> > > > the interrupt handler while reading the events.
> > > > 
> > > 
> > > i2c_smbus_read_i2c_block_data() is actually limited to
> > > I2C_SMBUS_BLOCK_MAX = 32.
> > 
> > oh sorry, I don't know how I slipped on this.
> > 
> > But this means that the i2c in the kernel is wrong (or outdated),
> > smbus specifies 256 bytes of data[*]. I might have relied on the
> > specification more than the code.
> > 
> > I guess SMBUS needs some update.
> 
> You are right. It seems like that part of the specification was changed
> with SMBus version 3.0 [1]:
> 
>   D.6 255 Bytes in Process Call:
>     The maximum number of bytes allowed in the Block Write-Block Read
>     Process Call (Section 6.5.8) was increased from 32 to 255.
> 
> [1]: http://www.smbus.org/specs/SMBus_3_0_20141220.pdf

yes :)

OK, then I would ask Dmitry to hold on this patch I will try to
update the smbus properly.

Thanks a lot for the review, Stephan!

Andi
