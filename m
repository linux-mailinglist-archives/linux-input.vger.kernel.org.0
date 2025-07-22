Return-Path: <linux-input+bounces-13636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E49B0D894
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 13:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3045618876DC
	for <lists+linux-input@lfdr.de>; Tue, 22 Jul 2025 11:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F082E2664;
	Tue, 22 Jul 2025 11:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="j9pFeYis"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23AE24467B;
	Tue, 22 Jul 2025 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753185214; cv=none; b=F/JXU2sapFfNbJvy0i7Toc1SxYPjjjiRP7ImDQyHcpHNjX7I6OtPqJ70/RcTrwZeHS/UnUKjnoAcwL0yo2vGPfShHy/ySjUU/dcbmfGt6oejWCUaCpPb/V9vAQ4zkvBS6wqZq2leR1921VYtfG9aB9wfaApnwjAUBT/xDi1s2kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753185214; c=relaxed/simple;
	bh=jvBKfE1yswDHbfnFEAykBvnA9GCH0i9lDLsN+F3UpGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uoPsSWlziF2MlYaSpOzfzFndXqPT+Lhy3KxICQqAPcyedUjpvpRk7sDb9MhbMFFJyeFycf1xX5GPmzVObARlOiOaQr0/lrs1s4bLOb8w6JXii/SGGnkjvMQSi7MX2HRgTvnh4zrmUHrAC79P0Vo6VBp4DMstHCIjXa8B9pquv0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=j9pFeYis; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5de459a9.dip0.t-ipconnect.de [93.228.89.169])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 7DF8B2FC0074;
	Tue, 22 Jul 2025 13:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1753185208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D6JCU07cqhLJNWeA69beIg7C0Vl6H9lLjQM+IRcUJKo=;
	b=j9pFeYishUrrLtkfxjnAQR7P/LhhXRdxcCDyyYWl2eTsko5GLgQeWi4STgxxejeBezsUwt
	B2YrCrNsXsQ0k2Z/y9jo6932oJSEoZX0MjsmoBys69eCYam2RYDsoivU0bbTpoNa6VL5TZ
	Dl5qYRxn+XbHHsZ1nB9KbAjBcQrG/VU=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <dfde599f-c01d-48a2-a315-0b80d5954623@tuxedocomputers.com>
Date: Tue, 22 Jul 2025 13:53:28 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
 <76c57b22-04d3-4331-a10c-b210db5f9055@redhat.com>
 <9da24c58-25ab-4b21-b0ed-f777970affe7@tuxedocomputers.com>
 <de3969b9-7134-4bfd-bc65-9d5b7e53a31c@redhat.com>
 <1331ddc4-fb74-4985-a309-87fd97d0583b@tuxedocomputers.com>
 <e8b1c0b3-83d0-4e0a-9dad-7d59329fe3ce@tuxedocomputers.com>
 <75e0be49-0040-4830-a115-1daea0b73f93@kernel.org>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <75e0be49-0040-4830-a115-1daea0b73f93@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 22.07.25 um 09:04 schrieb Hans de Goede:
> Hi Werner,
>
> On 21-Jul-25 10:36 PM, Werner Sembach wrote:
>> Hi,
>>
>> Am 15.05.25 um 14:26 schrieb Werner Sembach:
>>> Hi,
>>>
>>> Am 17.03.25 um 23:23 schrieb Hans de Goede:
>>>> Hi Werner,
>>>>
>>>> On 17-Mar-25 6:00 PM, Werner Sembach wrote:
>>>>> [...]
>>>> I think this one will apply cleanly without applying patch 1/2
>>>> first, so no reason for a resend / v3 AFAICT.
>>>>
>>>> Let's wait and see what feedback Dmitry have once he can make
>>>> some time to take a look at this.
>>> Hope a gentle bump is ok by now?
>>>
>>> Best regards,
>>>
>>> Werner
>> Small bump again, just so that this does not get forgotten.
> It might be best to just resend this (rebased on the latest
> upstream) as a standalone v3 patch (with my reviewed-by
> added).

kk

Best Regards,

Werner

>
> Regards,
>
> Hans
>
>
>
>
>
>
>>>>>>> ---
>>>>>>>     drivers/input/keyboard/atkbd.c | 12 ++++++------
>>>>>>>     1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>>>>>>> index 3598a21d9d014..4bd6e6ef0715e 100644
>>>>>>> --- a/drivers/input/keyboard/atkbd.c
>>>>>>> +++ b/drivers/input/keyboard/atkbd.c
>>>>>>> @@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>>>>>>     #include "hpps2atkbd.h"    /* include the keyboard scancodes */
>>>>>>>       #else
>>>>>>> -      0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
>>>>>>> -      0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>>>>>>> -      0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>>>>>> -      0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22, 8,  9,185,
>>>>>>> -      0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>>>>>>> -      0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>>>>>> +      0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
>>>>>>> +    184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
>>>>>>> +    186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
>>>>>>> +    188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22, 8,  9,185,
>>>>>>> +    190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>>>>>>> +    192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
>>>>>>>           0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>>>>>>          82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,

