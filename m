Return-Path: <linux-input+bounces-10907-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE0CA67115
	for <lists+linux-input@lfdr.de>; Tue, 18 Mar 2025 11:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0935F19A0FB2
	for <lists+linux-input@lfdr.de>; Tue, 18 Mar 2025 10:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 703BB169AE6;
	Tue, 18 Mar 2025 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="FvvA7N7j"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD8B1F584C;
	Tue, 18 Mar 2025 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293288; cv=none; b=cdbhg1tOpJNa/KErafazGmrULEOdLrS/dZJmM+JWb4uHN6J5nwrGgtnlRxQ0SIYWONlKcnv7Z2mineNwHjoxxjcXv0Anaj5DpvrjNQ1vBCaKundIxAcAG8gma5L+lyCqnJYPrQZiEJyvTfNqilI2pSIgVHwNwj31P8Et+xB0tvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293288; c=relaxed/simple;
	bh=i9Cu+e09/ItgwbYnNEIqjTndSwM//DZAgokVgpiR0XA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYL9Mc1MFA47DHjpl+EyEmQiWxq2zhfmGGYeObE59Ae0Sk+2mGYBzHA1mpTMRQHeZm9hQzDfbg0uGg5Ps3lBbLYQfxzz0/7sYJv5ggjoa8gkIYNbYdSeO9dpKzM7Y2hXXPTNnvBGG4gwT0TQUiPqwMzX6hCTBepxdIx8jYWVGd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=FvvA7N7j; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5b164989.dip0.t-ipconnect.de [91.22.73.137])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D9D062FC0191;
	Tue, 18 Mar 2025 11:21:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742293284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4TMDdN5thIAZQtC4HDADAYwgh1v90pYj/gKsOILt/Lo=;
	b=FvvA7N7jUNoINZbZp1WQqPL57lhOMDt54pKVoV8uWc/o29ZFNfQAqaIqRWBTFzCz2v/Rh4
	NwQW8YZ7UOnSmZv+wo4OLMSIkrMfDrLOgwJUuySod+7azXKI3qJVmreaumIRMIAtTfuXcD
	HnrlLhcLH/vKxQOqthvYcyyLQTF8Q0s=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5880f34b-0fc7-451a-ba2d-8a5d5c7900e5@tuxedocomputers.com>
Date: Tue, 18 Mar 2025 11:21:23 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
 <76c57b22-04d3-4331-a10c-b210db5f9055@redhat.com>
 <9da24c58-25ab-4b21-b0ed-f777970affe7@tuxedocomputers.com>
 <de3969b9-7134-4bfd-bc65-9d5b7e53a31c@redhat.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <de3969b9-7134-4bfd-bc65-9d5b7e53a31c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Am 17.03.25 um 23:23 schrieb Hans de Goede:
> Hi Werner,
>
> On 17-Mar-25 6:00 PM, Werner Sembach wrote:
>> Hi,
>>
>> Am 17.03.25 um 12:58 schrieb Hans de Goede:
>>> Hi Werner,
>>>
>>> On 11-Mar-25 19:06, Werner Sembach wrote:
>>>> Currently only F23 is correctly mapped for PS/2 keyboards.
>>>>
>>>> Following to this table:
>>>> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
>>> That is a very interesting document, good find!
>>>
>>>> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
>>>> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
>>>> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
>>>> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
>>>>
>>>> * Qt on Wayland and therefore KDE on Wayland can see the keypress anyway for
>>>> some reason and it is actually used in a touchpad toggle shortcut, but this is
>>>> currently being fixed in both KDE and xkeyboard-config to make this less weird,
>>>> so it could directly be fixed to correctly handle the F24 keypress instead.
>>>>
>>>> - The scancodes for F13-F22 are currently unmapped so there will probably be no
>>>> harm in mapping them. This would also fix the issue that some of these keys
>>>> can't be mapped as the target from userspace using the `setkeycodes` command.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Thanks, patch looks good to me:
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Thanks for reviewing.
>>
>> Should I resend the patch standalone because the first of this Patchset will likely be rejected?
> I think this one will apply cleanly without applying patch 1/2
> first, so no reason for a resend / v3 AFAICT.
>
> Let's wait and see what feedback Dmitry have once he can make
> some time to take a look at this.

Ack

Best regards,

Werner

>
> Regards,
>
> Hans
>
>
>
>
>>>> ---
>>>>    drivers/input/keyboard/atkbd.c | 12 ++++++------
>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>>>> index 3598a21d9d014..4bd6e6ef0715e 100644
>>>> --- a/drivers/input/keyboard/atkbd.c
>>>> +++ b/drivers/input/keyboard/atkbd.c
>>>> @@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>>>    #include "hpps2atkbd.h"    /* include the keyboard scancodes */
>>>>      #else
>>>> -      0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
>>>> -      0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>>>> -      0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>>> -      0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
>>>> -      0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>>>> -      0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>>> +      0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
>>>> +    184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
>>>> +    186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
>>>> +    188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22,  8,  9,185,
>>>> +    190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>>>> +    192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
>>>>          0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>>>         82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>>>>    

