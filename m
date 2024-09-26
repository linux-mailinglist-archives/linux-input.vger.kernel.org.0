Return-Path: <linux-input+bounces-6767-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 906C2987685
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 17:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B01981C231D2
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 15:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36C97BB15;
	Thu, 26 Sep 2024 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBnlMiyT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8647726AD3;
	Thu, 26 Sep 2024 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364637; cv=none; b=PH27HWZyme/CAdLETExNDEusYVN0nLJ3D2OlhrDMAZPDlnj5RqPGhkEr6GOKuluQ9LAvz9BIdOTzbOPgDZxdey3krDeEk4u8L35w0zE4Q6H+82ugE+5HrHE3M9E3MDdCdyp619T2hj0zU4CS/IZsx0Z0Zmqs6+J19Hk5n61DI6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364637; c=relaxed/simple;
	bh=bG6YnKK6v4CdqExO/zdY8Apz8jRZkV3r4QmqNmmrxP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JoPehnPr6I4vdRKOLDSIOtX24c9kO+qnCCLbbZ9M1MmgB7+R35Kk4mBvy7N0tRfjGUhluKTaLrZHs5DmnJJFTBaA0ASXr9mw6lvLdARR9oAerRxbZo7LtOput9r21pedn0Uzqd62138Ni8VZ0sTf4PsAQno/uH8PPrkfec1Rfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBnlMiyT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450CCC4CEC5;
	Thu, 26 Sep 2024 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727364637;
	bh=bG6YnKK6v4CdqExO/zdY8Apz8jRZkV3r4QmqNmmrxP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBnlMiyTmkoZwAv5OJgSogn7zVgi4OSRsoHB3YjRFToGid1y3mGhL/7s/IU3buqdb
	 /g5otWh5XL6uUDM3/AG5dIpoPEK6HIfAHDg92bFNKjjhvvtb7lNi5i57Ynmhs/xkGX
	 uiFsbQPnzDakMuJpFFKbZF1vLXI5qnevc1ml9LwuLldLSnP2RZSPvrnT+c437KoCtA
	 DyXIKaJ1Uzqoz6sL+Od4Jx37K54oS9OnT0QQWcJWgs1p51lB1nD+Hyqb/0+0XKwmE0
	 AdXd1RxpfWfpl/0UW3t0q43/JyyN6P4vw4K6LVF30RBlx7zAO3vWI3XX1uwyJ1YdgV
	 ZUpWJ62mDVkEQ==
Message-ID: <afd5769c-65fe-4fb7-97bc-1fc578cf2bd7@kernel.org>
Date: Thu, 26 Sep 2024 10:30:35 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] platform/x86: asus-armoury: add core count control
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-9-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240926092952.1284435-9-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/2024 04:29, Luke D. Jones wrote:
> Implement Intel core enablement under the asus-armoury module using the
> fw_attributes class.
> 
> This allows users to enable or disable preformance or efficiency cores
> depending on their requirements. After change a reboot is required.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>   drivers/platform/x86/asus-armoury.c        | 219 +++++++++++++++++++++
>   drivers/platform/x86/asus-armoury.h        |  28 +++
>   include/linux/platform_data/x86/asus-wmi.h |   4 +
>   3 files changed, 251 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index a0022dcee3a4..ce1facb40bd5 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -40,6 +40,21 @@
>   #define ASUS_MINI_LED_2024_STRONG 0x01
>   #define ASUS_MINI_LED_2024_OFF 0x02
>   
> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
> +
> +enum cpu_core_type {
> +	CPU_CORE_PERF = 0,
> +	CPU_CORE_POWER,
> +};
> +
> +enum cpu_core_value {
> +	CPU_CORE_DEFAULT = 0,
> +	CPU_CORE_MIN,
> +	CPU_CORE_MAX,
> +	CPU_CORE_CURRENT,
> +};
> +
>   /* Default limits for tunables available on ASUS ROG laptops */
>   #define PPT_CPU_LIMIT_MIN 5
>   #define PPT_CPU_LIMIT_MAX 150
> @@ -85,6 +100,13 @@ struct rog_tunables {
>   	u32 dgpu_tgp_min;
>   	u32 dgpu_tgp_max;
>   	u32 dgpu_tgp;
> +
> +	u32 cur_perf_cores;
> +	u32 min_perf_cores;
> +	u32 max_perf_cores;
> +	u32 cur_power_cores;
> +	u32 min_power_cores;
> +	u32 max_power_cores;
>   };
>   
>   static const struct class *fw_attr_class;
> @@ -143,6 +165,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>   static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>   {
>   	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> +	       !strcmp(attr->attr.name, "cores_performance") ||
> +	       !strcmp(attr->attr.name, "cores_efficiency") ||
>   	       !strcmp(attr->attr.name, "panel_hd_mode");
>   }
>   
> @@ -569,6 +593,198 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>   }
>   ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>   
> +static int init_max_cpu_cores(void)
> +{
> +	u32 cores;
> +	int err;
> +
> +	asus_armoury.rog_tunables->min_perf_cores = 4;
> +	asus_armoury.rog_tunables->max_perf_cores = 4;
> +	asus_armoury.rog_tunables->cur_perf_cores = 4;
> +	asus_armoury.rog_tunables->min_power_cores = 0;
> +	asus_armoury.rog_tunables->max_power_cores = 8;
> +	asus_armoury.rog_tunables->cur_power_cores = 8;

This seems like it's going to be dependent upon "specific" CPU SKU, no?

If you can't detect the bounds from the WMI API I think it would be 
smarter to use the CPU vendor specific CPUID/MSR APIs to discover the 
topology and how many cores of the different types exist.

Furthermore what about LP cores?  I guess those can't be turned and off 
from this API?

> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
> +	if (err)
> +		return err;
> +
> +	cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
> +	asus_armoury.rog_tunables->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> +	asus_armoury.rog_tunables->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> +
> +	cores = 0;
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
> +	if (err)
> +		return err;
> +
> +	asus_armoury.rog_tunables->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> +	asus_armoury.rog_tunables->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> +
> +	return 0;
> +}
> +
> +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
> +				enum cpu_core_type core_type, enum cpu_core_value core_value)
> +{
> +	u32 cores;
> +
> +	switch (core_value) {
> +	case CPU_CORE_DEFAULT:
> +	case CPU_CORE_MAX:
> +		if (core_type == CPU_CORE_PERF)
> +			return sysfs_emit(buf, "%d\n",
> +					  asus_armoury.rog_tunables->max_perf_cores);
> +		else
> +			return sysfs_emit(buf, "%d\n",
> +					  asus_armoury.rog_tunables->max_power_cores);
> +	case CPU_CORE_MIN:
> +		if (core_type == CPU_CORE_PERF)
> +			return sysfs_emit(buf, "%d\n",
> +					  asus_armoury.rog_tunables->min_perf_cores);
> +		else
> +			return sysfs_emit(buf, "%d\n",
> +					  asus_armoury.rog_tunables->min_power_cores);
> +	default:
> +		break;
> +	}
> +
> +	if (core_type == CPU_CORE_PERF)
> +		cores = asus_armoury.rog_tunables->cur_perf_cores;
> +	else
> +		cores = asus_armoury.rog_tunables->cur_power_cores;
> +
> +	return sysfs_emit(buf, "%d\n", cores);
> +}
> +
> +static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> +					 const char *buf, enum cpu_core_type core_type)
> +{
> +	int result, err;
> +	u32 new_cores, perf_cores, powr_cores, out_val, min, max;
> +
> +	result = kstrtou32(buf, 10, &new_cores);
> +	if (result)
> +		return result;
> +
> +	if (core_type == CPU_CORE_PERF) {
> +		perf_cores = new_cores;
> +		powr_cores = out_val = asus_armoury.rog_tunables->cur_power_cores;
> +		min = asus_armoury.rog_tunables->min_perf_cores;
> +		max = asus_armoury.rog_tunables->max_perf_cores;
> +	} else {
> +		perf_cores = asus_armoury.rog_tunables->cur_perf_cores;
> +		powr_cores = out_val = new_cores;
> +		min = asus_armoury.rog_tunables->min_power_cores;
> +		max = asus_armoury.rog_tunables->max_power_cores;
> +	}
> +
> +	if (new_cores < min || new_cores > max)
> +		return -EINVAL;
> +
> +	out_val = 0;
> +	out_val |= FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores);
> +	out_val |= FIELD_PREP(ASUS_POWER_CORE_MASK, powr_cores);
> +
> +	mutex_lock(&asus_armoury.mutex);
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
> +	mutex_unlock(&asus_armoury.mutex);
> +
> +	if (err) {
> +		pr_warn("Failed to set CPU core count: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	pr_info("CPU core count changed, reboot required\n");
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +	asus_set_reboot_and_signal_event();
> +
> +	return 0;
> +}
> +
> +static ssize_t cores_performance_min_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
> +}
> +
> +static ssize_t cores_performance_max_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
> +}
> +
> +static ssize_t cores_performance_default_value_show(struct kobject *kobj,
> +						    struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
> +}
> +
> +static ssize_t cores_performance_current_value_show(struct kobject *kobj,
> +						    struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
> +}
> +
> +static ssize_t cores_performance_current_value_store(struct kobject *kobj,
> +						     struct kobj_attribute *attr,
> +						     const char *buf, size_t count)
> +{
> +	int err;
> +
> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
> +		    "Set the max available performance cores");
> +
> +static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
> +}
> +
> +static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					       char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
> +}
> +
> +static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
> +						   struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
> +}
> +
> +static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
> +						   struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
> +}
> +
> +static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
> +						    struct kobj_attribute *attr, const char *buf,
> +						    size_t count)
> +{
> +	int err;
> +
> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
> +		    "Set the max available efficiency cores");
> +
>   /* Simple attribute creation */
>   ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
>   		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
> @@ -625,6 +841,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>   	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
>   	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
>   	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> +	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> +	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>   
>   	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>   	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> @@ -802,6 +1020,7 @@ static int __init asus_fw_init(void)
>   		return -ENOMEM;
>   
>   	init_rog_tunables(asus_armoury.rog_tunables);
> +	init_max_cpu_cores();
>   
>   	err = asus_fw_attr_add();
>   	if (err)
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index a5f95e806b4b..f400e3af24be 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -167,6 +167,34 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>   		.name = _fsname, .attrs = _attrname##_attrs               \
>   	}
>   
> +/* CPU core attributes need a little different in setup */
> +#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)              \
> +	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
> +	static struct kobj_attribute attr_##_attrname##_current_value = \
> +		__ASUS_ATTR_RW(_attrname, current_value);               \
> +	static struct kobj_attribute attr_##_attrname##_default_value = \
> +		__ASUS_ATTR_RO(_attrname, default_value);               \
> +	static struct kobj_attribute attr_##_attrname##_min_value =     \
> +		__ASUS_ATTR_RO(_attrname, min_value);                   \
> +	static struct kobj_attribute attr_##_attrname##_max_value =     \
> +		__ASUS_ATTR_RO(_attrname, max_value);                   \
> +	static struct kobj_attribute attr_##_attrname##_type =          \
> +		__ASUS_ATTR_RO_AS(type, int_type_show);                 \
> +	static struct attribute *_attrname##_attrs[] = {                \
> +		&attr_##_attrname##_current_value.attr,                 \
> +		&attr_##_attrname##_default_value.attr,                 \
> +		&attr_##_attrname##_min_value.attr,                     \
> +		&attr_##_attrname##_max_value.attr,                     \
> +		&attr_##_attrname##_scalar_increment.attr,              \
> +		&attr_##_attrname##_display_name.attr,                  \
> +		&attr_##_attrname##_type.attr,                          \
> +		NULL                                                    \
> +	};                                                              \
> +	static const struct attribute_group _attrname##_attr_group = {  \
> +		.name = _fsname, .attrs = _attrname##_attrs             \
> +	}
> +
>   /*
>    * ROG PPT attributes need a little different in setup as they
>    * require rog_tunables members.
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index e1aeafdf05d5..8964e601543a 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -134,6 +134,10 @@
>   /* dgpu on/off */
>   #define ASUS_WMI_DEVID_DGPU		0x00090020
>   
> +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
> +#define ASUS_WMI_DEVID_CORES		0x001200D2
> + /* Maximum Intel E-core and P-core availability */
> +#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
>   #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
>   #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
>   #define ASUS_WMI_DEVID_APU_MEM		0x000600C1


