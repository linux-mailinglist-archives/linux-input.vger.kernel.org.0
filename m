Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38DA855310
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2019 17:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbfFYPQo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jun 2019 11:16:44 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:38893 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbfFYPQo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jun 2019 11:16:44 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 253B0240003;
        Tue, 25 Jun 2019 15:16:38 +0000 (UTC)
Message-ID: <c0eaa2b5992509bb563d4120efdfeed26d639930.camel@hadess.net>
Subject: Re: [PATCH v2] HID: sb0540: add support for Creative SB0540 IR
 receivers
From:   Bastien Nocera <hadess@hadess.net>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 25 Jun 2019 17:16:38 +0200
In-Reply-To: <nycvar.YFH.7.76.1906251710290.27227@cbobk.fhfr.pm>
References: <bab94702a142c9f1dff291806b6f5beef99437d0.camel@hadess.net>
         <nycvar.YFH.7.76.1906251710290.27227@cbobk.fhfr.pm>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 2019-06-25 at 17:13 +0200, Jiri Kosina wrote:
> On Tue, 25 Jun 2019, Bastien Nocera wrote:
> 
> > With initial reviews from Benjamin Tissoires.
> 
> I guess this is not the final version of the patch then, and proper 
> changelog will be inserted here :)

I'm not sure what else is needed there. The rest of the information is
in the code, in the Kconfig, etc.

> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> [ ... snip ... ]
> 
> > +config HID_CREATIVE_SB0540
> > +	tristate "Creative SB0540 infrared receiver"
> > +	depends on (USB_HID)
> 
> Could you please remove the superfluous parenthesis?

I copied it from the only other entry that has that parenthesis in the
file:
config HID_APPLEIR
        tristate "Apple infrared receiver"
        depends on (USB_HID)

Do you want a patch for that?

> > +	---help---
> > +	Support for Creative infrared SB0540-compatible remote
> > controls, such
> > +	as the RM-1500 and RM-1800 remotes.
> > +
> > +	Say Y here if you want support for Creative SB0540 infrared
> > receiver.
> > +
> >  config HID_CYPRESS
> >  	tristate "Cypress mouse and barcode readers"
> >  	depends on HID
> > diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> > index cc5d827c9164..1ad662fe37b6 100644
> > --- a/drivers/hid/Makefile
> > +++ b/drivers/hid/Makefile
> > @@ -27,6 +27,7 @@ obj-$(CONFIG_HID_ALPS)		+= hid-alps.o
> >  obj-$(CONFIG_HID_ACRUX)		+= hid-axff.o
> >  obj-$(CONFIG_HID_APPLE)		+= hid-apple.o
> >  obj-$(CONFIG_HID_APPLEIR)	+= hid-appleir.o
> > +obj-$(CONFIG_HID_CREATIVE_SB0540)	+= hid-creative-sb0540.c
> >  obj-$(CONFIG_HID_ASUS)		+= hid-asus.o
> >  obj-$(CONFIG_HID_AUREAL)	+= hid-aureal.o
> >  obj-$(CONFIG_HID_BELKIN)	+= hid-belkin.o
> > diff --git a/drivers/hid/hid-creative-sb0540.c b/drivers/hid/hid-
> > creative-sb0540.c
> > new file mode 100644
> > index 000000000000..a94542cbdd33
> > --- /dev/null
> > +++ b/drivers/hid/hid-creative-sb0540.c
> > @@ -0,0 +1,254 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * HID driver for the Creative SB0540 receiver
> > + *
> > + * Copyright (C) 2019 Red Hat Inc. All Rights Reserved
> 
> Given the fact you're claiming RH copyright, the patch should better
> be 
> signed off by from a redhat.com address I believe.

If that's really needed, then I might as well put my own copyright
there.

Do you want a v2 with those changes?

Cheers

