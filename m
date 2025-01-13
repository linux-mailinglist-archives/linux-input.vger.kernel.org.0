Return-Path: <linux-input+bounces-9209-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC2A0C5A6
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 00:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAAA0168507
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 23:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E6B1FA147;
	Mon, 13 Jan 2025 23:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NBxX3fYm"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C491F9F6B;
	Mon, 13 Jan 2025 23:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736810878; cv=none; b=C7HCo23fJzh5Fm34O6vtnPWn9di+MLRwTOOlTWRSQCAoXmHRHY9llqYbOKFcifYd//9rujvz3D2ioqhP+JtEsLcRGrkj5iLKpDjukEkEnQZjZN5OPAV67t+QpmKr1DGZU6HBR3oF1oBV0nWnX+/3bD01LJdihA28lwuBw3djQxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736810878; c=relaxed/simple;
	bh=1yIrDXcZYhcyxN986ZYGN1NBDhALQeVPow6Y93lrGvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hjC+6JPQeufBKma6VEzyqTMzjgRGeqw2smpQRB0hXirJ64EHIUcOeMX/rZKM74FT7fIFFDnvRa/lELQTM/mEvIrJM89mrJlecKB8SUj18zQCAtwidXedoj43/awo22NBCoc3Eo/skNCuG3o4G7Vk6QyXsbSNt/2gq2CJb1zc2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NBxX3fYm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKs85a025453;
	Mon, 13 Jan 2025 23:27:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2SMsbRwfz/DxTuCO//N0aO2VimKu/X+j8sEr189L7cM=; b=NBxX3fYmHO7pFTkW
	CxDmXJWXtqmN/0mSvZEeVCydo1uyUjl1grP80r/9Mp3ISgZ1Um7keDXto3NJnkyf
	moiyL9LSCnGklyKDkRr8IeIXAU1ZnRNRRyULC7s+tOb/whdYZYUD27lJjX6rPQtM
	Szj7ECkHuxkP4Eb3NaWi7y9uHNIiaSN6LLeMmlcSqJpAY1quZpx6BtKXEucsQyeJ
	mNpeUtxk86O7dE4OAeC5z48EzuO6pqYz+Leg47ylr0qiU/cYloXMB5gGr3ULjJ8h
	Ym8a3fmb4kCT4F3eNjwfWtubjvE4OZsduVQjkkBF3QCezvpYNPo98x51uTeoAZ2O
	eQ9dQw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a9288q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 23:27:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DNRcEe030837
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 23:27:38 GMT
Received: from [10.110.66.138] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 Jan
 2025 15:27:37 -0800
Message-ID: <f8a9e454-72f4-4979-b29d-109700b2a204@quicinc.com>
Date: Mon, 13 Jan 2025 15:27:24 -0800
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
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20250113143632.63c52d74@foxbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CNsYdWrGujrNWaOAdifB8Kkp4WjMkrQ2
X-Proofpoint-ORIG-GUID: CNsYdWrGujrNWaOAdifB8Kkp4WjMkrQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130184

Hi Michal,

On 1/13/2025 5:36 AM, Michał Pecio wrote:
> Hi,
>
>> Depending on the interrupter use case, the OS may only be used to
>> handle the interrupter event ring clean up.
> What do you mean by "cleanup"? Because I see that this patch ends up
> acknowledging events to the xHC and I don't know why it would do so?


Cleanup so that we can ensure there are no pending events that were left once the secondary interrupter is disabled.  Based on previous feedback, there are use cases where the OS may actually want to handle events occurring on the secondary interrupter, but that support will take some time to implement/test.


>> In these scenarios, event TRBs don't need to be handled by the OS,
>> so introduce an xhci interrupter flag to tag if the events from an
>> interrupter needs to be handled or not.
> Right, and if the OS isn't handling those events because they are owned
> by a coprocessor then it shouldn't be acknowledging them either, which
> has the effect that the xHC considers their memory free for reuse.


This implementation was done as part of an effort to consolidate the cleanup of the pending events with the same path as the handling of events for the main/primary interrupter:

https://lore.kernel.org/linux-usb/33dfa0c5-c43f-79f6-2700-beee2e5d389f@quicinc.com/


> Also, what happens when Linux goes to sleep and this IRQ stops running?
> I expected that the coprocessor itself should be updating the xHC about
> its own progress.


Currently, Linux is not expected to go to sleep if the coprocessor is active.  The coprocessor will notify when the audio stream is enabled and disabled, and the USB device runtime PM counters are incremented/decremented respectively.  If Linux forcefully goes to sleep, then support is there to ensure the coprocessor's audio stream is disabled before entering suspend.


>
> Is it a bug? How is this stuff supposed to work?
>
> How are future developers supposed to know how it is supposed to work?
> I imagine that few of them will have Qualcomm hardware for testing.


Most of the implementation details of the overall mechanisms are highlighted in the cover letter, so can you clarify what you are suggesting that needs to be done for this statement?


>
>> static int xhci_handle_event_trb(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
>> 				 union xhci_trb *event)
>> {
>> 	u32 trb_type;
>>
>> +	/*
>> +	 * Some interrupters do not need to handle event TRBs, as they may be
>> +	 * managed by another entity, but rely on the OS to clean up.
>> +	 */
>> +	if (ir->skip_events)
>> +		return 0;
> This function is only called from one place so the caller could perform
> this check and don't waste time calling it.


I'm open to do it from either place.  We have to ensure that we cycle through each pending event during the cleanup phase.


Thanks

Wesley Cheng


