Return-Path: <linux-input+bounces-16368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D9C8BBCF
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 20:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D80333A181F
	for <lists+linux-input@lfdr.de>; Wed, 26 Nov 2025 19:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410D533F8A4;
	Wed, 26 Nov 2025 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aoeplI1a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CC333EB0B
	for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 19:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187034; cv=none; b=eWnL7OedSSOOtku3q49db9PxEWAZuzwq00sLuTNbFFsi+A1gxhQi3unlk5exN9EUIxSiuPsdbuK8jVdNx3aO4TKYYjGO0Rvish3GZtuzPOcDJWFyFD9wJUAlhBF9YaphGGV2QGdvVwuNkfW4t9nDMSzvTEhwDsMZfKYPtOxQWIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187034; c=relaxed/simple;
	bh=sFxdQJq77FHB9tvA6CD8aNGyL+khIcZI1+iJPTYgK0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j9KVdxqZ0D0wBUF+oDpQyXEMfVRod4O0F2RtZr81XrssV0X3gEWcdwqSkg+PHZ85AuFJNHacjgC6TaAeRhavSwFCom72w/pRjOTRxsN4SmxBS+3hy1M5CeR6la57E2fthuDSPA+QSyuxn9J2S0A/+Rypbg085O21JUzvBVPKKkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aoeplI1a; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so708685e9.2
        for <linux-input@vger.kernel.org>; Wed, 26 Nov 2025 11:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764187031; x=1764791831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5d9lydYHfYTR/ACeyVzgTNDMdFsWzBAH+5B+oqVuOrk=;
        b=aoeplI1aLf71KS/Lee+Zi0U+oIokFBj1dNIRENWTHxHF+XMVFjlBh7cNGTA2SvVGII
         +TZDzRAhwOodta9nvijt1pZTTx8oNN89zRzxGz+k6STQDVfK12fpq92Ep9gZ0734pN7i
         FkwfvfEXmM4hvKWAXsamN9LcvSEh4NkriRCON/CfM8zYCnrGSjb0o74qW1WI4hMOQUbX
         8IhQfMNtFTAEv9fuIyh8mcIdOlObUel0fsHot7u6F97KERqTVXRwxA9kjwHtV7phwx6f
         YnCpVrtPxQr9/vt8pQeVHBHbtoO8SxkolwuX4Rv/1HAKzsr6mcoDUKs0tzTIzceQ32D5
         3Rng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764187031; x=1764791831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5d9lydYHfYTR/ACeyVzgTNDMdFsWzBAH+5B+oqVuOrk=;
        b=e+QAAanKz3nep4FIUnN3Apeyh5XOaklLlmg6q5/o+oOBs431lPpBnC3QpIWALwBBvU
         XJ7MkhemD/b0l0SVcZEsPomnJbnhdlhJFblN3UTTXxLv3yuoBnEAQOTu6YWVFeNK/oPx
         RnnlCm+7mA7p5Kci9P1qmVRBU6u8ouKWQyrOsdWxk+1Xuk2GBv2oSoDOAh8cSAXBzvOo
         eHEJ5r6DIre2A/5rBADh2C9SQ8q47JjtxinLj5WFo+en3rV5RBl6uDeqzsTaDqusGUt7
         pfRrOFjXpoTZeYxc9PhzSGnAAm7p4vFq/3re3nIBGB+HrOkLDZggEP/B3B0P/OWJKLV3
         v5Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVSqeYs1IBJm8OdjN6vxpsisbK/lvp0zwYIsTXyHg06NRFZRkrzWzgsqXmxZSrUPOPyJExEVPK2hZVI3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0r8k22rsbfvFuxlhVrLfIr8WYgT/5K9Q9x25vJDa26Kaz7/7g
	D5iwpNNHO8e/e21AngLaFDKzcnUfSupCvQ9RY8ovaTW8fM75BybduQS875OCPA==
X-Gm-Gg: ASbGncuSztpXzK1hp/veUX9db2VGh960D5i55J5WsltqsfVDo30IUwP6XWrM0wedl8u
	0JrPWDTz+ZFU1b9qN7ecSM63Xj28LXqJAUCy7rejKnxIfEfSooHNUWZKY59MLdEK+RWfvM0/AwN
	rLUtDLQkGsqo+BfHS1GOkNgR9meKq2e2NVmK06kv06b+5a1EghSvH2Ag/kkIKi0xEEEnhGGcI0f
	P4zkGA2iH8CKydcbrx4Xled/MPm13n+F/GXI180RTFVDPrMFJHOORfDVjuSiUK/1Ukx/g9rdKOR
	sYKsam8L799AbBrbJPAKtTuxr1bAAmdrQOk8ZheNVakGCVUtFA8iLdFFZJO8RErYdlZXES9OkZw
	ECqYpHnOp2c4SH4NGmm2Ey4I7Dzpc3mkrwM7tG4SNQkRWqvit4IiCPmBNWZDZkEloHIyKPpgrIB
	BJidZLzXj5pBlDqpBPYtZ2y3I=
X-Google-Smtp-Source: AGHT+IGGyxkOHK8GZV6Ekt6wPcd/FqevLtVSgweKGQGNG+bJX6KjbUrpGirBnJ4u9ZEjKg1XNiVySQ==
X-Received: by 2002:a05:600c:19c6:b0:477:7975:30ea with SMTP id 5b1f17b1804b1-47904b25e46mr73013525e9.29.1764187030408;
        Wed, 26 Nov 2025 11:57:10 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040cfe17sm51335465e9.5.2025.11.26.11.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 11:57:09 -0800 (PST)
Message-ID: <577d33c5-bf91-4a23-813b-43df8135aa0d@gmail.com>
Date: Wed, 26 Nov 2025 20:57:09 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <CAGwozwGwkBH_03JvPQrevQiszwDZ5R4uDBnzWVeVXLo8xRmeug@mail.gmail.com>
 <b91fa2c8-e342-9e46-f401-8c3d0590cd38@linux.intel.com>
 <4bcc6708-77ff-403d-83cf-10a40934263a@kernel.org>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <4bcc6708-77ff-403d-83cf-10a40934263a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/26/25 18:34, Hans de Goede wrote:
> Hi,
>
> On 26-Nov-25 4:23 PM, Ilpo Järvinen wrote:
>> On Wed, 26 Nov 2025, Antheas Kapenekakis wrote:
> ...
>
>>> As for "HID: asus: early return for ROG devices" changing the name of
>>> the devices of this driver, I will veto backporting it if it happens,
>>> so inputplumber will have the two full months to remove the name
>>> match. This is not a breaking change in the sense that software cannot
>>> be made to work on both previous and latter versions and there is no
>>> other software to my knowledge relying on name matches for Asus
>>> keyboards.
>> Did Hans give some opinion about this rename earlier, at least I don't 
>> remember nor could find from lore archives?
> I don't remember commenting on this myself either.
>
> So generally speaking there are plenty of cases where /dev/input/event#
> nodes for a specific device have their name changed by some kernel patches.
>
> Typically HID input devices are matched in userspace by their
> bus:vend-id:prod-id triplet not by the name. The name might even
> change by a fwupdate of the device itself.
>
> So I'm not overly worried about this and inputplumber seems nice
> enough and already is very much not a plug-and-play tool.
>
> One possible concern with laptop keyboard input-device name changes
> though is hwdb entries to fixup scancode -> ev-key-code mappings.
>
> See: /lib/udev/hwdb.d/60-keyboard.hwdb on any standard Linux systems
> an then the big comment at the top.
>
> An input-device name change might break this match pattern:
>
> #  - Input driver device name and DMI data match:
> #      evdev:name:<input device name>:dmi:bvn*:bvr*:bd*:svn<vendor>:pn*
> #    <input device name> is the name device specified by the
> #    driver, <vendor> is the firmware-provided string exported
> #    by the kernel DMI modalias, see /sys/class/dmi/id/modalias
>
> As well as the extended version of this and for laptops with USB
> keyboards this is the only match type which allows a DMI match
> which is what we want for laptop kbd mappings. Looking at the Asus
> section of the upstream 60-keyboard.hwdb I do not see any such
> matches though.
>
> There not being such matches kinda make sense since for USB-HID
> devices any special scancode -> ev-key-code mappings are typically
> handled in a vendor specific HID driver like hid-asus.
>
> TL;DR: I think that the input-device name should be fine.
Thank you very much for this write-up! Now I feel much more confident
in giving approval!
> Regards,
>
> Hans
Thank you,
Denis

