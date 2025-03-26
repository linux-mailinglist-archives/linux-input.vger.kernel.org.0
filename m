Return-Path: <linux-input+bounces-11280-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FBA70E6E
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 02:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 859F816C0EF
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 01:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4B54EB51;
	Wed, 26 Mar 2025 01:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SBfqqYy9"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D0020328;
	Wed, 26 Mar 2025 01:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742952754; cv=none; b=WHFhcj4LkHdnDbJFErOx7+5GCIkt6iVgqW8XXHcg6xZm/ahyl9O+A+BBgALhBPdRtP1UYNsw7GrR4cwpwhXz/aWc1IdYtOWY6Ohb0kj1VeP2Z1abelJR4oMFUBd5YngVnC9mZ4q9v5GzE8T3ieRbFNzPkmDsy1bKkivqynTtKew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742952754; c=relaxed/simple;
	bh=8MnpI20UdxMqh87LFXJcjku4Q1JF33CL6rL7FBIsOPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gM7MMfkzjDvVN6lRcuQ3IIIHepSZKzzNYrmKwySY5AEnP0D0R9HCHGpkwu7Jq0p/FO6IInGebmO93tp8zT7yUSxhU6emkbGc1xXrX/sdZLU3pTcJt8NilLo6ISBnQUZqOuDjZ7uNdXjEHcsCnDtXBuUIBKT33nSioRmiSaN9XvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SBfqqYy9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGawBt008370;
	Wed, 26 Mar 2025 01:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vuyh7BqsJ/hMBEiNyvqf3QR6amTKUZvN5jLgpWwgKT0=; b=SBfqqYy9PVSRgtl1
	FFIlQXMDW3DGzQhMZe7t+Io+Syj+yGFhU7BoQXkhOptdi1EW9GD2FTZGdO+P62PT
	Owq9F/5fv2mhDZMNpziewRWGdvATkcDHZ5OlyOl41IS/PFJsa+NHWf7M4/WLH+lG
	TTdr2QSmmwhnqfSS+55K5HEJeXIqizw4pc1+uH0gukja8KoYnP1nWulweBkHAO32
	NTidUx9bF+U7y2gk/k0r/uQlnE/ieezKO6dX0o6RNAlcaA59HEhSC8Q8DkDFFV2a
	ua9dArd+Cf14MRuKMcp0UNbjjBqgTxPvonLxiyOqcEG7aCxqeE4S8R931sR1k4iX
	7/+wew==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd33969-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:32:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52Q1WFeh005964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 01:32:15 GMT
Received: from [10.71.112.253] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 18:32:15 -0700
Message-ID: <5a7442c9-493d-4c23-a179-128f02a29f73@quicinc.com>
Date: Tue, 25 Mar 2025 18:32:14 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v36 28/31] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
To: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Luca Weiss
	<luca.weiss@fairphone.com>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-29-quic_wcheng@quicinc.com>
 <Z-J7n8qLMPVxpwuV@linaro.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z-J7n8qLMPVxpwuV@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E0ngsLGvFpb83eXG9z44oDKFD781KFLE
X-Proofpoint-ORIG-GUID: E0ngsLGvFpb83eXG9z44oDKFD781KFLE
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e35920 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=JhZuM8AjDx3iezwaYmoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260008

hi Stephan,

On 3/25/2025 2:47 AM, Stephan Gerhold wrote:
> On Tue, Mar 18, 2025 at 05:51:38PM -0700, Wesley Cheng wrote:
>> Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
>> support USB sound devices.  This vendor driver will implement the required
>> handshaking with the DSP, in order to pass along required resources that
>> will be utilized by the DSP's USB SW.  The communication channel used for
>> this handshaking will be using the QMI protocol.  Required resources
>> include:
>> - Allocated secondary event ring address
>> - EP transfer ring address
>> - Interrupter number
>>
>> The above information will allow for the audio DSP to execute USB transfers
>> over the USB bus.  It will also be able to support devices that have an
>> implicit feedback and sync endpoint as well.  Offloading these data
>> transfers will allow the main/applications processor to enter lower CPU
>> power modes, and sustain a longer duration in those modes.
>>
>> Audio offloading is initiated with the following sequence:
>> 1. Userspace configures to route audio playback to USB backend and starts
>> playback on the platform soundcard.
>> 2. The Q6DSP AFE will communicate to the audio DSP to start the USB AFE
>> port.
>> 3. This results in a QMI packet with a STREAM enable command.
>> 4. The QC audio offload driver will fetch the required resources, and pass
>> this information as part of the QMI response to the STREAM enable command.
>> 5. Once the QMI response is received the audio DSP will start queuing data
>> on the USB bus.
>>
>> As part of step#2, the audio DSP is aware of the USB SND card and pcm
>> device index that is being selected, and is communicated as part of the QMI
>> request received by QC audio offload.  These indices will be used to handle
>> the stream enable QMI request.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/Kconfig                 |   14 +
>>  sound/usb/Makefile                |    2 +-
>>  sound/usb/qcom/Makefile           |    2 +
>>  sound/usb/qcom/qc_audio_offload.c | 1988 +++++++++++++++++++++++++++++
>>  4 files changed, 2005 insertions(+), 1 deletion(-)
>>  create mode 100644 sound/usb/qcom/Makefile
>>  create mode 100644 sound/usb/qcom/qc_audio_offload.c
>>
>> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
>> index 4a9569a3a39a..6daa551738da 100644
>> --- a/sound/usb/Kconfig
>> +++ b/sound/usb/Kconfig
>> @@ -176,6 +176,20 @@ config SND_BCD2000
>>  	  To compile this driver as a module, choose M here: the module
>>  	  will be called snd-bcd2000.
>>  
>> +config SND_USB_AUDIO_QMI
>> +	tristate "Qualcomm Audio Offload driver"
>> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND && SND_SOC_USB
>> +	help
>> +	  Say Y here to enable the Qualcomm USB audio offloading feature.
>> +
>> +	  This module sets up the required QMI stream enable/disable
>> +	  responses to requests generated by the audio DSP.  It passes the
>> +	  USB transfer resource references, so that the audio DSP can issue
>> +	  USB transfers to the host controller.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called snd-usb-audio-qmi.
>> [...]
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> new file mode 100644
>> index 000000000000..3319363a0fd0
>> --- /dev/null
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -0,0 +1,1988 @@
>> [...]
>> +static int __init qc_usb_audio_offload_init(void)
>> +{
>> +	struct uaudio_qmi_svc *svc;
>> +	int ret;
>> +
>> +	svc = kzalloc(sizeof(*svc), GFP_KERNEL);
>> +	if (!svc)
>> +		return -ENOMEM;
>> +
>> +	svc->uaudio_svc_hdl = kzalloc(sizeof(*svc->uaudio_svc_hdl), GFP_KERNEL);
>> +	if (!svc->uaudio_svc_hdl) {
>> +		ret = -ENOMEM;
>> +		goto free_svc;
>> +	}
>> +
>> +	ret = qmi_handle_init(svc->uaudio_svc_hdl,
>> +			      QMI_UAUDIO_STREAM_REQ_MSG_V01_MAX_MSG_LEN,
>> +			      &uaudio_svc_ops_options,
>> +			      &uaudio_stream_req_handlers);
>> +	ret = qmi_add_server(svc->uaudio_svc_hdl, UAUDIO_STREAM_SERVICE_ID_V01,
>> +			     UAUDIO_STREAM_SERVICE_VERS_V01, 0);
>> +
>> +	uaudio_svc = svc;
>> +
>> +	ret = snd_usb_register_platform_ops(&offload_ops);
>> +	if (ret < 0)
>> +		goto release_qmi;
>> +
>> +	return 0;
>> +
>> +release_qmi:
>> +	qmi_handle_release(svc->uaudio_svc_hdl);
>> +free_svc:
>> +	kfree(svc);
>> +
>> +	return ret;
>> +}
>> +
>> +static void __exit qc_usb_audio_offload_exit(void)
>> +{
>> +	struct uaudio_qmi_svc *svc = uaudio_svc;
>> +	int idx;
>> +
>> +	/*
>> +	 * Remove all connected devices after unregistering ops, to ensure
>> +	 * that no further connect events will occur.  The disconnect routine
>> +	 * will issue the QMI disconnect indication, which results in the
>> +	 * external DSP to stop issuing transfers.
>> +	 */
>> +	snd_usb_unregister_platform_ops();
>> +	for (idx = 0; idx < SNDRV_CARDS; idx++)
>> +		qc_usb_audio_offload_disconnect(uadev[idx].chip);
>> +
>> +	qmi_handle_release(svc->uaudio_svc_hdl);
>> +	kfree(svc);
>> +	uaudio_svc = NULL;
>> +}
>> +
>> +module_init(qc_usb_audio_offload_init);
>> +module_exit(qc_usb_audio_offload_exit);
>> +
>> +MODULE_DESCRIPTION("QC USB Audio Offloading");
>> +MODULE_LICENSE("GPL");
> 
> What will trigger loading this if this code is built as module?
> 
> Testing suggests nothing does at the moment: If this is built as module,
> playback via USB_RX will fail until you manually modprobe
> snd-usb-audio-qmi.
> 

Yes, it would only get triggered on a modprobe.  I think the more important
part is when snd_usb_register_platform_ops() is called.  This is what would
register the vendor USB offload driver callbacks for USB connect/disconnect
events.

> I think the easiest way to solve this would be to drop the
> module_init()/module_exit() and instead call into these init/exit
> functions from one of the other audio modules. This would also ensure
> that the QMI server is only registered if we actually need it (if the
> board sound card actually has a USB DAI link).
> 

It would be difficult from the perspective of USB SND, because if we got
rid of the vendor ops, it would be messy, since the USB offload vendor
driver will be specific for every SoC.

Thanks
Wesley Cheng

