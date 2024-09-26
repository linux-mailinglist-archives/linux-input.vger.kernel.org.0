Return-Path: <linux-input+bounces-6787-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D093B987B0F
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 00:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E88A61C22668
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 22:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BC11898F8;
	Thu, 26 Sep 2024 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="mqt9OLyC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HRsZ4SNz"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4373018953C;
	Thu, 26 Sep 2024 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727388868; cv=none; b=f67UhonqgazzhDdP3tfq0KTHpZDTFaSyxXJbgq/qmvUC1E1iIAIBb4xoPWuXUEESkDM0gwnGHmmHV76C7R8x0cB54kMlDjoY2jE3Ii5AqrLVxRrYCCCe6BoHeVJomY+4NaTFQPaInd3bwm7GQBLmV5hZveMf8JVS2vlQtk6L2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727388868; c=relaxed/simple;
	bh=1neeLD5Q3TV7aGrQKllZnFizqvVYqxZrF3xmt3SKmsY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Vwvhr17wGZKAlOJQAa4ligwmN19DVcTn412vL+XHGAfXXsiufuKadDFfsU7CFKQkF7PJglkOWsVV+4Qxc0I5h96nFocAHFA6XjMP9R4454a30fBowXx//9qTquVfSGp2voILOqM2QoD3NTTydgJLOV4zjr4OYl0ddd14/LOMM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=mqt9OLyC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HRsZ4SNz; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 5DEB613802CB;
	Thu, 26 Sep 2024 18:14:26 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 18:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727388866;
	 x=1727475266; bh=kH1jHHW+cV2Tqu4cAvAjb0+6mwRkXeX/fCUhmGFWQwc=; b=
	mqt9OLyCcE0AsNrcS2GJt02O/m3BUk2ON7PeRIJGMYM73RF7CEOqkpBrzk4k63KI
	C8n0dlzUxNM7i3WHEpVAkdaEYMyETyFFqNXGt0Ffrm0WPghLzJ6LWieARUk9D91r
	4kBrvKRLv5Tpa8usstjA0hctbjkhG9CtuQ48dus1ARV4G4A3zD5xoSYPAppB2rBP
	XcHLgX8OfEeKfG0H5R/lBgy4zvz28sc0LZtJOAZNOlCZ6/lEsrtMiJHbFZNnUQuJ
	luInLsj+5b5lquBGfp6+wK2arpdBs/tVyBmiPzup7vZk8EjyfV98BK9CLE5NQ+kP
	qfMYx5rnCvSWXFsX8qq09Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727388866; x=
	1727475266; bh=kH1jHHW+cV2Tqu4cAvAjb0+6mwRkXeX/fCUhmGFWQwc=; b=H
	RsZ4SNz/haZDYYbRv2jqozBDwqDlYBSewUz+6XAM5tejsCKHWQMGevVcay+sJZ8Q
	k/t8ifchJEkHoxBp5m6gLpIk043HsNY3vk/M/PUoVxgktyK025kWGl8jXfWudzpS
	PBPkOYV++VhTw86GbJmGGQBIhM5/cTsfcMmdN6ksTBcCYpiRFKTA5S9nDQuMsqLA
	bC1TZXVIu3yU9he1C6uIQCoeTgJRO62w1ZRovUHt/B+L1qrFMtp5GIZ+C8fa5tV3
	xJjWfpxaedS8ftphe5yWzN19jvX0o9KJ0kQ2cK1yyuk4oVFoUXZxBXf3YAbRbN0x
	uGo7NeGwDfQvumff24NoQ==
X-ME-Sender: <xms:wtz1ZljODkK8OSabENC-1lP5lf42GlUJKy9WTS-qTPMqMtm7K05Yhg>
    <xme:wtz1ZqAHxz5hTz73qbV1FJlrZChZ-j7KYOUXFnRy3CEyvSOJ4SGj8bvp_Bs730PjT
    KnjnOSKBcqObuQNUNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgtdeiucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:wtz1ZlFXeEpSDrmE1lu0f28IF7JQYc9rpAhiB0zw3ulRi016fB-DkA>
    <xmx:wtz1ZqRfP9WhYtTZ6hhBrG57A64bXibJ2i-jMQKvmMsPYatC2iNFpg>
    <xmx:wtz1ZizVXFsnWUGu-dvDw91ycmi5eujJYsfR-2r3hJd2SfB-5YNYBA>
    <xmx:wtz1Zg7ognsnwfhXYA93gljFzL64uqq1zYlfJ93me22fjvz6gSlTGA>
    <xmx:wtz1Zty5geX9gDobK2eUkKvyIyOBcJDhu_a9MetpGxMnlsd3L4Cb5iT4>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 100BB3360077; Thu, 26 Sep 2024 18:14:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 10:14:05 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <7917ffc5-7774-435b-8fec-e84124447f64@app.fastmail.com>
In-Reply-To: <b23a03d6-16c4-42ed-a99f-519b9ca8408d@kernel.org>
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-8-luke@ljones.dev>
 <b23a03d6-16c4-42ed-a99f-519b9ca8408d@kernel.org>
Subject: Re: [PATCH v4 7/9] platform/x86: asus-armoury: add apu-mem control support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 27 Sep 2024, at 3:25 AM, Mario Limonciello wrote:
> On 9/26/2024 04:29, Luke D. Jones wrote:
> > Implement the APU memory size control under the asus-armoury module using
> > the fw_attributes class.
> > 
> > This allows the APU allocated memory size to be adjusted depending on
> > the users priority. A reboot is required after change.
> > 
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you :)

> > ---
> >   drivers/platform/x86/asus-armoury.c        | 114 +++++++++++++++++++++
> >   include/linux/platform_data/x86/asus-wmi.h |   1 +
> >   2 files changed, 115 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> > index 0f67b5deb629..a0022dcee3a4 100644
> > --- a/drivers/platform/x86/asus-armoury.c
> > +++ b/drivers/platform/x86/asus-armoury.c
> > @@ -456,6 +456,119 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
> >   WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
> >   ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
> >   
> > +/* Device memory available to APU */
> > +
> > +static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> > +   char *buf)
> > +{
> > + int err;
> > + u32 mem;
> > +
> > + err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
> > + if (err)
> > + return err;
> > +
> > + switch (mem) {
> > + case 0x100:
> > + mem = 0;
> > + break;
> > + case 0x102:
> > + mem = 1;
> > + break;
> > + case 0x103:
> > + mem = 2;
> > + break;
> > + case 0x104:
> > + mem = 3;
> > + break;
> > + case 0x105:
> > + mem = 4;
> > + break;
> > + case 0x106:
> > + /* This is out of order and looks wrong but is correct */
> > + mem = 8;
> > + break;
> > + case 0x107:
> > + mem = 5;
> > + break;
> > + case 0x108:
> > + mem = 6;
> > + break;
> > + case 0x109:
> > + mem = 7;
> > + break;
> > + default:
> > + mem = 4;
> > + break;
> > + }
> > +
> > + return sysfs_emit(buf, "%u\n", mem);
> > +}
> > +
> > +static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> > +    const char *buf, size_t count)
> > +{
> > + int result, err;
> > + u32 requested, mem;
> > +
> > + result = kstrtou32(buf, 10, &requested);
> > + if (result)
> > + return result;
> > +
> > + switch (requested) {
> > + case 0:
> > + mem = 0x000;
> > + break;
> > + case 1:
> > + mem = 0x102;
> > + break;
> > + case 2:
> > + mem = 0x103;
> > + break;
> > + case 3:
> > + mem = 0x104;
> > + break;
> > + case 4:
> > + mem = 0x105;
> > + break;
> > + case 5:
> > + mem = 0x107;
> > + break;
> > + case 6:
> > + mem = 0x108;
> > + break;
> > + case 7:
> > + mem = 0x109;
> > + break;
> > + case 8:
> > + /* This is out of order and looks wrong but is correct */
> > + mem = 0x106;
> > + break;
> > + default:
> > + return -EIO;
> > + }
> > +
> > + err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
> > + if (err) {
> > + pr_warn("Failed to set apu_mem: %d\n", err);
> > + return err;
> > + }
> > +
> > + pr_info("APU memory changed to %uGB, reboot required\n", requested);
> > + sysfs_notify(kobj, NULL, attr->attr.name);
> > +
> > + asus_set_reboot_and_signal_event();
> > +
> > + return count;
> > +}
> > +
> > +static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
> > +     char *buf)
> > +{
> > + return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");
> > +}
> > +ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
> > +
> >   /* Simple attribute creation */
> >   ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
> >          cpu_min, cpu_max, 1, "Set the CPU slow package limit");
> > @@ -511,6 +624,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
> >   { &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
> >   { &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
> >   { &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
> > + { &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> >   
> >   { &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
> >   { &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index 86629e621c61..e1aeafdf05d5 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -136,6 +136,7 @@
> >   
> >   #define ASUS_WMI_DEVID_DGPU_BASE_TGP 0x00120099
> >   #define ASUS_WMI_DEVID_DGPU_SET_TGP 0x00120098
> > +#define ASUS_WMI_DEVID_APU_MEM 0x000600C1
> >   
> >   /* gpu mux switch, 0 = dGPU, 1 = Optimus */
> >   #define ASUS_WMI_DEVID_GPU_MUX 0x00090016
> 
> 

