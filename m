Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5289EDF317
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 18:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730095AbfJUQ0p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Oct 2019 12:26:45 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:34615 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728292AbfJUQ0o (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Oct 2019 12:26:44 -0400
X-Greylist: delayed 24726 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 12:26:44 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571675203;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=MHrbM//6Q8vy1MwE7s8kZEQDawJwfZrKVYGeaIoXymk=;
        b=mV3E79DtREAci+y4etOFpiX5ZmYM9IAmyyP7tcH6HUlBKpwXd/wZPXDuuZiCRLUQYP
        Op148O8TVwN+oyo2UJ7kfa/0F9T+y+IHk2SsvzD84pprvJ+p5ixn1Sn/lhvfOTw8Z/gk
        KX0RCHUxIAgXpVkfbuaW2EPUUcP/q4/3V3sjTvTjlrSKGfVeBJpEhrPb/US5m0l630Aq
        HaC3VQ+nnwmkN7Jasi9r/YBEjBePLP7BnxUrhss8P+a1i+m6hFHqbYEB3rPnDQT21vVc
        4TWe+0gDLL/uYoh0Ijl0jIeg5Wg7OdaS/9yTZ/7qjF4AyYO54mFlp+/2Xg4uwUNxVtaf
        ng1w==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDdfTYstM="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.28.1 AUTH)
        with ESMTPSA id 409989v9LGQbQiP
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 21 Oct 2019 18:26:37 +0200 (CEST)
Date:   Mon, 21 Oct 2019 18:26:32 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andi Shyti <andi@etezian.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191021162632.GA83253@gerhold.net>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
 <20191021093423.GA1116@gerhold.net>
 <20191021154105.GC2278@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191021154105.GC2278@jack.zhora.eu>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 21, 2019 at 06:41:05PM +0300, Andi Shyti wrote:
> Hi Stephan,
> 
> > Not sure if you saw my comment regarding your patch [1],
> > so I'll just repeat it properly inline here:
> > 
> > [1]: https://patchwork.kernel.org/patch/11178515/#22927311
> > 
> > On Sun, Oct 20, 2019 at 11:28:55PM +0300, Andi Shyti wrote:
> > > The exchange of data to and from the mms114 touchscreen never
> > > exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> > > the interrupt handler while reading the events.
> > > 
> > 
> > i2c_smbus_read_i2c_block_data() is actually limited to
> > I2C_SMBUS_BLOCK_MAX = 32.
> 
> oh sorry, I don't know how I slipped on this.
> 
> But this means that the i2c in the kernel is wrong (or outdated),
> smbus specifies 256 bytes of data[*]. I might have relied on the
> specification more than the code.
> 
> I guess SMBUS needs some update.

You are right. It seems like that part of the specification was changed
with SMBus version 3.0 [1]:

  D.6 255 Bytes in Process Call:
    The maximum number of bytes allowed in the Block Write-Block Read
    Process Call (Section 6.5.8) was increased from 32 to 255.

[1]: http://www.smbus.org/specs/SMBus_3_0_20141220.pdf
