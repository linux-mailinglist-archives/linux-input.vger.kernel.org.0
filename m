Return-Path: <linux-input+bounces-6789-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBFA987B93
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 01:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4B471C2131F
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 23:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07D11B0124;
	Thu, 26 Sep 2024 23:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="DqQtKOoL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mLyTXVE8"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C9157A41;
	Thu, 26 Sep 2024 23:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727392852; cv=none; b=n4qU7Et9QkOPeyBS1TDMwo0ncV6nZ4j+Vcp1MrhhSDfE+mey9SrVSjr6yqpSSR/ABtfi1TMqf73UYpQ4b+powRiimppBao8fDiIXfYxRxDEwD1lVqlVuc6xrNuHUyoOWSBmwFVFvVrePK95Q6Bq2ZW+J7g04rSdGAH6AHTH8CWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727392852; c=relaxed/simple;
	bh=V5HEV3jPeyPsX0tVSHtpK4iG6rAfhlxk0S2Dk6xeKHo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uBESuJ6jYUlj3MWr68Kneshgdc2rRIbGOM1Z7lzyBpG+Ov4Fii1QJFUcBwZ0MkKwzfvPzF7aR5PA/8vVd40PLz4MlascYaAYcC/cW7QOfPG/fbp2Uq7zbCPFgIFV8r9dPJUsUywWscJLj2/gYUp9np88wb+pcqZfhDiCOpySyps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=DqQtKOoL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mLyTXVE8; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 1AE7913801D9;
	Thu, 26 Sep 2024 19:20:49 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 19:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727392849;
	 x=1727479249; bh=h0H06w6/ay+0QRqUwYqdM3OGBc54Jqu64Vj80eEdxWA=; b=
	DqQtKOoLkJk1gGCJHHxq8cJhtHGHP+C9SoULWymTxYM4ono1XqgeulNKKyU+xCPN
	p+OtAU8ahtFkeK6mbR3HMWOXcfsPii18njdwuIArHWHaG8Ivi3zx07S1rAWqD9RA
	bAKwUPx0Ki+V2Ru/7Xw2gvS5m1BzCuSYg5BZz6mVxf1k4dvlYRcY7Icve8+aJ9OG
	6G+cBl/MIHHQsmXSNUFo96sIySwJJIbrniBd4X0GUpMqehRyH2I6QDkYrsrF9K1I
	PZfzrsRitd+UJyxctbzAQoy2P6iWQlVDHnSCn6V/PkUdEGyMzUkOENMRyQG7VqFk
	rSOcPfj+XiGzSpsXSRnP5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727392849; x=
	1727479249; bh=h0H06w6/ay+0QRqUwYqdM3OGBc54Jqu64Vj80eEdxWA=; b=m
	LyTXVE8n266KVEbMlcAE/g0UgLD69aSZIL3ydk1ViXKrFSMPJj5bJMk4tMkQRGf4
	HTlfrbAe0VCJ/zVhoU/PYThVBNZdZMQeuRO4VaaUDqG9bAsM1H/9ccXa1TuYuSgF
	QyRNCRwb2M71GeF4tBsV+r/gvzLMDNiQMSSwG8q5ohS2MgXQQEjq0pWJJmJT8vj8
	d39sPRFrJX1MpBnFiSfWLMqHW4CpQsCdLGo9wqRbTfrvz9nBQmPq2mZXODVkEYUR
	g0w89+UpMPKXT4+JZikQ3U3+xoRALahRfKkDoenOAuwpAemiwPBDNEOOKwat3WYM
	0UiuXGB++Br/RCvhZpaHA==
X-ME-Sender: <xms:UOz1ZsKUSXFLup4yPUoay0H_Yl1Jxp0IOgxr5vPT4OFBOdGCMcTLJw>
    <xme:UOz1ZsK-yP4dTziZNG9KuqP5AcIajLV0A6lvfojRuiSsj3i-sA0AxIsnK12Tlfrbv
    Pwtnc7raYqIHSvb6WI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeehtedugfelgeeltdevvedtleffhfetgfdtjefhkefg
    udejfeeuueefvdejuddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhrvghnthhinhdrtghhrghrhi
    esghhmrghilhdrtghomhdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsuh
    hpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhn
    vghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvse
    hrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdr
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdq
    giekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:UOz1ZsvcE-UhXZ3aBVSiN8sJ6Y2qLQJqeLq6B73u9uAFFqTzxY7KYg>
    <xmx:UOz1ZpbQ2jtbSWXFnZ4dmyayIgUId9xhEsV1QkBLay1PudOY43zamg>
    <xmx:UOz1ZjZYHa4EUSPRtRgcGWgVLEmeYHMpU1tsdKvfBcI8jkTt9tbjhQ>
    <xmx:UOz1ZlCvbSYr5H-E2oPY0QRi8uGZJKPyfRLWA2A3QK9hHM0Uwm1iNA>
    <xmx:Uez1Zn59x2T0Y_7UcYv955i_OQ-ylq_Jg_-tiSgzwCaqBEBvOXjfXOVJ>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C55753360077; Thu, 26 Sep 2024 19:20:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 11:20:28 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <81e62b04-3c1d-4807-b431-d13cf7933054@app.fastmail.com>
In-Reply-To: <c88f9f36-37f1-4607-aa0c-2baa671c946b@kernel.org>
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-4-luke@ljones.dev>
 <c88f9f36-37f1-4607-aa0c-2baa671c946b@kernel.org>
Subject: Re: [PATCH v4 3/9] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Very sorry. Another resend. This was *meant* to be in plain text sent as=
 html for some reason.

On Fri, 27 Sep 2024, at 3:48 AM, Mario Limonciello wrote:
> On 9/26/2024 04:29, Luke D. Jones wrote:
> > The fw_attributes_class provides a much cleaner interface to all of =
the
> > attributes introduced to asus-wmi. This patch moves all of these ext=
ra
>=20
> No need to say "this patch".

Ack

> > attributes over to fw_attributes_class, and shifts the bulk of these
> > definitions to a new kernel module to reduce the clutter of asus-wmi
> > with the intention of deprecating the asus-wmi attributes in future.
> >=20
> > The work applies only to WMI methods which don't have a clearly defi=
ned
> > place within the sysfs and as a result ended up lumped together in
> > /sys/devices/platform/asus-nb-wmi/ with no standard API.
> >=20
> > Where possible the fw attrs now implement defaults, min, max, scalar,
> > choices, etc. As en example dgpu_disable becomes:
> >=20
> > /sys/class/firmware-attributes/asus-armoury/attributes/dgpu_disable/
> > =E2=94=9C=E2=94=80=E2=94=80 current_value
> > =E2=94=9C=E2=94=80=E2=94=80 display_name
> > =E2=94=9C=E2=94=80=E2=94=80 possible_values
> > =E2=94=94=E2=94=80=E2=94=80 type
> >=20
> > as do other attributes.
> >=20
> > The ppt_* based attributes are removed in this initial patch as the
> > implementation is somewhat broken due to the WMI methods requiring a
> > set of limits on the values accepted (which is not provided by WMI).
> >=20
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> >   drivers/platform/x86/Kconfig        |  13 +
> >   drivers/platform/x86/Makefile       |   1 +
> >   drivers/platform/x86/asus-armoury.c | 563 ++++++++++++++++++++++++=
++++
> >   drivers/platform/x86/asus-armoury.h | 146 ++++++++
> >   4 files changed, 723 insertions(+)
> >   create mode 100644 drivers/platform/x86/asus-armoury.c
> >   create mode 100644 drivers/platform/x86/asus-armoury.h
> >=20
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kco=
nfig
> > index 3875abba5a79..dedf66e0d099 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -265,6 +265,19 @@ config ASUS_WIRELESS
> >     If you choose to compile this driver as a module the module will=
 be
> >     called asus-wireless.
> >  =20
> > +config ASUS_ARMOURY
> > + tristate "ASUS Armoury driver"
> > + depends on ACPI_WMI
>=20
> I don't think you need to depend on ACPI_WMI directly because ASUS_WMI=20
> also depends on it.

Ack

> > + depends on ASUS_WMI
> > + select FW_ATTR_CLASS
> > + help
> > +   Say Y here if you have a WMI aware Asus machine and would like t=
o use the
> > +   firmware_attributes API to control various settings typically ex=
posed in
> > +   the ASUS Armoury Crate application available on Windows.
> > +
> > +   To compile this driver as a module, choose M here: the module wi=
ll
> > +   be called asus-armoury.
> > +
> >   config ASUS_WMI
> >   tristate "ASUS WMI Driver"
> >   depends on ACPI_WMI
> > diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Ma=
kefile
> > index e1b142947067..fe3e7e7dede8 100644
> > --- a/drivers/platform/x86/Makefile
> > +++ b/drivers/platform/x86/Makefile
> > @@ -32,6 +32,7 @@ obj-$(CONFIG_APPLE_GMUX) +=3D apple-gmux.o
> >   # ASUS
> >   obj-$(CONFIG_ASUS_LAPTOP) +=3D asus-laptop.o
> >   obj-$(CONFIG_ASUS_WIRELESS) +=3D asus-wireless.o
> > +obj-$(CONFIG_ASUS_ARMOURY) +=3D asus-armoury.o
> >   obj-$(CONFIG_ASUS_WMI) +=3D asus-wmi.o
> >   obj-$(CONFIG_ASUS_NB_WMI) +=3D asus-nb-wmi.o
> >   obj-$(CONFIG_ASUS_TF103C_DOCK) +=3D asus-tf103c-dock.o
> > diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/=
x86/asus-armoury.c
> > new file mode 100644
> > index 000000000000..39e422b16b8e
> > --- /dev/null
> > +++ b/drivers/platform/x86/asus-armoury.c
> > @@ -0,0 +1,563 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Asus Armoury (WMI) attributes driver. This driver uses the fw_at=
tributes
> > + * class to expose the various WMI functions that many gaming and s=
ome
> > + * non-gaming ASUS laptops have available.
> > + * These typically don't fit anywhere else in the sysfs such as und=
er LED class,
> > + * hwmon or other, and are set in Windows using the ASUS Armoury Cr=
ate tool.
> > + *
> > + * Copyright(C) 2010 Intel Corporation.
> > + * Copyright(C) 2024-2024 Luke Jones <luke@ljones.dev>
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/device.h>
> > +#include <linux/dmi.h>
> > +#include <linux/errno.h>
> > +#include <linux/fs.h>
> > +#include <linux/kernel.h>
> > +#include <linux/kmod.h>
> > +#include <linux/kobject.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/platform_data/x86/asus-wmi.h>
> > +#include <linux/types.h>
> > +
> > +#include "asus-armoury.h"
> > +#include "firmware_attributes_class.h"
> > +#include "asus-wmi.h"
> > +
> > +#define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1=
C"
> > +
> > +#define ASUS_MINI_LED_MODE_MASK 0x03
> > +/* Standard modes for devices with only on/off */
> > +#define ASUS_MINI_LED_OFF 0x00
> > +#define ASUS_MINI_LED_ON 0x01
> > +/* Like "on" but the effect is more vibrant or brighter */
> > +#define ASUS_MINI_LED_STRONG_MODE 0x02
> > +/* New modes for devices with 3 mini-led mode types */
> > +#define ASUS_MINI_LED_2024_WEAK 0x00
> > +#define ASUS_MINI_LED_2024_STRONG 0x01
> > +#define ASUS_MINI_LED_2024_OFF 0x02
> > +
> > +/* Default limits for tunables available on ASUS ROG laptops */
> > +#define PPT_CPU_LIMIT_MIN 5
> > +#define PPT_CPU_LIMIT_MAX 150
> > +#define PPT_CPU_LIMIT_DEFAULT 80
> > +#define PPT_PLATFORM_MIN 5
> > +#define PPT_PLATFORM_MAX 100
> > +#define PPT_PLATFORM_DEFAULT 80
> > +#define NVIDIA_BOOST_MIN 5
> > +#define NVIDIA_BOOST_MAX 25
> > +#define NVIDIA_TEMP_MIN 75
> > +#define NVIDIA_TEMP_MAX 87
>=20
> Purely for alphabetical order purposes shouldn't NVIDIA_* come before =
PPT*?

I guess :)

> Also can you leave a comment where these default limits come from?

Ack

> > +
> > +static const struct class *fw_attr_class;
> > +
> > +struct asus_armoury_priv {
> > + struct device *fw_attr_dev;
> > + struct kset *fw_attr_kset;
> > +
> > + u32 mini_led_dev_id;
> > + u32 gpu_mux_dev_id;
> > +
> > + struct mutex mutex;
> > +};
> > +
> > +static struct asus_armoury_priv asus_armoury =3D { .mutex =3D __MUT=
EX_INITIALIZER(
> > + asus_armoury.mutex) };
> > +
> > +struct fw_attrs_group {
> > + bool pending_reboot;
> > +};
> > +
> > +static struct fw_attrs_group fw_attrs =3D {
> > + .pending_reboot =3D false,
> > +};
> > +
> > +struct asus_attr_group {
> > + const struct attribute_group *attr_group;
> > + u32 wmi_devid;
> > +};
> > +
> > +static bool asus_wmi_is_present(u32 dev_id)
> > +{
> > + u32 retval;
> > + int status;
> > +
> > + status =3D asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id=
, 0, &retval);
> > + pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id,=
 retval);
> > +
> > + return status =3D=3D 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>=20
> It seems like you're hiding the potential ACPI failures which could ma=
ke=20
> this a bit harder to debug in the future.  What do you think about doi=
ng=20
> it like this:
>=20
> u32 ret;
>=20
> if (!asus_wmi_evaluate_method()) {
> pr_debug("acpi_wmi_evaluate_method failed\n");
> return false;
> }
>=20
> return ret & ASUS_WMI_DSDTS_PRESENCE_BIT;
>=20
> > +}
> > +
> > +static void asus_set_reboot_and_signal_event(void)
> > +{
> > + fw_attrs.pending_reboot =3D true;
> > + kobject_uevent(&asus_armoury.fw_attr_dev->kobj, KOBJ_CHANGE);
> > +}
> > +
> > +static ssize_t pending_reboot_show(struct kobject *kobj, struct kob=
j_attribute *attr, char *buf)
> > +{
> > + return sysfs_emit(buf, "%d\n", fw_attrs.pending_reboot);
> > +}
> > +
> > +static struct kobj_attribute pending_reboot =3D __ATTR_RO(pending_r=
eboot);
> > +
> > +static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> > +{
> > + return !strcmp(attr->attr.name, "gpu_mux_mode");
> > +}
> > +
> > +/**
> > + * attr_int_store() - Generic store function for use with most WMI =
functions.
> > + * @kobj: Pointer to the driver object.
> > + * @kobj_attribute: Pointer to the attribute calling this function.
> > + * @buf: The buffer to read from, this is parsed to `int` type.
> > + * @count:
>=20
> Missing a description here.

Ack

>=20
> > + * @min: Minimum accepted value. Below this returns -EINVAL.
> > + * @max: Maximum accepted value. Above this returns -EINVAL.
> > + * @store_value: Pointer to where the parsed value should be stored.
> > + * @wmi_dev: The WMI function ID to use.
> > + *
> > + * The WMI functions available on most ASUS laptops return a 1 as "=
success", and
> > + * a 0 as failed. However some functions can return n > 1 for addit=
ional errors.
> > + * attr_int_store() currently treats all values which are not 1 as =
errors, ignoring
>=20
> IMO; Don't refer to function() in the description.

Ack

>=20
> > + * the possible differences in WMI error returns.
> > + *
> > + * Returns: Either count, or an error.
> > + */
> > +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_att=
ribute *attr, const char *buf,
> > +       size_t count, u32 min, u32 max, u32 *store_value, u32 wmi_de=
v)
> > +{
> > + u32 result, value;
> > + int err;
> > +
> > + err =3D kstrtouint(buf, 10, &value);
> > + if (err)
> > + return err;
> > +
> > + if (value < min || value > max)
> > + return -EINVAL;
> > +
> > + err =3D asus_wmi_set_devstate(wmi_dev, value, &result);
> > + if (err) {
> > + pr_err("Failed to set %s: %d\n", attr->attr.name, err);
> > + return err;
> > + }
> > +
> > + if (result !=3D 1) {
> > + pr_err("Failed to set %s (result): 0x%x\n", attr->attr.name, resul=
t);
> > + return -EIO;
> > + }
> > +
> > + if (store_value !=3D NULL)
> > + *store_value =3D value;
> > + sysfs_notify(kobj, NULL, attr->attr.name);
> > +
> > + if (asus_bios_requires_reboot(attr))
> > + asus_set_reboot_and_signal_event();
> > +
> > + return count;
> > +}
> > +
> > +/* Mini-LED mode **************************************************=
************/
> > +static ssize_t mini_led_mode_current_value_show(struct kobject *kob=
j,
> > + struct kobj_attribute *attr, char *buf)
> > +{
> > + u32 value;
> > + int err;
> > +
> > + err =3D asus_wmi_get_devstate_dsts(asus_armoury.mini_led_dev_id, &=
value);
> > + if (err)
> > + return err;
> > +
> > + value &=3D ASUS_MINI_LED_MODE_MASK;
> > +
> > + /*
> > + * Remap the mode values to match previous generation mini-LED. The=
 last gen
> > + * WMI 0 =3D=3D off, while on this version WMI 2 =3D=3D off (flippe=
d).
> > + */
> > + if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MO=
DE2) {
> > + switch (value) {
> > + case ASUS_MINI_LED_2024_WEAK:
> > + value =3D ASUS_MINI_LED_ON;
> > + break;
> > + case ASUS_MINI_LED_2024_STRONG:
> > + value =3D ASUS_MINI_LED_STRONG_MODE;
> > + break;
> > + case ASUS_MINI_LED_2024_OFF:
> > + value =3D ASUS_MINI_LED_OFF;
> > + break;
> > + }
> > + }
> > +
> > + return sysfs_emit(buf, "%u\n", value);
> > +}
> > +
> > +static ssize_t mini_led_mode_current_value_store(struct kobject *ko=
bj,
> > + struct kobj_attribute *attr, const char *buf,
> > + size_t count)
> > +{
> > + int result, err;
> > + u32 mode;
> > +
> > + err =3D kstrtou32(buf, 10, &mode);
> > + if (err)
> > + return err;
> > +
> > + if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MO=
DE &&
> > +     mode > ASUS_MINI_LED_ON)
> > + return -EINVAL;
> > + if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MO=
DE2 &&
> > +     mode > ASUS_MINI_LED_STRONG_MODE)
> > + return -EINVAL;
> > +
> > + /*
> > + * Remap the mode values so expected behaviour is the same as the l=
ast
> > + * generation of mini-LED with 0 =3D=3D off, 1 =3D=3D on.
> > + */
> > + if (asus_armoury.mini_led_dev_id =3D=3D ASUS_WMI_DEVID_MINI_LED_MO=
DE2) {
> > + switch (mode) {
> > + case ASUS_MINI_LED_OFF:
> > + mode =3D ASUS_MINI_LED_2024_OFF;
> > + break;
> > + case ASUS_MINI_LED_ON:
> > + mode =3D ASUS_MINI_LED_2024_WEAK;
> > + break;
> > + case ASUS_MINI_LED_STRONG_MODE:
> > + mode =3D ASUS_MINI_LED_2024_STRONG;
> > + break;
> > + }
> > + }
> > +
> > + err =3D asus_wmi_set_devstate(asus_armoury.mini_led_dev_id, mode, =
&result);
> > + if (err) {
> > + pr_warn("Failed to set mini-LED: %d\n", err);
> > + return err;
> > + }
> > +
> > + if (result !=3D 1) {
> > + pr_warn("Failed to set mini-LED mode (result): 0x%x\n", result);
> > + return -EIO;
> > + }
> > +
> > + sysfs_notify(kobj, NULL, attr->attr.name);
> > +
> > + return count;
> > +}
> > +
> > +static ssize_t mini_led_mode_possible_values_show(struct kobject *k=
obj,
> > +   struct kobj_attribute *attr, char *buf)
> > +{
> > + switch (asus_armoury.mini_led_dev_id) {
> > + case ASUS_WMI_DEVID_MINI_LED_MODE:
> > + return sysfs_emit(buf, "0;1\n");
> > + case ASUS_WMI_DEVID_MINI_LED_MODE2:
> > + return sysfs_emit(buf, "0;1;2\n");
> > + }
> > +
> > + return sysfs_emit(buf, "0\n");
> > +}
> > +
> > +ATTR_GROUP_ENUM_CUSTOM(mini_led_mode, "mini_led_mode", "Set the min=
i-LED backlight mode");
> > +
> > +static ssize_t gpu_mux_mode_current_value_store(struct kobject *kob=
j,
> > + struct kobj_attribute *attr, const char *buf,
> > + size_t count)
> > +{
> > + int result, err;
> > + u32 optimus;
> > +
> > + err =3D kstrtou32(buf, 10, &optimus);
> > + if (err)
> > + return err;
> > +
> > + if (optimus > 1)
> > + return -EINVAL;
> > +
> > + if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
> > + err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_DGPU, &result);
> > + if (err)
> > + return err;
> > + if (result && !optimus) {
> > + err =3D -ENODEV;
> > + pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %0=
2X %02X %d\n",
> > + result, optimus, err);
> > + return err;
> > + }
> > + }
> > +
> > + if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
> > + err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU, &result);
> > + if (err)
> > + return err;
> > + if (result && !optimus) {
> > + err =3D -ENODEV;
> > + pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled: %d\=
n",
> > + err);
> > + return err;
> > + }
> > + }
> > +
> > + err =3D asus_wmi_set_devstate(asus_armoury.gpu_mux_dev_id, optimus=
, &result);
> > + if (err) {
> > + pr_err("Failed to set GPU MUX mode: %d\n", err);
> > + return err;
> > + }
> > + /* !1 is considered a fail by ASUS */
> > + if (result !=3D 1) {
> > + pr_warn("Failed to set GPU MUX mode (result): 0x%x\n", result);
> > + return -EIO;
> > + }
> > +
> > + sysfs_notify(kobj, NULL, attr->attr.name);
> > + asus_set_reboot_and_signal_event();
> > +
> > + return count;
> > +}
> > +WMI_SHOW_INT(gpu_mux_mode_current_value, "%d\n", asus_armoury.gpu_m=
ux_dev_id);
> > +ATTR_GROUP_BOOL_CUSTOM(gpu_mux_mode, "gpu_mux_mode", "Set the GPU d=
isplay MUX mode");
> > +
> > +/*
> > + * A user may be required to store the value twice, typical store f=
irst, then
> > + * rescan PCI bus to activate power, then store a second time to sa=
ve correctly.
> > + * The reason for this is that an extra code path in the ACPI is en=
abled when
> > + * the device and bus are powered.
> > + */
> > +static ssize_t dgpu_disable_current_value_store(struct kobject *kob=
j,
> > + struct kobj_attribute *attr, const char *buf,
> > + size_t count)
> > +{
> > + int result, err;
> > + u32 disable;
> > +
> > + err =3D kstrtou32(buf, 10, &disable);
> > + if (err)
> > + return err;
> > +
> > + if (disable > 1)
> > + return -EINVAL;
> > +
> > + if (asus_armoury.gpu_mux_dev_id) {
> > + err =3D asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &r=
esult);
> > + if (err)
> > + return err;
> > + if (!result && disable) {
> > + err =3D -ENODEV;
> > + pr_warn("Can not disable dGPU when the MUX is in dGPU mode: %d\n",=
 err);
> > + return err;
> > + }
> > + }
> > +
> > + err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, disable, &resul=
t);
> > + if (err) {
> > + pr_warn("Failed to set dGPU disable: %d\n", err);
> > + return err;
> > + }
> > +
> > + if (result !=3D 1) {
> > + pr_warn("Failed to set dGPU disable (result): 0x%x\n", result);
> > + return -EIO;
> > + }
> > +
> > + sysfs_notify(kobj, NULL, attr->attr.name);
> > +
> > + return count;
> > +}
> > +WMI_SHOW_INT(dgpu_disable_current_value, "%d\n", ASUS_WMI_DEVID_DGP=
U);
> > +ATTR_GROUP_BOOL_CUSTOM(dgpu_disable, "dgpu_disable", "Disable the d=
GPU");
> > +
> > +/* The ACPI call to enable the eGPU also disables the internal dGPU=
 */
> > +static ssize_t egpu_enable_current_value_store(struct kobject *kobj=
, struct kobj_attribute *attr,
> > +        const char *buf, size_t count)
> > +{
> > + int result, err;
> > + u32 enable;
> > +
> > + err =3D kstrtou32(buf, 10, &enable);
> > + if (err)
> > + return err;
> > +
> > + if (enable > 1)
> > + return -EINVAL;
> > +
> > + err =3D asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU_CONNECTED, =
&result);
> > + if (err) {
> > + pr_warn("Failed to get eGPU connection status: %d\n", err);
> > + return err;
> > + }
> > +
> > + if (asus_armoury.gpu_mux_dev_id) {
> > + err =3D asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &r=
esult);
> > + if (err) {
> > + pr_warn("Failed to get GPU MUX status: %d\n", result);
> > + return result;
> > + }
> > + if (!result && enable) {
> > + err =3D -ENODEV;
> > + pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n", =
err);
> > + return err;
> > + }
> > + }
> > +
> > + err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result=
);
> > + if (err) {
> > + pr_warn("Failed to set eGPU state: %d\n", err);
> > + return err;
> > + }
> > +
> > + if (result !=3D 1) {
> > + pr_warn("Failed to set eGPU state (retval): 0x%x\n", result);
> > + return -EIO;
> > + }
> > +
> > + sysfs_notify(kobj, NULL, attr->attr.name);
> > +
> > + return count;
> > +}
> > +WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU=
);
> > +ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU=
 (also disables dGPU)");
> > +
> > +/* Simple attribute creation */
> > +ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_C=
HARGE_MODE, "0;1;2",
> > +        "Show the current mode of charging");
> > +
> > +ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SO=
UND,
> > +    "Set the boot POST sound");
> > +ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_M=
CU_POWERSAVE,
> > +    "Set MCU powersaving mode");
> > +ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANE=
L_OD,
> > +    "Set the panel refresh overdrive");
> > +ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID=
_EGPU_CONNECTED,
> > +    "Show the eGPU connection status");
> > +
> > +/* If an attribute does not require any special case handling add i=
t here */
> > +static const struct asus_attr_group armoury_attr_groups[] =3D {
> > + { &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
> > + { &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> > + { &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> > +
> > + { &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
> > + { &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> > + { &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
> > + { &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
> > +};
> > +
> > +static int asus_fw_attr_add(void)
> > +{
> > + int err;
> > +
> > + err =3D fw_attributes_class_get(&fw_attr_class);
> > + if (err)
> > + goto fail_class_created;
>=20
> Is that right?  If you fail to get the class shouldn't you just return=20
> an error code?

Indeed. I think I misread what i was referring to when I was learning ho=
w to use this. Changed.

>=20
> > +
> > + asus_armoury.fw_attr_dev =3D
> > + device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", DRIVER=
_NAME);
> > +
> > + if (IS_ERR(asus_armoury.fw_attr_dev)) {
> > + err =3D PTR_ERR(asus_armoury.fw_attr_dev);
> > + goto fail_class_created;
> > + }
> > +
> > + asus_armoury.fw_attr_kset =3D
> > + kset_create_and_add("attributes", NULL, &asus_armoury.fw_attr_dev-=
>kobj);
> > + if (!asus_armoury.fw_attr_dev) {
> > + err =3D -ENOMEM;
> > + pr_debug("Failed to create and add attributes\n");
> > + goto err_destroy_classdev;
> > + }
> > +
> > + err =3D sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &pendi=
ng_reboot.attr);
> > + if (err) {
> > + pr_warn("Failed to create sysfs level attributes\n");
> > + goto fail_class_created;
> > + }
> > +
> > + err =3D 0;
> This seems unnecessary.

I think my logic was I wasn't sure if the following body would set it. S=
o be safe? But then if the previous code succeeeds then this shouldn't b=
e set anyway :)

Removed in both locations.

>=20
> > + asus_armoury.mini_led_dev_id =3D 0;
> > + if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
> > + asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
> > + err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> > + &mini_led_mode_attr_group);
> > + } else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
> > + asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE2;
> > + err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> > + &mini_led_mode_attr_group);
> > + }
> > + if (err)
> > + pr_warn("Failed to create sysfs-group for mini_led\n");
>=20
> Shouldn't you fail and clean up here?

Honestly not sure. It's only a failed WMI call, and the group doesn't ge=
t created for that fail, the others might be fine. I'll defer to your ad=
vice on that.

> > +
> > + err =3D 0;
>=20
> Assuming you follow my above comment this is unnecessary.

Ack

>=20
> > + asus_armoury.gpu_mux_dev_id =3D 0;
> > + if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX)) {
> > + asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX;
> > + err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> > + &gpu_mux_mode_attr_group);
> > + } else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO)) {
> > + asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX_VIVO;
> > + err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> > + &gpu_mux_mode_attr_group);
> > + }
> > + if (err)
> > + pr_warn("Failed to create sysfs-group for gpu_mux\n");
>=20
> Shouldn't you fail and clean up here?

Same as comment above the above

> > +
> > + for (int i =3D 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
> > + if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
> > + continue;
> > +
> > + err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> > + armoury_attr_groups[i].attr_group);
> > + if (err)
> > + pr_warn("Failed to create sysfs-group for %s\n",
> > + armoury_attr_groups[i].attr_group->name);
>=20
> Shouldn't you fail and clean up here?
>=20
> > + else
> > + pr_debug("Created sysfs-group for %s\n",
> > + armoury_attr_groups[i].attr_group->name);
> > + }
> > +
> > + return 0;
> > +
> > +err_destroy_classdev:
> > + device_destroy(fw_attr_class, MKDEV(0, 0));
> > +
> > +fail_class_created:
> > + fw_attributes_class_put();
> > + return err;
> > +}
> > +
> > +/* Init / exit ****************************************************=
************/
> > +
> > +static int __init asus_fw_init(void)
> > +{
> > + int err;
> > +
> > + fw_attrs.pending_reboot =3D false;
>=20
> Isn't it already initialized to false?

Rust makes me cautious :D. Removed.

>=20
> > +
> > + err =3D asus_fw_attr_add();
> > + if (err)
> > + return err;
> > +
> > + return 0;
> > +}
> > +
> > +static void __exit asus_fw_exit(void)
> > +{
> > + mutex_lock(&asus_armoury.mutex);
>=20
> I think you should be using this mutex more.  For example what if an=20
> attribute is being written while the module is unloaded?

Good point. I'll adjust code to suit. However if I do, this will trickle=
 through the other patches I've added your review tag to. Will this be o=
kay?

>=20
> > +
> > + sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboo=
t.attr);
> > + kset_unregister(asus_armoury.fw_attr_kset);
> > + device_destroy(fw_attr_class, MKDEV(0, 0));
> > + fw_attributes_class_put();
> > +
> > + mutex_unlock(&asus_armoury.mutex);
> > +}
> > +
> > +module_init(asus_fw_init);
> > +module_exit(asus_fw_exit);
> > +
> > +MODULE_IMPORT_NS(ASUS_WMI);
> > +MODULE_AUTHOR("Luke Jones <luke@ljones.dev>");
> > +MODULE_DESCRIPTION("ASUS BIOS Configuration Driver");
> > +MODULE_LICENSE("GPL");
> > +MODULE_ALIAS("wmi:" ASUS_NB_WMI_EVENT_GUID);
> > diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/=
x86/asus-armoury.h
> > new file mode 100644
> > index 000000000000..b99fd136abf1
> > --- /dev/null
> > +++ b/drivers/platform/x86/asus-armoury.h
> > @@ -0,0 +1,146 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * Definitions for kernel modules using asus-armoury driver
> > + *
> > + *  Copyright (c) 2024 Luke Jones <luke@ljones.dev>
> > + */
> > +
> > +#ifndef _ASUS_BIOSCFG_H_
> > +#define _ASUS_BIOSCFG_H_
> > +
> > +#include <linux/types.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DRIVER_NAME "asus-armoury"
> > +
> > +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_att=
ribute *attr,
> > +       const char *buf, size_t count, u32 min, u32 max,
> > +       u32 *store_value, u32 wmi_dev);
> > +
> > +static ssize_t enum_type_show(struct kobject *kobj, struct kobj_att=
ribute *attr,
> > +       char *buf)
> > +{
> > + return sysfs_emit(buf, "enumeration\n");
> > +}
> > +
> > +#define __ASUS_ATTR_RO(_func, _name)                               =
   \
> > + {                                                             \
> > + .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> > + .show =3D _func##_##_name##_show,                       \
> > + }
> > +
> > +#define __ASUS_ATTR_RO_AS(_name, _show)                            =
   \
> > + {                                                             \
> > + .attr =3D { .name =3D __stringify(_name), .mode =3D 0444 }, \
> > + .show =3D _show,                                        \
> > + }
> > +
> > +#define __ASUS_ATTR_RW(_func, _name) \
> > + __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_stor=
e)
> > +
> > +#define __WMI_STORE_INT(_attr, _min, _max, _wmi)                   =
       \
> > + static ssize_t _attr##_store(struct kobject *kobj,                \
> > +      struct kobj_attribute *attr,         \
> > +      const char *buf, size_t count)       \
> > + {                                                                 \
> > + return attr_int_store(kobj, attr, buf, count, _min, _max, \
> > +       NULL, _wmi);                        \
> > + }
> > +
> > +#define WMI_SHOW_INT(_attr, _fmt, _wmi)                            =
         \
> > + static ssize_t _attr##_show(struct kobject *kobj,                 =
  \
> > +     struct kobj_attribute *attr, char *buf) \
> > + {                                                                 =
  \
> > + u32 result;                                                 \
> > + int err;                                                    \
> > + err =3D asus_wmi_get_devstate_dsts(_wmi, &result);            \
> > + if (err)                                                    \
> > + return err;                                         \
> > + return sysfs_emit(buf, _fmt,                                \
> > +   result & ~ASUS_WMI_DSTS_PRESENCE_BIT);    \
> > + }
> > +
> > +/* Create functions and attributes for use in other macros or on th=
eir own */
> > +
> > +#define __ATTR_CURRENT_INT_RO(_attr, _wmi)                         =
 \
> > + WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
> > + static struct kobj_attribute attr_##_attr##_current_value =3D \
> > + __ASUS_ATTR_RO(_attr, current_value)
> > +
> > +#define __ATTR_CURRENT_INT_RW(_attr, _minv, _maxv, _wmi)           =
 \
> > + __WMI_STORE_INT(_attr##_current_value, _minv, _maxv, _wmi); \
> > + WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
> > + static struct kobj_attribute attr_##_attr##_current_value =3D \
> > + __ASUS_ATTR_RW(_attr, current_value)
> > +
> > +/* Shows a formatted static variable */
> > +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)              =
           \
> > + static ssize_t _attrname##_##_prop##_show(                        =
    \
> > + struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> > + {                                                                 =
    \
> > + return sysfs_emit(buf, _fmt, _val);                           \
> > + }                                                                 =
    \
> > + static struct kobj_attribute attr_##_attrname##_##_prop =3D       =
      \
> > + __ASUS_ATTR_RO(_attrname, _prop)
> > +
> > +/* Boolean style enumeration, base macro. Requires adding show/stor=
e */
> > +#define __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)=
     \
> > + __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
> > + __ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible); \
> > + static struct kobj_attribute attr_##_attrname##_type =3D          \
> > + __ASUS_ATTR_RO_AS(type, enum_type_show);                \
> > + static struct attribute *_attrname##_attrs[] =3D {                \
> > + &attr_##_attrname##_current_value.attr,                 \
> > + &attr_##_attrname##_display_name.attr,                  \
> > + &attr_##_attrname##_possible_values.attr,               \
> > + &attr_##_attrname##_type.attr,                          \
> > + NULL                                                    \
> > + };                                                              \
> > + static const struct attribute_group _attrname##_attr_group =3D {  \
> > + .name =3D _fsname, .attrs =3D _attrname##_attrs             \
> > + }
> > +
> > +#define ATTR_GROUP_BOOL_RO(_attrname, _fsname, _wmi, _dispname) \
> > + __ATTR_CURRENT_INT_RO(_attrname, _wmi);                 \
> > + __ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> > +
> > +#define ATTR_GROUP_BOOL_RW(_attrname, _fsname, _wmi, _dispname) \
> > + __ATTR_CURRENT_INT_RW(_attrname, 0, 1, _wmi);           \
> > + __ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> > +
> > +/*
> > + * Requires <name>_current_value_show(), <name>_current_value_show()
> > + */
> > +#define ATTR_GROUP_BOOL_CUSTOM(_attrname, _fsname, _dispname)      =
     \
> > + static struct kobj_attribute attr_##_attrname##_current_value =3D \
> > + __ASUS_ATTR_RW(_attrname, current_value);               \
> > + __ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> > +
> > +#define ATTR_GROUP_ENUM_INT_RO(_attrname, _fsname, _wmi, _possible,=
 _dispname) \
> > + __ATTR_CURRENT_INT_RO(_attrname, _wmi);                           =
     \
> > + __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)
> > +
> > +/*
> > + * Requires <name>_current_value_show(), <name>_current_value_show()
> > + * and <name>_possible_values_show()
> > + */
> > +#define ATTR_GROUP_ENUM_CUSTOM(_attrname, _fsname, _dispname)      =
       \
> > + __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);      \
> > + static struct kobj_attribute attr_##_attrname##_current_value =3D =
  \
> > + __ASUS_ATTR_RW(_attrname, current_value);                 \
> > + static struct kobj_attribute attr_##_attrname##_possible_values =3D=
 \
> > + __ASUS_ATTR_RO(_attrname, possible_values);               \
> > + static struct kobj_attribute attr_##_attrname##_type =3D          =
  \
> > + __ASUS_ATTR_RO_AS(type, enum_type_show);                  \
> > + static struct attribute *_attrname##_attrs[] =3D {                =
  \
> > + &attr_##_attrname##_current_value.attr,                   \
> > + &attr_##_attrname##_display_name.attr,                    \
> > + &attr_##_attrname##_possible_values.attr,                 \
> > + &attr_##_attrname##_type.attr,                            \
> > + NULL                                                      \
> > + };                                                                \
> > + static const struct attribute_group _attrname##_attr_group =3D {  =
  \
> > + .name =3D _fsname, .attrs =3D _attrname##_attrs               \
> > + }
> > +
> > +#endif /* _ASUS_BIOSCFG_H_ */
>=20
>=20

