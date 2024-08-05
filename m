Return-Path: <linux-input+bounces-5341-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF869947CD2
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 16:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F36ED1C21CD5
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 14:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D856D78297;
	Mon,  5 Aug 2024 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiYsRYdI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA0F39FE5;
	Mon,  5 Aug 2024 14:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722868236; cv=none; b=AgPubTkEnpJuAtiF+jQmYkSVOyahNb0JA0NkkxrOEB13aJmbejO35j9Sh3fAhFO3lgpx8Ei5m90MWtsdvf/ljnURwscngjbErwFGpGZayKPU+0WOLS/IwZ7ELdeV8AaNC9P5WJy6aEOg9N7C45czxbR1TSgcg+iDmHZBIiIAbmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722868236; c=relaxed/simple;
	bh=ZcXsli7Wq6O+TcwcCL2GIts9fcHa+mNkbfZaKZu+1d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdGXDQJFCIs1zT6xCzQmQJyIEOfKYamwglKYZCFfFypT43QAS5uGCqK7VmlRgE4pUgS+DYftA6SNaWTtwoglu40aNyPdUWIga39nz0/Sy9HUUBiA09C0QXCBU8EwcnZv7aLSMjWWnqKT8RfoGqaayjMO4N8gyV/C1k1ZhNVp7Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiYsRYdI; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-39b04f0b486so23121875ab.0;
        Mon, 05 Aug 2024 07:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722868234; x=1723473034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+yrOWpOCkkddMkiXMLdz+46OmmK+WGMbSxxPYuQdxYE=;
        b=AiYsRYdI7sqjUS23zfAqSLuWN9Q/4/4vAV+covR6PUpgHOI0BlgvkIIZ14LO6aBUkm
         ovfVyKwky0/oXC/yXzn7aVoiWV2/0IWhA9OEcTkcme6I+AkPNdffQyuaoP+oCBJRCUBK
         G6D3bCdw+/YBwdig0GlEnTHA1UNVsJnrChIk6/SuPhkaa4hqqh2+qsoTeiJmFoMMDNd3
         CmbYPRGhrPacam4aq9ADRY5P0hpdyQV3cCypc6825upIa7qrpuuyUSacYZhHOhPB97HZ
         iGKmc/Qe3UjWE1WQNJwwjlhTdxu9LGoDO+WZUwY8A1qzbZRUZMVY4v5pOTmjmY2RfzYi
         m/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722868234; x=1723473034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yrOWpOCkkddMkiXMLdz+46OmmK+WGMbSxxPYuQdxYE=;
        b=AoO14asyHqMKm9qWQbTs9xnKN/cddgjoWNoZO5QyWuU2D4uaVluwG5glb/3zDYrln3
         ByQj12MCdL6662KmH4tY6+k8zdeuCoHhV991tnd57sDCfbfpMilg7wBnt5qzoKtgZopw
         4+I9Kk5Wdv6YhhzRy6PqGvRemBtLqjjZI184JQ8Yo8jC6Ofzm0lbbAx43a6BGhTrlTlh
         NIO9Mf5mEkCojlTXYF6KQVcSho5YipxJYdf4oUf+xoYzNLIz4SK87qiVKy71WEIvJHrr
         QZ4nBk17fpdVVho3f3ta6wzgvuhedH/hZPilAAdncyDdAiqPPnYSELJa/5lBHVTzlgDb
         WEgg==
X-Forwarded-Encrypted: i=1; AJvYcCX9JcfSwrIDbonD4nvMRnIlQ2MdnhzC2q5/Y7U7Fb1cE9PFWy2eomYShHdZuDbohJZIDmjPGuK+1vbL88ngAPJdcfojbpCHRYRIdEmTZWCTDCoJfheNi2Ecqo+CoVRjABD9ChEl+w9eQzaBbrSf2RCCuuZz6SstKZ0dMELtVNo25mF53vLb1VeF
X-Gm-Message-State: AOJu0Yw1vbk2xYxoYF/D35XrKutVGuOOYqb1c10S5eztWg34n84Mi3fX
	jsMvfTfVpAP8pa/6sGUilY+rBnmXvlqUcWVjEmV7+bJx41lf4OZQ5TB5RA==
X-Google-Smtp-Source: AGHT+IEsKEn4rwrAz2co2tT9ngMnFMLGY4PnwV73FVaRcsOY2AX1t501mMa2iwMP96ahqra9Kvvilg==
X-Received: by 2002:a92:6e01:0:b0:374:aa60:a5c3 with SMTP id e9e14a558f8ab-39b1fc3b201mr119278905ab.28.1722868234250;
        Mon, 05 Aug 2024 07:30:34 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7bb80ef3f8asm1015226a12.58.2024.08.05.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 07:30:33 -0700 (PDT)
Date: Mon, 5 Aug 2024 07:30:31 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ike Panhc <ike.pan@canonical.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>,
	Maxim Mikityanskiy <maxtram95@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Stop calling
 i8042_command()
Message-ID: <ZrDiBxZ7ZiNrwB9c@google.com>
References: <20240805141608.170844-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805141608.170844-1-hdegoede@redhat.com>

On Mon, Aug 05, 2024 at 04:16:08PM +0200, Hans de Goede wrote:
> Commit 07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
> added an i8042_command(..., I8042_CMD_AUX_[EN|DIS]ABLE) call to
> the ideapad-laptop driver to suppress the touchpad events at the PS/2
> AUX controller level.
> 
> Commit c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux
> port on/off on select models") limited this to only do this by default
> on the IdeaPad Z570 to replace a growing list of models on which
> the i8042_command() call was disabled by quirks because it was causing
> issues.
> 
> A recent report shows that this is causing issues even on the Z570 for
> which it was originally added because it can happen on resume before
> the i8042 controller's own resume() method has run:
> 
> [   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
> [   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
> [   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
> [   50.247406] i8042: [49434] a8 -> i8042 (command)
> [   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
> ...
> [   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> [   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> [   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
> [   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
> ...
> [   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
> [   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
> [   50.248407] i8042: [49435] aa -> i8042 (command)
> [   50.248601] i8042: [49435] 00 <- i8042 (return)
> [   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55
> 
> Dmitry (input subsys maintainer) pointed out that just sending
> KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON which the ideapad-laptop driver
> already does should be sufficient and that it then is up to userspace
> to filter out touchpad events after having received a KEY_TOUCHPAD_OFF.
> 
> Given all the problems the i8042_command() call has been causing just
> removing it indeed seems best, so this removes it completely. Note that
> this only impacts the Ideapad Z570 since it was already disabled by
> default on all other models.

Right, I think stopping using it here is the best. I also had a draft of
a patch to allow establishing a link between i8042 driver and users of
i8042_command() so that they do not disturb resuming of the keyboard
controller. I need to finish it.

> 
> Fixes: c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on select models")
> Reported-by: Jonathan Denose <jdenose@chromium.org>
> Closes: https://lore.kernel.org/linux-input/20231102075243.1.Idb37ff8043a29f607beab6440c32b9ae52525825@changeid/
> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

FWIW:

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

