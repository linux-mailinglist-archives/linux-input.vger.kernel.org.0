Return-Path: <linux-input+bounces-12803-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD224AD4DFD
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 10:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F3A417B429
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 08:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD28E2356C4;
	Wed, 11 Jun 2025 08:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="xqcG5OVM"
X-Original-To: linux-input@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2512CD8B;
	Wed, 11 Jun 2025 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629415; cv=none; b=FGXLc2XW8LzJ+OYUVVlPLfUxW2OpWl5QFx+jPDMwtIa/N6O/QbC/WFCr9K5r87bAP8coFagEqCXBGrvYSE0BKKBs4ccs7j1/JipEeui5NkYwnu1Cfo+G5sF2NQxMWaIEE00GVwwDaSlXiiqI5QM1R7XFDdp2pwr67LiA8S56XiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629415; c=relaxed/simple;
	bh=0TD+Te+EnncVRspXln2SukbmA0OLeKLM5C/ckAVZztE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=joJugFDwAJtu7fZMWXI1dEnfH/wUd3c+YG9ExCGW2lWW1hoAuzwSaxtjidVp/dfuXxVgwnDFEZdvIabHbZJC4vX/1PDyQH5drmqhximNzFfCkMo/1uzcG1j8gnNzisalGMUwgiWVBQtadpNDzQaAWkcTOViGUhN6CnAMtSwAHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=xqcG5OVM; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [192.168.2.138] (cst-prg-45-116.cust.vodafone.cz [46.135.45.116])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 83EF316016B;
	Wed, 11 Jun 2025 10:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1749629402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4rFoo6RFf3f3af4Ho4HRqf2Uwh5bvZe2+nsQbsMKIbA=;
	b=xqcG5OVM79d+hLIWyJFRduP7nJvmm+vCTBxrrJqQyol2Oi2HCNs94SMs6EP5QvXtM1TL/T
	pjKCqLiXHGMbKwy/g9fVgehLfituVEcLRe9/0t/eiYhKJacqdkzH8IW7JoLYee4nIKze1b
	KfphvCKL4/MhBRF+B8zsQuIGd8OUGng=
Message-ID: <72689fa4-cb6d-4299-be29-2b7990a1c365@ixit.cz>
Date: Wed, 11 Jun 2025 10:10:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] Input: synaptics-rmi4 - add quirks for third party
 touchscreen controllers
From: David Heidelberg <david@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kaustabh Chakraborty <kauschluss@disroot.org>, Rob Herring
 <robh@kernel.org>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vincent Huang <vincent.huang@tw.synaptics.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Conor Dooley <conor+dt@kernel.org>
References: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
 <d9bac31d-ad73-4d40-9e6b-7397dd5f5b23@ixit.cz>
Content-Language: en-US
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <d9bac31d-ad73-4d40-9e6b-7397dd5f5b23@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Dmitry,

is there anything else I should adjust to get these fixes merged?

Thank you
David

On 03/05/2025 16:02, David Heidelberg wrote:
> Kind ping on the series.
> 
> When the series is considered solid, it will improve Linux usability on 
> lower-quality touchscreen replacements (including those from other 
> vendors and models) outside of our Snapdragon 845 downstream fork.
> 
> Thank you
> David
> 
> On 10/04/2025 16:28, David Heidelberg via B4 Relay wrote:
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
>> years, and they are known to not cause any regressions on the OnePlus
>> 6/6T (with the official Synaptics controller), however I don't own any
>> other rmi4 hardware to further validate this.
>>
>> ---
>> Changes in v5:
>> - Removed -i2c suffix from rmi4-s3706b-i2c (Krzysztof).
>> - Link to v4: https://lore.kernel.org/r/20250402-synaptics-rmi4- 
>> v4-0-1bb95959e564@ixit.cz
>>
>> Changes in v4:
>> - Replaced patch "dt-bindings: input: syna,rmi4: document syna,pdt- 
>> fallback-desc"
>>    with patch documenting specific touchscreen model used in OnePlus 6 
>> and 6T.
>> - Fixed zero electrode return code (Dmitry).
>> - Switched the duplicate detection algo to bitmap (Dmitry).
>> - Optimized rmi_device_platform_data struct to avoid unnecessary
>>    padding.
>> - Changed fallback_size from int to unsigned int.
>> - Changed SoB from nickname and old address (methanal 
>> <baclofen@tuta.io>) to
>>    Kaustabh Chakraborty <kauschluss@disroot.org>.
>>    Verified ownership through the sdm845 chatroom on Matrix.
>> - Link to v3: https://lore.kernel.org/r/20250308-synaptics-rmi4- 
>> v3-0-215d3e7289a2@ixit.cz
>>
>> Changes in v3:
>> - reworded dt-bindings property description
>> - fixed the rmi_driver_of_probe definition for non device-tree builds.
>> - fixed some indentation issues reported by checkpatch
>> - change rmi_pdt_entry_is_valid() variable to unsigned
>> - Link to v2: https://lore.kernel.org/all/20230929-caleb-rmi4-quirks- 
>> v2-0-b227ac498d88@linaro.org
>>
>> Changes in v2:
>> - Improve dt-bindings patch (thanks Rob)
>> - Add missing cast in patch 5 to fix the pointer arithmetic
>> - Link to v1: https://lore.kernel.org/r/20230929-caleb-rmi4-quirks- 
>> v1-0-cc3c703f022d@linaro.org
>>
>> ---
>> Caleb Connolly (1):
>>        Input: synaptics-rmi4 - handle duplicate/unknown PDT entries
>>
>> David Heidelberg (1):
>>        dt-bindings: input: syna,rmi4: Document syna,rmi4-s3706b
>>
>> Kaustabh Chakraborty (5):
>>        Input: synaptics-rmi4 - f12: use hardcoded values for 
>> aftermarket touch ICs
>>        Input: synaptics-rmi4 - f55: handle zero electrode count
>>        Input: synaptics-rmi4 - don't do unaligned reads in IRQ context
>>        Input: synaptics-rmi4 - read product ID on aftermarket touch ICs
>>        Input: synaptics-rmi4 - support fallback values for PDT 
>> descriptor bytes
>>
>>   .../devicetree/bindings/input/syna,rmi4.yaml       |  11 +-
>>   drivers/input/rmi4/rmi_driver.c                    | 124 +++++++++++ 
>> ++++++----
>>   drivers/input/rmi4/rmi_driver.h                    |  10 ++
>>   drivers/input/rmi4/rmi_f01.c                       |  14 +++
>>   drivers/input/rmi4/rmi_f12.c                       | 117 +++++++++++ 
>> +++-----
>>   drivers/input/rmi4/rmi_f55.c                       |   5 +
>>   include/linux/rmi.h                                |   3 +
>>   7 files changed, 234 insertions(+), 50 deletions(-)
>> ---
>> base-commit: f0a16f5363325cc8d9382471cdc7b654c53254c9
>> change-id: 20250308-synaptics-rmi4-c832b2f73ceb
>>
>> Best regards,
> 

-- 
David Heidelberg


