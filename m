Return-Path: <linux-input+bounces-6872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 17397989832
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99597B21A1A
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 22:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87861811F7;
	Sun, 29 Sep 2024 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="wJRn00VR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kbONmru8"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BC12B9B7;
	Sun, 29 Sep 2024 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727647356; cv=none; b=KwIzIa064/xmpch7q47GQpRSuIvIBIFgoVIKzlHskmW3gc02JKM/1ecKeQe/DMhldMaXffdWnjSNyf9+x38vu51UiTRHD9WUn/WPDEbAF/BQkGI/MHpZQSCXkNAtD/xeIusvC9uwHqkOPGPmUnTyi9GlHStBQ8AIsO/MI2j3pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727647356; c=relaxed/simple;
	bh=PaSdpU7JhP811LKAn2ma3fjculXtwGUNDPT64Dets58=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tE1cZR3hPocfwHisdcQmyaT7H70T91BtnvIo5h2klKEOuc7tmo80y9TdZZPFbQLtkLg66mNTkdJsV/VKPJ0cv4NmC0puzR/gRGJ1/BPu4SICwNnOc80p6BrAx/PSBUc1kiAJaZSxck5SpE/UMujyl9whoEyYYRl0bjU0JtAZoEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=wJRn00VR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kbONmru8; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 20DEC11400C3;
	Sun, 29 Sep 2024 18:02:32 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Sun, 29 Sep 2024 18:02:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727647352;
	 x=1727733752; bh=eu8D6IXsGeQ4D/v9UpPhnyU9+y8S5lyZk0vkQOY5IXk=; b=
	wJRn00VRlGHq/PT05KR0BiTuycciPPHs6f7PjMzy1D70DL4Xt6aoRBb0FUO1+Yai
	SwfGsXfwk10v3+JEStDNVEkndSY7fFXaa2yRDsQYoureVNqj7hbLhjmxy+XaB9LD
	y+q/dnS+K3jpCKlTLBCoA6LvfxOyjPcT4X0zg94XmJMDdQ2e4clvxyW3D9MHGIzb
	yWE2KHPJHpLr0vI5u6U75aIKRQommuc2VThUcyIQjfB31ZnGjF/br+u//UUotCZf
	JTo1Eumx1DQVHxUUinHLyXXbDXCOekKYihoy6uJ9UsTBKJQ8mOzd0xEYBKVkS7+K
	uHsmlN2IG2riy0R1P1VvYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727647352; x=
	1727733752; bh=eu8D6IXsGeQ4D/v9UpPhnyU9+y8S5lyZk0vkQOY5IXk=; b=k
	bONmru8rxm3rSNE0s0+M1dlmnspTP6SFHp9b6M1zHlK9XiDtuqiYqkItwcbqSEvN
	l6PhjbKbF4/COdCq5MR1OHpH6k7+F46tmT3EyuIfS0i1RVMpzgv3VSYV7S+Gfd2o
	204/1zWcxvArh3BKFuaPaK5v8Hf8qSfsF5k48IvtpQ49kCe0L1r4P0hwC4DNF34P
	I2bNJ0uTImJxtq9a2bOZQCwcmE8luliQGf/dtQtkYNs/j78b//xXSnjaQVeld+EM
	80MyR6timohNH8LzJmAFDjCtn5dA9PEMnDqG9mZhl8JgeVWrwXYjTUMQBJXsTJSf
	h8L2g+GXurPGXVcmQ8eDQ==
X-ME-Sender: <xms:d875Zq7fs1e-Hx0t-tGkIf5iSybdqC9MEfFInjeLVyLsNF0m7PnWog>
    <xme:d875Zj6t6lKQcXaVj0ZOCg4i525mrG1EnCafEIfhTQPjVWF00Ng0iCEIAi8mxt4d8
    phkj1QpAzdIX2F43-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgtdeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:d875ZpfPGZaweRcqcWD3pOvIH4a-1R_cI8huSjRGGEt04kMifu-36A>
    <xmx:d875ZnJ5lq-2LZztE8Uwhmn9OL_ORVyRqjVG_W45HJS7lfAJS16mxQ>
    <xmx:d875ZuLliQENBxBUM5xbl6XD21TKadbyIx9Lx-G2DF4VxjscoUYODA>
    <xmx:d875ZoyJfvU9zF4A0rE-92lTf0bt4xkk1iZTVeA0bOyoDcmWat3ngw>
    <xmx:eM75ZvoCcpVTv6gjHmYva505FKJOx_zLgQBzb6B82mcPanIgPHxcu39l>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 45F7A3360077; Sun, 29 Sep 2024 18:02:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Sep 2024 11:02:10 +1300
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Jiri Kosina" <jikos@kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <c3aa52a8-2954-4f61-b7dc-a7c4cdd1671f@app.fastmail.com>
In-Reply-To: <a1ef09c1-767b-4cab-90c6-b064e56f1246@kernel.org>
References: <20240929090813.7888-1-luke@ljones.dev>
 <20240929090813.7888-4-luke@ljones.dev>
 <a1ef09c1-767b-4cab-90c6-b064e56f1246@kernel.org>
Subject: Re: [PATCH v5 3/9] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 30 Sep 2024, at 7:53 AM, Mario Limonciello wrote:
> On 9/29/24 04:08, Luke D. Jones wrote:
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
>>   drivers/platform/x86/Kconfig               |  12 +
>>   drivers/platform/x86/Makefile              |   1 +
>>   drivers/platform/x86/asus-armoury.c        | 588 ++++++++++++++++++=
+++
>>   drivers/platform/x86/asus-armoury.h        | 146 +++++
>>   drivers/platform/x86/asus-wmi.c            |   4 -
>>   include/linux/platform_data/x86/asus-wmi.h |   3 +
>>   6 files changed, 750 insertions(+), 4 deletions(-)
>>   create mode 100644 drivers/platform/x86/asus-armoury.c
>>   create mode 100644 drivers/platform/x86/asus-armoury.h
>>=20
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
>> index 3875abba5a79..80ec8b45022d 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -265,6 +265,18 @@ config ASUS_WIRELESS
>>   	  If you choose to compile this driver as a module the module will=
 be
>>   	  called asus-wireless.
>>  =20
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
>>   config ASUS_WMI
>>   	tristate "ASUS WMI Driver"
>>   	depends on ACPI_WMI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
>> index e1b142947067..fe3e7e7dede8 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -32,6 +32,7 @@ obj-$(CONFIG_APPLE_GMUX)	+=3D apple-gmux.o
>>   # ASUS
>>   obj-$(CONFIG_ASUS_LAPTOP)	+=3D asus-laptop.o
>>   obj-$(CONFIG_ASUS_WIRELESS)	+=3D asus-wireless.o
>> +obj-$(CONFIG_ASUS_ARMOURY)	+=3D asus-armoury.o
>>   obj-$(CONFIG_ASUS_WMI)		+=3D asus-wmi.o
>>   obj-$(CONFIG_ASUS_NB_WMI)	+=3D asus-nb-wmi.o
>>   obj-$(CONFIG_ASUS_TF103C_DOCK)	+=3D asus-tf103c-dock.o
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x=
86/asus-armoury.c
>> new file mode 100644
>> index 000000000000..bde28f3cf57f
>> --- /dev/null
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -0,0 +1,588 @@
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
>> + * Copyright(C) 2024-2024 Luke Jones <luke@ljones.dev>
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
>> +
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
>> +};
>> +
>> +static struct asus_armoury_priv asus_armoury =3D { .mutex =3D __MUTE=
X_INITIALIZER(
>> +							 asus_armoury.mutex) };
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
>> +	if (err)
>> +		return err;
>> +
>> +	if (value < min || value > max)
>> +		return -EINVAL;
>> +
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err =3D asus_wmi_set_devstate(wmi_dev, value, &result);
>> +	mutex_unlock(&asus_armoury.mutex);
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
>> +	int err;
>> +
>> +	err =3D fw_attributes_class_get(&fw_attr_class);
>> +	if (err)
>> +		return err;
>> +
>> +	asus_armoury.fw_attr_dev =3D
>> +		device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", DRIVER=
_NAME);
>> +
>> +	if (IS_ERR(asus_armoury.fw_attr_dev)) {
>> +		err =3D PTR_ERR(asus_armoury.fw_attr_dev);
>> +		goto fail_class_created;
>> +	}
>> +
>> +	asus_armoury.fw_attr_kset =3D
>> +		kset_create_and_add("attributes", NULL, &asus_armoury.fw_attr_dev-=
>kobj);
>> +	if (!asus_armoury.fw_attr_dev) {
>> +		err =3D -ENOMEM;
>> +		pr_debug("Failed to create and add attributes\n");
>
> All the other failure paths look like they're pr_err() but this one is=20
> pr_debug().  Should it also be pr_err()?
>
>> +		goto err_destroy_classdev;
>> +	}
>> +
>> +	err =3D sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &pendin=
g_reboot.attr);
>> +	if (err) {
>> +		pr_err("Failed to create sysfs level attributes\n");
>> +		goto err_destroy_classdev;
>
> I think you're missing another cleanup path for kset_unregister(), no?

Indeed yes. Ack both comments, init is refactored to correctly clean up =
all things that may have been created.

>> +	}
>> +
>> +	asus_armoury.mini_led_dev_id =3D 0;
>> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
>> +		asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>> +					 &mini_led_mode_attr_group);
>> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
>> +		asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE2;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>> +					 &mini_led_mode_attr_group);
>> +	}
>> +	if (err) {
>> +		pr_err("Failed to create sysfs-group for mini_led\n");
>> +		goto err_destroy_classdev;
>> +	}
>> +
>> +	asus_armoury.gpu_mux_dev_id =3D 0;
>> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX)) {
>> +		asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>> +					 &gpu_mux_mode_attr_group);
>> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO)) {
>> +		asus_armoury.gpu_mux_dev_id =3D ASUS_WMI_DEVID_GPU_MUX_VIVO;
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>> +					 &gpu_mux_mode_attr_group);
>> +	}
>> +	if (err) {
>> +		pr_err("Failed to create sysfs-group for gpu_mux\n");
>> +		goto err_destroy_classdev;
>> +	}
>> +
>> +	for (int i =3D 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>> +		if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
>> +			continue;
>> +
>> +		err =3D sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>> +					 armoury_attr_groups[i].attr_group);
>> +		if (err) {
>> +			pr_err("Failed to create sysfs-group for %s\n",
>> +				armoury_attr_groups[i].attr_group->name);
>> +			goto err_destroy_classdev;
>> +		}
>> +		else {
>> +			pr_debug("Created sysfs-group for %s\n",
>> +				 armoury_attr_groups[i].attr_group->name);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_destroy_classdev:
>> +	device_destroy(fw_attr_class, MKDEV(0, 0));
>> +
>> +fail_class_created:
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
>> +
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
>> +
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
>> +		err =3D asus_wmi_get_devstate_dsts(_wmi, &result);            \
>> +		if (err)                                                    \
>> +			return err;                                         \
>> +		return sysfs_emit(buf, _fmt,                                \
>> +				  result & ~ASUS_WMI_DSTS_PRESENCE_BIT);    \
>> +	}
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
>>   #define to_asus_wmi_driver(pdrv)					\
>>   	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
>>  =20
>> -#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
>> -
>>   #define NOTIFY_BRNUP_MIN		0x11
>>   #define NOTIFY_BRNUP_MAX		0x1f
>>   #define NOTIFY_BRNDOWN_MIN		0x20
>> @@ -105,8 +103,6 @@ module_param(fnlock_default, bool, 0444);
>>   #define USB_INTEL_XUSB2PR		0xD0
>>   #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
>>  =20
>> -#define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
>> -
>>   #define WMI_EVENT_MASK			0xFFFF
>>  =20
>>   #define FAN_CURVE_POINTS		8
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/lin=
ux/platform_data/x86/asus-wmi.h
>> index 6ea4dedfb85e..21313e1eb6c9 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -6,6 +6,9 @@
>>   #include <linux/types.h>
>>   #include <linux/dmi.h>
>>  =20
>> +#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
>> +#define ASUS_ACPI_UID_ASUSWMI	"ASUSWMI"
>> +
>>   /* WMI Methods */
>>   #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECifica=
tion */
>>   #define ASUS_WMI_METHODID_SFBD		0x44424653 /* Set First Boot Device=
 */

