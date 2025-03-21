Return-Path: <linux-input+bounces-11045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74283A6B235
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 01:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 803F73B1ED2
	for <lists+linux-input@lfdr.de>; Fri, 21 Mar 2025 00:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590BF3D76;
	Fri, 21 Mar 2025 00:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="s+dfSq5R"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2F92C182;
	Fri, 21 Mar 2025 00:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742516612; cv=none; b=VV5SBw3MlgJ4p+4cOC8yRBEQGZ5jvzMtS5cg3hfFqEZITvFUbPND2f8JITxniGdqdl0O6cXmaQBm4FCGVG23ZZMxLVFw89bKYkk/Y/MQKWtpAtq18bqq5k5UiAjM3hjB21vz3xl4FPiWztyHtIqrO7yfA0U9I3TjYnbkZ/nS+Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742516612; c=relaxed/simple;
	bh=XiBVzxWuMP75Lf3JOuywE0fJX4RWc46dIGCi9V95zQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIRMqJe6rEsPnV8EdWdUC+0ScLZDIPbY+QTL/E2K5BAnEEkSi5fBZF6vAHVlZTQVJKKmYE71uSWw6tvwJampVYUpOVdacMKhczDvUJQOPpI1rVOl7TmKZG1ZY1jJASVLpNJgo7/YAeUUixRsM8sCtKIyzfsEUm39yLOkGHBMwJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=s+dfSq5R; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 832DA2E09F0B;
	Fri, 21 Mar 2025 02:23:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742516606;
	bh=rycKiZkMDvsHzmc5HyGNlogDLpqUzYvCxxDzhBvTk48=;
	h=Received:From:Subject:To;
	b=s+dfSq5R1lM2hEejcNnTrjrGJhMIIS46AIvVRFJXSilmAfnX845PCxs1GZCDdPtgw
	 pibWhcofcJ55zbbNapIgIY7JWHJRQozhViyLZExk7cL2QhmGyPNJwn/4/jfPL1RUqg
	 Hze0FCw06He3pOlfimu5z3za7SeVmmarUxvOYllE=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.182) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f182.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-30b83290b7bso14427711fa.1;
        Thu, 20 Mar 2025 17:23:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXBLr4uIzKp2heC+MLAFsj/yPfZsw/ZWLUXh8+xpGYvTJXRpNZHYtWEKXAvgmjboM73BWKVQVsR4zGAQML5@vger.kernel.org,
 AJvYcCXgOJLwJFLYs970QPpGPiFitxeunPgTcc8NtO4qztqv0QMSSZCZ1YW9qEG36aUxBj4Hmw1dFr3ENBQpbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU8rqxNCqREEJ6bRT5B+6/BDbANWsid9ohBqVs/mMltFz8jW3C
	MNRdrRmo0tHfx/LmaAmw4S/wEDMn/0GUTlmQ+nPEmup9BMkWVC2UXQIZYWq9RmqmPcTtoy1IX2O
	3oVsrJMdk+rCYGUaUPy9z5wFO13g=
X-Google-Smtp-Source: 
 AGHT+IHv5Gi0/dpuFPXhqwCzQTaXhguD71sw2H/LyPEAzJnlFkAi/TYYYf+ZYfeIs/T3D7azVqoqCxnLG1fIHm8aC+A=
X-Received: by 2002:a05:651c:1502:b0:30c:6f3a:dce9 with SMTP id
 38308e7fff4ca-30d7e21a70cmr4705571fa.10.1742516604701; Thu, 20 Mar 2025
 17:23:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320220924.5023-1-lkml@antheas.dev>
 <a9697222-59ed-4673-aff6-ae4ca50bb824@ljones.dev>
In-Reply-To: <a9697222-59ed-4673-aff6-ae4ca50bb824@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 21 Mar 2025 01:23:13 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwF4BwRapZ2O0UR5-RyrdrO=_r29hWkSO5xEWc0aoKxJWA@mail.gmail.com>
X-Gm-Features: AQ5f1JrsPCNDkSOefrCvhn278OboBEGkRTwJzFYXmc-52DlNQW3mWkb9_7Mrsao
Message-ID: 
 <CAGwozwF4BwRapZ2O0UR5-RyrdrO=_r29hWkSO5xEWc0aoKxJWA@mail.gmail.com>
Subject: Re: [PATCH 00/11] HID: Asus: Add RGB Support to Asus Z13, Ally, unify
 backlight asus-wmi, and Z13 QOL
To: "Luke D. Jones" <luke@ljones.dev>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174251660590.6943.3115647025904587249@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Fri, 21 Mar 2025 at 01:03, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 21/03/25 11:09, Antheas Kapenekakis wrote:
> > This is a three part series which does the following:
> >    - Clean init sequence, fix the keyboard of the Z13 (touchpad,fan button)
> >    - Unifies backlight handling to happen under asus-wmi so that all Aura
> >      devices have synced brightness controls and the backlight button works
> >      properly when it is on a USB laptop keyboard instead of one w/ WMI.
> >    - Adds RGB support to hid-asus, solid colors only, and for the ROG Ally
> >      units and the Asus Z13 2025 first.
> >
> > For context, see cover letter of V1.
> >
> > The last two patches are still a bit experimental, the rest is getting to
> > be pretty stable by now. I will test my Ally in the weekend. Also, I am
> > not a fan of the asus-0003:0B05:1A30.0001-led name, so suggestions would
> > be appreciated.
> >
> > ---
> > V1: https://lore.kernel.org/all/20250319191320.10092-1-lkml@antheas.dev/
>
> Hi Antheas, just a very quick note before I review - did you forget to
> add `-v2` to git format-patch? Don't do it now, it's just a reminder for
> next version.

Yes I did. It's been a long day.

> Also I guess asus_brt_ means asus_bright_, but maybe we can rename to
> asus_led_ or even asus_rgbw_? I think something a tad more descriptive
> while still keeping the length down would help future contributors
> quickly understand intent. I'll mention it again when I get to that
> actual patch during test and review.

I am not particularly happy with brt either, I chose it because the
events are named BRT. rgbw is a bit misleading, the notifier will
never do RGB. Since Aura devices can hotplug they need their own led
device. It will always passthrough brightness only. Perhaps led is
misleading for that reason as well. Bright seems a bit weird, and
brightness seems a bit long. So I am a bit stuck

What I think would be better is to refocus from leds, to maybe
hid_ref. As I'd like the fan key to passthrough to asus-wmi too to
cycle the profiles. I'd also like to tweak the profile cycling
behavior a bit and make it customizable. But very minor changes, just
to cycling behavior. Essentially, I want to get to a point where doing
Fn+Fan cycles the profiles properly without userspace, and then
userspace can take over the cycler and update the KDE slider live.

However, that refactor on 6.14 for platform profiles was brutal. So I
have to wait for fedora to get on 6.14 for me to even start thinking
about that. Otherwise I will not be able to deploy any changes on
Bazzite. I currently carry 287 patches (~100 is XDNA+NTSYNC+platform
profiles minus Kurt's series) for 6.13. I would also like try to
target Thinkpads too, and maybe the Legion Go with that, but it
depends on how much progress Derek makes on his driver by then.

As far as the Z13 is concerned, it will be this patch series + 1-3
patches to tweak the ROG button on the side to stop acting like a wifi
killswitch.

Antheas

> Looks like good progress so far.
>
> Cheers,
> Luke.
>
> > Changes since V1:
> >    - Add basic RGB support on hid-asus, (Z13/Ally) tested in KDE/Z13
> >    - Fix ifdef else having an invalid signature (reported by kernel robot)
> >    - Restore input arguments to init and keyboard function so they can
> >      be re-used for RGB controls.
> >    - Remove Z13 delay (it did not work to fix the touchpad) and replace it
> >      with a HID_GROUP_GENERIC quirk to allow hid-multitouch to load. Squash
> >      keyboard rename into it.
> >    - Unregister brightness listener before removing work queue to avoid
> >      a race condition causing corruption
> >    - Remove spurious mutex unlock in asus_brt_event
> >    - Place mutex lock in kbd_led_set after LED_UNREGISTERING check to avoid
> >      relocking the mutex and causing a deadlock when unregistering leds
> >    - Add extra check during unregistering to avoid calling unregister when
> >      no led device is registered.
> >    - Temporarily HID_QUIRK_INPUT_PER_APP from the ROG endpoint as it causes
> >      the driver to create 4 RGB handlers per device. I also suspect some
> >      extra events sneak through (KDE had the @@@@@@).
> >
> > Antheas Kapenekakis (11):
> >    HID: asus: refactor init sequence per spec
> >    HID: asus: prevent binding to all HID devices on ROG
> >    HID: asus: add Asus Z13 2025 Fan key
> >    HID: Asus: add Z13 folio to generic group for multitouch to work
> >    platform/x86: asus-wmi: Add support for multiple kbd RGB handlers
> >    HID: asus: listen to the asus-wmi brightness device instead of
> >      creating one
> >    platform/x86: asus-wmi: remove unused keyboard backlight quirk
> >    platform/x86: asus-wmi: add keyboard brightness event handler
> >    HID: asus: add support for the asus-wmi brightness handler
> >    HID: asus: add basic RGB support
> >    HID: asus: add RGB support to the ROG Ally units
> >
> >   drivers/hid/hid-asus.c                     | 342 ++++++++++++++++-----
> >   drivers/hid/hid-ids.h                      |   2 +-
> >   drivers/platform/x86/asus-wmi.c            | 138 ++++++++-
> >   include/linux/platform_data/x86/asus-wmi.h |  67 ++--
> >   4 files changed, 411 insertions(+), 138 deletions(-)
> >
> >
> > base-commit: 4701f33a10702d5fc577c32434eb62adde0a1ae1
>

