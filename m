Return-Path: <linux-input+bounces-14842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D8B83494
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 09:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9ACA1BC6441
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 07:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA872E03E0;
	Thu, 18 Sep 2025 07:19:59 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43D023315A;
	Thu, 18 Sep 2025 07:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758179999; cv=none; b=ZR2lP8KPFZ4cPfnpmSx9oGo2+0MwMxgJ0fmd07lAuAOICJ/ZdMr0XibXtms9waAkOpqKQqN1bPrs6fQPu/Q8zJIq9fOcRTrlAEeZIB4G20j2/R06sVso9WVmSRWPYOLw3QcjJDgCrKFD3faR10edReCHaDhfEhB50oxQITEOuz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758179999; c=relaxed/simple;
	bh=VvMIAtEi37Ksv2pemOmzDYTf0zTpsAVgWcNFBkpSQto=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Gq0ICWdFsymx2BZsSgBXBmQatRlvvTuKbb8CqRUlqtUGJJE2/g+Xe88fPGw/1uOrf7yvTyQyr8iKYFULejZvFDKrxR+Sqf+ElOdH2/DKcqWQOEo0UYogo/dL8qYD+Sv1klZOL/VRLdopM8hUoZAA3ixRCrdIvdFDdQoe4M8QP5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de; spf=pass smtp.mailfrom=blala.de; arc=none smtp.client-ip=213.160.73.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id 58I7P6Mh009840;
	Thu, 18 Sep 2025 07:25:06 GMT
Received: from localhost (akurz@localhost)
	by blala.de (8.15.2/8.15.2/Submit) with ESMTP id 58I7P5Wt009836;
	Thu, 18 Sep 2025 07:25:05 GMT
Date: Thu, 18 Sep 2025 07:25:05 +0000 (UTC)
From: Alexander Kurz <akurz@blala.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] mfd: mc13xxx: Use devm_mfd_add_devices and
 devm_regmap_add_irq_chip
In-Reply-To: <fqhldiqylcsp6kp4tvhopxekgszabbemnvbseygkqaipgp5mhl@wtz6c7kjloko>
Message-ID: <alpine.DEB.2.21.2509180710190.9711@blala.de>
References: <20250914193723.10544-1-akurz@blala.de> <20250914193723.10544-5-akurz@blala.de> <fqhldiqylcsp6kp4tvhopxekgszabbemnvbseygkqaipgp5mhl@wtz6c7kjloko>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


Hi Dimitry
On Tue, 16 Sep 2025, Dmitry Torokhov wrote:

> Hi Alexander,
> 
> On Sun, Sep 14, 2025 at 07:37:19PM +0000, Alexander Kurz wrote:
> > Use devm_mfd_add_devices() for adding MFD child devices and
> > devm_regmap_add_irq_chip() for IRQ chip registration.
> > 
> > This reduces the amount of required cleanup.
> > 
> > Signed-off-by: Alexander Kurz <akurz@blala.de>
> > ---
> >  drivers/mfd/mc13xxx-core.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mfd/mc13xxx-core.c b/drivers/mfd/mc13xxx-core.c
> > index 920797b806ce..091c9171b2b7 100644
> > --- a/drivers/mfd/mc13xxx-core.c
> > +++ b/drivers/mfd/mc13xxx-core.c
> > @@ -381,7 +381,7 @@ static int mc13xxx_add_subdevice_pdata(struct mc13xxx *mc13xxx,
> >  	if (!cell.name)
> >  		return -ENOMEM;
> >  
> > -	return mfd_add_devices(mc13xxx->dev, -1, &cell, 1, NULL, 0,
> > +	return devm_mfd_add_devices(mc13xxx->dev, -1, &cell, 1, NULL, 0,
> >  			       regmap_irq_get_domain(mc13xxx->irq_data));
> >  }
> >  
> > @@ -455,8 +455,9 @@ int mc13xxx_common_init(struct device *dev)
> >  	mc13xxx->irq_chip.irqs = mc13xxx->irqs;
> >  	mc13xxx->irq_chip.num_irqs = ARRAY_SIZE(mc13xxx->irqs);
> >  
> > -	ret = regmap_add_irq_chip(mc13xxx->regmap, mc13xxx->irq, IRQF_ONESHOT,
> > -				  0, &mc13xxx->irq_chip, &mc13xxx->irq_data);
> > +	ret = devm_regmap_add_irq_chip(dev, mc13xxx->regmap, mc13xxx->irq,
> > +				       IRQF_ONESHOT, 0, &mc13xxx->irq_chip,
> > +				       &mc13xxx->irq_data);
> >  	if (ret)
> >  		return ret;
> >  
> > @@ -502,8 +503,6 @@ void mc13xxx_common_exit(struct device *dev)
> >  {
> >  	struct mc13xxx *mc13xxx = dev_get_drvdata(dev);
> >  
> > -	mfd_remove_devices(dev);
> > -	regmap_del_irq_chip(mc13xxx->irq, mc13xxx->irq_data);
> >  	mutex_destroy(&mc13xxx->lock);
> 
> This causes the mutex be destroyed while the sub-devices are still
> present. The power button will try to call mc13xxx_lock() and
> mc13xxx_unlock() and of mutex debugging is enabled you'll get errors.
Thanks for noting this, actually I have introduced this change
in v4 of this series.

> I'd remove mutex_destroy() as well (and transitively get rid of 
> mc13xxx_common_exit()) and then look into getting rid of  mc13xxx_lock()
> and mc13xxx_unlock() because, as I mentioned in another email, they are
> IMO not needed.
I would prefer not to extend the scope of this series even further
and just drop this patch for v5.

There are still more issues todo with mc13xxx, e.g. mc13xxx-led does
not work since commit 78efa53e715e ("leds: Init leds class earlier").
Cleaning up potentially legacy mutex is just one more topic on this list. 
> 
> But this version of the patch is broken as far as I can tell.
> 
> Thanks.
> 
> -- 
> Dmitry
> 
Thanks, Alexander

