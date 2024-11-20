Return-Path: <linux-input+bounces-8176-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00E9D4267
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 20:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1093FB211E1
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 19:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E371BE23C;
	Wed, 20 Nov 2024 19:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LHFCzK89"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7F21BD9CC;
	Wed, 20 Nov 2024 19:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130038; cv=none; b=uHGJQoiRfhwqDMobC3LkrdPeoMEO8Gk7pJaATa9UUkVzIR2jaQ47frCNsc3xFTCVwmN9rjBmfQ2boq5eAvwvWLBrlP1J9e31MkCNmIWUeNVHnxKkB8THsvioy4l6i8XPirgFkwN8VDSo6QNMkOEX+an8dKfGRRs3sCW7H5v9N9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130038; c=relaxed/simple;
	bh=mEsKzUYLiMK+Irx2LHiLlacnbn1Jq9aoRKytVJw2fJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tuvK6Wql3w/tM8I+ygcb+6at9Axc/KbaCsoX+TAZY9mII/JdCn8cA7TNz/o/6W1xp+VznzgqlYaUowtzb5UrtXO8brQ4Uz9jMO+Jg7o7Vwl9DcYKahTITO9kbacpRV4yVsbx+9ug+3yhiOthb8KfAnfYd6rj8B+CXLj6/KHbqmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LHFCzK89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKAjtv1004593;
	Wed, 20 Nov 2024 19:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PRgl+A5czD1vLYckMAcFjfhUCMb9rNaDVG9BQoUpWWo=; b=LHFCzK89UmfPRv6n
	EZ0Xv3bacCjleZB4+w2zLYkkpljS4dwYkv6oW2qC+a0GzIyIut37r+Akl8TzuNzp
	IKUFom+wPfq+Bnr2lCAz31VGne7QGa5PXcgVsGhIYmEi24LtGpgC7lWVO6yTFTcp
	tyFfbqhYBPZajJT0Yu4E9XC8CLPRF7mm2XBPvytUykJgIeAZkw97NNskU6MBinac
	eKO3W5Hz8xLoQFfvEUr4QwqOdUayrxwvHUSc7NvcDfOJCd6+2zdCK4Gw2Y5xTGdy
	x+SSolBDrBHkz0IfcSLBpb7tSCVcMx44LDVjxpkGdVJgLWmMcb4UbGMHbOC1E42q
	jyyZPg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431ea719ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 19:13:36 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKJDZhm018898
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 19:13:35 GMT
Received: from [10.110.30.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 11:13:35 -0800
Message-ID: <02c20b06-34ef-459b-9cd1-2d2735eb1352@quicinc.com>
Date: Wed, 20 Nov 2024 11:13:34 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 28/30] ALSA: usb-audio: Add USB offload route kcontrol
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-29-quic_wcheng@quicinc.com>
 <87bjya3xzw.wl-tiwai@suse.de>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87bjya3xzw.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sqkKZTyGo3C_8Bm1FdjXq4-r8MU9hacU
X-Proofpoint-ORIG-GUID: sqkKZTyGo3C_8Bm1FdjXq4-r8MU9hacU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200133

Hi Takashi,

On 11/20/2024 4:12 AM, Takashi Iwai wrote:
> On Wed, 06 Nov 2024 20:34:11 +0100,
> Wesley Cheng wrote:
>> In order to allow userspace/applications know about USB offloading status,
>> expose a sound kcontrol that fetches information about which sound card
>> and PCM index the USB device is mapped to for supporting offloading.  In
>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>> responsible for registering to the SOC USB layer.
>>
>> It is expected for the USB SND offloading driver to add the kcontrol to the
>> sound card associated with the USB audio device.  An example output would
>> look like:
>>
>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>> -1, -1 (range -1->255)
>>
>> This example signifies that there is no mapped ASoC path available for the
>> USB SND device.
>>
>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>> 0, 0 (range -1->255)
>>
>> This example signifies that the offload path is available over ASoC sound
>> card index#0 and PCM device#0.
>>
>> The USB offload kcontrol will be added in addition to the existing
>> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
>> the USB audio device specific parameters are still valid and expected to be
>> used.  These parameters are not mirrored to the ASoC subsystem.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> IIRC, this representation of kcontrol was one argued issue; Pierre
> expressed the concern about the complexity of the kcontrol.
> I didn't follow exactly, but did we get consensus?
So the part that Pierre had concerns on was that previously, the implementation was placing offload kcontrols to the ASoC platform card, and had some additional controls that complicated the offload implementation about the offload status for each USB audio device.  This was discussed here:

https://lore.kernel.org/linux-usb/957b3c13-e4ba-45e3-b880-7a313e48c33f@quicinc.com/

To summarize, I made the decision to move the offload status kcontrols from ASoC --> USB SND and limited it to only one kcontrol (mapped offload device).  So now, there exists a kcontrol for every USB SND device (if the offload mixer is enabled), where it tells userspace the mapped ASoC platform card and pcm device that handles USB offloading, else you'll see the "-1, -1" pair, which means offload is not possible for that USB audio device.

> Apart from that: the Kconfig defition below ...
>
>> +config SND_USB_OFFLOAD_MIXER
>> +	tristate "USB Audio Offload mixer control"
>> +	help
>> +	 Say Y to enable the USB audio offloading mixer controls.  This
>> +	 exposes an USB offload capable kcontrol to signal to applications
>> +	 about which platform sound card can support USB audio offload.
>> +	 The returning values specify the mapped ASoC card and PCM device
>> +	 the USB audio device is associated to.
> ... and Makefile addition below ...
>
>> --- a/sound/usb/Makefile
>> +++ b/sound/usb/Makefile
>> @@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
>>  
>>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
>>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
>> +
>> +obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
> ... indicates that this code will be an individual module, although
> it's solely used from snd-usb-audio-qmi driver.  This should be rather
> a boolean and moved to sound/usb/qcom/, and linked to
> snd-usb-audio-qmi driver itself, e.g.
>
> --- a/sound/usb/qcom/Makefile
> +++ b/sound/usb/qcom/Makefile
> @@ -1,2 +1,3 @@
>  snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
> +snd-usb-audio-qmi-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>  obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
>
> Then you can drop EXPORT_SYMBOL_GPL(), too.

Had a discussion with Pierre on this too below.

https://lore.kernel.org/linux-usb/f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com/

I remember you commenting to place it in this vendor offload module, which is what I did on v24.

Thanks

Wesley Cheng


