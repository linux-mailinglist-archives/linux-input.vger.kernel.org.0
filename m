Return-Path: <linux-input+bounces-7769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 529559B668F
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 15:54:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA71281923
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 14:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C742B1E283B;
	Wed, 30 Oct 2024 14:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="GVRmfs62";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XeL7GUbm"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E9F13FEE;
	Wed, 30 Oct 2024 14:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730300070; cv=none; b=Z9uOHegDVC/lbgc+q48BOjB6a+I9Vo0AQAdjFzWUTuZ7SZY11o4pEWBLZOTUd+UEY6XhhOHWQz4ysAE2V7hDKDWXTY9tK2QRXoz4foJNfWxaOoKb9f+BhniL0l3kfzVOmwCI6q6kO4oA9G5iY5HVYNMaVfujuPJQ7anPQ7Ol4ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730300070; c=relaxed/simple;
	bh=eXXd8dndO5LhknfcrSYfVpSpDBNK752ep7duw0nzU04=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uqJsUC9JK1Y6ofqVBj10z99yYG4Ob7Fdwexnwc/UcV/vtJjN4O32Iv77vckxGMM/S1QOn9pnSq2yUu+vZuPzw2oR+j/zg0s9ah7IkfhstLGFwpvcuh8ENBCAadmixCWI7DM/hipGGVwFDrgaF6L3gW1qdU5G76mP0QkgERgr3jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=GVRmfs62; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XeL7GUbm; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 75E23114012D;
	Wed, 30 Oct 2024 10:54:24 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Wed, 30 Oct 2024 10:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1730300064;
	 x=1730386464; bh=36hYU+62urcwJBegQcLeTlZnnFwsPrhsnOMUQW3jfXs=; b=
	GVRmfs62Y1k2qUSgOw+gw9SA3Dg/b4mz01jnPJKzNqAgf/Bj5MDWtyVYD6l7+BMZ
	brWXIxPGQf6NRuPYb55MTHA+2F72zakx2WSknzm7Nix33Uipr9YATogwxckIb/fj
	1H3Cp3bvN55qY3TReju7crfU5124nDTeAHF7Bew1T3XLACydYSELcyY15BO16P0i
	sM1NhwsFOtCBuMILUyIPLnyCKEBxPsP7Jdo1lObJ7aiA3LATPqNW6wiOZpV6wcQE
	gfhg3lkaoZStXOaVEGW1+xO3KUxtG3LbagQgU1wrxflkifgAk7tH+mUpKqdjDw5K
	cT4IURlFQ1e5hLnWmQILTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730300064; x=
	1730386464; bh=36hYU+62urcwJBegQcLeTlZnnFwsPrhsnOMUQW3jfXs=; b=X
	eL7GUbmWZDpJ1vD8/gdIo7d5CxCpgdOaRwEjJtmcInYg0fCPds/HJcvl5ibC4LOU
	0caVadVwSIxRwiDwFoU+NmLdzThhOeWCQZVubMw3P5rsYcLc8Dp8ZirLakWfVV6I
	zwHIogO+PnzMJKNmXurcl4DtXvj7+o/wAoEYEQIb0YNtcRVNriDUdPEIcUH14GNR
	2a8Ht8Xhj9wRocSec0JP7Ryj5vl5GEz6dTE6A7Y22h58VW/NAsYrvL4/Z3RW+A+5
	Fc/nWcm/VDyLVA3s7QKk/COAeMYX/sQt+uXJ8r8rwQZKQ0PNC7MFZomrb9p7E5hJ
	Fz6hrpzA9KrTk3yndemiQ==
X-ME-Sender: <xms:n0giZxUXmYlXM_GJeQ51fqt879QCJRYQxVddTULDnWqAnjcMtJ5XFA>
    <xme:n0giZxnOPeY9orePO2UpX2v3pcNwkmbUNwKnJ-esMZkMJzbVJSlT_2aql9vB4-oIj
    3RZ2WlFO3O_TYVh37c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekfedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeehtedugfelgeeltdevvedtleffhfetgfdtjefhkefg
    udejfeeuueefvdejuddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhrvghnthhinhdrtghhrghrhi
    esghhmrghilhdrtghomhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehsuhhpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilh
    hpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohep
    hhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhinh
    hpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorh
    hmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:n0giZ9aO5zOnfVxVKxG43MALpUnGsVDV_N3xcO4ZZGmducRyspv4vA>
    <xmx:n0giZ0WBF6qEfxh8ctPLjxU_IfG29vLfBxuxsGQBo4JhYRt4kiRBcg>
    <xmx:n0giZ7nMBcjA0jUkRi9TOu9Qa82fb8Ae4BHLHnffKO0-vVoVd_uDtg>
    <xmx:n0giZxf92AnbDqqH2VAuPN6vmm1FmqBCkRAZ9YRCtFPnQRFnBz39_w>
    <xmx:oEgiZ5Zr_iK7rPHA2h-YazeiqpFMEFj-5xHpCytM-nZzGVsCOmGmwBhS>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6FF403360079; Wed, 30 Oct 2024 10:54:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Oct 2024 15:54:03 +0100
From: "Luke Jones" <luke@ljones.dev>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com,
 "Mario Limonciello" <superm1@kernel.org>
Message-Id: <19eefea4-d3b1-436a-8364-3f56a56b83cb@app.fastmail.com>
In-Reply-To: <6edbf781-b959-e2b5-bbb5-24282f239fc4@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev>
 <20240930000046.51388-4-luke@ljones.dev>
 <6edbf781-b959-e2b5-bbb5-24282f239fc4@linux.intel.com>
Subject: Re: [PATCH v6 3/9] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, 16 Oct 2024, at 4:54 PM, Ilpo J=C3=A4rvinen wrote:
> On Mon, 30 Sep 2024, Luke D. Jones wrote:
>
>> The fw_attributes_class provides a much cleaner interface to all of t=
he
>> attributes introduced to asus-wmi. This patch moves all of these extra
>> attributes over to fw_attributes_class, and shifts the bulk of these
>> definitions to a new kernel module to reduce the clutter of asus-wmi
>> with the intention of deprecating the asus-wmi attributes in future.
>>=20
>> The work applies only to WMI methods which don't have a clearly defin=
ed
>> place within the sysfs and as a result ended up lumped together in
>> /sys/devices/platform/asus-nb-wmi/ with no standard API.
>>=20
>> Where possible the fw attrs now implement defaults, min, max, scalar,
>> choices, etc. As en example dgpu_disable becomes:
>>=20
>> /sys/class/firmware-attributes/asus-armoury/attributes/dgpu_disable/
>> =E2=94=9C=E2=94=80=E2=94=80 current_value
>> =E2=94=9C=E2=94=80=E2=94=80 display_name
>> =E2=94=9C=E2=94=80=E2=94=80 possible_values
>> =E2=94=94=E2=94=80=E2=94=80 type
>>=20
>> as do other attributes.
>>=20
>> The ppt_* based attributes are removed in this initial patch as the
>> implementation is somewhat broken due to the WMI methods requiring a
>> set of limits on the values accepted (which is not provided by WMI).
>>=20
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> ---
>>  drivers/platform/x86/Kconfig               |  12 +
>>  drivers/platform/x86/Makefile              |   1 +
>>  drivers/platform/x86/asus-armoury.c        | 593 +++++++++++++++++++=
++
>>  drivers/platform/x86/asus-armoury.h        | 146 +++++
>>  drivers/platform/x86/asus-wmi.c            |   4 -
>>  include/linux/platform_data/x86/asus-wmi.h |   3 +
>>  6 files changed, 755 insertions(+), 4 deletions(-)
>>  create mode 100644 drivers/platform/x86/asus-armoury.c
>>  create mode 100644 drivers/platform/x86/asus-armoury.h
>>=20
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
>> index 3875abba5a79..80ec8b45022d 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -265,6 +265,18 @@ config ASUS_WIRELESS
>>  	  If you choose to compile this driver as a module the module will =
be
>>  	  called asus-wireless.
>> =20
>> +config ASUS_ARMOURY
>> +	tristate "ASUS Armoury driver"
>> +	depends on ASUS_WMI
>> +	select FW_ATTR_CLASS
>> +	help
>> +	  Say Y here if you have a WMI aware Asus machine and would like to=
 use the
>> +	  firmware_attributes API to control various settings typically exp=
osed in
>> +	  the ASUS Armoury Crate application available on Windows.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called asus-armoury.
>> +
>>  config ASUS_WMI
>>  	tristate "ASUS WMI Driver"
>>  	depends on ACPI_WMI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
>> index e1b142947067..fe3e7e7dede8 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -32,6 +32,7 @@ obj-$(CONFIG_APPLE_GMUX)	+=3D apple-gmux.o
>>  # ASUS
>>  obj-$(CONFIG_ASUS_LAPTOP)	+=3D asus-laptop.o
>>  obj-$(CONFIG_ASUS_WIRELESS)	+=3D asus-wireless.o
>> +obj-$(CONFIG_ASUS_ARMOURY)	+=3D asus-armoury.o
>>  obj-$(CONFIG_ASUS_WMI)		+=3D asus-wmi.o
>>  obj-$(CONFIG_ASUS_NB_WMI)	+=3D asus-nb-wmi.o
>>  obj-$(CONFIG_ASUS_TF103C_DOCK)	+=3D asus-tf103c-dock.o
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x=
86/asus-armoury.c
>> new file mode 100644
>> index 000000000000..0085f1b112ab
>> --- /dev/null
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -0,0 +1,593 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Asus Armoury (WMI) attributes driver. This driver uses the fw_att=
ributes
>> + * class to expose the various WMI functions that many gaming and so=
me
>> + * non-gaming ASUS laptops have available.
>> + * These typically don't fit anywhere else in the sysfs such as unde=
r LED class,
>> + * hwmon or other, and are set in Windows using the ASUS Armoury Cra=
te tool.
>> + *
>> + * Copyright(C) 2010 Intel Corporation.
>
> Does something from 2010 really have relevance to this? I won't oppose=
 if=20
> you feel you want to keep it but looking through the early commits int=
o=20
> drivers/platform/x86/eeepc-wmi.c and what's left of them makes me quit=
e=20
> skeptical.
>
>> + * Copyright(C) 2024-2024 Luke Jones <luke@ljones.dev>
>
> 2024 seems enough.

Ack both. Was copy/paste error

>
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/device.h>
>> +#include <linux/dmi.h>
>> +#include <linux/errno.h>
>> +#include <linux/fs.h>
>> +#include <linux/kernel.h>
>> +#include <linux/kmod.h>
>> +#include <linux/kobject.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_data/x86/asus-wmi.h>
>> +#include <linux/types.h>
>> +#include <linux/acpi.h>
>> +
>> +#include "asus-armoury.h"
>> +#include "firmware_attributes_class.h"
>> +
>> +#define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
>> +
>> +#define ASUS_MINI_LED_MODE_MASK 0x03
>> +/* Standard modes for devices with only on/off */
>> +#define ASUS_MINI_LED_OFF 0x00
>> +#define ASUS_MINI_LED_ON 0x01
>> +/* Like "on" but the effect is more vibrant or brighter */
>> +#define ASUS_MINI_LED_STRONG_MODE 0x02
>> +/* New modes for devices with 3 mini-led mode types */
>> +#define ASUS_MINI_LED_2024_WEAK 0x00
>> +#define ASUS_MINI_LED_2024_STRONG 0x01
>> +#define ASUS_MINI_LED_2024_OFF 0x02
>> +
>> +/* Default limits for tunables available on ASUS ROG laptops */
>> +#define NVIDIA_BOOST_MIN 5
>> +#define NVIDIA_BOOST_MAX 25
>> +#define NVIDIA_TEMP_MIN 75
>> +#define NVIDIA_TEMP_MAX 87
>> +#define PPT_CPU_LIMIT_MIN 5
>> +#define PPT_CPU_LIMIT_MAX 150
>> +#define PPT_CPU_LIMIT_DEFAULT 80
>> +#define PPT_PLATFORM_MIN 5
>> +#define PPT_PLATFORM_MAX 100
>> +#define PPT_PLATFORM_DEFAULT 80
>
> Please try to align the defined values better above.

This is how clang-format using the .clang-format config formats everythi=
ng. If I change it manually it will be overwritten again.

>
>> +static const struct class *fw_attr_class;
>> +
>> +struct asus_armoury_priv {
>> +	struct device *fw_attr_dev;
>> +	struct kset *fw_attr_kset;
>> +
>> +	u32 mini_led_dev_id;
>> +	u32 gpu_mux_dev_id;
>> +
>> +	struct mutex mutex;
>
> Please document what this protects.

I don't fully understand if sysfs writes can be parallel or not, so i wa=
s making the assumption that they were and if so, we would want to preve=
nt trying to write many WMI at once. If my understanding is lacking plea=
se correct me.

>
>> +};
>> +
>> +static struct asus_armoury_priv asus_armoury =3D { .mutex =3D __MUTE=
X_INITIALIZER(
>> +							 asus_armoury.mutex) };
>
> If you need to break lines, put the members on own lines as usual:
>
> static struct asus_armoury_priv asus_armoury =3D {
> 	.mutex =3D ...,
> };

I think this is how clang formatted it.. weird..
Okay I'll format this and the defs manually and add
// clang-format off etc.

>
>> +
>> +struct fw_attrs_group {
>> +	bool pending_reboot;
>> +};
>> +
>> +static struct fw_attrs_group fw_attrs =3D {
>> +	.pending_reboot =3D false,
>> +};
>> +
>> +struct asus_attr_group {
>> +	const struct attribute_group *attr_group;
>> +	u32 wmi_devid;
>> +};
>> +
>> +static bool asus_wmi_is_present(u32 dev_id)
>> +{
>> +	u32 retval;
>> +	int status;
>> +
>> +	status =3D asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id,=
 0, &retval);
>> +	pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id, =
retval);
>> +
>> +	return status =3D=3D 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>> +}
>> +
>> +static void asus_set_reboot_and_signal_event(void)
>> +{
>> +	fw_attrs.pending_reboot =3D true;
>> +	kobject_uevent(&asus_armoury.fw_attr_dev->kobj, KOBJ_CHANGE);
>> +}
>> +
>> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj=
_attribute *attr, char *buf)
>> +{
>> +	return sysfs_emit(buf, "%d\n", fw_attrs.pending_reboot);
>> +}
>> +
>> +static struct kobj_attribute pending_reboot =3D __ATTR_RO(pending_re=
boot);
>> +
>> +static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>> +{
>> +	return !strcmp(attr->attr.name, "gpu_mux_mode");
>> +}
>> +
>> +/**
>> + * attr_int_store() - Generic store function for use with most WMI f=
unctions.
>> + * @kobj: Pointer to the driver object.
>> + * @kobj_attribute: Pointer to the attribute calling this function.
>> + * @buf: The buffer to read from, this is parsed to `int` type.
>> + * @count: Required by sysfs attribute macros, pass in from the call=
ee attr.
>> + * @min: Minimum accepted value. Below this returns -EINVAL.
>> + * @max: Maximum accepted value. Above this returns -EINVAL.
>> + * @store_value: Pointer to where the parsed value should be stored.
>> + * @wmi_dev: The WMI function ID to use.
>> + *
>
> Lacks description of what it does (enven a single sentence would make=20
> this much more useful as a whole). The WMI error value discussion belo=
w is=20
> fine but it feels out-of-place if that's only thing there is.

Oversight on my part. Fixed now.

>> + * The WMI functions available on most ASUS laptops return a 1 as "s=
uccess", and
>> + * a 0 as failed. However some functions can return n > 1 for additi=
onal errors.
>> + * The function currently treats all values which are not 1 as error=
s, ignoring
>> + * the possible differences in WMI error returns.
>> + *
>> + * Returns: Either count, or an error.
>> + */
>> +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attr=
ibute *attr, const char *buf,
>> +			      size_t count, u32 min, u32 max, u32 *store_value, u32 wmi_d=
ev)
>> +{
>> +	u32 result, value;
>> +	int err;
>> +
>> +	err =3D kstrtouint(buf, 10, &value);
>
> I'd prefer the function be named "..._uint_..." instead of "int" to no=
t=20
> lose this part of the behavior of the wrapper.

Yes I agree. Thank you for picking that up.

>
>> +	if (err)
>> +		return err;
>> +
>> +	if (value < min || value > max)
>> +		return -EINVAL;
>> +
>
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err =3D asus_wmi_set_devstate(wmi_dev, value, &result);
>> +	mutex_unlock(&asus_armoury.mutex);
>
> Please wrap this so you don't have to do the lock in every single=20
> callsite. You can use guard() in the wrapper.

Done, new wrap function and a nice chunk of code removed. Thanks for tel=
ling about guard().

>> +	if (err) {
>> +		pr_err("Failed to set %s: %d\n", attr->attr.name, err);
>> +		return err;
>> +	}
>> +
>> +	if (result !=3D 1) {
>> +		pr_err("Failed to set %s (result): 0x%x\n", attr->attr.name, resul=
t);
>> +		return -EIO;
>> +	}
>> +
>> +	if (store_value !=3D NULL)
>> +		*store_value =3D value;
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +
>> +	if (asus_bios_requires_reboot(attr))
>> +		asus_set_reboot_and_signal_event();
>> +
>> +	return count;
>> +}
>> +
>> +/* Mini-LED mode ***************************************************=
***********/
>> +static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
>> +						struct kobj_attribute *attr, char *buf)
>> +{
>> +	u32 value;
>> +	int err;
>> +
>> +	err =3D asus_wmi_get_devstate_dsts(asus_armoury.mini_led_dev_id, &v=
alue);
>> +	if (err)
>> +		return err;
>> +
>> +	value &=3D ASUS_MINI_LED_MODE_MASK;
>> +
>> +	/*
>> +	 * Remap the mode values to match previous generation mini-LED. The=
 last gen
>> +	 * WMI 0 =3D=3D off, while on this version WMI 2 =3D=3D off (flippe=
d).
>> +	 */
>> +	if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MOD=
E2) {
>> +		switch (value) {
>> +		case ASUS_MINI_LED_2024_WEAK:
>> +			value =3D ASUS_MINI_LED_ON;
>> +			break;
>> +		case ASUS_MINI_LED_2024_STRONG:
>> +			value =3D ASUS_MINI_LED_STRONG_MODE;
>> +			break;
>> +		case ASUS_MINI_LED_2024_OFF:
>> +			value =3D ASUS_MINI_LED_OFF;
>> +			break;
>> +		}
>> +	}
>> +
>> +	return sysfs_emit(buf, "%u\n", value);
>> +}
>> +
>> +static ssize_t mini_led_mode_current_value_store(struct kobject *kob=
j,
>> +						 struct kobj_attribute *attr, const char *buf,
>> +						 size_t count)
>
> I'd put the buf & count on the same line. They kind of belong together=
 and=20
> the lines would be more equal in length too.

ack

>> +{
>> +	int result, err;
>> +	u32 mode;
>> +
>> +	err =3D kstrtou32(buf, 10, &mode);
>> +	if (err)
>> +		return err;
>> +
>> +	if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MOD=
E &&
>> +	    mode > ASUS_MINI_LED_ON)
>> +		return -EINVAL;
>> +	if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MOD=
E2 &&
>> +	    mode > ASUS_MINI_LED_STRONG_MODE)
>> +		return -EINVAL;
>> +
>> +	/*
>> +	 * Remap the mode values so expected behaviour is the same as the l=
ast
>> +	 * generation of mini-LED with 0 =3D=3D off, 1 =3D=3D on.
>> +	 */
>> +	if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MOD=
E2) {
>> +		switch (mode) {
>> +		case ASUS_MINI_LED_OFF:
>> +			mode =3D ASUS_MINI_LED_2024_OFF;
>> +			break;
>> +		case ASUS_MINI_LED_ON:
>> +			mode =3D ASUS_MINI_LED_2024_WEAK;
>> +			break;
>> +		case ASUS_MINI_LED_STRONG_MODE:
>> +			mode =3D ASUS_MINI_LED_2024_STRONG;
>> +			break;
>> +		}
>> +	}
>> +
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err =3D asus_wmi_set_devstate(asus_armoury.mini_led_dev_id, mode, &=
result);
>> +	mutex_unlock(&asus_armoury.mutex);
>> +	if (err) {
>> +		pr_warn("Failed to set mini-LED: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (result !=3D 1) {
>> +		pr_warn("Failed to set mini-LED mode (result): 0x%x\n", result);
>> +		return -EIO;
>> +	}
>> +
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t mini_led_mode_possible_values_show(struct kobject *ko=
bj,
>> +						  struct kobj_attribute *attr, char *buf)
>> +{
>> +	switch (asus_armoury.mini_led_dev_id) {
>> +	case ASUS_WMI_DEVID_MINI_LED_MODE:
>> +		return sysfs_emit(buf, "0;1\n");
>> +	case ASUS_WMI_DEVID_MINI_LED_MODE2:
>> +		return sysfs_emit(buf, "0;1;2\n");
>> +	}
>> +
>> +	return sysfs_emit(buf, "0\n");
>> +}
>> +
>> +ATTR_GROUP_ENUM_CUSTOM(mini_led_mode, "mini_led_mode", "Set the mini=
-LED backlight mode");
>> +
>> +static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
>> +						struct kobj_attribute *attr, const char *buf,
>> +						size_t count)
>> +{
>> +	int result, err;
>> +	u32 optimus;
>> +
>> +	err =3D kstrtou32(buf, 10, &optimus);
>> +	if (err)
>> +		return err;
>> +
>> +	if (optimus > 1)
>> +		return -EINVAL;
>> +
>> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
>> +		err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_DGPU, &result);
>> +		if (err)
>> +			return err;
>> +		if (result && !optimus) {
>> +			err =3D -ENODEV;
>> +			pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %=
02X %02X %d\n",
>> +				result, optimus, err);
>
> Printing an error code you synthetized right above the print doesn't f=
eel=20
> very useful. With that removed, you can just use return -ENODEV;
>
>> +			return err;
>> +		}
>> +	}
>> +
>> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
>> +		err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU, &result);
>> +		if (err)
>> +			return err;
>> +		if (result && !optimus) {
>> +			err =3D -ENODEV;
>> +			pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled: %d=
\n",
>> +				err);
>
> Ditto.
>
>> +			return err;
>> +		}
>> +	}
>> +
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err =3D asus_wmi_set_devstate(asus_armoury.gpu_mux_dev_id, optimus,=
 &result);
>> +	mutex_unlock(&asus_armoury.mutex);
>> +	if (err) {
>> +		pr_err("Failed to set GPU MUX mode: %d\n", err);
>> +		return err;
>> +	}
>> +	/* !1 is considered a fail by ASUS */
>> +	if (result !=3D 1) {
>> +		pr_warn("Failed to set GPU MUX mode (result): 0x%x\n", result);
>> +		return -EIO;
>> +	}
>
> I wonder if the asus_wmi_set_devstate wrapper should also handle these=20
> error checks + prints. They seem pretty much duplicated except for the=20
> error string that could be provided as an argument.

For sure. The wrapper handles both err and result, and all this repeated=
 code is removed.

>> +
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +	asus_set_reboot_and_signal_event();
>> +
>> +	return count;
>> +}
>> +WMI_SHOW_INT(gpu_mux_mode_current_value, "%d\n", asus_armoury.gpu_mu=
x_dev_id);
>> +ATTR_GROUP_BOOL_CUSTOM(gpu_mux_mode, "gpu_mux_mode", "Set the GPU di=
splay MUX mode");
>> +
>> +/*
>> + * A user may be required to store the value twice, typical store fi=
rst, then
>> + * rescan PCI bus to activate power, then store a second time to sav=
e correctly.
>> + * The reason for this is that an extra code path in the ACPI is ena=
bled when
>> + * the device and bus are powered.
>> + */
>> +static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
>> +						struct kobj_attribute *attr, const char *buf,
>> +						size_t count)
>> +{
>> +	int result, err;
>> +	u32 disable;
>> +
>> +	err =3D kstrtou32(buf, 10, &disable);
>> +	if (err)
>> +		return err;
>> +
>> +	if (disable > 1)
>> +		return -EINVAL;
>> +
>> +	if (asus_armoury.gpu_mux_dev_id) {
>> +		err =3D asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &r=
esult);
>> +		if (err)
>> +			return err;
>> +		if (!result && disable) {
>> +			err =3D -ENODEV;
>> +			pr_warn("Can not disable dGPU when the MUX is in dGPU mode: %d\n"=
, err);
>> +			return err;
>> +		}
>> +	}
>> +
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, disable, &result=
);
>> +	mutex_unlock(&asus_armoury.mutex);
>> +	if (err) {
>> +		pr_warn("Failed to set dGPU disable: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (result !=3D 1) {
>> +		pr_warn("Failed to set dGPU disable (result): 0x%x\n", result);
>> +		return -EIO;
>> +	}
>> +
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +
>> +	return count;
>> +}
>> +WMI_SHOW_INT(dgpu_disable_current_value, "%d\n", ASUS_WMI_DEVID_DGPU=
);
>> +ATTR_GROUP_BOOL_CUSTOM(dgpu_disable, "dgpu_disable", "Disable the dG=
PU");
>> +
>> +/* The ACPI call to enable the eGPU also disables the internal dGPU =
*/
>> +static ssize_t egpu_enable_current_value_store(struct kobject *kobj,=
 struct kobj_attribute *attr,
>> +					       const char *buf, size_t count)
>> +{
>> +	int result, err;
>> +	u32 enable;
>> +
>> +	err =3D kstrtou32(buf, 10, &enable);
>> +	if (err)
>> +		return err;
>> +
>> +	if (enable > 1)
>> +		return -EINVAL;
>> +
>> +	err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU_CONNECTED, &=
result);
>> +	if (err) {
>> +		pr_warn("Failed to get eGPU connection status: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (asus_armoury.gpu_mux_dev_id) {
>> +		err =3D asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &r=
esult);
>> +		if (err) {
>> +			pr_warn("Failed to get GPU MUX status: %d\n", result);
>> +			return result;
>> +		}
>> +		if (!result && enable) {
>> +			err =3D -ENODEV;
>> +			pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n",=
 err);
>> +			return err;
>> +		}
>> +	}
>> +
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
>> +	mutex_unlock(&asus_armoury.mutex);
>> +	if (err) {
>> +		pr_warn("Failed to set eGPU state: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (result !=3D 1) {
>> +		pr_warn("Failed to set eGPU state (retval): 0x%x\n", result);
>> +		return -EIO;
>> +	}
>> +
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +
>> +	return count;
>> +}
>> +WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
>> +ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU =
(also disables dGPU)");
>> +
>> +/* Simple attribute creation */
>> +ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CH=
ARGE_MODE, "0;1;2",
>> +		       "Show the current mode of charging");
>> +
>> +ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SOU=
ND,
>> +		   "Set the boot POST sound");
>> +ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MC=
U_POWERSAVE,
>> +		   "Set MCU powersaving mode");
>> +ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL=
_OD,
>> +		   "Set the panel refresh overdrive");
>> +ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_=
EGPU_CONNECTED,
>> +		   "Show the eGPU connection status");
>> +
>> +/* If an attribute does not require any special case handling add it=
 here */
>> +static const struct asus_attr_group armoury_attr_groups[] =3D {
>> +	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
>> +	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>> +	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>> +
>> +	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>> +	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>> +	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
>> +	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
>> +};
>> +
>> +static int asus_fw_attr_add(void)
>> +{
>> +	int err, i;
>> +
>> +	err =3D fw_attributes_class_get(&fw_attr_class);
>> +	if (err)
>> +		return err;
>> +
>> +	asus_armoury.fw_attr_dev =3D
>> +		device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", DRIVER=
_NAME);
>
> Don't split at =3D but after MKDEV() arg.

This is another clang-format thing... I'll bite the bullet and manually =
format for rest of style suggestions in review.

>> +
>> +	if (IS_ERR(asus_armoury.fw_attr_dev)) {
>
> Don't leave empty line between call and it's error handling.
>
>> +		err =3D PTR_ERR(asus_armoury.fw_attr_dev);
>> +		goto fail_class_get;
>> +	}
>> +
>> +	asus_armoury.fw_attr_kset =3D
>> +		kset_create_and_add("attributes", NULL, &asus_armoury.fw_attr_dev-=
>kobj);
>
> Don't split at =3D
>
>> +	if (!asus_armoury.fw_attr_kset) {
>> +		err =3D -ENOMEM;
>> +		goto err_destroy_classdev;
>> +	}
>> +
>> +	err =3D sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &pendin=
g_reboot.attr);
>> +	if (err) {
>> +		pr_err("Failed to create sysfs level attributes\n");
>> +		goto err_destroy_kset;
>> +	}
>> +
>> +	asus_armoury.mini_led_dev_id =3D 0;
>> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
>> +		asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &mini=
_led_mode_attr_group);
>> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
>> +		asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE2;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &mini=
_led_mode_attr_group);
>> +	}
>> +	if (err) {
>> +		pr_err("Failed to create sysfs-group for mini_led\n");
>> +		goto err_remove_file;
>> +	}
>
> 	asus_armoury.mini_led_dev_id =3D 0;
> 	if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE))
> 		asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
> 	else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2))
> 		asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE2;
>
> 	if (asus_armoury.mini_led_dev_id) {
> 		err =3D sysfs_create_group(...);
> 		if (err) {
> 			...
> 		}
> 	}
>
>> +
>> +	asus_armoury.gpu_mux_dev_id =3D 0;
>> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX)) {
>> +		asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &gpu_=
mux_mode_attr_group);
>> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO)) {
>> +		asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX_VIVO;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &gpu_=
mux_mode_attr_group);
>> +	}
>> +	if (err) {
>> +		pr_err("Failed to create sysfs-group for gpu_mux\n");
>> +		goto err_remove_mini_led_group;
>> +	}
>
> Same here.

gr=C3=A0zie

>
>> +
>> +	for (i =3D 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>> +		if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
>> +			continue;
>> +
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>> +					 armoury_attr_groups[i].attr_group);
>> +		if (err) {
>> +			pr_err("Failed to create sysfs-group for %s\n",
>> +			       armoury_attr_groups[i].attr_group->name);
>> +			goto err_remove_groups;
>> +		} else {
>
> No need to use else since you goto away from the error block.

ack

>> +			pr_debug("Created sysfs-group for %s\n",
>> +				 armoury_attr_groups[i].attr_group->name);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_remove_groups:
>> +	while (--i >=3D 0) {
>> +		if (asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
>> +			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, armoury_attr=
_groups[i].attr_group);
>> +	}
>
>> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_=
attr_group);
>> +err_remove_mini_led_group:
>> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode=
_attr_group);
>
> Do you need to check if these two got created before calling remove? I=
IRC,=20
> some sysfs remove function required that.
>
>> +err_remove_file:
>> +	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot=
.attr);
>> +err_destroy_kset:
>> +	kset_unregister(asus_armoury.fw_attr_kset);
>> +err_destroy_classdev:
>> +	device_destroy(fw_attr_class, MKDEV(0, 0));
>> +fail_class_get:
>> +	fw_attributes_class_put();
>> +	return err;
>> +}
>> +
>> +/* Init / exit *****************************************************=
***********/
>> +
>> +static int __init asus_fw_init(void)
>> +{
>> +	char *wmi_uid;
>> +	int err;
>> +
>> +	wmi_uid =3D wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>> +	if (!wmi_uid)
>> +		return -ENODEV;
>> +
>> +	/*
>> +	 * if equal to "ASUSWMI" then it's DCTS that can't be used for this
>> +	 * driver, DSTS is required.
>> +	 */
>> +	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
>> +		return -ENODEV;
>> +
>> +	err =3D asus_fw_attr_add();
>> +	if (err)
>> +		return err;
>> +
>> +	return 0;
>> +}
>> +
>> +static void __exit asus_fw_exit(void)
>> +{
>> +	mutex_lock(&asus_armoury.mutex);
>
> I'm not sure if this really helps anything. What are you trying to pro=
tect=20
> against here with it?

I'm not even sure anymore. Was supposed to be due to my assumptions abou=
t how sysfs writes work.

One thing in particular is that the dgpu_disable and egpu_enable calls c=
an take 20+ seconds to complete in acpi, and I don't want to make other =
WMI calls during that time - TBH I'm not sure of best way to handle it.

>> +	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot=
.attr);
>> +	kset_unregister(asus_armoury.fw_attr_kset);
>> +	device_destroy(fw_attr_class, MKDEV(0, 0));
>> +	fw_attributes_class_put();
>> +
>> +	mutex_unlock(&asus_armoury.mutex);
>> +}
>> +
>> +module_init(asus_fw_init);
>> +module_exit(asus_fw_exit);
>> +
>> +MODULE_IMPORT_NS(ASUS_WMI);
>> +MODULE_AUTHOR("Luke Jones <luke@ljones.dev>");
>> +MODULE_DESCRIPTION("ASUS BIOS Configuration Driver");
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("wmi:" ASUS_NB_WMI_EVENT_GUID);
>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x=
86/asus-armoury.h
>> new file mode 100644
>> index 000000000000..4d0dd34c52aa
>> --- /dev/null
>> +++ b/drivers/platform/x86/asus-armoury.h
>> @@ -0,0 +1,146 @@
>> +/* SPDX-License-Identifier: GPL-2.0
>> + *
>> + * Definitions for kernel modules using asus-armoury driver
>> + *
>> + *  Copyright (c) 2024 Luke Jones <luke@ljones.dev>
>> + */
>> +
>> +#ifndef _ASUS_ARMOURY_H_
>> +#define _ASUS_ARMOURY_H_
>> +
>> +#include <linux/types.h>
>> +#include <linux/platform_device.h>
>> +
>> +#define DRIVER_NAME "asus-armoury"
>> +
>> +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attr=
ibute *attr,
>> +			      const char *buf, size_t count, u32 min, u32 max,
>> +			      u32 *store_value, u32 wmi_dev);
>> +
>> +static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attr=
ibute *attr,
>> +			      char *buf)
>> +{
>> +	return sysfs_emit(buf, "enumeration\n");
>> +}
>> +
>> +#define __ASUS_ATTR_RO(_func, _name)                                =
  \
>> +	{                                                             \
>> +		.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
>> +		.show =3D _func##_##_name##_show,                       \
>> +	}
>
> Align all the continuation \ with tabs.
>
>> +#define __ASUS_ATTR_RO_AS(_name, _show)                             =
  \
>> +	{                                                             \
>> +		.attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
>> +		.show =3D _show,                                        \
>> +	}
>> +
>> +#define __ASUS_ATTR_RW(_func, _name) \
>> +	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
>> +
>> +#define __WMI_STORE_INT(_attr, _min, _max, _wmi)                    =
      \
>> +	static ssize_t _attr##_store(struct kobject *kobj,                \
>> +				     struct kobj_attribute *attr,         \
>> +				     const char *buf, size_t count)       \
>> +	{                                                                 \
>> +		return attr_int_store(kobj, attr, buf, count, _min, _max, \
>> +				      NULL, _wmi);                        \
>> +	}
>> +
>> +#define WMI_SHOW_INT(_attr, _fmt, _wmi)                             =
        \
>> +	static ssize_t _attr##_show(struct kobject *kobj,                  =
 \
>> +				    struct kobj_attribute *attr, char *buf) \
>> +	{                                                                  =
 \
>> +		u32 result;                                                 \
>> +		int err;                                                    \
>
> Empty line here as per the usual style, with the continuation \ obviou=
sly.
>
>> +		err =3D asus_wmi_get_devstate_dsts(_wmi, &result);            \
>> +		if (err)                                                    \
>> +			return err;                                         \
>> +		return sysfs_emit(buf, _fmt,                                \
>> +				  result & ~ASUS_WMI_DSTS_PRESENCE_BIT);    \
>> +	}
>
> I'll stop reviewing on this patch as I'm out of ability to focus. I'll=20
> take a look at the remaining patches later.

Understandable, thank you for your time so far.

Luke.
>
> --=20
>  i.
>
>> +
>> +/* Create functions and attributes for use in other macros or on the=
ir own */
>> +
>> +#define __ATTR_CURRENT_INT_RO(_attr, _wmi)                          \
>> +	WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
>> +	static struct kobj_attribute attr_##_attr##_current_value =3D \
>> +		__ASUS_ATTR_RO(_attr, current_value)
>> +
>> +#define __ATTR_CURRENT_INT_RW(_attr, _minv, _maxv, _wmi)            \
>> +	__WMI_STORE_INT(_attr##_current_value, _minv, _maxv, _wmi); \
>> +	WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
>> +	static struct kobj_attribute attr_##_attr##_current_value =3D \
>> +		__ASUS_ATTR_RW(_attr, current_value)
>> +
>> +/* Shows a formatted static variable */
>> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)               =
          \
>> +	static ssize_t _attrname##_##_prop##_show(                         =
   \
>> +		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
>> +	{                                                                  =
   \
>> +		return sysfs_emit(buf, _fmt, _val);                           \
>> +	}                                                                  =
   \
>> +	static struct kobj_attribute attr_##_attrname##_##_prop =3D        =
     \
>> +		__ASUS_ATTR_RO(_attrname, _prop)
>> +
>> +/* Boolean style enumeration, base macro. Requires adding show/store=
 */
>> +#define __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname) =
    \
>> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>> +	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible); \
>> +	static struct kobj_attribute attr_##_attrname##_type =3D          \
>> +		__ASUS_ATTR_RO_AS(type, enum_type_show);                \
>> +	static struct attribute *_attrname##_attrs[] =3D {                \
>> +		&attr_##_attrname##_current_value.attr,                 \
>> +		&attr_##_attrname##_display_name.attr,                  \
>> +		&attr_##_attrname##_possible_values.attr,               \
>> +		&attr_##_attrname##_type.attr,                          \
>> +		NULL                                                    \
>> +	};                                                              \
>> +	static const struct attribute_group _attrname##_attr_group =3D {  \
>> +		.name =3D _fsname, .attrs =3D _attrname##_attrs             \
>> +	}
>> +
>> +#define ATTR_GROUP_BOOL_RO(_attrname, _fsname, _wmi, _dispname) \
>> +	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                 \
>> +	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
>> +
>> +#define ATTR_GROUP_BOOL_RW(_attrname, _fsname, _wmi, _dispname) \
>> +	__ATTR_CURRENT_INT_RW(_attrname, 0, 1, _wmi);           \
>> +	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
>> +
>> +/*
>> + * Requires <name>_current_value_show(), <name>_current_value_show()
>> + */
>> +#define ATTR_GROUP_BOOL_CUSTOM(_attrname, _fsname, _dispname)       =
    \
>> +	static struct kobj_attribute attr_##_attrname##_current_value =3D \
>> +		__ASUS_ATTR_RW(_attrname, current_value);               \
>> +	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
>> +
>> +#define ATTR_GROUP_ENUM_INT_RO(_attrname, _fsname, _wmi, _possible, =
_dispname) \
>> +	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                            =
    \
>> +	__ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)
>> +
>> +/*
>> + * Requires <name>_current_value_show(), <name>_current_value_show()
>> + * and <name>_possible_values_show()
>> + */
>> +#define ATTR_GROUP_ENUM_CUSTOM(_attrname, _fsname, _dispname)       =
      \
>> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);      \
>> +	static struct kobj_attribute attr_##_attrname##_current_value =3D  =
 \
>> +		__ASUS_ATTR_RW(_attrname, current_value);                 \
>> +	static struct kobj_attribute attr_##_attrname##_possible_values =3D=
 \
>> +		__ASUS_ATTR_RO(_attrname, possible_values);               \
>> +	static struct kobj_attribute attr_##_attrname##_type =3D           =
 \
>> +		__ASUS_ATTR_RO_AS(type, enum_type_show);                  \
>> +	static struct attribute *_attrname##_attrs[] =3D {                 =
 \
>> +		&attr_##_attrname##_current_value.attr,                   \
>> +		&attr_##_attrname##_display_name.attr,                    \
>> +		&attr_##_attrname##_possible_values.attr,                 \
>> +		&attr_##_attrname##_type.attr,                            \
>> +		NULL                                                      \
>> +	};                                                                \
>> +	static const struct attribute_group _attrname##_attr_group =3D {   =
 \
>> +		.name =3D _fsname, .attrs =3D _attrname##_attrs               \
>> +	}
>> +
>> +#endif /* _ASUS_BIOSCFG_H_ */
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
>> index 0a5221d65130..3c6d774f4453 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -55,8 +55,6 @@ module_param(fnlock_default, bool, 0444);
>>  #define to_asus_wmi_driver(pdrv)					\
>>  	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
>> =20
>> -#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
>> -
>>  #define NOTIFY_BRNUP_MIN		0x11
>>  #define NOTIFY_BRNUP_MAX		0x1f
>>  #define NOTIFY_BRNDOWN_MIN		0x20
>> @@ -105,8 +103,6 @@ module_param(fnlock_default, bool, 0444);
>>  #define USB_INTEL_XUSB2PR		0xD0
>>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
>> =20
>> -#define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
>> -
>>  #define WMI_EVENT_MASK			0xFFFF
>> =20
>>  #define FAN_CURVE_POINTS		8
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/lin=
ux/platform_data/x86/asus-wmi.h
>> index 6ea4dedfb85e..21313e1eb6c9 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -6,6 +6,9 @@
>>  #include <linux/types.h>
>>  #include <linux/dmi.h>
>> =20
>> +#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
>> +#define ASUS_ACPI_UID_ASUSWMI	"ASUSWMI"
>> +
>>  /* WMI Methods */
>>  #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECificat=
ion */
>>  #define ASUS_WMI_METHODID_SFBD		0x44424653 /* Set First Boot Device =
*/
>>

