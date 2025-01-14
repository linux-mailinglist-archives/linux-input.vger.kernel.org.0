Return-Path: <linux-input+bounces-9237-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1C3A1125D
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 21:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89BDE163E3C
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 20:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B2720E6E7;
	Tue, 14 Jan 2025 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j0aeQiiY"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C3620E01D;
	Tue, 14 Jan 2025 20:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887402; cv=none; b=gqftGQfnJQS+P+RLfTAYPQ8fsUklAh3UCpe7boVlzIOT0Am2yge8NoYk//GLVNGooQ6mdEBIF4rpdpEMfUhxyUz9nHEOCzB386VMZPuh/DEP7Z1IgV22CJAN05XQfS8b70oA3izqwOXHfZYhMrFg95QkGagJEKA/hsDkVtHZ4/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887402; c=relaxed/simple;
	bh=vuLGJWWWPOxXs1PhleeQNa9QpoUeiQzpYHQoVn/uUuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WyoFppEVCyJS4opxpDWTNkDXQ9G/caJpJj7Ydt08PR525JDYkFDjJOhlnPXeCi5PK1DCSxxIuXUpKg5ROWgxAXvbwmLnBXkkxXJ7YjzHtwxrMrrmc5/7zXhXXVXkDKRyqhXPzk2RUa3PMKEGCrjT5t42az4bkxaO7duvy3yyRMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j0aeQiiY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EGjt7A032511;
	Tue, 14 Jan 2025 20:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umlQhVy2M+CQipFDCc+b+/LwaU2H+7yYsOGc4pT54LA=; b=j0aeQiiYggAREeso
	K6zQkbGc56r5MNAFva7+hf45f+Cwgvo1ncqYG83Ud38iTbwvADW5+4CpyNvGRIDV
	4RxaAMugt/t7gfCr/6aBqLW0BIQ+G0TXBsN/iO4YwEqTSQsPlwWxgkAbXpvX7hqE
	R5CFMb9HiX7cX2/rPvIwimiE9XxfoBX9eW+g8Vjn6jh+CcQEZdc74SREA3xUinVP
	EC5wKzVcTHXWSU7R4fNelhG+xhWXQPQI8WFDmXVL3LrVncNvgAnemQJeOhp6eFRp
	sxKZQpKNWjzIEZ64ykEsNKeMSy8lbCx2BlMPZ6Tpx9ih4cwcuObOSppoy33HtI2t
	4F8pKA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445uqsghbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 20:43:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EKh1Nf005980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 20:43:01 GMT
Received: from [10.110.124.91] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 Jan
 2025 12:43:00 -0800
Message-ID: <5d5e9ba4-d544-416e-b57b-dc5c8692b737@quicinc.com>
Date: Tue, 14 Jan 2025 12:42:59 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v32 01/32] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20250114150847.1c3c9ebe@foxbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tQ44ouugD3MuZAEKQAnvUaXJKuGsS2L6
X-Proofpoint-GUID: tQ44ouugD3MuZAEKQAnvUaXJKuGsS2L6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_07,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501140157

Hi Michal,

On 1/14/2025 6:08 AM, Michał Pecio wrote:
> Thanks, I think I now see how this is meant to work.
>
>
> Cover leter mostly discusses the ALSA side of things, but not low level
> details of xHCI operation, such as who will be ringing doorbells and
> how, handling IRQs, updating event ring dequeue, or handling halted EPs.
>
> So for the record, as far as I see:
> 1. There is no API for ringing doorbells or even getting a pointer,
>    the coprocessor needs to have its own access. Fair enough.
> 2. Same for event ring dequeue, but the driver must clean up leftover
>    unacknowledged events after sideband operation stops.
> 3. Linux IRQ handler never needs to worry about sideband interrupts.
> 4. Resetting halted endpoints is not implemented at all, I think?
>    So this code is currently mostly useful with isochronous.


Yep, all your points about the code with respects to the xHCI perspective is correct.


>
> And the 'skip_events' flag only exists to enable ring cleanup when the
> interrupter is removed? In such case I think it's overkill.
>
> The code would be simpler and its intent more visible if 'skip_events'
> were a new parameter of xhci_handle_events(). Existing IRQ would call
> the function normally, while xhci_skip_sec_intr_events() would use the
> new parameter to suppress event handling in this one special case.
>
> It would be immediately clear that skipping only applies on removal.
>
> You could completely get rid of PATCH 01/32 because 02/32 would no
> longer need to set this flag on the interrupter, and the 'if' branch
> adedd by 01/32 could go into 03/32 where it logically belongs.
>
> Just a suggestion. I simply don't see any need to have a flag which
> causes events on a ring to always be skipped as a matter of policy.
> Your code doesn't seem to require it. Probably nobody ever will.
>

In my previous discussions with Mathias, I think the plan was that he wanted it to be built in a way where we should be able to accommodate a use case where the secondary interrupter was going to be actually handled by the Linux side.  This is why the skip_events is populated/defined by the xHCI sideband calls, so that we can differentiate between the secondary interrupter use cases.  Although, it is the correct assumption that this series doesn't actually implement that functionality. 


Thanks

Wesley Cheng


