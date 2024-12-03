Return-Path: <linux-input+bounces-8372-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D159E2FCA
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 00:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22FB4B28635
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 23:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B91D20A5DB;
	Tue,  3 Dec 2024 23:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eR+qloIo"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E71C8460;
	Tue,  3 Dec 2024 23:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733267748; cv=none; b=Wj0277Ubfp92cCbas3NNjwhlfqF/ypLl9HjROnas0ADtV7rVCyAl45G1Kz1Eh/2KVoHdL2GKMnxNAy5II36qCm04DVmvGjCl2R8zTxByWXUJ7e1HdhaRXfnMCdGsTuiczf3Srh5hBLVkzLbUER5ukMet0WJT5lCIW9VH7Ua0A2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733267748; c=relaxed/simple;
	bh=YkZAsANfAmRYtI/Mt+2RDqFV4yBRm6bxvA1qhI5AL7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u8nmnksC9KFvaRTk2rCge+BSJPk8HtYF0BCsaKCwajQvMerIuXetZVbslltpwYoVS+R48yVYSDllae0ZY1f9sHMrTus1mjZSaP4Ujp9lPMaiQz1AYH1PCW5KDqitgINl48oBwBUt5v8gArN5EoOP9g1ITtyMmPixhkPL3pLdfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eR+qloIo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B3HoXEb030978;
	Tue, 3 Dec 2024 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YkZAsANfAmRYtI/Mt+2RDqFV4yBRm6bxvA1qhI5AL7s=; b=eR+qloIoJOhXZhC3
	+GWiiJaVz2i49lUqyAj6fCUrb9PgOUliB6bWQccpZaGU7P93SrpaGtY8kEJUIjIb
	W9z5tEKDGINKGUU+XBLRhXY62FlwSMfe/FNsKjPr9B0Kcz/Nwj4OOzynEPAMMTwO
	bXIrTZZkm4fDBk5+S/Qr54JN0+6zp5xJ0fKsKTqF7aZgZiRYD8RXIPIzwQPSCvgJ
	CR45+vroSXgspmZXj9cLOj47Llb6i8HJr2TdX/G5SfE2QEbm+X5k+KPE2krE1axX
	Kvz36WzMH4+93BgHFa37ZdPjfIRnsc33wR+f1a2+5s+CzN3dc928N5JS+D+fh8zO
	jNHveA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90tdtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 23:15:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B3NFOQc010563
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 23:15:24 GMT
Received: from [10.110.57.23] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Dec 2024
 15:15:23 -0800
Message-ID: <28023a83-04a5-4c62-85a9-ca41be0ba9e1@quicinc.com>
Date: Tue, 3 Dec 2024 15:15:23 -0800
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <1a361446-7a18-4f49-9eeb-d60d1adaa088@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IBwKgWcd3KUzuxMkopp3EOItLDqwSWCj
X-Proofpoint-GUID: IBwKgWcd3KUzuxMkopp3EOItLDqwSWCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=709 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030192


On 12/3/2024 8:13 AM, Cezary Rojewski wrote:
> On 2024-11-06 8:34 PM, Wesley Cheng wrote:
>> In order to allow userspace/applications know about USB offloading status,
>> expose a sound kcontrol that fetches information about which sound card
>> and PCM index the USB device is mapped to for supporting offloading.  In
>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>> responsible for registering to the SOC USB layer.
>
> ...
>
> R) += mixer_usb_offload.o
>> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
>> new file mode 100644
>> index 000000000000..e0689a3b9b86
>> --- /dev/null
>> +++ b/sound/usb/mixer_usb_offload.c
>> @@ -0,0 +1,102 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/usb.h>
>> +
>> +#include <sound/core.h>
>> +#include <sound/control.h>
>> +#include <sound/soc-usb.h>
>
> ALSA-components should not be dependent on ASoC ones. It should be done the other way around: ALSA <- ASoC.
>

At least for this kcontrol, we need to know the status of the ASoC state, so that we can communicate the proper path to userspace.  If the ASoC path is not probed or ready, then this module isn't blocked.  It will just communicate that there isn't a valid offload path.


>> +
>> +#include "usbaudio.h"
>> +#include "card.h"
>> +#include "helper.h"
>> +#include "mixer.h"
>> +
>> +#include "mixer_usb_offload.h"

