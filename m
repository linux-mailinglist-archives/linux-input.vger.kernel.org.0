Return-Path: <linux-input+bounces-10902-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 084CEA6617C
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 23:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF3743A62B9
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 22:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7C91F4179;
	Mon, 17 Mar 2025 22:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i75Qgrw+"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F320E176FB0
	for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 22:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742250154; cv=none; b=i+1HQ6Kbfa+4zJj9K/fSHaJbfYmD1F1R93jzzXp4GW2zYG+ZkMOtYojeEvKtZy+PJtRQM3VfJcDPZSYZQP+iFx47Id1i2CvAdizUdwn3phtAjofaAWXaLheR8FosX2rMlgQq7I8LzrQUQNmJaoVelnj7KbT5uxUqMoNznSDWEOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742250154; c=relaxed/simple;
	bh=UTka+Bwl7U3oXDZYsAkYcn3UttkrMbvEepURyaX8aTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZFe44qCs3hc9JNzMlXFe7O/UJu9ilL5RVq4NZ/8GRw6W37IabLisMNX+du3iCJSv5mqMRwzBAHyTylCYVTM6sae2m1OZGgKSE8SLDLycxs4bwienqZMU8wM5tk/NkQ43bMjK6CeYedxq8ryFPAAZFXDLq/UtMhj10wq0GVbdyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i75Qgrw+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742250151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5G+gLRdT0H152n57X0RhbxihhCG56hjU9sd24nfwpes=;
	b=i75Qgrw+h+7LwiV3FliECusp/N/rqUqHY/1wJL4kU2w0EFywZkw9gaxJM/lxCFMgIUXTRA
	oQzeSI1M+DJiBa7QtmdyXSuXliyyKhpBssRr1KyEOFHrTqpg5J5UslVHN1Ba7J0qOATweR
	Ve3dCU6OryDgTDqD3fS/eKcHyc2EirM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-B9p3r5f7P2-YMA8HNoGyQQ-1; Mon, 17 Mar 2025 18:22:30 -0400
X-MC-Unique: B9p3r5f7P2-YMA8HNoGyQQ-1
X-Mimecast-MFC-AGG-ID: B9p3r5f7P2-YMA8HNoGyQQ_1742250149
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac218738618so424381766b.2
        for <linux-input@vger.kernel.org>; Mon, 17 Mar 2025 15:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742250149; x=1742854949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5G+gLRdT0H152n57X0RhbxihhCG56hjU9sd24nfwpes=;
        b=DaS69Z8tbtpWbJjls5KuI2ti3Y5I7dSAc8s0oD4SjSeckarMJ0mYjXnuzHphYp93SG
         0xaz9r41G5IKT+W7abC22ll/28kz9qsLHbF1KCAgNteq9Wm1JRyv2OQbdeZV3tdIwY/f
         qYlzP2hI6CF8IvxzsbzOJpsJoU4kSDhdmz7o5fGYdE6jJI5P7bTwb7CC5EuyXLbQ6Fz3
         IPT78PeSSF7ECvyo1u1BurQBip8NFaedg1WCEzlkz6/iVgcLL4iSqJGYmPyO5rETy419
         8BTIxuIAKqSoT85KaG+8uMImaOF/EZd8E2bkhGaS4mJ+rwdy5ZcCq3xqaMeZn40UMT35
         lkYQ==
X-Gm-Message-State: AOJu0YzMdagUW0N1ehAl9DRlcpmPEE30ffu6wIu5UyprnjpgAOgD0HkC
	sjGcmUEmFYEB9bkxRzHkISPwT8+cObY6xbRI7gg8Mz9Mm3hu8yKHfmOvV6yrQFeV7tatyu1M0Ff
	S6fM0UMh5RK+b3+IMm87F29Wvy7tJNvwkww4pl2orFmt5i8XG74zOvMewkCpc
X-Gm-Gg: ASbGnctOtdsMvwDNGu9Iia6qDRNvtTx2qreS4CDFbsfT8x3PffrfME895M4LmGfmniW
	Z78bq/EAL6ZQjFBIqAoMjhtBI2F3k6p2BVVhh9j8DnB/SA0jgQO4jPcrET8myxKGdcUJ4Ozz8Iv
	RJiNjl32EBTYyQMa21XBTlx+Yz7I04PUwhRDAGtRd1U13Tx41ZV68+1174S1lKY0KYeHDw67GG1
	iLTtTnomYaO+xFLFPz8b/tJBppj+R3erWF38kcqWsbQ+APClrXyBm5pUeqvqXxXBrfMJtvqprzw
	tIukszpXV1ptgHJh9QyRxCz3b8XlTtzXDj6Wa2LZjQ7G3Ae+sD5q9Thh5J1AxEkrCkgSLJeoJBb
	kzw770lhDkpkg5QEr2wMFvlgiDFcGA/R+GVzqp7CjwvJF90KMaF5mvaB/d+UiFlv+RA==
X-Received: by 2002:a17:907:9713:b0:abf:5f3c:58e7 with SMTP id a640c23a62f3a-ac3301e0b4cmr1470097866b.3.1742250149310;
        Mon, 17 Mar 2025 15:22:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX3P/YcE4PXvKt4s3YzLuI8eWICwMlFaui05RS2ZN2lx93D9W9d2+yiuWdCPJJlpPqcWVhhQ==
X-Received: by 2002:a17:907:9713:b0:abf:5f3c:58e7 with SMTP id a640c23a62f3a-ac3301e0b4cmr1470096866b.3.1742250148945;
        Mon, 17 Mar 2025 15:22:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cf0a8sm740785666b.97.2025.03.17.15.22.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 15:22:28 -0700 (PDT)
Message-ID: <bd05271b-eefc-4a4d-90aa-9345e8d01807@redhat.com>
Date: Mon, 17 Mar 2025 23:22:27 +0100
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
 <83ea44f6-c0ad-4cb0-a16e-dd4fa17b63c7@tuxedocomputers.com>
 <45fff318-7925-4328-9dca-999c00e271d2@redhat.com>
 <f742f82e-d533-431f-bf64-01cec4bead09@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f742f82e-d533-431f-bf64-01cec4bead09@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 17-Mar-25 5:47 PM, Werner Sembach wrote:
> Hi again,
> 
> Am 17.03.25 um 13:06 schrieb Hans de Goede:
>> Hi,
>>
>> On 11-Mar-25 19:10, Werner Sembach wrote:
>>> Hi Hans, Hi Dimitry,
>>>
>>> resending this too on the v2 to not cause confusion:
>>>
>>> Regarding remapping KEY_ZENKAKUHANKAKU to KEY_TOUCHPAD_TOGGLE:
>>>
>>> Am 11.03.25 um 19:06 schrieb Werner Sembach:
>>>> Currently only F23 is correctly mapped for PS/2 keyboards.
>>>>
>>>> Following to this table:
>>>> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
>>>>
>>>> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
>>>> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
>>>> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
>>>> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
>>> I think what the firmware vendor actually wanted to do was to send ctrl+super+f24 upon touchpad toggle. This would somewhat fall in line with, for example, the copilot key being implemented as shift+super+f23.
>> I agree that that seems to be the intent.
>>
>>> Following this, my suggestion is to do this remapping and handle the rest in xkeyboard-config
>> xkeyboard config already contains mappings for F13 - F18 and F20-F23 in
>> /usr/share/X11/xkb/symbols/inet
>>
>> So all that needs to happen there is map FK19 -> F19 and FK24 -> F24.
>>
>> And then teach KDE + GNOME that ctrl+super+f24 means touchpad-toggle.
> 
> Alternative suggestion, again following how the copilot key is implemented:
> 
> key <FK19>   {      [ F19 ]       };
> [...]
> key <FK23>   {      [ XF86TouchpadOff, XF86Assistant ], type[Group1] = "PC_SHIFT_SUPER_LEVEL2" };
> key <FK24>   {      [ F24, XF86TouchpadToggle ], type[Group1] = "PC_CONTROL_SUPER_LEVEL2" };
> 
> Then only xkb has to be touched again, but not KDE and GNOME.

Ah I did not know you could do this. Yes this sounds like a very good
plan wrt the xkbconfig changes and then indeed we can do all the handling
in xkbconfig.


> 
>>
>> We could maybe get away with also dropping the weird mappings for FK13 - FK18
>> and map those straight to F13 - F18, but we need the special mappings
>> for F20 - F23 to stay in place to not break stuff.
> 
> Good question
> 
> XF86Tools launches system settings on KDE.

Right, but XF86Tools is also send for KEY_CONFIG which makes more sense,
the question is are there any devices actually sending KEY_F13 in
a case where they really should be sending KEY_CONFIG instead.

Note this is unrelated to the XF86TouchpadToggle thing though, just
something which I noticed while looking at things.

> Looking at the links in the git log of xkeyboard-config (commit 1e94d48801bf8cb75741aa308d4cdfb63b03c66c and 01d742bc5cd22543d21edb2101fec6558d4075db) these seems to be device specific bindings that got accepted in the default config because the keys where unbound before.

I see, so it might be worthwhile to try and fix these, but in
a separate pull-request from the:

key <FK24>   {      [ F24, XF86TouchpadToggle ], type[Group1] = "PC_CONTROL_SUPER_LEVEL2" };

addition.

Regards,

Hans



