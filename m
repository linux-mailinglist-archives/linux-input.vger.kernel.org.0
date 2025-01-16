Return-Path: <linux-input+bounces-9272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C6FA13D60
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 16:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0EAC18887A9
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 15:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71DD22B8C0;
	Thu, 16 Jan 2025 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aoFBSnDx"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90BE143736;
	Thu, 16 Jan 2025 15:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737040473; cv=none; b=HoAvK5XAJyFYBUtEB07Qh7J1oxya3sD+hy316SIM9JaeHIuMblaI3O0khYhvI5nAi7jProvzLmUX5+XTLHzvviqwlAUpsVg6iWtTCAL/ZSiScSNVXsAJC/HqH87Otddj9J5sDTyWGi7nSVicetrTLNqnJ5F2xJ/0/5dV8UZbdtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737040473; c=relaxed/simple;
	bh=fbszka0tPBCbCjcvS0LtJnFtvhlsh3ZDL/6L4Hk4zLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loKB9BEmd9bGJMEyAJp+mkd9N5GZMn6jsl1ZZyuE/enmMrq55ilqIl/dL6Fz0vm6vEPStkgX+utxLUz5E8hDweFTyJc3jtOnZdP7onCI1YeZLskqeJY6yF4yGK9oYV6UMhjO8I8WNdctKe0udkmDLjbfFyXdusSCmIUXmLDfEeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aoFBSnDx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737040472; x=1768576472;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=fbszka0tPBCbCjcvS0LtJnFtvhlsh3ZDL/6L4Hk4zLA=;
  b=aoFBSnDxovofjxzmTcvHkiFN/84bZFFYKPToJpS0D7aZz9KaUJLb7Gmx
   kIxp8OTD9r2i26c5/pVP9aImAcG6wibMozeT7XGsv59gryANIK0Qkjy9s
   QJTp+SOCLg907ewq1udKM0zHVZFJmr9EDi+rwSCFPYGTanaiGXCOjvI+M
   wJcHgKCrkyyuNtE388FhStii1eugSn1z6dE0SfukSAXzMkowQBs7f0btW
   V6g4VrVzE6qZ2gw5p6pqAEtb1yBc8JyeNTQc85r251hcnu8Akp0ulXGbw
   hPGC3OR8+dCzywNHMJQkOvf8fOmNS+QnwJVcdPTVqDVeQEjNOOVSutRpV
   g==;
X-CSE-ConnectionGUID: rCl6PV4QQZuHyiX9Ui9qHQ==
X-CSE-MsgGUID: GCghwdibRBCk0z5vPIyWIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="41108176"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; 
   d="scan'208";a="41108176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 07:14:31 -0800
X-CSE-ConnectionGUID: 7h+KYAVNRgmjiKhOgFc29Q==
X-CSE-MsgGUID: TwHvetFUS7qhDn8lfhZleQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110628673"
Received: from unknown (HELO [10.237.72.199]) ([10.237.72.199])
  by orviesa005.jf.intel.com with ESMTP; 16 Jan 2025 07:14:26 -0800
Message-ID: <45a40d3e-e534-4704-a928-cb36682133dc@linux.intel.com>
Date: Thu, 16 Jan 2025 17:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v32 01/32] usb: host: xhci: Repurpose event handler for
 skipping interrupter events
To: Wesley Cheng <quic_wcheng@quicinc.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Thinh.Nguyen@synopsys.com, broonie@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
 gregkh@linuxfoundation.org, krzk+dt@kernel.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com, robh@kernel.org,
 srinivas.kandagatla@linaro.org, tiwai@suse.com
References: <20250113143632.63c52d74@foxbook>
 <f8a9e454-72f4-4979-b29d-109700b2a204@quicinc.com>
 <20250114150847.1c3c9ebe@foxbook>
 <5d5e9ba4-d544-416e-b57b-dc5c8692b737@quicinc.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <5d5e9ba4-d544-416e-b57b-dc5c8692b737@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.1.2025 22.42, Wesley Cheng wrote:
> Hi Michal,
> 
> On 1/14/2025 6:08 AM, Michał Pecio wrote:
>> Thanks, I think I now see how this is meant to work.
>>
>>
>> Cover leter mostly discusses the ALSA side of things, but not low level
>> details of xHCI operation, such as who will be ringing doorbells and
>> how, handling IRQs, updating event ring dequeue, or handling halted EPs.
>>
>> So for the record, as far as I see:
>> 1. There is no API for ringing doorbells or even getting a pointer,
>>     the coprocessor needs to have its own access. Fair enough.
>> 2. Same for event ring dequeue, but the driver must clean up leftover
>>     unacknowledged events after sideband operation stops.
>> 3. Linux IRQ handler never needs to worry about sideband interrupts.
>> 4. Resetting halted endpoints is not implemented at all, I think?
>>     So this code is currently mostly useful with isochronous.
> 
> 
> Yep, all your points about the code with respects to the xHCI perspective is correct.
> 
> 
>>
>> And the 'skip_events' flag only exists to enable ring cleanup when the
>> interrupter is removed? In such case I think it's overkill.
>>
>> The code would be simpler and its intent more visible if 'skip_events'
>> were a new parameter of xhci_handle_events(). Existing IRQ would call
>> the function normally, while xhci_skip_sec_intr_events() would use the
>> new parameter to suppress event handling in this one special case.
>>
>> It would be immediately clear that skipping only applies on removal.
>>
>> You could completely get rid of PATCH 01/32 because 02/32 would no
>> longer need to set this flag on the interrupter, and the 'if' branch
>> adedd by 01/32 could go into 03/32 where it logically belongs.
>>
>> Just a suggestion. I simply don't see any need to have a flag which
>> causes events on a ring to always be skipped as a matter of policy.
>> Your code doesn't seem to require it. Probably nobody ever will.

Yes, this should works as well, and is maybe a bit cleaner than current
flag approach.

>>
> 
> In my previous discussions with Mathias, I think the plan was that he wanted it to be built in a way where we should be able to accommodate a use case where the secondary interrupter was going to be actually handled by the Linux side.  This is why the skip_events is populated/defined by the xHCI sideband calls, so that we can differentiate between the secondary interrupter use cases.  Although, it is the correct assumption that this series doesn't actually implement that functionality.
> 

Idea is to support xhci virtualization at some point, but also benefit from
moving noisy devices with a lot of events away from filling up the primary
event ring.

Once a usb device gets its own xhci secondary interrupter with a dedicated
event ring for transfer events, and its own MSI/MSI-X interrupt with dedicated
interrupt handler, it is easier to support xhci virtualization.

In short, support passing one USB device to a virtual machine client.

But this is out of scope for this series, so flag or parameter will do.

For this "vendor" sideband case we use the secondary interrupter to prevent
xCH controller from triggering interrupts for this device. CPU can
"sleep" while the audio chip reads and writes TRBs on transfer rings,
and  polls dedicated event ring for transfer events.

Thanks
-Mathias


