Return-Path: <linux-input+bounces-14110-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF501B2B21C
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 22:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93CC05E1235
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 20:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5CB255F5E;
	Mon, 18 Aug 2025 20:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AhFaCD4N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BE39475
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 20:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755547903; cv=none; b=jmcPgIzH6u7PyCJa/6mfenQ6DgO3KszSnXqb9qxCDB2sk3NhLtccPvX1v+l85yLLAu+dGZDEsrfV9UZ1ohW8BtgTJWx9L342fTUylY+H4EKrFPcBkxIB0zYiC5guO/6qnegCsf1C6NdmtrDTHtDLZETmI4YFXRUyphAc6Vw0dfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755547903; c=relaxed/simple;
	bh=bMc4MEiytgUN5MSZi4bOBd3NylG8Y4lOdPTMucUwZM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rKHId8LgMWbmkSnD7QiVTdNhwxl58egVI3EuxBek2n79igPyHdylUlblG8ZKzGGHwOCSF2OR41SoBnAg4Sll+F41wnJ7T5uIptw7T5HB5kNffMFGuOWdv4pAdoTNlAPIklCpqFlf530W+VKKjeJGczYB8EQrZRWPMw0UJa06rIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AhFaCD4N; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb72d51dcso657507166b.0
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 13:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755547896; x=1756152696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgER9EDMTIBQYEXALGtaORMx9kWQNeO2USv3gouUbwI=;
        b=AhFaCD4Nl9EopiaGZc8HNwqYRWJj52O1wK+l2J3UFkhKUTc5PVXPkp19RFFd4JF9sy
         lCupkBnjq/E8jupojAcWlh5l2yMen7YPTGamNDrxhvhEbHjQX6sDV8hN1LRM1AtegCQA
         AgH6wA7K68dgE1uAH3SPuciQsdhBuMSX6HAj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755547896; x=1756152696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgER9EDMTIBQYEXALGtaORMx9kWQNeO2USv3gouUbwI=;
        b=w+7Z2OzRpbD54SW/uJY4nOKDP9DnG1GBHjYqj4jsB0TURHcG6Nzdq4ogMJA4D+bys7
         tuR4lkM1S0Wd0FzvhaBccR8r/Be8MzI48QmWPzfnlJLPwGP7OQ/JuL7fltuMAY/62jjP
         uIadyfzEoATR+q3GNRFlF4I5J8SIrVeFo1QDFHrv/MpqhdauNr3iioqoNzKl9vOxdAtC
         B/O1QG5UoE6XbQIcRfKtg8wKquXaxhcL6kdN1kopBcbpyPHsHPd932Tvh/zS8oQvJbh3
         Rl7L2y8qXjwXRRPiFW0DcV07oObtX8qmJrpCi/NzgDKeKt9eBbH+HkiceWvHyjLLx/XH
         b5zA==
X-Forwarded-Encrypted: i=1; AJvYcCWWH7G4MZbTxPz+5KWZW0pLfHf28W25XWXQoEXLu39J/Dov3AGbeTizym9cNco0/c3AGZ/iVyKMzfk93g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfVZVRUcKFsuPVV6GXxjo3dni2ZVXSbS8/KeERX9IVzLPXCJ0T
	1Rg8/CElOsP4pQaG/yMBGiiTmGkI+y8zJdj90zSm4h7yUyRtNC8U5zyNc/uTvr0+9+4wk+UBKwb
	yPF1/Ww==
X-Gm-Gg: ASbGncs3N53kgE4nUBaPIKxSl+53hT88pTpDWbNL9LL1BuxSyaSj0AFJ1fOM57JukdG
	KTBG9/TdD9DdLsLhnyNqJFWGTAvgmbpn86KrcY8IuIwTyWmCQi5ujsrxizoO2WaAJxBn/9yD3x7
	pK5g6aq2RSsoAEeDz57Rxw+wzZWyzBd6Dr+u6cvBke2I8PBem44zypF5bdnRpl6aAwl2wY/3L01
	1WerbJogoHeY3Ynj8PZMK7HMDif4RTA+KvOP99/D61tKEVvVF+iZxQlSA3znHNLNPBwGes8i9KQ
	TbWAbvs2g3tmTgKnFTKO0Wy/WhZPymLlLtIGCcjgwqyVLrCXPauUmAYcxzFR+kSgFLDF7ViPZPH
	+TYUiVcJFgkwX8mhPCU6bRfezXoljlWSDZwsryCB8i+qpCCD1/VcRAiwAelFc7g==
X-Google-Smtp-Source: AGHT+IF0UeTBLThcVX4iVJY+oxOL+XyhjhCmCxSkRraUagK9McrDHjs94wFxrl78cGoxOGE2Kg21XA==
X-Received: by 2002:a17:907:6e9e:b0:af9:566c:4cd1 with SMTP id a640c23a62f3a-afddcb815ffmr9066666b.24.1755547896148;
        Mon, 18 Aug 2025 13:11:36 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccd2csm866097666b.64.2025.08.18.13.11.34
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 13:11:34 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb72d51dcso657496466b.0
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 13:11:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxpzfbYpSIx9njZyc4capuMef3AbLGFi1qsUrDgJap9Bz2FO4YF08Z4uQl2XYLjnoGr6J7kKbVwj/WCg==@vger.kernel.org
X-Received: by 2002:a17:907:7ea6:b0:af9:3116:e110 with SMTP id
 a640c23a62f3a-afddd20426dmr6122366b.58.1755547893874; Mon, 18 Aug 2025
 13:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818115015.2909525-1-treapking@chromium.org>
In-Reply-To: <20250818115015.2909525-1-treapking@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Aug 2025 13:11:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
X-Gm-Features: Ac12FXyrfB2_QJdzc3F-AXnavWgZcAA1_jLXyiQVztCZpVvUWjbjdascj2sVMMs
Message-ID: <CAD=FV=XZK3HO8iC3VyMH+fP_XG2ogSNvUWuUcPFUxn1jU6-JZA@mail.gmail.com>
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

On Mon, Aug 18, 2025 at 4:50=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Some touch controllers have to be powered on after the panel's backlight
> is enabled. To support these controllers, introduce .panel_enabled() and
> .panel_disabling() to panel_follower_funcs and use them to power on the
> device after the panel and its backlight are enabled.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---
>
> Changes in v3:
> - Update kernel-docs of drm_panel_add_follower() and drm_panel_remove_fol=
lower()
> - Fix the order of calling .panel_disabling() and .panel_unpreparing()
> - Add a blank line before the goto label
>
> Changes in v2:
> - Replace after_panel_enabled flag with enabled/disabling callbacks
>
>  drivers/gpu/drm/drm_panel.c | 73 +++++++++++++++++++++++++++++++------
>  include/drm/drm_panel.h     | 14 +++++++
>  2 files changed, 76 insertions(+), 11 deletions(-)

Looks good to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

If there are no objections, I'll plan to apply patch #1 next week to
give people a little time to speak up. As per discussion in v2 [1],
unless we hear back an "Ack" from HID maintainers then patch #2 will
just need to wait a while before it can land in the HID tree.

Question for Jessica / Neil: what do you think about landing
${SUBJECT} patch in drm-misc-fixes instead of drm-misc-next? This is a
dependency for the next patch which is marked as a "Fix". It'll mean
that the patch can make it into mainline faster so the HID patch could
land faster. The patch is also pretty low risk...

[1] https://lore.kernel.org/r/CAD=3DFV=3DUV8_XGmxC=3D7Z18PEnj6wKz+yZQuV_4h+=
LJh_MNCqszvg@mail.gmail.com/


-Doug

