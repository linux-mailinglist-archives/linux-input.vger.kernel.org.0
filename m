Return-Path: <linux-input+bounces-11569-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A47EA7F09F
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 01:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CCFC1695F4
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 23:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF88225A47;
	Mon,  7 Apr 2025 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bIFe+H9G"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B08D2153C9;
	Mon,  7 Apr 2025 23:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066917; cv=none; b=OK/vSOBqJwQFdoXGaKXqcJhmf9g/IeSB759/wnszp9oRC/u8+PihVoja6aI66CUOiJVPNTUit8uoA70eHbjjb4wZ8NQ7l4Vx0mkvulaQbdubbsGIIFcrBTSEwMtDerzB6iZAyBE8YJh5HS2UrMP37S5qz7d8oDGmwagBaBDZxRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066917; c=relaxed/simple;
	bh=7lZYwGAehZVXfOidjwb4UM/OhpkMpE2OfCWepjtE9iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L8jnMZdxJYgv1pX5AKMJCUqoGcW3GUbIB1fmk6iGHX6DJ0S+3Pz8d7SP8xaWa/Oqt3ChvmYXqSk2ZhU8wQpYb5SHrQFwk+6QuqNvSQ2CvBOktIjEwUZTX6DWRmQplk5iRGYLzCoiR/ZqMTWYNtugdoZRoDwneE9ueffkXq7g3jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bIFe+H9G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537MVWJH003009;
	Mon, 7 Apr 2025 23:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZcQfj4YVabsD87r7ZEMKU3vHMuaaGc3Pb/eaSqXyrs8=; b=bIFe+H9GbfLxTea1
	qsa6vZOOEcXpabG6iU0zgNXImsH+BSIjBUQkcwBpcrkYN617pdHrVJdUww6CAJcN
	JKgI8RBD6wYaro5QMu2rnFihq8NaqyqaDQYKLCgaOVyRCoTHdVUbF+NLgIbBjVtS
	aG3qHEcbSPwDdrnbVguA3ixoawQS7M0zbhkEvebnX+1VoNcDXnhrwRCqUAnWd2yE
	dw+HxyxwPTmWQHVc2ZJ2P0Uau7Vd0Jq5bMpZ6gd+3HDbMffR4UygSfIJhXRrNxSQ
	T0EyDi1bqZEN9CTGGHFWTqHb0DZcvD2w8DqpkWpq97qt24+fSQ3oHO4IFU8nr/WL
	2cKQ9Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftdrh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 23:01:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 537N1XPo009160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 23:01:33 GMT
Received: from [10.110.75.38] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Apr 2025
 16:01:32 -0700
Message-ID: <170a622b-33f5-bd8f-b473-815390fa67ef@quicinc.com>
Date: Mon, 7 Apr 2025 16:01:32 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v37 22/31] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Content-Language: en-US
To: Stephan Gerhold <stephan.gerhold@linaro.org>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20250404002728.3590501-1-quic_wcheng@quicinc.com>
 <20250404002728.3590501-23-quic_wcheng@quicinc.com>
 <Z--lRII_5_rp9tDf@linaro.org>
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z--lRII_5_rp9tDf@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f4594e cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=lmUSSy02aaOEq0b6HYAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nFKDLDwVLpf58kNVIoNjRdmt1gKk9FNR
X-Proofpoint-ORIG-GUID: nFKDLDwVLpf58kNVIoNjRdmt1gKk9FNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=766
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070162

Hi Stephan,

On 4/4/2025 2:24 AM, Stephan Gerhold wrote:
> On Thu, Apr 03, 2025 at 05:27:19PM -0700, Wesley Cheng wrote:
>> The QC ADSP is able to support USB playback endpoints, so that the main
>> application processor can be placed into lower CPU power modes.  This adds
>> the required AFE port configurations and port start command to start an
>> audio session.
>>
>> Specifically, the QC ADSP can support all potential endpoints that are
>> exposed by the audio data interface.  This includes isochronous data
>> endpoints, in either synchronous mode or asynchronous mode. In the latter
>> case both implicit or explicit feedback endpoints are supported.  The size
>> of audio samples sent per USB frame (microframe) will be adjusted based on
>> information received on the feedback endpoint.
>>
>> Some pre-requisites are needed before issuing the AFE port start command,
>> such as setting the USB AFE dev_token.  This carries information about the
>> available USB SND cards and PCM devices that have been discovered on the
>> USB bus.  The dev_token field is used by the audio DSP to notify the USB
>> offload driver of which card and PCM index to enable playback on.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
>>   sound/soc/qcom/qdsp6/q6afe.c             | 192 ++++++++++++++++++++++-
>>   sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
>>   sound/soc/qcom/qdsp6/q6routing.c         |  10 +-
>>   6 files changed, 319 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
>> index 7d9628cda875..0f47aadaabe1 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
>> [...]
>> +static int afe_port_send_usb_params(struct q6afe_port *port, struct q6afe_usb_cfg *cfg)
>> +{
>> +	union afe_port_config *pcfg = &port->port_cfg;
>> +	struct afe_param_id_usb_audio_dev_lpcm_fmt lpcm_fmt;
>> +	struct afe_param_id_usb_audio_svc_interval svc_int;
>> +	int ret;
>> +
>> +	if (!pcfg) {
>> +		dev_err(port->afe->dev, "%s: Error, no configuration data\n", __func__);
>> +		ret = -EINVAL;
>> +		goto exit;
> 
> Nitpick: drop the goto here, just do "return -EINVAL;"
> 
>> +	}
>> +
>> +	memset(&lpcm_fmt, 0, sizeof(lpcm_fmt));
>> +	memset(&svc_int, 0, sizeof(svc_int));
>> +
>> +	lpcm_fmt.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
>> +	lpcm_fmt.endian = pcfg->usb_cfg.endian;
>> +	ret = q6afe_port_set_param_v2(port, &lpcm_fmt,
>> +				      AFE_PARAM_ID_USB_AUDIO_DEV_LPCM_FMT,
>> +				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(lpcm_fmt));
>> +	if (ret) {
>> +		dev_err(port->afe->dev, "%s: AFE device param cmd LPCM_FMT failed %d\n",
>> +			__func__, ret);
>> +		goto exit;
> 
> return ret;
> 
>> +	}
>> +
>> +	svc_int.cfg_minor_version = AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG;
>> +	svc_int.svc_interval = pcfg->usb_cfg.service_interval;
>> +	ret = q6afe_port_set_param_v2(port, &svc_int,
>> +				      AFE_PARAM_ID_USB_AUDIO_SVC_INTERVAL,
>> +				      AFE_MODULE_AUDIO_DEV_INTERFACE, sizeof(svc_int));
>> +	if (ret)
>> +		dev_err(port->afe->dev, "%s: AFE device param cmd svc_interval failed %d\n",
>> +			__func__, ret);
>> +
>> +exit:
> 
> drop
> 

Done

>> +	return ret;
>> +}
>> +
>> [...]
>> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
>> index 90228699ba7d..0def036ed3c9 100644
>> --- a/sound/soc/qcom/qdsp6/q6routing.c
>> +++ b/sound/soc/qcom/qdsp6/q6routing.c
>> @@ -435,6 +435,7 @@ static struct session_data *get_session_from_id(struct msm_routing_data *data,
>>   
>>   	return NULL;
>>   }
>> +
>>   /**
>>    * q6routing_stream_close() - Deregister a stream
>>    *
>> @@ -515,6 +516,9 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
>>   	return 1;
>>   }
>>   
>> +static const struct snd_kcontrol_new usb_rx_mixer_controls[] = {
>> +	Q6ROUTING_RX_MIXERS(USB_RX) };
>> +
>>   static const struct snd_kcontrol_new hdmi_mixer_controls[] = {
>>   	Q6ROUTING_RX_MIXERS(HDMI_RX) };
>>   
>> @@ -933,6 +937,9 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>>   	SND_SOC_DAPM_MIXER("RX_CODEC_DMA_RX_7 Audio Mixer", SND_SOC_NOPM, 0, 0,
>>   		rx_codec_dma_rx_7_mixer_controls,
>>   		ARRAY_SIZE(rx_codec_dma_rx_7_mixer_controls)),
>> +	SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
> 
> As I wrote on v36:
> 
> I think it would be more clear if you call this "USB_RX Audio Mixer"
> instead for consistency with the other playback mixers. This would also
> avoid confusion later when USB_TX is added in addition to USB_RX.
> 
> The "Audio" part in the name is redundant, but looks like all the other
> playback mixers have it as well ...
> 
> 
>> +			   usb_rx_mixer_controls,
>> +			   ARRAY_SIZE(usb_rx_mixer_controls)),
>>   	SND_SOC_DAPM_MIXER("MultiMedia1 Mixer", SND_SOC_NOPM, 0, 0,
>>   		mmul1_mixer_controls, ARRAY_SIZE(mmul1_mixer_controls)),
>>   	SND_SOC_DAPM_MIXER("MultiMedia2 Mixer", SND_SOC_NOPM, 0, 0,
>> @@ -949,7 +956,6 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>>   		mmul7_mixer_controls, ARRAY_SIZE(mmul7_mixer_controls)),
>>   	SND_SOC_DAPM_MIXER("MultiMedia8 Mixer", SND_SOC_NOPM, 0, 0,
>>   		mmul8_mixer_controls, ARRAY_SIZE(mmul8_mixer_controls)),
>> -
>>   };
>>   
>>   static const struct snd_soc_dapm_route intercon[] = {
>> @@ -1043,6 +1049,8 @@ static const struct snd_soc_dapm_route intercon[] = {
>>   	{"MM_UL6", NULL, "MultiMedia6 Mixer"},
>>   	{"MM_UL7", NULL, "MultiMedia7 Mixer"},
>>   	{"MM_UL8", NULL, "MultiMedia8 Mixer"},
>> +
>> +	Q6ROUTING_RX_DAPM_ROUTE("USB Mixer", "USB_RX"),
> 
> Put this below "Q6ROUTING_RX_DAPM_ROUTE("RX_CODEC_DMA_RX_7 Audio Mixer".
> 

Sorry, missed that part.  Fixed the naming and position of this.

Thanks
Wesley Cheng

