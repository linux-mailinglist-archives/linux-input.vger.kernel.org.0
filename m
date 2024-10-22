Return-Path: <linux-input+bounces-7623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7F9AB19F
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 17:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 348BF285668
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 15:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E251A0BC0;
	Tue, 22 Oct 2024 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlAbotyQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402AF85C5E;
	Tue, 22 Oct 2024 15:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729609459; cv=none; b=Ew5x7TSkhoCkvyL6hcbDibsw/rpZhXI3FiC+wtLMHVJujSW3a9m3hAQ8pzGKImrfpmLgTJAouWiQBJUrTSdy67lsEfLez13NOnYBcqp8GcZRjo6kL4RCqoOFmdfxBglip9/OYVWL9ePwBqSc5mb5eZnxHjSwW53O3B0H8qt//ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729609459; c=relaxed/simple;
	bh=QUUBW21t3BimnstQVgGZ0SBenbQzNgaGQZcFRj4mm8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IP8QphdTMuHcOH9BIOQmHLbXQNDhKunDNnWEgbg64WUXmb8Dpq7cLyKKd8WTQCyhLrqxd+Ddj6wmGvpOGutYtnaQQMn+8EoRc5ZYeGei46hreYoeUmBAjVJev5jJzsHAY8Qq9CozF3lbHCifH5CTh7+CLfev8OdJv16ppGM8SS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlAbotyQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729609458; x=1761145458;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QUUBW21t3BimnstQVgGZ0SBenbQzNgaGQZcFRj4mm8Y=;
  b=LlAbotyQHbEfEsioiJ3aQZ7TI9wfh7PQCpGxBC9h3LyU8IV+SMLrXkNs
   j1eTwNLqVKRog8k2HHSI62ZLo54/gPCpZLVUmkE4bWS4DCfHhpIZwq3h4
   1ATIwvylkm1QCfCl7FAu1lOTw5nTnB6J4HWIpjVf/NY3da0yxGRoDTJW5
   v57a5tWSWagvWzEaIFtvzZOOELaL7SIMVNvV70l8RXEMjq9nAiHsPMLrK
   ZroN1JbRJlO6cOPk4Yz2pNOI5KP6drmz1IDrhS8Xkuz06fCy7DginxC4l
   2v1KeTm+wFbSKG+85lhsdrXFB2tC1TY0ekePYvfBr1DHRDrxzqucSRemH
   A==;
X-CSE-ConnectionGUID: qkAPX3eSReqtCbTygba2Xw==
X-CSE-MsgGUID: yWmVD47TSXqDjIgq7AoTaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33079480"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="33079480"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:04:16 -0700
X-CSE-ConnectionGUID: t2EfxH96Ts+ZMKuBfhIFQA==
X-CSE-MsgGUID: JAHYnJKXTd6WFkKNAaIiYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="80072066"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53]) ([10.94.0.53])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 08:04:10 -0700
Message-ID: <8795c4ad-e3ac-47aa-92dd-f899042cefc0@linux.intel.com>
Date: Tue, 22 Oct 2024 17:04:07 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v29 01/33] xhci: support setting interrupt moderation IMOD
 for secondary interrupters
To: Greg KH <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.de>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, lgirdwood@gmail.com,
 tiwai@suse.com, krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 robh@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org,
 Mathias Nyman <mathias.nyman@linux.intel.com>
References: <20241015212915.1206789-1-quic_wcheng@quicinc.com>
 <20241015212915.1206789-2-quic_wcheng@quicinc.com>
 <2024101747-defog-squiggly-ef54@gregkh>
 <5847c380-75ce-492a-9a30-0899b7ebe98c@quicinc.com>
 <2024101824-hammock-elastic-8d38@gregkh> <87wmi02qcj.wl-tiwai@suse.de>
 <2024102240-gag-famished-245c@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <2024102240-gag-famished-245c@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/2024 4:02 PM, Greg KH wrote:
> On Tue, Oct 22, 2024 at 03:56:44PM +0200, Takashi Iwai wrote:
>> On Fri, 18 Oct 2024 07:52:35 +0200,
>> Greg KH wrote:
>>>
>>> On Thu, Oct 17, 2024 at 05:07:12PM -0700, Wesley Cheng wrote:
>>>> Hi Greg,
>>>>
>>>> On 10/16/2024 11:40 PM, Greg KH wrote:
>>>>> On Tue, Oct 15, 2024 at 02:28:43PM -0700, Wesley Cheng wrote:
>>>>>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>>
>>>>>> Allow creators of xHCI secondary interrupters to specify the interrupt
>>>>>> moderation interval value in nanoseconds when creating the interrupter.
>>>>>>
>>>>>> If not sure what value to use then use the xhci driver default
>>>>>> xhci->imod_interval
>>>>>>
>>>>>> Suggested-by: Wesley Cheng <quic_wcheng@quicinc.com>
>>>>>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>>>>>> Link: https://lore.kernel.org/r/20240905143300.1959279-13-mathias.nyman@linux.intel.com
>>>>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>>>>> ---
>>>>>>   drivers/usb/host/xhci-mem.c | 8 +++++++-
>>>>>>   drivers/usb/host/xhci.c     | 4 ++--
>>>>>>   drivers/usb/host/xhci.h     | 5 ++++-
>>>>>>   3 files changed, 13 insertions(+), 4 deletions(-)
>>>>> This is already in 6.12-rc1, which makes me confused as to what tree you
>>>>> made this series against.
>>>>
>>>> Sorry, I didn't fetch the latest changes from usb-next.
>>>
>>> It wasn't even usb-next, it was 6.12-rc1, so I don't know what tree you
>>> based this on :(
>>>
>>>> In this case, should I rebase and resbumit?
>>>
>>> As the series can't be applied as-is, probably.  But I think you might
>>> want to collect some acks from the sound people and xhci developers, as
>>> I can't do anything with this until they look at the changes.
>>
>> Honestly speaking, I couldn't follow fully the discussions about the
>> fundamental design -- IIRC, Pierre and others had concerns to the way
>> to manage the offload device via kcontrols.  Did we get consensus?
> 
> I don't think so.
> 
>> I believe that's the biggest obstacle in the audio side, i.e. what's
>> visible to users.  The kernel internals can be corrected at any time
>> later.
> 
> I would like to see that agreed on before I even look at the usb side.

My main concern is still that one USB audio device can be accessed via 
two different cards exposed in userspace. Usual USB one, and the one 
from device which does "offload". Suggested implementation achieves it 
by adding additional controls, which need to be set in specific way to 
achieve offload. Overall while I understand the mechanism, I'm not 
exactly convinced that it is the best way from end user point of view.

"Implementation" part in Documentation added in patch 19 shows how it 
looks in userspace now.

If you don't mind two sound cards being used to access same piece of HW, 
current implementation looks ok to me.

See also:
https://lore.kernel.org/linux-sound/75ffde3a-7fef-4c15-bfc8-87756e1c3f11@linux.intel.com/
where I described how I would prefer it to look.

