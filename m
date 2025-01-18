Return-Path: <linux-input+bounces-9370-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5809A15D44
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 15:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 043EC1886B9B
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 14:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C125A24B26;
	Sat, 18 Jan 2025 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDweqbZ8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3D1DFD8
	for <linux-input@vger.kernel.org>; Sat, 18 Jan 2025 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737208959; cv=none; b=SfYTS6ofVf9wF1DDSbYlulazc73hVksJ0J6Eim8XgObITjIVX7749/DjhkHxaCplVkbxFK11yhL6asF+YXo/+ZA+/rWqPzxqB63aa044vGJ0SXXSfLAmHpCFsuF43Xp/sGfTs52jXeqfJKIqy7FbddZ3gKKuTN12VeIQzKVHg0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737208959; c=relaxed/simple;
	bh=gaE4OcDHRctfdeybwUII86pLHKgwlXWkiBbaKp6JpkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wj3X/fepCMsD5SRiS2ykPFmk3pSYT0xSlt2cLAguLre2llYnBt7rgWwqK4W5I0Jcrfk+ORvQhbmoFJNOhxpJav+gtJ4TSAJfhaHocNWRe9pmUJF381uIlkau6e+3pNQn3HApsDOIx6CRBh0AXVOjh+yahWtx+NBNrOHTvfDalD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDweqbZ8; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4363ae65100so31949175e9.0
        for <linux-input@vger.kernel.org>; Sat, 18 Jan 2025 06:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737208956; x=1737813756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CjAa39MBbJT91vci0xxYQTB75C4VjW3br7LSbla+BQA=;
        b=FDweqbZ8bQ0hPX9oISlZ0fbzIP9qGqX8GeXQLu0wU/gsWG83Ke7W8t0KbGXXITGNOk
         TDTwmwYd00sAbivRMHBfsJvwFTECYd0HjnqX7COGt+yqx6xUEetfYVzy3feaiFOJ5wOL
         JdO+wKqtBAKVESxhDKVdsdJ80v2+S6rSR4zjem+psLNJRsveu8Wr0QxHfOIebTV/5C0Y
         AIfKjipoI9gIgricPoUq905tvoUc7fXlq2Htg6jHAvgRyP9MDAlajdrYYlQLUQHwW6ui
         Qpa6+YoX0VoI3azFSOuXaMJFFQ1BJRTaWPQGH6IlcB8GjZOEEIHMH9w+pyriEwr2sd40
         08JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737208956; x=1737813756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CjAa39MBbJT91vci0xxYQTB75C4VjW3br7LSbla+BQA=;
        b=ng5PVVKHmOyA+puMOlnZSNk9oR1TlJI4z4+acgdN1eHAxasWW1T7g6R0q31jKrQIc2
         f1ak0nLgpFwoPn2QuFi2bXAqxQdVqEL8h53tXzt9swpME1YEHNYVqSl2KI7sv7DhKkX8
         VpjWrCewF/sZpQO4broOAJAKa0IcdfA5HOWlEXk4YO2hoe1vg9OEdWSnynzBslNAayhC
         mqN1Xv+YJejlHHWE6/SZiTofPSKpt9JfXCZV7gvnDf3gKzortH7RgJtYs2T591JQEsR+
         rAFrn8xWCkcwRru90VbSvu+w5ueaRLbhPVFBvs8AD0cYa7+8hqVFkpGAVxmkr7c7VzDN
         NRHQ==
X-Gm-Message-State: AOJu0YwTQcFCQ5eY54kX4g+jqvQp3o+WA89SusPTo4q3fwjnlYkkAa0k
	iLKdUJEEUTmJcHNQFVQIpS1ltDPcbY3TU5NkRxLRK90lDYDA74GM
X-Gm-Gg: ASbGncsrsnkp7KAi5PYQXK2pYf4RFfpkB76Xy3GLu8ceqnnj4rQkGiSAKSs5pDvkRgK
	BXep0kNSWW6xove4mS7tBREdFITMGKTJp2SqrByHwlJL2L9/VzANjvibX68Q+6CghhqwZ3k9r0V
	JcEsILICXi9mB6h7h79uAHHCmF/HKp2IIjlyM8EsAoLk2Yn+3fD+xPRys0EwKmrust4dFRdmQF9
	EjOnnraVQomauRdBBaGgVwvQ+PFm+zlatGWu6QGvZx3kI2ab7t+boWfW/BZH1k3d4WWXiCNqGX8
	A/ga3NpK/namG2fUM7eD4JqXaHojKhG0gWg6TNYXDQ==
X-Google-Smtp-Source: AGHT+IFoYPteYGZJll1RV3zyZa6v5R1rJSu7y7WjIH058RWij/2f/NfARjW2Y1tz8MeVlJNr4Osy0Q==
X-Received: by 2002:a5d:64ec:0:b0:385:f66a:4271 with SMTP id ffacd0b85a97d-38bf5649632mr5593959f8f.4.1737208955879;
        Sat, 18 Jan 2025 06:02:35 -0800 (PST)
Received: from ?IPV6:2001:16b8:b48e:f900:ecec:f891:8ddc:3092? ([2001:16b8:b48e:f900:ecec:f891:8ddc:3092])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm5353673f8f.10.2025.01.18.06.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2025 06:02:35 -0800 (PST)
Message-ID: <3f31c9aa-09ac-4d69-b174-a290ea277dbb@gmail.com>
Date: Sat, 18 Jan 2025 15:02:34 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/11] Input: xpad - add support for Nacon Evol-X Xbox
 One Controller
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
 Matheos Mattsson <matheos.mattsson@gmail.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
 <20250107192830.414709-9-rojtberg@gmail.com> <Z4qTzrFGDtInMfz5@google.com>
Content-Language: en-US, de-DE
From: Pavel Rojtberg <rojtberg@gmail.com>
In-Reply-To: <Z4qTzrFGDtInMfz5@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

Am 17.01.25 um 18:30 schrieb Dmitry Torokhov:
> Hi Pavel,
> 
> On Tue, Jan 07, 2025 at 08:28:27PM +0100, Pavel Rojtberg wrote:
>> From: Matheos Mattsson <matheos.mattsson@gmail.com>
>>
>> Signed-off-by: Matheos Mattsson <matheos.mattsson@gmail.com>
> 
> I checked several patches against the github repository and in github
> there are no "Signed-off-by"s from the original authors. I understand
> and fully appreciate the desire to credit the original authors, but you
> can not add SOBs on their behalf.
> 
> I think the best way would be to combine all the changes into one patch
> authored by you and give credit to all the people involved in the commit
> description.

sorry for the created confusion. Last time I was told to try sending the
one-liner patches individually for proper attribution:
https://lore.kernel.org/all/Yv46RSWwQDaHqE6f@kroah.com/

I was not aware of the peculiarities of the signed-off procedure.
Therefore I merely requested a real name & email from contributors.

As Matheos clarified some contributors added the signed-off line to
the pull-request and not the commit so I tried fixing this manually.

I will update the PR template and explicitly ask for having
the signed-off line in the commit and will squash commits lacking this
into one when sending updates in the future.

Greetings, Pavel

>> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
>> ---
>>  drivers/input/joystick/xpad.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
>> index 237704b3fab5..18e33e2aeaa7 100644
>> --- a/drivers/input/joystick/xpad.c
>> +++ b/drivers/input/joystick/xpad.c
>> @@ -394,6 +394,7 @@ static const struct xpad_device {
>>  	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
>>  	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
>>  	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
>> +	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
>>  	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
>>  	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
>>  	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
>> @@ -543,6 +544,7 @@ static const struct usb_device_id xpad_table[] = {
>>  	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
>>  	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
>>  	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
>> +	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
>>  	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
>>  	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
>>  	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
>> -- 
>> 2.43.0
>>
> 
> Thanks.
> 


