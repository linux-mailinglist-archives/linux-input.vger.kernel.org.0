Return-Path: <linux-input+bounces-11279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97362A70D91
	for <lists+linux-input@lfdr.de>; Wed, 26 Mar 2025 00:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77E5F17388C
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 23:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4CA269B0E;
	Tue, 25 Mar 2025 23:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LhifCDcC"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648CC1993B9;
	Tue, 25 Mar 2025 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742944707; cv=none; b=eURHDKDVImJMGS4WXU3PiJAyVpTfY0I6oG9RmkIuv8BXIIGUqEOTcD0ulEOkB51+DdGcA4sDSdyhfzVl6WdMzYJo4VNjvCgzcdNHIfBreBNaoxMjWvtO8HxdMXjl94uA9LyVBbTHoUVA/hJfHxp+cbnhRNvArcQE63ZA1vLZyLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742944707; c=relaxed/simple;
	bh=AA7PwITKF5J3TEDy7nn32B1pSSpAw2zgf84VtrpwgJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WaB5HcRLYhKzFSZj4MJEztCmP2xuUl3h6EpLCP5Qu1ejluZbR2itwGggpe2X+tAaf5sfUfr+U2qMkFYK7hjUz7KJilqt7sGYID4LBj883xQfdLU1d6NZUCFs41eEjtbfDxC0IRD5yxx9QZFjRvlzucDHtKuFbSMwyYR/misWl3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LhifCDcC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PGasZD008357;
	Tue, 25 Mar 2025 23:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XK13zwQWJ2coxBzt8SY6riXFsi3NmtdQnEKfhNLzeM=; b=LhifCDcC/FnQV8YR
	RaQSCkG5l3fZlfw8hkVK8OGJjJjznipi6Tjhu5a4jXZbFJCG1MINPUIixzTeesu7
	q6wM1Odzc29I+z8DgIHkImuHSRyzmhQc5EOd8LhHYCl66QT/8QnGxQsxy4EVRVEp
	MEdVxupUr7K4roIKVdMvTQUZhHrHLIOX1pK1kWOFdQOOHUHyl2l9L7Tw4SdhT2uc
	Kyr4dtQg0K2WU9wCClotbVHJJuE0RcKJwDZQHbKKwv4F+JqDtNJ8+adqoesnU6jr
	ZXaDn8UULLsdPL2klBk2uG3+OZSVzUqbUTen0fqB75N3Hv2PAtE2G/v0Wl21vhck
	GG/BFQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd332se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 23:18:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52PNI5WW018006
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 23:18:05 GMT
Received: from [10.71.112.253] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Mar
 2025 16:18:04 -0700
Message-ID: <871827f0-94ba-4565-865f-775cab9501eb@quicinc.com>
Date: Tue, 25 Mar 2025 16:18:03 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v36 22/31] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
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
 <20250319005141.312805-23-quic_wcheng@quicinc.com>
 <Z-J2WnrZHP6iMIhT@linaro.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z-J2WnrZHP6iMIhT@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jcBzSMG_Twd1ynIpoaY2_eOk2VnTd7Le
X-Proofpoint-ORIG-GUID: jcBzSMG_Twd1ynIpoaY2_eOk2VnTd7Le
X-Authority-Analysis: v=2.4 cv=P646hjAu c=1 sm=1 tr=0 ts=67e339ae cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=C-Td_spOXU67h79XLzoA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250152

Hi Stephan,

On 3/25/2025 2:24 AM, Stephan Gerhold wrote:
> On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
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
>>  sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
>>  sound/soc/qcom/qdsp6/q6afe.c             | 192 ++++++++++++++++++++++-
>>  sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
>>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
>>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
>>  sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
>>  6 files changed, 341 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
>> index 7d9628cda875..0f47aadaabe1 100644
>> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
>> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
>> [...]
>> @@ -513,12 +520,96 @@ struct afe_param_id_cdc_dma_cfg {
>>  	u16	active_channels_mask;
>>  } __packed;
>>  
>> +struct afe_param_id_usb_cfg {
>> +/* Minor version used for tracking USB audio device configuration.
>> + * Supported values: AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
>> + */
>> +	u32                  cfg_minor_version;
>> +/* Sampling rate of the port.
>> + * Supported values:
>> + * - AFE_PORT_SAMPLE_RATE_8K
>> + * - AFE_PORT_SAMPLE_RATE_11025
>> + * - AFE_PORT_SAMPLE_RATE_12K
>> + * - AFE_PORT_SAMPLE_RATE_16K
>> + * - AFE_PORT_SAMPLE_RATE_22050
>> + * - AFE_PORT_SAMPLE_RATE_24K
>> + * - AFE_PORT_SAMPLE_RATE_32K
>> + * - AFE_PORT_SAMPLE_RATE_44P1K
>> + * - AFE_PORT_SAMPLE_RATE_48K
>> + * - AFE_PORT_SAMPLE_RATE_96K
>> + * - AFE_PORT_SAMPLE_RATE_192K
>> + */
>> +	u32                  sample_rate;
>> +/* Bit width of the sample.
>> + * Supported values: 16, 24
>> + */
>> +	u16                  bit_width;
>> +/* Number of channels.
>> + * Supported values: 1 and 2
>> + */
>> +	u16                  num_channels;
>> +/* Data format supported by the USB. The supported value is
>> + * 0 (#AFE_USB_AUDIO_DATA_FORMAT_LINEAR_PCM).
>> + */
>> +	u16                  data_format;
>> +/* this field must be 0 */
>> +	u16                  reserved;
>> +/* device token of actual end USB audio device */
>> +	u32                  dev_token;
>> +/* endianness of this interface */
>> +	u32                   endian;
> 
> Nitpick: The indentation between u32 and the struct field names is odd,
> can you use a single tab character like in the afe_param_id_cdc_dma_cfg
> instead?
> 

Ack.

>> +/* service interval */
>> +	u32                  service_interval;
>> +} __packed;
>> +
>> + [...]
>> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
>> index 4919001de08b..4a96b11f7fd1 100644
>> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
>> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
>> @@ -97,6 +97,26 @@
>>  	}
>>  
>>  static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
>> +	{
>> +		.playback = {
>> +			.stream_name = "USB Playback",
>> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
>> +					SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
>> +					SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
>> +					SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
>> +					SNDRV_PCM_RATE_192000,
>> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
>> +					SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
>> +					SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
>> +					SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
>> +			.channels_min = 1,
>> +			.channels_max = 2,
>> +			.rate_min =	8000,
>> +			.rate_max = 192000,
> 
> Nitpick: Indentation after rate_max is also odd here, please choose one
> of the styles, either
> 
> 			.rate_min = 8000,
> 
> or
> 
> 			.rate_max =     192000,
> 

Ack.

>> +		},
>> +		.id = USB_RX,
>> +		.name = "USB_RX",
>> +	},
>>  	{
>>  		.playback = {
>>  			.stream_name = "HDMI Playback",
>> [...]
>> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
>> index 90228699ba7d..b7439420b425 100644
>> --- a/sound/soc/qcom/qdsp6/q6routing.c
>> +++ b/sound/soc/qcom/qdsp6/q6routing.c
>> @@ -435,6 +435,26 @@ static struct session_data *get_session_from_id(struct msm_routing_data *data,
>>  
>>  	return NULL;
>>  }
>> +
>> +static bool is_usb_routing_enabled(struct msm_routing_data *data)
>> +{
>> +	int i;
>> +
>> +	/*
>> +	 * Loop through current sessions to see if there are active routes
>> +	 * to the USB_RX backend DAI.  The USB offload routing is designed
>> +	 * similarly to the non offload path.  If there are multiple PCM
>> +	 * devices associated with the ASoC platform card, only one active
>> +	 * path can be routed to the USB offloaded endpoint.
>> +	 */
>> +	for (i = 0; i < MAX_SESSIONS; i++) {
>> +		if (data->sessions[i].port_id == USB_RX)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
> 
> What is different about USB_RX compared to other output ports we have in
> Q6AFE? Obviously, we can only play one stream on an output port. But
> doesn't the ADSP mix streams together when you have multiple routes?
> 

This patch will limit the USB_RX from being able to be mixed to multiple
q6adm paths.

> Also, this doesn't actually check for *active* routes only. It just
> looks if any other MultiMedia DAI is configured to output to USB_RX.
> That doesn't mean they will ever be active at the same time.
> 

Yes, the main reason being that that is the mechanism we use to populate
the active offload path within the USB SND card mixer.

> I might for example want to have MultiMedia1 and MultiMedia2 both
> configured to output to USB_RX. Let's assume MultiMedia1 is a normal PCM
> DAI, MultiMedia2 is a compress offload DAI. When I want to playback
> normal audio, I go through MultiMedia1, when I want to play compressed
> audio, I go through MultiMedia2. Only one of them active at a time.
> Why can't I set this up statically in the mixers?
> 
> If you confirm that it is really impossible to have multiple streams
> mixed together to the USB_RX output in the ADSP, then this should be a
> runtime check instead when starting the stream IMO.
> 

We can have multiple streams being mixed together, but it will get
confusing because it changes the definition that we had discussed about in
the past about the overall design for the interaction w/ userspace.
Although we (QC) only support a single USB audio device for offloading,
there could be other situations where the audio DSP can support multiple
devices.  The assumption is that each MM path is assigned to a USB device.

>> +
>>  /**
>>   * q6routing_stream_close() - Deregister a stream
>>   *
>> @@ -499,7 +519,8 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
>>  	struct session_data *session = &data->sessions[session_id];
>>  
>>  	if (ucontrol->value.integer.value[0]) {
>> -		if (session->port_id == be_id)
>> +		if (session->port_id == be_id ||
>> +		    (be_id == USB_RX && is_usb_routing_enabled(data)))
>>  			return 0;
>>  
>>  		session->port_id = be_id;
>> @@ -515,6 +536,9 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
>>  	return 1;
>>  }
>>  
>> +static const struct snd_kcontrol_new usb_mixer_controls[] = {
> 
> usb_rx_mixer_controls
> 
>> +	Q6ROUTING_RX_MIXERS(USB_RX) };
>> +
>>  static const struct snd_kcontrol_new hdmi_mixer_controls[] = {
>>  	Q6ROUTING_RX_MIXERS(HDMI_RX) };
>>  
>> @@ -950,6 +974,10 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>>  	SND_SOC_DAPM_MIXER("MultiMedia8 Mixer", SND_SOC_NOPM, 0, 0,
>>  		mmul8_mixer_controls, ARRAY_SIZE(mmul8_mixer_controls)),
>>  
>> +	SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
>> +			   usb_mixer_controls,
>> +			   ARRAY_SIZE(usb_mixer_controls)),
> 
> Please put this next to the other playback mixers above (below
> "RX_CODEC_DMA_RX_7 Audio Mixer").
> 
> I think it would also be more clear if you call this "USB_RX Mixer"
> instead for consistency with the other playback mixers. This would also
> avoid confusion later when USB_TX is added in addition to USB_RX.
> 

Sure, will do.

> 
> Are you planning to send follow-up patches for USB recording offload
> (USB_TX) later? Me and Luca successfully used your series to playback
> voice call audio via the ADSP to an USB headset, recording would be also
> needed to use this fully. :-)
> 

Yes, I will follow up after getting the bulk of the changes for playback
merged first.  The TX side changes should be minimal, and require only
small updates.

Thanks
Wesley Cheng

