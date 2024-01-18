Return-Path: <linux-input+bounces-1316-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9272E831F31
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 19:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C01A1F231C3
	for <lists+linux-input@lfdr.de>; Thu, 18 Jan 2024 18:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CB612DF68;
	Thu, 18 Jan 2024 18:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PoS9gzWd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626301DFC2
	for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 18:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705603309; cv=none; b=CtB/fqyCtfqQQSL8qq4cszWoIY5AwvPixYX1KqfqR4zBj8GS08JppEIIL/L/OVa1ZwYNZQpM6rMFsWLRpSkpY05GQqE+gGw0J4QSxOgu5q2toGfIMFn0x5ujmSJcSd5YHinb6ZK24REJnVmGI2x6SQbQ57yWrigw64+aNgECa6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705603309; c=relaxed/simple;
	bh=4OmQ1oubWOd7o519mJLdBFWYdcFLo4S+glxiLbr+tC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NvUOn4bdWJnAWaxXRHxJGiMKnox/1nLlluLtMzGMHFCFZk0bgOTG0s//aubdgaBJkOSjh4VrKasKWBQuopnYNasgMVg0K5qO4VaKjaCFwwPQJSfDVEhXFm0G9R5O2aXQOUraR4e8cmhU0waeK39H+0jg8CsoPcBXF6nOXaIM4Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PoS9gzWd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-337c25e503fso631320f8f.1
        for <linux-input@vger.kernel.org>; Thu, 18 Jan 2024 10:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705603306; x=1706208106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLpIkESB6PMuUI7s5uphN+gLKVT0TGYaYNk8rmcP/OU=;
        b=PoS9gzWd5PyzGkMDQnylWS07w736YnWl1GlffC9RHfbE40j9gTMO5xnZNY1sMzbw/T
         D+lbeapK+Pv/ugSNhXg0fJnmoxFg1AqHS+yiAya3o+aSM77vC2N0CciI45XZbTPFPWEo
         rMOc8HsVds2JEZx5SgGrCCv3vOa12VUjUJ4FirMX4rC8MAH4xMDqbA4G/qYderuQ+Fss
         ESYKGbgFIE+Alfn5Q26fSnPsrUOIB6AsFaFF928iwNv6ZP2nJabHHdMHpMLuOSyQGgN0
         0T0LkDk/69LnZ/lp24+aJObZni8Dly2N4J371z4yf9/QdPDHdff86OJQDicdV3w9HzZ+
         UT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705603306; x=1706208106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLpIkESB6PMuUI7s5uphN+gLKVT0TGYaYNk8rmcP/OU=;
        b=QVSXPtEiHjsDbUdTUa4bE/rCrwGa6PcRThsgbUtmXgkXQvtjpMwqVRcqOgkr08UqiR
         EY2tg5jBwcw99DDlmcQuxY+Pbi5ecm3KUf7iQf/MssfisCixIaxew1Y+kuy8rODxwWtL
         e8x5Q8IfSfC95M908eL1XRgpC4QTfALeNZbXVgBe6sDBfNchnEw0p9g4FD0mWkahvYn7
         DjQzAeS9B+9OYPZ+2+OeGCKaNvKwxF+rPaqFAgm1jLIv+mFCxHZS+05BFlYGfgLX9RT8
         df6UNlaGmHRCVDFXf6sbpO6Tar7mb0AmlVDtTgCFDkkkCwkmd7MFYgqvXKcjIuW0d1mu
         NiJw==
X-Gm-Message-State: AOJu0Yw4gm/hlTk9bKwsAbSX1M77WPg6MlWzhLczUL1UOUJ6rDquXd/q
	W03ifSU+XKnTX++VRYxGLUpRrbfhKmkZYiJ55ttRT2kXneDgGW97/MMd4snq6tZ6LfqPQuLd35o
	L+0yQAPEXD2+6kc5R7Npg4duoKJDjvd63ln1x
X-Google-Smtp-Source: AGHT+IGlfWOYCfBCaK1FjP2auhOpOqOg1vlBxYGWVIUNJkOMvIjFU8G8VwFJqM33pUZUiMhl2NsLXI2vNzgoPezzRKc=
X-Received: by 2002:a5d:53cd:0:b0:337:d346:bf4 with SMTP id
 a13-20020a5d53cd000000b00337d3460bf4mr580103wrw.5.1705603306339; Thu, 18 Jan
 2024 10:41:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAL3-=88exVfuL1Y-kvPNbsU+d-UTfDLFViWVObFLtbC4xueeA@mail.gmail.com>
 <20240118183546.418064-1-appsforartists@google.com>
In-Reply-To: <20240118183546.418064-1-appsforartists@google.com>
From: Brenton Simpson <appsforartists@google.com>
Date: Thu, 18 Jan 2024 10:41:31 -0800
Message-ID: <CAAL3-=-RCJvc0=3Ren+zJ8jBPSwO9RKqfzXYrTKXK_2TJy0BcA@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - add Lenovo Legion Go controllers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Cc: Cameron Gutman <aicommander@gmail.com>, Erica Taylor <rickytaylor26@gmail.com>, 
	Ismael Ferreras Morezuelas <swyterzone@gmail.com>, Jonathan Frederick <doublej472@gmail.com>, 
	Matthias Benkmann <matthias.benkmann@gmail.com>, Matthias Berndt <matthias_berndt@gmx.de>, nate@yocom.org, 
	Sam Lantinga <slouken@libsdl.org>, Vicki Pfau <vi@endrift.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A bunch of internal wrangling and one holiday codefreeze later, my git
alias has finally been enabled for send-email.

Sorry for the hassle, and thanks for your help.

On Thu, Jan 18, 2024 at 10:35=E2=80=AFAM Brenton Simpson
<appsforartists@google.com> wrote:
>
> The Lenovo Legion Go is a handheld gaming system, similar to a Steam Deck=
.
> It has a gamepad (including rear paddles), 3 gyroscopes, a trackpad,
> volume buttons, a power button, and 2 LED ring lights.
>
> The Legion Go firmware presents these controls as a USB hub with various
> devices attached.  In its default state, the gamepad is presented as an
> Xbox controller connected to this hub.  (By holding a combination of
> buttons, it can be changed to use the older DirectInput API.)
>
> This patch teaches the existing Xbox controller module `xpad` to bind to
> the controller in the Legion Go, which enables support for the:
>
> - directional pad,
> - analog sticks (including clicks),
> - X, Y, A, B,
> - start and select (or menu and capture),
> - shoulder buttons, and
> - rumble.
>
> The trackpad, touchscreen, volume controls, and power button are already
> supported via existing kernel modules.  Two of the face buttons, the
> gyroscopes, rear paddles, and LEDs are not.
>
> After this patch lands, the Legion Go will be mostly functional in Linux,
> out-of-the-box.  The various components of the USB hub can be synthesized
> into a single logical controller (including the additional buttons) in
> userspace with [Handheld Daemon](https://github.com/hhd-dev/hhd), which
> makes the Go fully functional.
>
> Signed-off-by: Brenton Simpson <appsforartists@google.com>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.=
c
> index f5c21565bb3c..ecfcea8740a0 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -127,6 +127,7 @@ static const struct xpad_device {
>         u8 mapping;
>         u8 xtype;
>  } xpad_device[] =3D {
> +       { 0x17ef, 0x6182, "Lenovo Legion Controller for Windows", 0, XTYP=
E_XBOX360 },
>         { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 =
},
>         { 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>         { 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
> @@ -459,6 +460,7 @@ static const signed short xpad_btn_paddles[] =3D {
>
>  static const struct usb_device_id xpad_table[] =3D {
>         { USB_INTERFACE_INFO('X', 'B', 0) },    /* Xbox USB-IF not-approv=
ed class */
> +       XPAD_XBOX360_VENDOR(0x17ef),            /* Lenovo */
>         XPAD_XBOX360_VENDOR(0x0079),            /* GPD Win 2 controller *=
/
>         XPAD_XBOX360_VENDOR(0x03eb),            /* Wooting Keyboards (Leg=
acy) */
>         XPAD_XBOXONE_VENDOR(0x03f0),            /* HP HyperX Xbox One con=
trollers */
> --
> 2.43.0.275.g3460e3d667-goog
>

