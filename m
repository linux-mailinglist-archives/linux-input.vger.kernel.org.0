Return-Path: <linux-input+bounces-16450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA6C9D1B1
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 22:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B0693A5281
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 21:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7CE20C477;
	Tue,  2 Dec 2025 21:41:02 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12578A55;
	Tue,  2 Dec 2025 21:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764711661; cv=none; b=f7CMeNFydlk9iArDIjupkfgSygLasMaTexUFu2di8Nz706by0YO1Q2L8JvMmbFCx9q2ba61fY4PyYAZEHtnDhtSR8TlCcx+tLEEp0j6kCYx+0uqbHlStzk0mi7ksSTHe8XelIEn0lMP3b6i0DcHxLKj7jgILFxFnz/rB3wpXY8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764711661; c=relaxed/simple;
	bh=0jtPRjdM/bDQIbG1lKWJQ/iamehLa4kHyd2Dw5LG7Sk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdrsvvxiSM/9y0R/0Tz72u9KT4Ef09xvZvtQF7BH+f1ZPvnMhW4+6L9LfhePEEw76f3gz1Y3fapZEeWt6XwA7Qv+6DaLuWlLbl/g2DGrK9t+iW/LaHCHVfPBEWER9EeQXcOYvGaZc3jWZPLCpto1f4BS3DoJaZyBTLTcSVz87J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-193-224-155.hsd1.wa.comcast.net [71.193.224.155])
	by host11.cruzio.com (Postfix) with ESMTPSA id 6E3461ED5553;
	Tue,  2 Dec 2025 13:40:52 -0800 (PST)
Message-ID: <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
Date: Tue, 2 Dec 2025 13:40:49 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: validate report length and constants
To: Davide Beatrici <me@davidebeatrici.dev>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.com
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
 <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/2/25 11:41 AM, Davide Beatrici wrote:
> Thank you very much for your feedback!
> 
> I can send you a new identical device for testing if you would like.
> 

Can you supply the Device, Configuration, and Report Descriptors?

Thanks,
Terry

>> Can you show us what packets are emitted?
>>
>> If it's a firmware bug, we better have a specific driver for it could
>> be a HID-BPF program that just filters out the unwanted reports.
>>
>> Also, how does Windows behave with this mouse? Does it need a special
>> driver?
> 
> Sorry, I should've mentioned the malformed packet also shows up on Windows,
> but is seemingly ignored because there appear to be no side effects whatsoever.
> 
> No special driver needed, it's detected as a standard HID mouse.
> 
> WireShark capture:
> https://dl.houseof.software/misc/atk_x1_se_malformed_packet.pcapng
> 
> Packet screenshot:
> https://dl.houseof.software/misc/atk_x1_se_malformed_packet.png
> 
>> Looks like there is something wrong either in the report descriptor of
>> this mouse, either in the emitted reports.
> 
> Definitely. I have already informed the manufacturer, who confirmed the mouse
> has only been tested on Windows.
> 
> My inquiry was forwarded to their R&D team, hopefully a firmware update will
> be released soon.
> 
>> Yep, this is on purpose because Miscrosoft's own driver works that way
>> and many HID devices do not bother to mark the non constant bits as
>> data. So if you enforce the spec here, you'll break a numerous of
>> devices unfortunatelly.
> 
>> Ouch. If I read you correctly, you are rejecting the entire report if a
>> constant field is not 0. It is common for constant fields to be just
>> garbage (whatever is in the memory, because writing firmware is hard),
>> so even if we were to accept this patch, this would break even more
>> devices :(
> 
>> I am pretty sure the HID selftests will fail with this patch applied,
>> because there are probably a couple of devices there with the "non
>> constant" behaviour.
> 
> Oh, in that case let's just drop that part from the patch, since it's
> actually not altering the behavior with this specific device.
> 
> The malformed packet is detected and rejected by two checks:
> 
> Malformed report: raw_len=1 payload_len=1 expected=8 (ID 0)
> Malformed report: const slice OOB (bit_off 8, len 8)
> 


