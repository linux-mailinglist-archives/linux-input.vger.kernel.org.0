Return-Path: <linux-input+bounces-9766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A8A27E0C
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 23:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89D347A0FDF
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 22:08:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C4821ADB9;
	Tue,  4 Feb 2025 22:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="E34U5F+c"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41C0204F9F;
	Tue,  4 Feb 2025 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738706956; cv=none; b=LacRPobMeBhNiv6EqxBEkt8OZ6N5Wl4ApqKwKsCgAKu8jhY0v19WRijNdQHcSRfpo8NZgcZor1bBfAhendaGkZsJYN0KIc3RO21pgA8BmmFokEcoN8gBYUdPR7uUg/gomyWUviNZbxy95T+fa7frgF/1Cd5rohAsjOPXV3PXros=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738706956; c=relaxed/simple;
	bh=Gg1PfhQrcNZ8VVgiwmEoY2Kz2OQ3nSYToplaJpOiMtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=msJKB1DTNJ3dPEyfxM0IH/AcR9hEYUVEmpOr2As2DNYKq78v95+yDBYA1UOiNGteSRJiAn3ImGEk+h66D1w7np+Iy7wK+gGWEqys3YbG8iy3rSilk1nw/6zfO1LoFhMA6uatX1VJ6pLcd2xIKWmmiOZifralpqR1N9cFIO2KrO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=E34U5F+c; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514Fm7xu022076;
	Tue, 4 Feb 2025 16:07:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PY2MhJyN2ZDavDNi3Zfbs8ZAfZ9//J4YR4KOi1D3d3I=; b=
	E34U5F+cCLqO3e4GCQtxK11/4KFuhjCgWn3XVTCCZ9NGvxDpO04SUAqSAeaLMjUb
	0jrwQtl5y49DMsGqpE0XuN9InaVMNATTrCA3b7EbwRHyfGVp9zY/rdutt0fxp0R3
	F0i0q7VqlcbhYTdNgqp0M+ShI9vhx57ZKQlP6yb7B4tcFQY8YiuOMCoC94Fn2BZs
	txROUF62cPPnG8swYEYv/ZEig3AVw+KnU2sxW8aB4PusPca4BIAzrfZTYJ2hcdQZ
	CdoTQNrqPlqSh/aQoAxs3ddqKqpkiyW2kgdNpWVU5E85SjjzGh5qlvDX3fQZAUe1
	os9m/rj/+IlJY86XxhzCzw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 44hgwm3q5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Feb 2025 16:07:56 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 4 Feb
 2025 22:07:54 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Tue, 4 Feb 2025 22:07:54 +0000
Received: from [141.131.145.81] (ftrev.ad.cirrus.com [141.131.145.81])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1F983820248;
	Tue,  4 Feb 2025 22:07:49 +0000 (UTC)
Message-ID: <2e5ef7d4-3dd1-476e-a00e-729b372a1520@opensource.cirrus.com>
Date: Tue, 4 Feb 2025 16:07:49 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Initial Support for CS40L26
To: Krzysztof Kozlowski <krzk@kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Ben Bright <ben.bright@cirrus.com>, <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Lee Jones <lee@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>, Jack Yu
	<jack.yu@realtek.com>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Weidong Wang
	<wangweidong.a@awinic.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>,
        Prasad Kumpatla
	<quic_pkumpatl@quicinc.com>,
        Paul Handrigan <paulha@opensource.cirrus.com>,
        Masahiro Yamada <masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>,
        "Karel
 Balej" <balejk@matfyz.cz>, Heiko Stuebner <heiko@sntech.de>,
        Jeff LaBundy
	<jeff@labundy.com>
CC: <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20250131202057.1786324-1-ftreven@opensource.cirrus.com>
 <c898680c-f1ac-4bfa-ac18-4b4b5c241dab@kernel.org>
From: Fredrik Treven <ftreven@opensource.cirrus.com>
Content-Language: en-US
In-Reply-To: <c898680c-f1ac-4bfa-ac18-4b4b5c241dab@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EPv800ZC c=1 sm=1 tr=0 ts=67a28fbc cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=xyGNDrhI266FjspNsRcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: aUfKpE_VROKpu7O2X-QbMpR1iUx5AR9M
X-Proofpoint-GUID: aUfKpE_VROKpu7O2X-QbMpR1iUx5AR9M
X-Proofpoint-Spam-Reason: safe

On 1/31/25 15:18, Krzysztof Kozlowski wrote:
> On 31/01/2025 21:20, Fred Treven wrote:
>> Introduce driver for Cirrus Logic Device CS40L26:
>> A boosted haptics driver with integrated DSP and
>> waveform memory with advanced closed loop algorithms
>> and LRA protection.
>>
>> The core CS40L26 driver is in MFD and touches the
>> Input Force Feedback subsystem for haptics and
>> the ASoC subsystem for audio to haptics streaming.
>>
>> This patchset includes changes to the CS DSP firmware
>> driver which fixes two bugs and introduces support for
>> multiple coefficient files.
> 
> I got two emails from you out of this entire set, not even threaded. I
> think rest of your posting got lost.
> 
> Best regards,
> Krzysztof

Thanks for pointing this out, Krzysztof. I made a mistake when sending
the email such that patches only got sent on a per-subsystem basis
rather than grouping all email addresses together. I will do a resend
to resolve this.

Thanks,
Fred

