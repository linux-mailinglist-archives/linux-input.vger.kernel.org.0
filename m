Return-Path: <linux-input+bounces-6110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1396F96A9E1
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86A171F24EE7
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 21:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5C041EC00E;
	Tue,  3 Sep 2024 21:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Bx4JhlQN"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0801EC002;
	Tue,  3 Sep 2024 21:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725398350; cv=none; b=SUsojfOl8XeDyOFsXeR1l1VHwogATxDLvVy5IRojux0vUTEpmkOBSneinJjKLxCZASczDq2F/EdcWx0VRtiApEn1FhVcrsOeyxg3XsY2sr0Fr4a8Ls46Z3l5xlgOw8KJxztCO3gEhSsFipUAZKqVDkpVzPirjudFe/YI8yreovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725398350; c=relaxed/simple;
	bh=U1ukEr8EN1FDDvS4Y7RULLGTH93cVAvfVFqw0l1CRb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cVLm6No3ghNg/+ESAo/GLMezLpJ3O0RNBW/4Gz5Ye1HymzM465k564vWBj+g4EvzK/uhSH9MvzvGYVJGktg67Rl3a7SGQ2weTRna4a3BOghO8BHh9QuHY+cXKtCzBeyI0QD8+XTXM0J2KmCiHO0MF/gBisf3OK/uJBijjjJ/AyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Bx4JhlQN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483D99Pm014645;
	Tue, 3 Sep 2024 21:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ccVhMBdxEk5S4mL0cUcGF7PalslkLp70MYvdg4jGv40=; b=Bx4JhlQNp4Mr4rRu
	3MWe1AssFm+F4CHy5VhRZ3BjpoN2yB3csvRBWkLkprI/xAQGZJbPNWhx0AaZIrIm
	mAfwCKFSfYoLcoJnaXt/yaZXcEgvmUigyRylvKtghA2K9O9No8LHrpGk8Fdzyfka
	qrLgeZnbAvN/k7+VxkPC8Hmmrh3sZreo7ZweNA9ilpFqlQRHIJASugyOtXzrtoZ8
	+GeYzosmCwLSIDTRYE5eviuKd4dKB7wyBQDOgfY7UJHlYf2VL8ZolXkhmrrZwj4u
	JzePcTc+ZynZsxZTSdX1mziwIu9x45dj/QazjTSIJ4edSo+329AexEcIyL0s90be
	dbmR/g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dt69avfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 21:18:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483LIbs9019044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 21:18:37 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 14:18:36 -0700
Message-ID: <5b23cbaf-05e2-4310-aad0-7e5bd01c9d3b@quicinc.com>
Date: Tue, 3 Sep 2024 14:18:36 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 21/33] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20240829194105.1504814-22-quic_wcheng@quicinc.com>
 <afe37014-8ec5-4808-bc24-09ac0f2d93b6@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <afe37014-8ec5-4808-bc24-09ac0f2d93b6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zJj5FS5k0LAWrU0MGLzu1kKo2bkGDL1O
X-Proofpoint-ORIG-GUID: zJj5FS5k0LAWrU0MGLzu1kKo2bkGDL1O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_09,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030171

Hi Pierre,

On 8/30/2024 2:21 AM, Pierre-Louis Bossart wrote:
>
> On 8/29/24 21:40, Wesley Cheng wrote:
>> Create a USB BE component that will register a new USB port to the ASoC USB
>> framework.  This will handle determination on if the requested audio
>> profile is supported by the USB device currently selected.
>>
>> Check for if the PCM format is supported during the hw_params callback.  If
>> the profile is not supported then the userspace ALSA entity will receive an
>> error, and can take further action.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  include/sound/q6usboffload.h  |  20 +++
>>  sound/soc/qcom/Kconfig        |  10 ++
>>  sound/soc/qcom/qdsp6/Makefile |   1 +
>>  sound/soc/qcom/qdsp6/q6usb.c  | 246 ++++++++++++++++++++++++++++++++++
>>  4 files changed, 277 insertions(+)
>>  create mode 100644 include/sound/q6usboffload.h
>>  create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
>>
>> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
>> new file mode 100644
>> index 000000000000..49ab2c34b84c
>> --- /dev/null
>> +++ b/include/sound/q6usboffload.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0
>> + *
>> + * linux/sound/q6usboffload.h -- QDSP6 USB offload
> not sure about the linux/ prefix?
>
>> + *
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/**
>> + * struct q6usb_offload
>> + * @dev - dev handle to usb be
>> + * @sid - streamID for iommu
>> + * @intr_num - usb interrupter number
>> + * @domain - allocated iommu domain
>> + **/
>> +struct q6usb_offload {
>> +	struct device *dev;
>> +	long long sid;
>> +	u16 intr_num;
>> +	struct iommu_domain *domain;
>> +};
> consider reordering to avoid holes/alignment issues, e.g. all pointers
> first, then long long then u16
>
Will fix these.
>> +static int q6usb_hw_params(struct snd_pcm_substream *substream,
>> +			   struct snd_pcm_hw_params *params,
>> +			   struct snd_soc_dai *dai)
>> +{
>> +	struct q6usb_port_data *data = dev_get_drvdata(dai->dev);
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +	int direction = substream->stream;
>> +	struct q6afe_port *q6usb_afe;
>> +	struct snd_soc_usb_device *sdev;
>> +	int ret = -EINVAL;
>> +
>> +	mutex_lock(&data->mutex);
>> +
>> +	/* No active chip index */
>> +	if (list_empty(&data->devices))
>> +		goto out;
> -ENODEV for the default return value>?
Sure.
>> +
>> +	sdev = list_last_entry(&data->devices, struct snd_soc_usb_device, list);
>> +
>> +	ret = snd_soc_usb_find_supported_format(sdev->chip_idx, params, direction);
>> +	if (ret < 0)
>> +		goto out;
>> +
>> +	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
>> +	if (IS_ERR(q6usb_afe))
>> +		goto out;
>> +
>> +	/* Notify audio DSP about the devices being offloaded */
>> +	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
>> +					  sdev->ppcm_idx[sdev->num_playback - 1]);
> don't you need a symmetrical notification upon hw_free()?
>
> Also what happens if there are multiple calls to hw_params, which is
> quite legit in ALSA/ASoC?

The afe_port_send_usb_dev_param() is meant to just update the device selected for offload on the audio DSP end, and this won't be referenced until our Q6AFE DAI sends the port start command in its prepare() callback.  Don't think we need to handle anything specific in the hw_free() case.  As long as the hw_params() callback is called before any audio session is started, then we'll ensure that the device selected is always updated to the audio DSP.

Thanks

Wesley Cheng


