Return-Path: <linux-input+bounces-12007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F36CFA9CE2D
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 18:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF6221894D4B
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 16:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8E31A3146;
	Fri, 25 Apr 2025 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="CKBUKyfq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0569192D68;
	Fri, 25 Apr 2025 16:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745598652; cv=none; b=MUvtUxSkCcU4xhqp3ZHZga4kozqGDYpmN+e4f0hdFJB9QteMjISDHlAK+59B0B+4IDo4Peam8+st6mV03NATb+cf+nFFM4vTXAi+oG+LdOCiFx6FlDQP3CQExnUjel+Xuh/HkZ7AT9rrX7gLOR8g0UoK5gq4gUjA0HQZxBRANW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745598652; c=relaxed/simple;
	bh=1m7WpQ+Yn81GhJdK1lBAn7P2WHm58oPEAf0cO/jL/aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBuvHlvrXYXccbWEfqda0fAojIR0WG+gnmHQPvxgOqVJlPTBJb4D1ABjou4wy+D2TNNtVZfkyoEhX0Rv4fvHy5Q8deEGtzhBVvhHtvYlD4BmBxCSPdWUq4/7o9Ns7lbnFlwDUjTZC6lfCsZrWiXjDkRbix4GrNySNke4lSREyXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=CKBUKyfq; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1E8702FC0052;
	Fri, 25 Apr 2025 18:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1745598643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TPUG9oLvgofhrlDjwI9esrcuNQhPvvxI9xghmZQrlSI=;
	b=CKBUKyfqR8scSJYJzGMYv4N+qw/CAER0u1sT1PhHAmxe4IWEfdHtZtF3aGwOgspFnlVhlX
	6uGDlCq+np0AtW2WvMdnbBB9ktuIpLer8hVMYM+ZhzrfIw10PlDYnI8xyFqUGP83brGfBC
	iKYsv6tcV2JnLgh5EOIGg2Oio/XSamM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <4b2d3ffa-571b-4825-910c-3fea8a9df6d2@tuxedocomputers.com>
Date: Fri, 25 Apr 2025 18:30:42 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
 linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org
References: <20250423153804.64395-1-wse@tuxedocomputers.com>
 <20250423153804.64395-2-wse@tuxedocomputers.com>
 <24860b01-f42e-295f-334f-74ecbf642d40@linux.intel.com>
 <d6d052ed-0a4d-4e8b-b1a2-07cce892a1c7@tuxedocomputers.com>
 <0aa1797b-69b0-83df-f9fa-b6d541c7a62a@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <0aa1797b-69b0-83df-f9fa-b6d541c7a62a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 25.04.25 um 13:32 schrieb Ilpo Järvinen:
> On Thu, 24 Apr 2025, Werner Sembach wrote:
>
>> Am 24.04.25 um 15:26 schrieb Ilpo Järvinen:
>>> On Wed, 23 Apr 2025, Werner Sembach wrote:
>>>
>>>> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
>>>> controllable RGB keyboard backlight. The firmware API for it is
>>>> implemented
>>>> via WMI.
>>>>
>>>> To make the backlight userspace configurable this driver emulates a
>>>> LampArray HID device and translates the input from hidraw to the
>>>> corresponding WMI calls. This is a new approach as the leds subsystem
>>>> lacks
>>>> a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
>>>> needs to be established.
>>>>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> ---
>>>>    MAINTAINERS                                 |   6 +
>>>>    drivers/platform/x86/Kconfig                |   2 +
>>>>    drivers/platform/x86/Makefile               |   3 +
>>>>    drivers/platform/x86/tuxedo/Kconfig         |   8 +
>>>>    drivers/platform/x86/tuxedo/Makefile        |   8 +
>>>>    drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
>>>>    drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
>>>>    drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 916 ++++++++++++++++++++
>>>>    drivers/platform/x86/tuxedo/nb04/wmi_util.c |  91 ++
>>>>    drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
>>>>    10 files changed, 1168 insertions(+)
>>>>    create mode 100644 drivers/platform/x86/tuxedo/Kconfig
>>>>    create mode 100644 drivers/platform/x86/tuxedo/Makefile
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
>>>>    create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 00e94bec401e1..c1f7460c246ad 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -24217,6 +24217,12 @@ T:	git
>>>> git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbostat
>>>>    F:	tools/power/x86/turbostat/
>>>>    F:	tools/testing/selftests/turbostat/
>>>>    +TUXEDO DRIVERS
>>>> +M:	Werner Sembach <wse@tuxedocomputers.com>
>>>> +L:	platform-driver-x86@vger.kernel.org
>>>> +S:	Supported
>>>> +F:	drivers/platform/x86/tuxedo/
>>>> +
>>>>    TW5864 VIDEO4LINUX DRIVER
>>>>    M:	Bluecherry Maintainers <maintainers@bluecherrydvr.com>
>>>>    M:	Andrey Utkin <andrey.utkin@corp.bluecherry.net>
>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>> index 0258dd879d64b..58b258cde4fdb 100644
>>>> --- a/drivers/platform/x86/Kconfig
>>>> +++ b/drivers/platform/x86/Kconfig
>>>> @@ -1186,6 +1186,8 @@ config SEL3350_PLATFORM
>>>>    	  To compile this driver as a module, choose M here: the module
>>>>    	  will be called sel3350-platform.
>>>>    +source "drivers/platform/x86/tuxedo/Kconfig"
>>>> +
>>>>    endif # X86_PLATFORM_DEVICES
>>>>      config P2SB
>>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>>>> index e1b1429470674..1562dcd7ad9a5 100644
>>>> --- a/drivers/platform/x86/Makefile
>>>> +++ b/drivers/platform/x86/Makefile
>>>> @@ -153,3 +153,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)		+=
>>>> winmate-fm07-keys.o
>>>>      # SEL
>>>>    obj-$(CONFIG_SEL3350_PLATFORM)		+= sel3350-platform.o
>>>> +
>>>> +# TUXEDO
>>>> +obj-y					+= tuxedo/
>>>> diff --git a/drivers/platform/x86/tuxedo/Kconfig
>>>> b/drivers/platform/x86/tuxedo/Kconfig
>>>> new file mode 100644
>>>> index 0000000000000..80be0947dddc4
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/Kconfig
>>>> @@ -0,0 +1,8 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>>> +#
>>>> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
>>>> +#
>>>> +# TUXEDO X86 Platform Specific Drivers
>>>> +#
>>>> +
>>>> +source "drivers/platform/x86/tuxedo/nb04/Kconfig"
>>>> diff --git a/drivers/platform/x86/tuxedo/Makefile
>>>> b/drivers/platform/x86/tuxedo/Makefile
>>>> new file mode 100644
>>>> index 0000000000000..0afe0d0f455e7
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/Makefile
>>>> @@ -0,0 +1,8 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>>> +#
>>>> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
>>>> +#
>>>> +# TUXEDO X86 Platform Specific Drivers
>>>> +#
>>>> +
>>>> +obj-y	+= nb04/
>>>> diff --git a/drivers/platform/x86/tuxedo/nb04/Kconfig
>>>> b/drivers/platform/x86/tuxedo/nb04/Kconfig
>>>> new file mode 100644
>>>> index 0000000000000..411c46c9a1cf0
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/nb04/Kconfig
>>>> @@ -0,0 +1,15 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>>> +#
>>>> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
>>>> +#
>>>> +# TUXEDO X86 Platform Specific Drivers
>>>> +#
>>>> +
>>>> +config TUXEDO_NB04_WMI_AB
>>>> +	tristate "TUXEDO NB04 WMI AB Platform Driver"
>>>> +	help
>>>> +	  This driver implements the WMI AB device found on TUXEDO notebooks
>>>> +	  with board vendor NB04. This enables keyboard backlight control via
>>>> a
>>>> +	  virtual HID LampArray device.
>>>> +
>>>> +	  When compiled as a module it will be called tuxedo_nb04_wmi_ab.
>>>> diff --git a/drivers/platform/x86/tuxedo/nb04/Makefile
>>>> b/drivers/platform/x86/tuxedo/nb04/Makefile
>>>> new file mode 100644
>>>> index 0000000000000..c963e0d605057
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/nb04/Makefile
>>>> @@ -0,0 +1,10 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-or-later
>>>> +#
>>>> +# Copyright (C) 2024-2025 Werner Sembach wse@tuxedocomputers.com
>>>> +#
>>>> +# TUXEDO X86 Platform Specific Drivers
>>>> +#
>>>> +
>>>> +tuxedo_nb04_wmi_ab-y			:= wmi_ab.o
>>>> +tuxedo_nb04_wmi_ab-y			+= wmi_util.o
>>>> +obj-$(CONFIG_TUXEDO_NB04_WMI_AB)	+= tuxedo_nb04_wmi_ab.o
>>>> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>>>> b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>>>> new file mode 100644
>>>> index 0000000000000..05eb1d22692f9
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
>>>> @@ -0,0 +1,916 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * This driver implements the WMI AB device found on TUXEDO notebooks
>>>> with board
>>>> + * vendor NB04.
>>>> + *
>>>> + * Copyright (C) 2024-2025 Werner Sembach <wse@tuxedocomputers.com>
>>>> + */
>>>> +
>>>> +#include <linux/dmi.h>
>>>> +#include <linux/hid.h>
>>>> +#include <linux/minmax.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/wmi.h>
>>>> +
>>>> +#include "wmi_util.h"
>>>> +
>>>> +static const struct wmi_device_id tuxedo_nb04_wmi_ab_device_ids[] = {
>>>> +	{ .guid_string = "80C9BAA6-AC48-4538-9234-9F81A55E7C85" },
>>>> +	{ }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(wmi, tuxedo_nb04_wmi_ab_device_ids);
>>>> +
>>>> +enum {
>>>> +	LAMP_ARRAY_ATTRIBUTES_REPORT_ID		= 0x01,
>>>> +	LAMP_ATTRIBUTES_REQUEST_REPORT_ID	= 0x02,
>>>> +	LAMP_ATTRIBUTES_RESPONSE_REPORT_ID	= 0x03,
>>>> +	LAMP_MULTI_UPDATE_REPORT_ID		= 0x04,
>>>> +	LAMP_RANGE_UPDATE_REPORT_ID		= 0x05,
>>>> +	LAMP_ARRAY_CONTROL_REPORT_ID		= 0x06,
>>>> +};
>>>> +
>>>> +static u8 tux_report_descriptor[327] = {
>>>> +	0x05, 0x59,			// Usage Page (Lighting and
>>>> Illumination)
>>>> +	0x09, 0x01,			// Usage (Lamp Array)
>>>> +	0xa1, 0x01,			// Collection (Application)
>>>> +	0x85, LAMP_ARRAY_ATTRIBUTES_REPORT_ID, //  Report ID (1)
>>>> +	0x09, 0x02,			//  Usage (Lamp Array Attributes
>>>> Report)
>>>> +	0xa1, 0x02,			//  Collection (Logical)
>>>> +	0x09, 0x03,			//   Usage (Lamp Count)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
>>>> +	0x75, 0x10,			//   Report Size (16)
>>>> +	0x95, 0x01,			//   Report Count (1)
>>>> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
>>>> +	0x09, 0x04,			//   Usage (Bounding Box Width In
>>>> Micrometers)
>>>> +	0x09, 0x05,			//   Usage (Bounding Box Height In
>>>> Micrometers)
>>>> +	0x09, 0x06,			//   Usage (Bounding Box Depth In
>>>> Micrometers)
>>>> +	0x09, 0x07,			//   Usage (Lamp Array Kind)
>>>> +	0x09, 0x08,			//   Usage (Min Update Interval In
>>>> Microseconds)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
>>>> +	0x75, 0x20,			//   Report Size (32)
>>>> +	0x95, 0x05,			//   Report Count (5)
>>>> +	0xb1, 0x03,			//   Feature (Cnst,Var,Abs)
>>>> +	0xc0,				//  End Collection
>>>> +	0x85, LAMP_ATTRIBUTES_REQUEST_REPORT_ID, //  Report ID (2)
>>>> +	0x09, 0x20,			//  Usage (Lamp Attributes Request
>>>> Report)
>>>> +	0xa1, 0x02,			//  Collection (Logical)
>>>> +	0x09, 0x21,			//   Usage (Lamp Id)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
>>>> +	0x75, 0x10,			//   Report Size (16)
>>>> +	0x95, 0x01,			//   Report Count (1)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0xc0,				//  End Collection
>>>> +	0x85, LAMP_ATTRIBUTES_RESPONSE_REPORT_ID, //  Report ID (3)
>>>> +	0x09, 0x22,			//  Usage (Lamp Attributes Response
>>>> Report)
>>>> +	0xa1, 0x02,			//  Collection (Logical)
>>>> +	0x09, 0x21,			//   Usage (Lamp Id)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
>>>> +	0x75, 0x10,			//   Report Size (16)
>>>> +	0x95, 0x01,			//   Report Count (1)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0x09, 0x23,			//   Usage (Position X In Micrometers)
>>>> +	0x09, 0x24,			//   Usage (Position Y In Micrometers)
>>>> +	0x09, 0x25,			//   Usage (Position Z In Micrometers)
>>>> +	0x09, 0x27,			//   Usage (Update Latency In
>>>> Microseconds)
>>>> +	0x09, 0x26,			//   Usage (Lamp Purposes)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x27, 0xff, 0xff, 0xff, 0x7f,	//   Logical Maximum (2147483647)
>>>> +	0x75, 0x20,			//   Report Size (32)
>>>> +	0x95, 0x05,			//   Report Count (5)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0x09, 0x28,			//   Usage (Red Level Count)
>>>> +	0x09, 0x29,			//   Usage (Green Level Count)
>>>> +	0x09, 0x2a,			//   Usage (Blue Level Count)
>>>> +	0x09, 0x2b,			//   Usage (Intensity Level Count)
>>>> +	0x09, 0x2c,			//   Usage (Is Programmable)
>>>> +	0x09, 0x2d,			//   Usage (Input Binding)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
>>>> +	0x75, 0x08,			//   Report Size (8)
>>>> +	0x95, 0x06,			//   Report Count (6)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0xc0,				//  End Collection
>>>> +	0x85, LAMP_MULTI_UPDATE_REPORT_ID, //  Report ID (4)
>>>> +	0x09, 0x50,			//  Usage (Lamp Multi Update Report)
>>>> +	0xa1, 0x02,			//  Collection (Logical)
>>>> +	0x09, 0x03,			//   Usage (Lamp Count)
>>>> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x25, 0x08,			//   Logical Maximum (8)
>>>> +	0x75, 0x08,			//   Report Size (8)
>>>> +	0x95, 0x02,			//   Report Count (2)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0x09, 0x21,			//   Usage (Lamp Id)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
>>>> +	0x75, 0x10,			//   Report Size (16)
>>>> +	0x95, 0x08,			//   Report Count (8)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
>>>> +	0x75, 0x08,			//   Report Size (8)
>>>> +	0x95, 0x20,			//   Report Count (32)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0xc0,				//  End Collection
>>>> +	0x85, LAMP_RANGE_UPDATE_REPORT_ID, //  Report ID (5)
>>>> +	0x09, 0x60,			//  Usage (Lamp Range Update Report)
>>>> +	0xa1, 0x02,			//  Collection (Logical)
>>>> +	0x09, 0x55,			//   Usage (Lamp Update Flags)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x25, 0x08,			//   Logical Maximum (8)
>>>> +	0x75, 0x08,			//   Report Size (8)
>>>> +	0x95, 0x01,			//   Report Count (1)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0x09, 0x61,			//   Usage (Lamp Id Start)
>>>> +	0x09, 0x62,			//   Usage (Lamp Id End)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x27, 0xff, 0xff, 0x00, 0x00,	//   Logical Maximum (65535)
>>>> +	0x75, 0x10,			//   Report Size (16)
>>>> +	0x95, 0x02,			//   Report Count (2)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0x09, 0x51,			//   Usage (Red Update Channel)
>>>> +	0x09, 0x52,			//   Usage (Green Update Channel)
>>>> +	0x09, 0x53,			//   Usage (Blue Update Channel)
>>>> +	0x09, 0x54,			//   Usage (Intensity Update Channel)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x26, 0xff, 0x00,		//   Logical Maximum (255)
>>>> +	0x75, 0x08,			//   Report Size (8)
>>>> +	0x95, 0x04,			//   Report Count (4)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0xc0,				//  End Collection
>>>> +	0x85, LAMP_ARRAY_CONTROL_REPORT_ID, //  Report ID (6)
>>>> +	0x09, 0x70,			//  Usage (Lamp Array Control Report)
>>>> +	0xa1, 0x02,			//  Collection (Logical)
>>>> +	0x09, 0x71,			//   Usage (Autonomous Mode)
>>>> +	0x15, 0x00,			//   Logical Minimum (0)
>>>> +	0x25, 0x01,			//   Logical Maximum (1)
>>>> +	0x75, 0x08,			//   Report Size (8)
>>>> +	0x95, 0x01,			//   Report Count (1)
>>>> +	0xb1, 0x02,			//   Feature (Data,Var,Abs)
>>>> +	0xc0,				//  End Collection
>>>> +	0xc0				// End Collection
>>>> +};
>>>> +
>>>> +struct tux_kbl_map_entry_t {
>>>> +	u8 code;
>>>> +	struct {
>>>> +		u32 x;
>>>> +		u32 y;
>>>> +		u32 z;
>>>> +	} pos;
>>>> +};
>>>> +
>>>> +static const struct tux_kbl_map_entry_t sirius_16_ansii_kbl_map[] = {
>>>> +	{ 0x29, {  25000,  53000, 5000 } },
>>>> +	{ 0x3a, {  41700,  53000, 5000 } },
>>>> +	{ 0x3b, {  58400,  53000, 5000 } },
>>>> +	{ 0x3c, {  75100,  53000, 5000 } },
>>>> +	{ 0x3d, {  91800,  53000, 5000 } },
>>>> +	{ 0x3e, { 108500,  53000, 5000 } },
>>>> +	{ 0x3f, { 125200,  53000, 5000 } },
>>>> +	{ 0x40, { 141900,  53000, 5000 } },
>>>> +	{ 0x41, { 158600,  53000, 5000 } },
>>>> +	{ 0x42, { 175300,  53000, 5000 } },
>>>> +	{ 0x43, { 192000,  53000, 5000 } },
>>>> +	{ 0x44, { 208700,  53000, 5000 } },
>>>> +	{ 0x45, { 225400,  53000, 5000 } },
>>>> +	{ 0xf1, { 242100,  53000, 5000 } },
>>>> +	{ 0x46, { 258800,  53000, 5000 } },
>>>> +	{ 0x4c, { 275500,  53000, 5000 } },
>>>> +	{ 0x4a, { 294500,  53000, 5000 } },
>>>> +	{ 0x4d, { 311200,  53000, 5000 } },
>>>> +	{ 0x4b, { 327900,  53000, 5000 } },
>>>> +	{ 0x4e, { 344600,  53000, 5000 } },
>>>> +	{ 0x35, {  24500,  67500, 5250 } },
>>>> +	{ 0x1e, {  42500,  67500, 5250 } },
>>>> +	{ 0x1f, {  61000,  67500, 5250 } },
>>>> +	{ 0x20, {  79500,  67500, 5250 } },
>>>> +	{ 0x21, {  98000,  67500, 5250 } },
>>>> +	{ 0x22, { 116500,  67500, 5250 } },
>>>> +	{ 0x23, { 135000,  67500, 5250 } },
>>>> +	{ 0x24, { 153500,  67500, 5250 } },
>>>> +	{ 0x25, { 172000,  67500, 5250 } },
>>>> +	{ 0x26, { 190500,  67500, 5250 } },
>>>> +	{ 0x27, { 209000,  67500, 5250 } },
>>>> +	{ 0x2d, { 227500,  67500, 5250 } },
>>>> +	{ 0x2e, { 246000,  67500, 5250 } },
>>>> +	{ 0x2a, { 269500,  67500, 5250 } },
>>>> +	{ 0x53, { 294500,  67500, 5250 } },
>>>> +	{ 0x55, { 311200,  67500, 5250 } },
>>>> +	{ 0x54, { 327900,  67500, 5250 } },
>>>> +	{ 0x56, { 344600,  67500, 5250 } },
>>>> +	{ 0x2b, {  31000,  85500, 5500 } },
>>>> +	{ 0x14, {  51500,  85500, 5500 } },
>>>> +	{ 0x1a, {  70000,  85500, 5500 } },
>>>> +	{ 0x08, {  88500,  85500, 5500 } },
>>>> +	{ 0x15, { 107000,  85500, 5500 } },
>>>> +	{ 0x17, { 125500,  85500, 5500 } },
>>>> +	{ 0x1c, { 144000,  85500, 5500 } },
>>>> +	{ 0x18, { 162500,  85500, 5500 } },
>>>> +	{ 0x0c, { 181000,  85500, 5500 } },
>>>> +	{ 0x12, { 199500,  85500, 5500 } },
>>>> +	{ 0x13, { 218000,  85500, 5500 } },
>>>> +	{ 0x2f, { 236500,  85500, 5500 } },
>>>> +	{ 0x30, { 255000,  85500, 5500 } },
>>>> +	{ 0x31, { 273500,  85500, 5500 } },
>>>> +	{ 0x5f, { 294500,  85500, 5500 } },
>>>> +	{ 0x60, { 311200,  85500, 5500 } },
>>>> +	{ 0x61, { 327900,  85500, 5500 } },
>>>> +	{ 0x39, {  33000, 103500, 5750 } },
>>>> +	{ 0x04, {  57000, 103500, 5750 } },
>>>> +	{ 0x16, {  75500, 103500, 5750 } },
>>>> +	{ 0x07, {  94000, 103500, 5750 } },
>>>> +	{ 0x09, { 112500, 103500, 5750 } },
>>>> +	{ 0x0a, { 131000, 103500, 5750 } },
>>>> +	{ 0x0b, { 149500, 103500, 5750 } },
>>>> +	{ 0x0d, { 168000, 103500, 5750 } },
>>>> +	{ 0x0e, { 186500, 103500, 5750 } },
>>>> +	{ 0x0f, { 205000, 103500, 5750 } },
>>>> +	{ 0x33, { 223500, 103500, 5750 } },
>>>> +	{ 0x34, { 242000, 103500, 5750 } },
>>>> +	{ 0x28, { 267500, 103500, 5750 } },
>>>> +	{ 0x5c, { 294500, 103500, 5750 } },
>>>> +	{ 0x5d, { 311200, 103500, 5750 } },
>>>> +	{ 0x5e, { 327900, 103500, 5750 } },
>>>> +	{ 0x57, { 344600,  94500, 5625 } },
>>>> +	{ 0xe1, {  37000, 121500, 6000 } },
>>>> +	{ 0x1d, {  66000, 121500, 6000 } },
>>>> +	{ 0x1b, {  84500, 121500, 6000 } },
>>>> +	{ 0x06, { 103000, 121500, 6000 } },
>>>> +	{ 0x19, { 121500, 121500, 6000 } },
>>>> +	{ 0x05, { 140000, 121500, 6000 } },
>>>> +	{ 0x11, { 158500, 121500, 6000 } },
>>>> +	{ 0x10, { 177000, 121500, 6000 } },
>>>> +	{ 0x36, { 195500, 121500, 6000 } },
>>>> +	{ 0x37, { 214000, 121500, 6000 } },
>>>> +	{ 0x38, { 232500, 121500, 6000 } },
>>>> +	{ 0xe5, { 251500, 121500, 6000 } },
>>>> +	{ 0x52, { 273500, 129000, 6125 } },
>>>> +	{ 0x59, { 294500, 121500, 6000 } },
>>>> +	{ 0x5a, { 311200, 121500, 6000 } },
>>>> +	{ 0x5b, { 327900, 121500, 6000 } },
>>>> +	{ 0xe0, {  28000, 139500, 6250 } },
>>>> +	{ 0xfe, {  47500, 139500, 6250 } },
>>>> +	{ 0xe3, {  66000, 139500, 6250 } },
>>>> +	{ 0xe2, {  84500, 139500, 6250 } },
>>>> +	{ 0x2c, { 140000, 139500, 6250 } },
>>>> +	{ 0xe6, { 195500, 139500, 6250 } },
>>>> +	{ 0x65, { 214000, 139500, 6250 } },
>>>> +	{ 0xe4, { 234000, 139500, 6250 } },
>>>> +	{ 0x50, { 255000, 147000, 6375 } },
>>>> +	{ 0x51, { 273500, 147000, 6375 } },
>>>> +	{ 0x4f, { 292000, 147000, 6375 } },
>>>> +	{ 0x62, { 311200, 139500, 6250 } },
>>>> +	{ 0x63, { 327900, 139500, 6250 } },
>>>> +	{ 0x58, { 344600, 130500, 6125 } },
>>>> +};
>>>> +
>>>> +static const struct tux_kbl_map_entry_t sirius_16_iso_kbl_map[] = {
>>>> +	{ 0x29, {  25000,  53000, 5000 } },
>>>> +	{ 0x3a, {  41700,  53000, 5000 } },
>>>> +	{ 0x3b, {  58400,  53000, 5000 } },
>>>> +	{ 0x3c, {  75100,  53000, 5000 } },
>>>> +	{ 0x3d, {  91800,  53000, 5000 } },
>>>> +	{ 0x3e, { 108500,  53000, 5000 } },
>>>> +	{ 0x3f, { 125200,  53000, 5000 } },
>>>> +	{ 0x40, { 141900,  53000, 5000 } },
>>>> +	{ 0x41, { 158600,  53000, 5000 } },
>>>> +	{ 0x42, { 175300,  53000, 5000 } },
>>>> +	{ 0x43, { 192000,  53000, 5000 } },
>>>> +	{ 0x44, { 208700,  53000, 5000 } },
>>>> +	{ 0x45, { 225400,  53000, 5000 } },
>>>> +	{ 0xf1, { 242100,  53000, 5000 } },
>>>> +	{ 0x46, { 258800,  53000, 5000 } },
>>>> +	{ 0x4c, { 275500,  53000, 5000 } },
>>>> +	{ 0x4a, { 294500,  53000, 5000 } },
>>>> +	{ 0x4d, { 311200,  53000, 5000 } },
>>>> +	{ 0x4b, { 327900,  53000, 5000 } },
>>>> +	{ 0x4e, { 344600,  53000, 5000 } },
>>>> +	{ 0x35, {  24500,  67500, 5250 } },
>>>> +	{ 0x1e, {  42500,  67500, 5250 } },
>>>> +	{ 0x1f, {  61000,  67500, 5250 } },
>>>> +	{ 0x20, {  79500,  67500, 5250 } },
>>>> +	{ 0x21, {  98000,  67500, 5250 } },
>>>> +	{ 0x22, { 116500,  67500, 5250 } },
>>>> +	{ 0x23, { 135000,  67500, 5250 } },
>>>> +	{ 0x24, { 153500,  67500, 5250 } },
>>>> +	{ 0x25, { 172000,  67500, 5250 } },
>>>> +	{ 0x26, { 190500,  67500, 5250 } },
>>>> +	{ 0x27, { 209000,  67500, 5250 } },
>>>> +	{ 0x2d, { 227500,  67500, 5250 } },
>>>> +	{ 0x2e, { 246000,  67500, 5250 } },
>>>> +	{ 0x2a, { 269500,  67500, 5250 } },
>>>> +	{ 0x53, { 294500,  67500, 5250 } },
>>>> +	{ 0x55, { 311200,  67500, 5250 } },
>>>> +	{ 0x54, { 327900,  67500, 5250 } },
>>>> +	{ 0x56, { 344600,  67500, 5250 } },
>>>> +	{ 0x2b, {  31000,  85500, 5500 } },
>>>> +	{ 0x14, {  51500,  85500, 5500 } },
>>>> +	{ 0x1a, {  70000,  85500, 5500 } },
>>>> +	{ 0x08, {  88500,  85500, 5500 } },
>>>> +	{ 0x15, { 107000,  85500, 5500 } },
>>>> +	{ 0x17, { 125500,  85500, 5500 } },
>>>> +	{ 0x1c, { 144000,  85500, 5500 } },
>>>> +	{ 0x18, { 162500,  85500, 5500 } },
>>>> +	{ 0x0c, { 181000,  85500, 5500 } },
>>>> +	{ 0x12, { 199500,  85500, 5500 } },
>>>> +	{ 0x13, { 218000,  85500, 5500 } },
>>>> +	{ 0x2f, { 234500,  85500, 5500 } },
>>>> +	{ 0x30, { 251000,  85500, 5500 } },
>>>> +	{ 0x5f, { 294500,  85500, 5500 } },
>>>> +	{ 0x60, { 311200,  85500, 5500 } },
>>>> +	{ 0x61, { 327900,  85500, 5500 } },
>>>> +	{ 0x39, {  33000, 103500, 5750 } },
>>>> +	{ 0x04, {  57000, 103500, 5750 } },
>>>> +	{ 0x16, {  75500, 103500, 5750 } },
>>>> +	{ 0x07, {  94000, 103500, 5750 } },
>>>> +	{ 0x09, { 112500, 103500, 5750 } },
>>>> +	{ 0x0a, { 131000, 103500, 5750 } },
>>>> +	{ 0x0b, { 149500, 103500, 5750 } },
>>>> +	{ 0x0d, { 168000, 103500, 5750 } },
>>>> +	{ 0x0e, { 186500, 103500, 5750 } },
>>>> +	{ 0x0f, { 205000, 103500, 5750 } },
>>>> +	{ 0x33, { 223500, 103500, 5750 } },
>>>> +	{ 0x34, { 240000, 103500, 5750 } },
>>>> +	{ 0x32, { 256500, 103500, 5750 } },
>>>> +	{ 0x28, { 271500,  94500, 5750 } },
>>>> +	{ 0x5c, { 294500, 103500, 5750 } },
>>>> +	{ 0x5d, { 311200, 103500, 5750 } },
>>>> +	{ 0x5e, { 327900, 103500, 5750 } },
>>>> +	{ 0x57, { 344600,  94500, 5625 } },
>>>> +	{ 0xe1, {  28000, 121500, 6000 } },
>>>> +	{ 0x64, {  47500, 121500, 6000 } },
>>>> +	{ 0x1d, {  66000, 121500, 6000 } },
>>>> +	{ 0x1b, {  84500, 121500, 6000 } },
>>>> +	{ 0x06, { 103000, 121500, 6000 } },
>>>> +	{ 0x19, { 121500, 121500, 6000 } },
>>>> +	{ 0x05, { 140000, 121500, 6000 } },
>>>> +	{ 0x11, { 158500, 121500, 6000 } },
>>>> +	{ 0x10, { 177000, 121500, 6000 } },
>>>> +	{ 0x36, { 195500, 121500, 6000 } },
>>>> +	{ 0x37, { 214000, 121500, 6000 } },
>>>> +	{ 0x38, { 232500, 121500, 6000 } },
>>>> +	{ 0xe5, { 251500, 121500, 6000 } },
>>>> +	{ 0x52, { 273500, 129000, 6125 } },
>>>> +	{ 0x59, { 294500, 121500, 6000 } },
>>>> +	{ 0x5a, { 311200, 121500, 6000 } },
>>>> +	{ 0x5b, { 327900, 121500, 6000 } },
>>>> +	{ 0xe0, {  28000, 139500, 6250 } },
>>>> +	{ 0xfe, {  47500, 139500, 6250 } },
>>>> +	{ 0xe3, {  66000, 139500, 6250 } },
>>>> +	{ 0xe2, {  84500, 139500, 6250 } },
>>>> +	{ 0x2c, { 140000, 139500, 6250 } },
>>>> +	{ 0xe6, { 195500, 139500, 6250 } },
>>>> +	{ 0x65, { 214000, 139500, 6250 } },
>>>> +	{ 0xe4, { 234000, 139500, 6250 } },
>>>> +	{ 0x50, { 255000, 147000, 6375 } },
>>>> +	{ 0x51, { 273500, 147000, 6375 } },
>>>> +	{ 0x4f, { 292000, 147000, 6375 } },
>>>> +	{ 0x62, { 311200, 139500, 6250 } },
>>>> +	{ 0x63, { 327900, 139500, 6250 } },
>>>> +	{ 0x58, { 344600, 130500, 6125 } },
>>>> +};
>>>> +
>>>> +struct tux_driver_data_t {
>>>> +	struct hid_device *hdev;
>>>> +};
>>>> +
>>>> +struct tux_hdev_driver_data_t {
>>>> +	u8 lamp_count;
>>>> +	const struct tux_kbl_map_entry_t *kbl_map;
>>>> +	u8 next_lamp_id;
>>>> +	union tux_wmi_xx_496in_80out_in_t next_kbl_set_multiple_keys_in;
>>>> +};
>>>> +
>>>> +static int tux_ll_start(struct hid_device *hdev)
>>>> +{
>>>> +	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
>>>> +	struct tux_hdev_driver_data_t *driver_data;
>>>> +	union tux_wmi_xx_8in_80out_out_t out;
>>>> +	union tux_wmi_xx_8in_80out_in_t in;
>>>> +	u8 keyboard_type;
>>>> +	int ret;
>>>> +
>>>> +	driver_data = devm_kzalloc(&hdev->dev, sizeof(*driver_data),
>>>> GFP_KERNEL);
>>>> +	if (!driver_data)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	in.get_device_status_in.device_type =
>>>> TUX_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD;
>>>> +	ret = tux_wmi_xx_8in_80out(wdev, TUX_GET_DEVICE_STATUS, &in, &out);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	keyboard_type = out.get_device_status_out.keyboard_physical_layout;
>>>> +	if (keyboard_type == TUX_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII) {
>>>> +		driver_data->lamp_count = ARRAY_SIZE(sirius_16_ansii_kbl_map);
>>>> +		driver_data->kbl_map = sirius_16_ansii_kbl_map;
>>>> +	} else if (keyboard_type == TUX_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
>>>> {
>>>> +		driver_data->lamp_count = ARRAY_SIZE(sirius_16_iso_kbl_map);
>>>> +		driver_data->kbl_map = sirius_16_iso_kbl_map;
>>>> +	} else {
>>>> +		return -EINVAL;
>>>> +	}
>>>> +	driver_data->next_lamp_id = 0;
>>>> +
>>>> +	dev_set_drvdata(&hdev->dev, driver_data);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +static void tux_ll_stop(struct hid_device *hdev __always_unused)
>>>> +{
>>>> +}
>>>> +
>>>> +static int tux_ll_open(struct hid_device *hdev __always_unused)
>>>> +{
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void tux_ll_close(struct hid_device *hdev __always_unused)
>>>> +{
>>>> +}
>>>> +
>>>> +static int tux_ll_parse(struct hid_device *hdev)
>>>> +{
>>>> +	return hid_parse_report(hdev, tux_report_descriptor,
>>>> +				sizeof(tux_report_descriptor));
>>>> +}
>>>> +
>>>> +struct __packed lamp_array_attributes_report_t {
>>>> +	const u8 report_id;
>>>> +	u16 lamp_count;
>>>> +	u32 bounding_box_width_in_micrometers;
>>>> +	u32 bounding_box_height_in_micrometers;
>>>> +	u32 bounding_box_depth_in_micrometers;
>>>> +	u32 lamp_array_kind;
>>>> +	u32 min_update_interval_in_microseconds;
>>>> +};
>>>> +
>>>> +static int handle_lamp_array_attributes_report(struct hid_device *hdev,
>>>> +					       struct
>>>> lamp_array_attributes_report_t *rep)
>>>> +{
>>>> +	struct tux_hdev_driver_data_t *driver_data =
>>>> dev_get_drvdata(&hdev->dev);
>>>> +
>>>> +	rep->lamp_count = driver_data->lamp_count;
>>>> +	rep->bounding_box_width_in_micrometers = 368000;
>>>> +	rep->bounding_box_height_in_micrometers = 266000;
>>>> +	rep->bounding_box_depth_in_micrometers = 30000;
>>>> +	/*
>>>> +	 * LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of
>>>> +	 * "HID Usage Tables v1.5"
>>>> +	 */
>>>> +	rep->lamp_array_kind = 1;
>>>> +	// Some guessed value for interval microseconds
>>>> +	rep->min_update_interval_in_microseconds = 500;
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>>>> +
>>>> +struct __packed lamp_attributes_request_report_t {
>>>> +	const u8 report_id;
>>>> +	u16 lamp_id;
>>>> +};
>>>> +
>>>> +static int handle_lamp_attributes_request_report(struct hid_device *hdev,
>>>> +						 struct
>>>> lamp_attributes_request_report_t *rep)
>>>> +{
>>>> +	struct tux_hdev_driver_data_t *driver_data =
>>>> dev_get_drvdata(&hdev->dev);
>>>> +
>>>> +	if (rep->lamp_id < driver_data->lamp_count)
>>>> +		driver_data->next_lamp_id = rep->lamp_id;
>>>> +	else
>>>> +		driver_data->next_lamp_id = 0;
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>>>> +
>>>> +struct __packed lamp_attributes_response_report_t {
>>>> +	const u8 report_id;
>>>> +	u16 lamp_id;
>>>> +	u32 position_x_in_micrometers;
>>>> +	u32 position_y_in_micrometers;
>>>> +	u32 position_z_in_micrometers;
>>>> +	u32 update_latency_in_microseconds;
>>>> +	u32 lamp_purpose;
>>>> +	u8 red_level_count;
>>>> +	u8 green_level_count;
>>>> +	u8 blue_level_count;
>>>> +	u8 intensity_level_count;
>>>> +	u8 is_programmable;
>>>> +	u8 input_binding;
>>>> +};
>>>> +
>>>> +static int handle_lamp_attributes_response_report(struct hid_device
>>>> *hdev,
>>>> +						  struct
>>>> lamp_attributes_response_report_t *rep)
>>>> +{
>>>> +	struct tux_hdev_driver_data_t *driver_data =
>>>> dev_get_drvdata(&hdev->dev);
>>>> +	u16 lamp_id = driver_data->next_lamp_id;
>>>> +
>>>> +	rep->lamp_id = lamp_id;
>>>> +	// Some guessed value for latency microseconds
>>>> +	rep->update_latency_in_microseconds = 100;
>>>> +	/*
>>>> +	 * LampPurposeControl, see "26.3.1 LampPurposes Flags" of
>>>> +	 * "HID Usage Tables v1.5"
>>>> +	 */
>>>> +	rep->lamp_purpose = 1;
>>>> +	rep->red_level_count = 0xff;
>>>> +	rep->green_level_count = 0xff;
>>>> +	rep->blue_level_count = 0xff;
>>>> +	rep->intensity_level_count = 0xff;
>>>> +	rep->is_programmable = 1;
>>>> +
>>>> +	if (driver_data->kbl_map[lamp_id].code <= 0xe8) {
>>>> +		rep->input_binding = driver_data->kbl_map[lamp_id].code;
>>>> +	} else {
>>>> +		/*
>>>> +		 * Everything bigger is reserved/undefined, see
>>>> +		 * "10 Keyboard/Keypad Page (0x07)" of "HID Usage Tables v1.5"
>>>> +		 * and should return 0, see "26.8.3 Lamp Attributes" of the
>>>> same
>>>> +		 * document.
>>>> +		 */
>>>> +		rep->input_binding = 0;
>>>> +	}
>>>> +	rep->position_x_in_micrometers = driver_data->kbl_map[lamp_id].pos.x;
>>>> +	rep->position_y_in_micrometers = driver_data->kbl_map[lamp_id].pos.y;
>>>> +	rep->position_z_in_micrometers = driver_data->kbl_map[lamp_id].pos.z;
>>>> +
>>>> +	driver_data->next_lamp_id = (driver_data->next_lamp_id + 1) %
>>>> driver_data->lamp_count;
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>>>> +
>>>> +#define LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE	BIT(0)
>>>> +
>>>> +struct __packed lamp_multi_update_report_t {
>>>> +	const u8 report_id;
>>>> +	u8 lamp_count;
>>>> +	u8 lamp_update_flags;
>>>> +	u16 lamp_id[8];
>>>> +	struct lamp_multi_update_report_update_channel_t {
>>>> +		u8 red;
>>>> +		u8 green;
>>>> +		u8 blue;
>>>> +		u8 intensity;
>>>> +	} update_channels[8];
>>>> +};
>>>> +
>>>> +static int handle_lamp_multi_update_report(struct hid_device *hdev,
>>>> +					   struct lamp_multi_update_report_t
>>>> *rep)
>>>> +{
>>>> +	struct tux_hdev_driver_data_t *driver_data =
>>>> dev_get_drvdata(&hdev->dev);
>>>> +	union tux_wmi_xx_496in_80out_in_t *next =
>>>> &driver_data->next_kbl_set_multiple_keys_in;
>>>> +	struct tux_kbl_set_multiple_keys_in_rgb_config_t *rgb_configs_j;
>>>> +	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
>>>> +	union tux_wmi_xx_496in_80out_out_t out;
>>>> +	u8 key_id, key_id_j, intensity_i, red_i, green_i, blue_i;
>>>> +	int ret;
>>>> +
>>>> +	/*
>>>> +	 * Catching misformatted lamp_multi_update_report and fail silently
>>>> +	 * according to "HID Usage Tables v1.5"
>>>> +	 */
>>>> +	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
>>>> +		if (rep->lamp_id[i] > driver_data->lamp_count) {
>>>> +			hid_dbg(hdev, "Out of bounds lamp_id in
>>>> lamp_multi_update_report. Skipping whole report!\n");
>>>> +			return sizeof(*rep);
>>>> +		}
>>>> +
>>>> +		for (unsigned int j = i + 1; j < rep->lamp_count; ++j) {
>>>> +			if (rep->lamp_id[i] == rep->lamp_id[j]) {
>>>> +				hid_dbg(hdev, "Duplicate lamp_id in
>>>> lamp_multi_update_report. Skipping whole report!\n");
>>>> +				return sizeof(*rep);
>>>> +			}
>>>> +		}
>>>> +	}
>>>> +
>>>> +	for (unsigned int i = 0; i < rep->lamp_count; ++i) {
>>>> +		key_id = driver_data->kbl_map[rep->lamp_id[i]].code;
>>>> +
>>>> +		for (unsigned int j = 0;
>>>> +		     j <
>>>> TUX_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX;
>>>> +		     ++j) {
>>>> +			rgb_configs_j =
>>>> &next->kbl_set_multiple_keys_in.rgb_configs[j];
>>>> +			key_id_j = rgb_configs_j->key_id;
>>>> +			if (key_id_j != 0x00 && key_id_j != key_id)
>>>> +				continue;
>>>> +
>>>> +			if (key_id_j == 0x00)
>>>> +				next->kbl_set_multiple_keys_in.rgb_configs_cnt
>>>> =
>>>> +					j + 1;
>>>> +			rgb_configs_j->key_id = key_id;
>>>> +			/*
>>>> +			 * While this driver respects intensity_update_channel
>>>> +			 * according to "HID Usage Tables v1.5" also on RGB
>>>> +			 * leds, the Microsoft MacroPad reference
>>>> implementation
>>>> +			 *
>>>> (https://github.com/microsoft/RP2040MacropadHidSample
>>>> +			 * 1d6c3ad) does not and ignores it. If it turns out
>>>> +			 * that Windows writes intensity = 0 for RGB leds
>>>> +			 * instead of intensity = 255, this driver should also
>>>> +			 * ignore the intensity_update_channel.
>>>> +			 */
>>>> +			intensity_i = rep->update_channels[i].intensity;
>>>> +			red_i = rep->update_channels[i].red;
>>>> +			green_i = rep->update_channels[i].green;
>>>> +			blue_i = rep->update_channels[i].blue;
>>>> +			rgb_configs_j->red = red_i * intensity_i / 0xff;
>>>> +			rgb_configs_j->green = green_i * intensity_i / 0xff;
>>>> +			rgb_configs_j->blue = blue_i * intensity_i / 0xff;
>>>> +
>>>> +			break;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE) {
>>>> +		ret = tux_wmi_xx_496in_80out(wdev, TUX_KBL_SET_MULTIPLE_KEYS,
>>>> +					     next, &out);
>>>> +		memset(next, 0, sizeof(*next));
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return sizeof(*rep);
>>>> +}
>>>> +
>>>> +struct __packed lamp_range_update_report_t {
>>>> +	const u8 report_id;
>>>> +	u8 lamp_update_flags;
>>>> +	u16 lamp_id_start;
>>>> +	u16 lamp_id_end;
>>>> +	u8 red_update_channel;
>>>> +	u8 green_update_channel;
>>>> +	u8 blue_update_channel;
>>>> +	u8 intensity_update_channel;
>>> I think you should create a top level type for "update_channel" or
>>> preferrably "channel_update" as that feels more natural order for the
>>> words. Then use that struct both here and inside
>>> lamp_multi_update_report_t.
>>>
>>> And you could even assign the entire thing on one line to the other when
>>> they're of same type.
>> Names an one-level-ness are directly taken from the hid spec
>> https://usb.org/sites/default/files/hut1_6.pdf so I would like to keep it that
>> way to not lose that close connection here.
>>
>> Please give feedback if that is ok for v9
> Hi Werner,
>
> I feel that following letter of the spec too closely here makes things
> clearly harder for code than it needs to be.
>
> Besides, even in the spec itself, they call this group of values a "RGBI
> tuple" in sections 26.11.1 and 26.11.2 rather than given those as
> individual entries (because that obviously makes sense and is easier!).
> How about calling that rgbi_tuple_t or lamp_rgbi_tuple_t, that would still
> align with the spec?
ok
>
> BTW, when referring to 400+ pages spec/doc, I'd appreciate more precise
> reference (yes, I do look).
sorry, wanted to add the chapter name but forgot somehow
> Also, it would be useful to reference that
> doc in the changelog too (again, please be precise enough that one doesn't
> need to search through the entire document, and include also version
> information so that if the spec gets updated and section numbering
> changes, the update doesn't end up invalidating the reference).
ok
>
> --
>   i.

