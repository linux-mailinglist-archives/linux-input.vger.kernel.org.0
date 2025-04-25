Return-Path: <linux-input+bounces-12003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B90A9C7AD
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 13:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B43511BC1D4A
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 11:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C56D14F9D9;
	Fri, 25 Apr 2025 11:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YXmnz4r1"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2171AA1F4;
	Fri, 25 Apr 2025 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580760; cv=none; b=i0udGDqfIwBboaDHuNSQnSl4ltYjh1LkSinPqlusWpvVL5xjxUVrUinsPUKjszmCFVW0SQYaNoRYh49jOk6uZXibmELL6XES7JMFtXh64M3dFfu5gRIsrB210k1B1jv6eEcxs1H/edVZ0MPjEaYwWv7dSlIbF+7WplIPiAoVJCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580760; c=relaxed/simple;
	bh=nCzXjO01vY49jm+qeNZBUeQbNjyPMf//4UOL1WlDFsw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V3+VCxi13F6S7XlyM1b+DYb05QG0qBx5d4ES0sMph2BC4/4R3r7gglqrVJuZS5TJEPCAJBki4tF+PtCZghrGpd51ujj4I77PUDf0+DXr8ypCEh9Jegs/0WCU4H0xpuSUGJUvJi1MO8q19Jw+/dc+kMEI7X10sQt1olLCWPUG9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YXmnz4r1; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745580757; x=1777116757;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nCzXjO01vY49jm+qeNZBUeQbNjyPMf//4UOL1WlDFsw=;
  b=YXmnz4r1YoHMLvI6jl+kNJFVquAFXhXbc2dXY7gC0rlFkUJMHUONdrLq
   CZtN6IZqOtv+Rj6vMZXgM4KEmxSTgFpO9sXZ3dxU0uoO9TXWJxsRYdrur
   o5f/V0axlypUr0RLo18GJlRSix2rvd+LZbm/dswdpk20v9wjTpTMyHNq5
   DW8JruxbEOYOq6oAE6+w0b8DE15wbAfQzP7mK6fFLnLmVAOvDegequE1r
   q75rgza+7NpLH50SROolSLbffHhEBKMjvMyviMcqVSvm8IfWzllC68zsb
   TANtyCeM7WwVp1dUGt1wL5QsOic6p9yZxAcmBxVSrBiI3sMqOv8NlCRlG
   w==;
X-CSE-ConnectionGUID: VBv5/CUoRuGWjPabdsCI6w==
X-CSE-MsgGUID: YPYy+BXCTuaxXwQo8Z8yEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="50906484"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="50906484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:32:37 -0700
X-CSE-ConnectionGUID: ewOsAcNNS1eagZ3sVQ22Tg==
X-CSE-MsgGUID: DXtV11N9QlepJbEXQUUV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163848328"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.154])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 04:32:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 25 Apr 2025 14:32:30 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
    linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v8 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
In-Reply-To: <d6d052ed-0a4d-4e8b-b1a2-07cce892a1c7@tuxedocomputers.com>
Message-ID: <0aa1797b-69b0-83df-f9fa-b6d541c7a62a@linux.intel.com>
References: <20250423153804.64395-1-wse@tuxedocomputers.com> <20250423153804.64395-2-wse@tuxedocomputers.com> <24860b01-f42e-295f-334f-74ecbf642d40@linux.intel.com> <d6d052ed-0a4d-4e8b-b1a2-07cce892a1c7@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-84003940-1745580750=:950"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-84003940-1745580750=:950
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 24 Apr 2025, Werner Sembach wrote:

>=20
> Am 24.04.25 um 15:26 schrieb Ilpo J=C3=A4rvinen:
> > On Wed, 23 Apr 2025, Werner Sembach wrote:
> >=20
> > > The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a pe=
r-key
> > > controllable RGB keyboard backlight. The firmware API for it is
> > > implemented
> > > via WMI.
> > >=20
> > > To make the backlight userspace configurable this driver emulates a
> > > LampArray HID device and translates the input from hidraw to the
> > > corresponding WMI calls. This is a new approach as the leds subsystem
> > > lacks
> > > a suitable UAPI for per-key keyboard backlights, and like this no new=
 UAPI
> > > needs to be established.
> > >=20
> > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > ---
> > >   MAINTAINERS                                 |   6 +
> > >   drivers/platform/x86/Kconfig                |   2 +
> > >   drivers/platform/x86/Makefile               |   3 +
> > >   drivers/platform/x86/tuxedo/Kconfig         |   8 +
> > >   drivers/platform/x86/tuxedo/Makefile        |   8 +
> > >   drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
> > >   drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
> > >   drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 916 +++++++++++++++++=
+++
> > >   drivers/platform/x86/tuxedo/nb04/wmi_util.c |  91 ++
> > >   drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
> > >   10 files changed, 1168 insertions(+)
> > >   create mode 100644 drivers/platform/x86/tuxedo/Kconfig
> > >   create mode 100644 drivers/platform/x86/tuxedo/Makefile
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
> > >   create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 00e94bec401e1..c1f7460c246ad 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -24217,6 +24217,12 @@ T:=09git
> > > git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbosta=
t
> > >   F:=09tools/power/x86/turbostat/
> > >   F:=09tools/testing/selftests/turbostat/
> > >   +TUXEDO DRIVERS
> > > +M:=09Werner Sembach <wse@tuxedocomputers.com>
> > > +L:=09platform-driver-x86@vger.kernel.org
> > > +S:=09Supported
> > > +F:=09drivers/platform/x86/tuxedo/
> > > +
> > >   TW5864 VIDEO4LINUX DRIVER
> > >   M:=09Bluecherry Maintainers <maintainers@bluecherrydvr.com>
> > >   M:=09Andrey Utkin <andrey.utkin@corp.bluecherry.net>
> > > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> > > index 0258dd879d64b..58b258cde4fdb 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -1186,6 +1186,8 @@ config SEL3350_PLATFORM
> > >   =09  To compile this driver as a module, choose M here: the module
> > >   =09  will be called sel3350-platform.
> > >   +source "drivers/platform/x86/tuxedo/Kconfig"
> > > +
> > >   endif # X86_PLATFORM_DEVICES
> > >     config P2SB
> > > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> > > index e1b1429470674..1562dcd7ad9a5 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -153,3 +153,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)=09=09+=3D
> > > winmate-fm07-keys.o
> > >     # SEL
> > >   obj-$(CONFIG_SEL3350_PLATFORM)=09=09+=3D sel3350-platform.o
> > > +
> > > +# TUXEDO
> > > +obj-y=09=09=09=09=09+=3D tuxedo/
> > > diff --git a/drivers/platform/x86/tuxedo/Kconfig
> > > b/drivers/platform/x86/tuxedo/Kconfig
> > > new file mode 100644
> > > index 0000000000000..80be0947dddc4
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/tuxedo/Kconfig
> > > @@ -0,0 +1,8 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +#
> > > +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> > > +#
> > > +# TUXEDO X86 Platform Specific Drivers
> > > +#
> > > +
> > > +source "drivers/platform/x86/tuxedo/nb04/Kconfig"
> > > diff --git a/drivers/platform/x86/tuxedo/Makefile
> > > b/drivers/platform/x86/tuxedo/Makefile
> > > new file mode 100644
> > > index 0000000000000..0afe0d0f455e7
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/tuxedo/Makefile
> > > @@ -0,0 +1,8 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +#
> > > +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> > > +#
> > > +# TUXEDO X86 Platform Specific Drivers
> > > +#
> > > +
> > > +obj-y=09+=3D nb04/
> > > diff --git a/drivers/platform/x86/tuxedo/nb04/Kconfig
> > > b/drivers/platform/x86/tuxedo/nb04/Kconfig
> > > new file mode 100644
> > > index 0000000000000..411c46c9a1cf0
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/tuxedo/nb04/Kconfig
> > > @@ -0,0 +1,15 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +#
> > > +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> > > +#
> > > +# TUXEDO X86 Platform Specific Drivers
> > > +#
> > > +
> > > +config TUXEDO_NB04_WMI_AB
> > > +=09tristate "TUXEDO NB04 WMI AB Platform Driver"
> > > +=09help
> > > +=09  This driver implements the WMI AB device found on TUXEDO notebo=
oks
> > > +=09  with board vendor NB04. This enables keyboard backlight control=
 via
> > > a
> > > +=09  virtual HID LampArray device.
> > > +
> > > +=09  When compiled as a module it will be called tuxedo_nb04_wmi_ab.
> > > diff --git a/drivers/platform/x86/tuxedo/nb04/Makefile
> > > b/drivers/platform/x86/tuxedo/nb04/Makefile
> > > new file mode 100644
> > > index 0000000000000..c963e0d605057
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/tuxedo/nb04/Makefile
> > > @@ -0,0 +1,10 @@
> > > +# SPDX-License-Identifier: GPL-2.0-or-later
> > > +#
> > > +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
> > > +#
> > > +# TUXEDO X86 Platform Specific Drivers
> > > +#
> > > +
> > > +tuxedo_nb04_wmi_ab-y=09=09=09:=3D wmi_ab.o
> > > +tuxedo_nb04_wmi_ab-y=09=09=09+=3D wmi_util.o
> > > +obj-$(CONFIG_TUXEDO_NB04_WMI_AB)=09+=3D tuxedo_nb04_wmi_ab.o
> > > diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> > > b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> > > new file mode 100644
> > > index 0000000000000..05eb1d22692f9
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> > > @@ -0,0 +1,916 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * This driver implements the WMI AB device found on TUXEDO notebook=
s
> > > with board
> > > + * vendor NB04.
> > > + *
> > > + * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
> > > + */
> > > +
> > > +#include <linux/dmi.h>
> > > +#include <linux/hid.h>
> > > +#include <linux/minmax.h>
> > > +#include <linux/module.h>
> > > +#include <linux/wmi.h>
> > > +
> > > +#include "wmi_util.h"
> > > +
> > > +static const struct wmi_device_id tuxedo_nb04_wmi_ab_device_ids[] =
=3D {
> > > +=09{ .guid_string =3D "80C9BAA6-AC48-4538-9234-9F81A55E7C85" },
> > > +=09{ }
> > > +};
> > > +MODULE_DEVICE_TABLE(wmi, tuxedo_nb04_wmi_ab_device_ids);
> > > +
> > > +enum {
> > > +=09LAMP_ARRAY_ATTRIBUTES_REPORT_ID=09=09=3D 0x01,
> > > +=09LAMP_ATTRIBUTES_REQUEST_REPORT_ID=09=3D 0x02,
> > > +=09LAMP_ATTRIBUTES_RESPONSE_REPORT_ID=09=3D 0x03,
> > > +=09LAMP_MULTI_UPDATE_REPORT_ID=09=09=3D 0x04,
> > > +=09LAMP_RANGE_UPDATE_REPORT_ID=09=09=3D 0x05,
> > > +=09LAMP_ARRAY_CONTROL_REPORT_ID=09=09=3D 0x06,
> > > +};
> > > +
> > > +static u8 tux_report_descriptor[327] =3D {
> > > +=090x05, 0x59,=09=09=09// Usage Page (Lighting and
> > > Illumination)
> > > +=090x09, 0x01,=09=09=09// Usage (Lamp Array)
> > > +=090xa1, 0x01,=09=09=09// Collection (Application)
> > > +=090x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
> > > +=090x09, 0x02,=09=09=09//  Usage (Lamp Array Attributes
> > > Report)
> > > +=090xa1, 0x02,=09=09=09//  Collection (Logical)
> > > +=090x09, 0x03,=09=09=09//   Usage (Lamp Count)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x27, 0xff, 0xff, 0x00, 0x00,=09//   Logical Maximum (65535)
> > > +=090x75, 0x10,=09=09=09//   Report Size (16)
> > > +=090x95, 0x01,=09=09=09//   Report Count (1)
> > > +=090xb1, 0x03,=09=09=09//   Feature (Cnst,Var,Abs)
> > > +=090x09, 0x04,=09=09=09//   Usage (Bounding Box Width In
> > > Micrometers)
> > > +=090x09, 0x05,=09=09=09//   Usage (Bounding Box Height In
> > > Micrometers)
> > > +=090x09, 0x06,=09=09=09//   Usage (Bounding Box Depth In
> > > Micrometers)
> > > +=090x09, 0x07,=09=09=09//   Usage (Lamp Array Kind)
> > > +=090x09, 0x08,=09=09=09//   Usage (Min Update Interval In
> > > Microseconds)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x27, 0xff, 0xff, 0xff, 0x7f,=09//   Logical Maximum (2147483647)
> > > +=090x75, 0x20,=09=09=09//   Report Size (32)
> > > +=090x95, 0x05,=09=09=09//   Report Count (5)
> > > +=090xb1, 0x03,=09=09=09//   Feature (Cnst,Var,Abs)
> > > +=090xc0,=09=09=09=09//  End Collection
> > > +=090x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
> > > +=090x09, 0x20,=09=09=09//  Usage (Lamp Attributes Request
> > > Report)
> > > +=090xa1, 0x02,=09=09=09//  Collection (Logical)
> > > +=090x09, 0x21,=09=09=09//   Usage (Lamp Id)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x27, 0xff, 0xff, 0x00, 0x00,=09//   Logical Maximum (65535)
> > > +=090x75, 0x10,=09=09=09//   Report Size (16)
> > > +=090x95, 0x01,=09=09=09//   Report Count (1)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090xc0,=09=09=09=09//  End Collection
> > > +=090x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
> > > +=090x09, 0x22,=09=09=09//  Usage (Lamp Attributes Response
> > > Report)
> > > +=090xa1, 0x02,=09=09=09//  Collection (Logical)
> > > +=090x09, 0x21,=09=09=09//   Usage (Lamp Id)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x27, 0xff, 0xff, 0x00, 0x00,=09//   Logical Maximum (65535)
> > > +=090x75, 0x10,=09=09=09//   Report Size (16)
> > > +=090x95, 0x01,=09=09=09//   Report Count (1)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090x09, 0x23,=09=09=09//   Usage (Position X In Micrometers)
> > > +=090x09, 0x24,=09=09=09//   Usage (Position Y In Micrometers)
> > > +=090x09, 0x25,=09=09=09//   Usage (Position Z In Micrometers)
> > > +=090x09, 0x27,=09=09=09//   Usage (Update Latency In
> > > Microseconds)
> > > +=090x09, 0x26,=09=09=09//   Usage (Lamp Purposes)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x27, 0xff, 0xff, 0xff, 0x7f,=09//   Logical Maximum (2147483647)
> > > +=090x75, 0x20,=09=09=09//   Report Size (32)
> > > +=090x95, 0x05,=09=09=09//   Report Count (5)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090x09, 0x28,=09=09=09//   Usage (Red Level Count)
> > > +=090x09, 0x29,=09=09=09//   Usage (Green Level Count)
> > > +=090x09, 0x2a,=09=09=09//   Usage (Blue Level Count)
> > > +=090x09, 0x2b,=09=09=09//   Usage (Intensity Level Count)
> > > +=090x09, 0x2c,=09=09=09//   Usage (Is Programmable)
> > > +=090x09, 0x2d,=09=09=09//   Usage (Input Binding)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x26, 0xff, 0x00,=09=09//   Logical Maximum (255)
> > > +=090x75, 0x08,=09=09=09//   Report Size (8)
> > > +=090x95, 0x06,=09=09=09//   Report Count (6)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090xc0,=09=09=09=09//  End Collection
> > > +=090x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
> > > +=090x09, 0x50,=09=09=09//  Usage (Lamp Multi Update Report)
> > > +=090xa1, 0x02,=09=09=09//  Collection (Logical)
> > > +=090x09, 0x03,=09=09=09//   Usage (Lamp Count)
> > > +=090x09, 0x55,=09=09=09//   Usage (Lamp Update Flags)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x25, 0x08,=09=09=09//   Logical Maximum (8)
> > > +=090x75, 0x08,=09=09=09//   Report Size (8)
> > > +=090x95, 0x02,=09=09=09//   Report Count (2)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090x09, 0x21,=09=09=09//   Usage (Lamp Id)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x27, 0xff, 0xff, 0x00, 0x00,=09//   Logical Maximum (65535)
> > > +=090x75, 0x10,=09=09=09//   Report Size (16)
> > > +=090x95, 0x08,=09=09=09//   Report Count (8)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x26, 0xff, 0x00,=09=09//   Logical Maximum (255)
> > > +=090x75, 0x08,=09=09=09//   Report Size (8)
> > > +=090x95, 0x20,=09=09=09//   Report Count (32)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090xc0,=09=09=09=09//  End Collection
> > > +=090x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
> > > +=090x09, 0x60,=09=09=09//  Usage (Lamp Range Update Report)
> > > +=090xa1, 0x02,=09=09=09//  Collection (Logical)
> > > +=090x09, 0x55,=09=09=09//   Usage (Lamp Update Flags)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x25, 0x08,=09=09=09//   Logical Maximum (8)
> > > +=090x75, 0x08,=09=09=09//   Report Size (8)
> > > +=090x95, 0x01,=09=09=09//   Report Count (1)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090x09, 0x61,=09=09=09//   Usage (Lamp Id Start)
> > > +=090x09, 0x62,=09=09=09//   Usage (Lamp Id End)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x27, 0xff, 0xff, 0x00, 0x00,=09//   Logical Maximum (65535)
> > > +=090x75, 0x10,=09=09=09//   Report Size (16)
> > > +=090x95, 0x02,=09=09=09//   Report Count (2)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090x09, 0x51,=09=09=09//   Usage (Red Update Channel)
> > > +=090x09, 0x52,=09=09=09//   Usage (Green Update Channel)
> > > +=090x09, 0x53,=09=09=09//   Usage (Blue Update Channel)
> > > +=090x09, 0x54,=09=09=09//   Usage (Intensity Update Channel)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x26, 0xff, 0x00,=09=09//   Logical Maximum (255)
> > > +=090x75, 0x08,=09=09=09//   Report Size (8)
> > > +=090x95, 0x04,=09=09=09//   Report Count (4)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090xc0,=09=09=09=09//  End Collection
> > > +=090x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
> > > +=090x09, 0x70,=09=09=09//  Usage (Lamp Array Control Report)
> > > +=090xa1, 0x02,=09=09=09//  Collection (Logical)
> > > +=090x09, 0x71,=09=09=09//   Usage (Autonomous Mode)
> > > +=090x15, 0x00,=09=09=09//   Logical Minimum (0)
> > > +=090x25, 0x01,=09=09=09//   Logical Maximum (1)
> > > +=090x75, 0x08,=09=09=09//   Report Size (8)
> > > +=090x95, 0x01,=09=09=09//   Report Count (1)
> > > +=090xb1, 0x02,=09=09=09//   Feature (Data,Var,Abs)
> > > +=090xc0,=09=09=09=09//  End Collection
> > > +=090xc0=09=09=09=09// End Collection
> > > +};
> > > +
> > > +struct tux_kbl_map_entry_t {
> > > +=09u8 code;
> > > +=09struct {
> > > +=09=09u32 x;
> > > +=09=09u32 y;
> > > +=09=09u32 z;
> > > +=09} pos;
> > > +};
> > > +
> > > +static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] =
=3D {
> > > +=09{ 0x29, {  25000,  53000, 5000 } },
> > > +=09{ 0x3a, {  41700,  53000, 5000 } },
> > > +=09{ 0x3b, {  58400,  53000, 5000 } },
> > > +=09{ 0x3c, {  75100,  53000, 5000 } },
> > > +=09{ 0x3d, {  91800,  53000, 5000 } },
> > > +=09{ 0x3e, { 108500,  53000, 5000 } },
> > > +=09{ 0x3f, { 125200,  53000, 5000 } },
> > > +=09{ 0x40, { 141900,  53000, 5000 } },
> > > +=09{ 0x41, { 158600,  53000, 5000 } },
> > > +=09{ 0x42, { 175300,  53000, 5000 } },
> > > +=09{ 0x43, { 192000,  53000, 5000 } },
> > > +=09{ 0x44, { 208700,  53000, 5000 } },
> > > +=09{ 0x45, { 225400,  53000, 5000 } },
> > > +=09{ 0xf1, { 242100,  53000, 5000 } },
> > > +=09{ 0x46, { 258800,  53000, 5000 } },
> > > +=09{ 0x4c, { 275500,  53000, 5000 } },
> > > +=09{ 0x4a, { 294500,  53000, 5000 } },
> > > +=09{ 0x4d, { 311200,  53000, 5000 } },
> > > +=09{ 0x4b, { 327900,  53000, 5000 } },
> > > +=09{ 0x4e, { 344600,  53000, 5000 } },
> > > +=09{ 0x35, {  24500,  67500, 5250 } },
> > > +=09{ 0x1e, {  42500,  67500, 5250 } },
> > > +=09{ 0x1f, {  61000,  67500, 5250 } },
> > > +=09{ 0x20, {  79500,  67500, 5250 } },
> > > +=09{ 0x21, {  98000,  67500, 5250 } },
> > > +=09{ 0x22, { 116500,  67500, 5250 } },
> > > +=09{ 0x23, { 135000,  67500, 5250 } },
> > > +=09{ 0x24, { 153500,  67500, 5250 } },
> > > +=09{ 0x25, { 172000,  67500, 5250 } },
> > > +=09{ 0x26, { 190500,  67500, 5250 } },
> > > +=09{ 0x27, { 209000,  67500, 5250 } },
> > > +=09{ 0x2d, { 227500,  67500, 5250 } },
> > > +=09{ 0x2e, { 246000,  67500, 5250 } },
> > > +=09{ 0x2a, { 269500,  67500, 5250 } },
> > > +=09{ 0x53, { 294500,  67500, 5250 } },
> > > +=09{ 0x55, { 311200,  67500, 5250 } },
> > > +=09{ 0x54, { 327900,  67500, 5250 } },
> > > +=09{ 0x56, { 344600,  67500, 5250 } },
> > > +=09{ 0x2b, {  31000,  85500, 5500 } },
> > > +=09{ 0x14, {  51500,  85500, 5500 } },
> > > +=09{ 0x1a, {  70000,  85500, 5500 } },
> > > +=09{ 0x08, {  88500,  85500, 5500 } },
> > > +=09{ 0x15, { 107000,  85500, 5500 } },
> > > +=09{ 0x17, { 125500,  85500, 5500 } },
> > > +=09{ 0x1c, { 144000,  85500, 5500 } },
> > > +=09{ 0x18, { 162500,  85500, 5500 } },
> > > +=09{ 0x0c, { 181000,  85500, 5500 } },
> > > +=09{ 0x12, { 199500,  85500, 5500 } },
> > > +=09{ 0x13, { 218000,  85500, 5500 } },
> > > +=09{ 0x2f, { 236500,  85500, 5500 } },
> > > +=09{ 0x30, { 255000,  85500, 5500 } },
> > > +=09{ 0x31, { 273500,  85500, 5500 } },
> > > +=09{ 0x5f, { 294500,  85500, 5500 } },
> > > +=09{ 0x60, { 311200,  85500, 5500 } },
> > > +=09{ 0x61, { 327900,  85500, 5500 } },
> > > +=09{ 0x39, {  33000, 103500, 5750 } },
> > > +=09{ 0x04, {  57000, 103500, 5750 } },
> > > +=09{ 0x16, {  75500, 103500, 5750 } },
> > > +=09{ 0x07, {  94000, 103500, 5750 } },
> > > +=09{ 0x09, { 112500, 103500, 5750 } },
> > > +=09{ 0x0a, { 131000, 103500, 5750 } },
> > > +=09{ 0x0b, { 149500, 103500, 5750 } },
> > > +=09{ 0x0d, { 168000, 103500, 5750 } },
> > > +=09{ 0x0e, { 186500, 103500, 5750 } },
> > > +=09{ 0x0f, { 205000, 103500, 5750 } },
> > > +=09{ 0x33, { 223500, 103500, 5750 } },
> > > +=09{ 0x34, { 242000, 103500, 5750 } },
> > > +=09{ 0x28, { 267500, 103500, 5750 } },
> > > +=09{ 0x5c, { 294500, 103500, 5750 } },
> > > +=09{ 0x5d, { 311200, 103500, 5750 } },
> > > +=09{ 0x5e, { 327900, 103500, 5750 } },
> > > +=09{ 0x57, { 344600,  94500, 5625 } },
> > > +=09{ 0xe1, {  37000, 121500, 6000 } },
> > > +=09{ 0x1d, {  66000, 121500, 6000 } },
> > > +=09{ 0x1b, {  84500, 121500, 6000 } },
> > > +=09{ 0x06, { 103000, 121500, 6000 } },
> > > +=09{ 0x19, { 121500, 121500, 6000 } },
> > > +=09{ 0x05, { 140000, 121500, 6000 } },
> > > +=09{ 0x11, { 158500, 121500, 6000 } },
> > > +=09{ 0x10, { 177000, 121500, 6000 } },
> > > +=09{ 0x36, { 195500, 121500, 6000 } },
> > > +=09{ 0x37, { 214000, 121500, 6000 } },
> > > +=09{ 0x38, { 232500, 121500, 6000 } },
> > > +=09{ 0xe5, { 251500, 121500, 6000 } },
> > > +=09{ 0x52, { 273500, 129000, 6125 } },
> > > +=09{ 0x59, { 294500, 121500, 6000 } },
> > > +=09{ 0x5a, { 311200, 121500, 6000 } },
> > > +=09{ 0x5b, { 327900, 121500, 6000 } },
> > > +=09{ 0xe0, {  28000, 139500, 6250 } },
> > > +=09{ 0xfe, {  47500, 139500, 6250 } },
> > > +=09{ 0xe3, {  66000, 139500, 6250 } },
> > > +=09{ 0xe2, {  84500, 139500, 6250 } },
> > > +=09{ 0x2c, { 140000, 139500, 6250 } },
> > > +=09{ 0xe6, { 195500, 139500, 6250 } },
> > > +=09{ 0x65, { 214000, 139500, 6250 } },
> > > +=09{ 0xe4, { 234000, 139500, 6250 } },
> > > +=09{ 0x50, { 255000, 147000, 6375 } },
> > > +=09{ 0x51, { 273500, 147000, 6375 } },
> > > +=09{ 0x4f, { 292000, 147000, 6375 } },
> > > +=09{ 0x62, { 311200, 139500, 6250 } },
> > > +=09{ 0x63, { 327900, 139500, 6250 } },
> > > +=09{ 0x58, { 344600, 130500, 6125 } },
> > > +};
> > > +
> > > +static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] =3D =
{
> > > +=09{ 0x29, {  25000,  53000, 5000 } },
> > > +=09{ 0x3a, {  41700,  53000, 5000 } },
> > > +=09{ 0x3b, {  58400,  53000, 5000 } },
> > > +=09{ 0x3c, {  75100,  53000, 5000 } },
> > > +=09{ 0x3d, {  91800,  53000, 5000 } },
> > > +=09{ 0x3e, { 108500,  53000, 5000 } },
> > > +=09{ 0x3f, { 125200,  53000, 5000 } },
> > > +=09{ 0x40, { 141900,  53000, 5000 } },
> > > +=09{ 0x41, { 158600,  53000, 5000 } },
> > > +=09{ 0x42, { 175300,  53000, 5000 } },
> > > +=09{ 0x43, { 192000,  53000, 5000 } },
> > > +=09{ 0x44, { 208700,  53000, 5000 } },
> > > +=09{ 0x45, { 225400,  53000, 5000 } },
> > > +=09{ 0xf1, { 242100,  53000, 5000 } },
> > > +=09{ 0x46, { 258800,  53000, 5000 } },
> > > +=09{ 0x4c, { 275500,  53000, 5000 } },
> > > +=09{ 0x4a, { 294500,  53000, 5000 } },
> > > +=09{ 0x4d, { 311200,  53000, 5000 } },
> > > +=09{ 0x4b, { 327900,  53000, 5000 } },
> > > +=09{ 0x4e, { 344600,  53000, 5000 } },
> > > +=09{ 0x35, {  24500,  67500, 5250 } },
> > > +=09{ 0x1e, {  42500,  67500, 5250 } },
> > > +=09{ 0x1f, {  61000,  67500, 5250 } },
> > > +=09{ 0x20, {  79500,  67500, 5250 } },
> > > +=09{ 0x21, {  98000,  67500, 5250 } },
> > > +=09{ 0x22, { 116500,  67500, 5250 } },
> > > +=09{ 0x23, { 135000,  67500, 5250 } },
> > > +=09{ 0x24, { 153500,  67500, 5250 } },
> > > +=09{ 0x25, { 172000,  67500, 5250 } },
> > > +=09{ 0x26, { 190500,  67500, 5250 } },
> > > +=09{ 0x27, { 209000,  67500, 5250 } },
> > > +=09{ 0x2d, { 227500,  67500, 5250 } },
> > > +=09{ 0x2e, { 246000,  67500, 5250 } },
> > > +=09{ 0x2a, { 269500,  67500, 5250 } },
> > > +=09{ 0x53, { 294500,  67500, 5250 } },
> > > +=09{ 0x55, { 311200,  67500, 5250 } },
> > > +=09{ 0x54, { 327900,  67500, 5250 } },
> > > +=09{ 0x56, { 344600,  67500, 5250 } },
> > > +=09{ 0x2b, {  31000,  85500, 5500 } },
> > > +=09{ 0x14, {  51500,  85500, 5500 } },
> > > +=09{ 0x1a, {  70000,  85500, 5500 } },
> > > +=09{ 0x08, {  88500,  85500, 5500 } },
> > > +=09{ 0x15, { 107000,  85500, 5500 } },
> > > +=09{ 0x17, { 125500,  85500, 5500 } },
> > > +=09{ 0x1c, { 144000,  85500, 5500 } },
> > > +=09{ 0x18, { 162500,  85500, 5500 } },
> > > +=09{ 0x0c, { 181000,  85500, 5500 } },
> > > +=09{ 0x12, { 199500,  85500, 5500 } },
> > > +=09{ 0x13, { 218000,  85500, 5500 } },
> > > +=09{ 0x2f, { 234500,  85500, 5500 } },
> > > +=09{ 0x30, { 251000,  85500, 5500 } },
> > > +=09{ 0x5f, { 294500,  85500, 5500 } },
> > > +=09{ 0x60, { 311200,  85500, 5500 } },
> > > +=09{ 0x61, { 327900,  85500, 5500 } },
> > > +=09{ 0x39, {  33000, 103500, 5750 } },
> > > +=09{ 0x04, {  57000, 103500, 5750 } },
> > > +=09{ 0x16, {  75500, 103500, 5750 } },
> > > +=09{ 0x07, {  94000, 103500, 5750 } },
> > > +=09{ 0x09, { 112500, 103500, 5750 } },
> > > +=09{ 0x0a, { 131000, 103500, 5750 } },
> > > +=09{ 0x0b, { 149500, 103500, 5750 } },
> > > +=09{ 0x0d, { 168000, 103500, 5750 } },
> > > +=09{ 0x0e, { 186500, 103500, 5750 } },
> > > +=09{ 0x0f, { 205000, 103500, 5750 } },
> > > +=09{ 0x33, { 223500, 103500, 5750 } },
> > > +=09{ 0x34, { 240000, 103500, 5750 } },
> > > +=09{ 0x32, { 256500, 103500, 5750 } },
> > > +=09{ 0x28, { 271500,  94500, 5750 } },
> > > +=09{ 0x5c, { 294500, 103500, 5750 } },
> > > +=09{ 0x5d, { 311200, 103500, 5750 } },
> > > +=09{ 0x5e, { 327900, 103500, 5750 } },
> > > +=09{ 0x57, { 344600,  94500, 5625 } },
> > > +=09{ 0xe1, {  28000, 121500, 6000 } },
> > > +=09{ 0x64, {  47500, 121500, 6000 } },
> > > +=09{ 0x1d, {  66000, 121500, 6000 } },
> > > +=09{ 0x1b, {  84500, 121500, 6000 } },
> > > +=09{ 0x06, { 103000, 121500, 6000 } },
> > > +=09{ 0x19, { 121500, 121500, 6000 } },
> > > +=09{ 0x05, { 140000, 121500, 6000 } },
> > > +=09{ 0x11, { 158500, 121500, 6000 } },
> > > +=09{ 0x10, { 177000, 121500, 6000 } },
> > > +=09{ 0x36, { 195500, 121500, 6000 } },
> > > +=09{ 0x37, { 214000, 121500, 6000 } },
> > > +=09{ 0x38, { 232500, 121500, 6000 } },
> > > +=09{ 0xe5, { 251500, 121500, 6000 } },
> > > +=09{ 0x52, { 273500, 129000, 6125 } },
> > > +=09{ 0x59, { 294500, 121500, 6000 } },
> > > +=09{ 0x5a, { 311200, 121500, 6000 } },
> > > +=09{ 0x5b, { 327900, 121500, 6000 } },
> > > +=09{ 0xe0, {  28000, 139500, 6250 } },
> > > +=09{ 0xfe, {  47500, 139500, 6250 } },
> > > +=09{ 0xe3, {  66000, 139500, 6250 } },
> > > +=09{ 0xe2, {  84500, 139500, 6250 } },
> > > +=09{ 0x2c, { 140000, 139500, 6250 } },
> > > +=09{ 0xe6, { 195500, 139500, 6250 } },
> > > +=09{ 0x65, { 214000, 139500, 6250 } },
> > > +=09{ 0xe4, { 234000, 139500, 6250 } },
> > > +=09{ 0x50, { 255000, 147000, 6375 } },
> > > +=09{ 0x51, { 273500, 147000, 6375 } },
> > > +=09{ 0x4f, { 292000, 147000, 6375 } },
> > > +=09{ 0x62, { 311200, 139500, 6250 } },
> > > +=09{ 0x63, { 327900, 139500, 6250 } },
> > > +=09{ 0x58, { 344600, 130500, 6125 } },
> > > +};
> > > +
> > > +struct tux_driver_data_t {
> > > +=09struct hid_device *hdev;
> > > +};
> > > +
> > > +struct tux_hdev_driver_data_t {
> > > +=09u8 lamp_count;
> > > +=09const struct tux_kbl_map_entry_t *kbl_map;
> > > +=09u8 next_lamp_id;
> > > +=09union tux_wmi_xx_496in_80out_in_t next_kbl_set_multiple_keys_in;
> > > +};
> > > +
> > > +static int tux_ll_start(struct hid_device *hdev)
> > > +{
> > > +=09struct wmi_device *wdev =3D to_wmi_device(hdev->dev.parent);
> > > +=09struct tux_hdev_driver_data_t *driver_data;
> > > +=09union tux_wmi_xx_8in_80out_out_t out;
> > > +=09union tux_wmi_xx_8in_80out_in_t in;
> > > +=09u8 keyboard_type;
> > > +=09int ret;
> > > +
> > > +=09driver_data =3D devm_kzalloc(&hdev->dev, sizeof(*driver_data),
> > > GFP_KERNEL);
> > > +=09if (!driver_data)
> > > +=09=09return -ENOMEM;
> > > +
> > > +=09in.get_device_status_in.device_type =3D
> > > TUX_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD;
> > > +=09ret =3D tux_wmi_xx_8in_80out(wdev, TUX_GET_DEVICE_STATUS, &in, &o=
ut);
> > > +=09if (ret)
> > > +=09=09return ret;
> > > +
> > > +=09keyboard_type =3D out.get_device_status_out.keyboard_physical_lay=
out;
> > > +=09if (keyboard_type =3D=3D TUX_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_AN=
SII) {
> > > +=09=09driver_data->lamp_count =3D ARRAY_SIZE(sirius_16_ansii_kbl_map=
);
> > > +=09=09driver_data->kbl_map =3D sirius_16_ansii_kbl_map;
> > > +=09} else if (keyboard_type =3D=3D TUX_GET_DEVICE_STATUS_KEYBOARD_LA=
YOUT_ISO)
> > > {
> > > +=09=09driver_data->lamp_count =3D ARRAY_SIZE(sirius_16_iso_kbl_map);
> > > +=09=09driver_data->kbl_map =3D sirius_16_iso_kbl_map;
> > > +=09} else {
> > > +=09=09return -EINVAL;
> > > +=09}
> > > +=09driver_data->next_lamp_id =3D 0;
> > > +
> > > +=09dev_set_drvdata(&hdev->dev, driver_data);
> > > +
> > > +=09return ret;
> > > +}
> > > +
> > > +static void tux_ll_stop(struct hid_device *hdev __always_unused)
> > > +{
> > > +}
> > > +
> > > +static int tux_ll_open(struct hid_device *hdev __always_unused)
> > > +{
> > > +=09return 0;
> > > +}
> > > +
> > > +static void tux_ll_close(struct hid_device *hdev __always_unused)
> > > +{
> > > +}
> > > +
> > > +static int tux_ll_parse(struct hid_device *hdev)
> > > +{
> > > +=09return hid_parse_report(hdev, tux_report_descriptor,
> > > +=09=09=09=09sizeof(tux_report_descriptor));
> > > +}
> > > +
> > > +struct __packed lamp_array_attributes_report_t {
> > > +=09const u8 report_id;
> > > +=09u16 lamp_count;
> > > +=09u32 bounding_box_width_in_micrometers;
> > > +=09u32 bounding_box_height_in_micrometers;
> > > +=09u32 bounding_box_depth_in_micrometers;
> > > +=09u32 lamp_array_kind;
> > > +=09u32 min_update_interval_in_microseconds;
> > > +};
> > > +
> > > +static int handle_lamp_array_attributes_report(struct hid_device *hd=
ev,
> > > +=09=09=09=09=09       struct
> > > lamp_array_attributes_report_t *rep)
> > > +{
> > > +=09struct tux_hdev_driver_data_t *driver_data =3D
> > > dev_get_drvdata(&hdev->dev);
> > > +
> > > +=09rep->lamp_count =3D driver_data->lamp_count;
> > > +=09rep->bounding_box_width_in_micrometers =3D 368000;
> > > +=09rep->bounding_box_height_in_micrometers =3D 266000;
> > > +=09rep->bounding_box_depth_in_micrometers =3D 30000;
> > > +=09/*
> > > +=09 * LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
> > > +=09 * "HID Usage Tables v1.5"
> > > +=09 */
> > > +=09rep->lamp_array_kind =3D 1;
> > > +=09// Some guessed value for interval microseconds
> > > +=09rep->min_update_interval_in_microseconds =3D 500;
> > > +
> > > +=09return sizeof(*rep);
> > > +}
> > > +
> > > +struct __packed lamp_attributes_request_report_t {
> > > +=09const u8 report_id;
> > > +=09u16 lamp_id;
> > > +};
> > > +
> > > +static int handle_lamp_attributes_request_report(struct hid_device *=
hdev,
> > > +=09=09=09=09=09=09 struct
> > > lamp_attributes_request_report_t *rep)
> > > +{
> > > +=09struct tux_hdev_driver_data_t *driver_data =3D
> > > dev_get_drvdata(&hdev->dev);
> > > +
> > > +=09if (rep->lamp_id < driver_data->lamp_count)
> > > +=09=09driver_data->next_lamp_id =3D rep->lamp_id;
> > > +=09else
> > > +=09=09driver_data->next_lamp_id =3D 0;
> > > +
> > > +=09return sizeof(*rep);
> > > +}
> > > +
> > > +struct __packed lamp_attributes_response_report_t {
> > > +=09const u8 report_id;
> > > +=09u16 lamp_id;
> > > +=09u32 position_x_in_micrometers;
> > > +=09u32 position_y_in_micrometers;
> > > +=09u32 position_z_in_micrometers;
> > > +=09u32 update_latency_in_microseconds;
> > > +=09u32 lamp_purpose;
> > > +=09u8 red_level_count;
> > > +=09u8 green_level_count;
> > > +=09u8 blue_level_count;
> > > +=09u8 intensity_level_count;
> > > +=09u8 is_programmable;
> > > +=09u8 input_binding;
> > > +};
> > > +
> > > +static int handle_lamp_attributes_response_report(struct hid_device
> > > *hdev,
> > > +=09=09=09=09=09=09  struct
> > > lamp_attributes_response_report_t *rep)
> > > +{
> > > +=09struct tux_hdev_driver_data_t *driver_data =3D
> > > dev_get_drvdata(&hdev->dev);
> > > +=09u16 lamp_id =3D driver_data->next_lamp_id;
> > > +
> > > +=09rep->lamp_id =3D lamp_id;
> > > +=09// Some guessed value for latency microseconds
> > > +=09rep->update_latency_in_microseconds =3D 100;
> > > +=09/*
> > > +=09 * LampPurposeControl, see "26.3.1 LampPurposes Flags" of
> > > +=09 * "HID Usage Tables v1.5"
> > > +=09 */
> > > +=09rep->lamp_purpose =3D 1;
> > > +=09rep->red_level_count =3D 0xff;
> > > +=09rep->green_level_count =3D 0xff;
> > > +=09rep->blue_level_count =3D 0xff;
> > > +=09rep->intensity_level_count =3D 0xff;
> > > +=09rep->is_programmable =3D 1;
> > > +
> > > +=09if (driver_data->kbl_map[lamp_id].code <=3D 0xe8) {
> > > +=09=09rep->input_binding =3D driver_data->kbl_map[lamp_id].code;
> > > +=09} else {
> > > +=09=09/*
> > > +=09=09 * Everything bigger is reserved/undefined, see
> > > +=09=09 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.5"
> > > +=09=09 * and should return 0, see "26.8.3 Lamp Attributes" of the
> > > same
> > > +=09=09 * document.
> > > +=09=09 */
> > > +=09=09rep->input_binding =3D 0;
> > > +=09}
> > > +=09rep->position_x_in_micrometers =3D driver_data->kbl_map[lamp_id].=
pos.x;
> > > +=09rep->position_y_in_micrometers =3D driver_data->kbl_map[lamp_id].=
pos.y;
> > > +=09rep->position_z_in_micrometers =3D driver_data->kbl_map[lamp_id].=
pos.z;
> > > +
> > > +=09driver_data->next_lamp_id =3D (driver_data->next_lamp_id + 1) %
> > > driver_data->lamp_count;
> > > +
> > > +=09return sizeof(*rep);
> > > +}
> > > +
> > > +#define LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE=09BIT(0)
> > > +
> > > +struct __packed lamp_multi_update_report_t {
> > > +=09const u8 report_id;
> > > +=09u8 lamp_count;
> > > +=09u8 lamp_update_flags;
> > > +=09u16 lamp_id[8];
> > > +=09struct lamp_multi_update_report_update_channel_t {
> > > +=09=09u8 red;
> > > +=09=09u8 green;
> > > +=09=09u8 blue;
> > > +=09=09u8 intensity;
> > > +=09} update_channels[8];
> > > +};
> > > +
> > > +static int handle_lamp_multi_update_report(struct hid_device *hdev,
> > > +=09=09=09=09=09   struct lamp_multi_update_report_t
> > > *rep)
> > > +{
> > > +=09struct tux_hdev_driver_data_t *driver_data =3D
> > > dev_get_drvdata(&hdev->dev);
> > > +=09union tux_wmi_xx_496in_80out_in_t *next =3D
> > > &driver_data->next_kbl_set_multiple_keys_in;
> > > +=09struct tux_kbl_set_multiple_keys_in_rgb_config_t *rgb_configs_j;
> > > +=09struct wmi_device *wdev =3D to_wmi_device(hdev->dev.parent);
> > > +=09union tux_wmi_xx_496in_80out_out_t out;
> > > +=09u8 key_id, key_id_j, intensity_i, red_i, green_i, blue_i;
> > > +=09int ret;
> > > +
> > > +=09/*
> > > +=09 * Catching misformatted lamp_multi_update_report and fail silent=
ly
> > > +=09 * according to "HID Usage Tables v1.5"
> > > +=09 */
> > > +=09for (unsigned int i =3D 0; i < rep->lamp_count; ++i) {
> > > +=09=09if (rep->lamp_id[i] > driver_data->lamp_count) {
> > > +=09=09=09hid_dbg(hdev, "Out of bounds lamp_id in
> > > lamp_multi_update_report. Skipping whole report!\n");
> > > +=09=09=09return sizeof(*rep);
> > > +=09=09}
> > > +
> > > +=09=09for (unsigned int j =3D i + 1; j < rep->lamp_count; ++j) {
> > > +=09=09=09if (rep->lamp_id[i] =3D=3D rep->lamp_id[j]) {
> > > +=09=09=09=09hid_dbg(hdev, "Duplicate lamp_id in
> > > lamp_multi_update_report. Skipping whole report!\n");
> > > +=09=09=09=09return sizeof(*rep);
> > > +=09=09=09}
> > > +=09=09}
> > > +=09}
> > > +
> > > +=09for (unsigned int i =3D 0; i < rep->lamp_count; ++i) {
> > > +=09=09key_id =3D driver_data->kbl_map[rep->lamp_id[i]].code;
> > > +
> > > +=09=09for (unsigned int j =3D 0;
> > > +=09=09     j <
> > > TUX_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX;
> > > +=09=09     ++j) {
> > > +=09=09=09rgb_configs_j =3D
> > > &next->kbl_set_multiple_keys_in.rgb_configs[j];
> > > +=09=09=09key_id_j =3D rgb_configs_j->key_id;
> > > +=09=09=09if (key_id_j !=3D 0x00 && key_id_j !=3D key_id)
> > > +=09=09=09=09continue;
> > > +
> > > +=09=09=09if (key_id_j =3D=3D 0x00)
> > > +=09=09=09=09next->kbl_set_multiple_keys_in.rgb_configs_cnt
> > > =3D
> > > +=09=09=09=09=09j + 1;
> > > +=09=09=09rgb_configs_j->key_id =3D key_id;
> > > +=09=09=09/*
> > > +=09=09=09 * While this driver respects intensity_update_channel
> > > +=09=09=09 * according to "HID Usage Tables v1.5" also on RGB
> > > +=09=09=09 * leds, the Microsoft MacroPad reference
> > > implementation
> > > +=09=09=09 *
> > > (https://github.com/microsoft/RP2040MacropadHidSample
> > > +=09=09=09 * 1d6c3ad) does not and ignores it. If it turns out
> > > +=09=09=09 * that Windows writes intensity =3D 0 for RGB leds
> > > +=09=09=09 * instead of intensity =3D 255, this driver should also
> > > +=09=09=09 * ignore the intensity_update_channel.
> > > +=09=09=09 */
> > > +=09=09=09intensity_i =3D rep->update_channels[i].intensity;
> > > +=09=09=09red_i =3D rep->update_channels[i].red;
> > > +=09=09=09green_i =3D rep->update_channels[i].green;
> > > +=09=09=09blue_i =3D rep->update_channels[i].blue;
> > > +=09=09=09rgb_configs_j->red =3D red_i * intensity_i / 0xff;
> > > +=09=09=09rgb_configs_j->green =3D green_i * intensity_i / 0xff;
> > > +=09=09=09rgb_configs_j->blue =3D blue_i * intensity_i / 0xff;
> > > +
> > > +=09=09=09break;
> > > +=09=09}
> > > +=09}
> > > +
> > > +=09if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLE=
TE) {
> > > +=09=09ret =3D tux_wmi_xx_496in_80out(wdev, TUX_KBL_SET_MULTIPLE_KEYS=
,
> > > +=09=09=09=09=09     next, &out);
> > > +=09=09memset(next, 0, sizeof(*next));
> > > +=09=09if (ret)
> > > +=09=09=09return ret;
> > > +=09}
> > > +
> > > +=09return sizeof(*rep);
> > > +}
> > > +
> > > +struct __packed lamp_range_update_report_t {
> > > +=09const u8 report_id;
> > > +=09u8 lamp_update_flags;
> > > +=09u16 lamp_id_start;
> > > +=09u16 lamp_id_end;
> > > +=09u8 red_update_channel;
> > > +=09u8 green_update_channel;
> > > +=09u8 blue_update_channel;
> > > +=09u8 intensity_update_channel;
> > I think you should create a top level type for "update_channel" or
> > preferrably "channel_update" as that feels more natural order for the
> > words. Then use that struct both here and inside
> > lamp_multi_update_report_t.
> >=20
> > And you could even assign the entire thing on one line to the other whe=
n
> > they're of same type.
>=20
> Names an one-level-ness are directly taken from the hid spec
> https://usb.org/sites/default/files/hut1_6.pdf so I would like to keep it=
 that
> way to not lose that close connection here.
>
> Please give feedback if that is ok for v9

Hi Werner,

I feel that following letter of the spec too closely here makes things=20
clearly harder for code than it needs to be.

Besides, even in the spec itself, they call this group of values a "RGBI=20
tuple" in sections 26.11.1 and 26.11.2 rather than given those as=20
individual entries (because that obviously makes sense and is easier!).=20
How about calling that rgbi_tuple_t or lamp_rgbi_tuple_t, that would still=
=20
align with the spec?

BTW, when referring to 400+ pages spec/doc, I'd appreciate more precise=20
reference (yes, I do look). Also, it would be useful to reference that=20
doc in the changelog too (again, please be precise enough that one doesn't=
=20
need to search through the entire document, and include also version=20
information so that if the spec gets updated and section numbering=20
changes, the update doesn't end up invalidating the reference).

--
 i.
--8323328-84003940-1745580750=:950--

