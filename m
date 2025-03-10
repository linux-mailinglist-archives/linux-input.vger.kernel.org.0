Return-Path: <linux-input+bounces-10683-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4C4A591A6
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 11:48:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419C1167E6E
	for <lists+linux-input@lfdr.de>; Mon, 10 Mar 2025 10:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BBE227B88;
	Mon, 10 Mar 2025 10:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="P3NUyQxt"
X-Original-To: linux-input@vger.kernel.org
Received: from ixit.cz (ip-89-177-23-149.bb.vodafone.cz [89.177.23.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C41226868;
	Mon, 10 Mar 2025 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.177.23.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741603640; cv=none; b=WD1GwOLlpI+6jcaXUGIpLy9qu2cwHLf0I7re4YAXLIrCVdqnAgQHsUbaxHzjPbP3Wga8q+eR268n4QXBSpFcs1XmJByV7B2M9uaFitSlIFHwoVeoRxJ+sI3sCclzPV1f8670FRl9oKp+CahnFYgIUagjW8TTvXt4IG1BpmYG9hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741603640; c=relaxed/simple;
	bh=bf3rL+TDSf5P368lHU4ralf2rfLpeitkXg/3WIk0R3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPb/jZzRhCVePoXFFisttZ+lEhSH9knrEHG6xLCYHU4JZQ1Uw72yIjXv91UW09HtQG/kLfq5KqdjoIz9vWcrEkWiZLY/rtIpeCPobeaFyvAbHBJ3uesaxr1CEJbWTMwatyax6O9/mh/dPHjqXDV7SPIk2kwgEV5Mnxfeh4jAxb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=P3NUyQxt; arc=none smtp.client-ip=89.177.23.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [192.168.2.71] (office.icewarp.com [82.113.48.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 819D8166881;
	Mon, 10 Mar 2025 11:47:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1741603633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nzj0btXvOi8OnL6w5Yyd/H9VmA52rQ1XlqhNW4xR/FM=;
	b=P3NUyQxtYCy6NFcez5KefaHxwctGzP9vJ1N6kbsBbkhzOGYQbnjVNLCBDDy7ud0RZFdmhE
	depWdrQtJyO1GhuOIza+KtebFCHRsGYaPl1gpXMCMz52D30xvFwZ72CDcatn/FF1dad0Er
	RzwtgD8TMNxBORFEEl0Nx7KxGzIWASs=
Message-ID: <eb4aec7f-3c2f-4c6b-aa84-7798d7ff57a8@ixit.cz>
Date: Mon, 10 Mar 2025 11:47:12 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v3 0/7] Subject: [PATCH v3 0/7] Input: synaptics-rmi4: add
 quirks for third party touchscreen controllers
To: Caleb Connolly <caleb.connolly@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, methanal <baclofen@tuta.io>
References: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
 <53224260-4f3a-447b-9e7b-f68c5c4ba05e@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
In-Reply-To: <53224260-4f3a-447b-9e7b-f68c5c4ba05e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Caleb,

I'm very sorry about that. Next time I include your patches in the 
series I'll definitely send you heads up.

David

On 10/03/2025 11:04, Caleb Connolly wrote:
> Hi David,
> 
> Please at least give me a heads up if you're going to resend a patch 
> series of mine. I understand it's an old series but I don't think that 
> courtesy is too much to ask.
> 
> On 3/8/25 14:08, David Heidelberg via B4 Relay wrote:
>> With the growing popularity of running upstream Linux on mobile devices,
>> we're beginning to run into more and more edgecases. The OnePlus 6 is a
>> fairly well supported 2018 era smartphone, selling over a million units
>> in it's first 22 days. With this level of popularity, it's almost
>> inevitable that we get third party replacement displays, and as a
>> result, replacement touchscreen controllers.
>>
>> The OnePlus 6 shipped with an extremely usecase specific touchscreen
>> driver, it implemented only the bare minimum parts of the highly generic
>> rmi4 protocol, instead hardcoding most of the register addresses.
>> As a result, the third party touchscreen controllers that are often
>> found in replacement screens, implement only the registers that the
>> downstream driver reads from. They additionally have other restrictions
>> such as heavy penalties on unaligned reads.
>> This series attempts to implement the necessary workaround to support
>> some of these chips with the rmi4 driver. Although it's worth noting
>> that at the time of writing there are other unofficial controllers in
>> the wild that don't work even with these patches.
>> We have been shipping these patches in postmarketOS for the last several
>> months, and they are known to not cause any regressions on the OnePlus
>> 6/6T (with the official Synaptics controller), however I don't own any
>> other rmi4 hardware to further validate this.
>>
>> ---
>> Changes since v2:
>> - reworded dt-bindings property description
>> - fixed the rmi_driver_of_probe definition for non device-tree builds.
>> - fixed some indentation issues reported by checkpatch
>> - change rmi_pdt_entry_is_valid() variable to unsigned
>> - Link to v2: https://patchwork.kernel.org/project/linux-input/ 
>> cover/20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org/
> 
> Please use lore links
>>
>> Changes since v1:
>> - Improve dt-bindings patch (thanks Rob)
>> - Add missing cast in patch 5 to fix the pointer arithmetic
>> - Link to v1: https://lore.kernel.org/r/20230929-caleb-rmi4-quirks- 
>> v1-0-cc3c703f022d@linaro.org
>>
>> ---
>> Caleb Connolly (2):
>>        dt-bindings: input: syna,rmi4: document syna,pdt-fallback-desc
>>        Input: synaptics-rmi4 - handle duplicate/unknown PDT entries
>>
>> methanal (5):
>>        Input: synaptics-rmi4 - f12: use hardcoded values for 
>> aftermarket touch ICs
>>        Input: synaptics-rmi4 - f55: handle zero electrode count
>>        Input: synaptics-rmi4 - don't do unaligned reads in IRQ context
>>        Input: synaptics-rmi4 - read product ID on aftermarket touch ICs
>>        Input: synaptics-rmi4 - support fallback values for PDT 
>> descriptor bytes
>>
>>   .../devicetree/bindings/input/syna,rmi4.yaml       |  18 +++
>>   drivers/input/rmi4/rmi_driver.c                    | 140 +++++++++++ 
>> ++++++----
>>   drivers/input/rmi4/rmi_driver.h                    |   8 ++
>>   drivers/input/rmi4/rmi_f01.c                       |  14 +++
>>   drivers/input/rmi4/rmi_f12.c                       | 117 +++++++++++ 
>> ++----
>>   drivers/input/rmi4/rmi_f55.c                       |   5 +
>>   include/linux/rmi.h                                |   3 +
>>   7 files changed, 258 insertions(+), 47 deletions(-)
>> ---
>> base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
>> change-id: 20250308-synaptics-rmi4-c832b2f73ceb
>>
>> Best regards,
> 

-- 
David Heidelberg


