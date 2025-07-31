Return-Path: <linux-input+bounces-13736-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D5CB1750E
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 18:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B67A3B8DC1
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 16:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6B0222587;
	Thu, 31 Jul 2025 16:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bexc/KZw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8292A21FF4E
	for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 16:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753979916; cv=none; b=CkKQr6H9OaCdovm779AWxFLZ8nBjGS6A61yDPvEiu8Bq4RI5UFoRPvcins5PTs0Pl14XgReMzV+wu228OKgsUYrVEzzaW1h1+xnEDZqS8lJ3yFb2eIvaSBNr5XG9ezTklTbxU4uFamqfKNxNdt0e462zt4vaayCm2naCZm9vOmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753979916; c=relaxed/simple;
	bh=CKgF0jnSG2wdzjoAm/Qe0GY3kcVd0498MqwU1W2jtDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ePfGVdFCAQ6Mh1Un8z4tp7nyeNQ2vsSwBlh/hms/3H3Z8/07dwQYnWx52faVZXrpYNgeAsW1XKrjfYqLgdh/DvAWq2v6NwF32Getbm0Q0+fi5si9lE9qErvPhlxDETE9JJk5bNzA5ZVHNStSjEcX23t71vrAx26faAnR+X4mXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bexc/KZw; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7682560a2f2so1272715b3a.1
        for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 09:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753979914; x=1754584714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKgF0jnSG2wdzjoAm/Qe0GY3kcVd0498MqwU1W2jtDI=;
        b=bexc/KZwOxye1AWa8AtLA4wf1w6eM/LOZ/AYH6PVq3pIZZrc7ebHcKSppaexPCns5Y
         C892Zru/7hOCiP2G1RicntTksJ53U7MVhk8fgXplOXByI9upkvWI4RiSy3p9TxDYXf87
         PNz8hjPmqnv5pKqI2ei3mbovVctxx6om+tAbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753979914; x=1754584714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKgF0jnSG2wdzjoAm/Qe0GY3kcVd0498MqwU1W2jtDI=;
        b=tUwwiLgfamE+oL/KCm8alx4urSE/o0zA7Hksb8hxvmtyN09XjCSFEmsxnO7z0TnIxX
         5VZ7M2Zx9k+8hgn+OZ+t1RRedeKOpsRx4pROfN8YVewr1LZj+chX4uQCm/xP7aEDG30A
         KaddIT48dIbDELn+eUQPvB5aHT+jXu+aNjJJzS/8SnH9pi0yjdFMUdsacS7C1mEBOSVK
         ed59U3hyzR7TfvBP+Re/GX5KVgimm2mImiNMeR2+TnVQGFompkxl0bNXGnCSA084bEW9
         mnO+yRk7lD4czuHzik5oj9jhegBoHSJX0Bcte60G1TGqlAWP5JQm0hpKKO8oF/KUJ1vM
         twTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx8bZ72RiXTBaMOTKrz4TVCel2wbWIUgc8hoXGW7VEMFiXVnr6eO7FOlaGBPghwYfmYkakzzdiKVtJWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzerEqEzESFBLJYZs63IoqXGSmJDXQ2TMlKWXfmzzMENfZCGecy
	WAFi6UVVmdAVHczQ7Fsfd4uTOZW6hpvPxAAWIAAPBi+DVMYB+EgjtnMRSKj3eyTrtKEO886XnYM
	YuT4=
X-Gm-Gg: ASbGncsHhoyuG/a4n11oN4fztljXWyVYrgzWnc1UEJAHrIXnz89hwVonoTaaE/05zpq
	Gy9JeU9QacUxzSeRrDDxP0COo+Daoddht4VjIgZjgZ2+8uC38wAkzkS07Om1drtydZUTedi/gqR
	zGiTqRFA8l209DQeC1r0OSUttNpqrpVYt7tgx8/r5+6O01h0WIw6Ke/0S5rGtq3300jOX9Q+ofv
	tO+hIa78tZIatIg+dgCy8UsxPWn32VTfiSAeIP9EIXvuovrB8WwJK+d8Kr+kibWSRZ16KOMz1DB
	NlVYPzAjHGz23eFWbwmpfMTWHsucPvGQuFob3nY6yNnFvyEvSgBuyFD04ZAB0LpVgNb9g5c8Uef
	RNBfKLG4595hMVzUJNwInTOwVWmEwFbLUFrfBSnfGMkOlwbOyPg6x8FGiFm3Kkg==
X-Google-Smtp-Source: AGHT+IH3VsEW07z0XTNLdZQHqdRJ7X5ppYI4APU8zf4LrWMZ6t25yj9fycR+nr/ELfC8fa0zN89pOQ==
X-Received: by 2002:a05:6a21:8886:b0:23d:e3d9:35f4 with SMTP id adf61e73a8af0-23de3d93643mr688285637.16.1753979913746;
        Thu, 31 Jul 2025 09:38:33 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bae94d6sm1899478a12.49.2025.07.31.09.38.33
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 09:38:33 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-31329098ae8so963465a91.1
        for <linux-input@vger.kernel.org>; Thu, 31 Jul 2025 09:38:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV3Cuv4Ijued1FCv37WJ7WaEvP/gsTwS7mcYRWepFkkIEhUmClg915lY4HE2wJi7YNNzuWaX138xsYRbA==@vger.kernel.org
X-Received: by 2002:a17:90b:3ec7:b0:31e:a8c4:c188 with SMTP id
 98e67ed59e1d1-320da5e8dc3mr3455804a91.14.1753979912440; Thu, 31 Jul 2025
 09:38:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731101344.2761757-1-treapking@google.com> <1519a7c3872a59b7b5f12e99529237035499bc26@intel.com>
In-Reply-To: <1519a7c3872a59b7b5f12e99529237035499bc26@intel.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 31 Jul 2025 09:38:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
X-Gm-Features: Ac12FXxw9dAen_QOos16fn3qCdR3ov_wvt_j4mVYuHYXkV0ba_8K0aSL6du24TY
Message-ID: <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Pin-Yen Lin <treapking@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Pin-Yen Lin <treapking@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 31, 2025 at 3:31=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Thu, 31 Jul 2025, Pin-Yen Lin <treapking@chromium.org> wrote:
> > Some touch controllers have to be powered on after the panel's backligh=
t
> > is enabled. To support these controllers, introduce after_panel_enabled
> > flag to the panel follower and power on the device after the panel and
> > its backlight are enabled.
>
> I think it's *very* confusing and error prone to call follower hooks at
> different places depending on a flag. The hook names and documentation
> say *when* they get called, and that should not change.
>
> I think the right approach would be to add .panel_enabled and
> .panel_disabling hooks to struct drm_panel_follower_funcs, and have them
> called after panel (and backlight) have been enabled and before panel
> (and backlight) are disabled, respectively.
>
> In i2c-hid-core.c, you'd then have two copies of struct
> drm_panel_follower_funcs, and use one or the other depending on the
> quirk. You can even reuse the functions.
>
> I think overall it'll be be more consistent, more flexible, and probably
> fewer lines of code too.

Yes, exactly what Jani said. We've wanted to do this before, but I
just never got around to it. There's even a (public) bug for it in the
Google bug tracker and I've just assigned it to you. :-P

https://issuetracker.google.com/305780363

-Doug

