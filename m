Return-Path: <linux-input+bounces-8487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCD89EBDBC
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 23:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBEFD28A631
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 22:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5315F1EE7B3;
	Tue, 10 Dec 2024 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eBiwPlTN"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364122451E5;
	Tue, 10 Dec 2024 22:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733869245; cv=none; b=pPEGpDlCz4npP9obMTtC3U2eFKpYl3GqrT/t++5yVK1XeydXzd8FuqSvoZA86VEeMVoeWISUTBSKw+K09oWxhSaNvZkQC4gCE0vjyRRVb/ylw+VHHJeNy3fx3fPgKNYIG2vcJz6C/3tCQUTp0Uo0vPE8x/nqhoSkygzVFyF9Ofk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733869245; c=relaxed/simple;
	bh=NoTqrj1Ys1/BxjrBZyNKiqpzAWbzkPtUgvifUZxoRwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LpIqEzZf0h/iVRRuucXdqO35lwiRLN192uQonMSaZt4ZWZ6rwOH5CJeu2j2wNkEhQPXqHc8P4DS04+SAtciYk3w2n8cWnjbqxzjHR0lepYJUYs6tRdvNbn+oCJ1N0AyVmyAyNxFvk3So+L4mw+j6qYAhXvLQlwSrJoJ8EHwmicM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eBiwPlTN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAGBUKX019511;
	Tue, 10 Dec 2024 22:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NoTqrj1Ys1/BxjrBZyNKiqpzAWbzkPtUgvifUZxoRwQ=; b=eBiwPlTNvm7f3p8Z
	+7dh9E41m4SwdwZJfb/7H7EoNcNYjzr3nfAWsy0tDdDIPIMjF9l2FGttgSvJ94Ew
	f85uOGPrjpiYTs8pwlzz9KL8M3KFmYsCN/6Y1ZHKaAe0RIFEIquIvIrZzpHxvhV/
	hWB8DWjQvRUmvBxzojhCZmnt6jgVlsp2uo0d7yC0hH+Op1VjGozJ3BL8I12pOQQu
	M5GX01oJG9wV/1wwb/IvByavGFDPM+f86Kq4YCPZRz7oRCxpPVVZeEVm8WW6Lglc
	KsVgO2cn32u06KvrmUZhi+YXSXICP705BwuNatb/dz+a/s9NemuQaHBFsktLtW5a
	CH+3ng==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgsyfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 22:20:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BAMKC5F002577
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 22:20:12 GMT
Received: from [10.110.54.253] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 10 Dec
 2024 14:20:12 -0800
Message-ID: <031570d9-8af1-4d4e-9390-865c3d7a2ee8@quicinc.com>
Date: Tue, 10 Dec 2024 14:20:11 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>,
        <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Pierre-Louis
 Bossart <pierre-louis.bossart@linux.dev>
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
 <d7c52a11-bd2b-4cce-a0c2-6dc2dadfeaa3@quicinc.com>
 <3d9932fa-dbc3-4393-862f-92916e6e821c@intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <3d9932fa-dbc3-4393-862f-92916e6e821c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Sq7FuCOCdL55PT_69Hv4Ndwr3u26TRqo
X-Proofpoint-ORIG-GUID: Sq7FuCOCdL55PT_69Hv4Ndwr3u26TRqo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100159


On 12/10/2024 7:18 AM, Cezary Rojewski wrote:
> On 2024-12-06 1:28 AM, Wesley Cheng wrote:
>>
>> On 12/4/2024 2:01 PM, Cezary Rojewski wrote:
>>> On 2024-12-03 9:38 PM, Wesley Cheng wrote:
>>>> Hi Cezary,
>>>>
>>>> On 12/3/2024 8:17 AM, Cezary Rojewski wrote:
>
> ...
>
>>>>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>>>>>
>>>>
>>>> Just to clarify, "struct snd_soc_usb" does have some correlation with our "codec" entity within the QCOM ASoC design.  This would be the q6usb driver.
>>>>
>>>>
>>>>> Currently struct snd_soc_usb does not represent any component at all. Lack of codec representative, component representative and, given my current understanding, mixed dependency of sound/usb on sound/soc/soc-usb does lead to hard-to-understand ASoC solution.
>>>>
>>>>
>>>> IMO the dependency on USB SND is necessary, so that we can leverage all the pre-existing sequences used to identify USB audio devices, and have some ability to utilize USB HCD APIs as well within the offload driver.
>>>
>>> So, while I do not have patches in shape good enough to be shared, what we have in mind is closer to existing HDAudio solution and how it is covered in both ALSA and ASoC.
>>>
>>> A ASoC sound card is effectively a combination of instances of struct snd_soc_component. Think of it as an MFD device. Typically at least two components are needed:
>>>
>>> - platform component, e.g.: for representing DSP-capable device
>>> - codec component, e.g.: for representing the codec device
>>>
>>> USB could be represented by such a component, listed as a dependency of a sound card. By component I literally mean it extending the base struct:
>>>
>>> stuct snd_soc_usb {
>>>      struct snd_soc_component base;
>>>      (...)
>>> };
>>>
>>> In my opinion HDAudio is a good example of how to mesh existing ALSA-based implementation with ASoC. Full, well implemented behaviour of HDAudio codec device drivers is present at sound/pci/hda/patch_*.c and friends. That part of devoid of any ASoC members. At the same time, an ASoC wrapper is present at sound/soc/codecs/hda.c. It will represent each and every HDAudio codec device on the HDAudio bus as a ASoC-component. This follows the ASoC design and thus is easy understand for any daily ASoC user, at least in my opinion.
>>>
>>> Next, the USB Audio Offload streams are a limited resource but I do not see a reason to not treat it as a pool. Again, HDAudio comes into picture. The HDAudio streams are assigned and released with help of HDAudio library, code found in sound/hda/hdac_stream.c. In essence, as long as UAOL-capable streaming is allowed, a pcm->open() could approach a UAOL-lib (? component perhaps?) and perform ->assign(). If no resources available, fallback to the non-offloaded case.
>>>
>>> While I have not commented on the kcontrol part, the above means that our current design does go into a different direction. We'd like to avoid stream-assignment hardcoding i.e.: predefining who owns a UAOL-capable stream if possible.
>>>
>>>
>>
>> Thanks for sharing the implementation for HDA.  I did take a look to the best of my ability on how the HDAudio library was built, and I see the differences that are there with the current proposal.  However, I think modifying the current design to something like that would also require the QCOM ASoC side to change a bit too.  As mentioned by Pierre, I think its worthwhile to see if we can get the initial changes in, which is the major part of the challenge.  For the most part, I think we could eventually refactor soc-usb to behave similarly to what hda_bind.c is doing.  Both entities are the ones that handle linking (or creation in case of HDA) of ASoC components.  The one major factor I can see is that within the HDA implementation vs USB SND is that, for USB, hot plugging is a common practice, and that's a scenario that will probably need more discussion if we do make that shift.
>>
>>
>> Anyway, I just wanted to acknowledge the technical details that are utilized by HDAudio, and that we could potentially get there with USB SoC as well.
>
> Hello,
>
>
> After analyzing the USB for some time to get an even better understanding of what's present in this series, I arrived at a conclusion that indeed, the approach present here clearly differs from what I would call _by the book_ approach for hardware-based USB Audio offloading.
>
> All sections below refer to the public xHCI spec [1].
> A high-level bullets for the probing procedure:
>
> 1. xHCI root and resources probe() as they do today
> 2. xHCI reads HCCPARAMS2 (section 5.3.9) and checks GSC bit
> 2a. If GSC==0, the UAOL enumeration halts
>
> 3. xHCI sends GET_EXTPROP_TRB with ECI=1 to retrieve capabilities supported (section 4.6.17 and Table 4-3)
> 3a. If AUDIO_SIDEBAND bit is not set, the UAOL enumeration halts
>
> 4. Create a platform_device instance. This instance will act as a bridge between USB and ASoC world. For simplicity, let's call it usb-component, a representative of USB in struct snd_soc_component.
>
> 5. On the platform_device->probe() the device requests information about resources available from xHCI (section 7.9.1.1), ECI=1, SubType=001
> 6. Allocate a list of streams per device or list per endpoint supported based on the data retrieved with the followup TRB of SubType=010.
>

Hi Cezary,

Ah...this is why I mentioned earlier if what you were talking about was the XHCI audio sideband feature mentioned in the xHCI spec, which this series is not.  What you are mentioning is a full HW offload of audio transfers, and that system memory is not utilized for those transfers.  In this case, we're just offloading the work, ie handling of data transfers, to an audio DSP.  This is what Mathias and I clarified on the below discussion:
https://lore.kernel.org/linux-usb/17890837-f74f-483f-bbfe-658b3e8176d6@linux.intel.com/


> (things get more complicated here, stopping)
>
> Now, any time a sound card with bound usb-component would begin PCM operation, starting with substream->open(), the component would first check if the device and/or the endpoint has resources necessary to support offloading. If not, it would fallback to the non-offloaded case.
>
>
> I do not see implementation for any TRBs I mentioned above here. The HCCPARAMS2 seem to be ignored too. At the same time, I'm unsure about the "interrupters" piece. I believe they make the approach present here somehow work, yet may not be required by the _by the book_ approach at all.
>
>

IMO, the xHCI spec doesn't really go over the audio sideband implementation in detail, so its hard to evaluate what a proper design is to accommodate for it.  I've heard that there was work done on the Windows OS to support this, but other than a brief mention of it, there were no implementation details either.  In this series, the proposal is that the apps/main core is still responsible for handling the control interfaces and power management, and only offloading the handling and completion of transfers.


Thanks

Wesley Cheng


