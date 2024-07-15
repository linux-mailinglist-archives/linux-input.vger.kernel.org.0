Return-Path: <linux-input+bounces-5043-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B9393188D
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 18:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E1011C2110F
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 16:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B9F1B947;
	Mon, 15 Jul 2024 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZG5OZJh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832F1CD0C
	for <linux-input@vger.kernel.org>; Mon, 15 Jul 2024 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721061438; cv=none; b=o9fC+tIjiVgl5FtnuZ0iVX58izSAyrtTYhD7To+pbLl+UsiTI5QDWUEP7sxOzmE5CYcb/QjAsO1T4zfQqKzG/01en3uLGiEjfZ7qg83Ra0C0EkjEtjCKwD+yG3WtnTzt6dfj9WaqaJabpvtHmI6QgduAMpaFlMSZI6nIri998hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721061438; c=relaxed/simple;
	bh=Y8P1O6Lb0DClu4/ShXi7zz0tgDDTn8CjRazpac/6nB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHb+qNMCAOuRbalqtDNrd3hmfdifC7VtDIC7lmDK7aGAZpIBU6p86VdjRySkCJteglfvTUkbUudpOn+1KpIbFwF9hCV6fXJNCHENATZMcUNqVQO/EAF63BMZxe7cGmesJKH0ZGQxrOOnjok9vUDJqUztCNSdBXO2WX4SdXhXfXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZG5OZJh; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-58c07e8e9d4so733233a12.0
        for <linux-input@vger.kernel.org>; Mon, 15 Jul 2024 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721061435; x=1721666235; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCHxyy8wEjD8Sapwisa2RVmTQ4soARRyph+dCFKq4NU=;
        b=BZG5OZJhyucrSZisYgeXmkZ8cNKpdHdlDIPDEoQFstJHcqzkd4q7iMspEDOrx9ZMVc
         iyyKFeme6mCr8MUuFwHCW3ONDqLjs2iHuT+m7FPW0dNr7f7AXEYDqS9MO5cn0LmN6t/U
         JSY3XBg4oh2ZklpbYMR24ERxWcrSQpia/By44tCT24N2dhczPHCwYx6ohvAnyfWZWuSK
         2FY1Pw5oxBouJUXBSiYVoYtzKSi4LgHurpgMX9GU3q4yoqF7MTXvh1ZFimeS2kc8nS2z
         nsENFSxIVp3I9I71bmh4zYf0q0faYuxmfxdiVqvw29Hx7PTEx62hiTpLMqnDHWlsIj27
         fSjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721061435; x=1721666235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCHxyy8wEjD8Sapwisa2RVmTQ4soARRyph+dCFKq4NU=;
        b=jXpgXPwb++z8hMCzEKiftPI9LBvvt+KA4nwY+8lBafF7rIdaTloxpZT//xg0+A2npi
         oqC7Dt8rMa6uSrzAXMYiWG7R213Dok5lNUwQy7YXKoHPPlOsIzSb6UYr24lxM7KEdHKq
         Yo6su1pfxnUA2w++Y6teGmfxD6ynPoWmzBWajOgOCk3aubKsGzj0CKfQ0T/bI00PemBz
         jZCK3hbpDilF75+8pgDfvx9XPQdTGUg8ur5nGq5q+qJ0b9G0UFRVjd3VIhtpwuiqbKos
         NTdxq6VlP4fLaUARDWiZCc0ZQFR2t2Be7iaewmoVjbYgka+vrMNdVuEjDCfo+Z8a+Oxq
         8nEw==
X-Gm-Message-State: AOJu0Yw7VEPI/TCGY3K3kEoROwrFWTfaFYaWt5XmedcjLvqyP5D/FK23
	Q8rRGwDgmwVbPoJ0v/2XHRxwxGEjnCtzyGSNqCEqspSx3XoAWBER/MrPwe3MMJgKAKmAGsof7fa
	64AkMBcxgENTdX6S14k+Uvdn1os0=
X-Google-Smtp-Source: AGHT+IFmCPnYvzT9gJTqq7Dqm9Mx+1eg4M4LtFqVWuJIFXDLoTG58gXBWOaD5+AbI0+YwxW7Dy2UeyZGPDEVEwa0QLk=
X-Received: by 2002:a05:6402:1ca4:b0:599:b77c:7b5d with SMTP id
 4fb4d7f45d1cf-59e9a0d3496mr174589a12.6.1721061435269; Mon, 15 Jul 2024
 09:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
In-Reply-To: <20240709055729.17158-1-tatsunosuke.wacom@gmail.com>
From: Ping Cheng <pinglinux@gmail.com>
Date: Mon, 15 Jul 2024 09:37:03 -0700
Message-ID: <CAF8JNhLxPG8H7uvySTqWLkp3fsB+HandJ_JHMtpr_H5XMDy7pw@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID:wacom: Modify pen IDs
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org, Jason Gerecke <killertofu@gmail.com>, 
	Erin Armstrong Skomra <skomra@gmail.com>, Joshua Dickens <Joshua@joshua-dickens.com>, 
	Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
	Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>, stable@kernel.org, 
	Gavin Hsia <gavin.h.hsia@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri, hi Benjamin,

Can one of you give the patchset a review and merge them? The first
one is a bug fix. The second one is just a cleanup. Both changes are
device specific.

Thank you,
Ping

On Mon, Jul 8, 2024 at 10:57=E2=80=AFPM Tatsunosuke Tobita
<tatsunosuke.wacom@gmail.com> wrote:
>
> From: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
>
> The pen ID, 0x80842, was not the correct ID for wacom driver to
> treat. The ID was corrected to 0x8842.
> Also, 0x4200 was not the expected ID used on any Wacom device.
> Therefore, 0x4200 was removed.
>
> Signed-off-by: Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>
> Signed-off-by: Tatsunosuke Tobita <tatsunosuke.wacom@gmail.com>
> Fixes: bfdc750c4cb2 ("HID: wacom: add three styli to wacom_intuos_get_too=
l_type")
> Cc: stable@kernel.org #6.2
> ---
>  drivers/hid/wacom_wac.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index a44367aef621..20de97ce0f5e 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -714,13 +714,12 @@ static int wacom_intuos_get_tool_type(int tool_id)
>         case 0x8e2: /* IntuosHT2 pen */
>         case 0x022:
>         case 0x200: /* Pro Pen 3 */
> -       case 0x04200: /* Pro Pen 3 */
>         case 0x10842: /* MobileStudio Pro Pro Pen slim */
>         case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
>         case 0x16802: /* Cintiq 13HD Pro Pen */
>         case 0x18802: /* DTH2242 Pen */
>         case 0x10802: /* Intuos4/5 13HD/24HD General Pen */
> -       case 0x80842: /* Intuos Pro and Cintiq Pro 3D Pen */
> +       case 0x8842: /* Intuos Pro and Cintiq Pro 3D Pen */
>                 tool_type =3D BTN_TOOL_PEN;
>                 break;
>
> --
> 2.34.1
>

