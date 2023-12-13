Return-Path: <linux-input+bounces-734-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 881C4810847
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 03:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7BD4B20C04
	for <lists+linux-input@lfdr.de>; Wed, 13 Dec 2023 02:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40AD417D3;
	Wed, 13 Dec 2023 02:35:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2326CA0;
	Tue, 12 Dec 2023 18:35:21 -0800 (PST)
X-UUID: 53fad169989a4261baec166a670e509e-20231213
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:aa5ad371-f611-4054-af9d-a17c68cc0f39,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.33,REQID:aa5ad371-f611-4054-af9d-a17c68cc0f39,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:a9932161-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:231212231719IH1VMLZ5,BulkQuantity:9,Recheck:0,SF:24|17|19|44|64|66|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS
X-UUID: 53fad169989a4261baec166a670e509e-20231213
Received: from node4.com.cn [(39.156.73.12)] by mailgw
	(envelope-from <xiongxin@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1210511912; Wed, 13 Dec 2023 10:35:16 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id CE30016001CC8;
	Wed, 13 Dec 2023 10:35:15 +0800 (CST)
X-ns-mid: postfix-65791863-774384874
Received: from [172.20.116.203] (unknown [172.20.116.203])
	by node4.com.cn (NSMail) with ESMTPA id D283E16001CC8;
	Wed, 13 Dec 2023 02:35:14 +0000 (UTC)
Message-ID: <2a704112-05fd-4dbd-accd-b2038d5e4d81@kylinos.cn>
Date: Wed, 13 Dec 2023 10:35:14 +0800
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
To: Jiri Kosina <jkosina@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, benjamin.tissoires@redhat.com,
 linux-input@vger.kernel.org, stable@vger.kernel.org,
 Riwen Lu <luriwen@kylinos.cn>
References: <20231207014003.12919-1-xiongxin@kylinos.cn> <87ttosssxd.ffs@tglx>
 <e125491c-4cdb-4870-924a-baeb7453bf78@kylinos.cn>
 <1702429454313015.485.seg@mailgw>
From: xiongxin <xiongxin@kylinos.cn>
In-Reply-To: <1702429454313015.485.seg@mailgw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

=E5=9C=A8 2023/12/13 00:57, Jiri Kosina =E5=86=99=E9=81=93:
> On Mon, 11 Dec 2023, xiongxin wrote:
>=20
>> In this scenario, unmask_irq() will not be called, and then gpio corre=
sponding
>> interrupt pin will be masked. Finally, in the suspend() process driven=
 by gpio
>> interrupt controller, the interrupt mask register will be saved, and t=
hen
>> masked will continue to be read when resuming () process. After the ke=
rnel
>> resumed, the i2c hid gpio interrupt was masked and the i2c hid device =
was
>> unavailable.
>=20
> In addition to what Thomas already wrote -- what exactly is the problem
> you are trying to solve here?
>=20
> Is it that your device drive by i2c-hid driver is no longer sending any
> data reports after a suspend/resume cycle? What makes you think that it=
's
> because of its IRQ being disabled?
>=20
> Don't you just perhaps need I2C_HID_QUIRK_RESET_ON_RESUME quirk for tha=
t
> device?
>=20

I have confirmed I2C_HID_QUIRK_RESET_ON_RESUME quirk, the current BUG is=20
related to GPIO interrupt masking, and has little to do with hid code.

I explained the detailed process of the BUG in another email.

