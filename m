Return-Path: <linux-input+bounces-8257-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6CF9D9F8B
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 00:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C615B21462
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 23:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E961DFDAE;
	Tue, 26 Nov 2024 23:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NwKd34f+"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D2A1DA23;
	Tue, 26 Nov 2024 23:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732663217; cv=none; b=PgHudHFcFLR6zxr4PiOlAUwXsEUjqh39482POcsuRdUpgOUW6wft1b5W8zOTqmQGljqebUbFOeoTTwuvT/O843jxD71a+DHnK7HvbBpM8KltE/WWzPFIikyJzU0o44bRwpRYg2JBsmjMIj3SlRcY8TWfFkjOFRejNQR5AYcCTH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732663217; c=relaxed/simple;
	bh=uYz1fIPEEUSYGIPG3S07I/kURabcIlSMz61S+iMi4fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Fji7JU1DOCzfdoGT3luHzLCGe55iEbQaGtZOqfknFYGZ6YhdGMqNU/JiS0ZQAX+uUXDUMzDPVzt3eUS3qPlO+o238A57LiMkQsbVFYqrTDontrUdiB+TctoFxefMeyYaiTcWiDrqiofOSRuP7Xp02IHq0GRdvg/MtabDxgORjhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NwKd34f+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQKLKLp003917;
	Tue, 26 Nov 2024 23:19:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JXOj1uo6qRGb0YQzjEwm+4KOBZcNIhIGsYVmiWDab6k=; b=NwKd34f+BNxW/8TT
	6k+dBzD5ef11xfSeFzze0MoMvTTxXmyzIemzgsjfB85VroZ6inezQqOqp5gvVANn
	7/kRbk2NmBm443erBdfdz4tTgeBdl9l1sPcd68mJRG/ck6FhZVVl47izLSLjnM4G
	ksTILhNF77c4TgCTas8j2JK2h3bRBBVMXPgKq57hr/qkcFPB3cskrrhNHmkaDXar
	VtERgnFMTnlOExjBkowSltYS0N8ZhhQRBRHgLj1b5k8PY8JTOe1lTraAYo1L5H3d
	txi4+ZtE12zBPmF28EH9Wkqj0KoqnJS7LdpfSd15afuF6uG0MTtCwOX5juMKQq5E
	5I2S3g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 435839aqrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 23:19:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQNJtaX020705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 23:19:56 GMT
Received: from [10.110.73.239] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 15:19:55 -0800
Message-ID: <d4d94c91-5b40-4ed3-9895-8f8c85fd0a29@quicinc.com>
Date: Tue, 26 Nov 2024 15:19:54 -0800
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
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.dev>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-29-quic_wcheng@quicinc.com>
 <87bjya3xzw.wl-tiwai@suse.de>
 <02c20b06-34ef-459b-9cd1-2d2735eb1352@quicinc.com>
 <87zfls1t7x.wl-tiwai@suse.de>
 <8fc53dd9-0c26-410c-b1b1-3d6df7894a44@quicinc.com>
 <87cyiiaxpc.wl-tiwai@suse.de>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87cyiiaxpc.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pZrM1Xsvu6nZrHsg37EGUg7jbpgwR8Gp
X-Proofpoint-ORIG-GUID: pZrM1Xsvu6nZrHsg37EGUg7jbpgwR8Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260187

Hi Takashi,

On 11/26/2024 6:14 AM, Takashi Iwai wrote:
> On Mon, 25 Nov 2024 21:33:03 +0100,
> Wesley Cheng wrote:
>> Hi Takashi,
>>
>> On 11/21/2024 7:50 AM, Takashi Iwai wrote:
>>> On Wed, 20 Nov 2024 20:13:34 +0100,
>>> Wesley Cheng wrote:
>>>> Hi Takashi,
>>>>
>>>> On 11/20/2024 4:12 AM, Takashi Iwai wrote:
>>>>> On Wed, 06 Nov 2024 20:34:11 +0100,
>>>>> Wesley Cheng wrote:
>>>>>> In order to allow userspace/applications know about USB offloading status,
>>>>>> expose a sound kcontrol that fetches information about which sound card
>>>>>> and PCM index the USB device is mapped to for supporting offloading.  In
>>>>>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>>>>>> responsible for registering to the SOC USB layer.
>>>>>>
>>>>>> It is expected for the USB SND offloading driver to add the kcontrol to the
>>>>>> sound card associated with the USB audio device.  An example output would
>>>>>> look like:
>>>>>>
>>>>>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>>>>>> -1, -1 (range -1->255)
>>>>>>
>>>>>> This example signifies that there is no mapped ASoC path available for the
>>>>>> USB SND device.
>>>>>>
>>>>>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>>>>>> 0, 0 (range -1->255)
>>>>>>
>>>>>> This example signifies that the offload path is available over ASoC sound
>>>>>> card index#0 and PCM device#0.
>>>>>>
>>>>>> The USB offload kcontrol will be added in addition to the existing
>>>>>> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
>>>>>> the USB audio device specific parameters are still valid and expected to be
>>>>>> used.  These parameters are not mirrored to the ASoC subsystem.
>>>>>>
>>>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>> IIRC, this representation of kcontrol was one argued issue; Pierre
>>>>> expressed the concern about the complexity of the kcontrol.
>>>>> I didn't follow exactly, but did we get consensus?
>>>> So the part that Pierre had concerns on was that previously, the
>>>>> implementation was placing offload kcontrols to the ASoC platform
>>>>> card, and had some additional controls that complicated the
>>>>> offload implementation about the offload status for each USB audio
>>>>> device.  This was discussed here:
>>>> https://lore.kernel.org/linux-usb/957b3c13-e4ba-45e3-b880-7a313e48c33f@quicinc.com/
>>>>
>>>> To summarize, I made the decision to move the offload status
>>>> kcontrols from ASoC --> USB SND and limited it to only one kcontrol
>>>> (mapped offload device).  So now, there exists a kcontrol for every
>>>> USB SND device (if the offload mixer is enabled), where it tells
>>>> userspace the mapped ASoC platform card and pcm device that handles
>>>> USB offloading, else you'll see the "-1, -1" pair, which means
>>>> offload is not possible for that USB audio device.
>>> OK, the simplification is good.  But I wonder whether the current
>>> representation is the best.  Why not just providing two controls per
>>> PCM, one for card and one for device, instead of two integer array?
>>> It would look more intuitive to me.
>>>
>> I could separate it, but we would have to have a pair of controls
>> for each available USB PCM playback stream supported by the device.
>> However, before I get into making that change, I think the decision
>> for either two or one FE needs to be decided. Again, I think the 2
>> FE approach is much less invasive to the USB SND/ASoC core files,
>> and ensures the legacy USB SND path still works through the
>> non-offloaded data path.
> Sure, the decision about the 2 FEs is the most significant one, and
> those controls depend on that.


Would like to get closure on that here... (1 vs 2 FEs)  My stance is that the 2 FE approach can be the initial one we can take as it still incorporates the significant blocks that would apply to both situations.  From the userspace perspective, since audio offloading doesn't exist yet, applications should be working off the USB SND device and the SW path.  For those, without changes to look for the offload kcontrol, they can continue to operate off the USB SND PCM devices directly.  If enhancements are made to look for the offload kcontrol, then applications would first refer to the kcontrol of the USB SND device and look for existence of the offload controls.  If present they can then open the ASoC PCM devices.

If we then decided to move to the 1 FE approach in the future, this doesn't affect the userspace entities that added support during the 2 FE stages, because we are always first referring to the USB SND device to query for offload support.  The idea for the 1 FE design is that the userspace doesn't need to check for offload support, it just behaves as if it was opening the USB SND devices. (which should be the base of all applications working with USB SND)


> So my comment assumes that, and if that applied, we need to consider
> which kcontrol representation is better for users.  I don't mind too
> much about that, but generally speaking, simpler representation is
> better in the end, even if it leads to more elements.  e.g. sysfs
> allows basically only one value per file principle, too.
>
>
>>>>> Apart from that: the Kconfig defition below ...
>>>>>
>>>>>> +config SND_USB_OFFLOAD_MIXER
>>>>>> +	tristate "USB Audio Offload mixer control"
>>>>>> +	help
>>>>>> +	 Say Y to enable the USB audio offloading mixer controls.  This
>>>>>> +	 exposes an USB offload capable kcontrol to signal to applications
>>>>>> +	 about which platform sound card can support USB audio offload.
>>>>>> +	 The returning values specify the mapped ASoC card and PCM device
>>>>>> +	 the USB audio device is associated to.
>>>>> ... and Makefile addition below ...
>>>>>
>>>>>> --- a/sound/usb/Makefile
>>>>>> +++ b/sound/usb/Makefile
>>>>>> @@ -36,3 +36,5 @@ obj-$(CONFIG_SND_USB_US122L) += snd-usbmidi-lib.o
>>>>>>  
>>>>>>  obj-$(CONFIG_SND) += misc/ usx2y/ caiaq/ 6fire/ hiface/ bcd2000/ qcom/
>>>>>>  obj-$(CONFIG_SND_USB_LINE6)	+= line6/
>>>>>> +
>>>>>> +obj-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>>>>> ... indicates that this code will be an individual module, although
>>>>> it's solely used from snd-usb-audio-qmi driver.  This should be rather
>>>>> a boolean and moved to sound/usb/qcom/, and linked to
>>>>> snd-usb-audio-qmi driver itself, e.g.
>>>>>
>>>>> --- a/sound/usb/qcom/Makefile
>>>>> +++ b/sound/usb/qcom/Makefile
>>>>> @@ -1,2 +1,3 @@
>>>>>  snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
>>>>> +snd-usb-audio-qmi-$(CONFIG_SND_USB_OFFLOAD_MIXER) += mixer_usb_offload.o
>>>>>  obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
>>>>>
>>>>> Then you can drop EXPORT_SYMBOL_GPL(), too.
>>>> Had a discussion with Pierre on this too below.
>>>>
>>>> https://lore.kernel.org/linux-usb/f507a228-4865-4df5-9215-bc59e330a82f@linux.intel.com/
>>>>
>>>> I remember you commenting to place it in this vendor offload module,
>>>> which is what I did on v24.
>>> I assume that my early comment was based on your old implementations,
>>> and I guess it was because the mixer part didn't belong to the qcom
>>> stuff.  Now it belongs solely to qcom, the situation changed; it makes
>>> no sense to make it an individual module at all.
>>>
>>>
>> I guess Pierre's feedback was that he believed this should be vendor
>> agnostic, because any vendor that could potentially support USB
>> audio offload should have the same kcontrol within the USB SND
>> device.  Hence the reason for keeping it within generic code.  Since
>> QC is the only user of this now.  Do you prefer to make this part of
>> the vendor module for now, until another user comes along and
>> introduces offload support?
> Yes, less module is preferred for now.  If the stuff is agnostic and
> really used by multiple instances, we can factor out to an individual
> module again.
>

OK, sounds good.  I will make it as part of our package then.

Thanks

Wesley Cheng


