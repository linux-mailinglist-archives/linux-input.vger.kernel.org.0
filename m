Return-Path: <linux-input+bounces-11281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFA1A70E8B
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 02:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADF8E7A3893
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 01:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2096A664C6;
	Wed, 26 Mar 2025 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LxGXRUlZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ADC42A8B;
	Wed, 26 Mar 2025 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742953348; cv=none; b=glXm5oKxnHlRoa3f6xgdlK4wAplvni20HEHSjErEWLYXf12Q58T3pTHrGlBPaM3O+B7mnbUW0hZjBeqnaeRfWA7XyvTYgbJCwkCFazYIMWV0XPOl52k4qcGXzkdgVk4Ow8f/JJi3dDOy1Ai+k0gLMkMmWg0H7q2XHMXCXFlluok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742953348; c=relaxed/simple;
	bh=R8bZfYTsflNVy1yZXbqqdlmcNo1EUdTi/3plZ6Xv40c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i+CBzGI5jbpuQlRoUL72YqE+iv/MjnpUJqN7n+GPRnQxBhUmQq06hdzEgNgkmOX2brcgzKHwZKyl8Dk5tTBvqPi+jCPLfcoBwAsFzgqCtq315d0JP1Fk1CiQIRIg33m+GkgfDVBFwdE7mfuPvWXMpUw5k8SFACKNr4Ur3+i0+Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LxGXRUlZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGaiTO005622;
	Wed, 26 Mar 2025 01:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jG/8MmXGi1LUrYwjdXq076vQieCBZbIBFH+A7XlR4kc=; b=LxGXRUlZEJEQRRG5
	s7UNp+aaw45hTxwvlXKDp+t0WNk+57LQSM/graCzYoYBsj4vGOMOyHUREswP6IR6
	qs+WnX/wWqtrNVqKmmu1wavCUClOnZHUs0goiDH+Md1J0mO1Ho4k9hWqjcnTtcxh
	qfmfQxvFHr9nZfuraYYFKWIZvYfjZOWdfXQp58Iqh9ELKjx+aeqEMJDqxCnnxN67
	sYAvvtL1nEngkkSwMNcqOllH/187pwdgByi0oL6vDDpFENwvauxW6o56NbiH4oX+
	O6hmYf41S381iydIpy1ipEWsmAz3Cq1/Q4UNTQH3sUgHSjAjvscuqSx9g6rsvWvs
	aP8fQw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcybbef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:42:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q1gC16000531
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:42:12 GMT
Received: from [10.71.112.253] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 18:42:11 -0700
Message-ID: <ee95520b-cdcc-4e10-a70e-683993cafe36@quicinc.com>
Date: Tue, 25 Mar 2025 18:42:11 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v36 30/31] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
To: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-31-quic_wcheng@quicinc.com>
 <Z-KU_o_LE3PO6J2y@linaro.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z-KU_o_LE3PO6J2y@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e35b74 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=IcsNMMq9lF3Nb9e63dgA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wQIdrz1gWLNeevlFMaxy0Ufrl9lyiWk0
X-Proofpoint-GUID: wQIdrz1gWLNeevlFMaxy0Ufrl9lyiWk0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260009

Hi Stephan,

On 3/25/2025 4:35 AM, Stephan Gerhold wrote:
> On Tue, Mar 18, 2025 at 05:51:40PM -0700, Wesley Cheng wrote:
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
>> ---
>>  sound/usb/Kconfig                  |  10 ++
>>  sound/usb/qcom/Makefile            |   4 +
>>  sound/usb/qcom/mixer_usb_offload.c | 158 +++++++++++++++++++++++++++++
>>  sound/usb/qcom/mixer_usb_offload.h |  17 ++++
>>  sound/usb/qcom/qc_audio_offload.c  |   2 +
>>  5 files changed, 191 insertions(+)
>>  create mode 100644 sound/usb/qcom/mixer_usb_offload.c
>>  create mode 100644 sound/usb/qcom/mixer_usb_offload.h
>>
>> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
>> index 6daa551738da..7d8833945711 100644
>> --- a/sound/usb/Kconfig
>> +++ b/sound/usb/Kconfig
>> @@ -176,9 +176,19 @@ config SND_BCD2000
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called snd-bcd2000.
>>  
>> +config SND_USB_QC_OFFLOAD_MIXER
>> +	tristate "Qualcomm USB Audio Offload mixer control"
> 
> This looks like a "bool" and not a "tristate", since the ifneq in the
> Makefile below ignores whether this is a "y" or "m".
> 

Yeah, let me fix this.

>> +	help
>> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
>> +	 This exposes an USB offload capable kcontrol to signal to
>> +	 applications about which platform sound card can support USB
>> +	 audio offload.  The returning values specify the mapped ASoC card
>> +	 and PCM device the USB audio device is associated to.
>> +
>>  config SND_USB_AUDIO_QMI
>>  	tristate "Qualcomm Audio Offload driver"
>>  	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
>> +	select SND_USB_OFFLOAD_MIXER
> 
> And I think "SND_USB_OFFLOAD_MIXER" (without _QC suffix) doesn't exist
> anymore after v30? I see there was some discussion around that there.
> Is this supposed to be "select SND_USB_QC_OFFLOAD_MIXER"?
> 
> If yes, isn't this option always selected if SND_USB_AUDIO_QMI is
> enabled? In that case you could just drop the config option...
> 

Will address this as well.

Thanks
Wesley Cheng


