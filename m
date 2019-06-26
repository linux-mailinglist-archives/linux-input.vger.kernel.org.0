Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7CA567B0
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 13:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFZLfG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 07:35:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:36746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbfFZLfG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 07:35:06 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E215C2080C;
        Wed, 26 Jun 2019 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561548905;
        bh=YKeQRHREJnHjpbsTylz+BTqcan40358xsW2IBcd3vVo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=MLwW7oMtOi19dlMXRN3X9spk5KGOvQvRKYOdazSZVuNWol1HOkBtCiL3PPe/hoBrn
         4KDxW/rwUax0p5Mw14zP8eBNqhpqWK9rKW2l/bj76R2IhAMxPhpzWaL7irZ8fCogHC
         M0F0cbPuyYrLAgwT9vB1D+k7/inxj43hOvGvwf1Y=
Date:   Wed, 26 Jun 2019 13:35:00 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Bastien Nocera <hadess@hadess.net>
cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH v2] HID: sb0540: add support for Creative SB0540 IR
 receivers
In-Reply-To: <c0eaa2b5992509bb563d4120efdfeed26d639930.camel@hadess.net>
Message-ID: <nycvar.YFH.7.76.1906261332510.27227@cbobk.fhfr.pm>
References: <bab94702a142c9f1dff291806b6f5beef99437d0.camel@hadess.net>  <nycvar.YFH.7.76.1906251710290.27227@cbobk.fhfr.pm> <c0eaa2b5992509bb563d4120efdfeed26d639930.camel@hadess.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 25 Jun 2019, Bastien Nocera wrote:

> > > With initial reviews from Benjamin Tissoires.
> > 
> > I guess this is not the final version of the patch then, and proper 
> > changelog will be inserted here :)
> 
> I'm not sure what else is needed there. The rest of the information is
> in the code, in the Kconfig, etc.

"With initial reviews from Benjamin Tissoires" is not really changelog 
we'd like to end up with in the kernel git.

Please consider something like "Add driver for XYZ device" at minimum.

> > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > 
> > [ ... snip ... ]
> > 
> > > +config HID_CREATIVE_SB0540
> > > +	tristate "Creative SB0540 infrared receiver"
> > > +	depends on (USB_HID)
> > 
> > Could you please remove the superfluous parenthesis?
> 
> I copied it from the only other entry that has that parenthesis in the
> file:
> config HID_APPLEIR
>         tristate "Apple infrared receiver"
>         depends on (USB_HID)
> 
> Do you want a patch for that?

As you'll be resubmitting with proper changelog, please change this as 
well. Thanks.

> > > --- /dev/null
> > > +++ b/drivers/hid/hid-creative-sb0540.c
> > > @@ -0,0 +1,254 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * HID driver for the Creative SB0540 receiver
> > > + *
> > > + * Copyright (C) 2019 Red Hat Inc. All Rights Reserved
> > 
> > Given the fact you're claiming RH copyright, the patch should better
> > be 
> > signed off by from a redhat.com address I believe.
> 
> If that's really needed, then I might as well put my own copyright
> there.

It's up to you (and your agreement with your employee), it just felt odd.

Thanks,

-- 
Jiri Kosina
SUSE Labs

