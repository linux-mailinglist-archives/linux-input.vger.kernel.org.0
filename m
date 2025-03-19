Return-Path: <linux-input+bounces-10991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A9DA69B38
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 22:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412D146408C
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 21:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB83219312;
	Wed, 19 Mar 2025 21:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="o+ckQGHF"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE97213232;
	Wed, 19 Mar 2025 21:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421049; cv=none; b=GBQ8zqdQvQQuK8xHrjiZG8+Pzcm70wx21w+1XBWYBLNR/xk1/H7g+rXHhX3nHKsRAPgvjNeI4Zgu76Aj1XBVL0hqGsuIndiXlzerjrv71eRTSBWKue5ZGa7tzh1ElnptC5Rt4hcNj/d5yCdqBlLebNldReYLO4BiSu0mJfXWtjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421049; c=relaxed/simple;
	bh=K4wGqb99oqd7yQEItz1omH6NbLHTyJworzFHW5W9+bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDnv8Xmq9gM5nJRuSp2BIRjqRaJBHGqJtW4i/23pW7Ww8zSrcK+QOl2GR18huIbYttVgKAUmZIon9UKP/ySsDJb1gMZWVhSxVDELn5otNAXPP2oBKJgSFLqVwvQOujkDlQ/7hO/7JNAQ9Qt7wyAE/RTN0NYB2D+J57OtcYymkjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=o+ckQGHF; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id C3A642E095D8;
	Wed, 19 Mar 2025 23:50:42 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742421043;
	bh=K4wGqb99oqd7yQEItz1omH6NbLHTyJworzFHW5W9+bw=;
	h=Received:From:Subject:To;
	b=o+ckQGHFi4LIIwwyU426LqntYKeQjh7ZTeSJRRR+CS6E4/zhCzEoFVk+s8GK7ysGD
	 DYeRke9Gtvo7+PgG0NcP1E8HedX1OcxEIEc75ZMoYwYFR8E11s82sciAAMbdW0PhK8
	 sjWLOHQTxTlJNdfQc380YpPgAl5NhNqI9+PKjLcY=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30bee278c2aso13988201fa.0;
        Wed, 19 Mar 2025 14:50:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUbuQdC8donVcKVRzWOn8BwKn8mV0ro8nz6y2kwY6N/T8hAJzjZCABXvheKtZ+JcGPZ5TPoIcwr8Fpl3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzogrt7JD1GTGHLW2UkMf9uhNWRs/1jVAGf8TN075jIE5/TDJWu
	eVIafcRczPfwmSB50M9EWPiWIZ+DI1wi+BhXZGE5h1hOvq40S80sk8R1WbDgHW6Z88SBL+BQeUv
	Iw7j2q2GVSRu1DGEEr5AcvQeb8ek=
X-Google-Smtp-Source: 
 AGHT+IGoMfjWZwDQBc1Y3rzGZQMdxLDjvKT9WTt0vZ+2gI80gbAaLzW4nvm6rQAHHJkVzE9dMKLlwJcuZ5OEJZAaUjA=
X-Received: by 2002:a2e:96ca:0:b0:30b:f0fd:5136 with SMTP id
 38308e7fff4ca-30d727b936bmr3911971fa.18.1742421041942; Wed, 19 Mar 2025
 14:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319191320.10092-1-lkml@antheas.dev>
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 19 Mar 2025 22:50:30 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFRScPtHnnBGe-tftbBqYNM1hAsdGtowSdOpmpaq_Vh7g@mail.gmail.com>
X-Gm-Features: AQ5f1JoKzjfFv42v98ZgUMxbcgV3GyCzYUNLoxZghsnsNCSVWMLHXuvVHYvDna0
Message-ID: 
 <CAGwozwFRScPtHnnBGe-tftbBqYNM1hAsdGtowSdOpmpaq_Vh7g@mail.gmail.com>
Subject: Re: [PATCH 00/11] HID: asus: hid-asus and asus-wmi backlight
 unification, Z13 QOL improvements
To: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174242104316.21484.5198359461273586559@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Wed, 19 Mar 2025 at 22:38, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> This is a three part series that does the following: first, it cleans up
> the hid-asus driver initialization, preventing excess renames and dmesg
> errors on ROG devices. Then, it adds support for the Z13 2025 keyboard,
> by fixing its keyboard to not be stuck in BIOS mode and enabling its fan
> key. Finally, the bigger piece of this series is the unification of the
> backlight controls between hid-asus and asus-wmi.
>
> <snip>
> --
> 2.48.1
>

Update on this. I made a minor refactor today to fix some edge cases
where it was obvious the mutex was not guarding stuff and ended up
locking during unregistering in this series. So skip testing it.

I'll send the fixed version tomorrow, in the meantime you can find it
here [1]. Fixes were very minor, moving the mutexes around in 2
places, so feel free to comment on this series.

Also, the init delay seems to not have worked for the mouse touchpad
bug. Seems like 5 reboots were not enough testing. I will say it is
peculiar that hid-generic works properly, when this series makes
hid-asus mimic it very closely. Also, one rmmod to hid-asus fixes
this, regardless of how many times hid-asus is reloaded afterwards.

Antheas

+CC Mario in case you want to review

[1] https://github.com/bazzite-org/patchwork/tree/upstream/asusrgb

