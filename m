Return-Path: <linux-input+bounces-6782-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0DE987ACF
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 23:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C062A1F22941
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 21:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0804186E25;
	Thu, 26 Sep 2024 21:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="nbB7TSZV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QhQ/cAMN"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F854D8C8;
	Thu, 26 Sep 2024 21:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727387254; cv=none; b=XjnBQvbb8Fc5w/opwaYtMFZo7U3bojoJmqNopGfgQYfZe5ggJZDoECcUfjCNrGbQVPNx9KAyEh64u5wjm/1SQqFHR1GzzA9/umuyKkq6eXP4gyKJjW+sr9AqHnKqFL9LmT7wXbeYO9Q2GukVyJEEUzm1YFYLgMa60NfQ2V4KSSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727387254; c=relaxed/simple;
	bh=LI4w2zm0P5ZMPsFv4UC/hdemqevp7H7pDgVDOguaPMM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=n6n/P4IOVEM20ggNePlWF/LD8FFu6qU1vpz1my8X3hWBeMqLFU+6pd08i1bVDLLCJ++maZgHD6vl0o7V+f2hQ2paeHl6YpPDjvqHri97QmmjrBl6/80Uh07qxg/rxiYtBGxhbs5XehRVgPiKxIAv+K58YYgjf4xWyFclgJq4Q1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=nbB7TSZV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QhQ/cAMN; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id ADFF611401BF;
	Thu, 26 Sep 2024 17:47:31 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Thu, 26 Sep 2024 17:47:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727387251;
	 x=1727473651; bh=AwG1PcZ7YoaBhoQTouwI+/OvHxqNA8hqVoFWg8K89ws=; b=
	nbB7TSZVp9Fe8Wayt2AuwAS27UEZt1g5V32/1Gp0AnUbL8iEfUmXN5HRBum1dzLm
	2omjEOKIFsml/1jInFomOuaIt9OCVbtlSF9cqRHZbUQRNs3VqEEeVLDCZPqnVQyM
	41a2pawOkgNmORRZXzBeKobDDRH02L3Ca5qMP+oJC+lPx7tI61LhbFtFBj6ZAYrV
	NVvEkQeA6UwgfOFT1VcqwQE51Axnjh1WOBOZqf80lrHvHIJMalF7hEyGH7gYJcCG
	likEU5kD9s/2WpcaC5qJN/sEvWi4MJqeWDxsUTUbGECe580q3v3sx4xFbRA5HOk1
	1T74bsrhAyUP1f6rtNUeGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727387251; x=
	1727473651; bh=AwG1PcZ7YoaBhoQTouwI+/OvHxqNA8hqVoFWg8K89ws=; b=Q
	hQ/cAMNkzFkNLHDd5VlXT07NtcELZ+lwA6sWO8q5EC4U3GFbHajoLdg6V/Te5297
	HnHg3Vj5E+LLLiF81TSHOEY5lzO/3YvNYOxf2O3nGqw6ognNNhIAfboTcwhbFgNV
	zzgB3jnPpvICCrSLwGP9X86/BOcTmxR7GXNjAiLWag92gNtepeLiKx+UrXW4loDW
	jEH6+/BdND75NUglBx6nHJ5cM3qINNXqx3QKAD9zjpGTiFUM119cQ7+hBe3hdxJE
	gDQGM4sYTO9IMxYheXhJaITQFZzVeUKprvf96a6lq+0mRoroj961BH0n2ZYuTULT
	m/51j7M8AUaICTuH3dJZA==
X-ME-Sender: <xms:c9b1Ziuj0NVkDnZqJVTo6ZAkUPgxqy8780F952J4g9D8M2-40yyYTQ>
    <xme:c9b1Znc3CHrX-5Jhv15laC3_Gj-IoeUj5AKk4a76aTPJJVTe_fqujniqHtUYGnxIR
    oQ-JBR5_I5a-FdOMlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtkedgtdduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:c9b1ZtzfaKKQRQgSlTd7o6o9hgMemlFqCMEyKfYK3lU9uLMO445jxg>
    <xmx:c9b1ZtNkestd2k1JC5gcgnwbMH_Ao_-6GdXlZ5Ph6LkG6Cs-u2M3aw>
    <xmx:c9b1Zi9EesLMYNSWeyWnTqIHLHry1Qdssx7zXArwrlOIfsdN-v6zoQ>
    <xmx:c9b1ZlXei8VMePEVC-DFYEGdXOlrRavTbsoFzD7zAq1hM-c7wq9mXQ>
    <xmx:c9b1ZnON2sC3e3-iXdLu0bEjtcRPB0-3xSnspTsVmQEJvqts7iqXZxlI>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BBA73360077; Thu, 26 Sep 2024 17:47:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 09:47:01 +1200
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Benjamin Tissoires" <bentiss@kernel.org>,
 "Jiri Kosina" <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <a5cccd62-f9a5-4fa0-ac0a-d3dbe8217737@app.fastmail.com>
In-Reply-To: <afd5769c-65fe-4fb7-97bc-1fc578cf2bd7@kernel.org>
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-9-luke@ljones.dev>
 <afd5769c-65fe-4fb7-97bc-1fc578cf2bd7@kernel.org>
Subject: Re: [PATCH v4 8/9] platform/x86: asus-armoury: add core count control
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Resend, sorry. My email client defaults to HTML

On Fri, 27 Sep 2024, at 3:30 AM, Mario Limonciello wrote:
> On 9/26/2024 04:29, Luke D. Jones wrote:
> > Implement Intel core enablement under the asus-armoury module using the
> > fw_attributes class.
> > 
> > This allows users to enable or disable preformance or efficiency cores
> > depending on their requirements. After change a reboot is required.
> > 
> > Signed-off-by: Luke D. Jones <luke@ljones.dev>
> > ---
> >   drivers/platform/x86/asus-armoury.c        | 219 +++++++++++++++++++++
> >   drivers/platform/x86/asus-armoury.h        |  28 +++
> >   include/linux/platform_data/x86/asus-wmi.h |   4 +
> >   3 files changed, 251 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> > index a0022dcee3a4..ce1facb40bd5 100644
> > --- a/drivers/platform/x86/asus-armoury.c
> > +++ b/drivers/platform/x86/asus-armoury.c
> > @@ -40,6 +40,21 @@
> >   #define ASUS_MINI_LED_2024_STRONG 0x01
> >   #define ASUS_MINI_LED_2024_OFF 0x02
> >   
> > +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
> > +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
> > +
> > +enum cpu_core_type {
> > + CPU_CORE_PERF = 0,
> > + CPU_CORE_POWER,
> > +};
> > +
> > +enum cpu_core_value {
> > + CPU_CORE_DEFAULT = 0,
> > + CPU_CORE_MIN,
> > + CPU_CORE_MAX,
> > + CPU_CORE_CURRENT,
> > +};
> > +
> >   /* Default limits for tunables available on ASUS ROG laptops */
> >   #define PPT_CPU_LIMIT_MIN 5
> >   #define PPT_CPU_LIMIT_MAX 150
> > @@ -85,6 +100,13 @@ struct rog_tunables {
> >   u32 dgpu_tgp_min;
> >   u32 dgpu_tgp_max;
> >   u32 dgpu_tgp;
> > +
> > + u32 cur_perf_cores;
> > + u32 min_perf_cores;
> > + u32 max_perf_cores;
> > + u32 cur_power_cores;
> > + u32 min_power_cores;
> > + u32 max_power_cores;
> >   };
> >   
> >   static const struct class *fw_attr_class;
> > @@ -143,6 +165,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> >   static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> >   {
> >   return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> > +        !strcmp(attr->attr.name, "cores_performance") ||
> > +        !strcmp(attr->attr.name, "cores_efficiency") ||
> >          !strcmp(attr->attr.name, "panel_hd_mode");
> >   }
> >   
> > @@ -569,6 +593,198 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
> >   }
> >   ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
> >   
> > +static int init_max_cpu_cores(void)
> > +{
> > + u32 cores;
> > + int err;
> > +
> > + asus_armoury.rog_tunables->min_perf_cores = 4;
> > + asus_armoury.rog_tunables->max_perf_cores = 4;
> > + asus_armoury.rog_tunables->cur_perf_cores = 4;
> > + asus_armoury.rog_tunables->min_power_cores = 0;
> > + asus_armoury.rog_tunables->max_power_cores = 8;
> > + asus_armoury.rog_tunables->cur_power_cores = 8;
> 
> This seems like it's going to be dependent upon "specific" CPU SKU, no?

It is yeah. I was trying to set some sort of default but forgot about it after the fact.

> If you can't detect the bounds from the WMI API I think it would be 
> smarter to use the CPU vendor specific CPUID/MSR APIs to discover the 
> topology and how many cores of the different types exist.

Thinking about it now I would rather set it as an error and disable the ability to set cores. What do you think?

> Furthermore what about LP cores?  I guess those can't be turned and off 
> from this API?

power/efficiency cores? They can be.

> > +
> > + err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
> > + if (err)
> > + return err;
> > +
> > + cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
> > + asus_armoury.rog_tunables->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> > + asus_armoury.rog_tunables->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> > +
> > + cores = 0;
> > + err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
> > + if (err)
> > + return err;
> > +
> > + asus_armoury.rog_tunables->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> > + asus_armoury.rog_tunables->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> > +
> > + return 0;
> > +}
> > +
> > +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
> > + enum cpu_core_type core_type, enum cpu_core_value core_value)
> > +{
> > + u32 cores;
> > +
> > + switch (core_value) {
> > + case CPU_CORE_DEFAULT:
> > + case CPU_CORE_MAX:
> > + if (core_type == CPU_CORE_PERF)
> > + return sysfs_emit(buf, "%d\n",
> > +   asus_armoury.rog_tunables->max_perf_cores);
> > + else
> > + return sysfs_emit(buf, "%d\n",
> > +   asus_armoury.rog_tunables->max_power_cores);
> > + case CPU_CORE_MIN:
> > + if (core_type == CPU_CORE_PERF)
> > + return sysfs_emit(buf, "%d\n",
> > +   asus_armoury.rog_tunables->min_perf_cores);
> > + else
> > + return sysfs_emit(buf, "%d\n",
> > +   asus_armoury.rog_tunables->min_power_cores);
> > + default:
> > + break;
> > + }
> > +
> > + if (core_type == CPU_CORE_PERF)
> > + cores = asus_armoury.rog_tunables->cur_perf_cores;
> > + else
> > + cores = asus_armoury.rog_tunables->cur_power_cores;
> > +
> > + return sysfs_emit(buf, "%d\n", cores);
> > +}
> > +
> > +static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> > + const char *buf, enum cpu_core_type core_type)
> > +{
> > + int result, err;
> > + u32 new_cores, perf_cores, powr_cores, out_val, min, max;
> > +
> > + result = kstrtou32(buf, 10, &new_cores);
> > + if (result)
> > + return result;
> > +
> > + if (core_type == CPU_CORE_PERF) {
> > + perf_cores = new_cores;
> > + powr_cores = out_val = asus_armoury.rog_tunables->cur_power_cores;
> > + min = asus_armoury.rog_tunables->min_perf_cores;
> > + max = asus_armoury.rog_tunables->max_perf_cores;
> > + } else {
> > + perf_cores = asus_armoury.rog_tunables->cur_perf_cores;
> > + powr_cores = out_val = new_cores;
> > + min = asus_armoury.rog_tunables->min_power_cores;
> > + max = asus_armoury.rog_tunables->max_power_cores;
> > + }
> > +
> > + if (new_cores < min || new_cores > max)
> > + return -EINVAL;
> > +
> > + out_val = 0;
> > + out_val |= FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores);
> > + out_val |= FIELD_PREP(ASUS_POWER_CORE_MASK, powr_cores);
> > +
> > + mutex_lock(&asus_armoury.mutex);
> > + err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
> > + mutex_unlock(&asus_armoury.mutex);
> > +
> > + if (err) {
> > + pr_warn("Failed to set CPU core count: %d\n", err);
> > + return err;
> > + }
> > +
> > + if (result > 1) {
> > + pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
> > + return -EIO;
> > + }
> > +
> > + pr_info("CPU core count changed, reboot required\n");
> > + sysfs_notify(kobj, NULL, attr->attr.name);
> > + asus_set_reboot_and_signal_event();
> > +
> > + return 0;
> > +}
> > +
> > +static ssize_t cores_performance_min_value_show(struct kobject *kobj,
> > + struct kobj_attribute *attr, char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
> > +}
> > +
> > +static ssize_t cores_performance_max_value_show(struct kobject *kobj,
> > + struct kobj_attribute *attr, char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
> > +}
> > +
> > +static ssize_t cores_performance_default_value_show(struct kobject *kobj,
> > +     struct kobj_attribute *attr, char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
> > +}
> > +
> > +static ssize_t cores_performance_current_value_show(struct kobject *kobj,
> > +     struct kobj_attribute *attr, char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
> > +}
> > +
> > +static ssize_t cores_performance_current_value_store(struct kobject *kobj,
> > +      struct kobj_attribute *attr,
> > +      const char *buf, size_t count)
> > +{
> > + int err;
> > +
> > + err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
> > + if (err)
> > + return err;
> > +
> > + return count;
> > +}
> > +ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
> > +     "Set the max available performance cores");
> > +
> > +static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> > +        char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
> > +}
> > +
> > +static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> > +        char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
> > +}
> > +
> > +static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
> > +    struct kobj_attribute *attr, char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
> > +}
> > +
> > +static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
> > +    struct kobj_attribute *attr, char *buf)
> > +{
> > + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
> > +}
> > +
> > +static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
> > +     struct kobj_attribute *attr, const char *buf,
> > +     size_t count)
> > +{
> > + int err;
> > +
> > + err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
> > + if (err)
> > + return err;
> > +
> > + return count;
> > +}
> > +ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
> > +     "Set the max available efficiency cores");
> > +
> >   /* Simple attribute creation */
> >   ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
> >          cpu_min, cpu_max, 1, "Set the CPU slow package limit");
> > @@ -625,6 +841,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
> >   { &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
> >   { &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
> >   { &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> > + { &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> > + { &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> >   
> >   { &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
> >   { &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> > @@ -802,6 +1020,7 @@ static int __init asus_fw_init(void)
> >   return -ENOMEM;
> >   
> >   init_rog_tunables(asus_armoury.rog_tunables);
> > + init_max_cpu_cores();
> >   
> >   err = asus_fw_attr_add();
> >   if (err)
> > diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> > index a5f95e806b4b..f400e3af24be 100644
> > --- a/drivers/platform/x86/asus-armoury.h
> > +++ b/drivers/platform/x86/asus-armoury.h
> > @@ -167,6 +167,34 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
> >   .name = _fsname, .attrs = _attrname##_attrs               \
> >   }
> >   
> > +/* CPU core attributes need a little different in setup */
> > +#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)              \
> > + __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
> > + __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
> > + static struct kobj_attribute attr_##_attrname##_current_value = \
> > + __ASUS_ATTR_RW(_attrname, current_value);               \
> > + static struct kobj_attribute attr_##_attrname##_default_value = \
> > + __ASUS_ATTR_RO(_attrname, default_value);               \
> > + static struct kobj_attribute attr_##_attrname##_min_value =     \
> > + __ASUS_ATTR_RO(_attrname, min_value);                   \
> > + static struct kobj_attribute attr_##_attrname##_max_value =     \
> > + __ASUS_ATTR_RO(_attrname, max_value);                   \
> > + static struct kobj_attribute attr_##_attrname##_type =          \
> > + __ASUS_ATTR_RO_AS(type, int_type_show);                 \
> > + static struct attribute *_attrname##_attrs[] = {                \
> > + &attr_##_attrname##_current_value.attr,                 \
> > + &attr_##_attrname##_default_value.attr,                 \
> > + &attr_##_attrname##_min_value.attr,                     \
> > + &attr_##_attrname##_max_value.attr,                     \
> > + &attr_##_attrname##_scalar_increment.attr,              \
> > + &attr_##_attrname##_display_name.attr,                  \
> > + &attr_##_attrname##_type.attr,                          \
> > + NULL                                                    \
> > + };                                                              \
> > + static const struct attribute_group _attrname##_attr_group = {  \
> > + .name = _fsname, .attrs = _attrname##_attrs             \
> > + }
> > +
> >   /*
> >    * ROG PPT attributes need a little different in setup as they
> >    * require rog_tunables members.
> > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > index e1aeafdf05d5..8964e601543a 100644
> > --- a/include/linux/platform_data/x86/asus-wmi.h
> > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > @@ -134,6 +134,10 @@
> >   /* dgpu on/off */
> >   #define ASUS_WMI_DEVID_DGPU 0x00090020
> >   
> > +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
> > +#define ASUS_WMI_DEVID_CORES 0x001200D2
> > + /* Maximum Intel E-core and P-core availability */
> > +#define ASUS_WMI_DEVID_CORES_MAX 0x001200D3
> >   #define ASUS_WMI_DEVID_DGPU_BASE_TGP 0x00120099
> >   #define ASUS_WMI_DEVID_DGPU_SET_TGP 0x00120098
> >   #define ASUS_WMI_DEVID_APU_MEM 0x000600C1
> 
> 

