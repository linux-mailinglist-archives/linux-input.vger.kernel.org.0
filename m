Return-Path: <linux-input+bounces-13624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4814B0D24C
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 09:04:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E9B17775A
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 07:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C88C28A1DF;
	Tue, 22 Jul 2025 07:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z1WjXliL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C5288C80;
	Tue, 22 Jul 2025 07:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753167880; cv=none; b=AAf6hg3KiQ1EMEyoGM0DVgp2cdIFij/O+8bLp0seIYcMxz3RrD2evveHdS0qDJyiRX33FRbb/Cuh1hvISTRN3ytQYRUhiyoO+yq5gyavrtz4STe2FXOTjIvzWA6UHHd072qFBzT7qeN1zLw37OZvWe3V+7Dsbf+uYaS80cGUC9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753167880; c=relaxed/simple;
	bh=gYoa7W18uiTzGym1uVGYEWQ4lu4rqpNQhQZViyWE2Rk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fbEmSH68DSKE3T2iREVqKMBPbOueJgU/OAn8xHyJ48LmodCa2vJg/XUjakM0LFsLTYfRQI7BiCxdwcTYOYWgY/jW95ac4uEAO04pPEpZHoyYfOfJUuyInMHNZUP5ZE1+kqDfzroEfw04Y2+V+7ZD3mSPC4uOOGNwQv5CLvR17Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z1WjXliL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93310C4CEEB;
	Tue, 22 Jul 2025 07:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753167877;
	bh=gYoa7W18uiTzGym1uVGYEWQ4lu4rqpNQhQZViyWE2Rk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z1WjXliLj0kU8hEQ+9pS2z22M4csJGf5Bl7AspYdEV6PFAVVzs71wMefRbkFyqoNA
	 wGBtdHOFth7ExVNAJjcifs0Sqdr/IsKJinTbmtQJCZsG/shl+tfviUrLGrUGJHo3jD
	 E1/5iJ1xsy86LpP1WygPf+xP6PPkf68xkYpRPvTDDKhwJHonGf5mVeI/FlwZ5emDN1
	 TMWa6lIXZ2LNRzIAuz6HSDB0lmii/OcYiCSgFlaLVATqYYzLGIb486Y/ciyohUEK+e
	 YLXVfzvCV6kBAq5v3+K2N/dzp4yPmYrKB70UE/L32RTFRRrnQUoL5CT40DU2IZvUs0
	 7x/KXu2wj8euQ==
Message-ID: <75e0be49-0040-4830-a115-1daea0b73f93@kernel.org>
Date: Tue, 22 Jul 2025 09:04:34 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: Werner Sembach <wse@tuxedocomputers.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
 <76c57b22-04d3-4331-a10c-b210db5f9055@redhat.com>
 <9da24c58-25ab-4b21-b0ed-f777970affe7@tuxedocomputers.com>
 <de3969b9-7134-4bfd-bc65-9d5b7e53a31c@redhat.com>
 <1331ddc4-fb74-4985-a309-87fd97d0583b@tuxedocomputers.com>
 <e8b1c0b3-83d0-4e0a-9dad-7d59329fe3ce@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <e8b1c0b3-83d0-4e0a-9dad-7d59329fe3ce@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Werner,

On 21-Jul-25 10:36 PM, Werner Sembach wrote:
> Hi,
> 
> Am 15.05.25 um 14:26 schrieb Werner Sembach:
>> Hi,
>>
>> Am 17.03.25 um 23:23 schrieb Hans de Goede:
>>> Hi Werner,
>>>
>>> On 17-Mar-25 6:00 PM, Werner Sembach wrote:
>>>> [...]
>>> I think this one will apply cleanly without applying patch 1/2
>>> first, so no reason for a resend / v3 AFAICT.
>>>
>>> Let's wait and see what feedback Dmitry have once he can make
>>> some time to take a look at this.
>>
>> Hope a gentle bump is ok by now?
>>
>> Best regards,
>>
>> Werner
> 
> Small bump again, just so that this does not get forgotten.

It might be best to just resend this (rebased on the latest
upstream) as a standalone v3 patch (with my reviewed-by
added).

Regards,

Hans






>>>>>> ---
>>>>>>    drivers/input/keyboard/atkbd.c | 12 ++++++------
>>>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>>>>>> index 3598a21d9d014..4bd6e6ef0715e 100644
>>>>>> --- a/drivers/input/keyboard/atkbd.c
>>>>>> +++ b/drivers/input/keyboard/atkbd.c
>>>>>> @@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>>>>>    #include "hpps2atkbd.h"    /* include the keyboard scancodes */
>>>>>>      #else
>>>>>> -      0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
>>>>>> -      0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>>>>>> -      0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>>>>> -      0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22, 8,  9,185,
>>>>>> -      0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>>>>>> -      0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>>>>> +      0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
>>>>>> +    184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
>>>>>> +    186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
>>>>>> +    188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22, 8,  9,185,
>>>>>> +    190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>>>>>> +    192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
>>>>>>          0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>>>>>         82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
> 


