Return-Path: <linux-input+bounces-8193-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E149D5352
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 20:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DE42826C4
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 19:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2E31BD9EC;
	Thu, 21 Nov 2024 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mox8aOIc"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69D1AAE38;
	Thu, 21 Nov 2024 19:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732216374; cv=none; b=aEeXXHSxyJy3o/diGPB3MZQOcC2mCNP4bxWUdLBGjgjPSkEgaG2PmfTjbVstzMSd9PgM/xCkJxsClJspfDLJ+vOMtDFlHPAi1Cv9zVx8QewiH3f+Ub2r9iwlS/VZEpPWcN0NiuXNNoq36+ndtHpd2UWW6xeWXlp0PYL7taxFLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732216374; c=relaxed/simple;
	bh=5Bd7LzDbv3LnxTsz/uRdJOLzWHfUYMPl3aGPFxTFfrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/ThIUHXi6OFg1fd2Esg0si73ST1gXja22h6e1vlPxIEy36zCTvbEl3TyDWT6w1x+bOLUrpDKQSmX4i/hxBVcBdktwBHZAqW6JmnoKs/+rXPcQgrN3rkp1YPGbLKT0BRk0N88v/oflCnAv/P4vt/qKogKXHFPIxThNz8tunfvEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mox8aOIc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732216372; x=1763752372;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5Bd7LzDbv3LnxTsz/uRdJOLzWHfUYMPl3aGPFxTFfrU=;
  b=mox8aOIcfKD6XwNrfUHkLQlrTpUPKRgwwz8gbXFs2LcYRmlCM1J1/Mk7
   f/ybdkUnwISH7TLV57E6QtTSmJeH64azQACOAqWVQ0Hl8Cn2zSf8O2kcg
   qOiIwHXpcMxfRNlTz2wQ0fanpOwoXl0AuzmmEMqjTrqZvaDXgJlFwx8P4
   xLiPQzWJrOPw8ov5AjQPkEU8H0b/9xaJ7DERPmJJCbyxAhQN44B0RauqW
   8b2ytxyHAMwzfnhtSlK7huHR7/y0wDJu6DqaFfnbfEE5O9Q70Lt1yrKI3
   +oXkeYCeliqShpufZmP9KEnV6J4HD3R/oj+Js1gPWF2MVmDA9xOWfQ1Ow
   Q==;
X-CSE-ConnectionGUID: C6iJb40rTJCvncJ807hRMg==
X-CSE-MsgGUID: SSvVNgARRYynrqn2ko63gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36016362"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="36016362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 11:12:51 -0800
X-CSE-ConnectionGUID: oyr9oEs0QU+cFCfA4HYePQ==
X-CSE-MsgGUID: ACM/sc+ZRSe64iH80jUS9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="113631196"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2024 11:12:45 -0800
Message-ID: <17890837-f74f-483f-bbfe-658b3e8176d6@linux.intel.com>
Date: Thu, 21 Nov 2024 21:15:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 02/30] xhci: sec-intr: add initial api to register a
 secondary interrupter entity
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-3-quic_wcheng@quicinc.com>
 <9b86a2c9-de7f-46b7-b63d-451ebc9c87dd@linux.intel.com>
 <2384956c-7aae-4890-8dca-f12e9874709f@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <2384956c-7aae-4890-8dca-f12e9874709f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.11.2024 3.34, Wesley Cheng wrote:
> Hi Mathias,
> 
> On 11/20/2024 6:36 AM, Mathias Nyman wrote:
>> On 6.11.2024 21.33, Wesley Cheng wrote:
>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>
>>> Introduce XHCI sec intr, which manages the USB endpoints being requested by
>>> a client driver.  This is used for when client drivers are attempting to
>>> offload USB endpoints to another entity for handling USB transfers.  XHCI
>>> sec intr will allow for drivers to fetch the required information about the
>>> transfer ring, so the user can submit transfers independently.  Expose the
>>> required APIs for drivers to register and request for a USB endpoint and to
>>> manage XHCI secondary interrupters.
>>>
>>> Driver renaming, multiple ring segment page linking, proper endpoint clean
>>> up, and allowing module compilation added by Wesley Cheng to complete
>>> original concept code by Mathias Nyman.
>>>
>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>> Co-developed-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>> ---
>>>    drivers/usb/host/Kconfig          |  11 +
>>>    drivers/usb/host/Makefile         |   2 +
>>>    drivers/usb/host/xhci-sec-intr.c  | 438 ++++++++++++++++++++++++++++++
>>>    drivers/usb/host/xhci.h           |   4 +
>>>    include/linux/usb/xhci-sec-intr.h |  70 +++++
>>>    5 files changed, 525 insertions(+)
>>>    create mode 100644 drivers/usb/host/xhci-sec-intr.c
>>>    create mode 100644 include/linux/usb/xhci-sec-intr.h
>>>
>>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
>>> index d011d6c753ed..a2d549e3e076 100644
>>> --- a/drivers/usb/host/Kconfig
>>> +++ b/drivers/usb/host/Kconfig
>>> @@ -104,6 +104,17 @@ config USB_XHCI_RZV2M
>>>          Say 'Y' to enable the support for the xHCI host controller
>>>          found in Renesas RZ/V2M SoC.
>>>    +config USB_XHCI_SEC_INTR
>>> +    tristate "xHCI support for secondary interrupter management"
>>> +    help
>>> +      Say 'Y' to enable the support for the xHCI secondary management.
>>> +      Provide a mechanism for a sideband datapath for payload associated
>>> +      with audio class endpoints. This allows for an audio DSP to use
>>> +      xHCI USB endpoints directly, allowing CPU to sleep while playing
>>> +      audio.  This is not the same feature as the audio sideband
>>> +      capability mentioned within the xHCI specification, and continues
>>> +      to utilize main system memory for data transfers.
>>
>> This same API should be used for the hardware xHCI sideband capability.
>> We should add a function that checks which types of xHC sideband capability xHC
>> hardware can support, and pick and pass a type to xhci xhci_sec_intr_register()
>> when registering a sideband/sec_intr
> 
> Just to make sure we're on the same page, when you mention the term sideband capability, are you referring to section 7.9 xHCI Audio Sideband Capability in the xHCI spec?  If so, I'm not entirely sure if that capability relies much on secondary interrupters.  From reading the material, it just seems like its a way to map audio endpoints directly to another USB device connected to the controller? (I might be wrong, couldn't find much about potential use cases)

Yes, that is the one, 7.9 xHCI Audio Sideband Capability.

I had that in mind when I started writing the sideband API.
This is why registering a sideband and requesting a secondary interrupter
are done in separate functions.
The concept if still similar even if '7.9 Audio Sideband Capability' doesn't
need a secondary interrupter, we want to tell xhci driver/xHC hardware that
one connected usb device/endpoint handling is offloaded somewhere else.

I don't think we should write another API for that one just because more is
done by firmware than by xhci driver.

The only change for now would be to add some "sideband_type" parameter to
xhci_sec_intr_register(struct usb_device *udev, enum sideband_type), fail the
registration if isn't "software", and save the type in struct xhci_sec_intr

I'll add hardware sideband support (7.9 Audio Sideband) later, but it would be
nice to not change the API then.

The name change from sideband to sec-intr is a bit unfortunate with this in
mind. Was there some reason for it?

Thanks
Mathias

