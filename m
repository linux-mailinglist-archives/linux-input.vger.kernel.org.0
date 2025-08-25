Return-Path: <linux-input+bounces-14301-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5B6B34754
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 18:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70C4A2A4C96
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 16:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F63E3002B6;
	Mon, 25 Aug 2025 16:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IS+6gXRf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2A2FFDDA
	for <linux-input@vger.kernel.org>; Mon, 25 Aug 2025 16:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139417; cv=none; b=dLwMP+O38E8SefVwC308SlDpSiALGXY+hu9v6/bGRRucNa2g0UgRo57hfr3dcbk6Uy7k+Wts0n3i4WrLAVi/WHh9pJvzU/Pl3oYkgQvg0S9o9JxLVc2UTwnyjU3WC6UY29qlDi55+5dvwTu5o5WSf7sXMhPoo3jMEpQeM9N6d8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139417; c=relaxed/simple;
	bh=QF1rwFGXOpv3/yj99dApQHR7xecK134zyjOuhi0if3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/EpHMNsbEvXKx2NVTzu9HGD1aYSrH3TEBPIoKMxpnEgOONk0stGO1d/fWehg1uHYL67oYNlHSqTw3+sJBAL5aaM4rQpauvJLpNpTTBU8rGDqDrGx7IUu8Tl5CVcdRfCyN324A6N0Lgk/+cckGfYSlRBKE9VMXYTLqtE+tNGIQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IS+6gXRf; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77033293ed8so2507456b3a.0
        for <linux-input@vger.kernel.org>; Mon, 25 Aug 2025 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756139410; x=1756744210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jtHSRITSR2AwU52EE8r+JEB4b68kRsZxs/LuenG8cw=;
        b=IS+6gXRfSY7DRrqHpquF8xvVRJ9QUSrULtXwclDxbxJfMRTVFlC87jlaZEFScbnqz8
         vfw8SVAthykTbWnwtKBLhUFNUHSYCjwqBNFo5Km7tZcAAorOQSQsB9Cmt/B00pxEjbxI
         R5I4HsjunVfFDqMEMtxbyYPGMUqMeKzJ98fso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756139410; x=1756744210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jtHSRITSR2AwU52EE8r+JEB4b68kRsZxs/LuenG8cw=;
        b=iBWfIb+cMzo7/MWgSmVe5FwjR21HFF+vAOcoVod6DuUk0BDRqYRhWmZ2CTUNcG3KLe
         eCAZuuL/1Znej18/7Wx3d6v6cn1ScQmSqgrjG+FLzX3NVv3YodCD2DVksJUC6AkYcpRW
         GjldfJS1wB9ZCk6G50c9z4nIDuKW0l1zNZzpNP4xuL2QGB34dAMnoZw0yjH9FdKmnyi1
         GOHP7K5pLQkIw/uc9wAQ007BVHK99NXfu/dOUSYf2jWNXJAbnV4eLAo2eGEUuNarZB2G
         wGdtUoMn04yX1X4mq9z1xylOhr3eiIgJkHWiq2Q+zuRY9u86Kuf82VcCtzcEnVvrirlD
         2mWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+e89wyDSvnCdGdiL1SCU/i6ZZPJvCFNAAX8f+1R8IOBu32j4W+hJjOb6mQthUJQEjVqSEB78v6tFUmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YywTsUvGvOvd3HAle9OPjewqD6RGWrrIUO5mb29snWICwSEDqzv
	9N2yb4b3GUXVWqVdnsAL/3o6AqBc+zPKpRPzZDab+Ma2sOw+rWSftIVMzzdZyJHBROnue7lhxYB
	qGPY=
X-Gm-Gg: ASbGncufwmLe2//GzBX0y/Pgg/7CcnOKt/KCNY/afZ1LxVkOaAkLnOfQ3ACcNkTOpna
	Ze/rgRc05FtTqin8GAu7HoSQflKKD1AzG/plgTfYagxZ9RBBZVEraaq5p1Y4L6R/SXG9ud0WDjw
	pKFnMqztXyxhamlQEOivGiS712DDSY+YIS4kvQVR9GP7I7MT64hEMBUmK9c1FOHjf8lDa0sgUed
	Nl1Zv1sZ3Dri8IzkqBYCtYu0OYa2XxygPXPjKaxfO0z68NsrGacMnSFFVk0hXEnhReOyfHk3SQZ
	HFRHI2Z5Agm68OZB8VByHM/fHKg+LrLogMq3qiHwlWgRMQXoUvvJHLsoCreOJRRgp7+5jbAGkGG
	E4jAlG6/pyp/6ASXAJ+YtOLhyWevl1DdaY3DK9GZ9lfWiEzGiGpFUdftACjYnFved0g==
X-Google-Smtp-Source: AGHT+IGmsK2HnraaDyMpz3BTBAPCEkAEs3OZFnjAfY8uQ8oEc2SgWyB2V0FdiAZLpGbK22fzPngKgg==
X-Received: by 2002:a05:6a20:7283:b0:239:c7c:8e05 with SMTP id adf61e73a8af0-24340d7c131mr16709264637.34.1756139409941;
        Mon, 25 Aug 2025 09:30:09 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8b0c78sm7274072a12.14.2025.08.25.09.30.06
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 09:30:06 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2465cb0e81bso16518195ad.1
        for <linux-input@vger.kernel.org>; Mon, 25 Aug 2025 09:30:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxRLsaRAXCzn2ohgxefMQbPvj89WOZbc5aNJ2c0mOSb2x17cFtVve3yKxpz2SIJGLrk1i4UCEipEN+iw==@vger.kernel.org
X-Received: by 2002:a17:902:d486:b0:246:b46b:1b09 with SMTP id
 d9443c01a7336-246b46b2296mr70233575ad.30.1756139405901; Mon, 25 Aug 2025
 09:30:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org>
 <20250818115015.2909525-2-treapking@chromium.org> <CAD=FV=WCfFWHAh=XxA_jZpMsS_L0U_k=_g_oj36Nd=4winZ24g@mail.gmail.com>
 <pr01os80-s752-1rqp-782q-65nr8222npq7@xreary.bet>
In-Reply-To: <pr01os80-s752-1rqp-782q-65nr8222npq7@xreary.bet>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Aug 2025 09:29:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wi88Az-Uce9eS9iWE7byqXUhPWZUnNzPxb2G00J=xVXg@mail.gmail.com>
X-Gm-Features: Ac12FXy0EZz9bvA-Qu-6WzcG016UETXUzwRyI68kZYgUXuuPbSw64uhWpNOBD3o
Message-ID: <CAD=FV=Wi88Az-Uce9eS9iWE7byqXUhPWZUnNzPxb2G00J=xVXg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] HID: Make elan touch controllers power on after
 panel is enabled
To: Jiri Kosina <jikos@kernel.org>
Cc: Pin-yen Lin <treapking@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 19, 2025 at 1:55=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 18 Aug 2025, Doug Anderson wrote:
>
> > > Introduce a new HID quirk to indicate that this device has to be enab=
led
> > > after the panel's backlight is enabled, and update the driver data fo=
r
> > > the elan devices to enable this quirk. This cannot be a I2C HID quirk
> > > because the kernel needs to acknowledge this before powering up the
> > > device and read the VID/PID. When this quirk is enabled, register
> > > .panel_enabled()/.panel_disabling() instead for the panel follower.
> > >
> > > Also rename the *panel_prepare* functions into *panel_follower* becau=
se
> > > they could be called in other situations now.
> > >
> > > Fixes: bd3cba00dcc63 ("HID: i2c-hid: elan: Add support for Elan eKTH6=
915 i2c-hid touchscreens")
> > > Fixes: d06651bebf99e ("HID: i2c-hid: elan: Add elan-ekth6a12nay timin=
g")
> > >
> > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Note: cuddled the "Fixes" tags and the "Reviewed-by" tag next to each
other while applying.


> > > ---
> > >
> > > Changes in v3:
> > > - Collect review tag
> > > - Add fixes tags
> > >
> > > Changes in v2:
> > > - Rename *panel_prepare* functions to *panel_follower*
> > > - Replace after_panel_enabled flag with enabled/disabling callbacks
> > >
> > >  drivers/hid/i2c-hid/i2c-hid-core.c    | 46 ++++++++++++++++---------=
--
> > >  drivers/hid/i2c-hid/i2c-hid-of-elan.c | 11 ++++++-
> > >  include/linux/hid.h                   |  2 ++
> > >  3 files changed, 40 insertions(+), 19 deletions(-)
> >
> > Re-iterating my response from v2 [1] so it's still seen even if people
> > only look at the latest version. :-) If HID folks don't mind us
> > landing this through drm-misc, feel free to Ack this patch.
>
> Acked-by: Jiri Kosina <jkosina@suse.com>

Pushed to drm-misc-next with Jiri's Ack:

[2/2] HID: i2c-hid: Make elan touch controllers power on after panel is ena=
bled
      commit: cbdd16b818eef876dd2de9d503fe7397a0666cbe

NOTE that I added "i2c-hid" into the subject prefix to make things
more consistent.

-Doug

