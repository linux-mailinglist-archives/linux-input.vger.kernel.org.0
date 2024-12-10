Return-Path: <linux-input+bounces-8472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C61B9EA3FC
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 01:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA672167F15
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 00:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D37C2AF12;
	Tue, 10 Dec 2024 00:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Itxkh9Vb"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682A122612;
	Tue, 10 Dec 2024 00:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733792378; cv=none; b=XPOXG/L2HJpGl5JlNCncFBoRRwh1cEjMEq5erclmnC8Pktv7puBWNmB3FrU/ZfHMZ4TmZ3WD7kovSM6dgcMf2LB9VIiZPXTF173w4FiszkPA0NqA/rMqUaN1VFTuqP2deyayN6wD8Fqfoa+YY2SGeYwFGFpuv1NeGVQEBf3S6n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733792378; c=relaxed/simple;
	bh=Gv3uKmjkd8/Cq9pNh9FIa2SZQLH1EVDbf3x5/smlStU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=Y6VM9n07I7jtiWOKbDVSRKf1bl5dZCps1HUS8G0PYg7PXnid/ku9pnVPQc2V/fpiw2hL1AfJRFHYR6zbVENybbFj/kY5AcrKiA0FFV4RVlfIjv7Y3PpJ09UlJHNi+My/OM/6JT0PL492rSN+tCJfsK1I5handfNVJwNies7+sg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Itxkh9Vb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9GrRki029735;
	Tue, 10 Dec 2024 00:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gv3uKmjkd8/Cq9pNh9FIa2SZQLH1EVDbf3x5/smlStU=; b=Itxkh9VbPpQrSRXW
	Q13KvlQ4LY/Oa3PWG86whJoBGs1FX/udBT5vQEjbG3C3PyisuPkEy1+yZ+uCGL+8
	p/8sL1tkFBWwkOlZ6CYArYelCNSWK+2VHwwwaGS6RFToPyVtGEUzOZfnkMic4KvU
	j4VBfgOAkP/p8JvV+fev8qgMPbtdzH77WltRHRG6HVusYmk7v5fDAl9wCmqnIy/o
	anlI6KqRY5FVezlth6/SAWBDdHYQ3+djxY0PXKuN19OTFHEf5v09INtsEsiyJVed
	gmH07YaoRrDpd/lxr3nPi1Qmo7VagTm5ZJyy5NCbzU60uL1z5LMLrauFyPPp+QXt
	Jhr8sA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ceetpsfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 00:59:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA0xC0n015012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 00:59:12 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 16:59:11 -0800
Message-ID: <75e6516f-5cf5-4b0d-ade8-bfbc5632765f@quicinc.com>
Date: Mon, 9 Dec 2024 16:59:10 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Cezary Rojewski
	<cezary.rojewski@intel.com>
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
 <4C900353-B977-451C-B003-BAA51E458726@linux.dev>
 <e7b8f141-efd4-4933-b074-641638914905@intel.com>
 <4E9925AF-F297-42A5-9CB8-F8568F0A5EDF@linux.dev>
 <0a36814a-5818-493a-a9e3-b1a1e9559387@quicinc.com>
Content-Language: en-US
In-Reply-To: <0a36814a-5818-493a-a9e3-b1a1e9559387@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WJauu5QYgnmmpnku9ZaqT0vCg1O29h8o
X-Proofpoint-ORIG-GUID: WJauu5QYgnmmpnku9ZaqT0vCg1O29h8o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100004

On 12/5/2024 4:53 PM, Wesley Cheng wrote:
> On 12/4/2024 2:49 PM, Pierre-Louis Bossart wrote:
>>>
>>>>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>>>> The main difference is that we don’t want the USB audio *control* part to be seen in two places. The only requirement is to stream data with an alternate optimized path, but all the volume control and whatnot is supposed to be done using the regular usb-audio card. It would be complete chaos for userspace if the same volume can be represented differently.
>>>> The comparison with HDaudio is not quite right either. In the case of HDaudio, it’s an all-or-nothing solution. The external device is controlled by one entity, either legacy or ASoC based. That choice is made at driver probe time. In the case of USB, the application needs to have the choice of using either the legacy path, or the optimized path that goes through a DSP. I think the last thing you want given this context is to make the USB audio device an ASoC codec.
>>>> I find it rather interesting that this architectural feedback comes at the v30, it’s unfair to Wesley really...
>>> Hi Pierre,
>>>
>>> Obviously I'm late. After scanning the history of this one, indeed it's been a while since v1 has been sent. And thus I posted no NACKs. At the same time if I am to choose between: provide feedback vs provide no-feedback, I'd rather choose the former even if I'm to be ignored/overridden by a subsystem maintainer.
>>>
>>> The subsystem maintainers also hold the last word, and I have no problem with them merging the patches if they believe its existing shape is good-enough. For example, my team could follow up this implementation next year with a patchset expanding/updating the functionality. I see this as a viable option.
>> That’s what we had in mind before I left Intel. The interfaces seen by userspace are PCM devices and kcontrols, it doesn’t matter too much if there is one card, two cards, and if the implementation relies on an ASoC codec, a library or something else. 
>> The bulk of the work is to enable the USB offload from top to bottom, by changing PipeWire/CRAS/HAL to select the new optimized path when available and deal with plug/unplug events.
>> Improvements at the kernel level can be done later if required. It’s hard to argue that the proposal in this series is fundamentally broken, but as usual it’s likely that some requirements are missing or not known yet. The same thing happened with compressed offload, none one thought about gapless playback until Android made it a requirement. Maybe what we’d need is a ‘protocol version’ for USB offload so that changes can be tracked and handled?
>
> Thanks for chiming in, Pierre.  So for now, with the next revision I have prepared, I'm currently adding:
>
> 1.  Some improvements to xHCI sideband to account for core sequences that need to be notified to the offload driver, ie transfer ring free
>
> 2.  Moved the USB SND offload mixer driver into the QC vendor module for now, as instructed by Takashi:
>
> https://lore.kernel.org/linux-usb/87cyiiaxpc.wl-tiwai@suse.de/
>
> 3.  Added separate kcontrols for fetching mapped PCM device and card indexes (versus one that returns a card and PCM device pair [array])
>
> 4.  Removed some jack controls (enable/disable) from soc-usb
>
> 5.  Updated documentation for #3
>
>
> Those are the major changes that will come in the next revision.  I'm just trying to figure out who/where the "protocol version" should be checked if we decided to add it.  (or if we need to check for it anywhere...)  From the userspace perspective, it should be agnostic to how we've implemented offloading from the kernel, and I don't see any major shifts in how userspace implements things even if we make improvements from kernel.


Hi Takashi,

Could you possibly help share some direction on what you think of the current design, and if you think its detrimental that we make modifications mentioned by Cezary?  I have the next revision ready for review, but I wanted to get a better sense on the likeliness of this landing upstream w/o the major modifications.


Thanks

Wesley Cheng


>
> Thanks
>
> Wesley Cheng
>

