Return-Path: <linux-input+bounces-8427-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2E9E7A21
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 21:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36F611668AF
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 20:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED141FFC73;
	Fri,  6 Dec 2024 20:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NC1lA9kX"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571ED1C54AF;
	Fri,  6 Dec 2024 20:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733517822; cv=none; b=BiIcj6rRFwHu3c9eug+ECSMl7XTt2j02fH3bqxuCCid/BKNNAFAKymOV7pLRdmzDB6c47jMxwsMkuPQFJa/A08X08RF8Vsd5kZmD3vUkeX+99ryA81BfddH3LsqQpAaR1k+6MlwL96pG1rZR65MXduJ/csO5hBljp3Gj8mkXZMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733517822; c=relaxed/simple;
	bh=HkUtFt5yNEyOKOT57xnkxN4TB3SkK29GTeg3yPR2eEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qipZy33vViKbPlasb2TpKxizm/Prjyu9CDMOqmSlhbPXOPaw3bkXjV9rmW1WD8nM9DhMOZqXJDu+y1zg5kLCtnfIek6lxrJMHSCfnIlfBfLcnc/2u5Oa7KVSA0wx7Pme3anA032TBro8WI/1D9cJmF4Qmf9Yor7Pn0ljOFSOcD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NC1lA9kX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6BZ57X003204;
	Fri, 6 Dec 2024 20:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HkUtFt5yNEyOKOT57xnkxN4TB3SkK29GTeg3yPR2eEA=; b=NC1lA9kXljJwRNZ/
	jyGx38NCt6kSZMSxw27ZZQfIFXopTSQNDIoHiJnfYnod7Mm+fb87sgx76mNM19za
	LWD8J1KHKzhJ05C31MdD0xuQ2SYc47yExWP0wfjsiNa4cuTKeMV0tlYRyHt4hDm1
	FBMz71HGYCu7v8CgEAnlv52Uc9XA3rWVch5dkeQjLxE7XTSYF+qCfdLDPgvZY/Gn
	wZYZ6zjftxmSzfIqHZdNw5DZmFQYv6qawfnlO6tG81rOvzCZxd3Arss7rUh4qfmf
	EfHd9juph0xL0aVcnIC3XvqnWpwONZeFXfOkq3y4v6FdKPCz2ThZ65BpsbXeOMUe
	aq1Wkg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43brgp2qny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 20:43:22 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6KhLiq013837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 20:43:21 GMT
Received: from [10.71.112.120] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 12:43:21 -0800
Message-ID: <3e246be8-22a9-4473-8c78-39788ae95650@quicinc.com>
Date: Fri, 6 Dec 2024 12:43:20 -0800
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
        <pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <tiwai@suse.com>, <robh@kernel.org>, <gregkh@linuxfoundation.org>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4H_AQnMFekfz5gW6YWnFHVmnH-Jb32Ho
X-Proofpoint-ORIG-GUID: 4H_AQnMFekfz5gW6YWnFHVmnH-Jb32Ho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=870
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060156


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


That would basically require a significant change in the current design.  Was that requirement documented somewhere, where ALSA components should not be dependent on ASoC?  What was the reasoning for making it one direction, but not the other?


Thanks

Wesley Cheng


