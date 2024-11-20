Return-Path: <linux-input+bounces-8178-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817309D43FA
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 23:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A11BB23033
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 22:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970731BC07B;
	Wed, 20 Nov 2024 22:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HfGTMpzk"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44744188717;
	Wed, 20 Nov 2024 22:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732142211; cv=none; b=A/ufDZiCFTDIOg9Jdkm6V7hVWMvofmw/2Sh99SJflxhwgBxMDrKDq8rj9pQS0r2/zOiV3CIoW2v/6Sh0kiTwU66NTj25fCn+iaEBDQWFt7bmI19KCWm1iIhP9DNVCu/RvaI9Id+3p/agcUTRhh113+wu6TvThyBVASrLqbexdWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732142211; c=relaxed/simple;
	bh=2Cp5aaXjkP+a168HGxSLsBZhGl2+scjhbt48AyM8k80=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qhr9JcHpZEsc0WCPYftHknVKCudJ5yMhb2Jm6ekdXVMj5jbjc7BXgoVAwv61GaQdxeDJFAW0JBK6j4s8IxiyeR/BitRbLUObQe5RFF29td+JzP0ABhGfhMLK7WQ9BvuZLl/fQq7LFNw5nXNLejgWGKXzZBdcyOEfMcE7vGyYvbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HfGTMpzk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJn2dx025955;
	Wed, 20 Nov 2024 22:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lUU8Tt86LNQJ0csNs06y2W4/lu/ueaR7HRud2/xtk6Y=; b=HfGTMpzkwigxCuQq
	ewzf9kMNpccplf6sNLzhFq4qtqXH+wzWMzyKeKgJHvv+RPI7Fm0gg5wU0zZof8up
	KNDodGyYRu8bBJCAOYcBTXfd3a/3L3kgFJkXbPpgriEXVyUVzlhamDWh5c6kg32W
	W0o3JOLyS4BEvXKhFWmg5qxftCiW2PIJ5hjvrC6PrtlGoGRuucFLFTWEw1yN6PL1
	XjL2GSUvSwPiiPItVj2xw5Z0ko7Nb//rfB3IHqIzNCWoOmQTnfYtft9Wxl+2fSLT
	moOv/sSJzaqBCRuKrPYuCgn8/yInL5M6q4FdJvo21OXNKNYgLyl/mMoaQJ+rxV+i
	JnOQVg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431byjj4vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 22:36:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKMaUmn016740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 22:36:30 GMT
Received: from [10.110.30.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 14:36:30 -0800
Message-ID: <28302a54-d33a-45eb-be73-fcf3bfe45f90@quicinc.com>
Date: Wed, 20 Nov 2024 14:36:29 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 15/30] ASoC: usb: Fetch ASoC card and pcm device
 information
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-16-quic_wcheng@quicinc.com>
 <878qte3xgo.wl-tiwai@suse.de>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <878qte3xgo.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O7wmN2mmlr7Akp3bt07XtRk4PbPO3_Os
X-Proofpoint-ORIG-GUID: O7wmN2mmlr7Akp3bt07XtRk4PbPO3_Os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200161

Hi Takashi,

On 11/20/2024 4:23 AM, Takashi Iwai wrote:
> On Wed, 06 Nov 2024 20:33:58 +0100,
> Wesley Cheng wrote:
>> USB SND needs to know how the USB offload path is being routed.  This would
>> allow for applications to open the corresponding sound card and pcm device
>> when it wants to take the audio offload path.  This callback should return
>> the mapped indexes based on the USB SND device information.
>>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  include/sound/soc-usb.h | 16 ++++++++++++++++
>>  sound/soc/soc-usb.c     | 34 ++++++++++++++++++++++++++++++++++
>>  2 files changed, 50 insertions(+)
>>
>> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
>> index 587ea07a8cf5..c3d3e8d62ac5 100644
>> --- a/include/sound/soc-usb.h
>> +++ b/include/sound/soc-usb.h
>> @@ -36,6 +36,11 @@ struct snd_soc_usb_device {
>>   * @list - list head for SND SOC struct list
>>   * @component - reference to ASoC component
>>   * @connection_status_cb - callback to notify connection events
>> + * @update_offload_route_info - callback to fetch mapped ASoC card and pcm
>> + *				device pair.  This is unrelated to the concept
>> + *				of DAPM route.  The "route" argument carries
>> + *				an array used for a kcontrol output and should
>> + *				contain two integers, card and pcm device index
>>   * @priv_data - driver data
>>   **/
>>  struct snd_soc_usb {
>> @@ -44,6 +49,9 @@ struct snd_soc_usb {
>>  	int (*connection_status_cb)(struct snd_soc_usb *usb,
>>  				    struct snd_soc_usb_device *sdev,
>>  				    bool connected);
>> +	int (*update_offload_route_info)(struct snd_soc_component *component,
>> +					 int card, int pcm, int direction,
>> +					 long *route);
>>  	void *priv_data;
>>  };
>>  
>> @@ -61,6 +69,8 @@ int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
>>  int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component);
>>  int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
>>  				    struct snd_soc_jack *jack);
>> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
>> +				     int direction, long *route);
>>  
>>  struct snd_soc_usb *snd_soc_usb_allocate_port(struct snd_soc_component *component,
>>  					      void *data);
>> @@ -109,6 +119,12 @@ static inline int snd_soc_usb_enable_offload_jack(struct snd_soc_component *comp
>>  	return 0;
>>  }
>>  
>> +static int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
>> +					    int direction, long *route)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>>  static inline struct snd_soc_usb *
>>  snd_soc_usb_allocate_port(struct snd_soc_component *component, void *data)
>>  {
>> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
>> index ab914878e101..e56826f1df71 100644
>> --- a/sound/soc/soc-usb.c
>> +++ b/sound/soc/soc-usb.c
>> @@ -145,6 +145,40 @@ int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
>>  }
>>  EXPORT_SYMBOL_GPL(snd_soc_usb_enable_offload_jack);
>>  
>> +/**
>> + * snd_soc_usb_update_offload_route - Find active USB offload path
>> + * @dev - USB device to get offload status
>> + * @card - USB card index
>> + * @pcm - USB PCM device index
>> + * @direction - playback or capture direction
>> + * @route - pointer to route output array
>> + *
>> + * Fetch the current status for the USB SND card and PCM device indexes
>> + * specified.  The "route" argument should be an array of integers being
>> + * used for a kcontrol output.  The first element should have the selected
>> + * card index, and the second element should have the selected pcm device
>> + * index.
>> + */
>> +int snd_soc_usb_update_offload_route(struct device *dev, int card, int pcm,
>> +				     int direction, long *route)
>> +{
>> +	struct snd_soc_usb *ctx;
>> +	int ret = -EINVAL;
>> +
>> +	ctx = snd_soc_find_usb_ctx(dev);
>> +	if (!ctx)
>> +		return -ENODEV;
>> +
>> +	mutex_lock(&ctx_mutex);
>> +	if (ctx && ctx->update_offload_route_info)
>> +		ret = ctx->update_offload_route_info(ctx->component, card, pcm,
>> +						     direction, route);
>> +	mutex_unlock(&ctx_mutex);
> The second ctx check is redundant.  And the locking scheme looks
> dubious -- as ctx isn't protected by ctx_mutex after its retrieval via
> snd_soc_find_usb_ctx(), even if you reacquire ctx_mutex, it may point
> to an already released object (in theory).
>
> IOW, for a safer protection, you'd need to cover the whole
> find-and-exec procedure via a single ctx_mutex lock action.
>
That's fair, will make the change to move the mutexes around.

Thanks

Wesley Cheng


