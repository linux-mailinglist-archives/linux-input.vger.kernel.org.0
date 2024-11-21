Return-Path: <linux-input+bounces-8194-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CCE9D53F9
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 21:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AA551F2158B
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 20:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11831D958E;
	Thu, 21 Nov 2024 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E+qGCi6h"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981D81BF58;
	Thu, 21 Nov 2024 20:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732220717; cv=none; b=RkwBtGpeyvI24yqnVzmsDB6ZcSwl8K2swhWt5I0w9t2oLm0qw+uGtYn73LZEnAx0FX5hQHUWDFcZD3LDE2JRu+/BMtqPE7RVCSxk8AQnPrK3/iuNok6lBy5jU044HjBWjCOruLw59DznXimrF6V8Et7qENf1ouCHaBriaTwNx1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732220717; c=relaxed/simple;
	bh=xt/N1u7xQDP3nA0PEqU+LzyDhnsawogKcVfQNRe9l4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WYkp2iqHioGreijgFzWKaG+CVRmLk31nTPLer00QIa+49x0dXxnzmtMuhuSXMJoBk7jo7iP1N5hcZXJICFeijctnDySLCoW9VL9AGy10MfVlHt16tLT8rUKVetfwwEV5HJ3B3EdHtTxsk3BMSw2fMmv6sRHOrEizkx2omBQytKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E+qGCi6h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALH7B7C015590;
	Thu, 21 Nov 2024 20:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xt/N1u7xQDP3nA0PEqU+LzyDhnsawogKcVfQNRe9l4s=; b=E+qGCi6hCsvn9XAL
	RCJDDuwVGYHi4vOG4kOhtX3FVFQvm3WGpZTf8BLzXF7uPla8i9Oxef8F63heXXnZ
	cUUQ+fOy8VTsMfbQuU2LmEJy9T7va/7o3Q8SFCn2t1CE8gi/2s3xzmiAS8j0gUP/
	XjrNwS+GPR7//F9SXMaf3OvVt/44LoW7ROyGnvsIYcueT+s7VCcNT84eeFMX4awS
	vTpMFeSPJZjVEwe/BgBUUrfkxCjxdp3QTu/6ju/SpzPALE5DQlC0nZrmOtAP9aiQ
	iREOo/p/kg/O4U8n+0zEeoiu9d8FmaIR+leSPGXZ8Qfzl9ipnTs4KdxiKk3S4XRj
	wIUrXA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4320y9j1jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 20:24:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ALKOtkf018777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 20:24:55 GMT
Received: from [10.71.112.120] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 21 Nov
 2024 12:24:54 -0800
Message-ID: <c30b77dc-0a34-4ea7-a4c0-37a5d3065ee7@quicinc.com>
Date: Thu, 21 Nov 2024 12:24:54 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 02/30] xhci: sec-intr: add initial api to register a
 secondary interrupter entity
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
 <20241106193413.1730413-3-quic_wcheng@quicinc.com>
 <9b86a2c9-de7f-46b7-b63d-451ebc9c87dd@linux.intel.com>
 <2384956c-7aae-4890-8dca-f12e9874709f@quicinc.com>
 <17890837-f74f-483f-bbfe-658b3e8176d6@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <17890837-f74f-483f-bbfe-658b3e8176d6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7bB-EHy_Uf1hGCZKbwD638GxX6IKNyiW
X-Proofpoint-ORIG-GUID: 7bB-EHy_Uf1hGCZKbwD638GxX6IKNyiW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210153

Hi Mathias,

On 11/21/2024 11:15 AM, Mathias Nyman wrote:
> On 21.11.2024 3.34, Wesley Cheng wrote:
>> Hi Mathias,
>>
>> On 11/20/2024 6:36 AM, Mathias Nyman wrote:
>>> On 6.11.2024 21.33, Wesley Cheng wrote:
>>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>
>>>> Introduce XHCI sec intr, which manages the USB endpoints being requested by
>>>> a client driver.  This is used for when client drivers are attempting to
>>>> offload USB endpoints to another entity for handling USB transfers.  XHCI
>>>> sec intr will allow for drivers to fetch the required information about the
>>>> transfer ring, so the user can submit transfers independently.  Expose the
>>>> required APIs for drivers to register and request for a USB endpoint and to
>>>> manage XHCI secondary interrupters.
>>>>
>>>> Driver renaming, multiple ring segment page linking, proper endpoint clean
>>>> up, and allowing module compilation added by Wesley Cheng to complete
>>>> original concept code by Mathias Nyman.
>>>>
>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>> ---
>>>>    drivers/usb/host/Kconfig          |  11 +
>>>>    drivers/usb/host/Makefile         |   2 +
>>>>    drivers/usb/host/xhci-sec-intr.c  | 438 ++++++++++++++++++++++++++++++
>>>>    drivers/usb/host/xhci.h           |   4 +
>>>>    include/linux/usb/xhci-sec-intr.h |  70 +++++
>>>>    5 files changed, 525 insertions(+)
>>>>    create mode 100644 drivers/usb/host/xhci-sec-intr.c
>>>>    create mode 100644 include/linux/usb/xhci-sec-intr.h
>>>>
>>>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>>>> index d011d6c753ed..a2d549e3e076 100644
>>>> --- a/drivers/usb/host/Kconfig
>>>> +++ b/drivers/usb/host/Kconfig
>>>> @@ -104,6 +104,17 @@ config USB_XHCI_RZV2M
>>>>          Say 'Y' to enable the support for the xHCI host controller
>>>>          found in Renesas RZ/V2M SoC.
>>>>    +config USB_XHCI_SEC_INTR
>>>> +    tristate "xHCI support for secondary interrupter management"
>>>> +    help
>>>> +      Say 'Y' to enable the support for the xHCI secondary management.
>>>> +      Provide a mechanism for a sideband datapath for payload associated
>>>> +      with audio class endpoints. This allows for an audio DSP to use
>>>> +      xHCI USB endpoints directly, allowing CPU to sleep while playing
>>>> +      audio.  This is not the same feature as the audio sideband
>>>> +      capability mentioned within the xHCI specification, and continues
>>>> +      to utilize main system memory for data transfers.
>>>
>>> This same API should be used for the hardware xHCI sideband capability.
>>> We should add a function that checks which types of xHC sideband capability xHC
>>> hardware can support, and pick and pass a type to xhci xhci_sec_intr_register()
>>> when registering a sideband/sec_intr
>>
>> Just to make sure we're on the same page, when you mention the term sideband capability, are you referring to section 7.9 xHCI Audio Sideband Capability in the xHCI spec?  If so, I'm not entirely sure if that capability relies much on secondary interrupters.  From reading the material, it just seems like its a way to map audio endpoints directly to another USB device connected to the controller? (I might be wrong, couldn't find much about potential use cases)
>
> Yes, that is the one, 7.9 xHCI Audio Sideband Capability.
>
> I had that in mind when I started writing the sideband API.
> This is why registering a sideband and requesting a secondary interrupter
> are done in separate functions.
> The concept if still similar even if '7.9 Audio Sideband Capability' doesn't
> need a secondary interrupter, we want to tell xhci driver/xHC hardware that
> one connected usb device/endpoint handling is offloaded somewhere else.
>

Ah, ok...now I understand a bit more on what you were trying to do.  When you do eventually introduce the audio sideband capability, you'd need to modify the endpoint APIs to also issue the 'Set Resource Assignment' command with the proper device/endpoint being offloaded.  Initially, when Thinh brought up this section in the xHCI spec, I couldn't find any use cases that utilized that capability, so it was a bit unclear to me what it was meant for.  Now you've explained it a bit more, I think I can get the gist of it.


> I don't think we should write another API for that one just because more is
> done by firmware than by xhci driver.
>
> The only change for now would be to add some "sideband_type" parameter to
> xhci_sec_intr_register(struct usb_device *udev, enum sideband_type), fail the
> registration if isn't "software", and save the type in struct xhci_sec_intr
>
> I'll add hardware sideband support (7.9 Audio Sideband) later, but it would be
> nice to not change the API then.
>
> The name change from sideband to sec-intr is a bit unfortunate with this in
> mind. Was there some reason for it?
>

This was because I wasn't too sure how the audio sideband and this driver was related, but I get what you are trying to do now.  I can change it back to the original xhci-sideband, as the name change was something that happened on this revision.  I will fix the corner case I mentioned WRT the xhci_discover_or_reset_device() scenario, add the basic sideband type handling and rename this back to xhci-sideband in the next rev.

Thanks

Wesley Cheng


