Return-Path: <linux-input+bounces-10868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE6CA6368A
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 17:57:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6C753A580B
	for <lists+linux-input@lfdr.de>; Sun, 16 Mar 2025 16:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD321C862A;
	Sun, 16 Mar 2025 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="oIW29zEL"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C89E1D79B3;
	Sun, 16 Mar 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742144245; cv=none; b=IKw/1f04HFXCTKV2oBzGTvEXa4B2kwG6T+439qL1karjWmxpNjrS9nphAXI+v88hki003lihyu/3H+Jg/YGujenYsg3vP83qCgSh6TtQQQ47WETRa4JycS0GdJL16sq5g1bDzF/c3SVQRvw2x7wFA5wnKAPfDFxdDsb4jVg1tOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742144245; c=relaxed/simple;
	bh=/G9fM/rrbP1buGJ75EpOQyBEVLGxqySjujo5URaHW1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkzZxXga5G7SjSiPDEnaspIRVHHHn73XS2s10B+qOxbrvHYJlJCQrahdvSe5cldtOPaVhHcdvob7E8Z30IBxw8/3Kx48/m374F3SPAvw+8JTxj0lVe9muakSVX915sKnjVqJWPtOL7PxouDUpaFpNkc8M9EY2pyfoJ5EyTMYMRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=oIW29zEL; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 080022E09442;
	Sun, 16 Mar 2025 18:57:19 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742144239;
	bh=kq8pZLX+Ny0SbU2MreWxKEtohSNSFr7XvUB/gKUgfzY=;
	h=Received:From:Subject:To;
	b=oIW29zELGZgA4ZKrOuWSdfyQhWoLtZW4EDzKaJqyvJswyXwqxvRpNTkRrLWbPkxTF
	 Si5qWh7yPq2VYEBUb5NI61jMHqLAaNWLhAfVF/s9YXB5X7/fUDw+2kA5k+TKbjttoF
	 5AfSCCF8XRDKllhADZq6Ict/cwxjF0HepKsF6UqA=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30bf8632052so39587191fa.0;
        Sun, 16 Mar 2025 09:57:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWfAZ763lOzs0tBsciHNlXlPzvPvaxW8jupGbm4uqNJzKEgKfi1lrh59ZM+ECcFDI5pQyIj83xGi+bAOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBb/cr/5l1E422arYNKx6V378+XqQrgY5mJ9aTVl9tfC8lB5Vq
	3pYErLUDw7+aQdh+xpZXu6z1lC9IMJkLanVOoBC77Ry9NWOQ/DF2i6cp4/o0InDcQoBPUViTqN0
	hUSGyBOij1zgqTCoO+lojPdEr2XU=
X-Google-Smtp-Source: 
 AGHT+IEOCK0iCLibCspqhpr0MBl5XsKfS2sj8C1C0BJ51dxoORCu2i2PnbRd4u/KBCXflGZKkTCo74I2QWMaxTNJOD0=
X-Received: by 2002:a05:651c:1507:b0:30b:ca48:1095 with SMTP id
 38308e7fff4ca-30c4a75e7e0mr44619641fa.7.1742144238418; Sun, 16 Mar 2025
 09:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250222164321.181340-1-lkml@antheas.dev>
In-Reply-To: <20250222164321.181340-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 16 Mar 2025 17:57:06 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFnd2Qi+0p9mSR9vD3tNB9Bih1SvAO8oOOj9OTTdmeixA@mail.gmail.com>
X-Gm-Features: AQ5f1JottSL5_vJG_Nb3mJBRPoPflLwnrPlZ0CAuvwnOtHKL-_m6zTs6z_9zCLw
Message-ID: 
 <CAGwozwFnd2Qi+0p9mSR9vD3tNB9Bih1SvAO8oOOj9OTTdmeixA@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm: panel-orientation-quirks: Add 2024 OneXPlayer
 line & ZOTAC Zone orientation quirks
To: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174214423940.16005.2026479720786272926@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sat, 22 Feb 2025 at 17:43, Antheas Kapenekakis <lkml@antheas.dev> wrote:
>
> A number of OneXPlayer handhelds have come out with portrait panels.
> Specifically, those are the X1 AMD and Intel variants, X1 Mini, and F1 Pro.
> For X1 specifically, they also have spurious battery reporting within their
> digitizer. The Zotac Gaming Zone also has a portrait OLED panel, so add
> that as well.
>
> Antheas Kapenekakis (5):
>   drm: panel-orientation-quirks: Add OneXPlayer X1 AMD and Intel quirk
>   drm: panel-orientation-quirks: Add OneXPlayer X1 Mini (AMD) quirk
>   drm: panel-orientation-quirks: Add OneXPlayer F1Pro quirk
>   HID: Add quirk to ignore the touchscreen battery on OneXPlayer X1
>   drm: panel-orientation-quirks: Add Zotac Gaming Zone quirk
>
>  .../gpu/drm/drm_panel_orientation_quirks.c    | 42 +++++++++++++++++++
>  drivers/hid/hid-ids.h                         |  1 +
>  drivers/hid/hid-input.c                       |  2 +
>  3 files changed, 45 insertions(+)
>
> --
> 2.48.1
>

I'd like to push this along. We already have the ack for HID. Did I
miss anyone on the list? Full context [1]

+cc Hans

[1] https://lore.kernel.org/all/20250222164321.181340-1-lkml@antheas.dev/

