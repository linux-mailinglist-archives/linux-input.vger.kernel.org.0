Return-Path: <linux-input+bounces-8373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B809E301B
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 00:52:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DB39B24D75
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 23:52:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A5A209F45;
	Tue,  3 Dec 2024 23:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U4Scl82+"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5215189F56;
	Tue,  3 Dec 2024 23:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733269950; cv=none; b=GCNiuUP5TCtQklBN5DOqbvITNFGHZzAKH1oJdWO4BCXHEFVFI6DABf9Lwt8lcEUTPHjV4zZs+pm05cCkJSy/1Rbq0nPLrYi+Ra0+BH+2dtQuNWhSkBuXQkvEyOYbub0y94w1OgXSrL8qdKlcbqwIrCvtY/qokEer48D3gKvyLQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733269950; c=relaxed/simple;
	bh=YeKECodB54j8DVOkgWE3bZYUE4a8mJE+BK8G/Cktrro=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mm46Lt05j1bSiLuRfRiFWH5RUqMWYbAdWYqUQCPQp/pi+lFlONrN9HX//TgEtO5JrSMQhl+48zbf4PZoGQy3nBifWS0vkpnrB6wogEzI6VyXDtqzPCzaRX0dJUl6IzWYAQubka7WfIwKJDEB8zdbX12nC4jJfnSfYGWbZXYOEdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U4Scl82+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3GTxq7024524;
	Tue, 3 Dec 2024 23:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YeKECodB54j8DVOkgWE3bZYUE4a8mJE+BK8G/Cktrro=; b=U4Scl82+YESk/5Yd
	thhZkkaoq5975CPjQOdA1AXQo3q8fok5VjqHgSDUraekcsV1KMntkLMUuxBRMUYO
	MJfAdUjywQmsBZC16q7kv7zjZeb+1h25g1cQiCPlMXdMb0dYCk8Yh9FXOxUjaHHb
	ew9NPwcLLku+wQn5ugVDkCrRuMsPFH9bE6xepbyB6skDrkiL7pY5djM3ndkQiNE+
	iuDZb4C7Bt4U4a/iTyW9leV8xhLlo0rgzYKuz7VyzM40AZggqnLMpj6xbXQLrXHE
	0mB5oQSThfC3wz8YqH9PSjqMNv7bY0DbO87m7aT00u+zhEB2t0oh34XLr9WVF4WT
	mqXHcQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyth7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 23:52:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3NqCDB023272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 23:52:12 GMT
Received: from [10.110.57.23] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 15:52:12 -0800
Message-ID: <11ced6c9-6917-41f7-975b-24641595002b@quicinc.com>
Date: Tue, 3 Dec 2024 15:52:11 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 14/30] ASoC: usb: Create SOC USB SND jack kcontrol
To: Cezary Rojewski <cezary.rojewski@intel.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <tiwai@suse.com>, <robh@kernel.org>, <gregkh@linuxfoundation.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-15-quic_wcheng@quicinc.com>
 <2075e22b-f6ec-4868-8880-cad78a6a35d9@intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <2075e22b-f6ec-4868-8880-cad78a6a35d9@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m9l7QOzOCmtciTCYJWumIVB9hjaeDlTB
X-Proofpoint-GUID: m9l7QOzOCmtciTCYJWumIVB9hjaeDlTB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=907 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030197


On 12/3/2024 8:14 AM, Cezary Rojewski wrote:
> On 2024-11-06 8:33 PM, Wesley Cheng wrote:
>> Expose API for creation of a jack control for notifying of available
>> devices that are plugged in/discovered, and that support offloading.  This
>> allows for control names to be standardized across implementations of USB
>> audio offloading.
>
> ...
>
>> +/* SOC USB sound kcontrols */
>
> I'd suggest to use 'SoC' over 'SOC'. The former is predominant in the ASoC code.
>

Ok, I can modify the abbreviations


>> +/**
>> + * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
>> + * @component: USB DPCM backend DAI component
>> + * @jack: jack structure to create
>> + *
>> + * Creates a jack device for notifying userspace of the availability
>> + * of an offload capable device.
>> + *
>> + * Returns 0 on success, negative on error.
>> + *
>> + */
>> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>> +                   struct snd_soc_jack *jack)
>> +{
>> +    int ret;
>> +
>> +    ret = snd_soc_card_jack_new(component->card, "USB Offload Jack",
>> +                    SND_JACK_USB, jack);
>> +    if (ret < 0) {
>> +        dev_err(component->card->dev, "Unable to add USB offload jack: %d\n",
>> +            ret);
>> +        return ret;
>> +    }
>> +
>> +    ret = snd_soc_component_set_jack(component, jack, NULL);
>> +    if (ret) {
>> +        dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);
>
> Do we really need this one? Error reporting/handling for both invocations above is redundant, the log message should be provided by lower-level API. No need to pollute each caller with them. And with that part removed, we end up with basic ASoC calls, hardly a new-API candidate.
>

In previous discussions, my understanding was that we wanted to have this API, so that the sound jack naming, etc.. was consistent throughout all designs.  So that was the incentive of having its own dedicated API.

https://lore.kernel.org/linux-usb/8e08fd5e-91b8-c73e-1d97-7cf4d98573d4@quicinc.com/


>> +/**
>> + * snd_soc_usb_disable_offload_jack() - Disables USB offloading jack
>> + * @component: USB DPCM backend DAI component
>> + *
>> + * Disables the offload jack device, so that further connection events
>> + * won't be notified.
>> + *
>> + * Returns 0 on success, negative on error.
>> + *
>> + */
>> +int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
>> +{
>> +    int ret;
>> +
>> +    ret = snd_soc_component_set_jack(component, NULL, NULL);
>> +    if (ret) {
>> +        dev_err(component->card->dev, "Failed to disable jack: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);
>
> Code duplication. ASoC already provides the API and the logging is redundant here.
>

OK, maybe the enable/disable apis are not too useful.


Thanks

Wesley Cheng


>> +/**
>> + * snd_soc_usb_enable_offload_jack() - Enables USB offloading jack
>> + * @component: USB DPCM backend DAI component
>> + * @jack: offload jack to enable
>> + *
>> + * Enables the offload jack device, so that further connection events
>> + * will be notified.  This is the complement to
>> + * snd_soc_usb_disable_offload_jack().
>> + *
>> + * Returns 0 on success, negative on error.
>> + *
>> + */
>> +int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
>> +                    struct snd_soc_jack *jack)
>> +{
>> +    int ret;
>> +
>> +    ret = snd_soc_component_set_jack(component, jack, NULL);
>> +    if (ret) {
>> +        dev_err(component->card->dev, "Failed to enable jack: %d\n", ret);
>> +        return ret;
>> +    }
>> +
>> +    return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(snd_soc_usb_enable_offload_jack);
>
> Ditto.
>
>>   /**
>>    * snd_soc_usb_find_priv_data() - Retrieve private data stored
>>    * @usbdev: device reference
>>
>

