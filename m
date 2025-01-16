Return-Path: <linux-input+bounces-9265-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD09EA1319C
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 04:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2BD7164C9D
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 03:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE57032C8E;
	Thu, 16 Jan 2025 03:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="VsWA0Pou"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E217C8B
	for <linux-input@vger.kernel.org>; Thu, 16 Jan 2025 03:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736996597; cv=none; b=jrv1dRpP6EI8h5DRePvWJRFYIqbUBz5qKlmbSh15NxY9K+pseVekGbzfV+xGWf1QE12bSpblzpCioAQlKJ+3cSXulrOIsq+YsJz2a8BIycKQirVqjaGMUV+MdHorWshcc5FltTIQnzy9f1CWDRk3/WqbFzxPu5iuDkaUDIMGBtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736996597; c=relaxed/simple;
	bh=sTCYd9FrzcvkOBZzpQuymEnRv172jU2b8Ck4kSbaANA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5dZ9dfSU2g5sAeWCRbIl7kfNcCmDX40+9IEU3jHno//kjKXEMKTUiWi3QDFRpyfoDRSD5qUAtVzrSTvsCVuHJ9iZA/QBJDJUoabHRrjrSw8H+ohnVHSPm3WjTmJ523ewaKS19ofBrJzNw0iTKsI1fBLhkRLVdUSydKYO/u8K94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=VsWA0Pou; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FB8E10936A0A;
	Thu, 16 Jan 2025 04:03:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736996592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbfZ84xe8xssB8VSMjhH0W3Nurds4ateVX+BSMGGOy4=;
	b=VsWA0Pouh4fckaFI/w8hPfTSv7+QRhN8C9PsK+lIJFbIcYMAqnjaLpqKkPEK1BRMJJhhsm
	pKgy4k1r/y20LJo5YURWa5FaBpNO2UPvmCj724/GTt+sp/QhCJP3IokiP56A/Kb4yvjx8d
	lcW8i0H4wmtHoy9Hh5kg/4X06/GiR7QzutcQP2jbLQ2zp1Kyd0OAGEa/1KRa9FT86Wbis8
	zXDDpDqjl2tVEiFaGjjaPhUifujcFmzvyE4cXA7pKFQwI/Y6S1lyrkNdybqDdRRVDp1jgR
	80krTfC47Yld6+V6xqEVTD8VhTmmdUUUac2+gVjqAOT1RBNNnBjpi2FOvC5OpQ==
Message-ID: <d43894eb-3a63-4da8-9f21-d50ec9b93c6c@denx.de>
Date: Thu, 16 Jan 2025 03:48:13 +0100
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
 <Z4VsxKJ56jqQnZGr@google.com> <952a79a6-a13f-42b5-a311-13321076686e@denx.de>
 <Z4haguYzh87Bz8hx@google.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <Z4haguYzh87Bz8hx@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/16/25 2:01 AM, Dmitry Torokhov wrote:
> On Mon, Jan 13, 2025 at 09:08:47PM +0100, Marek Vasut wrote:
>> On 1/13/25 8:43 PM, Dmitry Torokhov wrote:
>>> On Mon, Dec 23, 2024 at 08:03:24PM +0100, Marek Vasut wrote:
>>>> Add support for T152 KoD knob events [1]. The KoD touch controller
>>>> family supports up to two knobs attached to the glass. Each knob can
>>>> be turned in either direction and the touch controller processes the
>>>> event and reports the knob position for each knob. Each knob is also
>>>> pressure sensitive, the pressure is reported as well. Each knob also
>>>> supports center press and additional buttons, which are reported as
>>>> BTN_0/BTN_1 for the center press for each knob, and BTN_A/BTN_B for
>>>> the additional buttons on the knob.
>>>>
>>>> The knob is similar to Dell Canvas 27 knob already supported by
>>>> hid-multitouch, except it is non-removable and there can be up to
>>>> two such knobs .
>>>>
>>>> This implementation is extracted and heavily reworked from Atmel
>>>> downstream patchset work by Michael <mksgong@gmail.com> from [2]
>>>> branch master as of commit 9c77fbf32982 ("Merge pull request #35
>>>> from atmel-maxtouch/20240103_HA_protocol_fixes").
>>>>
>>>> [1] https://www.microchip.com/en-us/products/touch-and-gesture/maxtouch-touchscreen-controllers/kod-family
>>>> [2] https://github.com/atmel-maxtouch/maXTouch_linux
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> ---
>>>> Note: I am not sure whether reporting the second wheel as GAS/REL_HWHEEL
>>>>         is the right thing to do, I don't think it is. Maybe there is some
>>>>         better way to handle multiple knobs ?
>>>
>>> How about creating separate input devices for these?
>> This is what I had originally, but ... why ?
>>
>> This is a single input device, touchscreen with up to two knobs , so why
>> would it be multiple input devices ?
> 
> So as you can see it is hard to express the knobs purpose within a
> single input device. Additionally (as far as I understand) knobs are
> not connected to the touchscreen function but rather rotary encoders
> just happened to be mounted on the touchscreen. They are not considered
> contacts.

 From the touch controller perspective, they are contacts.

> Therefore I think it makes sense to report them as 2 separate input
> devices (maybe modeling after how drivers/input/misc/rotary-encoder.c
> does things).
Not really, the knobs also act as buttons, so the user might navigate a 
finger on the touch surface to point to an object, and turn or press the 
knob to trigger some action. This is similar to the Dell Canvas 27 knob 
already mentioned above, except that one was not glued to the glass, it 
was movable.

