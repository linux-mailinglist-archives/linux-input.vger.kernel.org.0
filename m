Return-Path: <linux-input+bounces-9325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB35A147B5
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 02:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64E357A2B5C
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 01:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BFB80604;
	Fri, 17 Jan 2025 01:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mf44Vy91"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45901096F;
	Fri, 17 Jan 2025 01:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737078339; cv=none; b=oENtlyU179XZ9KibEobYIql8k3ZvMiWHcpWBWlluKACDoof/wVGRjGRZBtnjSqD8B6oJ3ZXD9tBfcKIFqDbersY52iUOXF0927g6aRkLmDl/TRrv7llDlLOCT3QaC9QdCFlj2BL0pcZmolecqiuR1k+Oje5ziikmVN1z3kUec0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737078339; c=relaxed/simple;
	bh=LMp/VB1pLAuK6f2CbRwqMeV+82BrM/gUwEFicVioPwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ir+uwxUfaqZnUQOCUZkjKyHMLHVeQW51E1/9iHK1PQRI33FylNfsjyXirtJpMgenCx84uqYNv/qby7IwGmd/l4WzpPQ5+SXmxg/QCn71waTnAqjYfS1qcKMfQEw2OGYsW4K5/aLAOglEWRkwSQ+k1FBXY7mOHKhlsz33pf+FYLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mf44Vy91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDrgdc031371;
	Fri, 17 Jan 2025 01:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNUdRe+P2ibJ9V9QTxfpmYTis1Gp/hYM9tGDVArCjJA=; b=mf44Vy91TXHDM5oi
	4Pg8tqrYV9C7De0egwUWLGIT334ojA0Wi79fLrmCetjdTpZm0/iA0RKFJdQ9UWvv
	qMoWBaSFHDnZq4PDU2JNeJaVxoTgvlCEhE+lu4NyGLtCLtJPHdyMSigyS5pxRp5C
	WZNwAoyApu0XsuHplJhcEcDrFtdJTpLqE359yJC3VFhU4eueQXJgREQlBeBGreo1
	wsbueZM9J4WklwFa9XmR9Xgf201YoO9wXQKYXH8S2H8JS0AAWA1V8ArKqBwubUdL
	+jFHYFOO26if/mocAsFVdIT6ORzMWNpKMJytLa5Yoq1Xnr7XLzHwwxoY9aRsiY98
	0vUbBw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473d7hfw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 01:45:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50H1jA1R013996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 01:45:10 GMT
Received: from [10.110.17.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 17:45:09 -0800
Message-ID: <8dd379a7-68a7-4305-afe4-4a754224847a@quicinc.com>
Date: Thu, 16 Jan 2025 17:45:08 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v33 30/31] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
To: Randy Dunlap <rdunlap@infradead.org>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <tiwai@suse.com>, <krzk+dt@kernel.org>,
        <pierre-louis.bossart@linux.dev>, <Thinh.Nguyen@synopsys.com>,
        <robh@kernel.org>, <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20250116232824.3748438-1-quic_wcheng@quicinc.com>
 <20250116232824.3748438-31-quic_wcheng@quicinc.com>
 <9c266af7-b377-4f3e-8a6d-f7d4fa44d465@infradead.org>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <9c266af7-b377-4f3e-8a6d-f7d4fa44d465@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3IrnwgJRnbJlrtIkgBCUxKdYws0Y-XZG
X-Proofpoint-GUID: 3IrnwgJRnbJlrtIkgBCUxKdYws0Y-XZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_11,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1011
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170010

Hi Randy,

On 1/16/2025 4:08 PM, Randy Dunlap wrote:
>
> On 1/16/25 3:28 PM, Wesley Cheng wrote:
>> In order to allow userspace/applications know about USB offloading status,
>> expose a sound kcontrol that fetches information about which sound card
>> and PCM index the USB device is mapped to for supporting offloading.  In
>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>> responsible for registering to the SOC USB layer.
>>
>> It is expected for the USB SND offloading driver to add the kcontrol to the
>> sound card associated with the USB audio device.  An example output would
>> look like:
>>
>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>> -1, -1 (range -1->255)
>>
>> This example signifies that there is no mapped ASoC path available for the
>> USB SND device.
>>
>> tinymix -D 1 get 'USB Offload Playback Route PCM#0'
>> 0, 0 (range -1->255)
>>
>> This example signifies that the offload path is available over ASoC sound
>> card index#0 and PCM device#0.
>>
>> The USB offload kcontrol will be added in addition to the existing
>> kcontrols identified by the USB SND mixer.  The kcontrols used to modify
>> the USB audio device specific parameters are still valid and expected to be
>> used.  These parameters are not mirrored to the ASoC subsystem.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>  sound/usb/Kconfig                  |  10 ++
>>  sound/usb/qcom/Makefile            |   4 +
>>  sound/usb/qcom/mixer_usb_offload.c | 158 +++++++++++++++++++++++++++++
>>  sound/usb/qcom/mixer_usb_offload.h |  17 ++++
>>  sound/usb/qcom/qc_audio_offload.c  |   2 +
>>  5 files changed, 191 insertions(+)
>>  create mode 100644 sound/usb/qcom/mixer_usb_offload.c
>>  create mode 100644 sound/usb/qcom/mixer_usb_offload.h
>>
>> diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
>> new file mode 100644
>> index 000000000000..2696eb145ef5
>> --- /dev/null
>> +++ b/sound/usb/qcom/mixer_usb_offload.c
>> @@ -0,0 +1,158 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>> + */
>> +
>> +#include <linux/usb.h>
>> +
> [snip]
>
>> +
>> +/**
>> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
>> + * @chip - USB SND chip device
> Use ':' instead of '-'.


So to clarify, the ':' separator should be used for both structs and function descriptions?  Just want to clarify, so I can fix them in all the spots.


Thanks

Wesley Cheng


