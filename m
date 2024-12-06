Return-Path: <linux-input+bounces-8428-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4B49E7C8D
	for <lists+linux-input@lfdr.de>; Sat,  7 Dec 2024 00:35:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91BD4284DA7
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 23:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55171212F85;
	Fri,  6 Dec 2024 23:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dQhUjTPS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2006C1EBFFC;
	Fri,  6 Dec 2024 23:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528153; cv=none; b=Bc5VpaIF1+PG3XVkw77UW7QGCxA2sMmjsYCzAxoXufyQs1pJ7l+E16WUD49zWnaW2kNqzhnR6GIdP4hr/HR3RDVLcpcz3CW99Yu2sFjZvKCJlqzpPO56fWnrK85t9xoaDJ9RIJQBCBrgLU7yQF0TbVm7u3z2m2p2nZWPzofNGWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528153; c=relaxed/simple;
	bh=MXIwrQewAajDh1gfesHB1c2CKu8WD9CnQN3aFCayvec=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AuQyzrGmN7ILsc/KLFH8AhozKtj1wls/tx366B51iOzK7PgPrx+ZEv+Ahz+6Z1lwvRhWaRfvjtUS+suaNuyqk/ysnjg9edHb1zJfAge8fnBF4FgRX7ie+oDTmXC8H3/ZuExBiyfs0eUz4jDARrE/3q25xtM0NPgVFPvHQes476E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dQhUjTPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6LL67m016383;
	Fri, 6 Dec 2024 23:35:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MXIwrQewAajDh1gfesHB1c2CKu8WD9CnQN3aFCayvec=; b=dQhUjTPS9V+2stxc
	mVLD8Jp5EnNTj/zTKUCu53bYpzWqePP8noc68BiHhuoRt0S71NhtCVubHR2UbDPr
	dk9dKmmrH7Axh+a7YEe9HDgEl+GFFQS2Jj0cffkha2km113gm84zSuqTfu1W30hq
	5qXhNlbP3gRYykDfJHpWGfBmX2wRLB4sVZt2bO2VSm+1jcDyqJSPvqhfTYHVOMsW
	sJC6xj8q3iMCxnujrvYLJPVNUJMOvmMpB+2JgYzumiYBLzNcto234wgSMAXQ1l91
	Mjku0wFdMJ6JIImHRWDMoSMdilo8r8cvfvzFZ7OfqiJC4i/0M1fjkKel+eDvpCkY
	Xleq8g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxnya034-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 23:35:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6NZQ6x018811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 23:35:26 GMT
Received: from [10.71.112.120] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 15:35:25 -0800
Message-ID: <33afcc55-1597-4aff-a20c-7a0df4b23236@quicinc.com>
Date: Fri, 6 Dec 2024 15:35:23 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 28/30] ALSA: usb-audio: Add USB offload route kcontrol
To: Cezary Rojewski <cezary.rojewski@intel.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-29-quic_wcheng@quicinc.com>
 <1a361446-7a18-4f49-9eeb-d60d1adaa088@intel.com>
 <28023a83-04a5-4c62-85a9-ca41be0ba9e1@quicinc.com>
 <1644aa6b-a4e0-4dbd-a361-276cb95eb534@intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1644aa6b-a4e0-4dbd-a361-276cb95eb534@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GLu9OkWF2xnRrV0lI092seNdox1_pfiG
X-Proofpoint-ORIG-GUID: GLu9OkWF2xnRrV0lI092seNdox1_pfiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060179


On 12/6/2024 1:09 AM, Cezary Rojewski wrote:
> On 2024-12-04 12:15 AM, Wesley Cheng wrote:
>>
>> On 12/3/2024 8:13 AM, Cezary Rojewski wrote:
>>> On 2024-11-06 8:34 PM, Wesley Cheng wrote:
>>>> In order to allow userspace/applications know about USB offloading status,
>>>> expose a sound kcontrol that fetches information about which sound card
>>>> and PCM index the USB device is mapped to for supporting offloading.  In
>>>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>>>> responsible for registering to the SOC USB layer.
>
> ...
>
>>> R) += mixer_usb_offload.o
>>>> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
>>>> new file mode 100644
>>>> index 000000000000..e0689a3b9b86
>>>> --- /dev/null
>>>> +++ b/sound/usb/mixer_usb_offload.c
>>>> @@ -0,0 +1,102 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + */
>>>> +
>>>> +#include <linux/usb.h>
>>>> +
>>>> +#include <sound/core.h>
>>>> +#include <sound/control.h>
>>>> +#include <sound/soc-usb.h>
>>>
>>> ALSA-components should not be dependent on ASoC ones. It should be done the other way around: ALSA <- ASoC.
>>>
>>
>> At least for this kcontrol, we need to know the status of the ASoC state, so that we can communicate the proper path to userspace.  If the ASoC path is not probed or ready, then this module isn't blocked.  It will just communicate that there isn't a valid offload path.
>
> I'm not asking _why_ you need soc-usb.h header, your reasoning is probably perfectly fine. The code hierarchy is not though. If a sound module is dependent on soc-xxx.h i.e. ASoC symbols, it shall be part of sound/soc/ space.


I'm still reviewing the HDAudio flow a bit, so please correct me if I'm wrong.  During module initialization, it looks like there will be some overall platform card that will call snd_hdac_ext_bus_init() to create the HDA bus.  I referred to the Intel AVS core.  How do you ensure that the ALSA entities are loaded before this call goes out?  I think once the bus is created dynamic creation/removal of HDA devices is fine, and the hdev_attach/detach is executed. 

Thanks

Wesley Cheng


