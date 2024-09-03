Return-Path: <linux-input+bounces-6116-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A934F96ACBC
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 01:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDE431C22FA8
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DC71D5CD1;
	Tue,  3 Sep 2024 23:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="caxzjObD"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15818126C07;
	Tue,  3 Sep 2024 23:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725405713; cv=none; b=e4PSanS37u0PMcp5VoGVr6RShHC74OOLAM1pt25nLozvzF2YI/SEpJNRzHWn3875TYcUBkJpavPY4MxhYUeT1zOejj1SSjO5xIiPqu3FvS/0ZfU6s1ES3d2BJjaSEBmhWXQfKGDEvVEDZ05JvBrr/RTNXtee5rIh5Z82Tn8eGbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725405713; c=relaxed/simple;
	bh=VVjKMPQCQbAndyPg1su7hyXIjAssdsdVvez66hoaFss=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fAywtv0ohLf24iOu112nWB7B0D2D//9zDW4wJpfNiqOyCKnfcwPF28KOr6hs4KldanoSlcoLcz+vQ8CsXXVBumLQxqqOLmJAuPp98gdNheuDLp1cClPnnILWXj0zXP0uB1o4aUNH4cpFY4i9in2H+hbG5yr3gAhlB6SqLgVbc7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=caxzjObD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483HCHxK019944;
	Tue, 3 Sep 2024 23:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BhOo48oBZBd7tWt8QQ1bwGJh3mum88phCnQzDd2g6jM=; b=caxzjObDCr6OhPXC
	3L/G+1oPGeHQ+M0yjNFBcqFKnIBhSR+kHFUO4HR+0pzzBg0ozhMi3GldoBRRjIPX
	BDBfBq4wp+oCqJXaJx9JCO+C2yEr/TZFfYJf9gKWOPB04b+6b4mil/vpr9SbjV5R
	amGesc1PROOy+ftHPujmEG4W8h4woYlskL7a1BLpHAGUBGpRCC0lDdmphAZn2r7/
	gtxLcnLNxsHkbIUfZb1cwZ1XauGyNXktaiIKd+VSm8m1sFoXUoAtjQ72i3Jvuze0
	kJENzyEulyrE+uFBqrsCkb6l5ToI8Hkx4RdVnlk31jIYBUkvSipC5677GIe6wJzR
	EN19kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy22ckk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 23:21:18 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483NLHCs015712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 23:21:17 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 16:21:16 -0700
Message-ID: <f71a248b-6ff7-472d-9d29-d5a0a9dd5b8e@quicinc.com>
Date: Tue, 3 Sep 2024 16:21:16 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 26/33] ALSA: usb-audio: Prevent starting of audio
 stream if in use
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
 <20240829194105.1504814-27-quic_wcheng@quicinc.com>
 <e8b11cb4-cda1-4904-b83f-e124066758e3@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <e8b11cb4-cda1-4904-b83f-e124066758e3@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: de8g6g3vHYmGmewsWFdt1FpLPyQCTuJ6
X-Proofpoint-ORIG-GUID: de8g6g3vHYmGmewsWFdt1FpLPyQCTuJ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030186

Hi Pierre,

On 8/30/2024 2:45 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
>> With USB audio offloading, an audio session is started from the ASoC
>> platform sound card and PCM devices.  Likewise, the USB SND path is still
>> readily available for use, in case the non-offload path is desired.  In
>> order to prevent the two entities from attempting to use the USB bus,
>> introduce a flag that determines when either paths are in use.
>>
>> If a PCM device is already in use, the check will return an error to
>> userspace notifying that the stream is currently busy.  This ensures that
>> only one path is using the USB substream.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>
> I would also move this patch earlier in the series since it has no
> dependency on USB offload really, and if somehow it breaks USB audio
> regular paths we'd want to know early for bisection.

Sure I'll re-order this earlier since I'm going to send out another rev.

Thanks

Wesley Cheng

>
>> ---
>>  sound/usb/card.h |  1 +
>>  sound/usb/pcm.c  | 29 ++++++++++++++++++++++++++---
>>  2 files changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/usb/card.h b/sound/usb/card.h
>> index 15cda1730076..d8b8522e1613 100644
>> --- a/sound/usb/card.h
>> +++ b/sound/usb/card.h
>> @@ -165,6 +165,7 @@ struct snd_usb_substream {
>>  	unsigned int pkt_offset_adj;	/* Bytes to drop from beginning of packets (for non-compliant devices) */
>>  	unsigned int stream_offset_adj;	/* Bytes to drop from beginning of stream (for non-compliant devices) */
>>  
>> +	unsigned int opened:1;		/* pcm device opened */
>>  	unsigned int running: 1;	/* running status */
>>  	unsigned int period_elapsed_pending;	/* delay period handling */
>>  
>> diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
>> index 18467da6fd9e..b24ee38fad72 100644
>> --- a/sound/usb/pcm.c
>> +++ b/sound/usb/pcm.c
>> @@ -1241,8 +1241,17 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>>  	struct snd_pcm_runtime *runtime = substream->runtime;
>>  	struct snd_usb_substream *subs = &as->substream[direction];
>> +	struct snd_usb_audio *chip = subs->stream->chip;
>>  	int ret;
>>  
>> +	mutex_lock(&chip->mutex);
>> +	if (subs->opened) {
>> +		mutex_unlock(&chip->mutex);
>> +		return -EBUSY;
>> +	}
>> +	subs->opened = 1;
>> +	mutex_unlock(&chip->mutex);
>> +
>>  	runtime->hw = snd_usb_hardware;
>>  	/* need an explicit sync to catch applptr update in low-latency mode */
>>  	if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
>> @@ -1259,13 +1268,23 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
>>  
>>  	ret = setup_hw_info(runtime, subs);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto err_open;
>>  	ret = snd_usb_autoresume(subs->stream->chip);
>>  	if (ret < 0)
>> -		return ret;
>> +		goto err_open;
>>  	ret = snd_media_stream_init(subs, as->pcm, direction);
>>  	if (ret < 0)
>> -		snd_usb_autosuspend(subs->stream->chip);
>> +		goto err_resume;
>> +
>> +	return 0;
>> +
>> +err_resume:
>> +	snd_usb_autosuspend(subs->stream->chip);
>> +err_open:
>> +	mutex_lock(&chip->mutex);
>> +	subs->opened = 0;
>> +	mutex_unlock(&chip->mutex);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -1274,6 +1293,7 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>>  	int direction = substream->stream;
>>  	struct snd_usb_stream *as = snd_pcm_substream_chip(substream);
>>  	struct snd_usb_substream *subs = &as->substream[direction];
>> +	struct snd_usb_audio *chip = subs->stream->chip;
>>  	int ret;
>>  
>>  	snd_media_stop_pipeline(subs);
>> @@ -1287,6 +1307,9 @@ static int snd_usb_pcm_close(struct snd_pcm_substream *substream)
>>  
>>  	subs->pcm_substream = NULL;
>>  	snd_usb_autosuspend(subs->stream->chip);
>> +	mutex_lock(&chip->mutex);
>> +	subs->opened = 0;
>> +	mutex_unlock(&chip->mutex);
>>  
>>  	return 0;
>>  }

