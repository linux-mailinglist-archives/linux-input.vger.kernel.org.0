Return-Path: <linux-input+bounces-8370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 345BB9E2DE2
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 22:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FEA7B65A79
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 20:39:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D1520A5D4;
	Tue,  3 Dec 2024 20:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fGmWqPJD"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77EA1FE473;
	Tue,  3 Dec 2024 20:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258323; cv=none; b=lCRcdsXqSC5k3dodFrYoAyCzn23la76sPYwny7M9jaSkbvbFD736RLwujwYdF/MPR3gjPGyY+a6n4FjNcBbnXv/Q+UiZn9HQ7AJ84M9qUEDbXxsB5Udk5N7OsLvMNx580Ln/kf7erYCBERWTCLYkMRi/oaiJRSepek+8UXSuBLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258323; c=relaxed/simple;
	bh=94JzEeckUrjaSu/+EvRVY094LY+LA5NZhiDqsymCTJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=IgDasUQJJGhHTlGDGhiE7AOcJIMyzNscr4e0hw07eYb1c/gPFrVYBmbY8DGwbUuRtPR0zww7glGe33Fl318RuwZZzfvcPE7sgMLCyRI5kt86BJuJeoaPo6FoK0cs8arttZpeGLT0FHoKAehHgDcPzHxwReSqgIN1q+0UDRAMuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fGmWqPJD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3E5sbI020088;
	Tue, 3 Dec 2024 20:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94JzEeckUrjaSu/+EvRVY094LY+LA5NZhiDqsymCTJc=; b=fGmWqPJD61b4vq6O
	4rnpeG1efOyU1iXrDXmvyLm9fejx4AFTFUNKzubhBz56ofzUS/39/6fufLq/jv1J
	nOmkCrYa2hLJGYLOwZFZjducsS57OtyI9rsMPr68KJNFMnhTym9hR+lnvdMfvXKg
	WQVvf+9vcybmVBYrCg0hNFg9LY/86jb4Z+Uxeesqw/EHgS+fPX7JHEYiaB+n72dJ
	YxFqJ0QKa7Y8DWaBbIWIeInPqfYFrbo1zOUjlX5lIX1wfZpwNoSOlogPPYghB6kS
	zcb3Hl29XIapKDedtBZFANUw7mba+dHq7OnXoTKTKKnkrQS9j0g5XazzMxIm3EAo
	xoTd5Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43a3ex91b8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 20:38:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3KcDxJ031812
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 20:38:13 GMT
Received: from [10.110.57.23] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 12:38:10 -0800
Message-ID: <fbc04c06-c210-416b-9b77-a6bd8a71a637@quicinc.com>
Date: Tue, 3 Dec 2024 12:38:10 -0800
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -2kAllSx6FTGo_897E4oR6tdIqKNN2ua
X-Proofpoint-GUID: -2kAllSx6FTGo_897E4oR6tdIqKNN2ua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412030171

Hi Cezary,

On 12/3/2024 8:17 AM, Cezary Rojewski wrote:
> On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
>> Sorry to chime in late, I only look at email occasionally.
>>
>
> ...
>
>> My Reviewed-by tags were added in the last updates. I am not sure if anyone else at Intel had the time to review this large patchset.
>>
>>> I believe Amadeusz was still against having the two card design, and wants the routing to automatically happen when playback happens on the sound card created by the USB SND layer.  However, even with that kind of implementation, the major pieces brought in by this series should still be relevant, ie soc-usb and the vendor offload driver.  The only thing that would really change is adding a path from the USB SND PCM ops to interact with the ASoC entities.  Complexity-wise, this would obviously have a good amount of changes to the USB SND/ASoC core drivers.  Some things I can think of that we'd need to introduce:
>>
>> The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.
>
>
> Well, I believe a lot has changed since then, not sure if USB Audio Offload (UAOL) was even stable on the Windows solution back then. Obviously we want to incorporate what we have learned during all that time into our solution before it lands on upstream.
>

Hard to comment further without more details on the lessons learnt you had on Windows.  I just want to make sure we're talking about the same feature here, because I see sprinkles of the xHCI audio sideband (section 7.9) on the Windows documentation without much details on how its implemented, which is different than what is presented here.


> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>

Just to clarify, "struct snd_soc_usb" does have some correlation with our "codec" entity within the QCOM ASoC design.  This would be the q6usb driver.


> Currently struct snd_soc_usb does not represent any component at all. Lack of codec representative, component representative and, given my current understanding, mixed dependency of sound/usb on sound/soc/soc-usb does lead to hard-to-understand ASoC solution.


IMO the dependency on USB SND is necessary, so that we can leverage all the pre-existing sequences used to identify USB audio devices, and have some ability to utilize USB HCD APIs as well within the offload driver.


>
>>
>> Having a single USB card in IMHO more complicated:  what happens for example if you plug-in two or more USB devices? Which of the USB cards will expose an optimized path? The design with an ASoC-based card which exposes as many PCM devices as the SOC can support is simpler conceptually and scales well. This would allow e.g. to allocate these PCM devices with different policies (last plugged, preferred, etc).
>>
>> Conceptually for the simple case with a single USB device, it does not really matter if there are two cards or not. What matters is that there is a clear mapping visible to userspace so that application can decide to use the optimized PCM device, when enabled, instead of the legacy one. And in the end, the application is *always* in control in terms of routing. It’s really similar to the compress offload path, some application changes will be required.
>>
>>>
>>> 1.  Exposing some of the ASoC PCM (soc-pcm) APIs to be able to be called by soc-usb (to mimic a FE open from ASoC), so we can trigger ASoC DAI ops when USB SND FE is opened.
>>>
>>> 2.  Proper fallback mechanism in case offload path enablement fails to the legacy USB SND path.
>>>
>>> 3.  Master kcontrol to disable offload logic for each USB SND device.
>>>
>>> IMO, both the points you mentioned correspond to the same topic.  If we go with having offload being operated on one FE, then there is no need for the kcontrol of PCM mapping.  If we have two cards, then we will need the control for offload device mapping.  Can't speak for Pierre, but at least with my discussions with him, I don't think he's against the two card design, just as long as we have the proper kcontrol that notifies userspace of how to utilize the offload path.
>>
>> Even if there’s a single card you need to have a mapping between a ‘legacy’ PCM device and an ‘optimized’ one. This would be a scalar mapping instead of a (card, device) pair, but it’s a minor change.
>>
>> -Pierre
>

