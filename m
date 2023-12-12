Return-Path: <linux-input+bounces-722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707C80EFDF
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 16:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F8AE1F215A8
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 15:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93857541C;
	Tue, 12 Dec 2023 15:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w4NmgRDZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Qab6FhEk"
X-Original-To: linux-input@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B9D3EB;
	Tue, 12 Dec 2023 07:17:09 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702394228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GayfQxrY/CymGbkejGp/bbKypRcKuLfbKbrypnkTWsM=;
	b=w4NmgRDZ1/K4ayTKm8IlSHp5EEr3Z+eA/SEyrsoG+AtD5ATr8oHUfGthJV2k1cOzqtAjOq
	I1FrREimdb2zIF9Umczmon/6dSvUcG79zpBowzxGdIO77Ho0KOc+xLuWjUa7lPoqWkHZgE
	jENejlq8/QlBgihg1oCNdBLAmog/VdioeRVl5kyKr4OwlHWcPD6eCJDM/pB/rIWuj8cWba
	YDig22Xr9ha2wecOoHlMfC8cS3UHker5IZa1Y+bdMlhamDZl2SRESSM0Tzan9dUwEblP0L
	Yn/voE6gji6ytVuPN5gox58z5WOPstFmxgVsTcnzEeVZzv9DPlv9nIwlK2+u1Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702394228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GayfQxrY/CymGbkejGp/bbKypRcKuLfbKbrypnkTWsM=;
	b=Qab6FhEkGexI/N8REvRMlHPYczXTeNXIGyzv89qUsxr2p0+vMnqFvJ9S8A5+CJenn2q1x8
	mRVHjTb0ICcFtvBg==
To: xiongxin <xiongxin@kylinos.cn>, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, stable@vger.kernel.org, Riwen Lu
 <luriwen@kylinos.cn>
Subject: Re: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called
 in pairs
In-Reply-To: <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
References: <20231207014003.12919-1-xiongxin@kylinos.cn>
 <87ttosssxd.ffs@tglx> <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
Date: Tue, 12 Dec 2023 16:17:07 +0100
Message-ID: <874jgnqwlo.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11 2023 at 11:10, xiongxin@kylinos.cn wrote:
> =E5=9C=A8 2023/12/8 21:52, Thomas Gleixner =E5=86=99=E9=81=93:
>> On Thu, Dec 07 2023 at 09:40, xiongxin@kylinos.cn wrote:
>> Disabled interrupts are disabled and can only be reenabled by the
>> corresponding enable call. The existing code is entirely correct.
>>=20
>> What you are trying to do is unmasking a disabled interrupt, which
>> results in inconsistent state.
>>=20
>> Which interrupt chip is involved here?
>
> i2c hid driver use gpio interrupt controller like=20
> drivers/gpio/gpio-dwapb.c, The gpio interrupt controller code implements=
=20
> handle_level_irq() and irq_disabled().

No it does not. handle_level_irq() is implemented in the interrupt core
code and irq_disabled() is not a function at all.

Please describe things precisely and not by fairy tales.

> Normally, when using the i2c hid device, the gpio interrupt controller's=
=20
> mask_irq() and unmask_irq() are called in pairs.

Sure. That's how the core code works.

> But when doing a sleep process, such as suspend to RAM,=20
> i2c_hid_core_suspend() of the i2c hid driver is called, which implements=
=20
> the disable_irq() function,

IOW, i2c_hid_core_suspend() disables the interrupt of the client device.

> which finally calls __irq_disable(). Because=20
> the desc parameter is set to the __irq_disabled() function without a=20
> lock (desk->lock), the __irq_disabled() function can be called during

That's nonsense.

disable_irq(irq)
  if (!__disable_irq_nosync(irq)
     desc =3D irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLOBAL);

            ^^^^^^^^^^^^^^^^^^^^ This locks the interrupt descriptor

And yes disable_irq() can be invoked when the interrupt is handled
concurrently. That's legitimate and absolutely correct, but that has
absolutely nothing to do with the locking.

The point is that after disable_irq() returns the interrupt handler is
guaranteed not to be running and not to be invoked anymore until
something invokes enable_irq().

The fact that disable_irq() marks the interrupt disabled prevents the
hard interrupt handler and the threaded handler to unmask the interrupt.
That's correct and fundamental to ensure that the interrupt is and stays
truly disabled.

> if (!irqd_irq_disabled() && irqd_irq_masked())
> 	unmask_irq();

> In this scenario, unmask_irq() will not be called, and then gpio=20
> corresponding interrupt pin will be masked.

It _cannot_ be called because the interrupt is _disabled_, which means
the interrupt stays masked. Correctly so.

> Finally, in the suspend() process driven by gpio interrupt controller,
> the interrupt mask register will be saved, and then masked will
> continue to be read when resuming () process. After the kernel
> resumed, the i2c hid gpio interrupt was masked and the i2c hid device
> was unavailable.

That's just wrong again.

Suspend:

       i2c_hid_core_suspend()
          disable_irq();       <- Marks it disabled and eventually
                                  masks it.

       gpio_irq_suspend()
          save_registers();    <- Saves masked interrupt

Resume:

       gpio_irq_resume()
          restore_registers(); <- Restores masked interrupt

       i2c_hid_core_resume()
          enable_irq();        <- Unmasks interrupt and removes the
                                  disabled marker

As I explained you before, disable_irq() can only be undone by
enable_irq() and not by ignoring the disabled state somewhere
else. Disabled state is well defined.

So if the drivers behave correctly in terms of suspend/resume ordering
as shown above, then this all should just work.

If it does not then please figure out what's the actual underlying
problem instead of violating well defined constraints in the core code
and telling me fairy tales about the code.

Thanks,

        tglx





