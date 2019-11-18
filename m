Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A08F4100681
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2019 14:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfKRNcn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 08:32:43 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:31902 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726284AbfKRNcn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 08:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1574083961;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=C0KocRIO2PSLLQjF0oz8KH9XiQjVJaJ5RMeQ5HzgURI=;
        b=d7HaI1HZtp73M0EoNpHlzMh8R0v9hu329qcrSU9+CgH/8IzUilOm3eGpiNlLFs+ssP
        MqEDu9ZF3Im87K8cv5MRvRYMlx2T/X2O2KjhMv6t8y/r6e+mcLNjVz8JdvwUDxUwrcbz
        0hQnjHOBlXZebGLPTPq0LX2HkKlryiQiXcG3BuDd0/qxMJ8QIjOBZszuip9HtE2oewTI
        29BRcjHcBgbVns/u6QXWmM0+r+j7UTa0Lp7px5aselPYqmZIHGDsi+S9cIYgLEG9oDYi
        PBmDttD5cp1B/wLx59+3OFJxRPG9ooqwneopq9Cosm89rdAOuCtIrjSb8RW7HhCM0CyK
        AzQA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266HpF+ORJDY7/yYB5jeg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id e07688vAIDWZeo6
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Mon, 18 Nov 2019 14:32:35 +0100 (CET)
Date:   Mon, 18 Nov 2019 14:32:29 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever
 possible
Message-ID: <20191118133229.GA182934@gerhold.net>
References: <20191020202856.20287-1-andi@etezian.org>
 <20191020202856.20287-2-andi@etezian.org>
 <20191021093423.GA1116@gerhold.net>
 <20191021154105.GC2278@jack.zhora.eu>
 <20191021162632.GA83253@gerhold.net>
 <20191021163956.GB1353@jack.zhora.eu>
 <20191022032140.GV35946@dtor-ws>
 <20191022111729.GA2913@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022111729.GA2913@jack.zhora.eu>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, Oct 22, 2019 at 02:18:39PM +0300, Andi Shyti wrote:
> Hi Dmitry,
> 
> > > > > > On Sun, Oct 20, 2019 at 11:28:55PM +0300, Andi Shyti wrote:
> > > > > > > The exchange of data to and from the mms114 touchscreen never
> > > > > > > exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> > > > > > > the interrupt handler while reading the events.
> > > > > > > 
> > > > > > 
> > > > > > i2c_smbus_read_i2c_block_data() is actually limited to
> > > > > > I2C_SMBUS_BLOCK_MAX = 32.
> > > > > 
> > > > > oh sorry, I don't know how I slipped on this.
> > > > > 
> > > > > But this means that the i2c in the kernel is wrong (or outdated),
> > > > > smbus specifies 256 bytes of data[*]. I might have relied on the
> > > > > specification more than the code.
> > > > > 
> > > > > I guess SMBUS needs some update.
> > > > 
> > > > You are right. It seems like that part of the specification was changed
> > > > with SMBus version 3.0 [1]:
> > > > 
> > > >   D.6 255 Bytes in Process Call:
> > > >     The maximum number of bytes allowed in the Block Write-Block Read
> > > >     Process Call (Section 6.5.8) was increased from 32 to 255.
> > > > 
> > > > [1]: http://www.smbus.org/specs/SMBus_3_0_20141220.pdf
> > > 
> > > yes :)
> > > 
> > > OK, then I would ask Dmitry to hold on this patch I will try to
> > > update the smbus properly.
> > 
> > 3.0 is from 2014, so we can't simply update the limits. And we need to
> > handle the case where device connected to a controller that does not
> > implement 3.0 standard.
> 
> actually I don't see why, given that devices that were sending
> 32bytes will keep sending 32bytes and in any case I still haven't
> seen a controller that is strictly compliant to SMBUS 2. The
> mms114 device is a good example (and I think most of the
> touchscreens don't really care of the 32byte limit).
> 
> In any case, I agree that I can't simply update the
> I2C_SMBUS_BLOCK_MAX because for sure I might have forgotten some
> cases and I'm currently looking how to do it. I have a few ideas
> but no one is good. I planned to send an RFC sometimes soon in
> order to kickstart some discussion.
> 
> > If regmap is too much work then as a stop gap we could maybe only
> > convert write functions and mention why read needs to be custom.
> 
> regmap is not too much work but I don't have the device with me,
> I might get one at some point, but can't do anything right now.
> 
> Perhaps, for now you can take Stephan's patches and I would
> update everything once I get the device. They are not mutually
> exclusive, anyway.

What do you think about this?

My patches for MMS345L keep behavior for MMS114 and MMS152 as-is,
so we can be sure that there are no regressions for them.

Cleaning up the driver to use SMBUS and/or regmap instead of the custom
read/write methods is definitely something we should attempt to do
at some point, but only when we can properly test them on MMS114.

Until we have a MMS114 test device available, I would say that
applying my patches is the least intrusive way to make MMS345L work.

Thanks,
Stephan
