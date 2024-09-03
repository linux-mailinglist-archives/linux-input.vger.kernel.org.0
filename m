Return-Path: <linux-input+bounces-6113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D748896AA91
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073121C21417
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 21:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92A019ABDD;
	Tue,  3 Sep 2024 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NxDg7u+T"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2E0B647;
	Tue,  3 Sep 2024 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725400172; cv=none; b=foG2Aiz/+QTTytaCGbWPMT+HmLPEV6JdaWgFqA+871NgO3jg0qYlaLADMX0FvB9GBIy+WXepjNFoF1Hdm+p3iYKgIBQwvrXsM3icyMbHiw5YMe60nwX1kzj6sx49+NpwPRB7iElabd2SWVCxxb3qs3a0r9ppdgtnr3RIwPQtFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725400172; c=relaxed/simple;
	bh=VMG3qT0Yzmc4lt1WjY38IVxUgVpcn4n4TgfIjXzMm+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JmvpiXTA7mFc5SuxYaqL90ilGw5T117k35M3c75MWoYiZF0sh/rdaRhQSpLvFl1S1QXSsULKBsadZ12dnrdIIVxa8wvAzmOdioeJptF1Tnecdv2GYK2dX/CecyOcAsv1hCG2/meDuSAuKvbb9qbv5X2zHn5UJp1MGmxrZORNBPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NxDg7u+T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483BG7ZT032362;
	Tue, 3 Sep 2024 21:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Juw95hWlQh+vulyTYbRH3E+f2hj1jPIPe4v2666ocbk=; b=NxDg7u+TIkYWhNAP
	LPdqsA1+kyLVLja50JCyFxmcB+w1+3vJgxUOpHfbMLRHLLClASULqTvmTtRrVudu
	FXxBKLyoE7OgEektgp0DMyKy/8zU7U9Tsa/XZJeIzfESbLWAonKtwDW2DxUNhtG4
	NrZEfJaHjQK9KoccdU3LAf5C9IoHJ/9OwWC5DT3Ye7N7Kl5WWSs4SF4ppCuhUV0K
	brSoEdXqYl8grLhTnQHKeiFpAfGD0krfoMCJa66iNWA2tx8sVHWxVrwNwKzcEcnf
	UzItbu+pWWOvdEZnWap++PfuqDJ+NJpxs1i/viyP+bS8MNHyu4nOXOjcK0SlJy1I
	zNIJUA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe332k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 21:49:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483LnARn020162
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 21:49:10 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 14:49:09 -0700
Message-ID: <7d83df41-86f0-403a-b298-b8db9086fe9b@quicinc.com>
Date: Tue, 3 Sep 2024 14:49:09 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 23/33] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-24-quic_wcheng@quicinc.com>
 <87b06b92-8e58-414d-ba53-db7c88ac525a@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87b06b92-8e58-414d-ba53-db7c88ac525a@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: TJ4YgTd8SkdJ6d6th9aP9xfOcURTE2a_
X-Proofpoint-ORIG-GUID: TJ4YgTd8SkdJ6d6th9aP9xfOcURTE2a_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_09,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030175

Hi Pierre,

On 8/30/2024 2:34 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
>> The USB SND path may need to know how the USB offload path is routed, so
>> that applications can open the proper sound card and PCM device.  The
>> implementation for the QC ASoC design has a "USB Mixer" kcontrol for each
>> possible FE (Q6ASM) DAI, which can be utilized to know which front end link
>> is enabled.
>>
>> When an application/userspace queries for the mapped offload devices, the
>> logic will lookup the USB mixer status though the following path:
>>
>> MultiMedia* <-> MM_DL* <-> USB Mixer*
>>
>> The "USB Mixer" is a DAPM widget, and the q6routing entity will set the
>> DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
>> the Q6USB backend link can fetch the PCM device number from the FE DAI
>> link (Multimedia*).  With respects to the card number, that is
>> straightforward, as the ASoC components have direct references to the ASoC
>> platform sound card.
>>
>> An example output can be shown below:
>>
>> Number of controls: 9
>> name                                    value
>> Capture Channel Map                     0, 0 (range 0->36)
>> Playback Channel Map                    0, 0 (range 0->36)
>> Headset Capture Switch                  On
>> Headset Capture Volume                  1 (range 0->4)
>> Sidetone Playback Switch                On
>> Sidetone Playback Volume                4096 (range 0->8192)
>> Headset Playback Switch                 On
>> Headset Playback Volume                 20, 20 (range 0->24)
>> USB Offload Playback Route PCM#0        0, 1 (range -1->255)
>>
>> The "USB Offload Playback Route PCM#*" kcontrol will signify the
>> corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
>> If the USB SND device supports multiple audio interfaces, then it will
>> contain several PCM streams, hence in those situations, it is expected
>> that there will be multiple playback route kcontrols created.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6usb.c | 104 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 104 insertions(+)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
>> index 10337d70eb27..c2fc0dedf430 100644
>> --- a/sound/soc/qcom/qdsp6/q6usb.c
>> +++ b/sound/soc/qcom/qdsp6/q6usb.c
>> @@ -132,6 +132,109 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
>>  	return ret;
>>  }
>>  
>> +static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd;
>> +	struct snd_soc_dai *dai;
>> +
>> +	for_each_card_rtds(w->dapm->card, rtd) {
>> +		dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +		/*
>> +		 * Only look for playback widget. RTD number carries the assigned
>> +		 * PCM index.
>> +		 */
>> +		if (dai->stream[0].widget == w)
>> +			return rtd->num;
>> +	}
>> +
>> +	return -1;
>> +}
>> +
>> +static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
>> +{
>> +	struct snd_soc_dapm_path *p;
>> +
>> +	/* Checks to ensure USB path is enabled/connected */
>> +	snd_soc_dapm_widget_for_each_sink_path(w, p)
>> +		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
>> +			return 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int q6usb_get_pcm_id(struct snd_soc_component *component)
>> +{
>> +	struct snd_soc_dapm_widget *w;
>> +	struct snd_soc_dapm_path *p;
>> +	int pidx;
>> +
>> +	/*
>> +	 * Traverse widgets to find corresponding FE widget.  The DAI links are
>> +	 * built like the following:
>> +	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*
>> +	 */
>> +	for_each_card_widgets(component->card, w) {
>> +		if (!strncmp(w->name, "MultiMedia", 10)) {
>> +			/*
>> +			 * Look up all paths associated with the FE widget to see if
>> +			 * the USB BE is enabled.  The sink widget is responsible to
>> +			 * link with the USB mixers.
>> +			 */
>> +			snd_soc_dapm_widget_for_each_sink_path(w, p) {
>> +				if (q6usb_usb_mixer_enabled(p->sink)) {
>> +					pidx = q6usb_get_pcm_id_from_widget(w);
>> +					return pidx;
>> +				}
>> +			}
> Humm, there should be a note that the design assumes that the USB
> offload path exposes a single PCM per endpoints - same as the
> non-offloaded path. If the ASoC card has multiple PCMs for each
> endpoint, possibly with different processing on each PCM, then the
> mapping would fail.
Sure I'll add a note within the comments on the above.
> The other question is whether you need to walk in the DAPM graph, in
> theory DPCM has helpers to find which FEs are connected to which BE.

Hmm...Yes, I've tried to see if I could utilize some of the helpers that were present, but none of them was able to fetch the DAPM widget that was associated with the FE, hence why I had to implement the lookup that would work for our current design.

Thanks

Wesley Cheng


