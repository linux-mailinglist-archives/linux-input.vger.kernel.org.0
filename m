Return-Path: <linux-input+bounces-9218-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDAEA0FF21
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 04:19:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70581686B6
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 03:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB6B32309BE;
	Tue, 14 Jan 2025 03:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="abFR/VhJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C260230D07
	for <linux-input@vger.kernel.org>; Tue, 14 Jan 2025 03:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736824746; cv=none; b=heY8xrzQu55rzrkqyR9QbH3sURNO26T0DtIt9a38VydKIHu8RxM6+0u2eSjLjsQjGhkQPpPxe4NWWxTSCb0w8uG54mrXvVHRxShX2bZLYNDTgfdliGf64i66V2S8ZJROemnSqnKI78oau8z8uVdqgkGeZ/BUXhM8iuwqqi4AP5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736824746; c=relaxed/simple;
	bh=uTID3vHzldNR81/hAG6sEnebU7O23xVjHYe6fxtX7KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GbUlCr7mb1RjFnuf7Y13XchlL05hPuVnp2npQkH36x9vPhtcJC3vt4gNZN0G6EdSnKAUfOuoTIep9bdR8yBvnYs53fMuKAApGSZE6A7HmTJS2q0D7ULJy76B41IQNycLD05/Dr4IFvY1DzhfD4uTZCtygpeznqAmAfBuC2gBodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=abFR/VhJ; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4424108EDF96;
	Tue, 14 Jan 2025 04:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736824738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sV/aM7X0q/W34pKDTFOFT8r4xZ8E9+41t98+MO0reKw=;
	b=abFR/VhJuDHrLUjprflOB9LIVmqaErm/n+kIrFClbXm3DlJQEEj1B9r/kfTmr40q2DufvA
	iI5qEy41afo6VYq0ldShcuDA38Frfx57oXfzI8iFRBmdW3L9ArhRLffOQi9UFZHVWeIEM9
	0jq2xskh/klpNBku41VqhdTCkkUpbXlEhS/MJE6nBkEKH6yqEFwmp5gKPK+1ISrdQtadU2
	t/MLOsi3eJ0V5sPrOO3wNkh1q21haAl/eQ8r8NWVIqMNN3D+csVLvaYrKmFmr60qHHmCo2
	SwdIkjRRwP8Si0GzoIBXJk5sQiKfUJjOLIRZKRWr59c34NPX1x0aadKNlZZDbg==
Message-ID: <952a79a6-a13f-42b5-a311-13321076686e@denx.de>
Date: Mon, 13 Jan 2025 21:08:47 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: atmel_mxt_ts - support KoD knob
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Michael <mksgong@gmail.com>,
 Nick Dyer <nick@shmanahar.org>
References: <20241223190416.52871-1-marex@denx.de>
 <Z4VsxKJ56jqQnZGr@google.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z4VsxKJ56jqQnZGr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/13/25 8:43 PM, Dmitry Torokhov wrote:
> On Mon, Dec 23, 2024 at 08:03:24PM +0100, Marek Vasut wrote:
>> Add support for T152 KoD knob events [1]. The KoD touch controller
>> family supports up to two knobs attached to the glass. Each knob can
>> be turned in either direction and the touch controller processes the
>> event and reports the knob position for each knob. Each knob is also
>> pressure sensitive, the pressure is reported as well. Each knob also
>> supports center press and additional buttons, which are reported as
>> BTN_0/BTN_1 for the center press for each knob, and BTN_A/BTN_B for
>> the additional buttons on the knob.
>>
>> The knob is similar to Dell Canvas 27 knob already supported by
>> hid-multitouch, except it is non-removable and there can be up to
>> two such knobs .
>>
>> This implementation is extracted and heavily reworked from Atmel
>> downstream patchset work by Michael <mksgong@gmail.com> from [2]
>> branch master as of commit 9c77fbf32982 ("Merge pull request #35
>> from atmel-maxtouch/20240103_HA_protocol_fixes").
>>
>> [1] https://www.microchip.com/en-us/products/touch-and-gesture/maxtouch-touchscreen-controllers/kod-family
>> [2] https://github.com/atmel-maxtouch/maXTouch_linux
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
>> Note: I am not sure whether reporting the second wheel as GAS/REL_HWHEEL
>>        is the right thing to do, I don't think it is. Maybe there is some
>>        better way to handle multiple knobs ?
> 
> How about creating separate input devices for these?
This is what I had originally, but ... why ?

This is a single input device, touchscreen with up to two knobs , so why 
would it be multiple input devices ?

