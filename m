Return-Path: <linux-input+bounces-10806-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C41BA60AF7
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:14:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235EC19C1548
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 08:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17F7197A68;
	Fri, 14 Mar 2025 08:14:53 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0845A1990BA
	for <linux-input@vger.kernel.org>; Fri, 14 Mar 2025 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741940093; cv=none; b=R+WRw4X8DMyuFR/hU/WpJ233dP+A3JZ+9wSCCkVauOqyCKq9pQw5KenNFUMrVjSD4dB+YT2RkMFYDlSQ4K1TvMewjEVsIBbM0Pd91d1rFdbHzi1ZvVmd0ROpMVRMyMX6avJcEeLVr6eD7sTF5EBTvReHqdgMCRYFIVeDQ9iyiTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741940093; c=relaxed/simple;
	bh=Phim3QMX2arQqUJumjGiDsAj5I+AJWKE1SRlMfzlBYE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QU+9b2bbyXEdM1vhfvL3unj+4sQTQkoTptOXHTtP8OqF+5vY8SbxAGRnbLqP/WTaIbiGaVZ4En/S4gdvqDXjuugUNj3XxWLNb4nHjUs7wDx72dULeZcllSDTGSwZMI/0lQF2GQbEcf05LFKVeeSsESVlXEVF4/HhUvXXi/ZLcZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 57970cea-00ac-11f0-8da8-005056bdfda7;
	Fri, 14 Mar 2025 10:14:25 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 14 Mar 2025 10:14:25 +0200
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Michael Walle <mwalle@kernel.org>, Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-pwm@vger.kernel.org,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v4 07/10] gpio: max7360: Add MAX7360 gpio support
Message-ID: <Z9PlYSZDviGOCV7X@surfacebook.localdomain>
References: <20250214-mdb-max7360-support-v4-0-8a35c6dbb966@bootlin.com>
 <20250214-mdb-max7360-support-v4-7-8a35c6dbb966@bootlin.com>
 <Z69oa8_LKFxUacbj@smile.fi.intel.com>
 <D8FAX4E29LZK.3VUK90WB04MV2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8FAX4E29LZK.3VUK90WB04MV2@bootlin.com>

Thu, Mar 13, 2025 at 06:07:03PM +0100, Mathieu Dubois-Briand kirjoitti:
> On Fri Feb 14, 2025 at 4:59 PM CET, Andy Shevchenko wrote:
> > On Fri, Feb 14, 2025 at 12:49:57PM +0100, Mathieu Dubois-Briand wrote:
> > > Add driver for Maxim Integrated MAX7360 GPIO/GPO controller.

...

> > > +	/*
> > > +	 * MAX7360_REG_DEBOUNCE contains configuration both for keypad debounce
> > > +	 * timings and gpos/keypad columns repartition. Only the later is
> > > +	 * modified here.
> > > +	 */
> > > +	val = FIELD_PREP(MAX7360_PORTS, ngpios);
> > > +	ret = regmap_write_bits(regmap, MAX7360_REG_DEBOUNCE, MAX7360_PORTS, val);
> > > +	if (ret) {
> > > +		dev_err(dev, "Failed to write max7360 columns/gpos configuration");
> > > +		return ret;
> > > +	}
> >
> > Shouldn't this be configured via ->set_config() callback?
> 
> I believe this comment has been a bit outdated by our discussion on
> using GPIO valid mask, but I believe we could not use the ->set_config()
> callback here: this callback is made to configure a single pin while the
> gpos/keypad columns repartition is global.

Yeah, we have similar desing in Intel Bay Trail (see pinctrl-baytrail.c) and it
requires some software driven heuristics on how individual setting may affect
the global one. But the Q here is is the debounce affects only keypad? Then it
should be configured via keypad matrix driver. Btw, have you checked
drivers/input/keyboard/matrix_keypad.c? Is there anything that can be useful
here?

...

> > > +		if (irq < 0)
> > > +			return dev_err_probe(dev, irq, "Failed to get IRQ\n");
> > > +
> > > +		irq_chip = devm_kzalloc(dev, sizeof(*irq_chip), GFP_KERNEL);
> > > +		if (!irq_chip)
> > > +			return -ENOMEM;
> > > +
> > > +		irq_chip->name = dev_name(dev);
> > > +		irq_chip->status_base = MAX7360_REG_GPIOIN;
> > > +		irq_chip->num_regs = 1;
> > > +		irq_chip->num_irqs = MAX7360_MAX_GPIO;
> > > +		irq_chip->irqs = max7360_regmap_irqs;
> > > +		irq_chip->handle_mask_sync = max7360_handle_mask_sync;
> > > +		irq_chip->status_is_level = true;
> > > +		irq_chip->irq_drv_data = regmap;
> > > +
> > > +		for (unsigned int i = 0; i < MAX7360_MAX_GPIO; i++) {
> > > +			regmap_write_bits(regmap, MAX7360_REG_PWMCFG(i),
> > > +					  MAX7360_PORT_CFG_INTERRUPT_EDGES,
> > > +					  MAX7360_PORT_CFG_INTERRUPT_EDGES);
> > > +		}
> > > +
> > > +		flags = IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_SHARED;
> > > +		ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev), regmap, irq, flags, 0,
> > > +						      irq_chip, &irq_chip_data);
> >
> > Right.
> >
> > What I mean in previous discussion is to update gpio-regmap to call this from inside.
> > You need to add irq_chip pointer and irq_chip_data pointer to the regmap configuration
> > and if they are set (or the first one, I dunno if this is supported by IRQ chip core)
> > call this function and assign domain. This should be called after GPIO chip is
> > added, but before IRQ domain attachment.
> >
> 
> Ok, this is a bit more clear to me now. So I came up with something, it
> will be part of the next iteration, probably during the next week.
> 
> This required to add a few additional fields to the gpio_regmap_config
> structure, specifying the IRQ configuration:
> 
> + * @regmap_irq_chip:   (Optional) Pointer on an regmap_irq_chip structure. If
> + *                     set, a regmap-irq device will be created and the IRQ
> + *                     domain will be set accordingly.
> + * @regmap_irq_chip_data: (Optional) Pointer on an regmap_irq_chip_data
> + *                      structure pointer. If set, it will be populated with a
> + *                      pointer on allocated regmap_irq data.
> + * @regmap_irq_irqno   (Optional) The IRQ the device uses to signal interrupts.
> + * @regmap_irq_flags   (Optional) The IRQF_ flags to use for the interrupt.

Okay, just make sure it's guarded by the same ifdeffery as the similar in the
GPIO:

#ifdef CONFIG_GPIOLIB_IRQCHIP

...

> > > +
> > > +		regmap_write(regmap, MAX7360_REG_GPIOOUTM, outconf);
> > > +	}
> > > +
> > > +	/* Add gpio device. */
> > > +	gpio_config.parent = dev;
> > > +	gpio_config.regmap = regmap;
> >
> > > +	if (gpio_function == MAX7360_GPIO_PORT) {
> > > +		gpio_config.ngpio = MAX7360_MAX_GPIO;
> >
> > Why this case can't be managed also via ngpios property? Maybe at the end of
> > the day you rather need to have another property to tell where the split is?
> >
> > This will help a lot and removes unneeded sharing of ngpios here and there.
> >
> > What I read from this code is like you are trying to put _two_in_one_ semantics
> > on the shoulders of "ngpios".
> 
> So as I reworked the keypad columns GPIOs, PORT GPIOs and the COL GPIOs
> are a bit more similar on this point. So far I now use a constant value
> assigned in the driver for both, as I believe there is no way the number
> of GPIOs could be a different. Yet I can easily switch back to a value
> provided by a device property.

Sounds good as long as ngpios is not overloaded with the additional meanings.

-- 
With Best Regards,
Andy Shevchenko



