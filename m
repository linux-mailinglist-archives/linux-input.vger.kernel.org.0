Return-Path: <linux-input+bounces-1994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3785D140
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 08:24:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738421F21530
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 07:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987433B193;
	Wed, 21 Feb 2024 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b="Uy4JRxly"
X-Original-To: linux-input@vger.kernel.org
Received: from a.mx.secunet.com (a.mx.secunet.com [62.96.220.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76973B18F
	for <linux-input@vger.kernel.org>; Wed, 21 Feb 2024 07:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.96.220.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708500279; cv=none; b=p/XraaOncLGAn0inRWTg0n0Mkl8Q2nQlFU4nAqM8quVm/4Ld4t43UoLHfxZGFWj5kPxheI0EN8tU7eWVV+YoZccFfeHZV60gBwfBQ9BVTFYL4lmRKuq+gpfjiPW69eKC9txmso9wxVONRRo6B8+m7nK9cMLYL7mWDmSpyu5hx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708500279; c=relaxed/simple;
	bh=Ehwbrrc31RNPpLXtRpuFbLp/VnYgEfHw2CrpPrJtlrc=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ni9j7LBCpAOIy9fUN3czCQ8NypSAF9kOF1v//cLk/PmEJW+L71p6ih6OE50fzmBk2RJ3SU/zIBbLvJ4/2LYSHVF9qe9Q9o1ROFT+0QVWalFcZUkbu8hPPgv3CvizXXdLTAa+/lLJIvR2p0DtGUBZqjdtrMcdlSR6tnDPTNfVnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com; spf=pass smtp.mailfrom=secunet.com; dkim=pass (2048-bit key) header.d=secunet.com header.i=@secunet.com header.b=Uy4JRxly; arc=none smtp.client-ip=62.96.220.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=secunet.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=secunet.com
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id B94D3205CD;
	Wed, 21 Feb 2024 08:24:34 +0100 (CET)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rCKcsNvDBZij; Wed, 21 Feb 2024 08:24:34 +0100 (CET)
Received: from mailout1.secunet.com (mailout1.secunet.com [62.96.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id F34DF20185;
	Wed, 21 Feb 2024 08:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com F34DF20185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=secunet.com;
	s=202301; t=1708500274;
	bh=CegAjs+WJCNhGQ085XLjSWXnHRv0gIaRm01akWQK2tE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To:From;
	b=Uy4JRxly+cb6hBScMQGs+f+6tzeyt0rt3ACpZWAQVNZU3QYOATyZLMf0MJh5YmR2y
	 ce16VwbUiNxxFs/Bts0+tCRYrrnP1bJXAu/Zd3YSvo+6iIHUfoq3VTACkQcwFmu4Yn
	 ju/UbITOVwRC/povgeuJLyzKhoyJl8xJBC/4nzVSfKA1JwK8qmptkZzcGCpXL9ajBV
	 2pEIbICUbPOb5AkID5qMc6xngpVCrzLlowx9KuRH+R/H0ikHiZni2EoTROl2g3vsXb
	 LCEt4nYilvxnCixbVHjc1F7rx0fCEscf+BtB8xIJbfQfgTng/VMnoHmty5HDlZa76/
	 JQAbNTMGllszw==
Received: from cas-essen-02.secunet.de (unknown [10.53.40.202])
	by mailout1.secunet.com (Postfix) with ESMTP id E6E4E80004A;
	Wed, 21 Feb 2024 08:24:33 +0100 (CET)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-02.secunet.de (10.53.40.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 08:24:33 +0100
Received: from [172.18.150.65] (172.18.150.65) by mbx-essen-01.secunet.de
 (10.53.40.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 08:24:33 +0100
Subject: Re: v6.8-rc4: Crash in rmi_unregister_function still present
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sasha Levin
	<sashal@kernel.org>, <linux-input@vger.kernel.org>, Brad Spengler
	<spender@grsecurity.net>
References: <1932038e-2776-04ac-5fcd-b15bb3cd088d@secunet.com>
 <3401abdc-32c5-4b88-8edf-75d4683d4be0@moroto.mountain>
From: Torsten Hilbrich <torsten.hilbrich@secunet.com>
Autocrypt: addr=torsten.hilbrich@secunet.com; prefer-encrypt=mutual; keydata=
 mQENBFs5uIIBCAD4qbEieyT7sBmcro1VrCE1sSnV29a9ub8c0Xj0yw0Cz2N7LalBn4a+YeJN
 OMfL1MQvEiTxZNIzb1I0bRYcfhkhjN4+vAoPJ3q1OpSY+WUgphUbzseUk/Bq3gwvfa6/U+Hm
 o2lvEfN2dewBGptQ+DrWz+SPM1TQiwShKjowY/avaVgrABBGen3LgB0XZXEH8Q720kjP7htK
 tCGRt1T+qNIj3tZDZfPkqEVb8lTRcyn1hI3/FbDTysletRrCmkHSVbnxNzO6lw2G1H61wQhw
 YVbIVNohY61ieSJFhNLL6/UTGHtUE2IAicnsUAUKR8GiI1+3cTf233O5HaWYeOjBmTCLABEB
 AAG0L1RvcnN0ZW4gSGlsYnJpY2ggPHRvcnN0ZW4uaGlsYnJpY2hAc2VjdW5ldC5jb20+iQE3
 BBMBCAAhBQJbObiCAhsDBQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEJ7rXZh78/h8+tIH
 +QFYRQH4qh3WagcmjbG/zCe2RmZZePO8bmut2fAxY04aqJZGYUBxb5lfaWaHkstqM5sFD8Jo
 k1j5E7f1cnfwB21azdUO8fzYL889kdVOzatdT/uTjR7OjR59gpJMd4lx7fwFuZUg8z6rfWJ3
 ImjxxBgaJRL6pqaZ9lOst82O0qJKEFBR+HDUVvgh4n8TTOfKNv/dGPQhaed+2or98asdYRWo
 S/zc4ltTh4SxZjLd98pDxjlUyOJoMJeWdlMmLgWV3h1qjy4DxgQzvgATEaKjOuwtkCOcwHn7
 Unf0F2V9p4O7NFOuoVyqTBRX+5xKgzSM7VP1RlTT4FA9/7wkhhG+FEK5AQ0EWzm4ggEIAL9F
 IIPQYMx5x+zMjm8lDsmh12zoqCtMfn9QWrERd2gDS3GsORbe/i6DhYvzsulH8vsviPle4ocU
 +PaTwadfnEqm0FS7xCONYookDGfAiPS4cHWX7WrTNBP7mK3Gl1KaAOJJsMbCVAA9q4d8WL+A
 e+XrfOAetZq5gxLxDMYySNI1pIMJVrGECiboLa/LPPh2yw4jieAedW96CPuZs7rUY/5uIVt0
 Dn4/aSzV+Ixr52Z2McvNmH/VxDt59Z6jBztZIJBXpX3BC/UyH7rJOJTaqEF+EVWEpOmSoZ6u
 i1DWyqOBKnQrbUa0fpNd3aaOl2KnlgTH9upm70XZGpeJik/pQGcAEQEAAYkBHwQYAQgACQUC
 Wzm4ggIbDAAKCRCe612Ye/P4fEzqB/9gcM/bODO8o9YR86BLp0S8bF73lwIJyDHg5brjqAnz
 CtCdb4I+evI4iyU9zuN1x4V+Te5ej+mUu5CbIte8gQbo4cc9sbe/AEDoOh0lGoXKZiwtHqoh
 RZ4jOFrZJsEjOSUCLE8E8VR1afPf0SkFXLXWZfZDU28K80JWeV1BCtxutZ39bz6ybMbcCvMS
 UfwCTY0IJOiDga1K4H2HzHAqlvfzCurqe616S4S1ax+erg3KTEXylxmzcFjJU8AUZURy/lQt
 VElzs4Km1p3v6GUciCAb+Uhd12sQG2mL05jmEems9uRe3Wfke/RKp8A+Yq+p6E0A0ZOP+Okm
 LXB2q+ckPvZG
Message-ID: <2bbe3f64-8f5e-3171-96c5-95202d6015da@secunet.com>
Date: Wed, 21 Feb 2024 08:24:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3401abdc-32c5-4b88-8edf-75d4683d4be0@moroto.mountain>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: cas-essen-01.secunet.de (10.53.40.201) To
 mbx-essen-01.secunet.de (10.53.40.197)
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10

On 21.02.24 08:15, Dan Carpenter wrote:
> On Wed, Feb 21, 2024 at 07:55:40AM +0100, Torsten Hilbrich wrote:
>> Hello,
>>
>> updating our codebase to v6.8-rc4 which contains:
>>
>> eb988e46da2e Input: synaptics-rmi4 - fix use after free in rmi_unregister_function()
>>
>> I noticed that the previously noticed crash in the rmi4 was present again.
>>
>> Previously, we were using a fix from the grsecurity codebase which changed the function in the following way:
>>
>> void rmi_unregister_function(struct rmi_function *fn)
>> {
>> 	int i;
>>
>> 	rmi_dbg(RMI_DEBUG_CORE, &fn->dev, "Unregistering F%02X.\n",
>> 			fn->fd.function_number);
>>
>> 	for (i = 0; i < fn->num_of_irqs; i++)
>> 		irq_dispose_mapping(fn->irq[i]);
>>
>> 	device_del(&fn->dev);
>> 	of_node_put(fn->dev.of_node);
>> 	put_device(&fn->dev);
>> }
>>
>> With this version of the fix the crash didn't happen. Please note, that the crash happens in device_del which is before the irq_dispose_mapping call in eb988e46da2e.
>>
>> Attached is a kernel log from the crash with a kernel based on v6.8-rc4.
> 
> Hi Torsten,
> 
> Thanks for the bug report.  The truth is that I don't really understand
> how IRQ mappings work.  It would be simple enough to apply the same
> fix that grsecurity does.  The only question how to assign authorship
> credit.  Dmitry, how do you want to handle this?

The original patch was supplied to me by Brad Spengler <spender@grsecurity.net>

There is also a bugreport https://bugzilla.kernel.org/show_bug.cgi?id=215604 related to that problem.

	Torsten

