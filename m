Return-Path: <linux-input+bounces-325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF57FD114
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 09:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 777F2282D57
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 08:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB531097A;
	Wed, 29 Nov 2023 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="k9iCPhXf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 496A01BD1;
	Wed, 29 Nov 2023 00:39:08 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 633F960514;
	Wed, 29 Nov 2023 08:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701247147;
	bh=4T2boRidFI8X28nZq5JoZ0Nop7HsXEFuU6HdeMnLYUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k9iCPhXf3wHSonjZls9kQPzVsqEbj1er44e00sKBvEUJo4lmUkLnF6fkTv7ipfyT2
	 XLq2qZaeF0OvlE00LdoP4nHpeSBKCqRzQojG8loLErM6JyC2haeGWWhWCT56ZKWj1z
	 KLzIdZ1FPlHc0ic+x8q7X2UgwS5xuE+rvgdQpCZPKkJKu8+yNp18nA4MsEKRcwcQQa
	 RMQlZNobYSmF9TPKEUXvmweZ/eG3IC6P1SsT2xQ92+aTb4INPPKxnfqH5QKVN4Cqon
	 81TSI/i9Yg+J3oWIN5EfnR4oLqggQuO/7IMejufJIq4yXZFTZH05sx54LCNvIHtoqQ
	 AnDKOi2uRfSXw==
Date: Wed, 29 Nov 2023 10:38:44 +0200
From: Tony Lindgren <tony@atomide.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
	Dhruva Gole <d-gole@ti.com>
Subject: Re: [PATCH v4 2/2] Input: gpio-keys - Add system suspend support for
 dedicated wakeirqs
Message-ID: <20231129083844.GU5169@atomide.com>
References: <20231124083241.40780-1-tony@atomide.com>
 <20231124083241.40780-2-tony@atomide.com>
 <ZWF9F9JHKJ-SjUjp@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWF9F9JHKJ-SjUjp@google.com>

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [231125 04:50]:
> Hi Tony,
> 
> On Fri, Nov 24, 2023 at 10:32:41AM +0200, Tony Lindgren wrote:
> > +	/*
> > +	 * Wakeirq shares the handler with the main interrupt, it's only
> > +	 * active during system suspend. See gpio_keys_button_enable_wakeup()
> > +	 * and gpio_keys_button_disable_wakeup().
> > +	 */
> > +	error = devm_request_any_context_irq(dev, bdata->wakeirq, isr,
> > +					     irqflags, wakedesc, bdata);
> > +	if (error < 0) {
> > +		dev_err(dev, "Unable to claim wakeirq %d; error %d\n",
> > +			bdata->irq, error);
> > +		return error;
> > +	}
> > +
> > +	/*
> > +	 * Disable wakeirq until suspend. IRQF_NO_AUTOEN won't work if
> > +	 * IRQF_SHARED was set based on !button->can_disable.
> > +	 */
> > +	disable_irq_nosync(bdata->wakeirq);
> 
> Why _nosync() here and below? Is there any harm in sing the normal
> variant?

Well they are enabled the same time anyways for a while, so I see no
harm using the normal variant here. Will post updated patches after
some testing.

Regards,

Tony

