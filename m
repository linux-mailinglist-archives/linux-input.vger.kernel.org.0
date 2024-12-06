Return-Path: <linux-input+bounces-8417-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E759E6231
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 01:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AE4528356C
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 00:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317DB17C98;
	Fri,  6 Dec 2024 00:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZO+hp0t4"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A46256E;
	Fri,  6 Dec 2024 00:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733444918; cv=none; b=CU1iKw5+78pS7rpcvzl5wVeAtPzdu/2nDOhTcsdXhR/mZ9jzWk3bxuj6bQpoYA1Sz0PzeLeP65ToXG38SSuARmXbVFJk23F+pA99khYnBgI4Is3loZ2nXhvNcRSjklGFWcq95VxhE6AL4C646uUyaXRg3CLSAwFSsXkUzljvkSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733444918; c=relaxed/simple;
	bh=fDpBfsqh+A93EKAXwhvxuIFOiEt3bUWwtkGoE+I7iGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NWknDVsXAtWS9OX5FDBraHWw8Wyu3f08yooYonY+hzwk0uQpowbc/+HsQDEmjus/oVogJzGK4xhfDfUEjKKNiObIMqCg32auZ+bAHKF8AZLYCAqeDX1sk2xG+Gu1PVMNS/we+vtoHlv83WO2qFGbTNIVEX/MJ5712ENAQHKsJuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZO+hp0t4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HadR9005219;
	Fri, 6 Dec 2024 00:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDpBfsqh+A93EKAXwhvxuIFOiEt3bUWwtkGoE+I7iGA=; b=ZO+hp0t4/XogRzCx
	bmFm3kj6RZbBMYCgJLACmLH0LO73UftEG5K1i/lfppptIJMnDfJznDI5qPreWAJZ
	aUMlPEOOlVK7b/eB5u9ynEcbqocVEi0KMyHkh3cpRRAQ0Q53Z8Cwp6YrRoVQ1nnb
	PLQsRTg/sF+NQb3Z3LLADEs338VqqY2tArCzEZj1odi+VZFcztyT5MYR2w5yddiy
	w3iUySaY5OsVE0PoaVG9YT54rTIKJ/fCgSN7foiKDDHN0wN9ZM7VD8YbwvTITyHt
	bQW/ylHfozn15LR+2j822iRB8MXyUPeVn3hvdRm5HebZe0t39D59dFpxmYG+J1Mk
	LEzPPA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba1423gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 00:28:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B60SCQm010724
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 00:28:12 GMT
Received: from [10.71.112.120] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 16:28:11 -0800
Message-ID: <d7c52a11-bd2b-4cce-a0c2-6dc2dadfeaa3@quicinc.com>
Date: Thu, 5 Dec 2024 16:28:11 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
CC: Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
 <fbc04c06-c210-416b-9b77-a6bd8a71a637@quicinc.com>
 <9d95e6fa-afcb-4445-9fe3-e0eed95ec953@intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9d95e6fa-afcb-4445-9fe3-e0eed95ec953@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sTJTZGmt5NNLZiU1kgwFwmYnTxTeYTNZ
X-Proofpoint-ORIG-GUID: sTJTZGmt5NNLZiU1kgwFwmYnTxTeYTNZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=974 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060002


On 12/4/2024 2:01 PM, Cezary Rojewski wrote:
> On 2024-12-03 9:38 PM, Wesley Cheng wrote:
>> Hi Cezary,
>>
>> On 12/3/2024 8:17 AM, Cezary Rojewski wrote:
>>> On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
>>>> Sorry to chime in late, I only look at email occasionally.
>
> ...
>
>>>> The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.
>>>
>>>
>>> Well, I believe a lot has changed since then, not sure if USB Audio Offload (UAOL) was even stable on the Windows solution back then. Obviously we want to incorporate what we have learned during all that time into our solution before it lands on upstream.
>>>
>>
>> Hard to comment further without more details on the lessons learnt you had on Windows.  I just want to make sure we're talking about the same feature here, because I see sprinkles of the xHCI audio sideband (section 7.9) on the Windows documentation without much details on how its implemented, which is different than what is presented here.
>
> The comment was directed towards mention of Intel, 2018 and Rakesh. The decisions made then do not bind us, and current Intel's Audio team has a clean slide. Wanted to make sure it's clear.
>
>>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>>>
>>
>> Just to clarify, "struct snd_soc_usb" does have some correlation with our "codec" entity within the QCOM ASoC design.  This would be the q6usb driver.
>>
>>
>>> Currently struct snd_soc_usb does not represent any component at all. Lack of codec representative, component representative and, given my current understanding, mixed dependency of sound/usb on sound/soc/soc-usb does lead to hard-to-understand ASoC solution.
>>
>>
>> IMO the dependency on USB SND is necessary, so that we can leverage all the pre-existing sequences used to identify USB audio devices, and have some ability to utilize USB HCD APIs as well within the offload driver.
>
> So, while I do not have patches in shape good enough to be shared, what we have in mind is closer to existing HDAudio solution and how it is covered in both ALSA and ASoC.
>
> A ASoC sound card is effectively a combination of instances of struct snd_soc_component. Think of it as an MFD device. Typically at least two components are needed:
>
> - platform component, e.g.: for representing DSP-capable device
> - codec component, e.g.: for representing the codec device
>
> USB could be represented by such a component, listed as a dependency of a sound card. By component I literally mean it extending the base struct:
>
> stuct snd_soc_usb {
>     struct snd_soc_component base;
>     (...)
> };
>
> In my opinion HDAudio is a good example of how to mesh existing ALSA-based implementation with ASoC. Full, well implemented behaviour of HDAudio codec device drivers is present at sound/pci/hda/patch_*.c and friends. That part of devoid of any ASoC members. At the same time, an ASoC wrapper is present at sound/soc/codecs/hda.c. It will represent each and every HDAudio codec device on the HDAudio bus as a ASoC-component. This follows the ASoC design and thus is easy understand for any daily ASoC user, at least in my opinion.
>
> Next, the USB Audio Offload streams are a limited resource but I do not see a reason to not treat it as a pool. Again, HDAudio comes into picture. The HDAudio streams are assigned and released with help of HDAudio library, code found in sound/hda/hdac_stream.c. In essence, as long as UAOL-capable streaming is allowed, a pcm->open() could approach a UAOL-lib (? component perhaps?) and perform ->assign(). If no resources available, fallback to the non-offloaded case.
>
> While I have not commented on the kcontrol part, the above means that our current design does go into a different direction. We'd like to avoid stream-assignment hardcoding i.e.: predefining who owns a UAOL-capable stream if possible.
>
>

Thanks for sharing the implementation for HDA.  I did take a look to the best of my ability on how the HDAudio library was built, and I see the differences that are there with the current proposal.  However, I think modifying the current design to something like that would also require the QCOM ASoC side to change a bit too.  As mentioned by Pierre, I think its worthwhile to see if we can get the initial changes in, which is the major part of the challenge.  For the most part, I think we could eventually refactor soc-usb to behave similarly to what hda_bind.c is doing.  Both entities are the ones that handle linking (or creation in case of HDA) of ASoC components.  The one major factor I can see is that within the HDA implementation vs USB SND is that, for USB, hot plugging is a common practice, and that's a scenario that will probably need more discussion if we do make that shift.


Anyway, I just wanted to acknowledge the technical details that are utilized by HDAudio, and that we could potentially get there with USB SoC as well.


Thanks

Wesley Cheng


