Return-Path: <linux-input+bounces-13754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FA9B180A7
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 13:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96F233A5629
	for <lists+linux-input@lfdr.de>; Fri,  1 Aug 2025 11:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9BF937160;
	Fri,  1 Aug 2025 11:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IZskYN6m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C7223AE87
	for <linux-input@vger.kernel.org>; Fri,  1 Aug 2025 11:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754046313; cv=none; b=LSPsWDmZCvGEEUfk2lujKXkWXXED7qb1AmMAhMDf1Llcv+0NlvnpLfpl28l0YokvWNHCcix8esXEpiZHKOg33USbnsa1zqEeIF9n1CjZ2JjInvHJBmqyNiOpLGMrJ9LuBuJSi9R0t8WP+JJgQwjlz//UAoikFwIqiDVeiTAEe5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754046313; c=relaxed/simple;
	bh=/+jMRUVcZ6t8Pl8l4LNW+ajilhtOkPFN+4QMcHsiT+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fxw5RfkkDP4OOSGARf2KCR6NpyH6mx73ob3AGGH7lYXiwxOzDQMcZc5Y1EB903icePvaoq7rmSj436JF8MC5Gm/+a9KKecScZL90mJy+pILo0hpTk9m30edCgM0qH3JafmN1ywy9SW1n4wwsabGzk4Z7B2+PNDorFxKejRbTFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IZskYN6m; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-73e58d51060so385433a34.0
        for <linux-input@vger.kernel.org>; Fri, 01 Aug 2025 04:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754046311; x=1754651111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+jMRUVcZ6t8Pl8l4LNW+ajilhtOkPFN+4QMcHsiT+g=;
        b=IZskYN6mZrvU/Q8092yR4joeg+TARsyo10jcJJt31M3dQHkf7oXFB2veU/I4YxNV4H
         wwH904rYXHg8xy6+v+XiqyGHJ7OtI4lH+6I2ajj/CVrtM0fyRnYHFs+nh3l0rqa85T9+
         AMVjHEAlLaBq34xGySiizsDWypESszjJh6f5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754046311; x=1754651111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/+jMRUVcZ6t8Pl8l4LNW+ajilhtOkPFN+4QMcHsiT+g=;
        b=QZ6eYlI64twpPVasNGBpyslzEfs3aMeNwn9856EV040MliNL2Y/G3zh7dDD2M4vtYU
         tIAt7Q9vw8nR2xQmD4/1DKiXRZ+f9BjqAaAgaU9Up7Ui7b8ROeX0cZZx2+s3eRkjlzDc
         d+1HFcmnh2sNp4nlCJdfBmCKcZbzIZtLZr/Z3d897f0q93gqJakbpz76xy2QXAe7+wHe
         jkgFLL0DYSxU32R1JF/ZlKdRLABPCsKwNUr09ghDtB+IbLH9gI9m9Hhh/bXmcotdhQcl
         fgt8DPfG5rw+YEzvM7R/D3NQRJHCffHOmucylR8AibXkv9AZJxc+W5uDd7OmwWWcyncF
         VLJg==
X-Forwarded-Encrypted: i=1; AJvYcCUDrUJ5CNPZSyhTR7e/Qxi5Ole6xBtTa4YmuUEVbHG2gmLwx4bO3cw9RODSJG2VgnkOVOymxdlwicKgJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRoqtvmfIffaVCRqrLsUbcoUER4SOo7f/Ph3SFj5CiiX6wedSW
	CDyUbj6CtSEJyF1DnOlVvYSzGqliIxlj1XGYvXEWwJrmz25yCYmoELOrpoMpcrPKg0ORG2lWj4F
	XJuqSizJ/HcuqfPIwKGDD1qU7/qHnXr0yY7oNyFTl
X-Gm-Gg: ASbGnct0prgU/xfZRRcLC+vzhLbuzbqy1nLMU0NBxh0/JaVh1bYMKVhIPwSi5eytL1I
	nCfeF42ia8OAviP9mB0Xm5MBa+lH0zm2DtyftNXIuOkPXf2ZiFMmuUMwkghWhLwA7SqIMUgLebj
	yxjOulue0sErWd+Sjg+ETrPJhmWNKSC2Y1cDz/PrRsmPGea9MID/tR2cRXsAth+I8hVLLimW9C8
	lbxD3keO98dwb9h+3EmqhNTjJH4/M/6wPeqKA/L9Ma7xA==
X-Google-Smtp-Source: AGHT+IFcu23cfo1L+r2ndOaJ6tIGjp3L6Og5YNOYpWEWiKowVEeAG4TrrXquLF+MqSuI+nCk5jD+RBvLEHmkGlbWWB8=
X-Received: by 2002:a05:6830:3987:b0:73e:9293:554b with SMTP id
 46e09a7af769-74177aadc6fmr7049993a34.12.1754046310929; Fri, 01 Aug 2025
 04:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250731101344.2761757-1-treapking@google.com>
 <1519a7c3872a59b7b5f12e99529237035499bc26@intel.com> <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VBhamkffZhVuMEoiwfAoeHRzSORo+=eqMLYVsSBMO-bQ@mail.gmail.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 1 Aug 2025 19:04:59 +0800
X-Gm-Features: Ac12FXz59Gv-xeWJuJdY52SRDvtajWsArQQuLuzom-4gp2vT2ns_QxyRWnAtOXk
Message-ID: <CAEXTbpcPxpbtwy70uGxMcwsTcjpTqEX3EBZUyMg-6k5ULE1PmA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel: Allow powering on panel follower after
 panel is enabled
To: Doug Anderson <dianders@chromium.org>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Pin-Yen Lin <treapking@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug and Jani,

Thanks for the review.

On Fri, Aug 1, 2025 at 12:38=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Thu, Jul 31, 2025 at 3:31=E2=80=AFAM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > On Thu, 31 Jul 2025, Pin-Yen Lin <treapking@chromium.org> wrote:
> > > Some touch controllers have to be powered on after the panel's backli=
ght
> > > is enabled. To support these controllers, introduce after_panel_enabl=
ed
> > > flag to the panel follower and power on the device after the panel an=
d
> > > its backlight are enabled.
> >
> > I think it's *very* confusing and error prone to call follower hooks at
> > different places depending on a flag. The hook names and documentation
> > say *when* they get called, and that should not change.
> >
> > I think the right approach would be to add .panel_enabled and
> > .panel_disabling hooks to struct drm_panel_follower_funcs, and have the=
m
> > called after panel (and backlight) have been enabled and before panel
> > (and backlight) are disabled, respectively.
> >
> > In i2c-hid-core.c, you'd then have two copies of struct
> > drm_panel_follower_funcs, and use one or the other depending on the
> > quirk. You can even reuse the functions.
> >
> > I think overall it'll be be more consistent, more flexible, and probabl=
y
> > fewer lines of code too.

I was thinking that we probably will never have a device that needs to
register both .panel_prepared() and .panel_enabled(), so I implemented
it like this. I'll update this in the next version.

I'll also fix the s-o-b line. Apparently I've messed up with my local
git setting.
>
> Yes, exactly what Jani said. We've wanted to do this before, but I
> just never got around to it. There's even a (public) bug for it in the
> Google bug tracker and I've just assigned it to you. :-P
>
> https://issuetracker.google.com/305780363

So my series is not a new idea :P
>
> -Doug


Regards,
Pin-yen

