Return-Path: <linux-input+bounces-5754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8480195C858
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 10:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBCF0B2230A
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 08:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E6D146A67;
	Fri, 23 Aug 2024 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LdE0GSNP"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A62E644;
	Fri, 23 Aug 2024 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724402788; cv=none; b=Zjszt5lSyia7MpFLEJoAq39q8i0NUy3s7ucoNXJMvMsZRlbRhn1LtYyde3jU9PgdTYIOKOaFx0D4bjtfX4dU0n/zWn1cat5aOAGzV8Tn4YKsIyaipZ8XPIO0/VdetpDSV9J2bdhWMv8j0nOULdIoQ9Osj7aZ/CXEw8zqr2DFT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724402788; c=relaxed/simple;
	bh=s4XMzS2qLSsdhJFnl+AXGI1oAfA4VKS9oWCX+k3urHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Os5KeqwPwGHTAcFDPdVKH+GqlXbIWBvWasTWjM2beViRJZEzneoXqcll6dyDBCpd4UM+bkGbCOqdDAd0c1m1m8KzLVzy+sn6vuoIsR1iG4CH2DpixQug8ozgqjOHpq3RnPWhkgs8b0pxlW61JzxoUi24XnznbzChcQQcVnJ08XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LdE0GSNP; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1724402767; x=1725007567; i=markus.elfring@web.de;
	bh=s4XMzS2qLSsdhJFnl+AXGI1oAfA4VKS9oWCX+k3urHc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LdE0GSNPLXyH66T0p2+T3ZblW4Wq3pVuL3dLLeetT5IeISs98K3rxqAE1SH4MDdC
	 W2OSgHp73WMMv1G2XxtVsV/tml1BfHGvBxyvrMXx9k0r36tn7DTPrdFQs/GQEjFyu
	 coHNAbD+85x47ZocWnx3JgcmK+khXQbnYvG84LWD8fkANQ4RHAgs8SbMWDkxP1RGx
	 RXiuUAX//cUryo2SkB94M06cgPqRe1XvL4BVCU4cRD6B435VWoRTixXRKKCN5b/rU
	 Ie1E2WmkLVcG4vSEkjn3mHtCGUFl5E6gXeJPThLr6ATRbD79K0zL2IQdGBcxrxmef
	 F01lOZbQmc+Ic4VK4w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuVKK-1rrF3F1sKQ-017jKu; Fri, 23
 Aug 2024 10:46:07 +0200
Message-ID: <20f2ff71-fa9c-4282-9a16-566ff85c1247@web.de>
Date: Fri, 23 Aug 2024 10:45:55 +0200
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
X-Provags-ID: V03:K1:VQmvx4YoPNQuSrYJ/XKqJ+GhyHHr/+qt+7Ic1k/elT2w6OzsMZr
 n5KATzmz4/0/TNrSUYxpwkfy+cDiKMiaq5iAO/G+pHnXAMkON0V3tdc0R1D8HV3ZZgH9QOb
 fh9Y3V0iqa6MAYSN+v5aEbQiX07yOkjlZs8iuUi6lc3Xq7bZbjKTQv6YEWqB+31AIACb7az
 tcbN4rxomhvS48PXIPxPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:koNXlGavHxs=;sIIuj/CZ7dY3l6Lo41BWOySHNh7
 Orp/o6NwP6UKsZUP6h5JAirVaQsBhLCeVd4tVDzQrfwScrnSBzZNAPi1zSvfdYKXKMx2Tb3jx
 wTPILtSyHqiaT/BXxOG01hVF8wxwhH1WgltauhFkxPegTWkeiqD19z4RB69bgZ04DQ6xmBtg5
 4B/RMS9DaDMRSwF1B3PK6X5913NaueYnCJEA39TmU6rP89/XLoE3GrBEwXurziXJzzxE/wd+R
 DAoeYOUzTL6mW5IK64dZp/XiYRltmR2MUoszI3ZhX1Cmn6jGqKdLqoHU+QIYC4IY/6XwVg4cd
 0PNRHdo7Wy2MrrTWwOgzl2tktqCugFIwuN6l0ME4A3qemOhv6T1ORUui9K7CkpcZHtHe+ydX8
 Sq0XY0fj5GooR3t/4PZDdFBG7ngd+KaIpWi1SnrFvG6lPmbGSiwjjXlgUYUTvxtCiowltGuPc
 qvJhXEaxZNSpImTWf9JGtEi7LGuiYDFgSCfr0s38EvyytKIFSLJ+jHT2ASBuan0ocEB9AA6kV
 iDiCfzayc5fZUGBwm7O6K+mi/AVoX+21wEOLI1qv1IPc8G61BSA957WQUApgixA36cG6SMgyc
 yFy/TsrYDe+FX/EKrDPBt5FnwpqPU4hN3ZUSSo+3XhDCmugf8vEj034GljhUjj+RdcI5VQeXt
 CJ+LvK6PjMvFn1vHBK9tM+RhgK9334N2WHEZYtEX29yM4n9dLrfbfBjXF4v2AA5jyN4gr4F5z
 cAgTW29hTHWKOsDl65YwZF4656UY1qjG4w8v/9c71jlFRSXps/O/Syg4PmTBTVdWwRq4eCmTX
 kweuJOgzG/KJJpkozF3cQ/BA==

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

Is there still a desire and need to achieve a more meaningful interpretati=
on
for involved data exchanges?
https://en.wikipedia.org/wiki/Header_(computing)

Regards,
Markus

