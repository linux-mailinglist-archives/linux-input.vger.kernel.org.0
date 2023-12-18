Return-Path: <linux-input+bounces-824-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAE181676F
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 08:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83DAA1F22DE9
	for <lists+linux-input@lfdr.de>; Mon, 18 Dec 2023 07:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E398BD272;
	Mon, 18 Dec 2023 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhPiC+tU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2320379F7
	for <linux-input@vger.kernel.org>; Mon, 18 Dec 2023 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2cc3f5e7451so31245851fa.2
        for <linux-input@vger.kernel.org>; Sun, 17 Dec 2023 23:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702884812; x=1703489612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZW35qmP+/wtz3L+npU/IJLY/6oTtrrAjtbp/uv7+Jys=;
        b=JhPiC+tUgYIjonZ4Q+ZO8Y3SjXpPDgwvNoTsmiu10BVGunEJuVqkYxS9k3uLsHLF/F
         K524PoSFfObZrCjdJFtRs0CQ/x+LNObvzQkucq4k2FWOti0km/4gIzvLrSoiq3T44xEd
         i/oH9yKpnBfUFo8pe89OtO114F+7Pc35GA+VG56d+FQtYmc0gylRJ9zwwF9G3I+OZMzO
         Whyc7Xm5SvQ306T5SVQwWtkg4C4n8Gpgj7ed8MjGsiQyaXYhdKniGTBvElQjxub/2zca
         rR9ex2YsDahk0sRPsy+41pTV7yS3/lCmb67YV9f6ztGCWjiqFRy6QuiClWTdcZv2Ao45
         J23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702884812; x=1703489612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZW35qmP+/wtz3L+npU/IJLY/6oTtrrAjtbp/uv7+Jys=;
        b=h7Q15y4pRshRUB96lrMd2ix0j79yk6ZLeYIb92WroTk2sa6wI/ELjJ7jTnBxZ6ORwW
         el7lFt0Pd0mWlNh31SyHiM4jyec3ESKKnMz9MblCYFY6WtdXVzjbDoSkgZb0ZuMFsM85
         lEMtzmdr1GvfJ5gNKXUNlUjkP9591uqLU0g8pjdJ46zrJAyx/OmGfPOqeKvgq3v/zCcd
         jpyGSgFS8gqNhkYj0jhjkFI91QZqGWrmnFKuarxeCkxHOyCGDNOLJlw1bnSp07ws5aFJ
         c35VYn/9UzRel/NFbmAJlaUw6hXxirTQK54K2o4R0pfb5AjztymhteX2Ee94ErhGdYE5
         7gYA==
X-Gm-Message-State: AOJu0YwNQpPz1uplpHyl/6tcfw21S/IptgdbBo63nJ10B1HDA/e27Ie5
	K08B6UuApXP5BFYNC6TLHgwolxNr87cJWV5J1x0=
X-Google-Smtp-Source: AGHT+IE3jhEJQTtgRuyQSQT65Bnsv/gL+cwN9Cf6aIbtje89NRVtzKewiAEPwVWURaUWZGAQp+VdskvIfhqDCwU9FBU=
X-Received: by 2002:a05:651c:1503:b0:2cc:1c71:aff8 with SMTP id
 e3-20020a05651c150300b002cc1c71aff8mr7349269ljf.97.1702884811917; Sun, 17 Dec
 2023 23:33:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202312141227.C2h1IzfI-lkp@intel.com> <20231214172541.48370-1-rymcclel@gmail.com>
In-Reply-To: <20231214172541.48370-1-rymcclel@gmail.com>
From: Daniel Ogorchock <djogorchock@gmail.com>
Date: Mon, 18 Dec 2023 02:33:20 -0500
Message-ID: <CAEVj2tn+=T5mSZ5bN=GMyh-dtxfdhMEEPPrXCJR+JfhNJ=Wa3w@mail.gmail.com>
Subject: Re: [PATCH] HID: nintendo: fix initializer element is not constant error
To: Ryan McClelland <rymcclel@gmail.com>
Cc: lkp@intel.com, linux-input@vger.kernel.org, jkosina@suse.com, 
	linux-mm@kvack.org, oe-kbuild-all@lists.linux.dev, 
	benjamin.tissoires@redhat.com, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ryan,

On Thu, Dec 14, 2023 at 12:26=E2=80=AFPM Ryan McClelland <rymcclel@gmail.co=
m> wrote:
>
> With gcc-7 builds, an error happens with the controller button values bei=
ng
> defined as const. Change to a define.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312141227.C2h1IzfI-lkp@i=
ntel.com/
>
> Signed-off-by: Ryan McClelland <rymcclel@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 44 +++++++++++++++++++-------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
> index 47af111ef3a2..2987083785f9 100644
> --- a/drivers/hid/hid-nintendo.c
> +++ b/drivers/hid/hid-nintendo.c
> @@ -336,28 +336,28 @@ struct joycon_imu_cal {
>   * All the controller's button values are stored in a u32.
>   * They can be accessed with bitwise ANDs.
>   */
> -static const u32 JC_BTN_Y      =3D BIT(0);
> -static const u32 JC_BTN_X      =3D BIT(1);
> -static const u32 JC_BTN_B      =3D BIT(2);
> -static const u32 JC_BTN_A      =3D BIT(3);
> -static const u32 JC_BTN_SR_R   =3D BIT(4);
> -static const u32 JC_BTN_SL_R   =3D BIT(5);
> -static const u32 JC_BTN_R      =3D BIT(6);
> -static const u32 JC_BTN_ZR     =3D BIT(7);
> -static const u32 JC_BTN_MINUS  =3D BIT(8);
> -static const u32 JC_BTN_PLUS   =3D BIT(9);
> -static const u32 JC_BTN_RSTICK =3D BIT(10);
> -static const u32 JC_BTN_LSTICK =3D BIT(11);
> -static const u32 JC_BTN_HOME   =3D BIT(12);
> -static const u32 JC_BTN_CAP    =3D BIT(13); /* capture button */
> -static const u32 JC_BTN_DOWN   =3D BIT(16);
> -static const u32 JC_BTN_UP     =3D BIT(17);
> -static const u32 JC_BTN_RIGHT  =3D BIT(18);
> -static const u32 JC_BTN_LEFT   =3D BIT(19);
> -static const u32 JC_BTN_SR_L   =3D BIT(20);
> -static const u32 JC_BTN_SL_L   =3D BIT(21);
> -static const u32 JC_BTN_L      =3D BIT(22);
> -static const u32 JC_BTN_ZL     =3D BIT(23);
> +#define JC_BTN_Y        BIT(0)
> +#define JC_BTN_X        BIT(1)
> +#define JC_BTN_B        BIT(2)
> +#define JC_BTN_A        BIT(3)
> +#define JC_BTN_SR_R     BIT(4)
> +#define JC_BTN_SL_R     BIT(5)
> +#define JC_BTN_R        BIT(6)
> +#define JC_BTN_ZR       BIT(7)
> +#define JC_BTN_MINUS    BIT(8)
> +#define JC_BTN_PLUS     BIT(9)
> +#define JC_BTN_RSTICK   BIT(10)
> +#define JC_BTN_LSTICK   BIT(11)
> +#define JC_BTN_HOME     BIT(12)
> +#define JC_BTN_CAP      BIT(13) /* capture button */
> +#define JC_BTN_DOWN     BIT(16)
> +#define JC_BTN_UP       BIT(17)
> +#define JC_BTN_RIGHT    BIT(18)
> +#define JC_BTN_LEFT     BIT(19)
> +#define JC_BTN_SR_L     BIT(20)
> +#define JC_BTN_SL_L     BIT(21)
> +#define JC_BTN_L        BIT(22)
> +#define JC_BTN_ZL       BIT(23)
>
>  struct joycon_ctlr_button_mapping {
>         u32 code;
> --
> 2.25.1
>

Thanks for the quick fix.

Reviewed-by: Daniel J. Ogorchock <djogorchock@gmail.com>

-Daniel

