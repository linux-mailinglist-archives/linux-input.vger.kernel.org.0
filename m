Return-Path: <linux-input+bounces-6206-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEA596C7DA
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 21:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 301E11C20BE2
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 19:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27649146D53;
	Wed,  4 Sep 2024 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="l4NlHtMR"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC613AA2B;
	Wed,  4 Sep 2024 19:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725479192; cv=none; b=mzDIZF9BFRlEv6ITKhNv7SlpOkQxMLb6medvfZa31ozxWlWc780Q1kwTCHlT3vu0icvghG3LGKJS572Om3Q8BbONkLFgMlpetimmSgtuLv9mluhEohrx52yGyWYQNZtXn65w+BTRNd+DdwcA8Y5MbjfDvCz41mddabR1WolPqE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725479192; c=relaxed/simple;
	bh=e5YRCfHcSxajoDuqX351heIe3Wzdm2U2L0IQCNWWeXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AMpCSQfFOixEFdoOYSCH0ZMu8UCDLW+yBjF7XdBqvMTEl99MEc0GP4iiWzLZnbTe4a5CO9yN2H6F9m5lk91693J+sBXSN/A7UWPlduXzgpF4o5Fl9hBkxahrvO7fFPhKXc1m4U4qK7Y2tIqtCSNEeroXNKPh7egU1lTJ/9TRXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=l4NlHtMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484IoaCp028269;
	Wed, 4 Sep 2024 19:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4L5/ijFquyhl43s4ge7n4rzdYP9Bspig+YmhsVPizDQ=; b=l4NlHtMRF8vNO7MP
	nOQCFcFhJ2p34IS3ayCQypwnosMjNNcY1PKjL2lmN+4U6e52LGqMnttmJHnMZ6Sk
	tprRbJDmIDPf1A7LIrtMXJkT/SLsVAIWKE/3iqWfY/mJK0AHJ7syVBy7HwXAW+3P
	k/YsDqdmGUX0MjtBMA8Okxj9PO5NZu13f0hJ0Ptl2vb7YPPRYGPfIFl2LvbiqU+8
	z/3WnSZ+/k+LeqBkSYJFkT5y2J8LczrwNup0TWjbkAJowbTOnPLVtW3Ul3fmLvG+
	YrieTiYgDm999u0Y9qoZYtf9XqKdE4Z/I+6FLDV6L8kFZEZl7q8YDrmdBHeVLUXx
	lINI9g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41btrxuu79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 19:46:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484Jk4kw023645
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Sep 2024 19:46:04 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 12:46:03 -0700
Message-ID: <93d2eecf-ed79-41cf-b38b-ede432093aec@quicinc.com>
Date: Wed, 4 Sep 2024 12:46:03 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 30/33] ALSA: usb-audio: qcom: Use card and PCM index
 from QMI request
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
 <20240829194105.1504814-31-quic_wcheng@quicinc.com>
 <f8090415-e0ae-4923-bdc8-58622623fc9d@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <f8090415-e0ae-4923-bdc8-58622623fc9d@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: r8piAAQeh2qxXzfDR-ckpRBOOeNMPYga
X-Proofpoint-ORIG-GUID: r8piAAQeh2qxXzfDR-ckpRBOOeNMPYga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_17,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2409040149

Hi Pierre,

On 8/30/2024 2:58 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:41, Wesley Cheng wrote:
>> Utilize the card and PCM index coming from the USB QMI stream request.
>> This field follows what is set by the ASoC USB backend, and could
>> potentially carry information about a specific device selected through the
>> ASoC USB backend.  The backend also has information about the last USB
>> sound device plugged in, so it can choose to select the last device plugged
>> in, accordingly.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/qcom/qc_audio_offload.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/sound/usb/qcom/qc_audio_offload.c b/sound/usb/qcom/qc_audio_offload.c
>> index 0bd533f539e4..a7ad15404fd1 100644
>> --- a/sound/usb/qcom/qc_audio_offload.c
>> +++ b/sound/usb/qcom/qc_audio_offload.c
>> @@ -106,8 +106,6 @@ struct uaudio_qmi_dev {
>>  	bool er_mapped;
>>  	/* reference count to number of possible consumers */
>>  	atomic_t qdev_in_use;
>> -	/* idx to last udev card number plugged in */
>> -	unsigned int last_card_num;
>>  };
>>  
>>  struct uaudio_dev {
>> @@ -1261,7 +1259,7 @@ static int prepare_qmi_response(struct snd_usb_substream *subs,
>>  
>>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
>>  	xfer_buf_len = req_msg->xfer_buff_size;
>> -	card_num = uaudio_qdev->last_card_num;
>> +	card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>>  
>>  	if (!uadev[card_num].ctrl_intf) {
>>  		dev_err(&subs->dev->dev, "audio ctrl intf info not cached\n");
>> @@ -1455,8 +1453,7 @@ static void handle_uaudio_stream_req(struct qmi_handle *handle,
>>  
>>  	direction = (req_msg->usb_token & QMI_STREAM_REQ_DIRECTION);
>>  	pcm_dev_num = (req_msg->usb_token & QMI_STREAM_REQ_DEV_NUM_MASK) >> 8;
>> -	pcm_card_num = req_msg->enable ? uaudio_qdev->last_card_num :
>> -				ffs(uaudio_qdev->card_slot) - 1;
>> +	pcm_card_num = (req_msg->usb_token & QMI_STREAM_REQ_CARD_NUM_MASK) >> 16;
>>  	if (pcm_card_num >= SNDRV_CARDS) {
>>  		ret = -EINVAL;
>>  		goto response;
>> @@ -1706,7 +1703,6 @@ static void qc_usb_audio_offload_probe(struct snd_usb_audio *chip)
>>  		sdev->card_idx = chip->card->number;
>>  		sdev->chip_idx = chip->index;
>>  
>> -		uaudio_qdev->last_card_num = chip->card->number;
>>  		snd_soc_usb_connect(usb_get_usb_backend(udev), sdev);
>>  	}
> This entire path seems like a bad split/merge, it removes stuff that was
> done earlier. Also it's not clear what this has to do with 'QMI', card
> and PCM device management is usually done at a higher level.
>
> not following, please be mindful of reviewer fatigue when adding such
> changes in patch 30/33....

I'll just add this as part of patch#28.  I think before I did the reordering of the series, this made a bit more sense to have as a patch on its own.  Now that the entire framework for the audio dsp to know about the card and pcm index is already done in previous patches, the plumbing is done for the qc_audio_offload to utilize the fields coming from the audio DSP, as they will carry valid values.

Thanks

Wesley Cheng


