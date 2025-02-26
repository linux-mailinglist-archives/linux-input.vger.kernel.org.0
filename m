Return-Path: <linux-input+bounces-10381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F2A451C3
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 01:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CAB3189A720
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 00:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1EF11494C9;
	Wed, 26 Feb 2025 00:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="T5oq9OQW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m207YvBl"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE53625771;
	Wed, 26 Feb 2025 00:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740531445; cv=none; b=VxOH9H8LB7f30fU6Wypq0aHMChtuwb1ZzLIuTla8S362TUM06Wm5tLW7aorihOumGuN+u/9B8aYZT0CWC1xzcLUe+zgoJLXuANMPzfQvCyFa79egdxldqgSoQHOJ1AUei+0qrJWolc/6wokmbIMEy1KRCYGMptfIleZ5CsyVLM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740531445; c=relaxed/simple;
	bh=+OABZE4AXs3yQfkRfJbq1DYax0mO7zQB1DWw5ayqNbM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PMO1Bo+cd6IiA2KFvp6gLP/Y8ZYJjsXUSflE1XIGUbAUUkMFgC/79tc1XLjK0gmrFMUs3xio3donTc81VEqw6WVD6QYLYrhxnNi7aEvvKuXiqdbezEwvjAYP4jKIosKqNJMW9kQHohJf4wWpvB2fh5OLp91PUsReS3Rgcmuw6L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=T5oq9OQW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m207YvBl; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id CA8E31380A2A;
	Tue, 25 Feb 2025 19:57:21 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 25 Feb 2025 19:57:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1740531441;
	 x=1740617841; bh=fkmr3jVkMlq+5ztq39AZmd94l5GYuWwMf/NdP8JjrsU=; b=
	T5oq9OQWxl24I0Y95GkRCagDZq2J+oOG6qzC9WorbDMAyhcTq0K03w+bSuF+kl/y
	iGNPDwfn+TXSSFuko291nxlF+SdTi8nPgK34BM5maoThTBwzdcwbP79r06wCQitJ
	U4PBdzVZAXMON1Cy7y7ggIoOEXbmshBvWLMIn0zLnc2dAa7fdJ9+Ei6SSNWn/p0v
	fR9fQ1VKzz2OVvWypb5NpVJ6jgO03TLIV5HAMU1j112vnqHwPBpF9aZ7XMu4ipe5
	B85S7dwxJO/sAdfjfK8eAfla3eCBctTV9xN1NGD5eF2p6z9j+oWJEdHE+FMW0Plj
	ldBpoE4al1k8Av16YbOJZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740531441; x=
	1740617841; bh=fkmr3jVkMlq+5ztq39AZmd94l5GYuWwMf/NdP8JjrsU=; b=m
	207YvBlkhvpDZBIsvZhefURfnq3IywUDT9vhOBK26qgPAcRVM4ITEtQ4+/v0fZ8d
	O2Ro82SsbuDtcJXWCHh7XCmi80xjAp0J9wnha0PKgLugC73yKWiA0ZrQdZEiKmhX
	9xoppkU1KzyDNjYO5xZRgsLe5ciBD4+BDa+CZ8Tg1gIF5T8LOwRFDOwjYXOga+aq
	OxIz5dyIpd6cM2BfduJWReUhaA9mSfPFhqpTCljX7uhRseTIqquXIQujQLVL+e0s
	dXEclViNO41LjlBGv8SOTB5c4PengvRnWWBMcR3rozrFA/bNAMlNDVBglSjUAisg
	MYTkFkexcglcxGpUUv7sA==
X-ME-Sender: <xms:8Wa-Zz-trUM7txcMKTg1ISkD23eo369fAnwQdIvWNircflKkQGj7cQ>
    <xme:8Wa-Z_t5o3pvev8nGw6o0Qrhlx8KPctrMWZnCNQ2SclzJhNO2i9GYagCQQ6RBEZ0M
    foSkD1rrPvozJ3R2iQ>
X-ME-Received: <xmr:8Wa-ZxDK9iv_c2C1weId7Glgdz6DbRedi33dLhOF6FriweN7b-pbXsqC1bltXYCf95TToOUYtBrzytKZnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekfedvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttder
    jeenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvh
    eqnecuggftrfgrthhtvghrnhepkeefffeujeevueejueegleelhedtgedvledukedttdff
    hfeifeelvdduheefjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepkedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhiohdrlhhimhhonhgtihgvlh
    hlohesrghmugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrd
    gtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgv
    lhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8Wa-Z_fUQd27LabGAfAZDFLiCjKP953piWbsnhamD_0gXVLCEqT02g>
    <xmx:8Wa-Z4NbVRx87RBZyt8CKW5viBELCyI01o1pZ3XgIhDBuB65kKNCoA>
    <xmx:8Wa-ZxlFOjhbeyCXg6qUUItlAf_7ReKPBGUjN6eFxGLQIKS01k_7NQ>
    <xmx:8Wa-ZytzjR7_a2GOjM0OO9UZ7iKI5P4aLig8sZFYhUKeL9f3HOLVvg>
    <xmx:8Wa-Z_d4m8JcMcxh3PZ5nNYNIovQC_UCbGburAnLPwEEUg2Nm8tr9ctX>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Feb 2025 19:57:18 -0500 (EST)
Message-ID: <e02084eee192d22d15f60b58ff391b4f7da98679.camel@ljones.dev>
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: Refactor Ally suspend/resume
From: Luke Jones <luke@ljones.dev>
To: Mario Limonciello <mario.limonciello@amd.com>, 
	linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
	bentiss@kernel.org, jikos@kernel.org
Date: Wed, 26 Feb 2025 13:57:13 +1300
In-Reply-To: <323ade14-4d11-49b4-9657-a7f1900ec334@amd.com>
References: <20250225081744.92841-1-luke@ljones.dev>
	 <20250225081744.92841-3-luke@ljones.dev>
	 <323ade14-4d11-49b4-9657-a7f1900ec334@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-02-25 at 07:18 -0800, Mario Limonciello wrote:
> On 2/25/2025 00:17, Luke Jones wrote:
> > From: "Luke D. Jones" <luke@ljones.dev>
> >=20
> > Adjust how the CSEE direct call hack is used.
> >=20
> > The results of months of testing combined with help from ASUS to
> > determine the actual cause of suspend issues has resulted in this
> > refactoring which immensely improves the reliability for devices
> > which
> > do not have the following minimum MCU FW version:
> > - ROG Ally X: 313
> > - ROG Ally 1: 319
> >=20
> > For MCU FW versions that match the minimum or above the CSEE hack
> > is
> > disabled and mcu_powersave set to on by default as there are no
> > negatives beyond a slightly slower device reinitialization due to
> > the
> > MCU being powered off.
> >=20
> > As this is set only at module load time, it is still possible for
> > mcu_powersave sysfs attributes to change it at runtime if so
> > desired.
> >=20
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> > =C2=A0 drivers/hid/hid-asus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0 drivers/platform/x86/asus-wmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 124 ++++++++++++++--
> > -----
> > =C2=A0 include/linux/platform_data/x86/asus-wmi.h |=C2=A0 15 +++
> > =C2=A0 3 files changed, 104 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> > index e1e60b80115a..58794c9024cf 100644
> > --- a/drivers/hid/hid-asus.c
> > +++ b/drivers/hid/hid-asus.c
> > @@ -614,6 +614,9 @@ static void validate_mcu_fw_version(struct
> > hid_device *hdev, int idProduct)
> > =C2=A0=C2=A0			 "The MCU firmware version must be %d or
> > greater\n"
> > =C2=A0=C2=A0			 "Please update your MCU with official
> > ASUS firmware release\n",
> > =C2=A0=C2=A0			 min_version);
> > +	} else {
> > +		set_ally_mcu_hack(false);
>=20
> Rather than calling this to set a global, how about just
> unregistering=20
> the s2idle devops?
>=20

The main reason would be because `dev_pm_ops` is used to activate the
hack also and I need to block that too. This seemed the safest and
easiest way.

Ideally I would just remove the entire hack, but as there can still be
a few people out there with older versions I don't think that is wise
at all. Maybe in 6 months times we can revisit it.

Cheers,
Luke.

> > +		set_ally_mcu_powersave(true);
> > =C2=A0=C2=A0	}
> > =C2=A0 }
> > =C2=A0=20
> > @@ -1420,4 +1423,5 @@ static struct hid_driver asus_driver =3D {
> > =C2=A0 };
> > =C2=A0 module_hid_driver(asus_driver);
> > =C2=A0=20
> > +MODULE_IMPORT_NS("ASUS_WMI");
> > =C2=A0 MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/asus-wmi.c
> > b/drivers/platform/x86/asus-wmi.c
> > index 38ef778e8c19..9dba88a29e2c 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -142,16 +142,20 @@ module_param(fnlock_default, bool, 0444);
> > =C2=A0 #define ASUS_MINI_LED_2024_STRONG	0x01
> > =C2=A0 #define ASUS_MINI_LED_2024_OFF		0x02
> > =C2=A0=20
> > -/* Controls the power state of the USB0 hub on ROG Ally which
> > input is on */
> > =C2=A0 #define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> > -/* 300ms so far seems to produce a reliable result on AC and
> > battery */
> > -#define ASUS_USB0_PWR_EC0_CSEE_WAIT 1500
> > +/*
> > + * The period required to wait after screen off/on/s2idle.check in
> > MS.
> > + * Time here greatly impacts the wake behaviour. Used in
> > suspend/wake.
> > + */
> > +#define ASUS_USB0_PWR_EC0_CSEE_WAIT	600
> > +#define ASUS_USB0_PWR_EC0_CSEE_OFF	0xB7
> > +#define ASUS_USB0_PWR_EC0_CSEE_ON	0xB8
> > =C2=A0=20
> > =C2=A0 static const char * const ashs_ids[] =3D { "ATK4001", "ATK4002",
> > NULL };
> > =C2=A0=20
> > =C2=A0 static int throttle_thermal_policy_write(struct asus_wmi *);
> > =C2=A0=20
> > -static const struct dmi_system_id asus_ally_mcu_quirk[] =3D {
> > +static const struct dmi_system_id asus_rog_ally_device[] =3D {
> > =C2=A0=C2=A0	{
> > =C2=A0=C2=A0		.matches =3D {
> > =C2=A0=C2=A0			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
> > @@ -274,9 +278,6 @@ struct asus_wmi {
> > =C2=A0=C2=A0	u32 tablet_switch_dev_id;
> > =C2=A0=C2=A0	bool tablet_switch_inverted;
> > =C2=A0=20
> > -	/* The ROG Ally device requires the MCU USB device be
> > disconnected before suspend */
> > -	bool ally_mcu_usb_switch;
> > -
> > =C2=A0=C2=A0	enum fan_type fan_type;
> > =C2=A0=C2=A0	enum fan_type gpu_fan_type;
> > =C2=A0=C2=A0	enum fan_type mid_fan_type;
> > @@ -335,6 +336,9 @@ struct asus_wmi {
> > =C2=A0=C2=A0	struct asus_wmi_driver *driver;
> > =C2=A0 };
> > =C2=A0=20
> > +/* Global to allow setting externally without requiring driver
> > data */
> > +static bool use_ally_mcu_hack;
> > +
> > =C2=A0 /* WMI
> > *******************************************************************
> > *****/
> > =C2=A0=20
> > =C2=A0 static int asus_wmi_evaluate_method3(u32 method_id,
> > @@ -549,7 +553,7 @@ static int asus_wmi_get_devstate(struct
> > asus_wmi *asus, u32 dev_id, u32 *retval)
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > =C2=A0=20
> > -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> > +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> > =C2=A0=C2=A0				 u32 *retval)
> > =C2=A0 {
> > =C2=A0=C2=A0	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> > dev_id,
> > @@ -1343,6 +1347,38 @@ static ssize_t nv_temp_target_show(struct
> > device *dev,
> > =C2=A0 static DEVICE_ATTR_RW(nv_temp_target);
> > =C2=A0=20
> > =C2=A0 /* Ally MCU Powersave
> > ********************************************************/
> > +
> > +/*
> > + * The HID driver needs to check MCU version and set this to false
> > if the MCU FW
> > + * version is >=3D the minimum requirements. New FW do not need the
> > hacks.
> > + */
> > +void set_ally_mcu_hack(bool enabled)
> > +{
> > +	use_ally_mcu_hack =3D enabled;
> > +	pr_info("Disabled Ally MCU suspend quirks");
> > +}
> > +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_hack, "ASUS_WMI");
> > +
> > +/*
> > + * mcu_powersave should be enabled always, as it is fixed in MCU
> > FW versions:
> > + * - v313 for Ally X
> > + * - v319 for Ally 1
> > + * The HID driver checks MCU versions and so should set this if
> > requirements match
> > + */
> > +void set_ally_mcu_powersave(bool enabled)
> > +{
> > +	int result, err;
> > +
> > +	err =3D asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE,
> > enabled, &result);
> > +	if (err)
> > +		pr_warn("Failed to set MCU powersave: %d\n", err);
> > +	if (result > 1)
> > +		pr_warn("Failed to set MCU powersave (result):
> > 0x%x\n", result);
> > +
> > +	pr_info("Set mcu_powersave to enabled");
> > +}
> > +EXPORT_SYMBOL_NS_GPL(set_ally_mcu_powersave, "ASUS_WMI");
> > +
> > =C2=A0 static ssize_t mcu_powersave_show(struct device *dev,
> > =C2=A0=C2=A0				=C2=A0=C2=A0 struct device_attribute *attr,
> > char *buf)
> > =C2=A0 {
> > @@ -4711,6 +4747,18 @@ static int asus_wmi_add(struct
> > platform_device *pdev)
> > =C2=A0=C2=A0	if (err)
> > =C2=A0=C2=A0		goto fail_platform;
> > =C2=A0=20
> > +	use_ally_mcu_hack =3D acpi_has_method(NULL,
> > ASUS_USB0_PWR_EC0_CSEE)
> > +				&&
> > dmi_check_system(asus_rog_ally_device);
> > +	if (use_ally_mcu_hack && dmi_match(DMI_BOARD_NAME,
> > "RC71")) {
> > +		/*
> > +		 * These steps ensure the device is in a valid
> > good state, this is
> > +		 * especially important for the Ally 1 after a
> > reboot.
> > +		 */
> > +		acpi_execute_simple_method(NULL,
> > ASUS_USB0_PWR_EC0_CSEE,
> > +					=C2=A0=C2=A0
> > ASUS_USB0_PWR_EC0_CSEE_ON);
> > +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> > +	}
> > +
> > =C2=A0=C2=A0	/* ensure defaults for tunables */
> > =C2=A0=C2=A0	asus->ppt_pl2_sppt =3D 5;
> > =C2=A0=C2=A0	asus->ppt_pl1_spl =3D 5;
> > @@ -4723,8 +4771,6 @@ static int asus_wmi_add(struct
> > platform_device *pdev)
> > =C2=A0=C2=A0	asus->egpu_enable_available =3D
> > asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
> > =C2=A0=C2=A0	asus->dgpu_disable_available =3D
> > asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
> > =C2=A0=C2=A0	asus->kbd_rgb_state_available =3D
> > asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
> > -	asus->ally_mcu_usb_switch =3D acpi_has_method(NULL,
> > ASUS_USB0_PWR_EC0_CSEE)
> > -						&&
> > dmi_check_system(asus_ally_mcu_quirk);
> > =C2=A0=20
> > =C2=A0=C2=A0	if (asus_wmi_dev_is_present(asus,
> > ASUS_WMI_DEVID_MINI_LED_MODE))
> > =C2=A0=C2=A0		asus->mini_led_dev_id =3D
> > ASUS_WMI_DEVID_MINI_LED_MODE;
> > @@ -4910,34 +4956,6 @@ static int asus_hotk_resume(struct device
> > *device)
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > =C2=A0=20
> > -static int asus_hotk_resume_early(struct device *device)
> > -{
> > -	struct asus_wmi *asus =3D dev_get_drvdata(device);
> > -
> > -	if (asus->ally_mcu_usb_switch) {
> > -		/* sleep required to prevent USB0 being yanked
> > then reappearing rapidly */
> > -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL,
> > ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> > -			dev_err(device, "ROG Ally MCU failed to
> > connect USB dev\n");
> > -		else
> > -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> > -	}
> > -	return 0;
> > -}
> > -
> > -static int asus_hotk_prepare(struct device *device)
> > -{
> > -	struct asus_wmi *asus =3D dev_get_drvdata(device);
> > -
> > -	if (asus->ally_mcu_usb_switch) {
> > -		/* sleep required to ensure USB0 is disabled
> > before sleep continues */
> > -		if (ACPI_FAILURE(acpi_execute_simple_method(NULL,
> > ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> > -			dev_err(device, "ROG Ally MCU failed to
> > disconnect USB dev\n");
> > -		else
> > -			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> > -	}
> > -	return 0;
> > -}
> > -
> > =C2=A0 static int asus_hotk_restore(struct device *device)
> > =C2=A0 {
> > =C2=A0=C2=A0	struct asus_wmi *asus =3D dev_get_drvdata(device);
> > @@ -4978,11 +4996,34 @@ static int asus_hotk_restore(struct device
> > *device)
> > =C2=A0=C2=A0	return 0;
> > =C2=A0 }
> > =C2=A0=20
> > +static void asus_ally_s2idle_restore(void)
> > +{
> > +	if (use_ally_mcu_hack) {
> > +		acpi_execute_simple_method(NULL,
> > ASUS_USB0_PWR_EC0_CSEE,
> > +					=C2=A0=C2=A0
> > ASUS_USB0_PWR_EC0_CSEE_ON);
> > +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> > +	}
> > +}
> > +
> > +static int asus_hotk_prepare(struct device *device)
> > +{
> > +	if (use_ally_mcu_hack) {
> > +		acpi_execute_simple_method(NULL,
> > ASUS_USB0_PWR_EC0_CSEE,
> > +					=C2=A0=C2=A0
> > ASUS_USB0_PWR_EC0_CSEE_OFF);
> > +		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> > +	}
> > +	return 0;
> > +}
> > +
> > +/* Use only for Ally devices due to the wake_on_ac */
> > +static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops =3D {
> > +	.restore =3D asus_ally_s2idle_restore,
> > +};
> > +
> > =C2=A0 static const struct dev_pm_ops asus_pm_ops =3D {
> > =C2=A0=C2=A0	.thaw =3D asus_hotk_thaw,
> > =C2=A0=C2=A0	.restore =3D asus_hotk_restore,
> > =C2=A0=C2=A0	.resume =3D asus_hotk_resume,
> > -	.resume_early =3D asus_hotk_resume_early,
> > =C2=A0=C2=A0	.prepare =3D asus_hotk_prepare,
> > =C2=A0 };
> > =C2=A0=20
> > @@ -5010,6 +5051,10 @@ static int asus_wmi_probe(struct
> > platform_device *pdev)
> > =C2=A0=C2=A0			return ret;
> > =C2=A0=C2=A0	}
> > =C2=A0=20
> > +	ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
> > +	if (ret)
> > +		pr_warn("failed to register LPS0 sleep handler in
> > asus-wmi\n");
> > +
> > =C2=A0=C2=A0	return asus_wmi_add(pdev);
> > =C2=A0 }
> > =C2=A0=20
> > @@ -5042,6 +5087,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
> > =C2=A0=20
> > =C2=A0 void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
> > =C2=A0 {
> > +	acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
> > =C2=A0=C2=A0	platform_device_unregister(driver->platform_device);
> > =C2=A0=C2=A0	platform_driver_unregister(&driver->platform_driver);
> > =C2=A0=C2=A0	used =3D false;
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h
> > b/include/linux/platform_data/x86/asus-wmi.h
> > index 783e2a336861..a32cb8865b2f 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -158,8 +158,23 @@
> > =C2=A0 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
> > =C2=A0=20
> > =C2=A0 #if IS_REACHABLE(CONFIG_ASUS_WMI)
> > +void set_ally_mcu_hack(bool enabled);
> > +void set_ally_mcu_powersave(bool enabled);
> > +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32
> > *retval);
> > =C2=A0 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
> > u32 *retval);
> > =C2=A0 #else
> > +static inline void set_ally_mcu_hack(bool enabled)
> > +{
> > +	return -ENODEV;
> > +}
> > +static inline void set_ally_mcu_powersave(bool enabled)
> > +{
> > +	return -ENODEV;
> > +}
> > +static inline int asus_wmi_set_devstate(u32 dev_id, u32
> > ctrl_param, u32 *retval)
> > +{
> > +	return -ENODEV;
> > +}
> > =C2=A0 static inline int asus_wmi_evaluate_method(u32 method_id, u32
> > arg0, u32 arg1,
> > =C2=A0=C2=A0					=C2=A0=C2=A0 u32 *retval)
> > =C2=A0 {
>=20


