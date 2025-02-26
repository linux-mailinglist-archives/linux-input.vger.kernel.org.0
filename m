Return-Path: <linux-input+bounces-10390-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57012A459CC
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 10:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D21B41681B6
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 09:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC02B2036EB;
	Wed, 26 Feb 2025 09:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Ko46NzC3"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0DF258CED;
	Wed, 26 Feb 2025 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561448; cv=none; b=PvpcKUgUIaKPGlT88aKv5Pij9yudEy0gbOdyVcNpBII5FgIC/0GVlFnqMYw31kJoT0ZRn4QIxZzeTT1DOKFp3Bs1xANQLSnCqkYJjoiH1Y9Alqc0b71mINnZDRWCare8rnB26CrnScr7EIn5Ono8haSiAh+06xgb1DNGqL2N6oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561448; c=relaxed/simple;
	bh=UrvdQpPYbFyEzQ2dj9Ih1Yo65Ligf3U8qQjl/It0xdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhYmxeVCSJiDhkb4uqDRx0eFhiF3nqUXNTweCFz86cwhwnKwRpa71XndPetx5lqpuqwEFW0hg1vHguE072k8Jn3dqjorwydFqnWfwhbLe3x/ZaYPEaOwRq0+Aro0LzD6j3k5mK35gPZEo9wRTo61VLQkwQzjy3iU2KwjOTjnPOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Ko46NzC3; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id C70472E07CBC;
	Wed, 26 Feb 2025 11:17:21 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740561442;
	bh=UrvdQpPYbFyEzQ2dj9Ih1Yo65Ligf3U8qQjl/It0xdE=;
	h=Received:From:Subject:To;
	b=Ko46NzC38Uto0/HdECvQEuenxC1oVRlMADJjViH4Fbmn0qJ86vGVzG5+HV65nWRcF
	 ZtLxSt2MOQJZGw94BQqiJFC2szJLL08zRz2vavnJwV159K/sfJDI5kMOmFvThKSdGi
	 j3xZwbnmLxFqVw/vvN9zJk/6hrRlTxEEWbyexrvA=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.167.51) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f51.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-545316f80beso5871927e87.1;
        Wed, 26 Feb 2025 01:17:21 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUZUmLVXgEGDJVbUTsF/xGaBPOTljVvfdFvyqTrk+V9ut04FWAY2XZha+G2zEmNc87T6hQF9xW9HP/RU4XcM4RYMt2XTw==@vger.kernel.org,
 AJvYcCVOOrJEiIWCtMRzPQZCrJ+1NBO7ljGvR4B42pWSKnIU2A1F2oAEi68A9ehTfAx2t5G4qMSdd0j+ndqHHg==@vger.kernel.org,
 AJvYcCXyFz4Z/AiWn/RNhuORzSWhXPCL/Z1wUosg93tDozQT6lcZdBzZpihmUHui3wh6Mb9B5+zsvWleWcwH0ef2@vger.kernel.org
X-Gm-Message-State: AOJu0YzDegkWK9PxbqZxog6bMfc7Z1otV1k57J0QJPxFHLNjt/vuuwZf
	Mn5Ioq/v/3cZAUEEwU/zKOScuaimM1aenWJjPSi37amp56+7Ne+Qzk8Vvblv2KfjTc8kMM/7HYp
	lDexqaAOh/L8ii/ufi+KXc0Oemjw=
X-Google-Smtp-Source: 
 AGHT+IGE2unUDzjwlB+bHwcYrpsMI+bA11uuE3Y2N915MIkq7/W/KAO/zXWqzdfS2aUXpr/1kDL2iTudXSCcU3xlmWA=
X-Received: by 2002:a05:6512:b98:b0:545:353:4d46 with SMTP id
 2adb3069b0e04-548510d8085mr3569969e87.25.1740561438044; Wed, 26 Feb 2025
 01:17:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225081744.92841-3-luke@ljones.dev>
 <20250225141549.11165-1-lkml@antheas.dev>
 <027706ba7b19a4eefb51aeddb5d10cc235751780.camel@ljones.dev>
In-Reply-To: <027706ba7b19a4eefb51aeddb5d10cc235751780.camel@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 26 Feb 2025 10:17:06 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGwjM7hGOm+6iDHg7Q1StbEYRm=cU-8Cx4v==V1d9W4=w@mail.gmail.com>
X-Gm-Features: AQ5f1JoUUV8wL4l4QGiQyFCh4eYRWD5JRzpX6lnpzo7KYr3xHPc7DEnzTOG9sfo
Message-ID: 
 <CAGwozwGwjM7hGOm+6iDHg7Q1StbEYRm=cU-8Cx4v==V1d9W4=w@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
To: Luke Jones <luke@ljones.dev>
Cc: bentiss@kernel.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	jikos@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174056144234.18095.2788953362654973868@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Hi Luke,
using your maintainer status and your NDA creds to veto my comments
will not go well for you if you end up breaking the driver.

Yes, I have done extensive testing with setting the powersave
parameter. I have supported it since September. It is very easy to
break the controller if you start writing to it randomly. In fact,
when I pushed it out [1], it never got out of testing because I got
three user reports about it so I had to make a revised version [2].
Notice there is a day difference between the versions. We never needed
a boot workaround for the original ally, and if you ask me, the reason
your driver here includes that is because in all your testing you set
the powersave parameter.

When it comes to RGB, without a quirk it looks to me as if the MCU
hardlocks and stops accepting RGB commands. I am pretty sure I wrote
to it manually, but excuse me if I am wrong as there have been 5
months since I did the testing for it.

In your new armoury driver, you tried to make internal names
accessible to users via the BIOS interface to make it more user
friendly. In this case, you need to use the names Asus uses in
Windows, otherwise users will get confused. Failing that, asus-wmi is
a perfectly fine driver as it is, with mcu_powersave as an internal
parameter.

As far as I am concerned, the whole Ally issue boils down to the
Modern Standby firmware notifications in the Linux kernel being in the
wrong place. You can see it in the Microsoft documentation [3]. The
Display Off call should happen when the display turns off, not after
the kernel has suspended. This change will need to eventually happen,
as Asus is not the only handheld manufacturer doing this. All
manufacturers turn off their xpad controller via those notifications,
including Lenovo, GPD, OneXPlayer, and MSI. Fortunately, this issue
seems to only affect asus in a major way, although I suspect it causes
a quality degradation in other manufacturers as well.

Given that I do have a custom kernel now and i can rewrite it as I see
fit, I am giving you carte blanche when it comes to the mainline
kernel. As far as I am concerned, my Ally 1st gen/X integration
finished last November. So I will not be revisiting it or doing any
additional testing to validate any new claims or changes. I will just
be removing them and pointing users to my kernel.

Best,
Antheas

[1] https://github.com/hhd-dev/adjustor/releases/tag/v3.5.0
[2] https://github.com/hhd-dev/adjustor/releases/tag/v3.5.1
[3] https://learn.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby-firmware-notifications

