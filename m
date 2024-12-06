Return-Path: <linux-input+bounces-8418-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CF69E62A7
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 01:55:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE209283B66
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 00:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0233F13D245;
	Fri,  6 Dec 2024 00:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="adwJKSIi"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BF847F53;
	Fri,  6 Dec 2024 00:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733446461; cv=none; b=FDi0NmHrthEmkmMHjWVCQovcC1JZj6R7wt0+Xycow4vFrvzxJZMtGRo6R4ypaUIl8q0uef9BOM9fWrD7jl61bmfNAcCPwbcFigm1+4n0p1q8jWw9LypuzyoYP1BsnXzfaS8XVnk3Uou38K/mmEQNCRiuY37isyhb1XJWUsXZj9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733446461; c=relaxed/simple;
	bh=zU/Ob/0H2ECG4sYoylH6KG177uMJ2rQquBgB0bWCbOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ixMG3LKbrWYYqw1WNld1ykutFhsRfFzGyLW4IwC8Yl/2nEClYnuclJ39OevWuhlgndkYAyjxA8fSRyHisSCm16rl4UFxROWbq6mgKzbwYlUYmO0bUI0Q2VQJ2mJ48EZ8ecsIeGmt9XrnLlXZXDAOShkf7VCE7rPahwQqfO4iDDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=adwJKSIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HadST005219;
	Fri, 6 Dec 2024 00:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zU/Ob/0H2ECG4sYoylH6KG177uMJ2rQquBgB0bWCbOI=; b=adwJKSIi+w5XyKTt
	+kX3DOT1SzOtuaGREZyMADjlgpw55vejiozxyZ7416kT3xo8ezQTZ9TtB9y4Cf1g
	pHCaJe9j2wb616j/4SzdAb5cbddthy/+H53oQBjcFj3U83li0kUxbUurqhpif/Od
	5tC0BjHf1H2o8l/TAdKT3srFlFNbEYAtg9OQuCobxO9t139Yiffim8MpGHxaeJT6
	W13B8qjPzujMUEbkz3vWeAuzbFOrqfGwIslnxHKUsvUXhGbW411OpTJzI2GVrFh9
	PNJgjwNQWKNRk+Gt/zFi9BonVgiXZDvw6lZGXU0MlB3g8fORhL7wBB+WgrIAwTwF
	96JFQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba142514-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 00:53:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B60rttG009017
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 00:53:55 GMT
Received: from [10.71.112.120] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 16:53:55 -0800
Message-ID: <0a36814a-5818-493a-a9e3-b1a1e9559387@quicinc.com>
Date: Thu, 5 Dec 2024 16:53:54 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4E9925AF-F297-42A5-9CB8-F8568F0A5EDF@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xnlrAd4vM065YTEDkp5w1IU4WxluZVdD
X-Proofpoint-ORIG-GUID: xnlrAd4vM065YTEDkp5w1IU4WxluZVdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1011 mlxscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=920 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060005


On 12/4/2024 2:49 PM, Pierre-Louis Bossart wrote:
>
>>
>>
>>>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>>> The main difference is that we don’t want the USB audio *control* part to be seen in two places. The only requirement is to stream data with an alternate optimized path, but all the volume control and whatnot is supposed to be done using the regular usb-audio card. It would be complete chaos for userspace if the same volume can be represented differently.
>>> The comparison with HDaudio is not quite right either. In the case of HDaudio, it’s an all-or-nothing solution. The external device is controlled by one entity, either legacy or ASoC based. That choice is made at driver probe time. In the case of USB, the application needs to have the choice of using either the legacy path, or the optimized path that goes through a DSP. I think the last thing you want given this context is to make the USB audio device an ASoC codec.
>>> I find it rather interesting that this architectural feedback comes at the v30, it’s unfair to Wesley really...
>>
>> Hi Pierre,
>>
>> Obviously I'm late. After scanning the history of this one, indeed it's been a while since v1 has been sent. And thus I posted no NACKs. At the same time if I am to choose between: provide feedback vs provide no-feedback, I'd rather choose the former even if I'm to be ignored/overridden by a subsystem maintainer.
>>
>> The subsystem maintainers also hold the last word, and I have no problem with them merging the patches if they believe its existing shape is good-enough. For example, my team could follow up this implementation next year with a patchset expanding/updating the functionality. I see this as a viable option.
>
> That’s what we had in mind before I left Intel. The interfaces seen by userspace are PCM devices and kcontrols, it doesn’t matter too much if there is one card, two cards, and if the implementation relies on an ASoC codec, a library or something else. 
> The bulk of the work is to enable the USB offload from top to bottom, by changing PipeWire/CRAS/HAL to select the new optimized path when available and deal with plug/unplug events.
> Improvements at the kernel level can be done later if required. It’s hard to argue that the proposal in this series is fundamentally broken, but as usual it’s likely that some requirements are missing or not known yet. The same thing happened with compressed offload, none one thought about gapless playback until Android made it a requirement. Maybe what we’d need is a ‘protocol version’ for USB offload so that changes can be tracked and handled?


Thanks for chiming in, Pierre.  So for now, with the next revision I have prepared, I'm currently adding:

1.  Some improvements to xHCI sideband to account for core sequences that need to be notified to the offload driver, ie transfer ring free

2.  Moved the USB SND offload mixer driver into the QC vendor module for now, as instructed by Takashi:

https://lore.kernel.org/linux-usb/87cyiiaxpc.wl-tiwai@suse.de/

3.  Added separate kcontrols for fetching mapped PCM device and card indexes (versus one that returns a card and PCM device pair [array])

4.  Removed some jack controls (enable/disable) from soc-usb

5.  Updated documentation for #3


Those are the major changes that will come in the next revision.  I'm just trying to figure out who/where the "protocol version" should be checked if we decided to add it.  (or if we need to check for it anywhere...)  From the userspace perspective, it should be agnostic to how we've implemented offloading from the kernel, and I don't see any major shifts in how userspace implements things even if we make improvements from kernel.


Thanks

Wesley Cheng


