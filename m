Return-Path: <linux-input+bounces-12637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C65AC7554
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 03:20:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BA021BA67C8
	for <lists+linux-input@lfdr.de>; Thu, 29 May 2025 01:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3D8319EED3;
	Thu, 29 May 2025 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWAdrwZY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F183F2F3E;
	Thu, 29 May 2025 01:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748481609; cv=none; b=du7Pbvs4q9w46FZUEkilnZ9/GlScBpxSsWs4omGmHc4GJem+x0rCFNHEzUj71YSQokBZ1vz41HkhWwmfiDI85w1Hz8YX6X52rzRxk7KkLZTcUu0EzGjlt5dng/evR/sRHxulqFNnu5Sfii5cyeP56gg+scfmdW6+SKM8D4SQdSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748481609; c=relaxed/simple;
	bh=weLUrWlQLKb4fzO2n61X6hL157RdfiXucWdU3yxcejU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4lsj2SW8gGTrV4mxXS9YrEyaYxoBik9BpWVNJcAG2wrYzMiCuDvO71JuzumT7cMd4/DGGIWva/+4JpfeU3Z4/uATRNlH2+sxDOrm2JOOG1/JxbO1XkQrLXAS9AhxkH2/mMqO1JUu9d+iKR7AIx1kfz6V6u5Zx2OKOkbHuDo5R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWAdrwZY; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso427243a12.2;
        Wed, 28 May 2025 18:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748481606; x=1749086406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPkWpdyNAewyD1pyj4zfn6JvYvHEDl1eszM2O/BEBpg=;
        b=SWAdrwZY129q1muk+4taP/WdJ1lxBGIleQcND8EPha9iM3sjFmof+0xdaHRRK2XSGp
         PgfSV6hoV3TuuXzTMm78kvUpkg0yTOcT8KJb2mLC2LSGPxi0lzMTWPPoUyAotjz729Ry
         Uelisi+su0meaOtQgBuLs+MjrVb/mhZ1Y4kMe42QMDap/6bksBtSTMvhxwarX1Rb5dWi
         2HKNd+47vughG+Cmo8+j84S+oiK+31jiRXx/MOMocn0OIg6gZ7AEtnNEHFczjXvHjAyH
         Xos0XbrtgKDS68TbEcCNH8uv3Bwn+zhyTx+ePGuFXlFZbjnHDXPvMJrJiUzhQMZ3wYb6
         pgrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748481606; x=1749086406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPkWpdyNAewyD1pyj4zfn6JvYvHEDl1eszM2O/BEBpg=;
        b=oh0NVCgeJjeeaYLnOyKDhr4vpWlZ+zS1S4d1X4dVlpz9Dbzr551apPaY1CECxBL3k2
         LnJraZf+FvHzoO3TTVMsk3BpGBkeL5m8gP10NLUUDM4dMVnCeug7GfdkaUtqGq/ppPl7
         iRu5mi+AIC4fMB/6r8zFJ92nta3/HK8walg7IJF+0JHwfqZ579KzILrZKLox/hRN1jWi
         QKZpKwXmFfneqdBoQ4BlR/mvHU1BfnB7DciU/Ebvu1bJnOE2AeNeI9PH3A5AyvN1eAtj
         eQ6GreFRUiKC0OVsncj0JkTL7gRkaMc+49tA/tMAwqBdkC6AHtfqPdIZbF71XU+e5MsO
         5LTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnQ12Bd9A3xEUKPuFFyA6GilvH+rHbAVkOMD2JD7xEFgxam5X2nZVGecTnH7iGoNl2T7IiGCO3RrY=@vger.kernel.org, AJvYcCWsegrMlqWxAOHNkOlUpls1LSf5G6ManqejIO7R3zX7dFGVHTtfHUFBuebxFsFF5ym4M6yzpblrhMeV9R3Q@vger.kernel.org
X-Gm-Message-State: AOJu0YwKGtBtBr70+kAJCiJz27+TzNP9xx9B3c+rTf4ctxXoWD4wlnfP
	TXnB7KirMj7N4kHW/ThSEyD6+j5m009ERWB3mF+xTcVQizK4pwrNaRhO
X-Gm-Gg: ASbGncuZ0XICHfMEdY6n8Op3PcMzsDJJv914pm4KgquHfbr/nU1lEj4KjC0VTjpvsX9
	5SBrAziXSW8ZvcMOhYKcxaIJgX8QC4bf78mcVvPoECDAKIezWuXY7auL7kjr+AX4WFT0YOUMZ4w
	phECcfxGBoNwv5NwJivMYb/aVA8k3TwMKFqBeWy59mh1Q6+EfaTXYI7P5dhTHWptJEWpSIuK/Ha
	rWPjJm5F5u8lhHwfMrFtf9UeDx6h/fGXOQDdGWkr/9HHVzEnf2fntisORF7tZV6kI5x7VznP/2p
	7fQTofgmWGg71EoOdEMjC555iPhPeUVDHOTo+s0s2QrXwEayclA=
X-Google-Smtp-Source: AGHT+IFbs2dDZq4hWhGCBBIpkkepV8NfjoRKYy9BWo37/cU7FNNPSmNTTgq0Enpjm77Ucc2OZh1z8w==
X-Received: by 2002:a05:6a21:710a:b0:20b:a75e:fa32 with SMTP id adf61e73a8af0-2188c3b4898mr30416971637.40.1748481605944;
        Wed, 28 May 2025 18:20:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafad4sm231277b3a.116.2025.05.28.18.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 18:20:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E05CD41E4844; Thu, 29 May 2025 08:20:01 +0700 (WIB)
Date: Thu, 29 May 2025 08:20:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: George Anthony Vernon <contact@gvernon.com>, dmitry.torokhov@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2 3/4] input: docs: Fix Amiga joysticks grammar
Message-ID: <aDe2QbVwsmo83Wu9@archie.me>
References: <20250526135957.180254-1-contact@gvernon.com>
 <20250526135957.180254-4-contact@gvernon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32vja2NKutgRl3jI"
Content-Disposition: inline
In-Reply-To: <20250526135957.180254-4-contact@gvernon.com>


--32vja2NKutgRl3jI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 02:59:51PM +0100, George Anthony Vernon wrote:
> diff --git a/Documentation/input/devices/amijoy.rst b/Documentation/input=
/devices/amijoy.rst
> index ea4de1ac0360..cbc5240f8af3 100644
> --- a/Documentation/input/devices/amijoy.rst
> +++ b/Documentation/input/devices/amijoy.rst
> @@ -1,14 +1,13 @@
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> -Amiga joystick extensions
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> +~~~~~~~~~~~~~~~
> +Amiga joysticks
> +~~~~~~~~~~~~~~~
> =20
> =20
> -Amiga 4-joystick parport extension
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +Amiga 4-joystick parallel port extension
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20
>  Parallel port pins:
> =20
> -
>  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D   =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>  Pin    Meaning  Pin    Meaning
>  =3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D   =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> @@ -90,17 +89,17 @@ Pin Meaning
> =20
>  ------------------------------------------------------------------------=
-------
> =20
> -=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME     rev ADDR type chip   Description
> -=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -JOY0DAT      00A   R   Denise Joystick-mouse 0 data (left vert, horiz)
> -JOY1DAT      00C   R   Denise Joystick-mouse 1 data (right vert,horiz)
> -=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +JOY0DAT      00A   R   Denise Joystick-mouse 0 data (left vert., horiz.)
> +JOY1DAT      00C   R   Denise Joystick-mouse 1 data (right vert., horiz.)
> +=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>          These addresses each read a 16 bit register. These in turn
>          are loaded from the MDAT serial stream and are clocked in on
>          the rising edge of SCLK. MLD output is used to parallel load
> -        the external parallel-to-serial converter.This in turn is
> +        the external parallel-to-serial converter. This in turn is
>          loaded with the 4 quadrature inputs from each of two game
>          controller ports (8 total) plus 8 miscellaneous control bits
>          which are new for LISA and can be read in upper 8 bits of
> @@ -108,7 +107,7 @@ JOY1DAT      00C   R   Denise Joystick-mouse 1 data (=
right vert,horiz)
> =20
>          Register bits are as follows:
> =20
> -        - Mouse counter usage (pins  1,3 =3DYclock, pins 2,4 =3DXclock)
> +        - Mouse counter usage (pins 1,3 =3DYclock, pins 2,4 =3DXclock)
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=
=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D =
=3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D
>      BIT#  15  14  13  12  11  10  09  08     07  06  05  04  03  02  01 =
 00
> @@ -179,12 +178,12 @@ JOYTEST       036   W   Denise  Write to all 4  joy=
stick-mouse counters at once.
> =20
>  ------------------------------------------------------------------------=
-------
> =20
> -=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  NAME    rev ADDR type chip   Description
> -=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -POT0DAT  h  012   R   Paula  Pot counter data left pair (vert, horiz)
> -POT1DAT  h  014   R   Paula  Pot counter data right pair (vert,horiz)
> -=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +POT0DAT  h  012   R   Paula  Pot counter data left pair (vert., horiz.)
> +POT1DAT  h  014   R   Paula  Pot counter data right pair (vert., horiz.)
> +=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D =3D=3D=3D=3D=
=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>          These addresses each read a pair of 8 bit pot counters.
>          (4 counters total). The bit assignment for both
> @@ -213,8 +212,8 @@ POT1DAT  h  014   R   Paula  Pot counter data right p=
air (vert,horiz)
>           +-------+------+-----+-----+-------+
> =20
>           With normal (NTSC or PAL) horiz. line rate, the pots will
> -         give a full scale (FF) reading with about 500kohms in one
> -         frame time. With proportionally faster horiz line times,
> +         give a full scale (FF) reading with about 500k ohm in one
> +         frame time. With proportionally faster horiz. line times,
>           the counters will count proportionally faster.
>           This should be noted when doing variable beam displays.
> =20
> @@ -238,26 +237,26 @@ POTINP     016   R   Paula  Pot pin data read
>          This register controls a 4 bit bi-direction I/O port
>          that shares the same 4 pins as the 4 pot counters above.
> =20
> -         +-------+----------+-------------------------------------------=
--+
> -         | BIT#  | FUNCTION | DESCRIPTION                               =
  |
> -         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> -         | 15    | OUTRY    | Output enable for Paula pin 33            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 14    | DATRY    | I/O data Paula pin 33                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 13    | OUTRX    | Output enable for Paula pin 32            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 12    | DATRX    | I/O data Paula pin 32                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 11    | OUTLY    | Out put enable for Paula pin 36           =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 10    | DATLY    | I/O data Paula pin 36                     =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 09    | OUTLX    | Output enable for Paula pin 35            =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 08    | DATLX    | I/O data  Paula pin 35                    =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 07-01 |   X      | Not used                                  =
  |
> -         +-------+----------+-------------------------------------------=
--+
> -         | 00    | START    | Start pots (dump capacitors,start counters=
) |
> -         +-------+----------+-------------------------------------------=
--+
> +         +-------+----------+-------------------------------------------=
---+
> +         | BIT#  | FUNCTION | DESCRIPTION                               =
   |
> +         +=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+
> +         | 15    | OUTRY    | Output enable for Paula pin 33            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 14    | DATRY    | I/O data Paula pin 33                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 13    | OUTRX    | Output enable for Paula pin 32            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 12    | DATRX    | I/O data Paula pin 32                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 11    | OUTLY    | Out put enable for Paula pin 36           =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 10    | DATLY    | I/O data Paula pin 36                     =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 09    | OUTLX    | Output enable for Paula pin 35            =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 08    | DATLX    | I/O data  Paula pin 35                    =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 07-01 |   X      | Not used                                  =
   |
> +         +-------+----------+-------------------------------------------=
---+
> +         | 00    | START    | Start pots (dump capacitors, start counter=
s) |
> +         +-------+----------+-------------------------------------------=
---+
=20
LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--32vja2NKutgRl3jI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaDe2PAAKCRD2uYlJVVFO
o5C1AP4z9f6kZASk1dzc0JBf8ilOARUtJWgs/bIuTrwqyfPhhQD+PmuFJvAiNQKB
X57M2s574YwbaQ8T6xSOYdsYMm4HWAU=
=qK3n
-----END PGP SIGNATURE-----

--32vja2NKutgRl3jI--

