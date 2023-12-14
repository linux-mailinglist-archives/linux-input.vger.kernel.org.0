Return-Path: <linux-input+bounces-778-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B64AF8124D2
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 02:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B34128286C
	for <lists+linux-input@lfdr.de>; Thu, 14 Dec 2023 01:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB6B65B;
	Thu, 14 Dec 2023 01:54:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4673EE3;
	Wed, 13 Dec 2023 17:54:25 -0800 (PST)
X-UUID: 9adb435ddafe451b89aac4d78a16ce0f-20231214
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:93de4f45-1a62-41a9-b5b1-da36f8375241,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.33,REQID:93de4f45-1a62-41a9-b5b1-da36f8375241,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:e05e2c61-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:231212231719IH1VMLZ5,BulkQuantity:15,Recheck:0,SF:38|24|17|19|44|64|
	66|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_OBB,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 9adb435ddafe451b89aac4d78a16ce0f-20231214
Received: from node4.com.cn [(39.156.73.12)] by mailgw
	(envelope-from <xiongxin@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 473595861; Thu, 14 Dec 2023 09:54:10 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 4062B16001CC8;
	Thu, 14 Dec 2023 09:54:10 +0800 (CST)
X-ns-mid: postfix-657A6042-155688377
Received: from [172.20.116.203] (unknown [172.20.116.203])
	by node4.com.cn (NSMail) with ESMTPA id 8192316001CC8;
	Thu, 14 Dec 2023 01:54:07 +0000 (UTC)
Message-ID: <1844c927-2dd4-49b4-a6c4-c4c176b1f75d@kylinos.cn>
Date: Thu, 14 Dec 2023 09:54:06 +0800
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
 <bf4004bf-4868-4953-8d8e-0c0e03be673e@kylinos.cn> <875y12p2r0.ffs@tglx>
From: xiongxin <xiongxin@kylinos.cn>
In-Reply-To: <875y12p2r0.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2023/12/13 22:59, Thomas Gleixner =E5=86=99=E9=81=93:
> On Wed, Dec 13 2023 at 10:29, xiongxin wrote:
>> =E5=9C=A8 2023/12/12 23:17, Thomas Gleixner =E5=86=99=E9=81=93:
>> Sorry, the previous reply may not have clarified the BUG process. I
>> re-debugged and confirmed it yesterday. The current BUG execution
>> sequence is described as follows:
>=20
> It's the sequence how this works and it works correctly.
>=20
> Just because it does not work on your machine it does not mean that thi=
s
> is incorrect and a BUG.
>=20
> You are trying to fix a symptom and thereby violating guarantees of the
> core code.
>=20
>> That is, there is a time between the 1:handle_level_irq() and
>> 3:irq_thread_fn() calls for the 2:disable_irq() call to acquire the lo=
ck
>> and then implement the irq_state_set_disabled() operation. When finall=
y
>> call irq_thread_fn()->irq_finalize_oneshot(), it cannot enter the
>> unmask_thread_irq() process.
>=20
> Correct, because the interrupt has been DISABLED in the mean time.
>=20
>> In this case, the gpio irq_chip irq_mask()/irq_unmask() callback pairs
>> are not called in pairs, so I think this is a BUG, but not necessarily
>> fixed from the irq core code layer.
>=20
> No. It is _NOT_ a BUG. unmask() is not allowed to be invoked when the
> interrupt is DISABLED. That's the last time I'm going to tell you that.
> Only enable_irq() can undo the effect of disable_irq(), period.
>=20
>> Next, when the gpio controller driver calls the suspend/resume process=
,
>> it is as follows:
>>
>> suspend process:
>> dwapb_gpio_suspend()
>>       ctx->int_mask   =3D dwapb_read(gpio, GPIO_INTMASK);
>>
>> resume process:
>> dwapb_gpio_resume()
>>       dwapb_write(gpio, GPIO_INTMASK, ctx->int_mask);
>=20
> Did you actually look at the sequence I gave you?
>=20
>     Suspend:
>=20
> 	  i2c_hid_core_suspend()
> 	     disable_irq();       <- Marks it disabled and eventually
> 				     masks it.
>=20
> 	  gpio_irq_suspend()
> 	     save_registers();    <- Saves masked interrupt
>=20
>     Resume:
>=20
> 	  gpio_irq_resume()
> 	     restore_registers(); <- Restores masked interrupt
>=20
> 	  i2c_hid_core_resume()
> 	     enable_irq();        <- Unmasks interrupt and removes the
> 				     disabled marker
>=20
>=20
> Have you verified that this order of invocations is what happens on
> your machine?
>=20
> Thanks,
>=20
>          tglx

As described earlier, in the current situation, the irq_mask() callback=20
of gpio irq_chip is called in mask_irq(), followed by the disable_irq()=20
in i2c_hid_core_suspend(), unmask_irq() will not be executed.

Then call enable_irq() in i2c_hid_core_resume(). Since gpio irq_chip=20
does not implement the irq_startup() callback, it ends up calling=20
irq_enable().

The irq_enable() function is then implemented as follows:

irq_state_clr_disabled(desc);
if (desc->irq_data.chip->irq_enable) {
	desc->irq_data.chip->irq_enable(&desc->irq_data);
	irq_state_clr_masked(desc);
} else {
	unmask_irq(desc);
}

Because gpio irq_chip implements irq_enable(), unmask_irq() is not=20
executed, and gpio irq_chip's irq_unmask() callback is not called.=20
Instead, irq_state_clr_masked() was called to clear the masked flag.

The irq masked behavior is actually controlled by the=20
irq_mask()/irq_unmask() callback function pairs in gpio irq_chip. When=20
the whole situation occurs, there is one more irq_mask() operation, or=20
one less irq_unmask() operation. This ends the i2c hid resume and the=20
gpio corresponding i2c hid interrupt is also masked.

Please help confirm whether the current situation is a BUG, or suggest=20
other solutions to fix it.


