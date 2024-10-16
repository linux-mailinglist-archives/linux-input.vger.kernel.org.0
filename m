Return-Path: <linux-input+bounces-7499-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52F9A0D77
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 16:57:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A54F280D1C
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 14:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAF420CCC3;
	Wed, 16 Oct 2024 14:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alWLdZ6c"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0202F208D95;
	Wed, 16 Oct 2024 14:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090642; cv=none; b=Yvz7uonTluXl9znXatm74qO2f+PcbaAp8ICJp3ZG87e/Z27uuz8WOBBLN50P1lQwGGDLl3K4LVd4uPqUmRfPD5r2UUruZfRY4ZALIfUTkkwe3OCl8taFw49Pb2njDG6u4vCbQok0Tn71e4HVRj7iyB4QQpJcukwV60gVdtE47t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090642; c=relaxed/simple;
	bh=Rkek+vc0rsS3QPVuDLzn5qdY9vhvoOzpF3xW+gM/ygk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iI4aZP+0IT0lfezbSD7gto5HTf+liyQDIKiu/yHPrIXYYNtoONGPp2eI0cUwt+5/qf+D1r62JDttMuN/Tpqsf1a56w14hdM+6qIja8Thp35s8FJwSVotKnzjazMI/Giy0rBHyy48NdWwhlgHwbaXGCPDuP9mbSinzeqRJxwcqfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alWLdZ6c; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729090640; x=1760626640;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Rkek+vc0rsS3QPVuDLzn5qdY9vhvoOzpF3xW+gM/ygk=;
  b=alWLdZ6cJErkV8FIEsRPxTa/bT4y9n5F7/BPw2GAiWMzj+3h+74S3YjC
   sXfTMYVsR/sotSSnB3rlQhYuyxOA3xJeJbzQJOTmQxVKgzDDNn7ZwDY4a
   4FGslG9uBA3yi5OBVoV8n74e4lIl6wlypEpJnPU95Ug6kniaeAYR/+yIm
   ppyN0QDWMOR4pJDheK3Fgd+lq8VPzGwkEov4zNvO4ou+sOXPsaa0mlmAN
   79rsupZ6bpXeh5zY6HjcQeLLnaxKiTsBUYZE/ZiGhJKP+q8nLXpjqkGIn
   h+Yyk8od6P4expQyXIWCAJHOOUgs1Rb23daJiqmfSB9m48kUXfYSHSqtd
   A==;
X-CSE-ConnectionGUID: OEB8/LFVQqehe6rhFHsvvg==
X-CSE-MsgGUID: u6HTnDMUTiOA4O8y0eyZlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28327066"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28327066"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 07:57:16 -0700
X-CSE-ConnectionGUID: jy4K82N/SgGQTHMeUroKsw==
X-CSE-MsgGUID: BIXuWV26Tue+bHgQT2mYYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="77862719"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 07:54:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Oct 2024 17:54:15 +0300 (EEST)
To: "Luke D. Jones" <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    jikos@kernel.org, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    superm1@kernel.org
Subject: Re: [PATCH v6 3/9] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
In-Reply-To: <20240930000046.51388-4-luke@ljones.dev>
Message-ID: <6edbf781-b959-e2b5-bbb5-24282f239fc4@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev> <20240930000046.51388-4-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-311202661-1729090455=:1010"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-311202661-1729090455=:1010
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 30 Sep 2024, Luke D. Jones wrote:

> The fw_attributes_class provides a much cleaner interface to all of the
> attributes introduced to asus-wmi. This patch moves all of these extra
> attributes over to fw_attributes_class, and shifts the bulk of these
> definitions to a new kernel module to reduce the clutter of asus-wmi
> with the intention of deprecating the asus-wmi attributes in future.
>=20
> The work applies only to WMI methods which don't have a clearly defined
> place within the sysfs and as a result ended up lumped together in
> /sys/devices/platform/asus-nb-wmi/ with no standard API.
>=20
> Where possible the fw attrs now implement defaults, min, max, scalar,
> choices, etc. As en example dgpu_disable becomes:
>=20
> /sys/class/firmware-attributes/asus-armoury/attributes/dgpu_disable/
> =E2=94=9C=E2=94=80=E2=94=80 current_value
> =E2=94=9C=E2=94=80=E2=94=80 display_name
> =E2=94=9C=E2=94=80=E2=94=80 possible_values
> =E2=94=94=E2=94=80=E2=94=80 type
>=20
> as do other attributes.
>=20
> The ppt_* based attributes are removed in this initial patch as the
> implementation is somewhat broken due to the WMI methods requiring a
> set of limits on the values accepted (which is not provided by WMI).
>=20
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/Kconfig               |  12 +
>  drivers/platform/x86/Makefile              |   1 +
>  drivers/platform/x86/asus-armoury.c        | 593 +++++++++++++++++++++
>  drivers/platform/x86/asus-armoury.h        | 146 +++++
>  drivers/platform/x86/asus-wmi.c            |   4 -
>  include/linux/platform_data/x86/asus-wmi.h |   3 +
>  6 files changed, 755 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/platform/x86/asus-armoury.c
>  create mode 100644 drivers/platform/x86/asus-armoury.h
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 3875abba5a79..80ec8b45022d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -265,6 +265,18 @@ config ASUS_WIRELESS
>  =09  If you choose to compile this driver as a module the module will be
>  =09  called asus-wireless.
> =20
> +config ASUS_ARMOURY
> +=09tristate "ASUS Armoury driver"
> +=09depends on ASUS_WMI
> +=09select FW_ATTR_CLASS
> +=09help
> +=09  Say Y here if you have a WMI aware Asus machine and would like to u=
se the
> +=09  firmware_attributes API to control various settings typically expos=
ed in
> +=09  the ASUS Armoury Crate application available on Windows.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called asus-armoury.
> +
>  config ASUS_WMI
>  =09tristate "ASUS WMI Driver"
>  =09depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b142947067..fe3e7e7dede8 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_APPLE_GMUX)=09+=3D apple-gmux.o
>  # ASUS
>  obj-$(CONFIG_ASUS_LAPTOP)=09+=3D asus-laptop.o
>  obj-$(CONFIG_ASUS_WIRELESS)=09+=3D asus-wireless.o
> +obj-$(CONFIG_ASUS_ARMOURY)=09+=3D asus-armoury.o
>  obj-$(CONFIG_ASUS_WMI)=09=09+=3D asus-wmi.o
>  obj-$(CONFIG_ASUS_NB_WMI)=09+=3D asus-nb-wmi.o
>  obj-$(CONFIG_ASUS_TF103C_DOCK)=09+=3D asus-tf103c-dock.o
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/a=
sus-armoury.c
> new file mode 100644
> index 000000000000..0085f1b112ab
> --- /dev/null
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -0,0 +1,593 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Asus Armoury (WMI) attributes driver. This driver uses the fw_attribu=
tes
> + * class to expose the various WMI functions that many gaming and some
> + * non-gaming ASUS laptops have available.
> + * These typically don't fit anywhere else in the sysfs such as under LE=
D class,
> + * hwmon or other, and are set in Windows using the ASUS Armoury Crate t=
ool.
> + *
> + * Copyright(C) 2010 Intel Corporation.

Does something from 2010 really have relevance to this? I won't oppose if=
=20
you feel you want to keep it but looking through the early commits into=20
drivers/platform/x86/eeepc-wmi.c and what's left of them makes me quite=20
skeptical.

> + * Copyright(C) 2024-2024 Luke Jones <luke@ljones.dev>

2024 seems enough.

> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> +#include <linux/kernel.h>
> +#include <linux/kmod.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_data/x86/asus-wmi.h>
> +#include <linux/types.h>
> +#include <linux/acpi.h>
> +
> +#include "asus-armoury.h"
> +#include "firmware_attributes_class.h"
> +
> +#define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
> +
> +#define ASUS_MINI_LED_MODE_MASK 0x03
> +/* Standard modes for devices with only on/off */
> +#define ASUS_MINI_LED_OFF 0x00
> +#define ASUS_MINI_LED_ON 0x01
> +/* Like "on" but the effect is more vibrant or brighter */
> +#define ASUS_MINI_LED_STRONG_MODE 0x02
> +/* New modes for devices with 3 mini-led mode types */
> +#define ASUS_MINI_LED_2024_WEAK 0x00
> +#define ASUS_MINI_LED_2024_STRONG 0x01
> +#define ASUS_MINI_LED_2024_OFF 0x02
> +
> +/* Default limits for tunables available on ASUS ROG laptops */
> +#define NVIDIA_BOOST_MIN 5
> +#define NVIDIA_BOOST_MAX 25
> +#define NVIDIA_TEMP_MIN 75
> +#define NVIDIA_TEMP_MAX 87
> +#define PPT_CPU_LIMIT_MIN 5
> +#define PPT_CPU_LIMIT_MAX 150
> +#define PPT_CPU_LIMIT_DEFAULT 80
> +#define PPT_PLATFORM_MIN 5
> +#define PPT_PLATFORM_MAX 100
> +#define PPT_PLATFORM_DEFAULT 80

Please try to align the defined values better above.

> +static const struct class *fw_attr_class;
> +
> +struct asus_armoury_priv {
> +=09struct device *fw_attr_dev;
> +=09struct kset *fw_attr_kset;
> +
> +=09u32 mini_led_dev_id;
> +=09u32 gpu_mux_dev_id;
> +
> +=09struct mutex mutex;

Please document what this protects.

> +};
> +
> +static struct asus_armoury_priv asus_armoury =3D { .mutex =3D __MUTEX_IN=
ITIALIZER(
> +=09=09=09=09=09=09=09 asus_armoury.mutex) };

If you need to break lines, put the members on own lines as usual:

static struct asus_armoury_priv asus_armoury =3D {
=09.mutex =3D ...,
};

> +
> +struct fw_attrs_group {
> +=09bool pending_reboot;
> +};
> +
> +static struct fw_attrs_group fw_attrs =3D {
> +=09.pending_reboot =3D false,
> +};
> +
> +struct asus_attr_group {
> +=09const struct attribute_group *attr_group;
> +=09u32 wmi_devid;
> +};
> +
> +static bool asus_wmi_is_present(u32 dev_id)
> +{
> +=09u32 retval;
> +=09int status;
> +
> +=09status =3D asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0=
, &retval);
> +=09pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id, re=
tval);
> +
> +=09return status =3D=3D 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
> +}
> +
> +static void asus_set_reboot_and_signal_event(void)
> +{
> +=09fw_attrs.pending_reboot =3D true;
> +=09kobject_uevent(&asus_armoury.fw_attr_dev->kobj, KOBJ_CHANGE);
> +}
> +
> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_att=
ribute *attr, char *buf)
> +{
> +=09return sysfs_emit(buf, "%d\n", fw_attrs.pending_reboot);
> +}
> +
> +static struct kobj_attribute pending_reboot =3D __ATTR_RO(pending_reboot=
);
> +
> +static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> +{
> +=09return !strcmp(attr->attr.name, "gpu_mux_mode");
> +}
> +
> +/**
> + * attr_int_store() - Generic store function for use with most WMI funct=
ions.
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to read from, this is parsed to `int` type.
> + * @count: Required by sysfs attribute macros, pass in from the callee a=
ttr.
> + * @min: Minimum accepted value. Below this returns -EINVAL.
> + * @max: Maximum accepted value. Above this returns -EINVAL.
> + * @store_value: Pointer to where the parsed value should be stored.
> + * @wmi_dev: The WMI function ID to use.
> + *

Lacks description of what it does (enven a single sentence would make=20
this much more useful as a whole). The WMI error value discussion below is=
=20
fine but it feels out-of-place if that's only thing there is.

> + * The WMI functions available on most ASUS laptops return a 1 as "succe=
ss", and
> + * a 0 as failed. However some functions can return n > 1 for additional=
 errors.
> + * The function currently treats all values which are not 1 as errors, i=
gnoring
> + * the possible differences in WMI error returns.
> + *
> + * Returns: Either count, or an error.
> + */
> +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribut=
e *attr, const char *buf,
> +=09=09=09      size_t count, u32 min, u32 max, u32 *store_value, u32 wmi=
_dev)
> +{
> +=09u32 result, value;
> +=09int err;
> +
> +=09err =3D kstrtouint(buf, 10, &value);

I'd prefer the function be named "..._uint_..." instead of "int" to not=20
lose this part of the behavior of the wrapper.

> +=09if (err)
> +=09=09return err;
> +
> +=09if (value < min || value > max)
> +=09=09return -EINVAL;
> +

> +=09mutex_lock(&asus_armoury.mutex);
> +=09err =3D asus_wmi_set_devstate(wmi_dev, value, &result);
> +=09mutex_unlock(&asus_armoury.mutex);

Please wrap this so you don't have to do the lock in every single=20
callsite. You can use guard() in the wrapper.

> +=09if (err) {
> +=09=09pr_err("Failed to set %s: %d\n", attr->attr.name, err);
> +=09=09return err;
> +=09}
> +
> +=09if (result !=3D 1) {
> +=09=09pr_err("Failed to set %s (result): 0x%x\n", attr->attr.name, resul=
t);
> +=09=09return -EIO;
> +=09}
> +
> +=09if (store_value !=3D NULL)
> +=09=09*store_value =3D value;
> +=09sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +=09if (asus_bios_requires_reboot(attr))
> +=09=09asus_set_reboot_and_signal_event();
> +
> +=09return count;
> +}
> +
> +/* Mini-LED mode *******************************************************=
*******/
> +static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
> +=09=09=09=09=09=09struct kobj_attribute *attr, char *buf)
> +{
> +=09u32 value;
> +=09int err;
> +
> +=09err =3D asus_wmi_get_devstate_dsts(asus_armoury.mini_led_dev_id, &val=
ue);
> +=09if (err)
> +=09=09return err;
> +
> +=09value &=3D ASUS_MINI_LED_MODE_MASK;
> +
> +=09/*
> +=09 * Remap the mode values to match previous generation mini-LED. The l=
ast gen
> +=09 * WMI 0 =3D=3D off, while on this version WMI 2 =3D=3D off (flipped)=
=2E
> +=09 */
> +=09if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MODE2=
) {
> +=09=09switch (value) {
> +=09=09case ASUS_MINI_LED_2024_WEAK:
> +=09=09=09value =3D ASUS_MINI_LED_ON;
> +=09=09=09break;
> +=09=09case ASUS_MINI_LED_2024_STRONG:
> +=09=09=09value =3D ASUS_MINI_LED_STRONG_MODE;
> +=09=09=09break;
> +=09=09case ASUS_MINI_LED_2024_OFF:
> +=09=09=09value =3D ASUS_MINI_LED_OFF;
> +=09=09=09break;
> +=09=09}
> +=09}
> +
> +=09return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
> +=09=09=09=09=09=09 struct kobj_attribute *attr, const char *buf,
> +=09=09=09=09=09=09 size_t count)

I'd put the buf & count on the same line. They kind of belong together and=
=20
the lines would be more equal in length too.

> +{
> +=09int result, err;
> +=09u32 mode;
> +
> +=09err =3D kstrtou32(buf, 10, &mode);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MODE =
&&
> +=09    mode > ASUS_MINI_LED_ON)
> +=09=09return -EINVAL;
> +=09if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MODE2=
 &&
> +=09    mode > ASUS_MINI_LED_STRONG_MODE)
> +=09=09return -EINVAL;
> +
> +=09/*
> +=09 * Remap the mode values so expected behaviour is the same as the las=
t
> +=09 * generation of mini-LED with 0 =3D=3D off, 1 =3D=3D on.
> +=09 */
> +=09if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MODE2=
) {
> +=09=09switch (mode) {
> +=09=09case ASUS_MINI_LED_OFF:
> +=09=09=09mode =3D ASUS_MINI_LED_2024_OFF;
> +=09=09=09break;
> +=09=09case ASUS_MINI_LED_ON:
> +=09=09=09mode =3D ASUS_MINI_LED_2024_WEAK;
> +=09=09=09break;
> +=09=09case ASUS_MINI_LED_STRONG_MODE:
> +=09=09=09mode =3D ASUS_MINI_LED_2024_STRONG;
> +=09=09=09break;
> +=09=09}
> +=09}
> +
> +=09mutex_lock(&asus_armoury.mutex);
> +=09err =3D asus_wmi_set_devstate(asus_armoury.mini_led_dev_id, mode, &re=
sult);
> +=09mutex_unlock(&asus_armoury.mutex);
> +=09if (err) {
> +=09=09pr_warn("Failed to set mini-LED: %d\n", err);
> +=09=09return err;
> +=09}
> +
> +=09if (result !=3D 1) {
> +=09=09pr_warn("Failed to set mini-LED mode (result): 0x%x\n", result);
> +=09=09return -EIO;
> +=09}
> +
> +=09sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +=09return count;
> +}
> +
> +static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
> +=09=09=09=09=09=09  struct kobj_attribute *attr, char *buf)
> +{
> +=09switch (asus_armoury.mini_led_dev_id) {
> +=09case ASUS_WMI_DEVID_MINI_LED_MODE:
> +=09=09return sysfs_emit(buf, "0;1\n");
> +=09case ASUS_WMI_DEVID_MINI_LED_MODE2:
> +=09=09return sysfs_emit(buf, "0;1;2\n");
> +=09}
> +
> +=09return sysfs_emit(buf, "0\n");
> +}
> +
> +ATTR_GROUP_ENUM_CUSTOM(mini_led_mode, "mini_led_mode", "Set the mini-LED=
 backlight mode");
> +
> +static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
> +=09=09=09=09=09=09struct kobj_attribute *attr, const char *buf,
> +=09=09=09=09=09=09size_t count)
> +{
> +=09int result, err;
> +=09u32 optimus;
> +
> +=09err =3D kstrtou32(buf, 10, &optimus);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (optimus > 1)
> +=09=09return -EINVAL;
> +
> +=09if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
> +=09=09err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_DGPU, &result);
> +=09=09if (err)
> +=09=09=09return err;
> +=09=09if (result && !optimus) {
> +=09=09=09err =3D -ENODEV;
> +=09=09=09pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled:=
 %02X %02X %d\n",
> +=09=09=09=09result, optimus, err);

Printing an error code you synthetized right above the print doesn't feel=
=20
very useful. With that removed, you can just use return -ENODEV;

> +=09=09=09return err;
> +=09=09}
> +=09}
> +
> +=09if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
> +=09=09err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU, &result);
> +=09=09if (err)
> +=09=09=09return err;
> +=09=09if (result && !optimus) {
> +=09=09=09err =3D -ENODEV;
> +=09=09=09pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled: =
%d\n",
> +=09=09=09=09err);

Ditto.

> +=09=09=09return err;
> +=09=09}
> +=09}
> +
> +=09mutex_lock(&asus_armoury.mutex);
> +=09err =3D asus_wmi_set_devstate(asus_armoury.gpu_mux_dev_id, optimus, &=
result);
> +=09mutex_unlock(&asus_armoury.mutex);
> +=09if (err) {
> +=09=09pr_err("Failed to set GPU MUX mode: %d\n", err);
> +=09=09return err;
> +=09}
> +=09/* !1 is considered a fail by ASUS */
> +=09if (result !=3D 1) {
> +=09=09pr_warn("Failed to set GPU MUX mode (result): 0x%x\n", result);
> +=09=09return -EIO;
> +=09}

I wonder if the asus_wmi_set_devstate wrapper should also handle these=20
error checks + prints. They seem pretty much duplicated except for the=20
error string that could be provided as an argument.

> +
> +=09sysfs_notify(kobj, NULL, attr->attr.name);
> +=09asus_set_reboot_and_signal_event();
> +
> +=09return count;
> +}
> +WMI_SHOW_INT(gpu_mux_mode_current_value, "%d\n", asus_armoury.gpu_mux_de=
v_id);
> +ATTR_GROUP_BOOL_CUSTOM(gpu_mux_mode, "gpu_mux_mode", "Set the GPU displa=
y MUX mode");
> +
> +/*
> + * A user may be required to store the value twice, typical store first,=
 then
> + * rescan PCI bus to activate power, then store a second time to save co=
rrectly.
> + * The reason for this is that an extra code path in the ACPI is enabled=
 when
> + * the device and bus are powered.
> + */
> +static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
> +=09=09=09=09=09=09struct kobj_attribute *attr, const char *buf,
> +=09=09=09=09=09=09size_t count)
> +{
> +=09int result, err;
> +=09u32 disable;
> +
> +=09err =3D kstrtou32(buf, 10, &disable);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (disable > 1)
> +=09=09return -EINVAL;
> +
> +=09if (asus_armoury.gpu_mux_dev_id) {
> +=09=09err =3D asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &r=
esult);
> +=09=09if (err)
> +=09=09=09return err;
> +=09=09if (!result && disable) {
> +=09=09=09err =3D -ENODEV;
> +=09=09=09pr_warn("Can not disable dGPU when the MUX is in dGPU mode: %d\=
n", err);
> +=09=09=09return err;
> +=09=09}
> +=09}
> +
> +=09mutex_lock(&asus_armoury.mutex);
> +=09err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, disable, &result);
> +=09mutex_unlock(&asus_armoury.mutex);
> +=09if (err) {
> +=09=09pr_warn("Failed to set dGPU disable: %d\n", err);
> +=09=09return err;
> +=09}
> +
> +=09if (result !=3D 1) {
> +=09=09pr_warn("Failed to set dGPU disable (result): 0x%x\n", result);
> +=09=09return -EIO;
> +=09}
> +
> +=09sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +=09return count;
> +}
> +WMI_SHOW_INT(dgpu_disable_current_value, "%d\n", ASUS_WMI_DEVID_DGPU);
> +ATTR_GROUP_BOOL_CUSTOM(dgpu_disable, "dgpu_disable", "Disable the dGPU")=
;
> +
> +/* The ACPI call to enable the eGPU also disables the internal dGPU */
> +static ssize_t egpu_enable_current_value_store(struct kobject *kobj, str=
uct kobj_attribute *attr,
> +=09=09=09=09=09       const char *buf, size_t count)
> +{
> +=09int result, err;
> +=09u32 enable;
> +
> +=09err =3D kstrtou32(buf, 10, &enable);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (enable > 1)
> +=09=09return -EINVAL;
> +
> +=09err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU_CONNECTED, &re=
sult);
> +=09if (err) {
> +=09=09pr_warn("Failed to get eGPU connection status: %d\n", err);
> +=09=09return err;
> +=09}
> +
> +=09if (asus_armoury.gpu_mux_dev_id) {
> +=09=09err =3D asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &r=
esult);
> +=09=09if (err) {
> +=09=09=09pr_warn("Failed to get GPU MUX status: %d\n", result);
> +=09=09=09return result;
> +=09=09}
> +=09=09if (!result && enable) {
> +=09=09=09err =3D -ENODEV;
> +=09=09=09pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n=
", err);
> +=09=09=09return err;
> +=09=09}
> +=09}
> +
> +=09mutex_lock(&asus_armoury.mutex);
> +=09err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
> +=09mutex_unlock(&asus_armoury.mutex);
> +=09if (err) {
> +=09=09pr_warn("Failed to set eGPU state: %d\n", err);
> +=09=09return err;
> +=09}
> +
> +=09if (result !=3D 1) {
> +=09=09pr_warn("Failed to set eGPU state (retval): 0x%x\n", result);
> +=09=09return -EIO;
> +=09}
> +
> +=09sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +=09return count;
> +}
> +WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
> +ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (als=
o disables dGPU)");
> +
> +/* Simple attribute creation */
> +ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE=
_MODE, "0;1;2",
> +=09=09       "Show the current mode of charging");
> +
> +ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SOUND,
> +=09=09   "Set the boot POST sound");
> +ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_PO=
WERSAVE,
> +=09=09   "Set MCU powersaving mode");
> +ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
> +=09=09   "Set the panel refresh overdrive");
> +ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU=
_CONNECTED,
> +=09=09   "Show the eGPU connection status");
> +
> +/* If an attribute does not require any special case handling add it her=
e */
> +static const struct asus_attr_group armoury_attr_groups[] =3D {
> +=09{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
> +=09{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> +=09{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> +
> +=09{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
> +=09{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> +=09{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
> +=09{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
> +};
> +
> +static int asus_fw_attr_add(void)
> +{
> +=09int err, i;
> +
> +=09err =3D fw_attributes_class_get(&fw_attr_class);
> +=09if (err)
> +=09=09return err;
> +
> +=09asus_armoury.fw_attr_dev =3D
> +=09=09device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", DRIVER=
_NAME);

Don't split at =3D but after MKDEV() arg.

> +
> +=09if (IS_ERR(asus_armoury.fw_attr_dev)) {

Don't leave empty line between call and it's error handling.

> +=09=09err =3D PTR_ERR(asus_armoury.fw_attr_dev);
> +=09=09goto fail_class_get;
> +=09}
> +
> +=09asus_armoury.fw_attr_kset =3D
> +=09=09kset_create_and_add("attributes", NULL, &asus_armoury.fw_attr_dev-=
>kobj);

Don't split at =3D

> +=09if (!asus_armoury.fw_attr_kset) {
> +=09=09err =3D -ENOMEM;
> +=09=09goto err_destroy_classdev;
> +=09}
> +
> +=09err =3D sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &pending_=
reboot.attr);
> +=09if (err) {
> +=09=09pr_err("Failed to create sysfs level attributes\n");
> +=09=09goto err_destroy_kset;
> +=09}
> +
> +=09asus_armoury.mini_led_dev_id =3D 0;
> +=09if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
> +=09=09asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &mini=
_led_mode_attr_group);
> +=09} else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
> +=09=09asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE2;
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &mini=
_led_mode_attr_group);
> +=09}
> +=09if (err) {
> +=09=09pr_err("Failed to create sysfs-group for mini_led\n");
> +=09=09goto err_remove_file;
> +=09}

=09asus_armoury.mini_led_dev_id =3D 0;
=09if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE))
=09=09asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
=09else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2))
=09=09asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE2;

=09if (asus_armoury.mini_led_dev_id) {
=09=09err =3D sysfs_create_group(...);
=09=09if (err) {
=09=09=09...
=09=09}
=09}

> +
> +=09asus_armoury.gpu_mux_dev_id =3D 0;
> +=09if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX)) {
> +=09=09asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX;
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &gpu_=
mux_mode_attr_group);
> +=09} else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO)) {
> +=09=09asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX_VIVO;
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &gpu_=
mux_mode_attr_group);
> +=09}
> +=09if (err) {
> +=09=09pr_err("Failed to create sysfs-group for gpu_mux\n");
> +=09=09goto err_remove_mini_led_group;
> +=09}

Same here.

> +
> +=09for (i =3D 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
> +=09=09if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
> +=09=09=09continue;
> +
> +=09=09err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +=09=09=09=09=09 armoury_attr_groups[i].attr_group);
> +=09=09if (err) {
> +=09=09=09pr_err("Failed to create sysfs-group for %s\n",
> +=09=09=09       armoury_attr_groups[i].attr_group->name);
> +=09=09=09goto err_remove_groups;
> +=09=09} else {

No need to use else since you goto away from the error block.

> +=09=09=09pr_debug("Created sysfs-group for %s\n",
> +=09=09=09=09 armoury_attr_groups[i].attr_group->name);
> +=09=09}
> +=09}
> +
> +=09return 0;
> +
> +err_remove_groups:
> +=09while (--i >=3D 0) {
> +=09=09if (asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
> +=09=09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, armoury_at=
tr_groups[i].attr_group);
> +=09}

> +=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_at=
tr_group);
> +err_remove_mini_led_group:
> +=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_a=
ttr_group);

Do you need to check if these two got created before calling remove? IIRC,=
=20
some sysfs remove function required that.

> +err_remove_file:
> +=09sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.a=
ttr);
> +err_destroy_kset:
> +=09kset_unregister(asus_armoury.fw_attr_kset);
> +err_destroy_classdev:
> +=09device_destroy(fw_attr_class, MKDEV(0, 0));
> +fail_class_get:
> +=09fw_attributes_class_put();
> +=09return err;
> +}
> +
> +/* Init / exit *********************************************************=
*******/
> +
> +static int __init asus_fw_init(void)
> +{
> +=09char *wmi_uid;
> +=09int err;
> +
> +=09wmi_uid =3D wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
> +=09if (!wmi_uid)
> +=09=09return -ENODEV;
> +
> +=09/*
> +=09 * if equal to "ASUSWMI" then it's DCTS that can't be used for this
> +=09 * driver, DSTS is required.
> +=09 */
> +=09if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
> +=09=09return -ENODEV;
> +
> +=09err =3D asus_fw_attr_add();
> +=09if (err)
> +=09=09return err;
> +
> +=09return 0;
> +}
> +
> +static void __exit asus_fw_exit(void)
> +{
> +=09mutex_lock(&asus_armoury.mutex);

I'm not sure if this really helps anything. What are you trying to protect=
=20
against here with it?

> +=09sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.a=
ttr);
> +=09kset_unregister(asus_armoury.fw_attr_kset);
> +=09device_destroy(fw_attr_class, MKDEV(0, 0));
> +=09fw_attributes_class_put();
> +
> +=09mutex_unlock(&asus_armoury.mutex);
> +}
> +
> +module_init(asus_fw_init);
> +module_exit(asus_fw_exit);
> +
> +MODULE_IMPORT_NS(ASUS_WMI);
> +MODULE_AUTHOR("Luke Jones <luke@ljones.dev>");
> +MODULE_DESCRIPTION("ASUS BIOS Configuration Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("wmi:" ASUS_NB_WMI_EVENT_GUID);
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/a=
sus-armoury.h
> new file mode 100644
> index 000000000000..4d0dd34c52aa
> --- /dev/null
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Definitions for kernel modules using asus-armoury driver
> + *
> + *  Copyright (c) 2024 Luke Jones <luke@ljones.dev>
> + */
> +
> +#ifndef _ASUS_ARMOURY_H_
> +#define _ASUS_ARMOURY_H_
> +
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +
> +#define DRIVER_NAME "asus-armoury"
> +
> +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribut=
e *attr,
> +=09=09=09      const char *buf, size_t count, u32 min, u32 max,
> +=09=09=09      u32 *store_value, u32 wmi_dev);
> +
> +static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribut=
e *attr,
> +=09=09=09      char *buf)
> +{
> +=09return sysfs_emit(buf, "enumeration\n");
> +}
> +
> +#define __ASUS_ATTR_RO(_func, _name)                                  \
> +=09{                                                             \
> +=09=09.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> +=09=09.show =3D _func##_##_name##_show,                       \
> +=09}

Align all the continuation \ with tabs.

> +#define __ASUS_ATTR_RO_AS(_name, _show)                               \
> +=09{                                                             \
> +=09=09.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> +=09=09.show =3D _show,                                        \
> +=09}
> +
> +#define __ASUS_ATTR_RW(_func, _name) \
> +=09__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
> +
> +#define __WMI_STORE_INT(_attr, _min, _max, _wmi)                        =
  \
> +=09static ssize_t _attr##_store(struct kobject *kobj,                \
> +=09=09=09=09     struct kobj_attribute *attr,         \
> +=09=09=09=09     const char *buf, size_t count)       \
> +=09{                                                                 \
> +=09=09return attr_int_store(kobj, attr, buf, count, _min, _max, \
> +=09=09=09=09      NULL, _wmi);                        \
> +=09}
> +
> +#define WMI_SHOW_INT(_attr, _fmt, _wmi)                                 =
    \
> +=09static ssize_t _attr##_show(struct kobject *kobj,                   \
> +=09=09=09=09    struct kobj_attribute *attr, char *buf) \
> +=09{                                                                   \
> +=09=09u32 result;                                                 \
> +=09=09int err;                                                    \

Empty line here as per the usual style, with the continuation \ obviously.

> +=09=09err =3D asus_wmi_get_devstate_dsts(_wmi, &result);            \
> +=09=09if (err)                                                    \
> +=09=09=09return err;                                         \
> +=09=09return sysfs_emit(buf, _fmt,                                \
> +=09=09=09=09  result & ~ASUS_WMI_DSTS_PRESENCE_BIT);    \
> +=09}

I'll stop reviewing on this patch as I'm out of ability to focus. I'll=20
take a look at the remaining patches later.

--=20
 i.

> +
> +/* Create functions and attributes for use in other macros or on their o=
wn */
> +
> +#define __ATTR_CURRENT_INT_RO(_attr, _wmi)                          \
> +=09WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
> +=09static struct kobj_attribute attr_##_attr##_current_value =3D \
> +=09=09__ASUS_ATTR_RO(_attr, current_value)
> +
> +#define __ATTR_CURRENT_INT_RW(_attr, _minv, _maxv, _wmi)            \
> +=09__WMI_STORE_INT(_attr##_current_value, _minv, _maxv, _wmi); \
> +=09WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
> +=09static struct kobj_attribute attr_##_attr##_current_value =3D \
> +=09=09__ASUS_ATTR_RW(_attr, current_value)
> +
> +/* Shows a formatted static variable */
> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                   =
      \
> +=09static ssize_t _attrname##_##_prop##_show(                           =
 \
> +=09=09struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +=09{                                                                    =
 \
> +=09=09return sysfs_emit(buf, _fmt, _val);                           \
> +=09}                                                                    =
 \
> +=09static struct kobj_attribute attr_##_attrname##_##_prop =3D          =
   \
> +=09=09__ASUS_ATTR_RO(_attrname, _prop)
> +
> +/* Boolean style enumeration, base macro. Requires adding show/store */
> +#define __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)     =
\
> +=09__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
> +=09__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible); \
> +=09static struct kobj_attribute attr_##_attrname##_type =3D          \
> +=09=09__ASUS_ATTR_RO_AS(type, enum_type_show);                \
> +=09static struct attribute *_attrname##_attrs[] =3D {                \
> +=09=09&attr_##_attrname##_current_value.attr,                 \
> +=09=09&attr_##_attrname##_display_name.attr,                  \
> +=09=09&attr_##_attrname##_possible_values.attr,               \
> +=09=09&attr_##_attrname##_type.attr,                          \
> +=09=09NULL                                                    \
> +=09};                                                              \
> +=09static const struct attribute_group _attrname##_attr_group =3D {  \
> +=09=09.name =3D _fsname, .attrs =3D _attrname##_attrs             \
> +=09}
> +
> +#define ATTR_GROUP_BOOL_RO(_attrname, _fsname, _wmi, _dispname) \
> +=09__ATTR_CURRENT_INT_RO(_attrname, _wmi);                 \
> +=09__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> +
> +#define ATTR_GROUP_BOOL_RW(_attrname, _fsname, _wmi, _dispname) \
> +=09__ATTR_CURRENT_INT_RW(_attrname, 0, 1, _wmi);           \
> +=09__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> +
> +/*
> + * Requires <name>_current_value_show(), <name>_current_value_show()
> + */
> +#define ATTR_GROUP_BOOL_CUSTOM(_attrname, _fsname, _dispname)           =
\
> +=09static struct kobj_attribute attr_##_attrname##_current_value =3D \
> +=09=09__ASUS_ATTR_RW(_attrname, current_value);               \
> +=09__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> +
> +#define ATTR_GROUP_ENUM_INT_RO(_attrname, _fsname, _wmi, _possible, _dis=
pname) \
> +=09__ATTR_CURRENT_INT_RO(_attrname, _wmi);                              =
  \
> +=09__ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)
> +
> +/*
> + * Requires <name>_current_value_show(), <name>_current_value_show()
> + * and <name>_possible_values_show()
> + */
> +#define ATTR_GROUP_ENUM_CUSTOM(_attrname, _fsname, _dispname)           =
  \
> +=09__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);      \
> +=09static struct kobj_attribute attr_##_attrname##_current_value =3D   \
> +=09=09__ASUS_ATTR_RW(_attrname, current_value);                 \
> +=09static struct kobj_attribute attr_##_attrname##_possible_values =3D \
> +=09=09__ASUS_ATTR_RO(_attrname, possible_values);               \
> +=09static struct kobj_attribute attr_##_attrname##_type =3D            \
> +=09=09__ASUS_ATTR_RO_AS(type, enum_type_show);                  \
> +=09static struct attribute *_attrname##_attrs[] =3D {                  \
> +=09=09&attr_##_attrname##_current_value.attr,                   \
> +=09=09&attr_##_attrname##_display_name.attr,                    \
> +=09=09&attr_##_attrname##_possible_values.attr,                 \
> +=09=09&attr_##_attrname##_type.attr,                            \
> +=09=09NULL                                                      \
> +=09};                                                                \
> +=09static const struct attribute_group _attrname##_attr_group =3D {    \
> +=09=09.name =3D _fsname, .attrs =3D _attrname##_attrs               \
> +=09}
> +
> +#endif /* _ASUS_BIOSCFG_H_ */
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 0a5221d65130..3c6d774f4453 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -55,8 +55,6 @@ module_param(fnlock_default, bool, 0444);
>  #define to_asus_wmi_driver(pdrv)=09=09=09=09=09\
>  =09(container_of((pdrv), struct asus_wmi_driver, platform_driver))
> =20
> -#define ASUS_WMI_MGMT_GUID=09"97845ED0-4E6D-11DE-8A39-0800200C9A66"
> -
>  #define NOTIFY_BRNUP_MIN=09=090x11
>  #define NOTIFY_BRNUP_MAX=09=090x1f
>  #define NOTIFY_BRNDOWN_MIN=09=090x20
> @@ -105,8 +103,6 @@ module_param(fnlock_default, bool, 0444);
>  #define USB_INTEL_XUSB2PR=09=090xD0
>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI=090x9c31
> =20
> -#define ASUS_ACPI_UID_ASUSWMI=09=09"ASUSWMI"
> -
>  #define WMI_EVENT_MASK=09=09=090xFFFF
> =20
>  #define FAN_CURVE_POINTS=09=098
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/p=
latform_data/x86/asus-wmi.h
> index 6ea4dedfb85e..21313e1eb6c9 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -6,6 +6,9 @@
>  #include <linux/types.h>
>  #include <linux/dmi.h>
> =20
> +#define ASUS_WMI_MGMT_GUID=09"97845ED0-4E6D-11DE-8A39-0800200C9A66"
> +#define ASUS_ACPI_UID_ASUSWMI=09"ASUSWMI"
> +
>  /* WMI Methods */
>  #define ASUS_WMI_METHODID_SPEC=09        0x43455053 /* BIOS SPECificatio=
n */
>  #define ASUS_WMI_METHODID_SFBD=09=090x44424653 /* Set First Boot Device =
*/
>=20
--8323328-311202661-1729090455=:1010--

