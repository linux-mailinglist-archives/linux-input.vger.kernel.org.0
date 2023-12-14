Return-Path: <linux-input+bounces-789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76B812C8F
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 11:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C421F21253
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 10:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ECC93A8DF;
	Thu, 14 Dec 2023 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="vu8dIddZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DCVgaY1w"
X-Original-To: linux-input@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C378210C;
	Thu, 14 Dec 2023 02:13:15 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702548793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4KtZqhLwQpxwrA7SZmR5b4sAUtpNYrPFJBzpeXfJ6Q=;
	b=vu8dIddZGEA8yqcIEky3Ws0+41c8fy09Psn4xnnKAhQNCJQlPLuFq9QgKsDZXlouKq/APf
	DY7pEiyE6JslPSA6oDcBGrRKYU8+AojdzihFLLl/Q2uoxH8XKJUtkQ7d6Eux1BjJB6RVTK
	K2QPF3X9x55owV7WEX9KyKntz+6MOyPM4l8io81ZEJJdlDvbj8ErjGxT+lra50ehEVVoHU
	P10+w/xHG04eDDfLKudCWhfUR2xa7V9HUXZmS6m6Gtr21MtZlAekvqIq2yrmyntidmv+tM
	UyCN2JDnMJcmFrHy+dEEfU5oj7KYd5CAlTh/F0n3oMixRK6QKWk73YDOvT7UjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702548793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W4KtZqhLwQpxwrA7SZmR5b4sAUtpNYrPFJBzpeXfJ6Q=;
	b=DCVgaY1wyiKGFqlJhtZGO77Q4tX0wBNCm/ezqU+e78JCmMuzPc9LKUVl5Z/RjRV2Wpo8wR
	pYAxkH3Katr0CTBA==
To: xiongxin <xiongxin@kylinos.cn>, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, stable@vger.kernel.org, Riwen Lu
 <luriwen@kylinos.cn>, hoan@os.amperecomputing.com,
 fancer.lancer@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 andy@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called
 in pairs
In-Reply-To: <1844c927-2dd4-49b4-a6c4-c4c176b1f75d@kylinos.cn>
References: <20231207014003.12919-1-xiongxin@kylinos.cn>
 <87ttosssxd.ffs@tglx> <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
 <874jgnqwlo.ffs@tglx> <bf4004bf-4868-4953-8d8e-0c0e03be673e@kylinos.cn>
 <875y12p2r0.ffs@tglx> <1844c927-2dd4-49b4-a6c4-c4c176b1f75d@kylinos.cn>
Date: Thu, 14 Dec 2023 11:13:12 +0100
Message-ID: <87plz9nlc7.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14 2023 at 09:54, xiongxin wrote:
> =E5=9C=A8 2023/12/13 22:59, Thomas Gleixner =E5=86=99=E9=81=93:
>> Did you actually look at the sequence I gave you?
>>=20
>>     Suspend:
>>=20
>> 	  i2c_hid_core_suspend()
>> 	     disable_irq();       <- Marks it disabled and eventually
>> 				     masks it.
>>=20
>> 	  gpio_irq_suspend()
>> 	     save_registers();    <- Saves masked interrupt
>>=20
>>     Resume:
>>=20
>> 	  gpio_irq_resume()
>> 	     restore_registers(); <- Restores masked interrupt
>>=20
>> 	  i2c_hid_core_resume()
>> 	     enable_irq();        <- Unmasks interrupt and removes the
>> 				     disabled marker
>>=20
>>=20
>> Have you verified that this order of invocations is what happens on
>> your machine?
>
> As described earlier, in the current situation, the irq_mask() callback=20
> of gpio irq_chip is called in mask_irq(), followed by the disable_irq()=20
> in i2c_hid_core_suspend(), unmask_irq() will not be executed.

Which is correct.

> Then call enable_irq() in i2c_hid_core_resume(). Since gpio irq_chip=20
> does not implement the irq_startup() callback, it ends up calling=20
> irq_enable().
>
> The irq_enable() function is then implemented as follows:
>
> irq_state_clr_disabled(desc);
> if (desc->irq_data.chip->irq_enable) {
> 	desc->irq_data.chip->irq_enable(&desc->irq_data);
> 	irq_state_clr_masked(desc);
> } else {
> 	unmask_irq(desc);
> }
>
> Because gpio irq_chip implements irq_enable(), unmask_irq() is not=20
> executed, and gpio irq_chip's irq_unmask() callback is not called.=20
> Instead, irq_state_clr_masked() was called to clear the masked flag.
>
> The irq masked behavior is actually controlled by the=20
> irq_mask()/irq_unmask() callback function pairs in gpio irq_chip. When=20
> the whole situation occurs, there is one more irq_mask() operation, or=20
> one less irq_unmask() operation. This ends the i2c hid resume and the=20
> gpio corresponding i2c hid interrupt is also masked.
>
> Please help confirm whether the current situation is a BUG, or suggest=20
> other solutions to fix it.

Again, I already explained to you in great detail why the core code is
correct and does not have a bug.

But as you insist that the bug is in the core code you obviously failed
to validate what I asked you to validate:

>> 	  i2c_hid_core_resume()
>> 	     enable_irq();        <- Unmasks interrupt and removes the
>> 				     disabled marker

The keyword to validate here is 'Unmasks'.

As gpio_dwapb implements the irq_enable() callback enable_irq() is not
going to end up invoking the irq_unmask() callback. But the irq_enable()
callback is required to be a superset of irq_unmask(). I.e. the core
code expects it to do:

    1) Some preparatory work to enable the interrupt line

    2) Unmask the interrupt, which is why the masked state is cleared
       by the core after invoking the irq_enable() callback.

which is pretty obvious because if an interrupt chip does not implement
the irq_enable() callback the core defaults to irq_unmask()

Correspondingly the core expects from the irq_disable() callback:

    1) To mask the interrupt

    2) To do some extra work to disable the interrupt line

which is obvious again because the core defaults to irq_mask() if the
irq_disable() callback is not implemented by the interrupt chip.

I'm pretty sure that with the previous provided information and the
extra information above you can figure out yourself that:

  1) the core code is correct as is

  2) where exactly the problem is located and how to fix it

No?

Thanks,

        tglx

