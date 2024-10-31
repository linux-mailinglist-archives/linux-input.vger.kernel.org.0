Return-Path: <linux-input+bounces-7786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 988A69B7154
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 01:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28E531F21FEC
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 00:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1E91EB48;
	Thu, 31 Oct 2024 00:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g/AnwqZ3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33943AD9;
	Thu, 31 Oct 2024 00:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730335787; cv=none; b=PtgKTeZSzR0TPTUuEKMhFpuiVBiB6ry95/gg7Uz1oye33DOajP1JQjlp/Dsg6s+JsGNNAOMAulyorFj6Ulc4SIQhC8174IXo481CcwEvLMT8kVmoOK6GaZgyK/fPhKnJKoAXpbuAXfZ+BVOFgRFLEaG8UswqbCqthPfRBTFtucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730335787; c=relaxed/simple;
	bh=AouGVQ2CRkjpEWM70bUJlCu0V+yKP2XQnmW+HAZ45c8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=FiP3h2rh3ORjD+jgKuVqQNsDW+8FcI9Pxm5WU/di2rTGrTHU3OOjug5LarxJ8LaTMJ+8CXz0omag0PJ12CTa/DQCcm2lDbQl8JEA7ClDJ1pG0P1NzJW9QPm/B+t5R5UnTWCwlFVRFcy7yLkAXn5NbpitsND0lGBVO8uy6hBqB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g/AnwqZ3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UCH9ug019847;
	Thu, 31 Oct 2024 00:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7xhMTx79uWJ0oHC0IxM8Ok0hQb/h6nRSursI6CrKMEE=; b=g/AnwqZ3Yif4Pzs9
	KNW5jnZUznCrIQweqAJPN2eBbylguIg9A+Lb3oIoZ/6PVJ+K6OE8qFGSS9kW39i4
	jqRrPlz4uQIfbSHSlMIx8YFg+l1p4wMsEfNbfVfakFk7UPY7S4X9vMPJp3WGVB4v
	LFe3/fhmghYYimkF1MItCwkWuigpuJI+FLXRIgLjNp7PcRPXfD4H/XfNYZ+3kUyW
	XHMhMBbexVYS9emVN69riDIRc+7EIVogY99NrtMJc3BSMjm8WRQ8ftxFZTKMg0bE
	0YYLsxaAasl1dM/MhkJZ/KY22YvtnOhIUiZ3MwgrhVJbfTv7a9JnSkI8K5FumQ4R
	hCFDCQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmp0ht14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 00:49:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49V0nKMA010497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 00:49:20 GMT
Received: from [10.71.115.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Oct
 2024 17:49:19 -0700
Message-ID: <07d5a8b5-e985-45c1-95e0-1def6695ba9b@quicinc.com>
Date: Wed, 30 Oct 2024 17:49:18 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 04/33] xhci: sideband: add initial api to register a
 sideband entity
From: Wesley Cheng <quic_wcheng@quicinc.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC: "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "perex@perex.cz"
	<perex@perex.cz>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "pierre-louis.bossart@linux.intel.com"
	<pierre-louis.bossart@linux.intel.com>,
        "broonie@kernel.org"
	<broonie@kernel.org>,
        "bgoswami@quicinc.com" <bgoswami@quicinc.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-5-quic_wcheng@quicinc.com>
 <20241025232252.wsk4lviqzyzqjzuh@synopsys.com>
 <52ea0b32-79c7-42e8-8e2c-192d08f41e64@quicinc.com>
Content-Language: en-US
In-Reply-To: <52ea0b32-79c7-42e8-8e2c-192d08f41e64@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OqRiUjmTcddOaQjqdwLe-IzQ-UetsT-M
X-Proofpoint-ORIG-GUID: OqRiUjmTcddOaQjqdwLe-IzQ-UetsT-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410310005

On 10/29/2024 11:58 AM, Wesley Cheng wrote:
> Hi Thinh,
>
> On 10/25/2024 4:22 PM, Thinh Nguyen wrote:
>> Hi,
>>
>> On Tue, Oct 15, 2024, Wesley Cheng wrote:
>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>
>>> Introduce XHCI sideband, which manages the USB endpoints being requested by
>>> a client driver.  This is used for when client drivers are attempting to
>>> offload USB endpoints to another entity for handling USB transfers.  XHCI
>>> sideband will allow for drivers to fetch the required information about the
>>> transfer ring, so the user can submit transfers independently.  Expose the
>>> required APIs for drivers to register and request for a USB endpoint and to
>>> manage XHCI secondary interrupters.
>>>
>>> Multiple ring segment page linking, proper endpoint clean up, and allowing
>>> module compilation added by Wesley Cheng to complete original concept code
>>> by Mathias Nyman.
>>>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ---
>>>  drivers/usb/host/Kconfig          |   9 +
>>>  drivers/usb/host/Makefile         |   2 +
>>>  drivers/usb/host/xhci-sideband.c  | 424 ++++++++++++++++++++++++++++++
>>>  drivers/usb/host/xhci.h           |   4 +
>>>  include/linux/usb/xhci-sideband.h |  70 +++++
>>>  5 files changed, 509 insertions(+)
>>>  create mode 100644 drivers/usb/host/xhci-sideband.c
>>>  create mode 100644 include/linux/usb/xhci-sideband.h
>>>
>>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>>> index 4448d0ab06f0..96659efa4be5 100644
>>> --- a/drivers/usb/host/Kconfig
>>> +++ b/drivers/usb/host/Kconfig
>>> @@ -104,6 +104,15 @@ config USB_XHCI_RZV2M
>>>  	  Say 'Y' to enable the support for the xHCI host controller
>>>  	  found in Renesas RZ/V2M SoC.
>>>  
>>> +config USB_XHCI_SIDEBAND
>>> +	tristate "xHCI support for sideband"
>>> +	help
>>> +	  Say 'Y' to enable the support for the xHCI sideband capability.
>>> +	  Provide a mechanism for a sideband datapath for payload associated
>> Please correct me if I'm wrong, but this doesn't look like the actual
>> xHCI Audio Sideband capability described in the xHCI spec section 7.9
>> but rather a specific implementation for Qcom right? For the xHCI Audio
>> Sideband xHCI capability, the driver should detect this capability
>> through the xHCI get extended capability. If this is not xHCI Audio
>> Sideband capability, we should properly clarify this in the
>> documentation and the naming of things to avoid any confusion.
> Sure, that's a good point.  It does still currently rely on utilizing the system memory for USB IO transfers.  I can add some comments and update some of the documentation to reflect that this is different. 

Hi Mathias,

Would it make sense to rename the APIs and driver to something other than "sideband" so that users don't get confused with the audio sideband that is mentioned above by Thinh?  How about using something like xhci-sec-intr to signify that this driver has APIs that will help support the use of xHCI secondary interrupters?

Thanks

Wesley Cheng

> Thanks
>
> Wesley Cheng
>
>> I believe your implementation still needs to provide the data to the
>> host controller through the system memory right? The xHCI Audio Sideband
>> capability may pass the data to the xHC other than the main memory.
>>
>> BR,
>> Thinh
>>
>>> +	  with audio class endpoints. This allows for an audio DSP to use
>>> +	  xHCI USB endpoints directly, allowing CPU to sleep while playing
>>> +	  audio.
>>> +
>>>  config USB_XHCI_TEGRA
>>>  	tristate "xHCI support for NVIDIA Tegra SoCs"
>>>  	depends on PHY_TEGRA_XUSB

