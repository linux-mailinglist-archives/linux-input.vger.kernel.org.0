Return-Path: <linux-input+bounces-733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCDC810843
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 03:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D04B20B5E
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 02:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3655F1873;
	Wed, 13 Dec 2023 02:30:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC560101;
	Tue, 12 Dec 2023 18:30:14 -0800 (PST)
X-UUID: 23b6f26f9c354f429e0ca723976e2f3d-20231213
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:ef6927eb-3923-4079-9844-08b7e0e0a892,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.33,REQID:ef6927eb-3923-4079-9844-08b7e0e0a892,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:fb812161-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:231212231719IH1VMLZ5,BulkQuantity:5,Recheck:0,SF:38|24|17|19|44|64|6
	6|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 23b6f26f9c354f429e0ca723976e2f3d-20231213
Received: from node4.com.cn [(39.156.73.12)] by mailgw
	(envelope-from <xiongxin@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 130070774; Wed, 13 Dec 2023 10:30:05 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id E090716001CC8;
	Wed, 13 Dec 2023 10:30:04 +0800 (CST)
X-ns-mid: postfix-6579172C-799352856
Received: from [172.20.116.203] (unknown [172.20.116.203])
	by node4.com.cn (NSMail) with ESMTPA id 278DD16001CC8;
	Wed, 13 Dec 2023 02:29:58 +0000 (UTC)
Message-ID: <bf4004bf-4868-4953-8d8e-0c0e03be673e@kylinos.cn>
Date: Wed, 13 Dec 2023 10:29:57 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called
 in pairs
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, stable@vger.kernel.org,
 Riwen Lu <luriwen@kylinos.cn>, hoan@os.amperecomputing.com,
 fancer.lancer@gmail.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 andy@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231207014003.12919-1-xiongxin@kylinos.cn> <87ttosssxd.ffs@tglx>
 <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn> <874jgnqwlo.ffs@tglx>
From: xiongxin <xiongxin@kylinos.cn>
In-Reply-To: <874jgnqwlo.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2023/12/12 23:17, Thomas Gleixner =E5=86=99=E9=81=93:
> On Mon, Dec 11 2023 at 11:10, xiongxin@kylinos.cn wrote:
>> =E5=9C=A8 2023/12/8 21:52, Thomas Gleixner =E5=86=99=E9=81=93:
>>> On Thu, Dec 07 2023 at 09:40, xiongxin@kylinos.cn wrote:
>>> Disabled interrupts are disabled and can only be reenabled by the
>>> corresponding enable call. The existing code is entirely correct.
>>>
>>> What you are trying to do is unmasking a disabled interrupt, which
>>> results in inconsistent state.
>>>
>>> Which interrupt chip is involved here?
>>
>> i2c hid driver use gpio interrupt controller like
>> drivers/gpio/gpio-dwapb.c, The gpio interrupt controller code implemen=
ts
>> handle_level_irq() and irq_disabled().
>=20
> No it does not. handle_level_irq() is implemented in the interrupt core
> code and irq_disabled() is not a function at all.
>=20
> Please describe things precisely and not by fairy tales.
>=20
>> Normally, when using the i2c hid device, the gpio interrupt controller=
's
>> mask_irq() and unmask_irq() are called in pairs.
>=20
> Sure. That's how the core code works.
>=20
>> But when doing a sleep process, such as suspend to RAM,
>> i2c_hid_core_suspend() of the i2c hid driver is called, which implemen=
ts
>> the disable_irq() function,
>=20
> IOW, i2c_hid_core_suspend() disables the interrupt of the client device=
.
>=20
>> which finally calls __irq_disable(). Because
>> the desc parameter is set to the __irq_disabled() function without a
>> lock (desk->lock), the __irq_disabled() function can be called during
>=20
> That's nonsense.
>=20
> disable_irq(irq)
>    if (!__disable_irq_nosync(irq)
>       desc =3D irq_get_desc_buslock(irq, &flags, IRQ_GET_DESC_CHECK_GLO=
BAL);
>=20
>              ^^^^^^^^^^^^^^^^^^^^ This locks the interrupt descriptor
>=20
> And yes disable_irq() can be invoked when the interrupt is handled
> concurrently. That's legitimate and absolutely correct, but that has
> absolutely nothing to do with the locking.
>=20
> The point is that after disable_irq() returns the interrupt handler is
> guaranteed not to be running and not to be invoked anymore until
> something invokes enable_irq().
>=20
> The fact that disable_irq() marks the interrupt disabled prevents the
> hard interrupt handler and the threaded handler to unmask the interrupt=
.
> That's correct and fundamental to ensure that the interrupt is and stay=
s
> truly disabled.
>=20
>> if (!irqd_irq_disabled() && irqd_irq_masked())
>> 	unmask_irq();
>=20
>> In this scenario, unmask_irq() will not be called, and then gpio
>> corresponding interrupt pin will be masked.
>=20
> It _cannot_ be called because the interrupt is _disabled_, which means
> the interrupt stays masked. Correctly so.
>=20
>> Finally, in the suspend() process driven by gpio interrupt controller,
>> the interrupt mask register will be saved, and then masked will
>> continue to be read when resuming () process. After the kernel
>> resumed, the i2c hid gpio interrupt was masked and the i2c hid device
>> was unavailable.
>=20
> That's just wrong again.
>=20
> Suspend:
>=20
>         i2c_hid_core_suspend()
>            disable_irq();       <- Marks it disabled and eventually
>                                    masks it.
>=20
>         gpio_irq_suspend()
>            save_registers();    <- Saves masked interrupt
>=20
> Resume:
>=20
>         gpio_irq_resume()
>            restore_registers(); <- Restores masked interrupt
>=20
>         i2c_hid_core_resume()
>            enable_irq();        <- Unmasks interrupt and removes the
>                                    disabled marker
>=20
> As I explained you before, disable_irq() can only be undone by
> enable_irq() and not by ignoring the disabled state somewhere
> else. Disabled state is well defined.
>=20
> So if the drivers behave correctly in terms of suspend/resume ordering
> as shown above, then this all should just work.
>=20
> If it does not then please figure out what's the actual underlying
> problem instead of violating well defined constraints in the core code
> and telling me fairy tales about the code.
>=20
> Thanks,
>=20
>          tglx
>=20
>=20
>=20
>=20

Sorry, the previous reply may not have clarified the BUG process. I=20
re-debugged and confirmed it yesterday. The current BUG execution=20
sequence is described as follows:

1: call in interrupt context

handle_level_irq(struct irq_desc *desc)
     raw_spin_lock(&desc->lock);

     mask_ack_irq(desc);
         mask_irq(desc);
	    desc->irq_data.chip->irq_mask(&desc->irq_data);
	                         <--- gpio irq_chip irq_mask call func.
	    irq_state_set_masked(desc);
     ...
     handle_irq_event(desc); <--- wake interrupt handler thread

     cond_unmask_irq(desc);
     raw_spin_unlock(&desc->lock);

2: call in suspend process

i2c_hid_core_suspend()
     disable_irq(client->irq);
	__disable_irq_nosync(irq)
	    desc =3D irq_get_desc_buslock(...);

	    __disable_irq(desc);
		irq_disable(desc);
		    __irq_disable(...);
			irq_state_set_disabled(...); <-set disabled flag
			irq_state_set_masked(desc); <-set masked flag

	    irq_put_desc_busunlock(desc, flags);


3:  Interrupt handler thread call

irq_thread_fn()
     irq_finalize_oneshot(desc, action);
	raw_spin_lock_irq(&desc->lock);

	if (!desc->threads_oneshot &&
		!irqd_irq_disabled(&desc->irq_data) && <-
		irqd_irq_masked(&desc->irq_data))
	    unmask_threaded_irq(desc);
		unmask_irq(desc);
		    desc->irq_data.chip->irq_unmask(&desc->irq_data);
			        <--- gpio irq_chip irq_unmask call func.

	raw_spin_unlock_irq(&desc->lock);

That is, there is a time between the 1:handle_level_irq() and=20
3:irq_thread_fn() calls for the 2:disable_irq() call to acquire the lock=20
and then implement the irq_state_set_disabled() operation. When finally=20
call irq_thread_fn()->irq_finalize_oneshot(), it cannot enter the=20
unmask_thread_irq() process.

In this case, the gpio irq_chip irq_mask()/irq_unmask() callback pairs=20
are not called in pairs, so I think this is a BUG, but not necessarily=20
fixed from the irq core code layer.

Next, when the gpio controller driver calls the suspend/resume process,=20
it is as follows:

suspend process:
dwapb_gpio_suspend()
     ctx->int_mask   =3D dwapb_read(gpio, GPIO_INTMASK);

resume process:
dwapb_gpio_resume()
     dwapb_write(gpio, GPIO_INTMASK, ctx->int_mask);

In this case, the masked interrupt bit of GPIO interrupt corresponding=20
to i2c hid is saved, so that when gpio resume() process writes from the=20
register, the gpio interrupt bit corresponding to i2c hid is masked and=20
the i2c hid device cannot be used.

My first solution is to remove the !irqd_irq_disabled(&desc->irq_data)=20
condition and the BUG disappears. I can't think of a better solution=20
right now.

