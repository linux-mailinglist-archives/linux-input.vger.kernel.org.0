Return-Path: <linux-input+bounces-15740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA8C0EF85
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 16:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00469189EE81
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 15:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4E32D94BB;
	Mon, 27 Oct 2025 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XE2hhZen";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Qjrs3RpJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F86749C;
	Mon, 27 Oct 2025 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761579108; cv=none; b=MZGtVn3dXUFak3sCO+O/Bmib9evc7SNEUmx+Hq+O0OYmnFgi5mb/dlpfgwhh0mNkVaMQi8+XV3VFw9RWanimHwYrQp+Jng2ERwIfHxI+ZshPU1XPjUw57HBGTIpgRIBSnyJI8fgvfxQOwk9NrSV2wt0QZCpZQ0gB2eBDaYSqrEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761579108; c=relaxed/simple;
	bh=ApQXkGpy3deKSOQnzGaYJWckYKHxv04pVoEKfKOXXVc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eIyDH3rkr/8bsjuC1p8KA/oPdNdxP5ttvmD7lolvrByox5xtXnlhN39+el7CyZQwyU91ZwR2u90I2UWY1dCJbS7TmH3XASzzkG58Lf6X45OYB5KhKVBscG3Gnkrhu3/aQhwj+VFBGoZLPcILcEEVIvLfewobEFJ83gsrFgzHvt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XE2hhZen; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Qjrs3RpJ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1761579101; bh=Ma2tFaAXhGqYoaas5pzi1lq
	xVN9PzjjFxzo60jRils4=; b=XE2hhZenokHhB5mitAMcs7rFqsWhPYWs8tLLDDb8FfSwx4dXPf
	tn8iPbpCKQuNL9rC/1LRQpwDIMmrdAlVoMIjQhq2H055CsVZiozAQf3aC0anHrlGWhQIDmzzBVp
	AKbFMlauBPHzJFTjRULfDp2wYAmYPN5TIfKXngPP4mYlzkPg9tDMRKMPdiVyTMfBHBp/4iqw/5Q
	oxsLgPATazYkapYtqRt9D/PFcI7rehBTVfTbJwcyALap3QueLruuMVrC81ms+r1OpELhwwf38oi
	RMzV/rDgIRphOU0OwmC3kPkGjHmhBB6ocevMOp002SvEN9Vyuf5CnBh/FDdr7q9A09w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1761579101; bh=Ma2tFaAXhGqYoaas5pzi1lq
	xVN9PzjjFxzo60jRils4=; b=Qjrs3RpJZEP0hSm6zikOR4bbl7Qp0lj3TDSoopg31a4MThNCNb
	KMdLN0+XGbrd1dvbaPHIzmawUTwAFMd2n6DA==;
Message-ID: <3fb8a0d7-a135-41b8-9a40-24df02008dca@mainlining.org>
Date: Mon, 27 Oct 2025 16:31:40 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/3] Input: add initial support for Goodix GTX8
 touchscreen ICs
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@mainlining.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20250918-gtx8-v1-0-cba879c84775@mainlining.org>
 <4a22b05d-24f8-44dc-affa-5cc28201fb53@linaro.org>
Content-Language: en-US
From: Jens Reidel <adrian@mainlining.org>
In-Reply-To: <4a22b05d-24f8-44dc-affa-5cc28201fb53@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/27/25 15:59, Neil Armstrong wrote:
> Hi,
> 
> On 9/18/25 16:02, Jens Reidel wrote:
>> These ICs support SPI and I2C interfaces, up to 10 finger touch, stylus
>> and gesture events.
>>
>> This driver is derived from the Goodix gtx8_driver_linux available at
>> [1] and only supports the GT9886 and GT9896 ICs present in the Xiaomi
>> Mi 9T and Xiaomi Redmi Note 10 Pro smartphones.
>>
>> The current implementation only supports Normandy and Yellowstone type
>> ICs, aka only GT9886 and GT9896. It is also limited to I2C only, since I
>> don't have a device with GTX8 over SPI at hand. Adding support for SPI
>> should be fairly easy in the future, since the code uses a regmap.
> 
> You didn't explain why you didn't integrate with goodix_berlin or at least
> try to reuse part of the code.
> 
> Neil
> 

Hi Neil,

I've taken a lot of inspiration from the goodix_berlin driver, but the 
Berlin and GTX8 series of touchscreen ICs differ quite a bit. The driver 
architecture is the same overall, i.e. the power-up sequence and general 
concepts are the mostly same, but it is very clear that they are 
different generations when looking at it in more detail.

Some of the differences:
- There is no equivalent to the bootoption reg that I can find in the 
public GTX8 drivers
- Firmware version struct layout is different yet again
- GTX8 does not expose IC information at runtime as far as I can tell
- The checksum method differs yet again
- The vendor driver reads only 1 touch upfront rather than 2
- Register addresses are 16-bit on GTX8 and 32-bit on Berlin
- Firmware requests don't appear to really exist on GTX8

 From what I can tell, the evolution seems to be:
Normandy -> Yellowstone -> Berlin
since Normandy and Yellowstone are already quite different (especially 
with the way checksums work) and Yellowstone has a couple of things 
(checksum, fw_version) that appear similar to Berlin series ICs.

I've tried to make the Berlin driver work for GTX8 ICs before, but 
they're so different (and I lack documentation for registers to perhaps 
make some parts work on GTX8) that I'd rather support these ICs in a new 
and tiny driver. I hope that makes sense. I took heavy inspiration from 
the Berlin driver, but the only parts that are really common between 
them are very trivial things like e.g. the input dev config or power on, 
which I don't think are worth putting in a separate header.

Best regards,
Jens
>>
>> Support for advanced features like:
>> - Firmware updates
>> - Stylus events
>> - Gesture events
>> - Nanjing IC support
>> is not included in current version.
>>
>> The current support requires a previously flashed firmware to be
>> present.
>>
>> As I did not have access to datasheets for these ICs, I extracted the
>> addresses from a couple of config files using a small tool [2]. The
>> addresses are identical for the same IC families in all configs I
>> observed, however not all of them make sense and I stubbed out firmware
>> request support due to this.
>>
>> [1] https://github.com/goodix/gtx8_driver_linux
>> [2] https://github.com/sm7150-mainline/goodix-cfg-bin
>>
>> Signed-off-by: Jens Reidel <adrian@mainlining.org>
>> ---
>> Jens Reidel (3):
>>        dt-bindings: input: document Goodix GTX8 Touchscreen ICs
>>        Input: add support for Goodix GTX8 Touchscreen ICs
>>        MAINTAINERS: add an entry for Goodix GTX8 Touchscreen driver
>>
>>   .../bindings/input/touchscreen/goodix,gt9886.yaml  |  71 +++
>>   MAINTAINERS                                        |   7 +
>>   drivers/input/touchscreen/Kconfig                  |  15 +
>>   drivers/input/touchscreen/Makefile                 |   1 +
>>   drivers/input/touchscreen/goodix_gtx8.c            | 562 +++++++++++ 
>> ++++++++++
>>   drivers/input/touchscreen/goodix_gtx8.h            | 137 +++++
>>   6 files changed, 793 insertions(+)
>> ---
>> base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
>> change-id: 20250918-gtx8-59a50ccd78a5
>>
>> Best regards,
> 

