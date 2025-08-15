Return-Path: <linux-input+bounces-14038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A9B273AC
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 02:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2227E189B082
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 00:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F185143756;
	Fri, 15 Aug 2025 00:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D/lm0CWo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C392AF1D
	for <linux-input@vger.kernel.org>; Fri, 15 Aug 2025 00:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217194; cv=none; b=o02673khvqWnS6eLeokoK0Yr4xteu4ZtkSU+xxZUPshdPevcuCqD5ChtjOMLasdJR6QSBG3/Fef+y/gXgr2/DKwMgAJjmeSETxOlkR7rzKhJBHWmB0qrZ5c3bhnPiYYPnzrbImqMhdYUf23MOpe53hA41CobVeKymju0VTHS8c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217194; c=relaxed/simple;
	bh=pSmdu9muq4NXLatn/DCnS97tZQ+5zeuxvhwelJy44jY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UrUixmj7MRH27QOD+b1cLP9D18Loon3aVgluAs7y6y5WWShHuWbYiTTGfouSS1lIznoyQNi4IW9b54rnhSOzL0TSICjIXjjSu0PJ0Y80VcQMJwJb4yQETJeqnkeEb503gVdN0/0EoFJZGCmcEVpOdED+hXB53MrhSene/rYGjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D/lm0CWo; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b471737b347so1024976a12.1
        for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 17:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755217188; x=1755821988; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VleEWglR379JUi2VRPyVygfWGFpaMa+WQLnA/qDO5J4=;
        b=D/lm0CWo+OwBqcDa51niDg/NmbjaqT1w6g5wjbilit1B04f6jy0H8x2EjtaUySRiRK
         SP/VIjoHLnQtpJgW2kYn0eBxLGqzVJHn3TilkmLOG5Pe7YUndBbhwU6VhCqsm2HoRB25
         ov0zoemFFzGlUx58Yxe6DAjHW3P22OdhwSw9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217188; x=1755821988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VleEWglR379JUi2VRPyVygfWGFpaMa+WQLnA/qDO5J4=;
        b=MuhdiAyK/Yo/xCkcKTOqFnWhc/vCE2H8Crnzz2weVSMXuFwOxc9qYyzlT7KPXzR98I
         36Pc/3uA5scWcbFkxCOmemSb4Rj8ajJoGk2YSE9JEf+afUMsIN9lIi1mnRbb6GUivOXZ
         M8irUEYKP9t7QdqhgmnCUiCgm8ugYbTkB4XIv7GKI2GDg+IkAO1K1s1P1TU5mt4g0mey
         6F/qYPiCs7e7sa3U3Cwtcz7jSDneJZ8j5epaLMaT0GJ0CEzt9CPPRXEBidGh1av3r9Iu
         fKrFTpivRz7O8tCGak9BqKmU51wsC9d708nCe/OsA9+uIxGKYR2MZFry2IxbBPccNju6
         12hQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS8KRtpCDG4A7fzzPyPqzMG2KOuhsKC8l1ZJriGDEI9RjWcXqzGDoON6g9dqmr530vG4T78MA+ooU6Bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ZMCFoA4qzksDYUawu+N4in7dgYWAecepnZ70C1CnvkEzMlvl
	IpHsugNZVdXQZ0Ji1IcWoDjYGPTb/YFaS0KecslGNirY4ISpOR19uVYyDKbdWZ65w/n3gx78Qig
	YHc4=
X-Gm-Gg: ASbGncu0kgkNejkTzs18gKpeWSiWwqLPba6rNHtQGGuVUwcw2/ZZXl8F52LQSQ3vBfe
	frAyXQgaXVF/28WSoHItM8sRFnW9lxDooUhvInVxrS7of7gin9HIJAkOpVnExrZeh6i4pLybOT+
	LcOQ3P+QVrUJ2hFz8nTJNZ6DbMnWMBB0AgljrVOQWQkxcspyhVWqUUXdqqhfnQX+ZNAjPBYsZn+
	EMg3UN4gCSjEiND4Xp4QDpGrSxLqzEojgmfgbD8vlJToA76wqDa+TrKK9NxgmBCj+lx5ibSr8Uf
	BfwvNCSm/mUSOKJag8+XYsiE0lXwqXj0i2qqded4FZDB8fSgu+VTVN7SXeXKL1pGsg4or0I2Vys
	C9J4FIpkXPeZNO1yHWfVSjt62i0Y7lxFnb3ShGQpOGNTRmWxX086Z+lsGgxM93l2XLg==
X-Google-Smtp-Source: AGHT+IHbHdNwOGk+bg0wUXJggnFGL/e1H1Md6O1/0Wk3+omXzQd8iDVC/G6+eatlCcrBMr6eGBqrrA==
X-Received: by 2002:a17:903:2f0d:b0:240:3d9c:6340 with SMTP id d9443c01a7336-2446d71ce95mr1769305ad.20.1755217187958;
        Thu, 14 Aug 2025 17:19:47 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54f7b9sm756185ad.128.2025.08.14.17.19.38
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 17:19:43 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b471754c159so916897a12.3
        for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 17:19:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVw2LKWWw4sothNKTKwrxZHCZC6Z8UgjNUdeTGoBmprP5oeRgt3PCwwwGeHPFhRDY/VIhA+9PnQnzq9TQ==@vger.kernel.org
X-Received: by 2002:a17:903:1a90:b0:23d:fa9a:80ac with SMTP id
 d9443c01a7336-2446d6f0ed3mr1600235ad.16.1755217177677; Thu, 14 Aug 2025
 17:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org> <20250813125132.1319482-2-treapking@chromium.org>
In-Reply-To: <20250813125132.1319482-2-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 17:19:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
X-Gm-Features: Ac12FXzAXTp-VomUKh_3L3spBMWh_fGYcK1SRCaMDzVm6bQCCPWcJLsctftV8BI
Message-ID: <CAD=FV=XmMwocA_oZVi2OS2Z4+5LBT4BXZE2C1mx1U-Tcs+5SOg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 13, 2025 at 5:51=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Introduce a new HID quirk to indicate that this device has to be enabled
> after the panel's backlight is enabled, and update the driver data for
> the elan devices to enable this quirk. This cannot be a I2C HID quirk
> because the kernel needs to acknowledge this before powering up the
> device and read the VID/PID. When this quirk is enabled, register
> .panel_enabled()/.panel_disabling() instead for the panel follower.
>
> Also rename the *panel_prepare* functions into *panel_follower* because
> they could be called in other situations now.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> Changes in v2:
> - Rename *panel_prepare* functions to *panel_follower*
> - Replace after_panel_enabled flag with enabled/disabling callbacks
>
>  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++-----------
>  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
>  include/linux/hid.h                   |  2 ++
>  3 files changed, 40 insertions(+), 19 deletions(-)

This seems reasonable to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Given that this affects devices that we already had support for
(you're changing the behavior of two touchscreens), should it have a
Fixes tag?

We'll also need to figure out a process for landing the two patches. I
can easily land the first one in drm-misc-next, but then it'll be a
while before the i2c-hid one can land. Is it OK to wait?


-Doug

