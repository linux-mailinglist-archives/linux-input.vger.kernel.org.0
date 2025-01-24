Return-Path: <linux-input+bounces-9502-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FF6A1B59C
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 13:20:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D573188B630
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 12:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBB321A420;
	Fri, 24 Jan 2025 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfAAm58a"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9F62B9BC;
	Fri, 24 Jan 2025 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737721219; cv=none; b=XqHoaTyNfP7O8DKbsSirW9jM4wL242du8wM48hMdZsWIGzxwK115hT0G6J248zYxu6VL2YaLOXuURPgT8XHaVB8cEIqE4PN0iI6AmRSEunezaHxH9lmRJRunT+ig4RdU9LFpG2QsHLkN0qgs9V9+bvz8EB4i0vU7ECzmOu4Hhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737721219; c=relaxed/simple;
	bh=SWuJPNq3JrPJlSxhwEKtRkDSyIdGm+rAsiwd4vk/WVU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Zlo4KxKfv7p8hkR2C2NvOa6L9wa4cmyMLrVkcSizgpwCJEhUxOC0AHlD2i7eHqYn99bho9lDUcDrBTpRiNcxskAmT6xVqvBp4+FLEfW4cZQChAWDxUT4ut5wqpcDNbHscAAwFrsbin6tOLihy/ONY3OX7CHNidGO/hVDYOHgQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfAAm58a; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737721218; x=1769257218;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SWuJPNq3JrPJlSxhwEKtRkDSyIdGm+rAsiwd4vk/WVU=;
  b=XfAAm58aF7KIoJAZ5Dq7cm8el0A2MupxX6/9IWlhP/PtzNuGBaqzKlGW
   BZjh5fYJ1rEu/e/3mA/hb2Xlh23ElJafKEmtJD6gcZgs8xGSbZnTZrlE0
   3KC2R99YbirKlyoOfZWVDpjU2uqb0JXT3LrLJasp8Yj6yJYlfZaYi5wjm
   y9MCfWcCJP0SKyQlYVIz7RIl5g4PomKRZGhC2uFu1bJlQ/lGgCMFHvgcD
   gGsrcP1IXM9BV2LwQsg+7BMP9je71f15Zv6blbclSymlfHtVGL6m01ucM
   cSnlLwBMcibg9DFd2ch45ObdRDV4t7SYszdXKTSxWZTrbRio1pukDSDIi
   A==;
X-CSE-ConnectionGUID: blRQX3AgR/6Es85q9ZJB+A==
X-CSE-MsgGUID: PpwiBamTSqaWy0CgvriGOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="38505538"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="38505538"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:20:16 -0800
X-CSE-ConnectionGUID: 6ti8MN3KQdWE5LGh6bPfjQ==
X-CSE-MsgGUID: r8S53VzvS5+KirvqNd4iQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="107556666"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.158])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 04:20:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 24 Jan 2025 14:20:06 +0200 (EET)
To: Arnd Bergmann <arnd@kernel.org>
cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, Arnd Bergmann <arnd@arndb.de>, 
    Basavaraj Natikar <basavaraj.natikar@amd.com>, Even Xu <even.xu@intel.com>, 
    Xinpeng Sun <xinpeng.sun@intel.com>, 
    Maximilian Luz <luzmaximilian@gmail.com>, 
    Marcel Holtmann <marcel@holtmann.org>, 
    Johan Hedberg <johan.hedberg@gmail.com>, 
    Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
In-Reply-To: <20250123134908.805346-1-arnd@kernel.org>
Message-ID: <3b4a1365-68cb-185d-6775-57051d4fb02a@linux.intel.com>
References: <20250123134908.805346-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-470643312-1737721206=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-470643312-1737721206=:931
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 23 Jan 2025, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> In drivers/hid/, most drivers depend on CONFIG_HID, while a couple of the
> drivers in subdirectories instead depend on CONFIG_HID_SUPPORT and use
> 'select HID'. With the newly added INTEL_THC_HID, this causes a build
> warning for a circular dependency:
>=20
> WARNING: unmet direct dependencies detected for HID
>   Depends on [m]: HID_SUPPORT [=3Dy] && INPUT [=3Dm]
>   Selected by [y]:
>   - INTEL_THC_HID [=3Dy] && HID_SUPPORT [=3Dy] && X86_64 [=3Dy] && PCI [=
=3Dy] && ACPI [=3Dy]
>=20
> WARNING: unmet direct dependencies detected for INPUT_FF_MEMLESS
>   Depends on [m]: INPUT [=3Dm]
>   Selected by [y]:
>   - HID_MICROSOFT [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy]
>   - GREENASIA_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && HID_GREENA=
SIA [=3Dy]
>   - HID_WIIMOTE [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && LEDS_CLASS =
[=3Dy]
>   - ZEROPLUS_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && HID_ZEROPLU=
S [=3Dy]
>   Selected by [m]:
>   - HID_ACRUX_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && HID_ACRUX =
[=3Dm]
>   - HID_EMS_FF [=3Dm] && HID_SUPPORT [=3Dy] && HID [=3Dy]
>   - HID_GOOGLE_STADIA_FF [=3Dm] && HID_SUPPORT [=3Dy] && HID [=3Dy]
>   - PANTHERLORD_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && HID_PANT=
HERLORD [=3Dm]
>=20
> It's better to be consistent and always use 'depends on HID' for HID
> drivers. The notable exception here is USB_KBD/USB_MOUSE, which are
> alternative implementations that do not depend on the HID subsystem.
>=20
> Do this by extending the "if HID" section below, which means that a few
> of the duplicate "depends on HID" and "depends on INPUT" statements
> can be removed in the process.
>=20
> Fixes: 1b2d05384c29 ("HID: intel-thc-hid: Add basic THC driver skeleton")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/hid/Kconfig               | 10 ++++++----
>  drivers/hid/amd-sfh-hid/Kconfig   |  1 -
>  drivers/hid/i2c-hid/Kconfig       |  2 +-
>  drivers/hid/intel-ish-hid/Kconfig |  1 -
>  drivers/hid/intel-thc-hid/Kconfig |  1 -
>  drivers/hid/surface-hid/Kconfig   |  2 --
>  drivers/hid/usbhid/Kconfig        |  3 +--
>  net/bluetooth/hidp/Kconfig        |  3 +--
>  8 files changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 8adb745c5b28..ed657ef7281c 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1376,10 +1376,6 @@ endmenu
> =20
>  source "drivers/hid/bpf/Kconfig"
> =20
> -endif # HID
> -
> -source "drivers/hid/usbhid/Kconfig"
> -
>  source "drivers/hid/i2c-hid/Kconfig"
> =20
>  source "drivers/hid/intel-ish-hid/Kconfig"
> @@ -1390,4 +1386,10 @@ source "drivers/hid/surface-hid/Kconfig"
> =20
>  source "drivers/hid/intel-thc-hid/Kconfig"
> =20
> +endif # HID
> +
> +# USB support may be used with HID disabled
> +
> +source "drivers/hid/usbhid/Kconfig"
> +
>  endif # HID_SUPPORT
> diff --git a/drivers/hid/amd-sfh-hid/Kconfig b/drivers/hid/amd-sfh-hid/Kc=
onfig
> index 329de5e12c1a..3291786a5ee6 100644
> --- a/drivers/hid/amd-sfh-hid/Kconfig
> +++ b/drivers/hid/amd-sfh-hid/Kconfig
> @@ -5,7 +5,6 @@ menu "AMD SFH HID Support"
> =20
>  config AMD_SFH_HID
>  =09tristate "AMD Sensor Fusion Hub"
> -=09depends on HID
>  =09depends on X86
>  =09help
>  =09  If you say yes to this option, support will be included for the
> diff --git a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig
> index ef7c595c9403..e8d51f410cc1 100644
> --- a/drivers/hid/i2c-hid/Kconfig
> +++ b/drivers/hid/i2c-hid/Kconfig
> @@ -2,7 +2,7 @@
>  menuconfig I2C_HID
>  =09tristate "I2C HID support"
>  =09default y
> -=09depends on I2C && INPUT && HID
> +=09depends on I2C
> =20
>  if I2C_HID
> =20
> diff --git a/drivers/hid/intel-ish-hid/Kconfig b/drivers/hid/intel-ish-hi=
d/Kconfig
> index 253dc10d35ef..568c8688784e 100644
> --- a/drivers/hid/intel-ish-hid/Kconfig
> +++ b/drivers/hid/intel-ish-hid/Kconfig
> @@ -6,7 +6,6 @@ config INTEL_ISH_HID
>  =09tristate "Intel Integrated Sensor Hub"
>  =09default n
>  =09depends on X86
> -=09depends on HID
>  =09help
>  =09  The Integrated Sensor Hub (ISH) enables the ability to offload
>  =09  sensor polling and algorithm processing to a dedicated low power
> diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hi=
d/Kconfig
> index 91ec84902db8..0351d1137607 100644
> --- a/drivers/hid/intel-thc-hid/Kconfig
> +++ b/drivers/hid/intel-thc-hid/Kconfig
> @@ -7,7 +7,6 @@ menu "Intel THC HID Support"
>  config INTEL_THC_HID
>  =09tristate "Intel Touch Host Controller"
>  =09depends on ACPI
> -=09select HID
>  =09help
>  =09  THC (Touch Host Controller) is the name of the IP block in PCH that
>  =09  interfaces with Touch Devices (ex: touchscreen, touchpad etc.). It
> diff --git a/drivers/hid/surface-hid/Kconfig b/drivers/hid/surface-hid/Kc=
onfig
> index 7ce9b5d641eb..d0cfd0d29926 100644
> --- a/drivers/hid/surface-hid/Kconfig
> +++ b/drivers/hid/surface-hid/Kconfig
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0+
>  menu "Surface System Aggregator Module HID support"
>  =09depends on SURFACE_AGGREGATOR
> -=09depends on INPUT
> =20
>  config SURFACE_HID
>  =09tristate "HID transport driver for Surface System Aggregator Module"
> @@ -39,4 +38,3 @@ endmenu
> =20
>  config SURFACE_HID_CORE
>  =09tristate
> -=09select HID
> diff --git a/drivers/hid/usbhid/Kconfig b/drivers/hid/usbhid/Kconfig
> index 7c2032f7f44d..f3194767a45e 100644
> --- a/drivers/hid/usbhid/Kconfig
> +++ b/drivers/hid/usbhid/Kconfig
> @@ -5,8 +5,7 @@ menu "USB HID support"
>  config USB_HID
>  =09tristate "USB HID transport layer"
>  =09default y
> -=09depends on USB && INPUT
> -=09select HID
> +=09depends on HID

I didn't exactly like the unrelated removal of USB totally without=20
a prior warning. I suggest you at minimum mention in the commit message=20
that menu covers it.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

>  =09help
>  =09  Say Y here if you want to connect USB keyboards,
>  =09  mice, joysticks, graphic tablets, or any other HID based devices
> diff --git a/net/bluetooth/hidp/Kconfig b/net/bluetooth/hidp/Kconfig
> index 6746be07e222..e08aae35351a 100644
> --- a/net/bluetooth/hidp/Kconfig
> +++ b/net/bluetooth/hidp/Kconfig
> @@ -1,8 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config BT_HIDP
>  =09tristate "HIDP protocol support"
> -=09depends on BT_BREDR && INPUT && HID_SUPPORT
> -=09select HID
> +=09depends on BT_BREDR && HID
>  =09help
>  =09  HIDP (Human Interface Device Protocol) is a transport layer
>  =09  for HID reports.  HIDP is required for the Bluetooth Human
>=20
--8323328-470643312-1737721206=:931--

