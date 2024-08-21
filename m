Return-Path: <linux-input+bounces-5723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 597D9959612
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 09:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAF95B26536
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 07:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13F9A1B81B1;
	Wed, 21 Aug 2024 07:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="q3X+JJ8v"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7511B81AA;
	Wed, 21 Aug 2024 07:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724225211; cv=none; b=cMEnmKdbSz1FNiAFFW80UFEibFA/+YUoip7oBKUfycyCmPwIcsc2UDR++QOPcV1Iths31ck0eImzF7Pr2wFwcRCnFIH9jTsvHfSp97InTAUucjrVrXEoA9eysuTBiOQR74N2a4a8R2KAU2K6fOzHoJaiOARpAXJimSiCkxHPwIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724225211; c=relaxed/simple;
	bh=zN5Lycw+dgrekFEQsQ6siY9VlS6x3DrGarsjuS8WSn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hl/ZvI0Zi232jk1qXFEPRTrCF9bxh9Pz+pd0VxQVzqcAF1UEYeIcW+j5uSNylxPX3HIl+O7NpzWz2UBhGKFH4AGZiuFJxIsMVcTuDeBmng9S5guctyjSlPplTCqo5oZwvoQ9jIdB10GpU0e6Y40sFl2ijhJcUncEhIctlpewMuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=q3X+JJ8v; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724225196; x=1724829996; i=markus.elfring@web.de;
	bh=zN5Lycw+dgrekFEQsQ6siY9VlS6x3DrGarsjuS8WSn0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=q3X+JJ8vldSCOiZlaqR1dEMNynfOD0bE/SVlvBOPeBDMpB8MSEiTxrGUdsYLGtpQ
	 HR0Dedc5mRLy7CIA/ma3WSYrLu9eRon9XZIc+W3d207MPC70Q0lTLx6E2dZlRAWlE
	 R8hT248hbCVviN7NTyjf3zb7YQbzjOulUunlYEBNzCf96SMZzt0iRhqaeDbE3cc/9
	 fT2yuDjnOnW2QGelRxVIW8GXhvk557qEpyDTMfKrPyxkBA32SObmdVH/hgZOrdA6R
	 Nqel7A5gYHVuzIhEvDkN/1KVJUrF919W5eFS54r77ig5VBIzstquEfr8Tu35PDlAB
	 t/SD2VGH2L66nHZ6DQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mpl0p-1sLNo648Nh-00ZzrV; Wed, 21
 Aug 2024 09:26:36 +0200
Message-ID: <f0aa2ca0-6256-48e4-8d2a-dfd5da072ad4@web.de>
Date: Wed, 21 Aug 2024 09:26:35 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
 linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
 <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de>
 <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
 <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de>
 <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mqJBc/Xemdod8Z1hM6L0jq0cC9IFRhjY/X6HI1Z5myxaGnkA2Em
 wSHZB3JcSY5VzqELBzNX56/bB9CC2v9FDOqD6/5NHnsPIaFkQzVfdxd7ZgzBDJPkJiYp0mK
 wP31c77j/Arvudma45+YJayiCldkBXxKOebef+54PIPfy8g5KEmhUnRu0e099TzeEhpa+C7
 EuFOdo0B57OEzIhieVNQA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jxdJMJsCaZg=;mjOlX4fUl9AIutJj9ILGCh1IsBu
 eHQ+kF7BJ2I5AbJu3Y7HddmDyJYnMe7zw299hoEAF1184XgEpwdgzzkr2WPrHmgKe3N0bzVRm
 dlT84jaB6wc5UyJaU4pSp9JgCPMkA2sSfsINpxOfiUgn0MUhZZPlMruUeTFPXNwXyM2WMdIhv
 7O+8oMjDHZVIc/mRpULftNZFukvPDHQq8JcvHSioVhCqUDqVoYghKLG6iPwN5Gy/eLdIPp/1x
 i7wBlV+9XvmhEkoJxPKlEd7ZPyaRU+wBelij6NIdc0RFvoGRTMdmSOKu8ZAm2Jh2rkT0XPCK0
 OQe4+nTczjuZquiZQdJIQ5/D9+qp5SQJiYmP3+a1oMkcC+84Ek5R4sbQzzvIfT5uM4ttWlFAh
 yXFOfz1YTkxV70dZ6HlyhTD/YJJ/Dq2TRZ+my/GSjo1PPk1K8/F7vYQy2t4pn05CrnTpJVDwY
 B2gRa1gojSeDByFj23DZM3knB9OfUzAVQFmyyTJZ0i5D3a1tYMGEpnZ6S/HOv/2FozQRnDPR6
 4fLxLswixYze9fiJ/jkrgCRmVsgGEENd2Vm9eV+T5UQ5RejpidBFgZALtBIhMWAFq5RltenbR
 QB1vyPQd25bPXSzZaFCrXhPWnNHln/Tr21OeDUA1MukZZLxinCB9/4WNNuaTUqVipYWz+7CyZ
 /ofDrOCKIcolK90nBLfA0wchX1qi3sZpmAXnvtOZ8A+ZD71g8lZFnp33Nnr4eJ4/Sema9BvTs
 LWQXsMkniZxWZGuX4zrFp0XJlaOE+SsHHVepDKLhQ3l0zH0GIUY1Hv330Bj/1B4UhqqrGW+cY
 RLxLG1LWUorX56bTXQQMgmxw==

>> This was the case for a while.
>>
>> Increasing applications of scope-based resource management provide
>> further opportunities for smaller scopes according to some local variab=
les,
>> don't they?
>
> Personally I'd rather it just fits in with the rest of the kernel,
> but if the general consensus is that new drivers should use tighter
> scopes, I can do that instead.

There are the usual communication challenges to consider also especially
with collateral evolution in such software areas.


>> How do you think about to collaborate with other data structures
>> than character arrays?
>>
>> See also:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/coding-style.rst?h=3Dv6.11-rc4#n953
>
> Hm, I picked a character array since all it's doing is sending a
> buffer to the device.
> There's no published specification to follow, only "Well the Windows
> driver sends these bytes and this happens".
> So there isn't really a structure that really comes naturally,
> especially with all the magic numbers.

I imagine that further development concerns can be adjusted accordingly.


> Unless you're suggesting I just do `unsigned char send_buf[3] =3D {...}`=
?

Such a programming approach might also look promising.


> I checked the docs, apparently I misread somewhere that
> `hid_hw_raw_request` couldn't use stack allocated memory safely,
> whoops.

Will safer API usage be clarified further?

Can applications of advanced data structures become more appealing?

Regards,
Markus

