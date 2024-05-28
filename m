Return-Path: <linux-input+bounces-3924-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E12658D29E4
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 03:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1671F2741A
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02B3632;
	Wed, 29 May 2024 01:21:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31CF2B9A9
	for <linux-input@vger.kernel.org>; Wed, 29 May 2024 01:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945683; cv=none; b=nlegc8eQX8m1umQt1VCknv8IQJkaCgvXpPJw8CPBOcaNX3g+iHB6v+wiGOgGTIwjEX0FHdxcEodsrQ5vdvhXJ5u4z27GrkyFC6E5a3HLiaktNVvo6RRjOAxUm8/YHcY6y+bYnlCsUWD3ikwZonrbrHYx9NSpK88APrRl6K/TSzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945683; c=relaxed/simple;
	bh=fRDuONy6QzMxYX98b8awx7ih4nM00Yas8UAdlH8+7N8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FEFiAealXLz/ooNVSFjwuT9aHUnSjQRdgZKq9T1YiCoXE/+qZMmfEfbWJV23+1l9CdKFB6pKbRvFIa79TGzGeBScIQN7qk0+aGb1+ZovKc7fQsy+pYnBxEDPBiAFQ31RNKAgEhRHG/pvoIkZ87AKsbQCNr2g/1inP2hpn7M+6Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=moeller.io; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=moeller.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a62972c88a9so185528966b.1
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 18:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716945680; x=1717550480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FuuAWdxCmRzs75Q4GZxnHik/Fklc5HH5Xf5RNHB1a6g=;
        b=VA39wWi354pbEwsP86rVaNproleKlSzBrWl22kxOAO0XyaPV2C9eob/3rMxKrpzjPP
         skMWOYLswp1ThiiUbNbQyMd4DocADd5ABu74JUNRLqM7/8OnLo3kAC/HdVgVohrrZM04
         g9ZaOQoNw0n9roTWkFcEtvNGGt/RWhigI0+SB569zvqswaTUlWIACBB01DxlSfXOaSCs
         51q7f6Rj3Tg5MWeTMcEwhGksKM3JZWkoG/+8WhixcAw6NEohkAMl74eGOkZ9vKvqIIb0
         gMMaecAOB2cYI7MplTg3/AaijgMYara8JgdEKPUXoQm+kTFp+I3UfaatcCv1Koo3mbAC
         CkIQ==
X-Gm-Message-State: AOJu0Yz6OUOD/Rs4QWZo3VyftGI8hYAyAT9QFDj3Vf5uomzGEaZVeVs+
	vTIa5qofeai1WQ1IwbTXmYvDqYglS4VYtjO/eihUoWLQuOUKWQM1bjMCTbCOALo=
X-Google-Smtp-Source: AGHT+IFPPbjZKtqL1e8iXEWjESu7j97mSk3NjLdPtJzNA3p1A23mNOdHjb/E0fKVkGfS92YAF5gFrw==
X-Received: by 2002:a17:906:3c05:b0:a59:cf0a:4e4d with SMTP id a640c23a62f3a-a626407d4f5mr979725966b.12.1716945679622;
        Tue, 28 May 2024 18:21:19 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a632fde2922sm158736866b.195.2024.05.28.18.21.19
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 18:21:19 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5786988ae9bso1823906a12.3
        for <linux-input@vger.kernel.org>; Tue, 28 May 2024 18:21:19 -0700 (PDT)
X-Received: by 2002:a50:cd13:0:b0:578:60ab:2b8f with SMTP id
 4fb4d7f45d1cf-57860ab3133mr6859303a12.42.1716945679238; Tue, 28 May 2024
 18:21:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429070950.247183-1-jon@moeller.io>
In-Reply-To: <20240429070950.247183-1-jon@moeller.io>
From: Jon Moeller <jon@moeller.io>
Date: Tue, 28 May 2024 11:21:10 -0700
X-Gmail-Original-Message-ID: <CABWf9sbtpJMCPrHRu1jtL7d_ozPmyXO11QedXuTww3nAyzP0vA@mail.gmail.com>
Message-ID: <CABWf9sbtpJMCPrHRu1jtL7d_ozPmyXO11QedXuTww3nAyzP0vA@mail.gmail.com>
Subject: Re: [PATCH] Adding quirks for 2024 HP Spectre x360 touchpads
To: Jon Moeller <jon@moeller.io>
Cc: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is there anything special I need to do to get this merged? I was
hoping this would get worked into 6.10.

On Mon, Apr 29, 2024 at 12:09=E2=80=AFAM Jon Moeller <jon@moeller.io> wrote=
:
>
> ---
>  drivers/hid/hid-multitouch.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 04a014cd2a2f..7a7918191628 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -212,6 +212,7 @@ static void mt_post_parse(struct mt_device *td, struc=
t mt_application *app);
>  #define MT_CLS_GOOGLE                          0x0111
>  #define MT_CLS_RAZER_BLADE_STEALTH             0x0112
>  #define MT_CLS_SMART_TECH                      0x0113
> +#define MT_CLS_HP_SPECTRE_ELAN_HAPTIC          0x0114
>
>  #define MT_DEFAULT_MAXCONTACT  10
>  #define MT_MAX_MAXCONTACT      250
> @@ -396,6 +397,13 @@ static const struct mt_class mt_classes[] =3D {
>                         MT_QUIRK_CONTACT_CNT_ACCURATE |
>                         MT_QUIRK_SEPARATE_APP_REPORT,
>         },
> +       { .name =3D MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
> +               .quirks =3D MT_QUIRK_ALWAYS_VALID |
> +                       MT_QUIRK_SLOT_IS_CONTACTID |
> +                       MT_QUIRK_CONTACT_CNT_ACCURATE |
> +                       MT_QUIRK_CONFIDENCE |
> +                       MT_QUIRK_WIN8_PTP_BUTTONS,
> +       },
>         { }
>  };
>
> @@ -1992,6 +2000,12 @@ static const struct hid_device_id mt_devices[] =3D=
 {
>                 HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
>                         USB_VENDOR_ID_ELAN, 0x3148) },
>
> +       { .driver_data =3D MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
> +               HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x32c8) },
> +
> +       { .driver_data =3D MT_CLS_HP_SPECTRE_ELAN_HAPTIC,
> +               HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, 0x310a) },
> +
>         /* Elitegroup panel */
>         { .driver_data =3D MT_CLS_SERIAL,
>                 MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
> --
> 2.44.0
>
> Signed-off-by: Jon Moeller <jon@moeller.io>

