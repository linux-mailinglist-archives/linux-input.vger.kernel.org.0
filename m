Return-Path: <linux-input+bounces-9996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FD5A32995
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 16:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E50C3A6EBC
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 15:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939B421128D;
	Wed, 12 Feb 2025 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="imuTfGHs"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C302A271800;
	Wed, 12 Feb 2025 15:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739373116; cv=none; b=Y8N4I/r/YMg3xVX/7UfawLD6oByj3rWx0VgIdf6iYah2PFtf/AWyERwIeWDB4wue1JDgcbV7PiRjubignpcp1YHcJGxpZ0HA/VecvjQZBMsWlK0CebxXlll82Zs6CvaiH5h9QIzFyITWoQ8PuwS4mUarI20s3brCt4smpbnkwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739373116; c=relaxed/simple;
	bh=99arZH731iDZzfa8ZZPAfBQWn0acSMZBM8u1cuqUXuo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HfEl+3/rLsWjFeqfpcHn4mJ9q/FWMLTUjktaGQPUAlSNg1fUvN4FjQFX1MvcVIf8UlJL56bLoEFrTJGjwL2J/uOknA2mIK3zd3trdNSyeh8xI0e/ZU2xJy/zlYJZ1AYzPMseE/AggvYufSLWBQfZi8PVSMkpOs2p2O1MVqBtNRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=imuTfGHs; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C6u2Y2016943;
	Wed, 12 Feb 2025 09:10:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=gaOUuX7MQMuia9McaDE2MM2EVmIcLDAQ3K7abX1j5EI=; b=
	imuTfGHsfbgtQ94PMHcxX8dKsZW+Oc0j6LC0gyMYNSvSxqzXnaTaNlWMlRasdXb8
	Nvpn0HrIn7DtIobeHILQes4oMoaNlG73Y8wm7zusuXTIV6LoUIk3ST5faNQWzKj7
	2XJD6A9hHaGH09OdY5nTy3QSOpzWbQYodSyX3CAwKuhjM2+KS9YZc3YNNmmV8m25
	D9i01azVLWhpnnkJTPvSjBepXblKH+VJ8YY/c8ZMwcYO3NAnwIbcl3MiiiWby1mp
	TT9kYkZsv9tR2sHEUE1gVttwJMs81xJPVCfBthzNAaJGreCY6mhx/w0flyThJr4r
	+d2ehwWTAzHOVJUxjx+Tfw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44rpsv8nss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 09:10:58 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 12 Feb
 2025 15:10:56 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 15:10:51 +0000
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1F10582025A;
	Wed, 12 Feb 2025 15:10:51 +0000 (UTC)
Message-ID: <c92f8f5b-e6f4-41bb-86c1-dc45b80cd49b@opensource.cirrus.com>
Date: Wed, 12 Feb 2025 15:10:51 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 5/7] mfd: cs40l26: Add support for CS40L26 core
 driver
To: Fred Treven <ftreven@opensource.cirrus.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Charles Keepax
	<ckeepax@opensource.cirrus.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Ben Bright
	<ben.bright@cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Jeff LaBundy
	<jeff@labundy.com>, Heiko Stuebner <heiko@sntech.de>,
        Karel Balej
	<balejk@matfyz.cz>,
        Igor Prusov <ivprusov@salutedevices.com>,
        Jack Yu
	<jack.yu@realtek.com>,
        Weidong Wang <wangweidong.a@awinic.com>,
        Binbin Zhou
	<zhoubinbin@loongson.cn>,
        Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        "Paul
 Handrigan" <paulha@opensource.cirrus.com>,
        Masahiro Yamada
	<masahiroy@kernel.org>, Nuno Sa <nuno.sa@analog.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20250204231835.2000457-1-ftreven@opensource.cirrus.com>
 <20250204231835.2000457-6-ftreven@opensource.cirrus.com>
 <4e5f0194-22bc-4e17-85f4-6dbc145a936b@kernel.org>
 <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <3bff0ff8-7397-414d-a701-011d5b5a41f4@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O73DvA9W c=1 sm=1 tr=0 ts=67acba02 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=_SCIqTSYrM5XDuVbtgUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: dGfg_TWu3AP67jc1rHjLAyjt-XIXdm3d
X-Proofpoint-GUID: dGfg_TWu3AP67jc1rHjLAyjt-XIXdm3d
X-Proofpoint-Spam-Reason: safe

On 11/02/2025 9:16 pm, Fred Treven wrote:
> On 2/5/25 04:34, Krzysztof Kozlowski wrote:
>> On 05/02/2025 00:18, Fred Treven wrote:
>>> Introduce support for Cirrus Logic Device CS40L26:
>>> A boosted haptic driver with integrated DSP and
>>> waveform memory with advanced closed loop algorithms
>>> and LRA protection.
>>>

<SNIP>

>>> +static const struct spi_device_id cs40l26_id_spi[] = {
>>> +    { "cs40l26a", 0 },
>>> +    { "cs40l27b", 1 },
>>
>> What are these 0 and 1?
> 
> I will make it clear that these are enumerating the different possible
> device variants.
> 
> 
>>
>>> +    {}
>>> +};
>>> +MODULE_DEVICE_TABLE(spi, cs40l26_id_spi);
>>> +
>>> +static const struct of_device_id cs40l26_of_match[] = {
>>> +    { .compatible = "cirrus,cs40l26a" },
>>> +    { .compatible = "cirrus,cs40l27b" },
>>
>> So devices are compatible? Or rather this is unsynced with other ID 
>> table.
> I'm not sure what you mean by this.
> 

cs40l26_id_spi[] has the 0/1 cookie values to indicate which part
variant is being instantiated. But cs40l26_of_match[] doesn't have
these cookie values to indicate which part ID was matched.



