Return-Path: <linux-input+bounces-13620-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AB8B0CBE7
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 22:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0ADE188C992
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 20:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB94238D56;
	Mon, 21 Jul 2025 20:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="C2tdTMEN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE919CD0B;
	Mon, 21 Jul 2025 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753130186; cv=none; b=oehsBu4TSZJuarrL0MYrkHV5z9tPP8bQfDRD6rypZ2W81e2rQD+AKsNuDcmwoc1Wx/jMsQZ7EWjZKD6KzBdZ/BL88kSgVNZZ+WWt727Ed4XOPr1/PNZ+oar36+4CXahE0n76kPlzUx7RQTZjhSTBzpdd8F8oc1+jlVGxbsUXAhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753130186; c=relaxed/simple;
	bh=tmDWNYv379XPDRx1AF/2GrIpBbq1+fw9v+8yd2tlQ+c=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q4BgnnW8liBOe+I7hIXFXatX6+uYSrNcrN1uMz/Plnccjdm8DtBvxVXoCE96QFTAXqz6DdbbfKQmMFKAyP/jzMRnkhK28DiL2gTHrPXnk+1nmJnw2kbeXo6H+Bcs58YltH5yoJVjlS2DswqRFekaOtQg3Pg1AlwfIqhSX09G7Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=C2tdTMEN; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5de459a9.dip0.t-ipconnect.de [93.228.89.169])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 9E7C22FC0059;
	Mon, 21 Jul 2025 22:36:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1753130173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oh0pzkq1hPD/uq7iN0Vvk7JbHlZJNNxlAW2PJIP8o9Y=;
	b=C2tdTMENCWxH/5FZuvZz7bt00tASP6U8VNzfY0O7xqS3a5ZB3aSIK5uG3IF5fyynCYEUE6
	n3m3KsXEUodEd6OodEfY/WpNKcG6OeWtnDyqpAAIXt+9iOLGykEvMmdSuOHEWSbZu5Ce+B
	0jlc0AYrpLaj3YQkGqyryM2s7qXbrtQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e8b1c0b3-83d0-4e0a-9dad-7d59329fe3ce@tuxedocomputers.com>
Date: Mon, 21 Jul 2025 22:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
From: Werner Sembach <wse@tuxedocomputers.com>
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
 <76c57b22-04d3-4331-a10c-b210db5f9055@redhat.com>
 <9da24c58-25ab-4b21-b0ed-f777970affe7@tuxedocomputers.com>
 <de3969b9-7134-4bfd-bc65-9d5b7e53a31c@redhat.com>
 <1331ddc4-fb74-4985-a309-87fd97d0583b@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <1331ddc4-fb74-4985-a309-87fd97d0583b@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 15.05.25 um 14:26 schrieb Werner Sembach:
> Hi,
>
> Am 17.03.25 um 23:23 schrieb Hans de Goede:
>> Hi Werner,
>>
>> On 17-Mar-25 6:00 PM, Werner Sembach wrote:
>>> [...]
>> I think this one will apply cleanly without applying patch 1/2
>> first, so no reason for a resend / v3 AFAICT.
>>
>> Let's wait and see what feedback Dmitry have once he can make
>> some time to take a look at this.
>
> Hope a gentle bump is ok by now?
>
> Best regards,
>
> Werner

Small bump again, just so that this does not get forgotten.

Best regards,

Werner

>
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>>>> ---
>>>>>    drivers/input/keyboard/atkbd.c | 12 ++++++------
>>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>>>>> index 3598a21d9d014..4bd6e6ef0715e 100644
>>>>> --- a/drivers/input/keyboard/atkbd.c
>>>>> +++ b/drivers/input/keyboard/atkbd.c
>>>>> @@ -84,12 +84,12 @@ static const unsigned short 
>>>>> atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>>>>    #include "hpps2atkbd.h"    /* include the keyboard scancodes */
>>>>>      #else
>>>>> -      0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
>>>>> -      0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>>>>> -      0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>>>> -      0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22, 8,  9,185,
>>>>> -      0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>>>>> -      0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>>>> +      0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
>>>>> +    184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
>>>>> +    186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
>>>>> +    188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22, 8,  9,185,
>>>>> +    190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>>>>> +    192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
>>>>>          0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>>>>         82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,

