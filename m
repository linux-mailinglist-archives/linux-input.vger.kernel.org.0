Return-Path: <linux-input+bounces-9797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57566A2953D
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 16:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDE7D18847C8
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 15:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CBD41946B1;
	Wed,  5 Feb 2025 15:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="qaKuTW7g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693619259E;
	Wed,  5 Feb 2025 15:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770670; cv=none; b=Yh9tHO49Y5m4x/TkTRheQJ0RFjLGwT6sRFscv3wnyuXU8qi8l4Kww2eXMyQzrd7fLgKRmNAF4MHCKcTXWUl6n42RCxff95J+m4CfZ9Xz7K+DGJygmqB5s7YCH7eb0YxM5dolrMhP5Rd2gsPGcMLzOmERMXeTwtMvSk53Z2tr03Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770670; c=relaxed/simple;
	bh=NhPpYHkJzdx9mLMRYJYHdoEtTD8D6E2oHbhTAtJyPS4=;
	h=Date:From:To:Cc:Message-Id:In-Reply-To:References:Mime-Version:
	 Content-Type:Subject; b=Mcx7eoS7JP4VsVSyJWOIHwyJPcAVUiU2fe0p6HFtZvZ+qvz+auXzyxN/+ZNMyW9T0LToOiHaYig6hXxQwl6/y744VnQlvqdJcr17ieQK7W4OeUclx4VMlwD7FH/bwIaFtFU+P35K3N5KB9L4hXO86vKiDC24oYVFxe5WGhxwaWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=qaKuTW7g; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=yZg+oI2Ua6zX+3n+8KZ5jmQeWW9OzEWiVA+W0PmqN4g=; b=qaKuTW7g9kQeRBeSs7oa1DsKfy
	RUuRDNQLfDkPUEcGFT6KRW7TMc+5cljAnwE/rqa8goG1GxP68+wKPx64KNjQhZrApLEbWUml611vv
	eFNsIPLJB3lol1HPsmxrGvlpAoLDUXgAAoCNXMTKAkl1qugWoBvjnzEUFW2BT3+1T9mY=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:41000 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1tfhg2-0000am-Jv; Wed, 05 Feb 2025 10:50:59 -0500
Date: Wed, 5 Feb 2025 10:50:57 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alistair Francis
 <alistair@alistair23.me>, Maxime Ripard <mripard@kernel.org>,
 =?ISO-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@bootlin.com>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, stable@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <20250205105057.3ec9fe8c8935c3a72061edad@hugovil.com>
In-Reply-To: <Z6OE0IRgaovHMf34@google.com>
References: <20250204190100.2210863-1-hugo@hugovil.com>
	<Z6OE0IRgaovHMf34@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -2.8 NICE_REPLY_A Looks like a legit reply (A)
Subject: Re: [PATCH] Input: cyttsp5 - ensure minimum reset pulse width
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

On Wed, 5 Feb 2025 07:33:36 -0800
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Tue, Feb 04, 2025 at 02:01:00PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > The current reset pulse width is measured to be 5us on a
> > Renesas RZ/G2L SOM. The manufacturer's minimum reset pulse width is
> > specified as 10us.
> > 
> > Extend reset pulse width to make sure it is long enough on all platforms.
> > 
> > Also reword confusing comments about reset pin assertion.
> > 
> > Fixes: 5b0c03e24a06 ("Input: Add driver for Cypress Generation 5 touchscreen")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index eafe5a9b8964..bb09e84d0e92 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -870,13 +870,16 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
> >  	ts->input->phys = ts->phys;
> >  	input_set_drvdata(ts->input, ts);
> >  
> > -	/* Reset the gpio to be in a reset state */
> > +	/* Assert gpio to be in a reset state */
> >  	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> >  	if (IS_ERR(ts->reset_gpio)) {
> >  		error = PTR_ERR(ts->reset_gpio);
> >  		dev_err(dev, "Failed to request reset gpio, error %d\n", error);
> >  		return error;
> >  	}
> > +
> > +	fsleep(1000); /* Ensure long-enough reset pulse (minimum 10us). */
> > +
> 
> If the manufacturer specified that 10us is enough why do we want to wait
> 100 times longer?

Hi,
10us would do fine. I simply put 1ms because it is then much easier to
see the reset pulse on an oscilloscope when correlating it
with other signals.

Hugo.


-- 
Hugo Villeneuve

