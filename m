Return-Path: <linux-input+bounces-6873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636B98983F
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A90E1C20EFD
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 22:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FD314A636;
	Sun, 29 Sep 2024 22:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="hPgWfoUw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="D0RI5VqI"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250D148CDD;
	Sun, 29 Sep 2024 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727647989; cv=none; b=njU71aedpDoVQdUiBs5aE6n8SM5I5alykibnfVFtpPfj7Sg9Jeb8gJn+1zvqIWpnM3k7zuxW3fwbYUtBfJyoKncctBUN+ec9o9xs1tqEiKMJ46Xq5cd9rRiM1+GTtouAcPkQbIGeH9qLXmrU6DTLX/tNFQgOo4U9+m+7BMTcBJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727647989; c=relaxed/simple;
	bh=AjSPWZAQbdgIoopopjSgrlfbw+j3u0maLGdJMxKQbkU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uA9rQo6S6VUvOwWbpD0LogmC1q8X4gQHqOUgWpvkywagnOYtx2lP5COIaA8eMe1MmUdmytTy67oz78qNOJyisIrkbRwrLToKo4/HY+oJvi8TYTy9ehy88klQ15HgUlK+quHsOeZqUV8LOR1iNsWh235TLQAXyOiSbiKT3FScpi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=hPgWfoUw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=D0RI5VqI; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id 251E6138012F;
	Sun, 29 Sep 2024 18:13:06 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-08.internal (MEProxy); Sun, 29 Sep 2024 18:13:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1727647986;
	 x=1727734386; bh=UYcXcAtE3dsCwbc6klfGanR5yOJIYBRMH72UWiYuHMQ=; b=
	hPgWfoUwQM66PnpFQPRKjF7PKKF+rici/H+KVdClHv2ZrnRmHnv5adGch/r7i/cK
	3jd9IT5kCOTYmuw+/x0O4Acq+LGJ+JdD09QWpzoxPcwS461hXJPXiAFntqwJq3PV
	6zm7ij42nOepq18GSUvdgz9idtcZyY9DoiUTZw6T8R1m9EABLboZhXOHUJ7Eldcb
	MKwTHuUMmNgTbrm9aXC+m6UBmRTMCrUPrI4lzDWrUE1PWBI4f3VrN6igsOwRvIrR
	WCVTXEiRYDw8Hk7sTi1xO98qUzzhE7kWnSNThNkx2nOi+3Vbb5opkcvsotR686eZ
	FFPvj+9hkKpwC6qRTIpiVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727647986; x=
	1727734386; bh=UYcXcAtE3dsCwbc6klfGanR5yOJIYBRMH72UWiYuHMQ=; b=D
	0RI5VqI7jTKW7Sa+rTWJ3NrUvIdfhqlEnbrKTxubipCai5CJkJ+o3IJTZ44Y3sjz
	myi7q3Qd2tE2DEc9e1vkp6HXHHBYzoh9EIv2V7cXisa+wS3W2cv9hFcBntnlFSrg
	/y44k51QXd8YpjaffzVZz3Omhjz0TlEqoIAfcekfbmw3hIV8OrLk8LycPvdL/z/u
	NXsrJlworjYymve+HuRgRLUTJGj2bptPP8XqTUr78d2jOSXRePokk0R1fHVslooO
	rSHxNpP1FOUEezeoORwoAZjpSb74vVkFa1vjw5xfJX9DsxiaIs/z5vIEK6v/n/Ta
	kuv27NMORc6sFraCuWVWw==
X-ME-Sender: <xms:8dD5ZkQ_9esbjCd3hUqKHrBbAE8LsWdJ-6Khv9Bn44KDbQldEj8-fg>
    <xme:8dD5Zhwk6WAzJG5-42QFOaIXft3JYqq4Ga-ByCk_udcE4yj3K2jibs0eky1n71JHM
    1Xlmv5uij-ONBni788>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgtdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfnfhukhgvucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrdguvg
    hvqeenucggtffrrghtthgvrhhnpefgieffhedtgffhtedtiedutdefkedvjefgveehhfff
    vedthfejleegfeffkedvveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtohhrvghnthhinhdrtghhrghrhi
    esghhmrghilhdrtghomhdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehsuhhpvghrmhdusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehilh
    hpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohep
    hhguvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehlihhnuhigqdhinh
    hpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorh
    hmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:8dD5Zh3g5ULH66FZe-uk6PEULtSbI-PNM-1um0CUB9C8P0Q8u3WqTw>
    <xmx:8dD5ZoDm2QjjDMb9KFceuYR4kpSC4kZlmZcFGEGXZvzuqSNgXI1QXQ>
    <xmx:8dD5ZtjoIUTnycR7BciGGqqiyVqcMFq_tnihcu1VJC0yG8gCYZSYVA>
    <xmx:8dD5ZkrQqPGDXyKnMcLHYYvVljzjpBUiSGqOmg4OzfqRfZVq1hyRKA>
    <xmx:8tD5ZoX9AKrGai3JMMFiLRMHG2YQ12odL-YZBk5cnr3jaoPAxSnXVTwf>
Feedback-ID: i5ec1447f:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BEC763360077; Sun, 29 Sep 2024 18:13:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 30 Sep 2024 11:12:44 +1300
From: "Luke Jones" <luke@ljones.dev>
To: "Mario Limonciello" <superm1@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, "Jiri Kosina" <jikos@kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hdegoede@redhat.com>, corentin.chary@gmail.com
Message-Id: <8ee61e13-bba2-4876-9ce1-b5849071ae98@app.fastmail.com>
In-Reply-To: <21caf34f-b097-4d00-92da-e783ee1a1335@kernel.org>
References: <20240929090813.7888-1-luke@ljones.dev>
 <20240929090813.7888-9-luke@ljones.dev>
 <21caf34f-b097-4d00-92da-e783ee1a1335@kernel.org>
Subject: Re: [PATCH v5 8/9] platform/x86: asus-armoury: add core count control
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, 30 Sep 2024, at 7:57 AM, Mario Limonciello wrote:
> On 9/29/24 04:08, Luke D. Jones wrote:
>> Implement Intel core enablement under the asus-armoury module using the
>> fw_attributes class.
>> 
>> This allows users to enable or disable preformance or efficiency cores
>> depending on their requirements. After change a reboot is required.
>> 
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> ---
>>   drivers/platform/x86/asus-armoury.c        | 227 +++++++++++++++++++++
>>   drivers/platform/x86/asus-armoury.h        |  28 +++
>>   include/linux/platform_data/x86/asus-wmi.h |   4 +
>>   3 files changed, 259 insertions(+)
>> 
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>> index c4c79a33c56e..6e5bfb2c58e8 100644
>> --- a/drivers/platform/x86/asus-armoury.c
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -40,6 +40,24 @@
>>   #define ASUS_MINI_LED_2024_STRONG 0x01
>>   #define ASUS_MINI_LED_2024_OFF 0x02
>>   
>> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
>> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
>> +
>> +enum cpu_core_type {
>> +	CPU_CORE_PERF = 0,
>> +	CPU_CORE_POWER,
>> +};
>> +
>> +enum cpu_core_value {
>> +	CPU_CORE_DEFAULT = 0,
>> +	CPU_CORE_MIN,
>> +	CPU_CORE_MAX,
>> +	CPU_CORE_CURRENT,
>> +};
>> +
>> +#define CPU_PERF_CORE_COUNT_MIN 4
>> +#define CPU_POWR_CORE_COUNT_MIN 0
>> +
>>   /* Default limits for tunables available on ASUS ROG laptops */
>>   #define NVIDIA_BOOST_MIN 5
>>   #define NVIDIA_BOOST_MAX 25
>> @@ -85,6 +103,13 @@ struct rog_tunables {
>>   	u32 dgpu_tgp_min;
>>   	u32 dgpu_tgp_max;
>>   	u32 dgpu_tgp;
>> +
>> +	u32 cur_perf_cores;
>> +	u32 min_perf_cores;
>> +	u32 max_perf_cores;
>> +	u32 cur_power_cores;
>> +	u32 min_power_cores;
>> +	u32 max_power_cores;
>>   };
>>   
>>   static const struct class *fw_attr_class;
>> @@ -143,6 +168,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>>   static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>>   {
>>   	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
>> +	       !strcmp(attr->attr.name, "cores_performance") ||
>> +	       !strcmp(attr->attr.name, "cores_efficiency") ||
>>   	       !strcmp(attr->attr.name, "panel_hd_mode");
>>   }
>>   
>> @@ -579,6 +606,200 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>>   }
>>   ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>>   
>> +static int init_max_cpu_cores(void)
>> +{
>> +	u32 cores;
>> +	int err;
>> +
>> +	if (!asus_wmi_is_present(ASUS_WMI_DEVID_CORES_MAX))
>> +		return 0;
>> +
>> +
>> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
>> +	if (err)
>> +		return err;
>> +
>> +	cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
>> +	asus_armoury.rog_tunables->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>> +	asus_armoury.rog_tunables->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>> +
>> +	cores = 0;
>> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
>> +	if (err) {
>> +		pr_err("Could not get CPU core count: error %d", err);
>> +		return err;
>> +	}
>> +
>> +	asus_armoury.rog_tunables->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>> +	asus_armoury.rog_tunables->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>> +
>> +	asus_armoury.rog_tunables->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>> +	asus_armoury.rog_tunables->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>> +				enum cpu_core_type core_type, enum cpu_core_value core_value)
>> +{
>> +	u32 cores;
>> +
>> +	switch (core_value) {
>> +	case CPU_CORE_DEFAULT:
>> +	case CPU_CORE_MAX:
>> +		if (core_type == CPU_CORE_PERF)
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->max_perf_cores);
>> +		else
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->max_power_cores);
>> +	case CPU_CORE_MIN:
>> +		if (core_type == CPU_CORE_PERF)
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->min_perf_cores);
>> +		else
>> +			return sysfs_emit(buf, "%d\n",
>> +					  asus_armoury.rog_tunables->min_power_cores);
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (core_type == CPU_CORE_PERF)
>> +		cores = asus_armoury.rog_tunables->cur_perf_cores;
>> +	else
>> +		cores = asus_armoury.rog_tunables->cur_power_cores;
>> +
>> +	return sysfs_emit(buf, "%d\n", cores);
>> +}
>> +
>> +static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>> +					 const char *buf, enum cpu_core_type core_type)
>> +{
>> +	int result, err;
>> +	u32 new_cores, perf_cores, powr_cores, out_val, min, max;
>> +
>> +	result = kstrtou32(buf, 10, &new_cores);
>> +	if (result)
>> +		return result;
>> +
>> +	if (core_type == CPU_CORE_PERF) {
>> +		perf_cores = new_cores;
>> +		powr_cores = out_val = asus_armoury.rog_tunables->cur_power_cores;
>> +		min = asus_armoury.rog_tunables->min_perf_cores;
>> +		max = asus_armoury.rog_tunables->max_perf_cores;
>> +	} else {
>> +		perf_cores = asus_armoury.rog_tunables->cur_perf_cores;
>> +		powr_cores = out_val = new_cores;
>> +		min = asus_armoury.rog_tunables->min_power_cores;
>> +		max = asus_armoury.rog_tunables->max_power_cores;
>> +	}
>> +
>> +	if (new_cores < min || new_cores > max)
>> +		return -EINVAL;
>> +
>> +	out_val = 0;
>> +	out_val |= FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores);
>> +	out_val |= FIELD_PREP(ASUS_POWER_CORE_MASK, powr_cores);
>> +
>> +	mutex_lock(&asus_armoury.mutex);
>> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
>> +	mutex_unlock(&asus_armoury.mutex);
>> +
>> +	if (err) {
>> +		pr_warn("Failed to set CPU core count: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	if (result > 1) {
>> +		pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
>> +		return -EIO;
>> +	}
>> +
>> +	pr_info("CPU core count changed, reboot required\n");
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +	asus_set_reboot_and_signal_event();
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>> +						struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
>> +}
>> +
>> +static ssize_t cores_performance_max_value_show(struct kobject *kobj,
>> +						struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
>> +}
>> +
>> +static ssize_t cores_performance_default_value_show(struct kobject *kobj,
>> +						    struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
>> +}
>> +
>
> I don't really understand the difference with CPU_CORE_MAX and 
> CPU_CORE_DEFAULT at least as it pertains to sysfs.  Aren't they 
> returning the same exact data?  Why do they need their own sysfs files?

I guess I added as it felt like it should be there since `default` is part of the API. Like trying to fill in all of what felt expected to be there.

In the end it doesn't make any difference except maybe clarity? What is the default is it min or max?

>> +static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>> +						    struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>> +}
>> +
>> +static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>> +						     struct kobj_attribute *attr,
>> +						     const char *buf, size_t count)
>> +{
>> +	int err;
>> +
>> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>> +		    "Set the max available performance cores");
>> +
>> +static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +					       char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
>> +}
>> +
>> +static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +					       char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
>> +}
>> +
>> +static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
>> +						   struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
>> +}
>> +
>> +static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>> +						   struct kobj_attribute *attr, char *buf)
>> +{
>> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>> +}
>> +
>> +static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>> +						    struct kobj_attribute *attr, const char *buf,
>> +						    size_t count)
>> +{
>> +	int err;
>> +
>> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
>> +	if (err)
>> +		return err;
>> +
>> +	return count;
>> +}
>> +ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>> +		    "Set the max available efficiency cores");
>> +
>>   /* Simple attribute creation */
>>   ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
>>   		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
>> @@ -635,6 +856,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>   	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
>>   	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
>>   	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>> +	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>> +	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>   
>>   	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>>   	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>> @@ -747,6 +970,7 @@ static void init_rog_tunables(struct rog_tunables *rog)
>>   	 * "ROG Flow X16 GV601VV_GV601VV_00185149B".
>>   	 * The bulk of these defaults are gained from users reporting what
>>   	 * ASUS Armoury Crate in Windows provides them.
>> +	 * This should be turned in to a tabe eventually.
>>   	 */
>>   	product = dmi_get_system_info(DMI_PRODUCT_NAME);
>>   
>> @@ -831,6 +1055,9 @@ static int __init asus_fw_init(void)
>>   		return -ENOMEM;
>>   
>>   	init_rog_tunables(asus_armoury.rog_tunables);
>> +	err = init_max_cpu_cores();
>> +	if (err)
>> +		return err;
>>   
>>   	err = asus_fw_attr_add();
>>   	if (err)
>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>> index e08459cad942..04b88f7d2421 100644
>> --- a/drivers/platform/x86/asus-armoury.h
>> +++ b/drivers/platform/x86/asus-armoury.h
>> @@ -167,6 +167,34 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>>   		.name = _fsname, .attrs = _attrname##_attrs               \
>>   	}
>>   
>> +/* CPU core attributes need a little different in setup */
>> +#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)              \
>> +	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>> +	static struct kobj_attribute attr_##_attrname##_current_value = \
>> +		__ASUS_ATTR_RW(_attrname, current_value);               \
>> +	static struct kobj_attribute attr_##_attrname##_default_value = \
>> +		__ASUS_ATTR_RO(_attrname, default_value);               \
>> +	static struct kobj_attribute attr_##_attrname##_min_value =     \
>> +		__ASUS_ATTR_RO(_attrname, min_value);                   \
>> +	static struct kobj_attribute attr_##_attrname##_max_value =     \
>> +		__ASUS_ATTR_RO(_attrname, max_value);                   \
>> +	static struct kobj_attribute attr_##_attrname##_type =          \
>> +		__ASUS_ATTR_RO_AS(type, int_type_show);                 \
>> +	static struct attribute *_attrname##_attrs[] = {                \
>> +		&attr_##_attrname##_current_value.attr,                 \
>> +		&attr_##_attrname##_default_value.attr,                 \
>> +		&attr_##_attrname##_min_value.attr,                     \
>> +		&attr_##_attrname##_max_value.attr,                     \
>> +		&attr_##_attrname##_scalar_increment.attr,              \
>> +		&attr_##_attrname##_display_name.attr,                  \
>> +		&attr_##_attrname##_type.attr,                          \
>> +		NULL                                                    \
>> +	};                                                              \
>> +	static const struct attribute_group _attrname##_attr_group = {  \
>> +		.name = _fsname, .attrs = _attrname##_attrs             \
>> +	}
>> +
>>   /*
>>    * ROG PPT attributes need a little different in setup as they
>>    * require rog_tunables members.
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 88bf250dc8ca..cc21e4272460 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -137,6 +137,10 @@
>>   /* dgpu on/off */
>>   #define ASUS_WMI_DEVID_DGPU		0x00090020
>>   
>> +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
>> +#define ASUS_WMI_DEVID_CORES		0x001200D2
>> + /* Maximum Intel E-core and P-core availability */
>> +#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
>>   #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
>>   #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
>>   #define ASUS_WMI_DEVID_APU_MEM		0x000600C1

