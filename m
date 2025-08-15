Return-Path: <linux-input+bounces-14037-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2C9B273B3
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 02:22:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12A0E3BF06C
	for <lists+linux-input@lfdr.de>; Fri, 15 Aug 2025 00:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3006224F3;
	Fri, 15 Aug 2025 00:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YgriMCBI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6F26AEC
	for <linux-input@vger.kernel.org>; Fri, 15 Aug 2025 00:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755217176; cv=none; b=WVP7GwJDTUErK9S3J5B82m4DnzZHSxGDc/rbEFPnvc/EwVuNRhpIRBDUyQqAamGTP95MQ8c69Q3oRljPfwOUNvIoGoK9bdFAFcEfeSUnBxucw8Hc2JUemSHljmhp9qnLmJ6wjRtzWOcfUOZfSNQI1APze7I/gTqkfYHFG8g2DlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755217176; c=relaxed/simple;
	bh=2mZs6T5Rqv9g1ujstn9eEbs1bLEe/SO5e+VWz8PZJcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ulkd1aAZr/ElIi/gzN0Hoqaf9PrlXASX+Z5Z7cj0ur6Z5ZMrNkUHSnYI4lZg/T9/VmD9Agbrt/qFocJstipm2Rxz4IFmbbWsdFY9TXJTxLxO1TaRljDh30JmhcOLoOmsMt1qMU3up/fbNuWZOGOQXKj2pCjDKRf2S8lfGQBqSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YgriMCBI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so1370422b3a.3
        for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 17:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755217169; x=1755821969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEZvwZ6yQfWgMEqsVmo462XXGUa5NScj6l2mlIQyQ0c=;
        b=YgriMCBIkHLQNIFurLJrd7I17+hB3fIwrmfiyshoX3Pzc91UYco5vCS/OMKr0P2O6G
         CC3Hoe4sNIlxq8bTiiuDp8thcM+FiDbmoEW88gh5khabzQQXs5nhbXur5ovWTyhrpWXV
         zPWxWy1A9/g1WWIZ4MXDS+4fvr/tTgCji0Q9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755217169; x=1755821969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CEZvwZ6yQfWgMEqsVmo462XXGUa5NScj6l2mlIQyQ0c=;
        b=FIEBQ6KdurMk7+UhaAC+RXA61gE0qWexNRW6noe82rexpEmF3UwPONq50A2GpmzB5G
         PQXb7pbqHGQ2RZIet78BuTndzCk2cR6Q98o5gPWXkzgZo7hk7/TXfCzmPcIRhV49WDTG
         LKpvqN5l+V4a+iae1pSa2+vcSGt55AlGWJXy0PnSD2MrxgUqtXNWQ0Gdp87s6JQ1C3n5
         G+7a3sTOPDHFMm0GNiMe1xXmFuzKDc547/Jbz40lJPIhr7QKsZldJAHJUXKMEXSGSOuz
         QWKCCPnY61AumQax09th+7ibH6AZlYHPyf7te/l4WLfeHpBdZVafqt1F5tcsX6iP+gKB
         vtOw==
X-Forwarded-Encrypted: i=1; AJvYcCXFUyplgXK2uaki7DPtr0+9G1C3mQYnCrUZhwygknYtg4PYm9V/fFQr6eduKz3VIbg6v6d+ypoDJUNBxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCkmJfWeUAyXqRvZvrn6dT8cP35O/8cyGWDJz0DtgNOplMVztX
	x2GP++hYRQ4P90BVgRz+0KrHdC5ntz+17JwphtvUm0vfjCCx0OaarN6Da1xAAPa/OHDh2UAN8Gi
	roys=
X-Gm-Gg: ASbGncvcqFkbEvQS0I9jX8B7UK3nu/zhhTHjzUd5xFiRATuc6NA1Lt7c21P7XjCua7L
	nnaNUQm4n/5Suiif4uLydBehRclAjEt705YvhAsa3QbxmISRzLdTi1ESCmWuFF/JoGyUnDcMV+6
	rHFLTZQwLEDOMOCSJXIKUM0nrErNnOVDVNIXlTq7wP5wKfOVKARR2poHKWV1p7gHi23GApcWy6z
	TUqlMcBgeAWkJU/oB7qjtaBuI2Ht/sOC6PZpcTnWnzcRrp5JJtJ3TTm1MauaQ8eaeGfciObtvO3
	TtTb5itPbk/WMiCKDY73KsFEmG0bWd6vksj4J9TexFNzT1hrdLpOe6+wQtSF7hUD4AgL5xlvdLg
	U2fBpNyT4xsbT6gyS1NMpkJY0zQhoX2XNi020lwZHW4XM7J3i6wAmB85HJSmcKw0Wqg==
X-Google-Smtp-Source: AGHT+IGLbTiW443hZfsB3Pjr87FdVsCpQ90Y+j+c+0qL9lCAGf0Be2b2SXF1IVyeMkz0MVPdD9Imew==
X-Received: by 2002:a17:902:dac7:b0:240:640a:c560 with SMTP id d9443c01a7336-2446d70a499mr2263495ad.24.1755217169066;
        Thu, 14 Aug 2025 17:19:29 -0700 (PDT)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com. [209.85.214.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54f7b9sm753695ad.128.2025.08.14.17.19.26
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 17:19:26 -0700 (PDT)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-244582a738dso10257475ad.2
        for <linux-input@vger.kernel.org>; Thu, 14 Aug 2025 17:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrXqdgVvfjw4gkCWHu80OcKtPovwdjHhfbhCZ/f4cZ2TD8UBJpponmlVQo7pmZ8RKoxrHNQl8JME8bYQ==@vger.kernel.org
X-Received: by 2002:a17:902:e947:b0:242:a3fc:5900 with SMTP id
 d9443c01a7336-2446d5af310mr1936465ad.8.1755217165481; Thu, 14 Aug 2025
 17:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813125132.1319482-1-treapking@chromium.org>
In-Reply-To: <20250813125132.1319482-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Aug 2025 17:19:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VAMT4xNoFKan7UpCS8RRXvOPWqRXJGsMudvJ+eWOOuDw@mail.gmail.com>
X-Gm-Features: Ac12FXz-ckb7A9RPiPMgTBiKCqz6twUCK_GsqpTzShr-jwEY5OOiNXBDYC75hpM
Message-ID: <CAD=FV=VAMT4xNoFKan7UpCS8RRXvOPWqRXJGsMudvJ+eWOOuDw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/panel: Allow powering on panel follower after
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
> @@ -230,6 +239,18 @@ void drm_panel_enable(struct drm_panel *panel)
>         if (ret < 0)
>                 DRM_DEV_INFO(panel->dev, "failed to enable backlight: %d\=
n",
>                              ret);
> +
> +       list_for_each_entry(follower, &panel->followers, list) {
> +               if (!follower->funcs->panel_enabled)
> +                       continue;
> +
> +               ret =3D follower->funcs->panel_enabled(follower);
> +               if (ret < 0)
> +                       dev_info(panel->dev, "%ps failed: %d\n",
> +                                follower->funcs->panel_enabled, ret);
> +       }
> +exit:
> +       mutex_unlock(&panel->follower_lock);

Extremely nitty nit: all of the other functions have a blank line
before the "exit" label. :-P Could you match?


> @@ -598,12 +641,18 @@ void drm_panel_remove_follower(struct drm_panel_fol=
lower *follower)
>
>         mutex_lock(&panel->follower_lock);
>
> -       if (panel->prepared) {
> +       if (panel->prepared && follower->funcs->panel_unpreparing) {
>                 ret =3D follower->funcs->panel_unpreparing(follower);
>                 if (ret < 0)
>                         dev_info(panel->dev, "%ps failed: %d\n",
>                                  follower->funcs->panel_unpreparing, ret)=
;
>         }
> +       if (panel->enabled && follower->funcs->panel_disabling) {
> +               ret =3D follower->funcs->panel_disabling(follower);
> +               if (ret < 0)
> +                       dev_info(panel->dev, "%ps failed: %d\n",
> +                                follower->funcs->panel_disabling, ret);
> +       }

The above order is incorrect. You should call "panel_disabling" before
"panel_unpreparing" which will match the natural order things are
called in.

Also: please review kernel-docs for the following functions and update
them for your patch:
* drm_panel_add_follower()
* drm_panel_remove_follower()

-Doug

