Return-Path: <linux-input+bounces-617-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF280A4CC
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 14:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76EAC1C20B05
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 13:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC47913FE7;
	Fri,  8 Dec 2023 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nAP3teOR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bZenc8Vk"
X-Original-To: linux-input@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7E971BDD;
	Fri,  8 Dec 2023 05:52:16 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702043535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cY9h0xpNYKD1GgCvWHIKW7HxGN+8BOpJODQvyF1W+hY=;
	b=nAP3teORNrgb4+iSl0XCr7IocYbmCc58imHsXHX07xA1XqNYB1OArt5TfIIN+eQCWSq/Kb
	iTEUt/DiAn1H5y55mvTdO00SjxWGlAMMnZAE4N0ufBmb6ot+zuABwf8/jkRcn9FAdAlFQ/
	NNKr+yKwQUx18Aw46eCOoTcMyn0klacYLyofWGdsuHjANSlrQ+309UNijL4xxSUvJe1diP
	8HXA1Q7wFbqMBuHRPhtS2/0W0R7DNn42JTZBGbATU5J+7U67V8u6yoxxtBRhBwZ9N7zp59
	KQHn5NITOKge59tCgQ+tJ/P7J/2doZBojf6J22+42nlFx3W3L/lyC36sFLRN8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702043535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cY9h0xpNYKD1GgCvWHIKW7HxGN+8BOpJODQvyF1W+hY=;
	b=bZenc8VkW0nAI4Gc+s8z/wMG8In/d3PRW3XJxVEzw+mRzQfIGK54m30DndTSIRhg8XpKRI
	ipsNWhATBUSfg8Cg==
To: xiongxin <xiongxin@kylinos.cn>, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, xiongxin <xiongxin@kylinos.cn>,
 stable@vger.kernel.org, Riwen Lu <luriwen@kylinos.cn>
Subject: Re: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called
 in pairs
In-Reply-To: <20231207014003.12919-1-xiongxin@kylinos.cn>
References: <20231207014003.12919-1-xiongxin@kylinos.cn>
Date: Fri, 08 Dec 2023 14:52:14 +0100
Message-ID: <87ttosssxd.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Dec 07 2023 at 09:40, xiongxin@kylinos.cn wrote:
> When an interrupt controller uses a function such as handle_level_irq()
> as an interrupt handler and the controller implements the irq_disable()
> callback, the following scenario will appear in the i2c-hid driver in
> the sleep scenario:
>
> in the sleep flow, while the user is still triggering the i2c-hid
> interrupt, we get the following function call:
>
>   handle_level_irq()
>     -> mask_ack_irq()
>       -> mask_irq()
> 				i2c_hid_core_suspend()
> 				  -> disable_irq()
> 				    -> __irq_disable()
> 				      -> irq_state_set_disabled()
> 				      -> irq_state_set_masked()
>
>   irq_thread_fn()
>     -> irq_finalize_oneshot()
>       -> if (!desc->threads_oneshot && !irqd_irq_disabled() &&
> 	     irqd_irq_masked())
>       	 	unmask_threaded_irq()
> 		  -> unmask_irq()
>
> That is, when __irq_disable() is called between mask_irq() and
> irq_finalize_oneshot(), the code in irq_finalize_oneshot() will cause
> the !irqd_irq_disabled() fails to enter the unmask_irq() branch, which
> causes mask_irq/unmask_irq to be called unpaired and the i2c-hid
> interrupt to be masked.
>
> Since mask_irq/unmask_irq and irq_disabled() belong to two different
> hardware registers or policies, the !irqd_irq_disabled() assertion may
> not be used to determine whether unmask_irq() needs to be called.

No. That's fundamentally wrong.

Disabled interrupts are disabled and can only be reenabled by the
corresponding enable call. The existing code is entirely correct.

What you are trying to do is unmasking a disabled interrupt, which
results in inconsistent state.

Which interrupt chip is involved here?

Thanks,

        tglx


