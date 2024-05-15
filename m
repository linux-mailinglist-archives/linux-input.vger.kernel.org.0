Return-Path: <linux-input+bounces-3717-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459388C69C0
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 17:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C126CB221AC
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 15:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE158155749;
	Wed, 15 May 2024 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cg70LgCK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE3D155736
	for <linux-input@vger.kernel.org>; Wed, 15 May 2024 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715787012; cv=none; b=HSJsg4ld8/er/zFHu+iiR6tNvpp/JYIKGgDFAGt8FZt42RYBZSY6g3xm9X5U7CHkt1E650DhGbYNrPXXYvT94JpYWi3FKJLSaeRuF+CN6ZT+83fCtBhb/18Y2GlG+u5qO7ckco0ynAeAj/oniR7twcHl6NyhimCTulkAdh1k4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715787012; c=relaxed/simple;
	bh=iN8matYjyvj8EmXmPi1mXOrlyGDmDH19/5Kdt0+yZnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=droJWM+JC5TBiezxLLw68R7i1LAANx2NB9KjlHnI3dr9W5zwURsjWnCIaFaKY5tUHluFdySOHGRxXQ7OE/Lj86mUZxIbix/RZDvsPHOfNxRhLsw3MbcP7pp+KXFCAvpjXmgd0BeZh9Gv9rijQeqwSr/jtd3bCJdtzuc1TCkYC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cg70LgCK; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43dfe020675so2092451cf.0
        for <linux-input@vger.kernel.org>; Wed, 15 May 2024 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715787010; x=1716391810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWQRenWjdpHYMXaannQIn7Uf7C7Qw+cYZ1N3+xFMxeM=;
        b=Cg70LgCKhsiiTD6OG0VZUNlLHjaIijTPnLTa+9hM6u6KCDJdyRmmqE3JDwKijlPjYW
         gdQ8RzpNhsxO+Wc5Rpfyyb9Ane8QbQ+OR/H9tXadZOhYkHsvXoAV91CP080mL9LeZ+Ww
         ybLnfwfgzo5/5F+mavAZ7RHD/vMVuztVMG9kR67kxKwmiAuzQhVMhj+3E5+gAf9nyU0M
         hBWUufY5fp3u5RTeD7H4HgOrEbif+bkAULrwBJ8BtpS/Cm/bMLXLccVBvOhWKDcyiS/x
         PV9zveW2nUVTxMt6cAPS2r2vK6jLrFzqwWbCS8gLjfWzW4T9zIP5pnXqgCtnCwHG16So
         cVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715787010; x=1716391810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWQRenWjdpHYMXaannQIn7Uf7C7Qw+cYZ1N3+xFMxeM=;
        b=XtlY9+toPaP3Eeo6K/FFkp6idrXI1CgNbu7P6xObv8g7lfl/nwcMBe8XUfzHQRK5DK
         YcsoJXt46npc70macN+Vq8WRg1eNBlLcty8JTiiaoFKhp3cQVrjA3spLaZkgeHSEEzrS
         cQab6nbaB5pC3OMDLZEyK3Y0BVAiZmFklYnlIRMf4GzURkjoPhZN6pGbfop7rwkPIYLv
         Es2rSrxsc0ISG0xohssTC5jwZRNyAJYDKURcAPdUep5FYw4fte6AuZqXeUWamyt7MjMA
         3IrV5w6FqsZb9VzEwJ0VkdZIY9d4A5atPsRMrqNdN5xj9z1jO3ij5G/SoefrTO6Nfwu+
         lHfw==
X-Forwarded-Encrypted: i=1; AJvYcCUW+xGxFfAeK4i0loYBfxSdi3qNRdo4dFQ/mPf3ZEO4+RInnpSBoAdI45aGzrUPpYwmWMbbeLHiocWQsnPoMx1e3AAmYhCe8uaeADM=
X-Gm-Message-State: AOJu0Yz/l9bFJi66tuZ0z5bXPbrdmRQEtjZoNo3wf7KKrtPGlbI45Yhl
	nNs7UMTh37LU9BPrIjv4x2hNmfYiKoOWME5bxVKvtwpbwMn1tPM4ws7qUO6KhSTC0cGb99VjWs6
	hUBjo7MDYz2S/hhiVy8lcMY2/tZ7GodfAMcVe
X-Google-Smtp-Source: AGHT+IGJGp0luo4tSLl+hVgce9Ibj6n3gBuMuLJQ2JNyO3iqpNBP3apqcepmnIos8wr124kd0+SIi+IoDsgY10kszjM=
X-Received: by 2002:a05:622a:1dcb:b0:43d:dfa2:216f with SMTP id
 d75a77b69052e-43e094d0189mr11430441cf.6.1715787010055; Wed, 15 May 2024
 08:30:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZjQeE643YAbK1hq5@google.com> <20240503155020.v2.1.Ifa0e25ebf968d8f307f58d678036944141ab17e6@changeid>
In-Reply-To: <20240503155020.v2.1.Ifa0e25ebf968d8f307f58d678036944141ab17e6@changeid>
From: Jonathan Denose <jdenose@google.com>
Date: Wed, 15 May 2024 10:29:58 -0500
Message-ID: <CAMCVhVNr=ax6tv=VXRpQoz=z=yR+LiHGUU6r7LpHM4oBoJSKSw@mail.gmail.com>
Subject: Re: [PATCH v2] Input: elantech - fix touchpad state on resume for
 Lenovo N24
To: dmitry.torokhov@gmail.com
Cc: gregkh@linuxfoundation.org, jefferymiller@google.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 11:12=E2=80=AFAM Jonathan Denose <jdenose@google.com=
> wrote:
>
> The Lenovo N24 on resume becomes stuck in a state where it
> sends incorrect packets, causing elantech_packet_check_v4 to fail.
> The only way for the device to resume sending the correct packets is for
> it to be disabled and then re-enabled.
>
> This change adds a dmi check to trigger this behavior on resume.
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>
> Changes in v2:
> - change ps2_sendbyte() calls to ps2_command()
>
>  drivers/input/mouse/elantech.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantec=
h.c
> index 4e38229404b4b..18f26315cae25 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1476,6 +1476,23 @@ static void elantech_disconnect(struct psmouse *ps=
mouse)
>         psmouse->private =3D NULL;
>  }
>
> +/*
> + * Some hw_version 4 models fail to properly activate absolute mode on
> + * resume without going through disable/enable cycle.
> + */
> +static const struct dmi_system_id elantech_needs_reenable[] =3D {
> +#if defined(CONFIG_DMI) && defined(CONFIG_X86)
> +       {
> +               /* Lenovo N24 */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "81AF"),
> +               },
> +       },
> +#endif
> +       { }
> +};
> +
>  /*
>   * Put the touchpad back into absolute mode when reconnecting
>   */
> @@ -1486,6 +1503,22 @@ static int elantech_reconnect(struct psmouse *psmo=
use)
>         if (elantech_detect(psmouse, 0))
>                 return -1;
>
> +       if (dmi_check_system(elantech_needs_reenable)) {
> +               int err;
> +
> +               err =3D ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_D=
ISABLE);
> +
> +               if (err)
> +                       psmouse_warn(psmouse, "Failed to deactivate mouse=
 on %s: %d\n",
> +                                       psmouse->ps2dev.serio->phys, err)=
;
> +
> +               err =3D ps2_command(&psmouse->ps2dev, NULL, PSMOUSE_CMD_E=
NABLE);
> +
> +               if (err)
> +                       psmouse_warn(psmouse, "Failed to reactivate mouse=
 on %s: %d\n",
> +                                       psmouse->ps2dev.serio->phys, err)=
;
> +       }
> +
>         if (elantech_set_absolute_mode(psmouse)) {
>                 psmouse_err(psmouse,
>                             "failed to put touchpad back into absolute mo=
de.\n");
> --
> 2.45.0.rc1.225.g2a3ae87e7f-goog
>

Hello,

Is there anything else needed from me?
--=20
Jonathan

