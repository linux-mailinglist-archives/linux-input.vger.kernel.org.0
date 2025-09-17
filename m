Return-Path: <linux-input+bounces-14798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD45B7DB26
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A57F16A8DB
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 10:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA3E309F12;
	Wed, 17 Sep 2025 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoL4Lspn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520242DA769;
	Wed, 17 Sep 2025 10:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758103469; cv=none; b=U7WJ4hm9kcp1aM8RdRzyCmJQ0BMM5bQ7Bh8xsSHkQ6R4QlNXKDRh1fw4JwAdwRo/qrDJeb1h8Ss28KRVK4BG6JVCSH1GJ7aba+4ABlJZyR7Oj4XJyCBZDD2IAJe/6cMweWOR28mzxzrSF7zfOpZMIcnm9lfExKEcd+7LdifQlZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758103469; c=relaxed/simple;
	bh=/6APkCpXyTTpfpKryVdY/WQFstQqkEet7cFfvdvoVdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avKYEqhb00q05eQ9Ej3xKkDhe6JLbR4SSUo8iFec90hikQethIHfyFp1UjnY8/rk5PIu7CUGQXerggtSmWCwHFbQDuA2vLkaSn6M1ZuomJPecZiKgHOZn1gs4OzTzo8kiX1y4O/ZFH6dZu+HKCgGS1YcFft5QLATeG54sdlmx/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoL4Lspn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3225AC4CEF0;
	Wed, 17 Sep 2025 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758103467;
	bh=/6APkCpXyTTpfpKryVdY/WQFstQqkEet7cFfvdvoVdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PoL4Lspn5wf1qtzmDJrHMtDfgt6OL1mS/xug3r2rF2KqPbeHh3q1EIM4wU/AVM7L9
	 Qei8LCEoJ9Jx438Ay33ZI3My99hdsCk93hb0RURTMscL4IeQWRul1hOz+K97vvEryJ
	 zhZfDBs2fEq/ghF6myOFiQVqJ/flagNWY0DQBvRh/ba8ZGq7bwb45VhoczgMBjq0BB
	 Zv6sg9sHf7R/I2i5KshpxoZS1ldeAwvUPl3ivpiH7cjpmpfxhmefQp9rn7cVrQdD4f
	 io3RoA3kC0CMTnM/MGFCEEJSYSLFh5l8qSUMXquejBrY/u3S2ex1+2eFrutV9+Phfd
	 NdjETaZL0J1pw==
Date: Wed, 17 Sep 2025 11:04:22 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexander Kurz <akurz@blala.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/8] mfd: mc13xxx: Use devm_mfd_add_devices and
 devm_regmap_add_irq_chip
Message-ID: <20250917100422.GH3893363@google.com>
References: <20250914193723.10544-1-akurz@blala.de>
 <20250914193723.10544-5-akurz@blala.de>
 <fqhldiqylcsp6kp4tvhopxekgszabbemnvbseygkqaipgp5mhl@wtz6c7kjloko>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fqhldiqylcsp6kp4tvhopxekgszabbemnvbseygkqaipgp5mhl@wtz6c7kjloko>

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
> 
> I'd remove mutex_destroy() as well (and transitively get rid of 
> mc13xxx_common_exit()) and then look into getting rid of  mc13xxx_lock()
> and mc13xxx_unlock() because, as I mentioned in another email, they are
> IMO not needed.
> 
> But this version of the patch is broken as far as I can tell.

Thanks for the input Dmitry.

I have removed the patch until this gets resolved.

-- 
Lee Jones [李琼斯]

