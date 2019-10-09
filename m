Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2654ED0D16
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 12:48:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbfJIKr7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 06:47:59 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:18184 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbfJIKr6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 06:47:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570618075;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=3dKq3sIIM6raJ7lBf23mWetvB95AhRcJIG4eXafZHQs=;
        b=NJnHVtg9Oxumekq1Z0TWrTRV8LqJ009XThYONNvOdgnPyccsFrNygx3Nv/HXtM5bcp
        Nbr1HZ5fq5QdLthDnK5cYJsewnk/SmiMI9RvNcwsTGYVQfuCXnf7hJR2/iH9SZKqM3SP
        zH+HxDAmeVjvChydTn0mS7iXUzXxn2mzd2whUpmJOiDqUSLWBUq/ck7Q0+YnRvLzu153
        98ZgUkTuT24GWDz0iaJxOBAXFHbqHAtAkLeMhF3facpZ+l6/pD5pWqgpZOv8LCzv3FHh
        hmz4T7uzC6WQMuituORl+JAY8RBDK6xs/kENPvSG1ZUJNWHD3oiO9/+2LezYOnpMqZez
        XNug==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJL0PVgt6Qm"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 44.28.0 AUTH)
        with ESMTPSA id L0811cv99AloE8W
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 9 Oct 2019 12:47:50 +0200 (CEST)
Date:   Wed, 9 Oct 2019 12:47:40 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Andi Shyti <andi@etezian.org>, Simon Shields <simon@lineageos.org>,
        linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: mms114 - add support for mms345l
Message-ID: <20191009104740.GA107000@gerhold.net>
References: <20191007203343.101466-1-stephan@gerhold.net>
 <20191007205021.104402-1-stephan@gerhold.net>
 <20191008220014.GI22365@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191008220014.GI22365@dtor-ws>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 08, 2019 at 03:00:14PM -0700, Dmitry Torokhov wrote:
> On Mon, Oct 07, 2019 at 10:50:21PM +0200, Stephan Gerhold wrote:
> > MMS345L is another first generation touch screen from Melfas,
> > which uses the same registers as MMS152.
> > 
> > However, using I2C_M_NOSTART for it causes errors when reading:
> > 
> > 	i2c i2c-0: sendbytes: NAK bailout.
> > 	mms114 0-0048: __mms114_read_reg: i2c transfer failed (-5)
> > 
> > The driver works fine as soon as I2C_M_NOSTART is removed.
> > 
> > Add a separate melfas,mms345l binding, and make use of I2C_M_NOSTART
> > only for MMS114 and MMS152.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> > Note: I was not able to find a datasheet for any of the models,
> > so this change is merely based on testing and comparison with
> > the downstream driver [1].
> > 
> > There was a related patch [2] that removes I2C_M_NOSTART for all models,
> > but it seems abandoned and I do not have any other model for testing.
> > Therefore, this patch implements the least instrusive solution
> > and only removes I2C_M_NOSTART for MMS345L.
> 
> Hmm,  at this point I am inclined to pick up Andi's patch since it seems
> to work for you and him and it looks like Android drivers are not using
> I2C_M_NOSTART. I wonder if this was some quirk/big on the platform where
> it was originally developed.
> 
> Any objections?

I cannot really speak for any of the other models, but no objections for
removing I2C_M_NOSTART from my side. I'm actually rather confused by it
since it is used on the first partial message.

The documentation [1] says:
  If you set the I2C_M_NOSTART variable for the first partial message,
  we do not generate Addr, but we do generate the startbit S.
  ** This will probably confuse all other clients on your bus,
  so don't try this. **

Yet, someone felt like trying this here. ;)

I have tested the following two patches from Andy on MMS345L:
  - Input: mms114 - use smbus functions whenever possible [2]
  - Input: mms114 - get read of custm i2c read/write functions [3]

Indeed, with I2C_M_NOSTART removed I can actually use "melfas,mms152"
and the touchscreen appears to work without further changes.
(The only weird thing is that it displays an empty "Compat group" in
  "TSP FW Rev: bootloader 0x6 / core 0x26 / config 0x26, Compat group: ",
 I suspect that register does not exist on MMS345L...)

But there is a limitation that won't let us take these two patches as-is:
i2c_smbus_read_i2c_block_data() is limited to I2C_SMBUS_BLOCK_MAX,
which is: 32 /* As specified in SMBus standard */

According to "Input: mms114 - use smbus functions whenever possible":
> The exchange of data to and from the mms114 touchscreen never
> exceeds 256 bytes. In the worst case it goes up to 80 bytes in
> the interrupt handler while reading the events.

Since i2c_smbus_read_i2c_block_data() is limited to 32, larger packets
won't be read correctly. For example, if you use more than 4 fingers you
can easily trigger a situation where one of the fingers gets "stuck",
together with: mms114 4-0048: Wrong touch type (0)
(It attempts to read uninitialized data in this case...)

So we still need the custom functions for reading the touch packet,
or maybe change the driver to use regmap instead.

[1]: https://www.kernel.org/doc/html/latest/i2c/i2c-protocol.html
[2]: https://patchwork.kernel.org/patch/10189551/
[3]: https://patchwork.kernel.org/patch/10189541/
