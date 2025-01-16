Return-Path: <linux-input+bounces-9288-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345CA144C1
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 23:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D146D3A89CE
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 22:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F36C1DD87D;
	Thu, 16 Jan 2025 22:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fkpeVwKK"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A5E46BF;
	Thu, 16 Jan 2025 22:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067859; cv=none; b=QKqEGLI2t//j7yj4TscAMi/Are2AdYjYt2aqvz3WnWl4bOvNUBasBpA35QbW5ZIvVd7/TL4xv/VqY2mvGceu5ZpRQhmvqukMNly2iOyVZ27NqOrJuiIlQf7l/+4x9+rGHBGKR+r1LEMs2NrZvwoDfDyYE8ngbEaKeRueJY5t/U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067859; c=relaxed/simple;
	bh=ZzfGMMVD7DQB//ORNV5xPqzbPFE9dA1qGF2GnFwskvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZD60nA8j2SVuS2lGJSoeg7zDEsPwhD0XCBddzdYC/QFuJI1r3WI9NsYHl0gW4vQBS+HmGD8dQp3Za+bcZrJ/EKYQyMzlCblC3cVJ6VZx0B+/TCwBWVZD7kRWsmWgOVTP+O3OZ9b8qzAi+1EEoQ5y6OaQkxZRFBgyjplSfwJXIkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fkpeVwKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GEK1cI005681;
	Thu, 16 Jan 2025 22:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZzfGMMVD7DQB//ORNV5xPqzbPFE9dA1qGF2GnFwskvI=; b=fkpeVwKKlkuB0iFJ
	AGqEc/qJCpqKF0db60st/XFLcicFEFy/nLITvg6cZ/bxUtzAIqiX/FKMiDqd8xJl
	DtZ5PeI/byDgd9JJM1NGGXil4ULWs9kxQ929WwO/2ebYiQlM4Gah/ftVEWK+6U2O
	ScQEE4w0lTQmDVSHYeS531Rx+LITAsGTpsUIcUANaNoD9p1sBmSytuBWM9TDTtH2
	5pkGe2LwlwgXmBbq5mpo/Pi1GqXl19ZD7UrJr9kIaKKOvouhRGG20zEgbgDrnxui
	8rp8DuZBbANGnuTv9HY2je10SVWpDA/pSnFEhWyNUgIJ5z5vnoPtKQVU2KCfz8m+
	4ELIfg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4473sfs4mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 22:50:38 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50GMobPu015214
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 22:50:37 GMT
Received: from [10.71.114.255] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 Jan
 2025 14:50:36 -0800
Message-ID: <dc207f37-65e0-48fd-9af9-454e3b8c427e@quicinc.com>
Date: Thu, 16 Jan 2025 14:50:32 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v32 01/32] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
CC: <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>, <gregkh@linuxfoundation.org>,
        <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <robh@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <20250113143632.63c52d74@foxbook>
 <f8a9e454-72f4-4979-b29d-109700b2a204@quicinc.com>
 <20250114150847.1c3c9ebe@foxbook>
 <5d5e9ba4-d544-416e-b57b-dc5c8692b737@quicinc.com>
 <45a40d3e-e534-4704-a928-cb36682133dc@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <45a40d3e-e534-4704-a928-cb36682133dc@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9jZiiLT6KnM8pQPD03tegAhUKHJ9KKff
X-Proofpoint-ORIG-GUID: 9jZiiLT6KnM8pQPD03tegAhUKHJ9KKff
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160169

Hi Mathias/Michal,

On 1/16/2025 7:15 AM, Mathias Nyman wrote:
> On 14.1.2025 22.42, Wesley Cheng wrote:
>> Hi Michal,
>>
>> On 1/14/2025 6:08 AM, Michał Pecio wrote:
>>> Thanks, I think I now see how this is meant to work.
>>>
>>>
>>> Cover leter mostly discusses the ALSA side of things, but not low level
>>> details of xHCI operation, such as who will be ringing doorbells and
>>> how, handling IRQs, updating event ring dequeue, or handling halted EPs.
>>>
>>> So for the record, as far as I see:
>>> 1. There is no API for ringing doorbells or even getting a pointer,
>>>     the coprocessor needs to have its own access. Fair enough.
>>> 2. Same for event ring dequeue, but the driver must clean up leftover
>>>     unacknowledged events after sideband operation stops.
>>> 3. Linux IRQ handler never needs to worry about sideband interrupts.
>>> 4. Resetting halted endpoints is not implemented at all, I think?
>>>     So this code is currently mostly useful with isochronous.
>>
>>
>> Yep, all your points about the code with respects to the xHCI perspective is correct.
>>
>>
>>>
>>> And the 'skip_events' flag only exists to enable ring cleanup when the
>>> interrupter is removed? In such case I think it's overkill.
>>>
>>> The code would be simpler and its intent more visible if 'skip_events'
>>> were a new parameter of xhci_handle_events(). Existing IRQ would call
>>> the function normally, while xhci_skip_sec_intr_events() would use the
>>> new parameter to suppress event handling in this one special case.
>>>
>>> It would be immediately clear that skipping only applies on removal.
>>>
>>> You could completely get rid of PATCH 01/32 because 02/32 would no
>>> longer need to set this flag on the interrupter, and the 'if' branch
>>> adedd by 01/32 could go into 03/32 where it logically belongs.
>>>
>>> Just a suggestion. I simply don't see any need to have a flag which
>>> causes events on a ring to always be skipped as a matter of policy.
>>> Your code doesn't seem to require it. Probably nobody ever will.
>
> Yes, this should works as well, and is maybe a bit cleaner than current
> flag approach.
>
>>>
>>
>> In my previous discussions with Mathias, I think the plan was that he wanted it to be built in a way where we should be able to accommodate a use case where the secondary interrupter was going to be actually handled by the Linux side.  This is why the skip_events is populated/defined by the xHCI sideband calls, so that we can differentiate between the secondary interrupter use cases.  Although, it is the correct assumption that this series doesn't actually implement that functionality.
>>
>
> Idea is to support xhci virtualization at some point, but also benefit from
> moving noisy devices with a lot of events away from filling up the primary
> event ring.
>
> Once a usb device gets its own xhci secondary interrupter with a dedicated
> event ring for transfer events, and its own MSI/MSI-X interrupt with dedicated
> interrupt handler, it is easier to support xhci virtualization.
>
> In short, support passing one USB device to a virtual machine client.
>
> But this is out of scope for this series, so flag or parameter will do.
>
> For this "vendor" sideband case we use the secondary interrupter to prevent
> xCH controller from triggering interrupts for this device. CPU can
> "sleep" while the audio chip reads and writes TRBs on transfer rings,
> and  polls dedicated event ring for transfer events.
>
>

Thanks for chiming in, I have made the change to skip events based on a function argument versus a flag.  It helps, since it reduces the size of this series, and as Michal mentioned, it does look cleaner overall.


Will submit a new revision with this change.


Thanks
Wesley Cheng


