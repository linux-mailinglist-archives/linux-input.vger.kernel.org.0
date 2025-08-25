Return-Path: <linux-input+bounces-14300-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36164B3474F
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 18:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21E72A4B45
	for <lists+linux-input@lfdr.de>; Mon, 25 Aug 2025 16:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A96572F99BE;
	Mon, 25 Aug 2025 16:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZX9fQxo8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137B42EDD64
	for <linux-input@vger.kernel.org>; Mon, 25 Aug 2025 16:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139305; cv=none; b=rXY9DBWmF6oB2Qvkbng+hs6T5qUdyWspzlsF9CvwcdChkDsq6682zTbaFOrff1S90WmHgQ+sxIAJOtl5bEZHGf1nNjs2JOc6i1cDYS+jTz5YCS4NAwSM54Nrg9hWelL2Z0SA0jdHd1Qw1+oZmNK0KZhnHHLuae9GL08j6i8FQZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139305; c=relaxed/simple;
	bh=iUSMTZqyvv2oeAYuslbIKG+9UMyIb029ZYxFj2J2p+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=owvh4J03BTRBBpiDnAFMdwSr8Sx4ZejsrkYX7iu0D9FNkjkYEjN5GGC9bcAgGEMbwNlBoY91k3YI0pT5mWmXazNYfZawh6aIzm4hMEM2/PmFUqVbK6o4NXLEnIw4yKgFbWbK2kvx/8suY4ReWBc5M6U4OfEHNRhvB9EWdiXW5xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZX9fQxo8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b47052620a6so4012989a12.1
        for <linux-input@vger.kernel.org>; Mon, 25 Aug 2025 09:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756139302; x=1756744102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woAfhn5HDSfsOd/+1jhyZYr6YehlXkPj2oA1ClHW5m0=;
        b=ZX9fQxo88T5u3WY4jd2bTG6BaLeMMDsNb89a0oEWf6egPnbiE5Yz0aXn0hEEDBIsjo
         dHMlOWf9TuC/4h5PDnv359G6uXlb6k4EUjzb2kxUiZ7kzVKhS1+wGFz0cDCGikSs8Vqo
         B6x8nSVbXxsbT9q2xTKb+C8Z8tLjRnD6c1IOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756139302; x=1756744102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woAfhn5HDSfsOd/+1jhyZYr6YehlXkPj2oA1ClHW5m0=;
        b=TpdxD+jqBBky0IGQsoNaJfSMaUBLnuDVbSAi7OcfiBFX22lMM2y4l5HwdksH6szRP2
         1VjRySg2B5Q9vg0tTZgOHSngrsAkvlQebrYAEtpcZPJKMxSS3yIZzTFy0dZ1r+hrTKcJ
         kPtx7xeFCidWbZDGNgNoIxhs8sHTDjsDA/rOaxgJiRRPjyH3Y6kTcGZN5JAso3nNCuMZ
         UiZbFjn5UgpmeTdhnyM5Wz/GmPrKrlTjR4z8OEsgRAOBjKWrxYAhIMaMGIPj9uriU3LQ
         cyAeXXP4ZBwOTbcusTXATbPx161GdDdUo43QMy3i6dvddosRTusD7eD50iJdq4R6EAXu
         gliQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1rm7MYsdEcNxAbvn0oThZVCr1SVN+gv0QOAAVdjVcYVkJhNXgNYx3SJq3cgaGJE4BmDk3XYtbb1yEiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxquwQJgyYyZT/34IFrsXnM0ERL0z+sx39Y1gd3kMHWazy39QUz
	d92xv0VJAbozfmty/Rdq4NnSG/KURdI732ltfRafpYrS+GkiW/Zz4N/rokKz77Rl/5ap5X7jNoG
	ke5k=
X-Gm-Gg: ASbGncsTK/Lze6BBx4IBCfoiTljeceVMojOq3Zo3sdiCbTRsuU79v2MF5n2gXOMYa59
	wmpOy20ajHs1EjW6XumdFlODpdwNxpVeEmdYQb5YwXvNafcgSaAQXuGSNLpudAITGUubnsm8INN
	cMlQQppiZYcRYnEEhryEUzzM8CYJ37y/D6QIyLTSJ47u38qdrCSgQ7cLUk/nSEowxCG885N84ru
	nU+z9xmn3NeUag4mD8YjiOufLi2Vw1GiKxiBacavXVuSorKT69jgoJN49P2CEhdT0o3H/OK6EaS
	LUinqdsZw6TiK1cCT1CSSMRub+w4K7yo1kYUxD3iMykfZ+OOv/SFK69Gs+c2wa/Ie6Uz/txX8ew
	9ITMrrmk5hfsLP68JUOp550DC6mYVAUThqM6zJcb+mmZ5sMcQ+Te/XLIuBXVfBmHARA==
X-Google-Smtp-Source: AGHT+IEThIDAJKU/EGLvqFimC6B6w6p72PAcLYUVqHetzg1/iXLYrKzzHVzfwrHSBvEIv/S+H7XrAA==
X-Received: by 2002:a17:902:c402:b0:23f:fa47:f933 with SMTP id d9443c01a7336-2483df4bf46mr1975775ad.8.1756139301726;
        Mon, 25 Aug 2025 09:28:21 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3254aa4fc57sm7427451a91.19.2025.08.25.09.28.19
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 09:28:19 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-246151aefaaso30415415ad.1
        for <linux-input@vger.kernel.org>; Mon, 25 Aug 2025 09:28:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVcN/ZBjGjKOR7p2Qwc8Jfykv8geBWO9+IN6wThTXwx65gC+MgYe5s67lpdpNyIlaO1PRSdkz3knyEZDA==@vger.kernel.org
X-Received: by 2002:a17:902:e548:b0:242:c66f:9f62 with SMTP id
 d9443c01a7336-2485712e9a3mr1483215ad.26.1756139298616; Mon, 25 Aug 2025
 09:28:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org> <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
In-Reply-To: <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 25 Aug 2025 09:28:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xk+yTnizTh3FUJ8oBU=4q4t3VUO4bnHrSpJLZ1WL9O7w@mail.gmail.com>
X-Gm-Features: Ac12FXyUA1lsxksgKvSrs7zzRrWLTMGW6RoEiEQyPacS_X8GbWBGn9vOIWW-01U
Message-ID: <CAD=FV=Xk+yTnizTh3FUJ8oBU=4q4t3VUO4bnHrSpJLZ1WL9O7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Pin-yen Lin <treapking@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Aug 18, 2025 at 1:11=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Aug 18, 2025 at 4:50=E2=80=AFAM Pin-yen Lin <treapking@chromium.o=
rg> wrote:
> >
> > Some touch controllers have to be powered on after the panel's backligh=
t
> > is enabled. To support these controllers, introduce .panel_enabled() an=
d
> > .panel_disabling() to panel_follower_funcs and use them to power on the
> > device after the panel and its backlight are enabled.
> >
> > Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> >
> > ---
> >
> > Changes in v3:
> > - Update kernel-docs of drm_panel_add_follower() and drm_panel_remove_f=
ollower()
> > - Fix the order of calling .panel_disabling() and .panel_unpreparing()
> > - Add a blank line before the goto label
> >
> > Changes in v2:
> > - Replace after_panel_enabled flag with enabled/disabling callbacks
> >
> >  drivers/gpu/drm/drm_panel.c | 73 +++++++++++++++++++++++++++++++------
> >  include/drm/drm_panel.h     | 14 +++++++
> >  2 files changed, 76 insertions(+), 11 deletions(-)
>
> Looks good to me now.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> If there are no objections, I'll plan to apply patch #1 next week to
> give people a little time to speak up. As per discussion in v2 [1],
> unless we hear back an "Ack" from HID maintainers then patch #2 will
> just need to wait a while before it can land in the HID tree.
>
> Question for Jessica / Neil: what do you think about landing
> ${SUBJECT} patch in drm-misc-fixes instead of drm-misc-next? This is a
> dependency for the next patch which is marked as a "Fix". It'll mean
> that the patch can make it into mainline faster so the HID patch could
> land faster. The patch is also pretty low risk...
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DUV8_XGmxC=3D7Z18PEnj6wKz+yZQuV_4=
h+LJh_MNCqszvg@mail.gmail.com/

I didn't hear anything and it didn't seem urgent enough to put in
Fixes. Pushed to drm-misc-next.

[1/2] drm/panel: Allow powering on panel follower after panel is enabled
      commit: 2eb22214c132374e11e681c44d7879c91f67f614

