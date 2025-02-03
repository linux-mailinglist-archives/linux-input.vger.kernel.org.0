Return-Path: <linux-input+bounces-9737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FDBA26629
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:55:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D49B16478D
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:55:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423D320F094;
	Mon,  3 Feb 2025 21:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMJxRm5w"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1863720F07C;
	Mon,  3 Feb 2025 21:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619705; cv=none; b=XdNmiBokpYirtY7Q8GPZODekERKWCPcHgPGxEWIRkPa3GApuG5d+ezlptsUhVq2AiUfa8p4s/fVjpz+snEdlD/nQQ+/9OqtaBCE8JNcgLfmdh9OZ6CKaLLIorRT8vRD9Hdj7Dm61AA9bTj5tK+qjO15FNqkl/2HUCFBL7/TApCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619705; c=relaxed/simple;
	bh=bqZSeSIG7K2c5aXt9aUdAK9WqM9QVyxRpO2w329Vxtg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f+p9O8WZ8hC/EjWi2mrJPMtUB22UffCgp5GyGKcM7wO5s8O//aCoXNX20sGfVqDSuRoa3s6MhbWIhJEDCFtk1tAgpMELYi3Lrs7BMEbgM7ySGMiMISpIa+EzjCmb24GFVwlS22f6LhO3VfobUQfGamP4mGiQbrr3wR+Xal2Sn0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMJxRm5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EB9C4CED2;
	Mon,  3 Feb 2025 21:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738619704;
	bh=bqZSeSIG7K2c5aXt9aUdAK9WqM9QVyxRpO2w329Vxtg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rMJxRm5wPDVYuxV7zZ3eLprQTH0/uf+YYhnnllY7mjkwLqLfTzlqOb7SQEunC2Y2s
	 0u8EXvZmP37fuxC9F2NHUty49QA+qs5GJTfFvM8CLvClUhLr+z/FDB0UTmS0TF298R
	 odx0Z0VlygeXVkDu6I84gOxImdPvGKFE3vsL/+h28AP2RPPpIUs1PxwmwVCCwSABzT
	 5qdMQhJjvApPWPKisS8nlIyCC2ycGDoDW7kskk3m5LQAb1MfOEsdaFtZ/spIjImivl
	 Lu4l0U0gWmn2aMEWvjlyt3jpTmD83Mx8b577NMzy8KVKYDwL8+SZRxndvyBH9P+z8Y
	 80FWDKK7GnkkA==
Date: Mon, 3 Feb 2025 22:55:01 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 1/4] HID: hid-appletb-bl: add driver for the
 backlight of Apple Touch Bars
In-Reply-To: <2B5BC9B0-F882-481C-9B09-1FF3978B655D@live.com>
Message-ID: <4818p982-4254-985r-73r6-380497qnp41p@xreary.bet>
References: <5AEC08E1-0AEF-49BF-94F6-AA1AD71545D0@live.com> <2B5BC9B0-F882-481C-9B09-1FF3978B655D@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 3 Feb 2025, Aditya Garg wrote:

> From: Kerem Karabay <kekrby@gmail.com>
>=20
> This commit adds a driver for the backlight of Apple Touch Bars on x86
> Macs. Note that currently only T2 Macs are supported.
>=20
> This driver is based on previous work done by Ronald Tschal=C3=A4r
> <ronald@innovation.ch>.
>=20
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Co-developed-by: Aditya Garg <gargaditya08@live.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/hid/Kconfig          |  10 ++
>  drivers/hid/Makefile         |   1 +
>  drivers/hid/hid-appletb-bl.c | 207 +++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-quirks.c     |   4 +-
>  4 files changed, 221 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hid/hid-appletb-bl.c
>=20
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 4d2a89d65..f6678db27 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -148,6 +148,16 @@ config HID_APPLEIR
> =20
>  =09Say Y here if you want support for Apple infrared remote control.
> =20
> +config HID_APPLETB_BL
> +=09tristate "Apple Touch Bar Backlight"
> +=09depends on BACKLIGHT_CLASS_DEVICE
> +=09help
> +=09  Say Y here if you want support for the backlight of Touch Bars on x=
86
> +=09  MacBook Pros.
> +
> +=09  To compile this driver as a module, choose M here: the
> +=09  module will be called hid-appletb-bl.
> +
>  config HID_ASUS
>  =09tristate "Asus"
>  =09depends on USB_HID
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 24de45f36..444d24cec 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_HID_ALPS)=09=09+=3D hid-alps.o
>  obj-$(CONFIG_HID_ACRUX)=09=09+=3D hid-axff.o
>  obj-$(CONFIG_HID_APPLE)=09=09+=3D hid-apple.o
>  obj-$(CONFIG_HID_APPLEIR)=09+=3D hid-appleir.o
> +obj-$(CONFIG_HID_APPLETB_BL)=09+=3D hid-appletb-bl.o

Is there a reason not to build hid-appletb-bl into hid-apple(.ko) driver=20
proper?

Otherwise the code looks good to me, but I'd prefer to have this built-in=
=20
as we generally try to keep things contained in one single per-vendor HID=
=20
driver.

Thanks,

--=20
Jiri Kosina
SUSE Labs


