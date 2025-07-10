Return-Path: <linux-input+bounces-13473-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67431B0063E
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 17:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0E2B189395F
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 15:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B46B273D96;
	Thu, 10 Jul 2025 15:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaW19AsV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961F922425E;
	Thu, 10 Jul 2025 15:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160554; cv=none; b=fnW+Xfh3c0MJBaMYmBlFtDKK4y4aMWcQgp9fyxWdn/TXL7TqeWco6c73KcTbTgnNJ4qHyCSUXuZojqZaJRSUrTREDhtNt3f1XFpUzDBfqmMCPO5YU63Iw6XlUpgN/Pxd7PMIsdVbM6usXqnDabWjCzz+REjZWo5cR8FEaYLy1Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160554; c=relaxed/simple;
	bh=cP2XdFEmvXS0OKxHIMqQZXRB1hVTr99YjAXWGN4d8uI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZpqjbioVo403nfllDpHhLdBP0+8nWeVErpbsShFdMxsjvvGXKvtAtq05QREqe66HEe1PoNPqLAfzdocTushRrYB3XlhuozLiyCcE0f4cYUYL/Kp2FpL8ULDQf82SB4RcmCOOtQw/i2/8szMqemqivvaJlX32fXF+qR0//JMXReY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaW19AsV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313cde344d4so1326077a91.0;
        Thu, 10 Jul 2025 08:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752160552; x=1752765352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k2Ut5zqrT/gFfDOz4SYZ4KaqF0Yng+eUvKdctMowZis=;
        b=eaW19AsV/bBm/VHvFuY+3nX7zQ38DqMxLSwIsn38KzqO0kjelNfobyOkhey3JxJ8Uv
         Cj7B4+5sQZtUsLe2uOXRE1GquEWpbSBQQa7bohHD+Ws1r8n/3fLFgZ2rlwVSoPastA00
         Bvbr+kjecbIk3RQgwfJKLofVWK+6zi4rqOYIIzZBK60vHXiEgqxvzMX/bLEUuTqAZsZn
         8lpATbaXHXjpaA/o/rKDC0s8eXQFBo33FH5Gp4dUMRKudb8Ud1vlND2UrHLIjpOJMSYy
         bk+gau338z7FASJH1TtUzRF8geSKADc1lgR3ITMPXoQPk0Mk7FsRJcuoG27tEBpeuXFr
         DVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160552; x=1752765352;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k2Ut5zqrT/gFfDOz4SYZ4KaqF0Yng+eUvKdctMowZis=;
        b=d+qOQhMvEUo4IJOOes42iaPC5CKE6gSBEK0GShUD5QIdE1Oo+ffvML1X0bzmAH5W7U
         ybpIUWx9gn/YpuKFriACTwV+zYHHKuE6oFvyosMlro1vA9TpkZ/y8oqeJbrZlV+zUaWd
         dEcpMEPVv8aiSBA/LBfqfwqtkYE+sRyCDIglRChNkwg2dfGAPzGWoDcuaIjwjRY+AjGI
         JVr7gB5BJUlccuza5xkmW6nl/171nsbZ8lDEeN7J3xxlhQDm2Vn5yqFt8KGyAM1cMJMl
         Xjo9ZecyB6xQkWJvZO2qojr3HHipQmpL7xPhBxHEsTbU0bWshYsaK0a28R1I1RItVWcn
         O9Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUmBQLmRaCBG8yIPmfiXZbjBB8C2Jjhvb+C/26iHePRebVLndReZ62wYCFjwX5AzIBcZ81BDWQ6IU4=@vger.kernel.org, AJvYcCWIwuwTlz+dPjaHGgfCKXBNAQYUstCnbdUONlLBPKf4hNudiYJ9Id0YiPP4zRTtYvjf3q4XFILogng7LkdJ@vger.kernel.org, AJvYcCWNfstO1qoXUrFrgE1gbhM/k6Q/GC4Eua5k47AUHPsBMriVyamhCi1PYvzJ/DQzDsEEz6JHi75hk/K5L8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSTLNENLeOhfiVTasddbB4pWguBJHWw5JPr+vr8NMQwz1povk6
	p6XXHRNdxMh+AAhJjF/5qfaZOmxS2qq72BqHkfDfZLOaFj85Vv9rJBVSaJLg2A==
X-Gm-Gg: ASbGncu7dF8K4VEneCp+h6ZTlY8drb23t9NzYppgeJQmXxxIy4vDPWyRpqk3ggdDaTi
	YBTu4EooAhoGOFqROxxWHinxfn9Nhf6OXGB0klvLFT2Dyii+/o0Lzp7CbpmR7i6zBLZnb8xBGkv
	Pun5+0YsUxlTaYmZ9EQaxjsOgieIuO+RvhBhHXVTPnV2h5FqSnBS6QTPh6qkn/cyzv8+LH4/AdL
	/GCtA3cIaM43mXTr+ws45m24eztSR+RrNTGQDtq9DwB0uoCDVpVQ2FUSpo0s1VbFx0V+IdYpJea
	waNbFLHnTJAofdA1YgHGcvcp6z1KEGiD625wJ6t/8l5lzZ3fpeEezsCeNhy8imrduLvtRYvn+iD
	LgzXIFx2B
X-Google-Smtp-Source: AGHT+IFpSknIX5oQ3t+hSQemLFiY5TGbNbhPCpiXc0cVzMXY7k38QDCJh161Fl99D1arZbVAY4cPnA==
X-Received: by 2002:a17:90b:1a91:b0:313:28f1:fc33 with SMTP id 98e67ed59e1d1-31c3ef23af9mr4987342a91.10.1752160551522;
        Thu, 10 Jul 2025 08:15:51 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2607:fb91:1be0:77b7:ac39:c338:9a9b:5f99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3e973e75sm2656739a91.16.2025.07.10.08.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 08:15:51 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:15:49 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Mario Limonciello <superm1@kernel.org>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] HID: Add Legion Go S Driver
User-Agent: Thunderbird for Android
In-Reply-To: <j3isljjyd6rlddlhpp7knxgss2mpr4ft3pcx5lc7r5r4bnnzpw@wjr6brfv2hsf>
References: <20250703004943.515919-1-derekjohn.clark@gmail.com> <j3isljjyd6rlddlhpp7knxgss2mpr4ft3pcx5lc7r5r4bnnzpw@wjr6brfv2hsf>
Message-ID: <3690C9ED-FC73-4783-8EB4-2CFA148E8573@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On July 3, 2025 6:48:00 AM PDT, Benjamin Tissoires <bentiss@kernel=2Eorg> =
wrote:
>Hi Derek,
>
>[I'll answer to this email with a very high level overview of it, as I'm
>not sure I'll have time to dig much deeper in 6/6 today=2E]
>
>On Jul 02 2025, Derek J=2E Clark wrote:
>> This series adds initial support for the Legion Go S's built-in
>> controller HID configuration interface=2E In the first patch a new HID
>> uevent property is added, HID_FIRMWARE_VERSION, so as to permit fwupd
>> to read the firmware version of the HID interface without detaching the
>> kernel driver=2E
>
>That immediately raise red flags on my side=2E HID_FIRMWARE_VERSION will
>likely be used only for this new driver, and that means a special case
>in each and every client=2E
>
>We had to deal with firmware versions in the past in the HID drivers,
>and we ended up relying on the uniq field of the hid_device (because the
>serial+firmware version uniquely identify the device)=2E
>

>> The second patch adds the ability for an hid_driver to
>> assign new/arbitrary uevent properties for static data that doesn't
>> benefit from having a sysfs entry=2E
>
>That, in my mind, is even worse (for the reasons above)=2E
>
Hi Benjamin,

Sorry abtthe late reply=2E Travel & holidays have me a bit behind=2E

I'll let Mario and Richard hash out the specifics on these points=2E I'll =
just add a bit of context to why they're in this series=2E Prior to this, t=
he fwupd plugin would disconnect this driver to query this information to s=
ee if there was an available update=2E As this can be triggered by a system=
 daemon during gameplay that's not a reasonable expectation=2E Originally w=
e had these as sysfs entries, and returning to them, would be simple enough=
, but we felt like this is a fairly standard piece of information that shou=
ld be available=2E I wasn't aware of the uniq property being used for this =
historically, but from an outside looking in perspective this seems a bit c=
onvoluted=2E Apart from just being unintuitive if you're not familiar, user=
space is going to need bespoke ways to interpret this anyway as serial numb=
ers and firmware formatting are not consistent between manufacturers=2E

I'll wait to adjust this until a more thorough discussion has taken place=
=2E

>> The third patch adds the VID and PID
>> for the Lenovo Legion Go S MCU=2E=20
>
>Which shouldn't be in its own patch, but part of the driver initial
>patch=2E

I can do that=2E My reasoning was simply that if another patch becomes rel=
iant on the VID and you needed to revert the other patches for any reason t=
here would be a conflict=2E

>> The fourth patch adds ABI documentation
>> for the config interface introduced in the final patch=2E The fifth pat=
ch
>> introduces the core lenovo-legos-hid driver which acts as a routing
>> interface for the different endpoints=2E=20
>
>That "core" patch is IMO useless=2E All it does is:
>- check for the USB endpoint (but in the wrong way, because if you
>	insert a device through uhid with the same PID/VID it will crash)
>- replace the HID-core core functions with the same code

Can you point me to a better way?

This series only implements the config endpoint=2E ATM the gamepad, touchp=
ad, and IMU are combined into a single Steam Deck like interface in root le=
vel userspace as a uhid device=2E I do have some plans for how to do this i=
n the kernel instead, but the proposal isn't ready yet so I need to keep th=
e hidraw devices available to userspace that aren't implemented yet for bac=
kwards compatibility=2E

>Really, this should be squashed into the next patch (with 3/6 then)=2E
>
>Also, why adding a new subdirectory? All the hid drivers are flat in the
>drivers/hid/ directory, and the subdirs are for transport layers=2E There
>is one exception for the surface driver but I don't see why you need
>such an exception (yeah, the code is big, but what's the difference in
>having a 1500 lines of code source in its own subdir vs at the root?)

Sure, I can change it to a single file if that's preferable in this subsys=
tem=2E This is my first foray into kernel HID drivers so I'm not super fami=
liar with the style preferences yet=2E Breaking everything up by logical su=
bset made sense to me but I'm not married to it=2E There

>> The sixth path introduces the=20
>> config lenovo-legos-hid driver wich uses both the HID_FIRMWARE_VERSION
>> as well as arbitrary uevent properties=2E Additional interfaces and con=
fig
>> properties are planned to be added in a future series=2E
>
>That one is too big for my liking=2E Generally speaking, a commit
>descrition which says "this does this and that" can be split into 2
>patches at least :)

I figured, but I wasn't sure how you'd prefer I break it up=2E I was think=
ing that one patch per attribute group would make sense but wanted some fee=
dback before I did that to avoid going down the wrong path with them=2E

>What kind of future interfaces and config properties are you planning?

The MCU has a gamepad interface that is more complete than what the xpad d=
river uses, which includes some back paddles as well as native gyro data wh=
ich is passed through from the IMU=2E There's also a separate IMU endpoint =
so there are a couple options how this can be used=2E My thoughts are that =
a sysfs attribute could toggle if gyro is added to one of the joysticks usi=
ng the IMU data included in the gamepad report, and the external one could =
be exposed as a motion sensor with the same uniq=2E Then userspace can dete=
rmine how to use it=2E

The touchpad works in both abs and rel modes with the default kernel imple=
mentations but additional functionality can be gained through Steam Input i=
f this is integrated into the gamepad=2E

As far as additional attributes for the config interface, there is hardwar=
e level button remapping and calibration for all axes that need to be added=
 but weren't considered critical for initial support from Lenovo=2E

>>=20
>> Patch 6 introduces a checkpatch WARNING that I'm unable to resolve:
>> WARNING: ENOSYS means 'invalid syscall nr' and nothing else
>> 1292: FILE: drivers/hid/lenovo-legos-hid/lenovo-legos-hid-config=2Ec:10=
85:
>> +       case -ENOSYS: /* during rmmod -ENOSYS is expected */
>
>We can losely waive those while merging=2E We do it quite often actually=
=2E
>
>But trying to minimize checkpatch warnings is a good thing, so thanks
>for that=2E

Cool, I'll keep a brief note for posterity=2E=20

Thanks,
Derek

>>=20
>> This error handling case was added as it is experienced in the real wor=
ld
>> when the driver is rmmod=2E The LED subsystem produces this error code =
in
>> its legacy code and this is not a new novel use of -ENOSYS, we are simp=
ly
>> catching the case to avoid spurious errors in dmesg when the driver is
>> removed=2E If there is a way to prevent this error from being triggered=
 by
>> checkpatch in the first place, that would be an ideal remedy, but I'm n=
ot
>> aware how that can be done at this time=2E
>
>Again, nothing to worry about=2E
>
>Cheers,
>Benjamin
>
>>=20
>> Signed-off-by: Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>>=20
>>=20
>> Derek J=2E Clark (4):
>>   HID: Add Legion Go S ID's
>>   HID: Add documentation for lenovo-legos-hid driver
>>   HID: Add lenovo-legos-hid core
>>   HID: Add lenovo-legos-hid configuration endpoint interface
>>=20
>> Mario Limonciello (2):
>>   HID: Include firmware version in the uevent
>>   HID: Allow HID drivers to add more uevent variables
>>=20
>>  =2E=2E=2E/ABI/testing/sysfs-driver-lenovo-legos-hid |  269 +++
>>  MAINTAINERS                                   |    7 +
>>  drivers/hid/Kconfig                           |    2 +
>>  drivers/hid/Makefile                          |    2 +
>>  drivers/hid/hid-core=2Ec                        |   11 +
>>  drivers/hid/hid-ids=2Eh                         |    4 +
>>  drivers/hid/lenovo-legos-hid/Kconfig          |   11 +
>>  drivers/hid/lenovo-legos-hid/Makefile         |    6 +
>>  drivers/hid/lenovo-legos-hid/config=2Ec         | 1518 +++++++++++++++=
++
>>  drivers/hid/lenovo-legos-hid/config=2Eh         |   19 +
>>  drivers/hid/lenovo-legos-hid/core=2Ec           |  122 ++
>>  drivers/hid/lenovo-legos-hid/core=2Eh           |   25 +
>>  include/linux/hid=2Eh                           |    2 +
>>  13 files changed, 1998 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-legos=
-hid
>>  create mode 100644 drivers/hid/lenovo-legos-hid/Kconfig
>>  create mode 100644 drivers/hid/lenovo-legos-hid/Makefile
>>  create mode 100644 drivers/hid/lenovo-legos-hid/config=2Ec
>>  create mode 100644 drivers/hid/lenovo-legos-hid/config=2Eh
>>  create mode 100644 drivers/hid/lenovo-legos-hid/core=2Ec
>>  create mode 100644 drivers/hid/lenovo-legos-hid/core=2Eh
>>=20
>> --=20
>> 2=2E50=2E0
>>=20

