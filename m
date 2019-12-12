Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1528611D8AD
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2019 22:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731108AbfLLVin (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 16:38:43 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.220]:23986 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731086AbfLLVin (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 16:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576186721;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=GVFX6styBuCxctAu12dSRLnoIJrVoxmSwXL7flRsaGk=;
        b=e05slfYONNt0UK6bHLvvZTcYfBJpiEDYkKg53WRTsl7lx5ZAlmPTfd8jNQxRxQMyok
        9LB4rPmyzba3RNJ3PaWWzlwKO49+ql+Dll9kdMtL/0LkH6ePpY5nqDaitZ8bqW+RzxmM
        VtIJ+VHCjxoVmhWwEZMZ2VuG/KeGF7f0DKgwQ0AtAMjSVD8uCUGsldJUJKpOOwhRfYxY
        XzH4/kcfuLYmuer4tLOMfrydYgUNwxOs+rvT9XQoaBSKqJHvIq8bzTUbgGi7wuuGWvHu
        7nUVr1lhbNzbslS7sFSc3eKPpDIpQHj3orl80vLEcVN/jIhvbf3MOGIfRA711+SYeD0i
        /zNA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJDdfLYvL+f"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.0.7 SBL|AUTH)
        with ESMTPSA id N0b206vBCLcX4PM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 12 Dec 2019 22:38:33 +0100 (CET)
Date:   Thu, 12 Dec 2019 22:38:26 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: Re: [PATCH] Input: pm8xxx-vib - fix handling of separate enable
 register
Message-ID: <20191212213826.GA190714@gerhold.net>
References: <20191211190026.52662-1-stephan@gerhold.net>
 <20191212195031.GE101194@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212195031.GE101194@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 12, 2019 at 11:50:31AM -0800, Dmitry Torokhov wrote:
> On Wed, Dec 11, 2019 at 08:00:26PM +0100, Stephan Gerhold wrote:
> > Setting the vibrator enable_mask is not implemented correctly:
> > 
> > For regmap_update_bits(map, reg, mask, val) we give in either
> > regs->enable_mask or 0 (= no-op) as mask and "val" as value.
> > But "val" actually refers to the vibrator voltage control register,
> > which has nothing to do with the enable_mask.
> > 
> > So we usually end up doing nothing when we really wanted
> > to enable the vibrator.
> > 
> > We want to set or clear the enable_mask (to enable/disable the vibrator).
> > Therefore, change the call to always modify the enable_mask
> > and set the bits only if we want to enable the vibrator.
> > 
> > Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
> > Fixes: d4c7c5c96c92 ("Input: pm8xxx-vib - handle separate enable register")
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/input/misc/pm8xxx-vibrator.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
> > index ecd762f93732..8dc345604a4d 100644
> > --- a/drivers/input/misc/pm8xxx-vibrator.c
> > +++ b/drivers/input/misc/pm8xxx-vibrator.c
> > @@ -90,7 +90,8 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
> >  
> >  	if (regs->enable_mask)
> >  		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
> > -					on ? regs->enable_mask : 0, val);
> > +					regs->enable_mask,
> > +					on ? regs->enable_mask : 0);
> 
> Would it be even clearer to say
> 
> 		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
> 					regs->enable_mask, on ? ~0 : 0);
> 
> ?

Functionally it would be equivalent.
I think I considered it when writing the patch, but in my opinion
it does not make the code more readable. We never want to set more than
the bits in the mask, so there is no reason to set them in the value.

But I can change it if you would prefer having ~0. Just let me know!

Thanks,
Stephan
