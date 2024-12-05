Return-Path: <linux-input+bounces-8404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BD69E4BB4
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 02:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62ACB16AB63
	for <lists+linux-input@lfdr.de>; Thu,  5 Dec 2024 01:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30841208A0;
	Thu,  5 Dec 2024 01:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ba96n8iZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869AC653;
	Thu,  5 Dec 2024 01:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733361338; cv=none; b=Z9xkViyGoXcFpV06n5dhq2iKg0lQ+GwlZgq+xD2G6e6AliMoX1PRXFTJ0OaB4T6DtE6y4NpHK9Q9nAA/pLlz7JL7Gxadv9lfeN7FIWZ4UBqZMNzNCL7Rcx22Dsj8qOwxot7UkGOW09TyiawdYBT9Jq1vYIcBfLYzSWavcEsRkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733361338; c=relaxed/simple;
	bh=+uSyj+hhF542MRILwfSsDc+8UV5Of09qaRF4ageEDnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mnz98zlcfzfpfzIvFFrWCPzW2+KaERM02vCo4TswDE0RRqfFcBax+hJSKl5lFTsAFZz/Ya78ETpkOpt1mrlvhliisF04IZ6Pgo3ACKhpamS3qZI74Sm9zVJ67Dbxtwa5UPW+taHMjeIKQPVSTdpOB3EVHwikGz9qD33swOBxekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ba96n8iZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4GBQTI006059;
	Thu, 5 Dec 2024 01:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+uSyj+hhF542MRILwfSsDc+8UV5Of09qaRF4ageEDnQ=; b=ba96n8iZwQWeLBAo
	uxWL3nnGLVhiFQWdEjPJXY/HV/O6hhQ5hXMhrNJGrCCxSu+5wDG4ay73KfjNxq9w
	o0bRPpB5XxFIgiXc129NzV7kWw9N5Y5OBP39FSsee27aVtEdOa7lKVzedZyTs8Be
	nVsy93C0l8iGWcC+efDxAMqOANfcFsNw0IO5lDvK7ocAfRgMQtbP9cLFed5fr8P4
	j9IWHdj6qpyRDW7R6kE/9LuTohsCEI3he5rdTi4IrZAwQMC75wIn9qDDXAEbAUwM
	rLr9HY/tnLybYdqRIZ9ap1A4YSBMvEnRZKZYFr8TiKIFaCB5ffMlCjwappfcp/Ty
	1J2OHg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w3enw8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 01:15:04 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B51F3gT008462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 01:15:03 GMT
Received: from [10.71.112.120] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 17:15:03 -0800
Message-ID: <f9eb5aa5-0741-4198-aeee-beec3ca270f3@quicinc.com>
Date: Wed, 4 Dec 2024 17:15:02 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Cezary Rojewski <cezary.rojewski@intel.com>,
        Greg KH
	<gregkh@linuxfoundation.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai
	<tiwai@suse.de>, <srinivas.kandagatla@linaro.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
        <dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
 <2024120320-recant-tameness-6c81@gregkh>
 <58a561d6-dc10-484e-8214-5e03c4aef66d@intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <58a561d6-dc10-484e-8214-5e03c4aef66d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dyyO8fNKKyDRRpN9VYNHqEfEwxwWGzBm
X-Proofpoint-ORIG-GUID: dyyO8fNKKyDRRpN9VYNHqEfEwxwWGzBm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 bulkscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=877
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412050008


On 12/4/2024 1:14 PM, Cezary Rojewski wrote:
> On 2024-12-03 5:57 PM, Greg KH wrote:
>> On Tue, Dec 03, 2024 at 05:17:48PM +0100, Cezary Rojewski wrote:
>>> On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
>>>> Sorry to chime in late, I only look at email occasionally.
>
> ...
>
>>>>> I believe Amadeusz was still against having the two card design, and wants the routing to automatically happen when playback happens on the sound card created by the USB SND layer.  However, even with that kind of implementation, the major pieces brought in by this series should still be relevant, ie soc-usb and the vendor offload driver.  The only thing that would really change is adding a path from the USB SND PCM ops to interact with the ASoC entities.  Complexity-wise, this would obviously have a good amount of changes to the USB SND/ASoC core drivers.  Some things I can think of that we'd need to introduce:
>>>>
>>>> The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.
>>>
>>>
>>> Well, I believe a lot has changed since then, not sure if USB Audio Offload
>>> (UAOL) was even stable on the Windows solution back then. Obviously we want
>>> to incorporate what we have learned during all that time into our solution
>>> before it lands on upstream.
>>
>> Great, can you help review this series please?
>
> Hi Greg,
>
> This series is large and I'd suggest to split it up, what I touched on in my recent reply [1]. Please correct me if I'm wrong, but you mostly care about drivers/usb/* part. If so, the existing set could be split into USB-changes series, ALSA/ASoC-framework series and a third, holding bulk of QCOM-specific patches. Me and my team care mostly about the sound/* part and we don't hold much expertise in USB. I believe Mathias covers this part well though.
>

I'm fine to split this into 3 different series if that helps with the reviews.  I was always under the impression that when we upstream things, we need to have an end to end use case within the same series, so that folks get the full picture.  I've gotten feedback where people were confused they couldn't find/follow the code flow, albeit those series were much much smaller.  If Greg is ok with it, I can split it up and have a link reference to the other series.


I was able to reorganize the list a bit to what you recommended.  So the current layout is xHCI changes first, followed by the USB ALSA and ASoC changes, and lastly the QCOM/vendor specific modifications.


Thanks

Wesley Cheng


>
> [1]: https://lore.kernel.org/linux-sound/a8ece816-3d4c-4d60-b7c1-a7f7919325f3@intel.com/
>
> Czarek

