Return-Path: <linux-input+bounces-665-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF6C80BFB6
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 04:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D19C21C203D9
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 03:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0264415AF0;
	Mon, 11 Dec 2023 03:10:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92443E8;
	Sun, 10 Dec 2023 19:10:27 -0800 (PST)
X-UUID: 2f269539609442659892205517491fd9-20231211
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:62c8136e-073c-4878-b7dd-767f5e0d5c50,IP:25,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:10
X-CID-INFO: VERSION:1.1.33,REQID:62c8136e-073c-4878-b7dd-767f5e0d5c50,IP:25,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-META: VersionHash:364b77b,CLOUDID:8d3a83fd-4a48-46e2-b946-12f04f20af8c,B
	ulkID:231208215233DWQSX4TV,BulkQuantity:2,Recheck:0,SF:38|24|17|19|44|64|6
	6|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 2f269539609442659892205517491fd9-20231211
Received: from node4.com.cn [(39.156.73.12)] by mailgw
	(envelope-from <xiongxin@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 698891748; Mon, 11 Dec 2023 11:10:13 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 2795116001CC8;
	Mon, 11 Dec 2023 11:10:13 +0800 (CST)
X-ns-mid: postfix-65767D94-604234385
Received: from [172.20.116.203] (unknown [172.20.116.203])
	by node4.com.cn (NSMail) with ESMTPA id CCE7C16001CC8;
	Mon, 11 Dec 2023 03:10:11 +0000 (UTC)
Message-ID: <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
Date: Mon, 11 Dec 2023 11:10:11 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irq: Resolve that mask_irq/unmask_irq may not be called
 in pairs
To: Thomas Gleixner <tglx@linutronix.de>, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: linux-input@vger.kernel.org, stable@vger.kernel.org,
 Riwen Lu <luriwen@kylinos.cn>
References: <20231207014003.12919-1-xiongxin@kylinos.cn> <87ttosssxd.ffs@tglx>
Content-Language: en-US
From: xiongxin <xiongxin@kylinos.cn>
In-Reply-To: <87ttosssxd.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2023/12/8 21:52, Thomas Gleixner =E5=86=99=E9=81=93:
> On Thu, Dec 07 2023 at 09:40, xiongxin@kylinos.cn wrote:
>> When an interrupt controller uses a function such as handle_level_irq(=
)
>> as an interrupt handler and the controller implements the irq_disable(=
)
>> callback, the following scenario will appear in the i2c-hid driver in
>> the sleep scenario:
>>
>> in the sleep flow, while the user is still triggering the i2c-hid
>> interrupt, we get the following function call:
>>
>>    handle_level_irq()
>>      -> mask_ack_irq()
>>        -> mask_irq()
>> 				i2c_hid_core_suspend()
>> 				  -> disable_irq()
>> 				    -> __irq_disable()
>> 				      -> irq_state_set_disabled()
>> 				      -> irq_state_set_masked()
>>
>>    irq_thread_fn()
>>      -> irq_finalize_oneshot()
>>        -> if (!desc->threads_oneshot && !irqd_irq_disabled() &&
>> 	     irqd_irq_masked())
>>        	 	unmask_threaded_irq()
>> 		  -> unmask_irq()
>>
>> That is, when __irq_disable() is called between mask_irq() and
>> irq_finalize_oneshot(), the code in irq_finalize_oneshot() will cause
>> the !irqd_irq_disabled() fails to enter the unmask_irq() branch, which
>> causes mask_irq/unmask_irq to be called unpaired and the i2c-hid
>> interrupt to be masked.
>>
>> Since mask_irq/unmask_irq and irq_disabled() belong to two different
>> hardware registers or policies, the !irqd_irq_disabled() assertion may
>> not be used to determine whether unmask_irq() needs to be called.
>=20
> No. That's fundamentally wrong.
>=20
> Disabled interrupts are disabled and can only be reenabled by the
> corresponding enable call. The existing code is entirely correct.
>=20
> What you are trying to do is unmasking a disabled interrupt, which
> results in inconsistent state.
>=20
> Which interrupt chip is involved here?

i2c hid driver use gpio interrupt controller like=20
drivers/gpio/gpio-dwapb.c, The gpio interrupt controller code implements=20
handle_level_irq() and irq_disabled().
>=20
> Thanks,
>=20
>          tglx
>=20

According to my code tracking and analysis:

Normally, when using the i2c hid device, the gpio interrupt controller's=20
mask_irq() and unmask_irq() are called in pairs.For example, the process=20
is as follows:

mask_irq();

if (!irqd_irq_disabled() && irqd_irq_masked())
	unmask_irq();

irq_state_set_disabled();
irq_state_set_masked();

In this process, unmask_irq() will be called, and the following=20
mask_irq()/unmask_irq() will return directly.


But when doing a sleep process, such as suspend to RAM,=20
i2c_hid_core_suspend() of the i2c hid driver is called, which implements=20
the disable_irq() function, which finally calls __irq_disable(). Because=20
the desc parameter is set to the __irq_disabled() function without a=20
lock (desk->lock), the __irq_disabled() function can be called during=20
the execution of the handle_level_irq() function, which causes the=20
following:

mask_irq();

		irq_state_set_disabled();
		irq_state_set_masked();

if (!irqd_irq_disabled() && irqd_irq_masked())
	unmask_irq();

In this scenario, unmask_irq() will not be called, and then gpio=20
corresponding interrupt pin will be masked. Finally, in the suspend()=20
process driven by gpio interrupt controller, the interrupt mask register=20
will be saved, and then masked will continue to be read when resuming ()=20
process. After the kernel resumed, the i2c hid gpio interrupt was masked=20
and the i2c hid device was unavailable.

