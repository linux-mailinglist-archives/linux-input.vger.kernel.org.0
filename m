Return-Path: <linux-input+bounces-11817-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A7A91949
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 12:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8ABC87A6962
	for <lists+linux-input@lfdr.de>; Thu, 17 Apr 2025 10:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D213A217736;
	Thu, 17 Apr 2025 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+4tQKRu"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEB1A55;
	Thu, 17 Apr 2025 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885598; cv=none; b=kZM3bY7Rt7Lf0VL8h9/kGl+3TqKUWMFzormUs2IDYpcydyoumPFGBd2Xh0VvNeIUUDiG7Uj1eosdwcqs/FgCiBTARgg4i5uV5Nqh2qhaxPLoRzjuw540gcIezfLZPcqjbzeivyCE0tE6UV5M6ingM2P6+lDiN3bTwlm/DOOQXtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885598; c=relaxed/simple;
	bh=xmeNwygPq5sB5nTGxHLIaXgI1vxbzSlzV7o8doTZd/Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lCjOvKeB2VWAC3gn9ZyKHYKGYKgMaFBWH80IrADqioME8W/1EFZrSL36ujvacuHmPHaNt3t8/KmaHwv38MgctLjjX1XO7wiO/LOOgJUjKDjyOkZPNIi72/UUNksd+jV5JiSo+PPwNdrIhS5/dP1W7mx9eyxF9ctsLXUy9kJ7gFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+4tQKRu; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744885596; x=1776421596;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=xmeNwygPq5sB5nTGxHLIaXgI1vxbzSlzV7o8doTZd/Q=;
  b=W+4tQKRuk8Yx5W/xlgK02tvogzfHhaO1MZb71dKjE+KjfkBlQaxcbUVq
   aFTjqXK+s8ex76DiGya18ZrfOFMbOjFykhrXVOhaMcCuNa4WwiBWMAvyY
   iXSlk2smf1klAVZVOxmRCRvfTtGCosqbwqH0OQCBHPXXhs2gG2dMkzADH
   vx4KhPDTuO3ZwpUAGDRvNkJ8VlKZvMo5oVweeZhpTJ6K8vGqvuFgIWYn0
   wcNzUlzNwDawUgoivy5tg/CjCXD5IJg5lqXwGz0UrB5LaGWLL30Mwh381
   GeEYKqL/GQnj2dAAk8+FrKJKjRbTyBCFF8kilIR5Jnr5z92AmzUgzTMo3
   Q==;
X-CSE-ConnectionGUID: um/f8c/wTvKABqo8YMTSLg==
X-CSE-MsgGUID: idebYrH7Rrq5yr1GLGlIwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57460242"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57460242"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:25:55 -0700
X-CSE-ConnectionGUID: mhwzYS2cT9yrNMKtCZbwKA==
X-CSE-MsgGUID: El4rpDf7Sx60wIMGBQ9BeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="131301880"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.144])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 03:25:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Apr 2025 13:25:48 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
    linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
In-Reply-To: <20250416171809.557674-2-wse@tuxedocomputers.com>
Message-ID: <8ed6875b-2c57-4ce2-7a20-288dcf77e2c5@linux.intel.com>
References: <20250416171809.557674-1-wse@tuxedocomputers.com> <20250416171809.557674-2-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 16 Apr 2025, Werner Sembach wrote:

> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
> controllable RGB keyboard backlight. The firmware API for it is implemented
> via WMI.
> 
> To make the backlight userspace configurable this driver emulates a
> LampArray HID device and translates the input from hidraw to the
> corresponding WMI calls. This is a new approach as the leds subsystem lacks
> a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
> needs to be established.
> 
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  MAINTAINERS                                 |   6 +
>  drivers/platform/x86/Kconfig                |   2 +
>  drivers/platform/x86/Makefile               |   3 +
>  drivers/platform/x86/tuxedo/Kconfig         |   8 +
>  drivers/platform/x86/tuxedo/Makefile        |   8 +
>  drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
>  drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
>  drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 919 ++++++++++++++++++++
>  drivers/platform/x86/tuxedo/nb04/wmi_util.c |  91 ++
>  drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
>  10 files changed, 1171 insertions(+)
>  create mode 100644 drivers/platform/x86/tuxedo/Kconfig
>  create mode 100644 drivers/platform/x86/tuxedo/Makefile
>  create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
>  create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
>  create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>  create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
>  create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00e94bec401e1..c1f7460c246ad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24217,6 +24217,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbostat
>  F:	tools/power/x86/turbostat/
>  F:	tools/testing/selftests/turbostat/
>  
> +TUXEDO DRIVERS
> +M:	Werner Sembach <wse@tuxedocomputers.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/tuxedo/
> +
>  TW5864 VIDEO4LINUX DRIVER
>  M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
>  M:	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64b..58b258cde4fdb 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1186,6 +1186,8 @@ config SEL3350_PLATFORM
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called sel3350-platform.
>  
> +source "drivers/platform/x86/tuxedo/Kconfig"
> +
>  endif # X86_PLATFORM_DEVICES
>  
>  config P2SB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b1429470674..1562dcd7ad9a5 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -153,3 +153,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)		+= winmate-fm07-keys.o
>  
>  # SEL
>  obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
> +
> +# TUXEDO
> +obj-y					+= tuxedo/
> diff --git a/drivers/platform/x86/tuxedo/Kconfig b/drivers/platform/x86/tuxedo/Kconfig
> new file mode 100644
> index 0000000000000..80be0947dddc4
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/Kconfig
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +source "drivers/platform/x86/tuxedo/nb04/Kconfig"
> diff --git a/drivers/platform/x86/tuxedo/Makefile b/drivers/platform/x86/tuxedo/Makefile
> new file mode 100644
> index 0000000000000..0afe0d0f455e7
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +obj-y	+= nb04/
> diff --git a/drivers/platform/x86/tuxedo/nb04/Kconfig b/drivers/platform/x86/tuxedo/nb04/Kconfig
> new file mode 100644
> index 0000000000000..411c46c9a1cf0
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/nb04/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +config TUXEDO_NB04_WMI_AB
> +	tristate "TUXEDO NB04 WMI AB Platform Driver"
> +	help
> +	  This driver implements the WMI AB device found on TUXEDO notebooks
> +	  with board vendor NB04. This enables keyboard backlight control via a
> +	  virtual HID LampArray device.
> +
> +	  When compiled as a module it will be called tuxedo_nb04_wmi_ab.
> diff --git a/drivers/platform/x86/tuxedo/nb04/Makefile b/drivers/platform/x86/tuxedo/nb04/Makefile
> new file mode 100644
> index 0000000000000..c963e0d605057
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/nb04/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> +#
> +# TUXEDO X86 Platform Specific Drivers
> +#
> +
> +tuxedo_nb04_wmi_ab-y			:= wmi_ab.o
> +tuxedo_nb04_wmi_ab-y			+= wmi_util.o
> +obj-$(CONFIG_TUXEDO_NB04_WMI_AB)	+= tuxedo_nb04_wmi_ab.o
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> new file mode 100644
> index 0000000000000..d439ebe937a71
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -0,0 +1,919 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * This driver implements the WMI AB device found on TUXEDO notebooks with board
> + * vendor NB04.
> + *
> + * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
> + */
> +
> +#include <linux/dmi.h>
> +#include <linux/hid.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#include "wmi_util.h"
> +
> +static const struct wmi_device_id tuxedo_nb04_wmi_ab_device_ids[] = {
> +	{ .guid_string = "80C9BAA6-AC48-4538-9234-9F81A55E7C85" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, tuxedo_nb04_wmi_ab_device_ids);
> +
> +enum {
> +	LAMP_ARRAY_ATTRIBUTES_REPORT_ID		= 0x01,
> +	LAMP_ATTRIBUTES_REQUEST_REPORT_ID	= 0x02,
> +	LAMP_ATTRIBUTES_RESPONSE_REPORT_ID	= 0x03,
> +	LAMP_MULTI_UPDATE_REPORT_ID		= 0x04,
> +	LAMP_RANGE_UPDATE_REPORT_ID		= 0x05,
> +	LAMP_ARRAY_CONTROL_REPORT_ID		= 0x06,
> +};
> +
> +static u8 tux_report_descriptor[327] = {
> +	0x05, 0x59,			// Usage Page (Lighting and Illumination)
> +	0x09, 0x01,			// Usage (Lamp Array)
> +	0xa1, 0x01,			// Collection (Application)
> +	0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
> +	0x09, 0x02,			//  Usage (Lamp Array Attributes Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x03,			//   Usage (Lamp Count)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> +	0x09, 0x04,			//   Usage (Bounding Box Width In Micrometers)
> +	0x09, 0x05,			//   Usage (Bounding Box Height In Micrometers)
> +	0x09, 0x06,			//   Usage (Bounding Box Depth In Micrometers)
> +	0x09, 0x07,			//   Usage (Lamp Array Kind)
> +	0x09, 0x08,			//   Usage (Min Update Interval In Microseconds)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> +	0x75, 0x20,			//   Report Size (32)
> +	0x95, 0x05,			//   Report Count (5)
> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
> +	0x09, 0x20,			//  Usage (Lamp Attributes Request Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
> +	0x09, 0x22,			//  Usage (Lamp Attributes Response Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x23,			//   Usage (Position X In Micrometers)
> +	0x09, 0x24,			//   Usage (Position Y In Micrometers)
> +	0x09, 0x25,			//   Usage (Position Z In Micrometers)
> +	0x09, 0x27,			//   Usage (Update Latency In Microseconds)
> +	0x09, 0x26,			//   Usage (Lamp Purposes)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
> +	0x75, 0x20,			//   Report Size (32)
> +	0x95, 0x05,			//   Report Count (5)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x28,			//   Usage (Red Level Count)
> +	0x09, 0x29,			//   Usage (Green Level Count)
> +	0x09, 0x2a,			//   Usage (Blue Level Count)
> +	0x09, 0x2b,			//   Usage (Intensity Level Count)
> +	0x09, 0x2c,			//   Usage (Is Programmable)
> +	0x09, 0x2d,			//   Usage (Input Binding)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x06,			//   Report Count (6)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
> +	0x09, 0x50,			//  Usage (Lamp Multi Update Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x03,			//   Usage (Lamp Count)
> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x08,			//   Logical Maximum (8)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x02,			//   Report Count (2)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x21,			//   Usage (Lamp Id)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x08,			//   Report Count (8)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x20,			//   Report Count (32)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
> +	0x09, 0x60,			//  Usage (Lamp Range Update Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x08,			//   Logical Maximum (8)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x61,			//   Usage (Lamp Id Start)
> +	0x09, 0x62,			//   Usage (Lamp Id End)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
> +	0x75, 0x10,			//   Report Size (16)
> +	0x95, 0x02,			//   Report Count (2)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0x09, 0x51,			//   Usage (Red Update Channel)
> +	0x09, 0x52,			//   Usage (Green Update Channel)
> +	0x09, 0x53,			//   Usage (Blue Update Channel)
> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x04,			//   Report Count (4)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
> +	0x09, 0x70,			//  Usage (Lamp Array Control Report)
> +	0xa1, 0x02,			//  Collection (Logical)
> +	0x09, 0x71,			//   Usage (Autonomous Mode)
> +	0x15, 0x00,			//   Logical Minimum (0)
> +	0x25, 0x01,			//   Logical Maximum (1)
> +	0x75, 0x08,			//   Report Size (8)
> +	0x95, 0x01,			//   Report Count (1)
> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
> +	0xc0,				//  End Collection
> +	0xc0				// End Collection
> +};
> +
> +struct tux_kbl_map_entry_t {
> +	u8 code;
> +	struct {
> +		u32 x;
> +		u32 y;
> +		u32 z;
> +	} pos;
> +};
> +
> +static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] = {
> +	{ 0x29, {  25000,  53000, 5000 } },
> +	{ 0x3a, {  41700,  53000, 5000 } },
> +	{ 0x3b, {  58400,  53000, 5000 } },
> +	{ 0x3c, {  75100,  53000, 5000 } },
> +	{ 0x3d, {  91800,  53000, 5000 } },
> +	{ 0x3e, { 108500,  53000, 5000 } },
> +	{ 0x3f, { 125200,  53000, 5000 } },
> +	{ 0x40, { 141900,  53000, 5000 } },
> +	{ 0x41, { 158600,  53000, 5000 } },
> +	{ 0x42, { 175300,  53000, 5000 } },
> +	{ 0x43, { 192000,  53000, 5000 } },
> +	{ 0x44, { 208700,  53000, 5000 } },
> +	{ 0x45, { 225400,  53000, 5000 } },
> +	{ 0xf1, { 242100,  53000, 5000 } },
> +	{ 0x46, { 258800,  53000, 5000 } },
> +	{ 0x4c, { 275500,  53000, 5000 } },
> +	{ 0x4a, { 294500,  53000, 5000 } },
> +	{ 0x4d, { 311200,  53000, 5000 } },
> +	{ 0x4b, { 327900,  53000, 5000 } },
> +	{ 0x4e, { 344600,  53000, 5000 } },
> +	{ 0x35, {  24500,  67500, 5250 } },
> +	{ 0x1e, {  42500,  67500, 5250 } },
> +	{ 0x1f, {  61000,  67500, 5250 } },
> +	{ 0x20, {  79500,  67500, 5250 } },
> +	{ 0x21, {  98000,  67500, 5250 } },
> +	{ 0x22, { 116500,  67500, 5250 } },
> +	{ 0x23, { 135000,  67500, 5250 } },
> +	{ 0x24, { 153500,  67500, 5250 } },
> +	{ 0x25, { 172000,  67500, 5250 } },
> +	{ 0x26, { 190500,  67500, 5250 } },
> +	{ 0x27, { 209000,  67500, 5250 } },
> +	{ 0x2d, { 227500,  67500, 5250 } },
> +	{ 0x2e, { 246000,  67500, 5250 } },
> +	{ 0x2a, { 269500,  67500, 5250 } },
> +	{ 0x53, { 294500,  67500, 5250 } },
> +	{ 0x55, { 311200,  67500, 5250 } },
> +	{ 0x54, { 327900,  67500, 5250 } },
> +	{ 0x56, { 344600,  67500, 5250 } },
> +	{ 0x2b, {  31000,  85500, 5500 } },
> +	{ 0x14, {  51500,  85500, 5500 } },
> +	{ 0x1a, {  70000,  85500, 5500 } },
> +	{ 0x08, {  88500,  85500, 5500 } },
> +	{ 0x15, { 107000,  85500, 5500 } },
> +	{ 0x17, { 125500,  85500, 5500 } },
> +	{ 0x1c, { 144000,  85500, 5500 } },
> +	{ 0x18, { 162500,  85500, 5500 } },
> +	{ 0x0c, { 181000,  85500, 5500 } },
> +	{ 0x12, { 199500,  85500, 5500 } },
> +	{ 0x13, { 218000,  85500, 5500 } },
> +	{ 0x2f, { 236500,  85500, 5500 } },
> +	{ 0x30, { 255000,  85500, 5500 } },
> +	{ 0x31, { 273500,  85500, 5500 } },
> +	{ 0x5f, { 294500,  85500, 5500 } },
> +	{ 0x60, { 311200,  85500, 5500 } },
> +	{ 0x61, { 327900,  85500, 5500 } },
> +	{ 0x39, {  33000, 103500, 5750 } },
> +	{ 0x04, {  57000, 103500, 5750 } },
> +	{ 0x16, {  75500, 103500, 5750 } },
> +	{ 0x07, {  94000, 103500, 5750 } },
> +	{ 0x09, { 112500, 103500, 5750 } },
> +	{ 0x0a, { 131000, 103500, 5750 } },
> +	{ 0x0b, { 149500, 103500, 5750 } },
> +	{ 0x0d, { 168000, 103500, 5750 } },
> +	{ 0x0e, { 186500, 103500, 5750 } },
> +	{ 0x0f, { 205000, 103500, 5750 } },
> +	{ 0x33, { 223500, 103500, 5750 } },
> +	{ 0x34, { 242000, 103500, 5750 } },
> +	{ 0x28, { 267500, 103500, 5750 } },
> +	{ 0x5c, { 294500, 103500, 5750 } },
> +	{ 0x5d, { 311200, 103500, 5750 } },
> +	{ 0x5e, { 327900, 103500, 5750 } },
> +	{ 0x57, { 344600,  94500, 5625 } },
> +	{ 0xe1, {  37000, 121500, 6000 } },
> +	{ 0x1d, {  66000, 121500, 6000 } },
> +	{ 0x1b, {  84500, 121500, 6000 } },
> +	{ 0x06, { 103000, 121500, 6000 } },
> +	{ 0x19, { 121500, 121500, 6000 } },
> +	{ 0x05, { 140000, 121500, 6000 } },
> +	{ 0x11, { 158500, 121500, 6000 } },
> +	{ 0x10, { 177000, 121500, 6000 } },
> +	{ 0x36, { 195500, 121500, 6000 } },
> +	{ 0x37, { 214000, 121500, 6000 } },
> +	{ 0x38, { 232500, 121500, 6000 } },
> +	{ 0xe5, { 251500, 121500, 6000 } },
> +	{ 0x52, { 273500, 129000, 6125 } },
> +	{ 0x59, { 294500, 121500, 6000 } },
> +	{ 0x5a, { 311200, 121500, 6000 } },
> +	{ 0x5b, { 327900, 121500, 6000 } },
> +	{ 0xe0, {  28000, 139500, 6250 } },
> +	{ 0xfe, {  47500, 139500, 6250 } },
> +	{ 0xe3, {  66000, 139500, 6250 } },
> +	{ 0xe2, {  84500, 139500, 6250 } },
> +	{ 0x2c, { 140000, 139500, 6250 } },
> +	{ 0xe6, { 195500, 139500, 6250 } },
> +	{ 0x65, { 214000, 139500, 6250 } },
> +	{ 0xe4, { 234000, 139500, 6250 } },
> +	{ 0x50, { 255000, 147000, 6375 } },
> +	{ 0x51, { 273500, 147000, 6375 } },
> +	{ 0x4f, { 292000, 147000, 6375 } },
> +	{ 0x62, { 311200, 139500, 6250 } },
> +	{ 0x63, { 327900, 139500, 6250 } },
> +	{ 0x58, { 344600, 130500, 6125 } }

Add comma

> +};
> +
> +static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] = {
> +	{ 0x29, {  25000,  53000, 5000 } },
> +	{ 0x3a, {  41700,  53000, 5000 } },
> +	{ 0x3b, {  58400,  53000, 5000 } },
> +	{ 0x3c, {  75100,  53000, 5000 } },
> +	{ 0x3d, {  91800,  53000, 5000 } },
> +	{ 0x3e, { 108500,  53000, 5000 } },
> +	{ 0x3f, { 125200,  53000, 5000 } },
> +	{ 0x40, { 141900,  53000, 5000 } },
> +	{ 0x41, { 158600,  53000, 5000 } },
> +	{ 0x42, { 175300,  53000, 5000 } },
> +	{ 0x43, { 192000,  53000, 5000 } },
> +	{ 0x44, { 208700,  53000, 5000 } },
> +	{ 0x45, { 225400,  53000, 5000 } },
> +	{ 0xf1, { 242100,  53000, 5000 } },
> +	{ 0x46, { 258800,  53000, 5000 } },
> +	{ 0x4c, { 275500,  53000, 5000 } },
> +	{ 0x4a, { 294500,  53000, 5000 } },
> +	{ 0x4d, { 311200,  53000, 5000 } },
> +	{ 0x4b, { 327900,  53000, 5000 } },
> +	{ 0x4e, { 344600,  53000, 5000 } },
> +	{ 0x35, {  24500,  67500, 5250 } },
> +	{ 0x1e, {  42500,  67500, 5250 } },
> +	{ 0x1f, {  61000,  67500, 5250 } },
> +	{ 0x20, {  79500,  67500, 5250 } },
> +	{ 0x21, {  98000,  67500, 5250 } },
> +	{ 0x22, { 116500,  67500, 5250 } },
> +	{ 0x23, { 135000,  67500, 5250 } },
> +	{ 0x24, { 153500,  67500, 5250 } },
> +	{ 0x25, { 172000,  67500, 5250 } },
> +	{ 0x26, { 190500,  67500, 5250 } },
> +	{ 0x27, { 209000,  67500, 5250 } },
> +	{ 0x2d, { 227500,  67500, 5250 } },
> +	{ 0x2e, { 246000,  67500, 5250 } },
> +	{ 0x2a, { 269500,  67500, 5250 } },
> +	{ 0x53, { 294500,  67500, 5250 } },
> +	{ 0x55, { 311200,  67500, 5250 } },
> +	{ 0x54, { 327900,  67500, 5250 } },
> +	{ 0x56, { 344600,  67500, 5250 } },
> +	{ 0x2b, {  31000,  85500, 5500 } },
> +	{ 0x14, {  51500,  85500, 5500 } },
> +	{ 0x1a, {  70000,  85500, 5500 } },
> +	{ 0x08, {  88500,  85500, 5500 } },
> +	{ 0x15, { 107000,  85500, 5500 } },
> +	{ 0x17, { 125500,  85500, 5500 } },
> +	{ 0x1c, { 144000,  85500, 5500 } },
> +	{ 0x18, { 162500,  85500, 5500 } },
> +	{ 0x0c, { 181000,  85500, 5500 } },
> +	{ 0x12, { 199500,  85500, 5500 } },
> +	{ 0x13, { 218000,  85500, 5500 } },
> +	{ 0x2f, { 234500,  85500, 5500 } },
> +	{ 0x30, { 251000,  85500, 5500 } },
> +	{ 0x5f, { 294500,  85500, 5500 } },
> +	{ 0x60, { 311200,  85500, 5500 } },
> +	{ 0x61, { 327900,  85500, 5500 } },
> +	{ 0x39, {  33000, 103500, 5750 } },
> +	{ 0x04, {  57000, 103500, 5750 } },
> +	{ 0x16, {  75500, 103500, 5750 } },
> +	{ 0x07, {  94000, 103500, 5750 } },
> +	{ 0x09, { 112500, 103500, 5750 } },
> +	{ 0x0a, { 131000, 103500, 5750 } },
> +	{ 0x0b, { 149500, 103500, 5750 } },
> +	{ 0x0d, { 168000, 103500, 5750 } },
> +	{ 0x0e, { 186500, 103500, 5750 } },
> +	{ 0x0f, { 205000, 103500, 5750 } },
> +	{ 0x33, { 223500, 103500, 5750 } },
> +	{ 0x34, { 240000, 103500, 5750 } },
> +	{ 0x32, { 256500, 103500, 5750 } },
> +	{ 0x28, { 271500,  94500, 5750 } },
> +	{ 0x5c, { 294500, 103500, 5750 } },
> +	{ 0x5d, { 311200, 103500, 5750 } },
> +	{ 0x5e, { 327900, 103500, 5750 } },
> +	{ 0x57, { 344600,  94500, 5625 } },
> +	{ 0xe1, {  28000, 121500, 6000 } },
> +	{ 0x64, {  47500, 121500, 6000 } },
> +	{ 0x1d, {  66000, 121500, 6000 } },
> +	{ 0x1b, {  84500, 121500, 6000 } },
> +	{ 0x06, { 103000, 121500, 6000 } },
> +	{ 0x19, { 121500, 121500, 6000 } },
> +	{ 0x05, { 140000, 121500, 6000 } },
> +	{ 0x11, { 158500, 121500, 6000 } },
> +	{ 0x10, { 177000, 121500, 6000 } },
> +	{ 0x36, { 195500, 121500, 6000 } },
> +	{ 0x37, { 214000, 121500, 6000 } },
> +	{ 0x38, { 232500, 121500, 6000 } },
> +	{ 0xe5, { 251500, 121500, 6000 } },
> +	{ 0x52, { 273500, 129000, 6125 } },
> +	{ 0x59, { 294500, 121500, 6000 } },
> +	{ 0x5a, { 311200, 121500, 6000 } },
> +	{ 0x5b, { 327900, 121500, 6000 } },
> +	{ 0xe0, {  28000, 139500, 6250 } },
> +	{ 0xfe, {  47500, 139500, 6250 } },
> +	{ 0xe3, {  66000, 139500, 6250 } },
> +	{ 0xe2, {  84500, 139500, 6250 } },
> +	{ 0x2c, { 140000, 139500, 6250 } },
> +	{ 0xe6, { 195500, 139500, 6250 } },
> +	{ 0x65, { 214000, 139500, 6250 } },
> +	{ 0xe4, { 234000, 139500, 6250 } },
> +	{ 0x50, { 255000, 147000, 6375 } },
> +	{ 0x51, { 273500, 147000, 6375 } },
> +	{ 0x4f, { 292000, 147000, 6375 } },
> +	{ 0x62, { 311200, 139500, 6250 } },
> +	{ 0x63, { 327900, 139500, 6250 } },
> +	{ 0x58, { 344600, 130500, 6125 } }

Add comma

> +};

IMO, this was really a great change, now those numbers are actually 
readable on a glance and the pattern in them is obvious when gathered like 
that! Thanks for doing it.

> +
> +struct tux_driver_data_t {
> +	struct hid_device *hdev;
> +};
> +
> +struct tux_hdev_driver_data_t {
> +	u8 lamp_count;
> +	const struct tux_kbl_map_entry_t *kbl_map;
> +	u8 next_lamp_id;
> +	union tux_wmi_xx_496in_80out_in_t next_kbl_set_multiple_keys_in;
> +};
> +
> +static int tux_ll_start(struct hid_device *hdev)
> +{
> +	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
> +	struct tux_hdev_driver_data_t *driver_data;
> +	union tux_wmi_xx_8in_80out_out_t out;
> +	union tux_wmi_xx_8in_80out_in_t in;
> +	u8 keyboard_type;
> +	int ret;
> +
> +	driver_data = devm_kzalloc(&hdev->dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	in.get_device_status_in.device_type = WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD;
> +	ret = tux_wmi_xx_8in_80out(wdev, WMI_AB_GET_DEVICE_STATUS, &in, &out);
> +	if (ret)
> +		return ret;
> +
> +	keyboard_type = out.get_device_status_out.keyboard_physical_layout;
> +	if (keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII) {
> +		driver_data->lamp_count = ARRAY_SIZE(sirius_16_ansii_kbl_map);
> +		driver_data->kbl_map = sirius_16_ansii_kbl_map;
> +	} else if (keyboard_type == WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO) {
> +		driver_data->lamp_count = ARRAY_SIZE(sirius_16_iso_kbl_map);
> +		driver_data->kbl_map = sirius_16_iso_kbl_map;
> +	} else {
> +		return -EINVAL;
> +	}
> +	driver_data->next_lamp_id = 0;
> +
> +	dev_set_drvdata(&hdev->dev, driver_data);
> +
> +	return ret;
> +}
> +
> +static void tux_ll_stop(struct hid_device *hdev __always_unused)
> +{
> +}
> +
> +static int tux_ll_open(struct hid_device *hdev __always_unused)
> +{
> +	return 0;
> +}
> +
> +static void tux_ll_close(struct hid_device *hdev __always_unused)
> +{
> +}
> +
> +static int tux_ll_parse(struct hid_device *hdev)
> +{
> +	return hid_parse_report(hdev, tux_report_descriptor,
> +				sizeof(tux_report_descriptor));
> +}
> +
> +struct __packed lamp_array_attributes_report_t {
> +	const u8 report_id;
> +	u16 lamp_count;
> +	u32 bounding_box_width_in_micrometers;
> +	u32 bounding_box_height_in_micrometers;
> +	u32 bounding_box_depth_in_micrometers;
> +	u32 lamp_array_kind;
> +	u32 min_update_interval_in_microseconds;
> +};
> +
> +static int handle_lamp_array_attributes_report(struct hid_device *hdev,
> +					       struct lamp_array_attributes_report_t *rep)
> +{
> +	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +
> +	rep->lamp_count = driver_data->lamp_count;
> +	rep->bounding_box_width_in_micrometers = 368000;
> +	rep->bounding_box_height_in_micrometers = 266000;
> +	rep->bounding_box_depth_in_micrometers = 30000;
> +	/*
> +	 * LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
> +	 * "HID Usage Tables v1.5"
> +	 */
> +	rep->lamp_array_kind = 1;
> +	// Some guessed value for interval microseconds
> +	rep->min_update_interval_in_microseconds = 500;
> +
> +	return sizeof(*rep);
> +}
> +
> +struct __packed lamp_attributes_request_report_t {
> +	const u8 report_id;
> +	u16 lamp_id;
> +};
> +
> +static int handle_lamp_attributes_request_report(struct hid_device *hdev,
> +						 struct lamp_attributes_request_report_t *rep)
> +{
> +	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +
> +	if (rep->lamp_id < driver_data->lamp_count)
> +		driver_data->next_lamp_id = rep->lamp_id;
> +	else
> +		driver_data->next_lamp_id = 0;
> +
> +	return sizeof(*rep);
> +}
> +
> +struct __packed lamp_attributes_response_report_t {
> +	const u8 report_id;
> +	u16 lamp_id;
> +	u32 position_x_in_micrometers;
> +	u32 position_y_in_micrometers;
> +	u32 position_z_in_micrometers;
> +	u32 update_latency_in_microseconds;
> +	u32 lamp_purpose;
> +	u8 red_level_count;
> +	u8 green_level_count;
> +	u8 blue_level_count;
> +	u8 intensity_level_count;
> +	u8 is_programmable;
> +	u8 input_binding;
> +};
> +
> +static int handle_lamp_attributes_response_report(struct hid_device *hdev,
> +						  struct lamp_attributes_response_report_t *rep)
> +{
> +	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	u16 lamp_id = driver_data->next_lamp_id;
> +
> +	rep->lamp_id = lamp_id;
> +	// Some guessed value for latency microseconds
> +	rep->update_latency_in_microseconds = 100;
> +	/*
> +	 * LampPurposeControl, see "26.3.1 LampPurposes Flags" of
> +	 * "HID Usage Tables v1.5"
> +	 */
> +	rep->lamp_purpose = 1;
> +	rep->red_level_count = 0xff;
> +	rep->green_level_count = 0xff;
> +	rep->blue_level_count = 0xff;
> +	rep->intensity_level_count = 0xff;
> +	rep->is_programmable = 1;
> +
> +	if (driver_data->kbl_map[lamp_id].code <= 0xe8) {
> +		rep->input_binding = driver_data->kbl_map[lamp_id].code;
> +	} else {
> +		/*
> +		 * Everything bigger is reserved/undefined, see
> +		 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.5"
> +		 * and should return 0, see "26.8.3 Lamp Attributes" of the same
> +		 * document.
> +		 */
> +		rep->input_binding = 0;
> +	}
> +	rep->position_x_in_micrometers = driver_data->kbl_map[lamp_id].pos.x;
> +	rep->position_y_in_micrometers = driver_data->kbl_map[lamp_id].pos.y;
> +	rep->position_z_in_micrometers = driver_data->kbl_map[lamp_id].pos.z;
> +
> +	driver_data->next_lamp_id = (driver_data->next_lamp_id + 1) % driver_data->lamp_count;
> +
> +	return sizeof(*rep);
> +}
> +
> +#define LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE	BIT(0)
> +
> +struct __packed lamp_multi_update_report_t {
> +	const u8 report_id;
> +	u8 lamp_count;
> +	u8 lamp_update_flags;
> +	u16 lamp_id[8];
> +	struct {
> +		u8 red;
> +		u8 green;
> +		u8 blue;
> +		u8 intensity;
> +	} update_channels[8];
> +};
> +
> +static int handle_lamp_multi_update_report(struct hid_device *hdev,
> +					   struct lamp_multi_update_report_t *rep)
> +{
> +	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	union tux_wmi_xx_496in_80out_in_t *next = &driver_data->next_kbl_set_multiple_keys_in;
> +	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
> +	union tux_wmi_xx_496in_80out_out_t out;
> +	u8 key_id, key_id_j, intensity_i;
> +	int ret;
> +
> +	/*
> +	 * Catching misformatted lamp_multi_update_report and fail silently
> +	 * according to "HID Usage Tables v1.5"
> +	 */
> +	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
> +		if (rep->lamp_id[i] > driver_data->lamp_count) {
> +			hid_dbg(hdev, "Out of bounds lamp_id in lamp_multi_update_report. Skippng whole report!\n");
> +			return sizeof(*rep);
> +		}
> +
> +		for (unsigned int j = i + 1; j < rep->lamp_count; ++j) {
> +			if (rep->lamp_id[i] == rep->lamp_id[j]) {
> +				hid_dbg(hdev, "Duplicate lamp_id in lamp_multi_update_report. Skippng whole report!\n");
> +				return sizeof(*rep);
> +			}
> +		}
> +	}
> +
> +	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
> +		key_id = driver_data->kbl_map[rep->lamp_id[i]].code;
> +
> +		for (unsigned int j = 0;
> +		     j < WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX; ++j) {
> +			key_id_j = next->kbl_set_multiple_keys_in.lighting_settings[j].key_id;
> +			if (key_id_j == 0x00 || key_id_j == key_id) {

Did I already mention that logic could be reversed + continue used to 
bring down indentation level. (I might faintly recall you didn't like the 
idea. I'm sorry, I review quite many patches so I can't remember 
everything after a few months.)

> +				if (key_id_j == 0x00)
> +					next->kbl_set_multiple_keys_in.lighting_setting_count =
> +						j + 1;
> +				next->kbl_set_multiple_keys_in.lighting_settings[j].key_id =
> +					key_id;

Please create a temporary variable for 
next->kbl_set_multiple_keys_in.lighting_settings[j] so you don't need to 
repeat it multiple times.

> +				/*
> +				 * While this driver respects
> +				 * intensity_update_channel according to "HID
> +				 * Usage Tables v1.5" also on RGB leds, the
> +				 * Microsoft MacroPad reference implementation
> +				 * (https://github.com/microsoft/RP2040MacropadHidSample
> +				 * 1d6c3ad) does not and ignores it. If it turns
> +				 * out that Windows writes intensity = 0 for RGB
> +				 * leds instead of intensity = 255, this driver
> +				 * should also ignore the
> +				 * intensity_update_channel.
> +				 */
> +				intensity_i = rep->update_channels[i].intensity;
> +				next->kbl_set_multiple_keys_in.lighting_settings[j].red =
> +					rep->update_channels[i].red * intensity_i / 0xff;
> +				next->kbl_set_multiple_keys_in.lighting_settings[j].green =
> +					rep->update_channels[i].green * intensity_i / 0xff;
> +				next->kbl_set_multiple_keys_in.lighting_settings[j].blue =
> +					rep->update_channels[i].blue * intensity_i / 0xff;
> +
> +				break;
> +			}
> +		}
> +	}
> +
> +	if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE) {
> +		ret = tux_wmi_xx_496in_80out(wdev, WMI_AB_KBL_SET_MULTIPLE_KEYS,
> +					     next, &out);
> +		memset(next, 0, sizeof(union tux_wmi_xx_496in_80out_in_t));

sizeof(*next)

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return sizeof(*rep);
> +}
> +
> +struct __packed lamp_range_update_report_t {
> +	const u8 report_id;
> +	u8 lamp_update_flags;
> +	u16 lamp_id_start;
> +	u16 lamp_id_end;
> +	u8 red_update_channel;
> +	u8 green_update_channel;
> +	u8 blue_update_channel;
> +	u8 intensity_update_channel;
> +};
> +
> +static int handle_lamp_range_update_report(struct hid_device *hdev,
> +					   struct lamp_range_update_report_t *rep)
> +{
> +	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	struct lamp_multi_update_report_t lamp_multi_update_report = {
> +		.report_id = LAMP_MULTI_UPDATE_REPORT_ID

Add comma

> +	};
> +	int ret;
> +
> +	/*
> +	 * Catching misformatted lamp_range_update_report and fail silently
> +	 * according to "HID Usage Tables v1.5"
> +	 */
> +	if (rep->lamp_id_start > rep->lamp_id_end) {
> +		hid_dbg(hdev, "lamp_id_start > lamp_id_end in lamp_range_update_report. Skippng whole report!\n");
> +		return sizeof(*rep);
> +	}
> +
> +	if (rep->lamp_id_end > driver_data->lamp_count - 1) {
> +		hid_dbg(hdev, "Out of bounds lamp_id_end in lamp_range_update_report. Skippng whole report!\n");
> +		return sizeof(*rep);
> +	}
> +
> +	/*
> +	 * Break handle_lamp_range_update_report call down to multiple
> +	 * handle_lamp_multi_update_report calls to easily ensure that mixing
> +	 * handle_lamp_range_update_report and handle_lamp_multi_update_report
> +	 * does not break things.
> +	 */
> +	for (unsigned int i = rep->lamp_id_start; i < rep->lamp_id_end + 1; i = i + 8) {
> +		lamp_multi_update_report.lamp_count = min(rep->lamp_id_end + 1 - i, 8);
> +		if (i + lamp_multi_update_report.lamp_count == rep->lamp_id_end + 1)
> +			lamp_multi_update_report.lamp_update_flags |=
> +				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
> +
> +		for (unsigned int j = 0; j < lamp_multi_update_report.lamp_count; ++j) {
> +			lamp_multi_update_report.lamp_id[j] = i + j;
> +			lamp_multi_update_report.update_channels[j].red =
> +				rep->red_update_channel;
> +			lamp_multi_update_report.update_channels[j].green =
> +				rep->green_update_channel;
> +			lamp_multi_update_report.update_channels[j].blue =
> +				rep->blue_update_channel;
> +			lamp_multi_update_report.update_channels[j].intensity =
> +				rep->intensity_update_channel;

Here too, having a temporary variable for 
lamp_multi_update_report.update_channels[j] would help readability I 
think.

Although, mostly the variables are now short and neat like "rep", "in", 
and "out", but here it is this super long "lamp_multi_update_report". If 
that variable would be named something shorter, those lines likely 
wouldn't seem so intimidating walls of text to read and using a temporary 
variable would not even feel necessary to improve readability.

If you don't mind my suggestion, "split_rep" would describe the variable's 
function quite well (as per what's explained in your comment).

I'm not sure if it's a good idea or not to leave the stale entries from 
the previous report into the last one that is not getting filled fully
but I guess you know what you're doing. Such leakage could be easily 
prevented by moving the definition of the report variable into the outer 
for loop so it would get reinitialized for every iteration.

> +		}
> +
> +		ret = handle_lamp_multi_update_report(hdev, &lamp_multi_update_report);
> +		if (ret < 0)
> +			return ret;
> +		if (ret != sizeof(lamp_multi_update_report))
> +			return -EIO;
> +	}
> +
> +	return sizeof(*rep);
> +}
> +
> +struct __packed lamp_array_control_report_t {
> +	const u8 report_id;
> +	u8 autonomous_mode;
> +};
> +
> +static int handle_lamp_array_control_report(struct hid_device *hdev __always_unused,
> +					    struct lamp_array_control_report_t *rep)
> +{
> +	/*
> +	 * The keyboards firmware doesn't have any built in controls and the
> +	 * built in effects are not implemented so this is a NOOP.
> +	 * According to the HID Documentation (HID Usage Tables v1.5) this
> +	 * function is optional and can be removed from the HID Report
> +	 * Descriptor, but it should first be confirmed that userspace respects
> +	 * this possibility too. The Microsoft MacroPad reference implementation
> +	 * (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
> +	 * already deviates from the spec at another point, see
> +	 * handle_lamp_*_update_report.
> +	 */
> +
> +	return sizeof(*rep);
> +}
> +
> +static int tux_ll_raw_request(struct hid_device *hdev, unsigned char reportnum,

If the report num is binary, it should be typed u8.

> +			      u8 *buf, size_t len, unsigned char rtype,
> +			      int reqtype)
> +{
> +	if (rtype != HID_FEATURE_REPORT)
> +		return -EINVAL;
> +
> +	switch (reqtype) {
> +	case HID_REQ_GET_REPORT:
> +		switch (reportnum) {
> +		case LAMP_ARRAY_ATTRIBUTES_REPORT_ID:
> +			if (len != sizeof(struct lamp_array_attributes_report_t))
> +				return -EINVAL;
> +			return handle_lamp_array_attributes_report(hdev,
> +				(struct lamp_array_attributes_report_t *)buf);
> +		case LAMP_ATTRIBUTES_RESPONSE_REPORT_ID:
> +			if (len != sizeof(struct lamp_attributes_response_report_t))
> +				return -EINVAL;
> +			return handle_lamp_attributes_response_report(hdev,
> +				(struct lamp_attributes_response_report_t *)buf);
> +		}
> +		break;
> +	case HID_REQ_SET_REPORT:
> +		switch (reportnum) {
> +		case LAMP_ATTRIBUTES_REQUEST_REPORT_ID:
> +			if (len != sizeof(struct lamp_attributes_request_report_t))
> +				return -EINVAL;
> +			return handle_lamp_attributes_request_report(hdev,
> +				(struct lamp_attributes_request_report_t *)buf);
> +		case LAMP_MULTI_UPDATE_REPORT_ID:
> +			if (len != sizeof(struct lamp_multi_update_report_t))
> +				return -EINVAL;
> +			return handle_lamp_multi_update_report(hdev,
> +				(struct lamp_multi_update_report_t *)buf);
> +		case LAMP_RANGE_UPDATE_REPORT_ID:
> +			if (len != sizeof(struct lamp_range_update_report_t))
> +				return -EINVAL;
> +			return handle_lamp_range_update_report(hdev,
> +				(struct lamp_range_update_report_t *)buf);
> +		case LAMP_ARRAY_CONTROL_REPORT_ID:
> +			if (len != sizeof(struct lamp_array_control_report_t))
> +				return -EINVAL;
> +			return handle_lamp_array_control_report(hdev,
> +				(struct lamp_array_control_report_t *)buf);
> +		}
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct hid_ll_driver tux_ll_driver = {
> +	.start = &tux_ll_start,
> +	.stop = &tux_ll_stop,
> +	.open = &tux_ll_open,
> +	.close = &tux_ll_close,
> +	.parse = &tux_ll_parse,
> +	.raw_request = &tux_ll_raw_request,
> +};
> +
> +static int tux_virt_lamparray_add_device(struct wmi_device *wdev,
> +					 struct hid_device **hdev_out)
> +{
> +	struct hid_device *hdev;
> +	int ret;
> +
> +	dev_dbg(&wdev->dev, "Adding TUXEDO NB04 Virtual LampArray device.\n");
> +
> +	hdev = hid_allocate_device();
> +	if (IS_ERR(hdev))
> +		return PTR_ERR(hdev);
> +	*hdev_out = hdev;
> +
> +	strscpy(hdev->name, "TUXEDO NB04 RGB Lighting", sizeof(hdev->name));
> +
> +	hdev->ll_driver = &tux_ll_driver;
> +	hdev->bus = BUS_VIRTUAL;
> +	hdev->vendor = 0x21ba;
> +	hdev->product = 0x0400;
> +	hdev->dev.parent = &wdev->dev;
> +
> +	ret = hid_add_device(hdev);
> +	if (ret)
> +		hid_destroy_device(hdev);
> +	return ret;
> +}
> +
> +static int tux_probe(struct wmi_device *wdev, const void *context __always_unused)
> +{
> +	struct tux_driver_data_t *driver_data;
> +
> +	driver_data = devm_kzalloc(&wdev->dev, sizeof(*driver_data), GFP_KERNEL);
> +	if (!driver_data)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&wdev->dev, driver_data);
> +
> +	return tux_virt_lamparray_add_device(wdev, &driver_data->hdev);
> +}
> +
> +static void tux_remove(struct wmi_device *wdev)
> +{
> +	struct tux_driver_data_t *driver_data = dev_get_drvdata(&wdev->dev);
> +
> +	hid_destroy_device(driver_data->hdev);
> +}
> +
> +static struct wmi_driver tuxedo_nb04_wmi_tux_driver = {
> +	.driver = {
> +		.name = "tuxedo_nb04_wmi_ab",
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table = tuxedo_nb04_wmi_ab_device_ids,
> +	.probe = tux_probe,
> +	.remove = tux_remove,
> +	.no_singleton = true,
> +};
> +
> +/*
> + * We don't know if the WMI API is stable and how unique the GUID is for this
> + * ODM. To be on the safe side we therefore only run this driver on tested
> + * devices defined by this list.
> + */
> +static const struct dmi_system_id tested_devices_dmi_table[] __initconst = {
> +	{
> +		// TUXEDO Sirius 16 Gen1
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
> +		},
> +	},
> +	{
> +		// TUXEDO Sirius 16 Gen2
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static int __init tuxedo_nb04_wmi_tux_init(void)
> +{
> +	if (!dmi_check_system(tested_devices_dmi_table))
> +		return -ENODEV;
> +
> +	return wmi_driver_register(&tuxedo_nb04_wmi_tux_driver);
> +}
> +module_init(tuxedo_nb04_wmi_tux_init);
> +
> +static void __exit tuxedo_nb04_wmi_tux_exit(void)
> +{
> +	return wmi_driver_unregister(&tuxedo_nb04_wmi_tux_driver);
> +}
> +module_exit(tuxedo_nb04_wmi_tux_exit);
> +
> +MODULE_DESCRIPTION("Virtual HID LampArray interface for TUXEDO NB04 devices");
> +MODULE_AUTHOR("Werner Sembach <wse@tuxedocomputers.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_util.c b/drivers/platform/x86/tuxedo/nb04/wmi_util.c
> new file mode 100644
> index 0000000000000..e894690da1a83
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_util.c
> @@ -0,0 +1,91 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * This code gives functions to avoid code duplication while interacting with
> + * the TUXEDO NB04 wmi interfaces.
> + *
> + * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/cleanup.h>
> +#include <linux/wmi.h>
> +
> +#include "wmi_util.h"
> +
> +static int __wmi_method_acpi_object_out(struct wmi_device *wdev,
> +					u32 wmi_method_id,
> +					u8 *in,
> +					acpi_size in_len,
> +					union acpi_object **out)
> +{
> +	struct acpi_buffer acpi_buffer_in = { in_len, in };
> +	struct acpi_buffer acpi_buffer_out = { ACPI_ALLOCATE_BUFFER, NULL };
> +
> +	dev_dbg(&wdev->dev, "Evaluate WMI method: %u in:\n", wmi_method_id);
> +	print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, in, in_len);
> +
> +	acpi_status status = wmidev_evaluate_method(wdev, 0, wmi_method_id,
> +						    &acpi_buffer_in,
> +						    &acpi_buffer_out);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&wdev->dev, "Failed to evaluate WMI method.\n");
> +		return -EIO;
> +	}
> +	if (!acpi_buffer_out.pointer) {
> +		dev_err(&wdev->dev, "Unexpected empty out buffer.\n");
> +		return -ENODATA;
> +	}
> +
> +	*out = acpi_buffer_out.pointer;
> +
> +	return 0;
> +}
> +
> +static int __wmi_method_buffer_out(struct wmi_device *wdev,
> +				   u32 wmi_method_id,
> +				   u8 *in,
> +				   acpi_size in_len,
> +				   u8 *out,
> +				   acpi_size out_len)
> +{
> +	int ret;
> +
> +	union acpi_object *acpi_object_out __free(kfree) = NULL;
> +
> +	ret = __wmi_method_acpi_object_out(wdev, wmi_method_id,
> +					   in, in_len,
> +					   &acpi_object_out);
> +	if (ret)
> +		return ret;
> +
> +	if (acpi_object_out->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Unexpected out buffer type. Expected: %u Got: %u\n",
> +			ACPI_TYPE_BUFFER, acpi_object_out->type);
> +		return -EIO;
> +	}
> +	if (acpi_object_out->buffer.length < out_len) {
> +		dev_err(&wdev->dev, "Unexpected out buffer length.\n");
> +		return -EIO;
> +	}
> +
> +	memcpy(out, acpi_object_out->buffer.pointer, out_len);
> +
> +	return 0;
> +}
> +
> +int tux_wmi_xx_8in_80out(struct wmi_device *wdev,
> +			 enum tux_wmi_xx_8in_80out_methods method,
> +			 union tux_wmi_xx_8in_80out_in_t *in,
> +			 union tux_wmi_xx_8in_80out_out_t *out)
> +{
> +	return __wmi_method_buffer_out(wdev, method, in->raw, 8, out->raw, 80);
> +}
> +
> +int tux_wmi_xx_496in_80out(struct wmi_device *wdev,
> +			   enum tux_wmi_xx_496in_80out_methods method,
> +			   union tux_wmi_xx_496in_80out_in_t *in,
> +			   union tux_wmi_xx_496in_80out_out_t *out)
> +{
> +	return __wmi_method_buffer_out(wdev, method, in->raw, 496, out->raw, 80);
> +}
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_util.h b/drivers/platform/x86/tuxedo/nb04/wmi_util.h
> new file mode 100644
> index 0000000000000..c9ce4405609d4
> --- /dev/null
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_util.h
> @@ -0,0 +1,109 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * This code gives functions to avoid code duplication while interacting with
> + * the TUXEDO NB04 wmi interfaces.
> + *
> + * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
> + */
> +
> +#ifndef TUXEDO_NB04_WMI_UTIL_H
> +#define TUXEDO_NB04_WMI_UTIL_H
> +
> +#include <linux/wmi.h>
> +
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_TOUCHPAD	1
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD	2
> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_APP_PAGES	3
> +
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_NONE		0
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_PER_KEY	1
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_FOUR_ZONE	2
> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_WHITE_ONLY	3
> +
> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII	0
> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO	1
> +
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_RED		1
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_GREEN		2
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_YELLOW	3
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_BLUE		4
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_PURPLE	5
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_INDIGO	6
> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_WHITE		7
> +
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_DASHBOARD	BIT(0)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_SYSTEMINFOS	BIT(1)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_KBL		BIT(2)
> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_HOTKEYS	BIT(3)
> +
> +union tux_wmi_xx_8in_80out_in_t {
> +	u8 raw[8];
> +	struct __packed {
> +		u8 device_type;
> +		u8 reserved[7];
> +	} get_device_status_in;
> +};
> +
> +union tux_wmi_xx_8in_80out_out_t {
> +	u8 raw[80];
> +	struct __packed {
> +		u16 return_status;
> +		u8 device_enabled;
> +		u8 kbl_type;
> +		u8 kbl_side_bar_supported;
> +		u8 keyboard_physical_layout;
> +		u8 app_pages;
> +		u8 per_key_kbl_default_color;
> +		u8 four_zone_kbl_default_color_1;
> +		u8 four_zone_kbl_default_color_2;
> +		u8 four_zone_kbl_default_color_3;
> +		u8 four_zone_kbl_default_color_4;
> +		u8 light_bar_kbl_default_color;
> +		u8 reserved_0[1];
> +		u16 dedicated_gpu_id;
> +		u8 reserved_1[64];
> +	} get_device_status_out;
> +};
> +
> +enum tux_wmi_xx_8in_80out_methods {
> +	WMI_AB_GET_DEVICE_STATUS	= 2,
> +};
> +
> +#define WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX	120
> +
> +union tux_wmi_xx_496in_80out_in_t {
> +	u8 raw[496];
> +	struct __packed {
> +		u8 reserved[15];
> +		u8 lighting_setting_count;
> +		struct {
> +			u8 key_id;
> +			u8 red;
> +			u8 green;
> +			u8 blue;
> +		} lighting_settings[WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX];
> +	}  kbl_set_multiple_keys_in;
> +};
> +
> +union tux_wmi_xx_496in_80out_out_t {
> +	u8 raw[80];
> +	struct __packed {
> +		u8 return_value;
> +		u8 reserved[79];
> +	} kbl_set_multiple_keys_out;
> +};
> +
> +enum tux_wmi_xx_496in_80out_methods {
> +	WMI_AB_KBL_SET_MULTIPLE_KEYS	= 6,
> +};
> +
> +int tux_wmi_xx_8in_80out(struct wmi_device *wdev,
> +			 enum tux_wmi_xx_8in_80out_methods method,
> +			 union tux_wmi_xx_8in_80out_in_t *in,
> +			 union tux_wmi_xx_8in_80out_out_t *out);
> +int tux_wmi_xx_496in_80out(struct wmi_device *wdev,
> +			   enum tux_wmi_xx_496in_80out_methods method,
> +			   union tux_wmi_xx_496in_80out_in_t *in,
> +			   union tux_wmi_xx_496in_80out_out_t *out);
> +
> +#endif
> 

-- 
 i.


