Return-Path: <linux-input+bounces-10903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D205A6617E
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 23:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 498031885492
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 22:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121F01DDC16;
	Mon, 17 Mar 2025 22:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W2aRkBWi"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430D28BE5
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 22:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250227; cv=none; b=eek+PxejSlbZcqTv3ubZyelyi2WdGwAlGbGecy8D+kVSyNqppuJi7ggcuzgcQDrKWMbKW/WcUM1ac8/dE5/dpKbEKA4BkMb07Irqb9MJ5WDmdn1P/eE7hBWkZvVfcYMMjAXaa/hgTTOoZl7eEDYCEfSYi+SpOY4T/5pvVnf6cQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250227; c=relaxed/simple;
	bh=qOBL8abCZ+DPrUe5SzCaYB3GqooW5w/t+KRdMC+tS7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OY4bIERwFS1cpa7JgnkHOEgbsYzc0iOdKH48UWtugIPUDwRnivZLEvLIp6Vyc1h70YYbT/RZ2WeYmEjswn4TN3e7SMw0m4Fu7Jm//0BilSZzPmUo8qYTtqcMGIQOhx+mvUd+1vVlIzj4V20y/VpWQt3V0tGmphbPnz1yI+kmhag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W2aRkBWi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742250224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ypzfvWknX9NmdbuGXtvnIjLZ0pscGe7eRm486DVoM6Y=;
	b=W2aRkBWiCdjcuMB/tKPhZ3+KSoT+yGzpKkxviMCwh+PFcp81/cc7KwJ0rZSbtgVwS5507M
	XRIiII5C4dLU+KOi84TEK0oF+oszLW1s77gfiuHwXfxz+l84n03Dz368tjznzl9Vk7jPHt
	c18jMNvhyHqHz/4QvSgDmSNxiDVJjHU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-bbHwCVC0PM2prQgxkKv0yw-1; Mon, 17 Mar 2025 18:23:42 -0400
X-MC-Unique: bbHwCVC0PM2prQgxkKv0yw-1
X-Mimecast-MFC-AGG-ID: bbHwCVC0PM2prQgxkKv0yw_1742250222
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac29ae0b2fbso494218166b.0
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 15:23:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742250221; x=1742855021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypzfvWknX9NmdbuGXtvnIjLZ0pscGe7eRm486DVoM6Y=;
        b=Qdl4Pxq7gCkxZRd+YofT1Nb+O1Hb3LTy7sulUExsU/6s3j5ViAiBePmN8BxhV7plZf
         PphC2I0DbBPXgXYZMU0bB3JkU7NgM5RevxjJxgTCybVHy2ePRLWh+5x5stjzu1FBLDfx
         AR5tdq4Se7vUQRB6QLXMAZ7FF9z9EQ5lLISKJ2a87weu68yZaNKtTGcAdOcH7vLdl+VZ
         BrHC5gxjEzY6sFzmmblf61ap7uVzyPgxkmFGjzBpuk8WM5BsmvR9iYkmAqHabZYta4Na
         o0Vg2d0sttOMWgm3uLGA452Kh7W1fuIRIlWIGNFYr2ONODG0EVc4GvEVRdG7IyyFdDI0
         jmTw==
X-Gm-Message-State: AOJu0Yw88RdRVVy88ZZZMXEfu1WJX/6TWtng9Z1exBxZrbKnyauBJISL
	hzK1uRigylwTXpnRW6TzrB+hoFLkOtkezE0ZmlOjsPpjCvmZPJ5eV6TLgawPINpv2kSYKpc0NGQ
	fp1dVzII0Uyq69f7MGRshzwylnstsFLVJxS5rjAgXI4PQtOGBQ41rNrwNYQWj
X-Gm-Gg: ASbGnctieyGNxT/e4rnl+zYR8xzYnSsgtUFjbIegO8IVA2fWo01IulWrJA5TP7RNO0Z
	vSwEp/Xq2aUugYpLd2/VEfOSKIgsNlYfnUvZqSvkIZ8l83yQ6McSKSs7cAUBhQYCBcXqlokSFC2
	xluY+oX6dvJO2n0rh9vpsTAJJWIHXNldEhmzUQIS09ftFolWs1Tio5m5u/+jnvIricPjLyIDrzt
	2GjDVBKYJi0Ex7uDE3BPNBrttfdd14WqngRxPCEB6ZQJN8j0kKjqUAJCdPp7UBw9OPzY6WSuc+C
	aSbT7chlhnSuzLlmI1bKUVdVHq2cfWSaI0NXPF2UVu/kdUG7FmBUoaMUeaGOlNCHywI4E0wIthT
	Adv/gT6yQXkagIfOQpuwi6Wbc8XDPivTFuxFnG4g+pHAGEYzAuI0bxpC7zLBYeCpbNA==
X-Received: by 2002:a17:907:868e:b0:ac2:c1e:dff0 with SMTP id a640c23a62f3a-ac38d405dc7mr128282366b.19.1742250221509;
        Mon, 17 Mar 2025 15:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnx3tTbnPNibxhllxurHdd8mGoxavBaNeUmJVl8iuJ7TCzMANf3gUFSzFxuhrkSoc2i9Y1tA==
X-Received: by 2002:a17:907:868e:b0:ac2:c1e:dff0 with SMTP id a640c23a62f3a-ac38d405dc7mr128281266b.19.1742250221123;
        Mon, 17 Mar 2025 15:23:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa6083sm726182766b.182.2025.03.17.15.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 15:23:40 -0700 (PDT)
Message-ID: <de3969b9-7134-4bfd-bc65-9d5b7e53a31c@redhat.com>
Date: Mon, 17 Mar 2025 23:23:40 +0100
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9da24c58-25ab-4b21-b0ed-f777970affe7@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Werner,

On 17-Mar-25 6:00 PM, Werner Sembach wrote:
> Hi,
> 
> Am 17.03.25 um 12:58 schrieb Hans de Goede:
>> Hi Werner,
>>
>> On 11-Mar-25 19:06, Werner Sembach wrote:
>>> Currently only F23 is correctly mapped for PS/2 keyboards.
>>>
>>> Following to this table:
>>> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
>> That is a very interesting document, good find!
>>
>>> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
>>> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
>>> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
>>> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
>>>
>>> * Qt on Wayland and therefore KDE on Wayland can see the keypress anyway for
>>> some reason and it is actually used in a touchpad toggle shortcut, but this is
>>> currently being fixed in both KDE and xkeyboard-config to make this less weird,
>>> so it could directly be fixed to correctly handle the F24 keypress instead.
>>>
>>> - The scancodes for F13-F22 are currently unmapped so there will probably be no
>>> harm in mapping them. This would also fix the issue that some of these keys
>>> can't be mapped as the target from userspace using the `setkeycodes` command.
>>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Thanks, patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Thanks for reviewing.
> 
> Should I resend the patch standalone because the first of this Patchset will likely be rejected?

I think this one will apply cleanly without applying patch 1/2
first, so no reason for a resend / v3 AFAICT.

Let's wait and see what feedback Dmitry have once he can make
some time to take a look at this.

Regards,

Hans




>>> ---
>>>   drivers/input/keyboard/atkbd.c | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>>> index 3598a21d9d014..4bd6e6ef0715e 100644
>>> --- a/drivers/input/keyboard/atkbd.c
>>> +++ b/drivers/input/keyboard/atkbd.c
>>> @@ -84,12 +84,12 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>>   #include "hpps2atkbd.h"    /* include the keyboard scancodes */
>>>     #else
>>> -      0, 67, 65, 63, 61, 59, 60, 88,  0, 68, 66, 64, 62, 15, 41,117,
>>> -      0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
>>> -      0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
>>> -      0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
>>> -      0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
>>> -      0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
>>> +      0, 67, 65, 63, 61, 59, 60, 88,183, 68, 66, 64, 62, 15, 41,117,
>>> +    184, 56, 42, 93, 29, 16,  2,  0,185,  0, 44, 31, 30, 17,  3,  0,
>>> +    186, 46, 45, 32, 18,  5,  4, 95,187, 57, 47, 33, 20, 19,  6,183,
>>> +    188, 49, 48, 35, 34, 21,  7,184,189,  0, 50, 36, 22,  8,  9,185,
>>> +    190, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
>>> +    192, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0,194,
>>>         0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
>>>        82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
>>>   
> 


