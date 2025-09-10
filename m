Return-Path: <linux-input+bounces-14580-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D85B51506
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 13:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EC881C222EB
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 11:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E22730E0D9;
	Wed, 10 Sep 2025 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="St7YYxqr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050D81D5AC6;
	Wed, 10 Sep 2025 11:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502553; cv=none; b=QUgW81purSIWlSN0sWlPv/INMZMtqibIAKo8rlSEr/jOeeDBnU8nvsV4gGuqM1aVNrMaUFPLqEMhL7mQ2ibNh2sRI9wKCE6pqflZd6CIEu8yz9a97Ac6qvy+CsfUPU0jAiSqtRTnnB6VCQPgtAW5IltvdVCXSWnLV1tVJz2TIQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502553; c=relaxed/simple;
	bh=b1yDHlo4NkVRtzBInGR9cuXInx1UncWxnwPkowPXb8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgRWIfAE0qbGonkERiNgIk3yz5Bd2Sg8TwqFEQvmKWabLm/4tHCzALNFs8Bg3C7NryTyRxdos6VPVO1V+r+FsIQIBDxKRu6B1L4f+AmTo29J1u40/2FGpwHnQ6tQe3+0wL2l5t+FrpPhlbhAfSACroqiZ9voCnAr/rCrcYePoGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=St7YYxqr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDFDC4CEF0;
	Wed, 10 Sep 2025 11:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757502552;
	bh=b1yDHlo4NkVRtzBInGR9cuXInx1UncWxnwPkowPXb8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=St7YYxqrRTKf6UXLhIQhZEvEo4BvNygiv+4brYaMui16LL52yqubeoSycWR0QG4F1
	 MdZUULgvbVKP0LioLqzt+uzDieEfLeocgWJCYqPnw/CMVhTrjFi5osZlzsObtSvva/
	 KIIT0Q+bQNx6fwWW+u96Fm4vqv2tKYqd7VN6OiFuYR59zQOpQI7sGq/vFw1LiBo6o2
	 QaaqK1FC2NryY0ptOZoYLlVYVTnWBi6sNjOiGrEPP8Bdu4N25rGV2wZLxjhdokqFou
	 Bp1lxTxP3StT+UuuTBjHxXFb+3OGzPsyb97pK04q/NTWmbpOWAO3JnmJEcC78tfeK/
	 e9BuRqdgwiuqw==
Message-ID: <a6ea0b5d-7586-4529-bf91-d8b966aa986e@kernel.org>
Date: Wed, 10 Sep 2025 13:09:10 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: lg-g15 - Add support for Logitech G13.
To: "Leo L. Schwab" <ewhac@ewhac.org>
Cc: Kate Hsuan <hpa@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250814212641.197573-2-ewhac@ewhac.org>
 <7d356834-5795-4979-9f51-0ffcec52ae1d@kernel.org>
 <aLSntMknSv3lMarZ@ewhac.org>
 <8ae2cc92-5dfe-466d-95fd-da74309d7244@kernel.org>
 <2de88077-eb8d-44ad-a96a-5db889913cba@kernel.org>
 <aLiZbkKgIC8jIqE9@ewhac.org>
 <c12adb45-fa6d-4bb8-afd2-a02e3026d646@kernel.org>
 <aMESMcFLrzqrCdbq@ewhac.org>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aMESMcFLrzqrCdbq@ewhac.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10-Sep-25 7:52 AM, Leo L. Schwab wrote:
> On Mon, Sep 08, 2025 at 11:08:29PM +0200, Hans de Goede wrote:
>> There are 2 improvements which I would like to see:
>>
>> 1. When the backlight is turned on through the button, you
>> should pass g15_led->brightness to the notify() call rather
>> then LED_FULL. GNOME will show an OSD with the new brightness
>> value shown as a mini progress bar similar to how it shows
>> speaker volume when doing mute/unmute. This mini progress
>> bar should show the actual brightness being restored, not
>> always full brightness.
>>
> 	If g15_led->brightness is subsequently changed, should a new
> notify() call also be made with that new brightness, i.e. should
> `hw_brightness_changed` be made to track `brightness`?

No, hw_brightness_changed only track changes done independently
by the hw. sysfs writes should not call notify().

> Indeed, it looks
> like you do this in `lg_g15_leds_changed_work()`.

That is for the original G15 and G15-v2, where the buttion
cycles through a couple of backlight levels (IIRC). That work
only gets queued when we receive a button press notification
and then it *reads* the new brightness from the keyboard and
uses that for the notify().

That work does not get queued/used for normal sysfs writes.

>> 2. ATM if the backlight is turned off on the G13 when
>> the driver loads and then one of the buttons gets pressed
>> then a notify() will happen because the led_cdev.hw_brightness_changed
>> value of -1 will be different from the value of 0 in the
>> input-report. This notify will lead to an unwanted OSD
>> notification in GNOME, so this needs to be fixed.
>> IMHO the best fix would be to use:
>>
>> 	hid_hw_raw_request(..., HID_INPUT_REPORT, HID_REQ_GET_REPORT);
>>
>> at probe to get the input-report so that the driver will
>> actually now the backlight state at probe() time without
>> needing to wait for the first time the input-report is send.
>>
> 	Will give this a try.
> 
>> I'll wait for your G13 support to land first and then
>> rebase the G510 patch on top.
>>
> 	Roger that.

Regards,

Hans



