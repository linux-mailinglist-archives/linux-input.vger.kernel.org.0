Return-Path: <linux-input+bounces-6870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7119896EE
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 20:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CB311F210A8
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 18:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2425103F;
	Sun, 29 Sep 2024 18:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdFTrrLc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0093A1B5;
	Sun, 29 Sep 2024 18:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727636276; cv=none; b=FEqKaZBNUdzeM8tMia9W7WuPq84TLjaiVdRuqPUlwIU5yHr2w/xySrM+cx4ugzi2sN/GPPdJ1v9zh/NkAJT2U0vgDJRm/8QJlwqzN79OKleOErAPZGi1ON+uUroupJIgWYzvTQkBariom2BxmcPxXexcoYEqpuLF5zQBpOxJz9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727636276; c=relaxed/simple;
	bh=UxpORH3VQs2UrVjLV0qmZ4k4DejKeQpxHjEDONkFCn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fxNSWvFeKmQHtgU+twJbRAWJ8es6VSYmEacNqW5nN4leflzQLuJfBuimFY94ebczH791f4/xKjJp0XSYcbuOg8b6DGj/vyXvgBDxwMkxHnJ9Ko+RWYaHU9rDJCxEuQIsD0TNesbEHFmnSUMClmEMXzLqk3mCNX6y+OL9orgyitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdFTrrLc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60CC0C4CEC5;
	Sun, 29 Sep 2024 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727636275;
	bh=UxpORH3VQs2UrVjLV0qmZ4k4DejKeQpxHjEDONkFCn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NdFTrrLcGtlE1UCilf4xYZoTvWdPDg60QDBynCNlLIvMSwmsPcKUS55iR8ijTS2kp
	 TJ++hq+Zxb45YKVPJ2J0r5ihtAgSeSBIJ+/++UQ0UKC33xmC1XHvzHz1qe3Hrfbax/
	 P2Ny3ahfSsLfcoBX5jmPdnHHhDtS8AfXzHNP3IYBAmBILzCr9bXmHTfq1vxVj+brnj
	 5sWvb+M1t8b8xUo5BvMOxz/8WhzHKsvedFUwsL3u7VLkOkeW5zXwT8E4d+RQFIRGme
	 nYLFA99wafRfrMM1usc/1ASH8iEXuEZZkmDtEIcIrCmDt69pGU6tp2RWsxabtPapj5
	 EwEGH5isErcWg==
Message-ID: <21caf34f-b097-4d00-92da-e783ee1a1335@kernel.org>
Date: Sun, 29 Sep 2024 13:57:53 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] platform/x86: asus-armoury: add core count control
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240929090813.7888-1-luke@ljones.dev>
 <20240929090813.7888-9-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240929090813.7888-9-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/24 04:08, Luke D. Jones wrote:
> Implement Intel core enablement under the asus-armoury module using the
> fw_attributes class.
> 
> This allows users to enable or disable preformance or efficiency cores
> depending on their requirements. After change a reboot is required.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>   drivers/platform/x86/asus-armoury.c        | 227 +++++++++++++++++++++
>   drivers/platform/x86/asus-armoury.h        |  28 +++
>   include/linux/platform_data/x86/asus-wmi.h |   4 +
>   3 files changed, 259 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index c4c79a33c56e..6e5bfb2c58e8 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -40,6 +40,24 @@
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
> +#define CPU_PERF_CORE_COUNT_MIN 4
> +#define CPU_POWR_CORE_COUNT_MIN 0
> +
>   /* Default limits for tunables available on ASUS ROG laptops */
>   #define NVIDIA_BOOST_MIN 5
>   #define NVIDIA_BOOST_MAX 25
> @@ -85,6 +103,13 @@ struct rog_tunables {
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
> @@ -143,6 +168,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>   static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>   {
>   	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> +	       !strcmp(attr->attr.name, "cores_performance") ||
> +	       !strcmp(attr->attr.name, "cores_efficiency") ||
>   	       !strcmp(attr->attr.name, "panel_hd_mode");
>   }
>   
> @@ -579,6 +606,200 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>   }
>   ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>   
> +static int init_max_cpu_cores(void)
> +{
> +	u32 cores;
> +	int err;
> +
> +	if (!asus_wmi_is_present(ASUS_WMI_DEVID_CORES_MAX))
> +		return 0;
> +
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
> +	if (err) {
> +		pr_err("Could not get CPU core count: error %d", err);
> +		return err;
> +	}
> +
> +	asus_armoury.rog_tunables->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> +	asus_armoury.rog_tunables->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> +
> +	asus_armoury.rog_tunables->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
> +	asus_armoury.rog_tunables->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
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

I don't really understand the difference with CPU_CORE_MAX and 
CPU_CORE_DEFAULT at least as it pertains to sysfs.  Aren't they 
returning the same exact data?  Why do they need their own sysfs files?

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
> @@ -635,6 +856,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>   	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
>   	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
>   	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> +	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> +	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>   
>   	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>   	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> @@ -747,6 +970,7 @@ static void init_rog_tunables(struct rog_tunables *rog)
>   	 * "ROG Flow X16 GV601VV_GV601VV_00185149B".
>   	 * The bulk of these defaults are gained from users reporting what
>   	 * ASUS Armoury Crate in Windows provides them.
> +	 * This should be turned in to a tabe eventually.
>   	 */
>   	product = dmi_get_system_info(DMI_PRODUCT_NAME);
>   
> @@ -831,6 +1055,9 @@ static int __init asus_fw_init(void)
>   		return -ENOMEM;
>   
>   	init_rog_tunables(asus_armoury.rog_tunables);
> +	err = init_max_cpu_cores();
> +	if (err)
> +		return err;
>   
>   	err = asus_fw_attr_add();
>   	if (err)
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index e08459cad942..04b88f7d2421 100644
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
> index 88bf250dc8ca..cc21e4272460 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -137,6 +137,10 @@
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


