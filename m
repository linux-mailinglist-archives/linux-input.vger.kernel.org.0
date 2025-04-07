Return-Path: <linux-input+bounces-11568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39554A7F096
	for <lists+linux-input@lfdr.de>; Tue,  8 Apr 2025 01:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D60477A3E2A
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 22:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA430224241;
	Mon,  7 Apr 2025 23:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K3hJ/iwi"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD49F15687D;
	Mon,  7 Apr 2025 23:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066831; cv=none; b=rd1ySJY68iDKcEVtDOvyM+syz+7YMQIFBuRGVCeqs/pzC0q46VjVc4Yf7zIVzi3HSymclRl+dayKT0sZNjoK5FXg6xmERwpNtV0qi/elP25f7JvPcWE1kXCsaaWTG3z5O4ip+oHaCAlh58klLiO8Ut/T1Ml0utJHH6myR8jnCOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066831; c=relaxed/simple;
	bh=hRS+kMizGkPqXYHgEHzhS2iEQ3yYETNDaisS1kSjthM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SBYA98ZZN69xtm1VmohCKESBP6XJD1HVrxvfqER3/TFbiINNSbnTMLwQ3eoUFi2S6BzdUNUDbc4p0wdunUzvNjGzwq3o+lWBiArhB2PUDOijqLaJddVOoqnSQR75WyObFMIsXzZrVF5YTWBJPWdVWQxYy14NpMm/oeOFy/+fcxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=K3hJ/iwi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537MVGQJ027956;
	Mon, 7 Apr 2025 23:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vh1NuIKsWZxQa9OlhJMGU2vga5oCE2rkTE1ygS51NT8=; b=K3hJ/iwiDlsc0rLZ
	fSlCdLuT5RsiMXguOGGr8LuvfjXnydvf9Ilgs2kNBYgG01Y49TrM/KkznDMdpuZ4
	lY0cQc5zSgfNbRf0tOxZHKVk2ivQlbsdeQR70NnbDwNMAbU3lyflgR5i43cxeFxk
	lqI1ClXOKUBlBaVdoAoQD4C1K0M8uW/svJHx3GhEhhV4JrUP3U3eEc5/1ws1au7x
	iKfabWEz9A75P1PddiegSbj1B5gJ9vaEOfsfdneIiJkFoC4s1bb7l4bzSRo1wb0E
	DYgJPcw/GgRpy79kPjFWLMVvHpe322u2y5j3I0whMdy8Vc7sV0HXKF4Un4297X02
	cgAmgQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcywtrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 23:00:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 537N03qv026043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 23:00:03 GMT
Received: from [10.110.75.38] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Apr 2025
 16:00:02 -0700
Message-ID: <0b8a77f4-2751-3982-3883-dec2ac5804e8@quicinc.com>
Date: Mon, 7 Apr 2025 15:59:56 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v37 24/31] ASoC: qcom: qdsp6: Add USB backend ASoC driver
 for Q6
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
 <20250404002728.3590501-25-quic_wcheng@quicinc.com>
 <Z--sQj-fXwXkk5iS@linaro.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <Z--sQj-fXwXkk5iS@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1nl-DQhG9dzg8yTLK0FVSV7GtgsZ5IF9
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f458f4 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=GBvyv-u1fKLaKHI2v8gA:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1nl-DQhG9dzg8yTLK0FVSV7GtgsZ5IF9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070161

Hi Stephan,

On 4/4/2025 2:54 AM, Stephan Gerhold wrote:
> On Thu, Apr 03, 2025 at 05:27:21PM -0700, Wesley Cheng wrote:
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
>>   include/sound/q6usboffload.h  |  20 +++
>>   sound/soc/qcom/Kconfig        |  12 ++
>>   sound/soc/qcom/qdsp6/Makefile |   1 +
>>   sound/soc/qcom/qdsp6/q6usb.c  | 278 ++++++++++++++++++++++++++++++++++
>>   4 files changed, 311 insertions(+)
>>   create mode 100644 include/sound/q6usboffload.h
>>   create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
>>
>> diff --git a/include/sound/q6usboffload.h b/include/sound/q6usboffload.h
>> new file mode 100644
>> index 000000000000..35ae26ba6509
>> --- /dev/null
>> +++ b/include/sound/q6usboffload.h
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2.0
>> + *
>> + * sound/q6usboffload.h -- QDSP6 USB offload
>> + *
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +/**
>> + * struct q6usb_offload - USB backend DAI link offload parameters
>> + * @dev: dev handle to usb be
>> + * @domain: allocated iommu domain
>> + * @sid: streamID for iommu
>> + * @intr_num: usb interrupter number
>> + **/
>> +struct q6usb_offload {
>> +	struct device *dev;
>> +	struct iommu_domain *domain;
>> +	long long sid;
> 
> "long long" feels like overkill for sid, given that it's essentially
> either an u8 or -1. I see you just copied this from q6asm-dai.c, but
> unlike q6asm-dai, you don't seem to check for sid < 0 in PATCH 28/31
> (qc_audio_offload.c).
> 
> Looking at the logic in q6asm-dai.c, it feels like this could really
> just be an "u8", since the -1 for "no iommus specified" is effectively
> just handled like sid = 0.
> 

Thanks for the detailed feedback and review.  Will change it accordingly 
as you suggested.

>> +	u16 intr_num;
>> +};
>> [...]
>> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
>> new file mode 100644
>> index 000000000000..cb8c4a62a816
>> --- /dev/null
>> +++ b/sound/soc/qcom/qdsp6/q6usb.c
>> [...]
>> +static int q6usb_dai_dev_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *node = pdev->dev.of_node;
>> +	struct q6usb_port_data *data;
>> +	struct device *dev = &pdev->dev;
>> +	struct of_phandle_args args;
>> +	int ret;
>> +
>> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_u16(node, "qcom,usb-audio-intr-idx",
>> +				   &data->priv.intr_num);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, "failed to read intr idx.\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
>> +	if (ret < 0)
>> +		data->priv.sid = -1;
>> +	else
> 
> Could just do if (ret == 0) here and drop the if branch above, if you
> make sid an u8 like I suggested above.
> 

Will do.

>> +		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
>> +
>> +	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
>> +
>> +	data->priv.dev = dev;
>> +	INIT_LIST_HEAD(&data->devices);
> 
> I think you also need devm_mutex_init(&data->lock) or separate
> mutex_init()/mutex_destroy() here, if someone enables
> CONFIG_DEBUG_MUTEXES.
> 

Ah, yes, will explicitly initialize the mutex here.

Thanks
Wesley Cheng

