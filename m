Return-Path: <linux-input+bounces-6786-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 760C4987B0C
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 00:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309CB2837D6
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 22:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A6751898EA;
	Thu, 26 Sep 2024 22:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="b8btWt63";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gPESNlmU"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01E318953C;
	Thu, 26 Sep 2024 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727388774; cv=none; b=PhZblQHBLACs9tw8SeMcql3gyJSQOR9HZFapEmZJtq7hwTB/Gp37XHGALTOmPFq4Bwcz+b+Gzkn74ncULXk3tdNX7dpEyplH80LTZsDTzGVgLsxjkMZvK2+7mEbka88xHIUdefY5TzvpBCrplXxHuS5TWFVEWjZ9yFKeOQAoNCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727388774; c=relaxed/simple;
	bh=1jVR9D4uQRhEXQTseRxLfWFBp0eTVXtPSHsFAQxrK4c=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lvH4eZrTTgsRhSxk7vYcqFlokUjWjzE5/BY/cvB8uh76voAVWq1P40NNvmZAvnQezTlNDGEp9WcQYkvcMV8kCdmUw0qfTuaKQ6VvnQyc43osr72X2IFAk6Gt/sHGtN5Bkv5fT/tlV8Z5Kd4F35iXS8TPxCGxeEneNhtKJqSG6Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=b8btWt63; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gPESNlmU; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1C59E114008A;
	Thu, 26 Sep 2024 18:12:52 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 18:12:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727388772;
	 x=1727475172; bh=LP/jaPiaEKpPzJsX3OavnXIiAIbKlz2Tgyju4UAacnM=; b=
	b8btWt63ZD2pWoJlYmeM0ZbzW6zPhZXe2WnmKcIhXlVIyDNM/tYAMr2pK2D+aigx
	p7xxeOgC1o+6McPwCQqt5HhoQi+jMaTUXpYel0yybMyJtyb1CmoK9Pv7Ty5h9p6u
	gaSqzOzrdlpfqvoo3A0vlk64T7ZXkh5BZTEjZFXcTAAkI+fLTQ/MtrRQALd5Hc3U
	Db1S20NblE2V7EE/bRu4t8lKzx6i6hCr1q7fVQJrIkNz/WP+UCoYtVszfv6VziLC
	I+Q2fuSXcCMjiEJeuZPzvNwID2CuPIXI7Qru/WoDpS/RvuW9fGroQmROn5Jfca5h
	uugOpsdhEPnchDskITmCoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727388772; x=
	1727475172; bh=LP/jaPiaEKpPzJsX3OavnXIiAIbKlz2Tgyju4UAacnM=; b=g
	PESNlmU7L1XN3uUP3ybTpg7OFadoYfD7ig1v7xyookRiRsI75GPmNi7USIMxZ1tE
	/MIDjXyiFONt/fDyGSRpQtE5/jacuxc/ArnyPPCBPyvBX8oYkQUxddRQCsFnuHoT
	/80d9Uow+9PCoqR51GbJ44rxtfpoL8GPAb1n1skLpoN/T7I58BtnziIrGqtckea4
	3xuQM1wQcd4nKHk94Ytuo6YPUqkZc3x26JWLeVKF0ZBBTqDQLYcIOkwUTwLUktKW
	0/N7GJFdJimFLkBiR4ljcVVC7J0IxTBUKlOrYFtYrsC3UVbSPW5dYKIo6QwqUtCf
	wZ4orxhzLwsLZGmr0eiSA==
X-ME-Sender: <xms:Y9z1ZvKQ6ucvN3XgjeyITrPFHn3Xz7R92ZmkODrGpxRR9QRzvN2vgQ>
    <xme:Y9z1ZjI_J0Ad3GgEszLfMgg-GaGoG9csORQDPWu_WDTRrmA3dyM1ql2QKbrpJ3DZP
    91JGznPEx-r1GtljUE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpeevteelkeefueeuleejveetueetvefggfeuledvhfdv
    gedvheelfeelkefhgfetheenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhho
    nhgvshdruggvvhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikhhosheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtg
    homhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthht
    oheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:Y9z1Znss9Sio38eft2s0uv6jLK38a2PVyTllqtmVSSVEvipB_em2JQ>
    <xmx:Y9z1ZobeoabrmZVHPeavDt8n5olTFh1PcH0taU1bLYdl751BYVzg4w>
    <xmx:Y9z1Zmbno_R3tBGFEbHXHc0hUo_ZdKfekLR1tlfX857zfDxxeZ7U7w>
    <xmx:Y9z1ZsDGnbJFFE3kyP9LE78u-h7t-chiANOfReuaEiK4vk8HpyPyPw>
    <xmx:ZNz1Zu75hu3i8ePYfBhwysRzyHdZQrgqx6nDrpQfWrxi7SAKqLcostCL>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A82223360077; Thu, 26 Sep 2024 18:12:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 10:12:31 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <b08c3c2c-d663-46fa-b795-df83371c9ebf@app.fastmail.com>
In-Reply-To: <efca6c13-e1d4-4148-8c41-4983b8fca032@kernel.org>
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-5-luke@ljones.dev>
 <efca6c13-e1d4-4148-8c41-4983b8fca032@kernel.org>
Subject: Re: [PATCH v4 4/9] platform/x86: asus-armoury: add panel_hd_mode attribute
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 27 Sep 2024, at 3:17 AM, Mario Limonciello wrote:
> On 9/26/2024 04:29, Luke D. Jones wrote:
> > Add panel_hd_mode to toggle the panel mode between single and high
> > definition modes.
> > 
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> 
> This patch looks good to me.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you.

> ---
> 
> But that being said; mostly to satisfy my curiosity could you share more 
> about what this actually does?
> 
> Does it change the EDID exposed in the BIOS in ACPI _DDC?  At least for 
> AMD platforms that would mean it only works with this patch (which is on 
> it's way):
> 
> https://lore.kernel.org/amd-gfx/20240918213845.158293-11-mario.limonciello@amd.com/

I don't have access to the hardware so what it does is learned entirely thirdhand. What I do know is that it must be rebooted after and it seems to switch some internal thingy.

"UHD 120Hz and FHD 240Hz modes" is what I gather from reviewing some of Sergei's code in his ghelper project (windows armoury crate replacement).

> 
> > ---
> >   drivers/platform/x86/asus-armoury.c        | 6 +++++-
> >   include/linux/platform_data/x86/asus-wmi.h | 1 +
> >   2 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> > index 39e422b16b8e..15eab4d45b81 100644
> > --- a/drivers/platform/x86/asus-armoury.c
> > +++ b/drivers/platform/x86/asus-armoury.c
> > @@ -106,7 +106,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> >   
> >   static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> >   {
> > - return !strcmp(attr->attr.name, "gpu_mux_mode");
> > + return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> > +        !strcmp(attr->attr.name, "panel_hd_mode");
> >   }
> >   
> >   /**
> > @@ -429,6 +430,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
> >      "Set MCU powersaving mode");
> >   ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
> >      "Set the panel refresh overdrive");
> > +ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
> > +    "Set the panel HD mode to UHD<0> or FHD<1>");
> >   ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
> >      "Show the eGPU connection status");
> >   
> > @@ -442,6 +445,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
> >   { &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> >   { &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
> >   { &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
> > + { &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
> >   };
> >   
> >   static int asus_fw_attr_add(void)
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index 6ea4dedfb85e..7caf2c7ed8c9 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -73,6 +73,7 @@
> >   #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
> >   
> >   /* Misc */
> > +#define ASUS_WMI_DEVID_PANEL_HD 0x0005001C
> >   #define ASUS_WMI_DEVID_PANEL_OD 0x00050019
> >   #define ASUS_WMI_DEVID_CAMERA 0x00060013
> >   #define ASUS_WMI_DEVID_LID_FLIP 0x00060062
> 
> 

