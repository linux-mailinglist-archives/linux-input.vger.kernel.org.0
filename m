Return-Path: <linux-input+bounces-7506-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6739A254D
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 16:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71FDFB28E83
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 14:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3B21DE4D2;
	Thu, 17 Oct 2024 14:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMc5qqbd"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1C91DE3AC;
	Thu, 17 Oct 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729176072; cv=none; b=JtJUNNHryA5TtohYf4unOgnlzECiSb69yMHXOeMQLl55RKO6PukNRdom+xmNjTija97Eii2wP3XKoJtoiNFokqVGA8QXFLn4rfhi41lKZqO2bH7vqfoQEbazYUV2DUcIAKd0eqm+lRoTCSnXlY01miXY3zeFYGV/CTSCB7MuZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729176072; c=relaxed/simple;
	bh=VeRlFNjmqMEzUOkZD7SJgmuf1MJdVZhfWeD0roMjXt8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=BtiF3DIpEpvCyHVsz9K092Z81+0wphEvc8v5LQmSVx98yg0KxGSfuIp7jOVACq7SUpD+q4UajRUdVwBvAlEhZk2PVSLuZ6PnP2DE9gLXsiLw/mtntcZV0+iVyikIRJS2uHWaj+zwd8gQxgkiBJ3eCLlONrGhIk0km4etjz2WJME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMc5qqbd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729176068; x=1760712068;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VeRlFNjmqMEzUOkZD7SJgmuf1MJdVZhfWeD0roMjXt8=;
  b=nMc5qqbdwDG8La9A7vsxXLdp2HuMgIUxDzZvjLcXOEQLwTomrQ+h46x2
   iNbp0XuuHeow+9VKFQjkBLuRVZs25YGTZQbC1+GuaneIKK/UgrVPsmAfZ
   XhVLgIkLpzSrYaIEhk6KgqJY0dFMUuV9VraXromTnpJ34R4CqJrY8wnjo
   eRKm2YCZdLPnI8dpOxEZ4xfzXc5/synFDvo9pDATVm8TJqA1n1g+B+XI8
   Pb3iCmr5YnnOHfww5AlyP/SM5+ribJeWGnxrzmndjzKwKXGc4i2J6wIwh
   urgXTNdpijNz+7ic2leCMKKPna9gde2abUXnOx2thFgliYt1B5t4bbfO4
   Q==;
X-CSE-ConnectionGUID: N66Jc0MqQSKo57C+RZKBbA==
X-CSE-MsgGUID: Ia6ngPjWR1WMDtt8r78D1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28763245"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28763245"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 07:41:07 -0700
X-CSE-ConnectionGUID: WiZ6WTDlSwaSBVNmM2DbVQ==
X-CSE-MsgGUID: goZpJAdxTCe/RV6GuxqATA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; 
   d="scan'208";a="101871135"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.91])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 07:41:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Oct 2024 17:41:00 +0300 (EEST)
To: "Luke D. Jones" <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    jikos@kernel.org, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    superm1@kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 8/9] platform/x86: asus-armoury: add core count
 control
In-Reply-To: <20240930000046.51388-9-luke@ljones.dev>
Message-ID: <33f4f13f-c5ed-ac89-9243-4356976cc042@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev> <20240930000046.51388-9-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Luke D. Jones wrote:

> Implement Intel core enablement under the asus-armoury module using the
> fw_attributes class.
> 
> This allows users to enable or disable preformance or efficiency cores
> depending on their requirements. After change a reboot is required.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/asus-armoury.c        | 227 +++++++++++++++++++++
>  drivers/platform/x86/asus-armoury.h        |  28 +++
>  include/linux/platform_data/x86/asus-wmi.h |   4 +
>  3 files changed, 259 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 09e0cbf24f25..caaa55219946 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -40,6 +40,24 @@
>  #define ASUS_MINI_LED_2024_STRONG 0x01
>  #define ASUS_MINI_LED_2024_OFF 0x02
>  
> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)

Align GENMASK()s.

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
>  /* Default limits for tunables available on ASUS ROG laptops */
>  #define NVIDIA_BOOST_MIN 5
>  #define NVIDIA_BOOST_MAX 25
> @@ -85,6 +103,13 @@ struct rog_tunables {
>  	u32 dgpu_tgp_min;
>  	u32 dgpu_tgp_max;
>  	u32 dgpu_tgp;
> +
> +	u32 cur_perf_cores;
> +	u32 min_perf_cores;
> +	u32 max_perf_cores;
> +	u32 cur_power_cores;
> +	u32 min_power_cores;
> +	u32 max_power_cores;
>  };
>  
>  static const struct class *fw_attr_class;
> @@ -143,6 +168,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>  static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>  {
>  	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> +	       !strcmp(attr->attr.name, "cores_performance") ||
> +	       !strcmp(attr->attr.name, "cores_efficiency") ||
>  	       !strcmp(attr->attr.name, "panel_hd_mode");
>  }
>  
> @@ -579,6 +606,200 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>  }
>  ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
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

This looks deadcode.

> +	asus_armoury.rog_tunables->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
> +	asus_armoury.rog_tunables->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
> +
> +	cores = 0;

Is this needed, you're doing get after all?

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

Please be consistent with the struct field naming and use "power_cores".

-- 
 i.

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
>  /* Simple attribute creation */
>  ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
>  		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
> @@ -635,6 +856,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>  	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
>  	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> +	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> +	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>  
>  	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>  	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> @@ -752,6 +975,7 @@ static void init_rog_tunables(struct rog_tunables *rog)
>  	 * "ROG Flow X16 GV601VV_GV601VV_00185149B".
>  	 * The bulk of these defaults are gained from users reporting what
>  	 * ASUS Armoury Crate in Windows provides them.
> +	 * This should be turned in to a tabe eventually.
>  	 */
>  	product = dmi_get_system_info(DMI_PRODUCT_NAME);
>  
> @@ -836,6 +1060,9 @@ static int __init asus_fw_init(void)
>  		return -ENOMEM;
>  
>  	init_rog_tunables(asus_armoury.rog_tunables);
> +	err = init_max_cpu_cores();
> +	if (err)
> +		return err;
>  
>  	err = asus_fw_attr_add();
>  	if (err)
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index e08459cad942..04b88f7d2421 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -167,6 +167,34 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>  		.name = _fsname, .attrs = _attrname##_attrs               \
>  	}
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
>  /*
>   * ROG PPT attributes need a little different in setup as they
>   * require rog_tunables members.
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 88bf250dc8ca..cc21e4272460 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -137,6 +137,10 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
> +#define ASUS_WMI_DEVID_CORES		0x001200D2
> + /* Maximum Intel E-core and P-core availability */
> +#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
>  #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
>  #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
>  #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
> 

