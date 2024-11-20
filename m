Return-Path: <linux-input+bounces-8174-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC099D4230
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 19:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2B261F2127B
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 18:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6AEE1AB6CD;
	Wed, 20 Nov 2024 18:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b9L1TiaO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4B0155742;
	Wed, 20 Nov 2024 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732128504; cv=none; b=QKGC9Iun+mCW6QbXAxtzCYG+u7urVB4UGMxsN4WobQwKsDpTYQ+cAZzusVleweUXEnFZrO2AIMFsQpySxCHbUOSw8AxFEyccac96s9SGngR4Ql46VfWs3mOLLZVs6uy6kULk9NKfb9raseeTq9LQW1l3lNYg+w2s4X50S4zvibk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732128504; c=relaxed/simple;
	bh=ujSDzaApsf9yiTgCIRSrJbgFe+qCH4hd9AnhtUVjtFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=utbpiSZWL3CwKSK8UqEjyo0sIhrD1WUgLcDej6mQo3dVbtukXIakTMi/ym/IfOj2eNktsfV7uCb8S1N23iKCFWnhfJcyPZYCuhuo67C4iBIQyZw4laqGw+b9dwqLia1Yo7XaWyeEt/Ep58vWayYQJOAU+U0QwGGedT/Awhtwby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b9L1TiaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9FN5s007711;
	Wed, 20 Nov 2024 18:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujSDzaApsf9yiTgCIRSrJbgFe+qCH4hd9AnhtUVjtFM=; b=b9L1TiaOdke1hTcg
	GjOUPgn6HQSjns/mMLEpvvWpJ2ZeOscobZOhuKMmxDBBqZu0TxWjUVhCGMneZKTC
	6PAEFvVqZuIwM1bEOS92htP6FAH13ZxRTIH6MsYJUujWAQDb4ACpA31nPB3S6rlc
	H8lJz/WENmiwMztc7APVPGiFrYSZZVetwfRqubTCQwOxTCOv3PRy/Ov2L23YqZIN
	12Dgq3RmKJt55TQY6f/mBKUER+G6tHJwRMsXUSxdvRgopjONhjTYWRqnccjZBG9F
	7cVXVbPTsmcJ6N+knKcxrU4PiVeITwDPGhVuvUdGPpKydqcLiBPQhi7iR8W31Hyc
	fVm4Jg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvj41e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 18:48:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKIm2OH012549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 18:48:02 GMT
Received: from [10.110.30.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 10:48:01 -0800
Message-ID: <a7bca9f6-06f9-4e14-a1ab-761e92a68ceb@quicinc.com>
Date: Wed, 20 Nov 2024 10:48:00 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 01/30] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-2-quic_wcheng@quicinc.com>
 <18a691df-e7b6-42fc-8dbc-c10c2608cd9c@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <18a691df-e7b6-42fc-8dbc-c10c2608cd9c@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UJkgSqup_QCVRf1BrXCSUM8P7P6OytC2
X-Proofpoint-GUID: UJkgSqup_QCVRf1BrXCSUM8P7P6OytC2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200130

Hi Mathias,

On 11/20/2024 3:48 AM, Mathias Nyman wrote:
> On 6.11.2024 21.33, Wesley Cheng wrote:
>> Depending on the interrupter use case, the OS may only be used to handle
>> the interrupter event ring clean up.  In these scenarios, event TRBs don't
>> need to be handled by the OS, so introduce an xhci interrupter flag to tag
>> if the events from an interrupter needs to be handled or not.
>>
>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>> ---
>>   drivers/usb/host/xhci-ring.c | 17 +++++++++++++----
>>   drivers/usb/host/xhci.h      |  1 +
>>   2 files changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index 9f1e150a1c76..b8f6983b7369 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -2931,14 +2931,22 @@ static int handle_tx_event(struct xhci_hcd *xhci,
>>   }
>>     /*
>> - * This function handles one OS-owned event on the event ring. It may drop
>> - * xhci->lock between event processing (e.g. to pass up port status changes).
>> + * This function handles one OS-owned event on the event ring, or ignores one event
>> + * on interrupters which are non-OS owned. It may drop xhci->lock between event
>> + * processing (e.g. to pass up port status changes).
>>    */
>>   static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
>>                    union xhci_trb *event)
>>   {
>>       u32 trb_type;
>>   +    /*
>> +     * Some interrupters do not need to handle event TRBs, as they may be
>> +     * managed by another entity, but rely on the OS to clean up.
>> +     */
>> +    if (ir->skip_events)
>> +        return 0;
>
> This works for your special case but is a small step sideways from other possible xhci
> secondary interrupter usecases.
>
> We currently support just one event handler function even if we support several secondary
> interrupters. Idea was to add support to pass dedicated handlers for each secondary interrupter,
> set when the secondary interrupter is requested.
>
> In your case this dedicated handler wouldn't do anything.
>
> This patch again has a different approach, it keeps the default handler, and instead adds
> flags to it, preventing it from handling the event trb.
>
> Not sure if we should take the time and implement dedicated handlers now, even if we don't
> have any real users yet, or just take this quick change and rework it later when needed.
>
>
Yes, I think we had a small discussion on this on v20:

https://lore.kernel.org/linux-usb/a88b41f4-7e53-e162-5a6a-2d470e29c0bb@quicinc.com/

Since I didn't have an environment that exercised the path where we'd actually want to handle secondary interrupter events, I wasn't sure if it was valid to add bits and pieces of it to support such use cases w/o proper testing.  I think having this driver (as is) is still a step forward into the right direction, as these APIs are still going to be required if enabling secondary interrupter events in the Linux environment.

Thanks

Wesley Cheng


