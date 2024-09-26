Return-Path: <linux-input+bounces-6785-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 930EF987AFA
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 00:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A556B20BE5
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 22:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC645189537;
	Thu, 26 Sep 2024 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="V0Jrnl/r";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ery/QWHJ"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABD7189532;
	Thu, 26 Sep 2024 22:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727388301; cv=none; b=dSTMYiSHQPButo/YPqPbUimWvNfeXHI5mvyFiS1Pd2MXl8HEa52W6VbCd/RB3xnVt7zLEwL8zMgEzjHqZnxFfHoIT/c+GbCnRbgWm/7vQ1IMEhgPUprjfVhLxaQHgx0itZKdNsEOb4UuYvKO7z/TPH5x3dmVu74/OTF9/80rf/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727388301; c=relaxed/simple;
	bh=VA/1LzXI7VGpksArnMujlRdZEYMKQdIKNQLlwWQSPzs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oHk6Pgft4WlimGALwK/MQtee6Z96PMH9YC33NqQ7Tog46vUVJleKwYYW+ntbuhYH9Yzc7cl1bvKrw8A18QAe5NTecsvVANln3bWxunjy+J6qwCqaw8uXX6StOrENztwyJn01aLgZZtL69iJSk5TcHNsVc6rYzsR9Kkb5h/8IyN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=V0Jrnl/r; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ery/QWHJ; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 829181140239;
	Thu, 26 Sep 2024 18:04:58 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 18:04:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727388298;
	 x=1727474698; bh=u09z3CFEhdhaVDF69B9du+BCrgMM3jCyclBoAkThPxg=; b=
	V0Jrnl/rD756Iz0mFnyEvmYX/TDS4XX64g8TRMZ2pxRzXlCzpsIyjvLdo7QYQJNm
	QlbxIfaHpnpBIQ/zM2GIvNKROByQFUeBy2Kmb8F+tRkSDvylCs2guQJ8PAj4npL3
	MY/AqF2FkQ7IrjrXVzNqtA29HhyKoGz1ustBPNpSPNO18lcOaOS2vri9dRpAL5GB
	BrWr68mvZ6wNWneKXHJav8Dow2vm0unsn4LvVYHsevFtEEB1nkMJcmzLBId29IWf
	jNiynNdajWFmVKtvUQaY5B2mMoywyzW2puCm4j0rMTyYX0fmtcc6itiw8OxD/UzT
	DfAr19CKI6NHYXnAmicYQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727388298; x=
	1727474698; bh=u09z3CFEhdhaVDF69B9du+BCrgMM3jCyclBoAkThPxg=; b=e
	ry/QWHJIVTowCXgusNmiACFN4u5P/qsHjrSHzA18+mQ385k0q+uKS6iM1S1PcZgI
	UoLtuk/G6a48UJAFE/u5o3HvEZFORzafGXg0ZRtbJawULMjGRpISrnnQbBCVHwuy
	Pdlmw1kEXKMW6reyH6kQ7y8hYP3zr9AeiHmNVL5KE46KuGAvy2gXjOqaw5R4jZcK
	EHCDJ2GNA8zNTMoP6rIr+FVzEd/Xy/wFexIbtWwI5BhIcVET/EFVOvcOsvMQTK/1
	2qCt0RqWwxH6IIYswDdcQdmF4NkYdbXlRKRzNI95k/Z6tptLoUpE+hR78meJE/CU
	UJ8dsqWC6oM5mM9dHSxmA==
X-ME-Sender: <xms:idr1ZsEcMFw3eEX_5BnCA3Xzmf3lQuPbu4yNSFxr_lzBTwc8JKyx2Q>
    <xme:idr1ZlXAM6JjarNSJIThqnFsR7G3ZCWfjEYDriC1SLrG6ueYSSi0GZLWMRVDf00nM
    cF8AP_ii9nVnK0FE00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpefgieffhedtgffhtedtiedutdefkedvjefgveehhfff
    vedthfejleegfeffkedvveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
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
X-ME-Proxy: <xmx:idr1ZmKakYqD7Vl4KeHN4tnUlmCad04pAtNiZ29BvjwVrBKzphidrw>
    <xmx:idr1ZuEz7mMZdPpQcA4Eoz7jsAJCTjtqXwAV1gHISp3KtlYVyvn4yg>
    <xmx:idr1ZiUBuLzr4m9cKzYuPZ_WzYrE0VC_D4M36DFYDW6lGwRb0NTtQg>
    <xmx:idr1ZhNXYlBoCYyjpQH54DitFYLA4V5vhN-d0PuENRkD-yP0CdJ5ZA>
    <xmx:itr1ZtEJko_fp15AiDaxQn_WIOG0jatI12tjPSu4sSFTSQGtIoFwX7tF>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C07503360077; Thu, 26 Sep 2024 18:04:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 10:04:37 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <d9388dd8-5a2b-4068-ba74-b3cd4b723b74@app.fastmail.com>
In-Reply-To: <277ce143-83f7-4c0f-9243-c2e3266a9f5e@kernel.org>
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-10-luke@ljones.dev>
 <277ce143-83f7-4c0f-9243-c2e3266a9f5e@kernel.org>
Subject: Re: [PATCH v4 9/9] platform/x86: asus-wmi: deprecate bios features
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Fri, 27 Sep 2024, at 2:56 AM, Mario Limonciello wrote:
> On 9/26/2024 04:29, Luke D. Jones wrote:
> > With the existence of the asus-bioscfg module the attributes no-longer
> > need to live under the /sys/devices/platform/asus-nb-wmi/ path.
> > 
> > Deprecate all those that were implemented in asus-bioscfg with the goal

Damn I thought I had changed this commit message. Neds to mention `asus-armoury`.

> > of removing them fully in the next LTS cycle.
> > 
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> 
> I have some very minor nits below.  With them fixed:
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you.

> > ---
> >   .../ABI/testing/sysfs-platform-asus-wmi       |  17 +++
> >   drivers/platform/x86/Kconfig                  |   9 ++
> >   drivers/platform/x86/asus-wmi.c               | 134 ++++++++++++++----
> >   3 files changed, 130 insertions(+), 30 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> > index 28144371a0f1..765d50b0d9df 100644
> > --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> > +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> > @@ -63,6 +63,7 @@ Date: Aug 2022
> >   KernelVersion: 6.1
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Switch the GPU hardware MUX mode. Laptops with this feature can
> >   can be toggled to boot with only the dGPU (discrete mode) or in
> >   standard Optimus/Hybrid mode. On switch a reboot is required:
> > @@ -75,6 +76,7 @@ Date: Aug 2022
> >   KernelVersion: 5.17
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Disable discrete GPU:
> >   * 0 - Enable dGPU,
> >   * 1 - Disable dGPU
> > @@ -84,6 +86,7 @@ Date: Aug 2022
> >   KernelVersion: 5.17
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Enable the external GPU paired with ROG X-Flow laptops.
> >   Toggling this setting will also trigger ACPI to disable the dGPU:
> >   
> > @@ -95,6 +98,7 @@ Date: Aug 2022
> >   KernelVersion: 5.17
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Enable an LCD response-time boost to reduce or remove ghosting:
> >   * 0 - Disable,
> >   * 1 - Enable
> > @@ -104,6 +108,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Get the current charging mode being used:
> >   * 1 - Barrel connected charger,
> >   * 2 - USB-C charging
> > @@ -114,6 +119,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Show if the egpu (XG Mobile) is correctly connected:
> >   * 0 - False,
> >   * 1 - True
> > @@ -123,6 +129,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Change the mini-LED mode:
> >   * 0 - Single-zone,
> >   * 1 - Multi-zone
> > @@ -133,6 +140,7 @@ Date: Apr 2024
> >   KernelVersion: 6.10
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   List the available mini-led modes.
> >   
> >   What: /sys/devices/platform/<platform>/ppt_pl1_spl
> > @@ -140,6 +148,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set the Package Power Target total of CPU: PL1 on Intel, SPL on AMD.
> >   Shown on Intel+Nvidia or AMD+Nvidia based systems:
> >   
> > @@ -150,6 +159,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set the Slow Package Power Tracking Limit of CPU: PL2 on Intel, SPPT,
> >   on AMD. Shown on Intel+Nvidia or AMD+Nvidia based systems:
> >   
> > @@ -160,6 +170,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set the Fast Package Power Tracking Limit of CPU. AMD+Nvidia only:
> >   * min=5, max=250
> >   
> > @@ -168,6 +179,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set the APU SPPT limit. Shown on full AMD systems only:
> >   * min=5, max=130
> >   
> > @@ -176,6 +188,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set the platform SPPT limit. Shown on full AMD systems only:
> >   * min=5, max=130
> >   
> > @@ -184,6 +197,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set the dynamic boost limit of the Nvidia dGPU:
> >   * min=5, max=25
> >   
> > @@ -192,6 +206,7 @@ Date: Jun 2023
> >   KernelVersion: 6.5
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set the target temperature limit of the Nvidia dGPU:
> >   * min=75, max=87
> >   
> > @@ -200,6 +215,7 @@ Date: Apr 2024
> >   KernelVersion: 6.10
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set if the BIOS POST sound is played on boot.
> >   * 0 - False,
> >   * 1 - True
> > @@ -209,6 +225,7 @@ Date: Apr 2024
> >   KernelVersion: 6.10
> >   Contact: "Luke Jones" <luke@ljones.dev>
> >   Description:
> > +        DEPRECATED, WILL BE REMOVED SOON
> >   Set if the MCU can go in to low-power mode on system sleep
> >   * 0 - False,
> >   * 1 - True
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index dedf66e0d099..baa36413f6ed 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -300,6 +300,15 @@ config ASUS_WMI
> >     To compile this driver as a module, choose M here: the module will
> >     be called asus-wmi.
> >   
> > +config ASUS_WMI_DEPRECATED_ATTRS
> > + bool "BIOS option support in WMI platform (DEPRECATED)"
> > + depends on ASUS_WMI
> > + default y
> > + help
> > +   Say Y to expose the configurable BIOS options through the asus-wmi
> > +   driver. This can be used with or without the new asus-armoury driver which
> 
> Don't use the word "new" in a description.
> 
> > +   hasthe same attributes, but more, and better features.
> 
> has the
> 
> > +
> >   config ASUS_NB_WMI
> >   tristate "Asus Notebook WMI Driver"
> >   depends on ASUS_WMI
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index 0a5221d65130..f553c0b33da7 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -289,11 +289,12 @@ struct asus_wmi {
> >   u8 fan_boost_mode_mask;
> >   u8 fan_boost_mode;
> >   
> > +
> > + /* Tunables provided by ASUS for gaming laptops */
> > + #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> 
> Typically I would avoid indending the #if and #else.

Ack, changed. Will add missing match comment on the endif too.

> 
> >   bool egpu_enable_available;
> >   bool dgpu_disable_available;
> >   u32 gpu_mux_dev;
> > -
> > - /* Tunables provided by ASUS for gaming laptops */
> >   u32 ppt_pl2_sppt;
> >   u32 ppt_pl1_spl;
> >   u32 ppt_apu_sppt;
> > @@ -301,6 +302,9 @@ struct asus_wmi {
> >   u32 ppt_fppt;
> >   u32 nv_dynamic_boost;
> >   u32 nv_temp_target;
> > + bool panel_overdrive_available;
> > + u32 mini_led_dev_id;
> > + #endif
> 
> Typically I would avoid indending the #if and #else.

Ack, same for other locations in source. And added missing match comments to all locations.

> >   
> >   u32 kbd_rgb_dev;
> >   bool kbd_rgb_state_available;
> > @@ -319,9 +323,6 @@ struct asus_wmi {
> >   // The RSOC controls the maximum charging percentage.
> >   bool battery_rsoc_available;
> >   
> > - bool panel_overdrive_available;
> > - u32 mini_led_dev_id;
> > -
> >   struct hotplug_slot hotplug_slot;
> >   struct mutex hotplug_lock;
> >   struct mutex wmi_lock;
> > @@ -335,6 +336,15 @@ struct asus_wmi {
> >   struct asus_wmi_driver *driver;
> >   };
> >   
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> > +static void asus_wmi_show_deprecated(void)
> > +{
> > + pr_notice_once("Accessing attributes through /sys/bus/platform/asus_wmi "
> > + "is deprecated and will be removed in a future release. Please "
> > + "switch over to /sys/class/firmware_attributes.\n");
> > +}
> > +#endif
> > +
> >   /* WMI ************************************************************************/
> >   
> >   static int asus_wmi_evaluate_method3(u32 method_id,
> > @@ -732,6 +742,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
> >   }
> >   
> >   /* Charging mode, 1=Barrel, 2=USB ******************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t charge_mode_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -742,12 +753,16 @@ static ssize_t charge_mode_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", value & 0xff);
> >   }
> >   
> >   static DEVICE_ATTR_RO(charge_mode);
> > +#endif
> >   
> >   /* dGPU ********************************************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t dgpu_disable_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -758,6 +773,8 @@ static ssize_t dgpu_disable_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", result);
> >   }
> >   
> > @@ -811,8 +828,10 @@ static ssize_t dgpu_disable_store(struct device *dev,
> >   return count;
> >   }
> >   static DEVICE_ATTR_RW(dgpu_disable);
> > +#endif
> >   
> >   /* eGPU ********************************************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t egpu_enable_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -823,6 +842,8 @@ static ssize_t egpu_enable_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", result);
> >   }
> >   
> > @@ -879,8 +900,10 @@ static ssize_t egpu_enable_store(struct device *dev,
> >   return count;
> >   }
> >   static DEVICE_ATTR_RW(egpu_enable);
> > +#endif
> >   
> >   /* Is eGPU connected? *********************************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t egpu_connected_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -891,12 +914,16 @@ static ssize_t egpu_connected_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", result);
> >   }
> >   
> >   static DEVICE_ATTR_RO(egpu_connected);
> > +#endif
> >   
> >   /* gpu mux switch *************************************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t gpu_mux_mode_show(struct device *dev,
> >   struct device_attribute *attr, char *buf)
> >   {
> > @@ -907,6 +934,8 @@ static ssize_t gpu_mux_mode_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", result);
> >   }
> >   
> > @@ -965,6 +994,7 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
> >   return count;
> >   }
> >   static DEVICE_ATTR_RW(gpu_mux_mode);
> > +#endif
> >   
> >   /* TUF Laptop Keyboard RGB Modes **********************************************/
> >   static ssize_t kbd_rgb_mode_store(struct device *dev,
> > @@ -1088,6 +1118,7 @@ static const struct attribute_group *kbd_rgb_mode_groups[] = {
> >   };
> >   
> >   /* Tunable: PPT: Intel=PL1, AMD=SPPT *****************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t ppt_pl2_sppt_store(struct device *dev,
> >       struct device_attribute *attr,
> >       const char *buf, size_t count)
> > @@ -1126,6 +1157,8 @@ static ssize_t ppt_pl2_sppt_show(struct device *dev,
> >   {
> >   struct asus_wmi *asus = dev_get_drvdata(dev);
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%u\n", asus->ppt_pl2_sppt);
> >   }
> >   static DEVICE_ATTR_RW(ppt_pl2_sppt);
> > @@ -1168,6 +1201,8 @@ static ssize_t ppt_pl1_spl_show(struct device *dev,
> >   {
> >   struct asus_wmi *asus = dev_get_drvdata(dev);
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%u\n", asus->ppt_pl1_spl);
> >   }
> >   static DEVICE_ATTR_RW(ppt_pl1_spl);
> > @@ -1211,6 +1246,8 @@ static ssize_t ppt_fppt_show(struct device *dev,
> >   {
> >   struct asus_wmi *asus = dev_get_drvdata(dev);
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%u\n", asus->ppt_fppt);
> >   }
> >   static DEVICE_ATTR_RW(ppt_fppt);
> > @@ -1254,6 +1291,8 @@ static ssize_t ppt_apu_sppt_show(struct device *dev,
> >   {
> >   struct asus_wmi *asus = dev_get_drvdata(dev);
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%u\n", asus->ppt_apu_sppt);
> >   }
> >   static DEVICE_ATTR_RW(ppt_apu_sppt);
> > @@ -1297,6 +1336,8 @@ static ssize_t ppt_platform_sppt_show(struct device *dev,
> >   {
> >   struct asus_wmi *asus = dev_get_drvdata(dev);
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%u\n", asus->ppt_platform_sppt);
> >   }
> >   static DEVICE_ATTR_RW(ppt_platform_sppt);
> > @@ -1340,6 +1381,8 @@ static ssize_t nv_dynamic_boost_show(struct device *dev,
> >   {
> >   struct asus_wmi *asus = dev_get_drvdata(dev);
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%u\n", asus->nv_dynamic_boost);
> >   }
> >   static DEVICE_ATTR_RW(nv_dynamic_boost);
> > @@ -1383,11 +1426,15 @@ static ssize_t nv_temp_target_show(struct device *dev,
> >   {
> >   struct asus_wmi *asus = dev_get_drvdata(dev);
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%u\n", asus->nv_temp_target);
> >   }
> >   static DEVICE_ATTR_RW(nv_temp_target);
> > +#endif
> >   
> >   /* Ally MCU Powersave ********************************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t mcu_powersave_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -1398,6 +1445,8 @@ static ssize_t mcu_powersave_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", result);
> >   }
> >   
> > @@ -1433,6 +1482,7 @@ static ssize_t mcu_powersave_store(struct device *dev,
> >   return count;
> >   }
> >   static DEVICE_ATTR_RW(mcu_powersave);
> > +#endif
> >   
> >   /* Battery ********************************************************************/
> >   
> > @@ -2306,6 +2356,7 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
> >   }
> >   
> >   /* Panel Overdrive ************************************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t panel_od_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -2316,6 +2367,8 @@ static ssize_t panel_od_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", result);
> >   }
> >   
> > @@ -2352,9 +2405,10 @@ static ssize_t panel_od_store(struct device *dev,
> >   return count;
> >   }
> >   static DEVICE_ATTR_RW(panel_od);
> > +#endif
> >   
> >   /* Bootup sound ***************************************************************/
> > -
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t boot_sound_show(struct device *dev,
> >        struct device_attribute *attr, char *buf)
> >   {
> > @@ -2365,6 +2419,8 @@ static ssize_t boot_sound_show(struct device *dev,
> >   if (result < 0)
> >   return result;
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", result);
> >   }
> >   
> > @@ -2400,8 +2456,10 @@ static ssize_t boot_sound_store(struct device *dev,
> >   return count;
> >   }
> >   static DEVICE_ATTR_RW(boot_sound);
> > +#endif
> >   
> >   /* Mini-LED mode **************************************************************/
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t mini_led_mode_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -2432,6 +2490,8 @@ static ssize_t mini_led_mode_show(struct device *dev,
> >   }
> >   }
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "%d\n", value);
> >   }
> >   
> > @@ -2502,10 +2562,13 @@ static ssize_t available_mini_led_mode_show(struct device *dev,
> >   return sysfs_emit(buf, "0 1 2\n");
> >   }
> >   
> > + asus_wmi_show_deprecated();
> > +
> >   return sysfs_emit(buf, "0\n");
> >   }
> >   
> >   static DEVICE_ATTR_RO(available_mini_led_mode);
> > +#endif
> >   
> >   /* Quirks *********************************************************************/
> >   
> > @@ -3804,6 +3867,7 @@ static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
> >   return 0;
> >   }
> >   
> > +#if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   static ssize_t throttle_thermal_policy_show(struct device *dev,
> >      struct device_attribute *attr, char *buf)
> >   {
> > @@ -3847,6 +3911,7 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
> >    * Throttle thermal policy: 0 - default, 1 - overboost, 2 - silent
> >    */
> >   static DEVICE_ATTR_RW(throttle_thermal_policy);
> > +#endif
> >   
> >   /* Platform profile ***********************************************************/
> >   static int asus_wmi_platform_profile_to_vivo(struct asus_wmi *asus, int mode)
> > @@ -4474,27 +4539,29 @@ static struct attribute *platform_attributes[] = {
> >   &dev_attr_camera.attr,
> >   &dev_attr_cardr.attr,
> >   &dev_attr_touchpad.attr,
> > - &dev_attr_charge_mode.attr,
> > - &dev_attr_egpu_enable.attr,
> > - &dev_attr_egpu_connected.attr,
> > - &dev_attr_dgpu_disable.attr,
> > - &dev_attr_gpu_mux_mode.attr,
> >   &dev_attr_lid_resume.attr,
> >   &dev_attr_als_enable.attr,
> >   &dev_attr_fan_boost_mode.attr,
> > - &dev_attr_throttle_thermal_policy.attr,
> > - &dev_attr_ppt_pl2_sppt.attr,
> > - &dev_attr_ppt_pl1_spl.attr,
> > - &dev_attr_ppt_fppt.attr,
> > - &dev_attr_ppt_apu_sppt.attr,
> > - &dev_attr_ppt_platform_sppt.attr,
> > - &dev_attr_nv_dynamic_boost.attr,
> > - &dev_attr_nv_temp_target.attr,
> > - &dev_attr_mcu_powersave.attr,
> > - &dev_attr_boot_sound.attr,
> > - &dev_attr_panel_od.attr,
> > - &dev_attr_mini_led_mode.attr,
> > - &dev_attr_available_mini_led_mode.attr,
> > + #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> > + &dev_attr_charge_mode.attr,
> > + &dev_attr_egpu_enable.attr,
> > + &dev_attr_egpu_connected.attr,
> > + &dev_attr_dgpu_disable.attr,
> > + &dev_attr_gpu_mux_mode.attr,
> > + &dev_attr_ppt_pl2_sppt.attr,
> > + &dev_attr_ppt_pl1_spl.attr,
> > + &dev_attr_ppt_fppt.attr,
> > + &dev_attr_ppt_apu_sppt.attr,
> > + &dev_attr_ppt_platform_sppt.attr,
> > + &dev_attr_nv_dynamic_boost.attr,
> > + &dev_attr_nv_temp_target.attr,
> > + &dev_attr_mcu_powersave.attr,
> > + &dev_attr_boot_sound.attr,
> > + &dev_attr_panel_od.attr,
> > + &dev_attr_mini_led_mode.attr,
> > + &dev_attr_available_mini_led_mode.attr,
> > + &dev_attr_throttle_thermal_policy.attr,
> > + #endif
> >   NULL
> >   };
> >   
> > @@ -4516,7 +4583,11 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
> >   devid = ASUS_WMI_DEVID_LID_RESUME;
> >   else if (attr == &dev_attr_als_enable.attr)
> >   devid = ASUS_WMI_DEVID_ALS_ENABLE;
> > - else if (attr == &dev_attr_charge_mode.attr)
> > + else if (attr == &dev_attr_fan_boost_mode.attr)
> > + ok = asus->fan_boost_mode_available;
> > +
> > + #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> > + if (attr == &dev_attr_charge_mode.attr)
> >   devid = ASUS_WMI_DEVID_CHARGE_MODE;
> >   else if (attr == &dev_attr_egpu_enable.attr)
> >   ok = asus->egpu_enable_available;
> > @@ -4554,6 +4625,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
> >   ok = asus->mini_led_dev_id != 0;
> >   else if (attr == &dev_attr_available_mini_led_mode.attr)
> >   ok = asus->mini_led_dev_id != 0;
> > + #endif
> >   
> >   if (devid != -1) {
> >   ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
> > @@ -4794,6 +4866,7 @@ static int asus_wmi_add(struct platform_device *pdev)
> >   goto fail_platform;
> >   
> >   /* ensure defaults for tunables */
> > + #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
> >   asus->ppt_pl2_sppt = 5;
> >   asus->ppt_pl1_spl = 5;
> >   asus->ppt_apu_sppt = 5;
> > @@ -4818,16 +4891,17 @@ static int asus_wmi_add(struct platform_device *pdev)
> >   else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_GPU_MUX_VIVO))
> >   asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
> >   
> > - if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE))
> > - asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE;
> > - else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE2))
> > - asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE2;
> > -
> > + #endif /* CONFIG_ASUS_WMI_DEPRECATED_ATTRS */
> >   if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
> >   asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
> >   else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO))
> >   asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO;
> >   
> > + if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE))
> > + asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE;
> > + else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_MODE2))
> > + asus->kbd_rgb_dev = ASUS_WMI_DEVID_TUF_RGB_MODE2;
> > +
> >   err = fan_boost_mode_check_present(asus);
> >   if (err)
> >   goto fail_fan_boost_mode;
> 
> 

