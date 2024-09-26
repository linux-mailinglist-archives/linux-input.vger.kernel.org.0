Return-Path: <linux-input+bounces-6784-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11431987AF6
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 00:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C06AB220F8
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 22:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29CF1891BB;
	Thu, 26 Sep 2024 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3oSrqXC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C416B26AE6;
	Thu, 26 Sep 2024 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727388146; cv=none; b=r+gKb9WmufATxKswloSIAC2YljvZ3PTnFbCwfwInvEN66tL/N8DMMm/D0dn+E7IrwMIW4fc49FXk5bdAgtvnbaAzpKtYgaMWvfX0k/uRqUWODiFxoNV4dHUTdALGBF7TTuoQ6Onjfg84Y5+QcfuOI1RCbbabA9Sza6NYziCbkKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727388146; c=relaxed/simple;
	bh=IwdEzaVdYFO1bjJRS1pCyZ20NXXvBrunH2/CB1rq+eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nv6BRwfL839GJb2tjpTNWmu+ys29yfk1BA7grF6/O75muCwFjIhDJVeE9DYco/nUJAab7DqmhNaZbZyCr7YWF64Z9SMpe6n8nNj/vDZkmtiCEkENNrlKgCezEmkJvoTolrsSmqmvQnwiBxXbl+eJvxOo37uVYea+uYcEq85I3RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3oSrqXC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33B9C4CEC5;
	Thu, 26 Sep 2024 22:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727388146;
	bh=IwdEzaVdYFO1bjJRS1pCyZ20NXXvBrunH2/CB1rq+eo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l3oSrqXCudvTIEFohntGYR/TE2r8ng2WdvLB7Gnv9pL19roIwIK2+HJny7Ujqxs8H
	 kNHnGmzGw2+ptLPdhqUH+TSFXZ2BuUiwA2a/tMixvwhpeE+gJWxbEJomBUq/4M/yoY
	 0Z1GN0Ob5g1yWPgxzw4LGnY0x637P/NRdWWeCnDYvGaxaeqeG4Iv/jUdyibEWI7vqo
	 Fnb90asa2uAOJdmmCmHzXhtQykmwCvbCcL17LVqVy6cVV2mbhzVQB+5nnZkxMxRGHp
	 Z7p7H0XXdjHhOYG50mbstBTf4lU/kCjhGbpW1lgKTnDPeJLlMHzOd6HCMVWt8oq7iA
	 ocLqWv0M/HODw==
Message-ID: <43e7898c-b6dc-408a-9762-a3e56f0613f3@kernel.org>
Date: Thu, 26 Sep 2024 17:02:22 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] platform/x86: asus-armoury: add core count control
To: Luke Jones <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-9-luke@ljones.dev>
 <afd5769c-65fe-4fb7-97bc-1fc578cf2bd7@kernel.org>
 <a5cccd62-f9a5-4fa0-ac0a-d3dbe8217737@app.fastmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <a5cccd62-f9a5-4fa0-ac0a-d3dbe8217737@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/2024 16:47, Luke Jones wrote:
> Resend, sorry. My email client defaults to HTML
> 
> On Fri, 27 Sep 2024, at 3:30 AM, Mario Limonciello wrote:
>> On 9/26/2024 04:29, Luke D. Jones wrote:
>>> Implement Intel core enablement under the asus-armoury module using the
>>> fw_attributes class.
>>>
>>> This allows users to enable or disable preformance or efficiency cores
>>> depending on their requirements. After change a reboot is required.
>>>
>>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>>> ---
>>>    drivers/platform/x86/asus-armoury.c        | 219 +++++++++++++++++++++
>>>    drivers/platform/x86/asus-armoury.h        |  28 +++
>>>    include/linux/platform_data/x86/asus-wmi.h |   4 +
>>>    3 files changed, 251 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>> index a0022dcee3a4..ce1facb40bd5 100644
>>> --- a/drivers/platform/x86/asus-armoury.c
>>> +++ b/drivers/platform/x86/asus-armoury.c
>>> @@ -40,6 +40,21 @@
>>>    #define ASUS_MINI_LED_2024_STRONG 0x01
>>>    #define ASUS_MINI_LED_2024_OFF 0x02
>>>    
>>> +#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
>>> +#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
>>> +
>>> +enum cpu_core_type {
>>> + CPU_CORE_PERF = 0,
>>> + CPU_CORE_POWER,
>>> +};
>>> +
>>> +enum cpu_core_value {
>>> + CPU_CORE_DEFAULT = 0,
>>> + CPU_CORE_MIN,
>>> + CPU_CORE_MAX,
>>> + CPU_CORE_CURRENT,
>>> +};
>>> +
>>>    /* Default limits for tunables available on ASUS ROG laptops */
>>>    #define PPT_CPU_LIMIT_MIN 5
>>>    #define PPT_CPU_LIMIT_MAX 150
>>> @@ -85,6 +100,13 @@ struct rog_tunables {
>>>    u32 dgpu_tgp_min;
>>>    u32 dgpu_tgp_max;
>>>    u32 dgpu_tgp;
>>> +
>>> + u32 cur_perf_cores;
>>> + u32 min_perf_cores;
>>> + u32 max_perf_cores;
>>> + u32 cur_power_cores;
>>> + u32 min_power_cores;
>>> + u32 max_power_cores;
>>>    };
>>>    
>>>    static const struct class *fw_attr_class;
>>> @@ -143,6 +165,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>>>    static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>>>    {
>>>    return !strcmp(attr->attr.name, "gpu_mux_mode") ||
>>> +        !strcmp(attr->attr.name, "cores_performance") ||
>>> +        !strcmp(attr->attr.name, "cores_efficiency") ||
>>>           !strcmp(attr->attr.name, "panel_hd_mode");
>>>    }
>>>    
>>> @@ -569,6 +593,198 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>>>    }
>>>    ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>>>    
>>> +static int init_max_cpu_cores(void)
>>> +{
>>> + u32 cores;
>>> + int err;
>>> +
>>> + asus_armoury.rog_tunables->min_perf_cores = 4;
>>> + asus_armoury.rog_tunables->max_perf_cores = 4;
>>> + asus_armoury.rog_tunables->cur_perf_cores = 4;
>>> + asus_armoury.rog_tunables->min_power_cores = 0;
>>> + asus_armoury.rog_tunables->max_power_cores = 8;
>>> + asus_armoury.rog_tunables->cur_power_cores = 8;
>>
>> This seems like it's going to be dependent upon "specific" CPU SKU, no?
> 
> It is yeah. I was trying to set some sort of default but forgot about it after the fact.
> 
>> If you can't detect the bounds from the WMI API I think it would be
>> smarter to use the CPU vendor specific CPUID/MSR APIs to discover the
>> topology and how many cores of the different types exist.
> 
> Thinking about it now I would rather set it as an error and disable the ability to set cores. What do you think?

Seems fine to me.  Just make sure you mention it's intended behavior in 
a comment somewhere if it's not obvious.

> 
>> Furthermore what about LP cores?  I guess those can't be turned and off
>> from this API?
> 
> power/efficiency cores? They can be.

Intel has 3 core types on some products.  "Performance", "efficiency" 
and "low power".

I don't know a lot about them, I just want to make sure you do so you 
don't back yourself into a corner on API design.

> 
>>> +
>>> + err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
>>> + if (err)
>>> + return err;
>>> +
>>> + cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
>>> + asus_armoury.rog_tunables->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>> + asus_armoury.rog_tunables->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>> +
>>> + cores = 0;
>>> + err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
>>> + if (err)
>>> + return err;
>>> +
>>> + asus_armoury.rog_tunables->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>> + asus_armoury.rog_tunables->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>> +
>>> + return 0;
>>> +}
>>> +
>>> +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>>> + enum cpu_core_type core_type, enum cpu_core_value core_value)
>>> +{
>>> + u32 cores;
>>> +
>>> + switch (core_value) {
>>> + case CPU_CORE_DEFAULT:
>>> + case CPU_CORE_MAX:
>>> + if (core_type == CPU_CORE_PERF)
>>> + return sysfs_emit(buf, "%d\n",
>>> +   asus_armoury.rog_tunables->max_perf_cores);
>>> + else
>>> + return sysfs_emit(buf, "%d\n",
>>> +   asus_armoury.rog_tunables->max_power_cores);
>>> + case CPU_CORE_MIN:
>>> + if (core_type == CPU_CORE_PERF)
>>> + return sysfs_emit(buf, "%d\n",
>>> +   asus_armoury.rog_tunables->min_perf_cores);
>>> + else
>>> + return sysfs_emit(buf, "%d\n",
>>> +   asus_armoury.rog_tunables->min_power_cores);
>>> + default:
>>> + break;
>>> + }
>>> +
>>> + if (core_type == CPU_CORE_PERF)
>>> + cores = asus_armoury.rog_tunables->cur_perf_cores;
>>> + else
>>> + cores = asus_armoury.rog_tunables->cur_power_cores;
>>> +
>>> + return sysfs_emit(buf, "%d\n", cores);
>>> +}
>>> +
>>> +static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>>> + const char *buf, enum cpu_core_type core_type)
>>> +{
>>> + int result, err;
>>> + u32 new_cores, perf_cores, powr_cores, out_val, min, max;
>>> +
>>> + result = kstrtou32(buf, 10, &new_cores);
>>> + if (result)
>>> + return result;
>>> +
>>> + if (core_type == CPU_CORE_PERF) {
>>> + perf_cores = new_cores;
>>> + powr_cores = out_val = asus_armoury.rog_tunables->cur_power_cores;
>>> + min = asus_armoury.rog_tunables->min_perf_cores;
>>> + max = asus_armoury.rog_tunables->max_perf_cores;
>>> + } else {
>>> + perf_cores = asus_armoury.rog_tunables->cur_perf_cores;
>>> + powr_cores = out_val = new_cores;
>>> + min = asus_armoury.rog_tunables->min_power_cores;
>>> + max = asus_armoury.rog_tunables->max_power_cores;
>>> + }
>>> +
>>> + if (new_cores < min || new_cores > max)
>>> + return -EINVAL;
>>> +
>>> + out_val = 0;
>>> + out_val |= FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores);
>>> + out_val |= FIELD_PREP(ASUS_POWER_CORE_MASK, powr_cores);
>>> +
>>> + mutex_lock(&asus_armoury.mutex);
>>> + err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
>>> + mutex_unlock(&asus_armoury.mutex);
>>> +
>>> + if (err) {
>>> + pr_warn("Failed to set CPU core count: %d\n", err);
>>> + return err;
>>> + }
>>> +
>>> + if (result > 1) {
>>> + pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
>>> + return -EIO;
>>> + }
>>> +
>>> + pr_info("CPU core count changed, reboot required\n");
>>> + sysfs_notify(kobj, NULL, attr->attr.name);
>>> + asus_set_reboot_and_signal_event();
>>> +
>>> + return 0;
>>> +}
>>> +
>>> +static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>>> + struct kobj_attribute *attr, char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
>>> +}
>>> +
>>> +static ssize_t cores_performance_max_value_show(struct kobject *kobj,
>>> + struct kobj_attribute *attr, char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
>>> +}
>>> +
>>> +static ssize_t cores_performance_default_value_show(struct kobject *kobj,
>>> +     struct kobj_attribute *attr, char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
>>> +}
>>> +
>>> +static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>>> +     struct kobj_attribute *attr, char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>>> +}
>>> +
>>> +static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>> +      struct kobj_attribute *attr,
>>> +      const char *buf, size_t count)
>>> +{
>>> + int err;
>>> +
>>> + err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
>>> + if (err)
>>> + return err;
>>> +
>>> + return count;
>>> +}
>>> +ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>>> +     "Set the max available performance cores");
>>> +
>>> +static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> +        char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
>>> +}
>>> +
>>> +static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
>>> +        char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
>>> +}
>>> +
>>> +static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
>>> +    struct kobj_attribute *attr, char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
>>> +}
>>> +
>>> +static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>>> +    struct kobj_attribute *attr, char *buf)
>>> +{
>>> + return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>>> +}
>>> +
>>> +static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>> +     struct kobj_attribute *attr, const char *buf,
>>> +     size_t count)
>>> +{
>>> + int err;
>>> +
>>> + err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
>>> + if (err)
>>> + return err;
>>> +
>>> + return count;
>>> +}
>>> +ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>>> +     "Set the max available efficiency cores");
>>> +
>>>    /* Simple attribute creation */
>>>    ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
>>>           cpu_min, cpu_max, 1, "Set the CPU slow package limit");
>>> @@ -625,6 +841,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>>    { &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
>>>    { &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
>>>    { &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>> + { &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>> + { &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>    
>>>    { &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>>>    { &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>>> @@ -802,6 +1020,7 @@ static int __init asus_fw_init(void)
>>>    return -ENOMEM;
>>>    
>>>    init_rog_tunables(asus_armoury.rog_tunables);
>>> + init_max_cpu_cores();
>>>    
>>>    err = asus_fw_attr_add();
>>>    if (err)
>>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>>> index a5f95e806b4b..f400e3af24be 100644
>>> --- a/drivers/platform/x86/asus-armoury.h
>>> +++ b/drivers/platform/x86/asus-armoury.h
>>> @@ -167,6 +167,34 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>>>    .name = _fsname, .attrs = _attrname##_attrs               \
>>>    }
>>>    
>>> +/* CPU core attributes need a little different in setup */
>>> +#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)              \
>>> + __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>>> + __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>>> + static struct kobj_attribute attr_##_attrname##_current_value = \
>>> + __ASUS_ATTR_RW(_attrname, current_value);               \
>>> + static struct kobj_attribute attr_##_attrname##_default_value = \
>>> + __ASUS_ATTR_RO(_attrname, default_value);               \
>>> + static struct kobj_attribute attr_##_attrname##_min_value =     \
>>> + __ASUS_ATTR_RO(_attrname, min_value);                   \
>>> + static struct kobj_attribute attr_##_attrname##_max_value =     \
>>> + __ASUS_ATTR_RO(_attrname, max_value);                   \
>>> + static struct kobj_attribute attr_##_attrname##_type =          \
>>> + __ASUS_ATTR_RO_AS(type, int_type_show);                 \
>>> + static struct attribute *_attrname##_attrs[] = {                \
>>> + &attr_##_attrname##_current_value.attr,                 \
>>> + &attr_##_attrname##_default_value.attr,                 \
>>> + &attr_##_attrname##_min_value.attr,                     \
>>> + &attr_##_attrname##_max_value.attr,                     \
>>> + &attr_##_attrname##_scalar_increment.attr,              \
>>> + &attr_##_attrname##_display_name.attr,                  \
>>> + &attr_##_attrname##_type.attr,                          \
>>> + NULL                                                    \
>>> + };                                                              \
>>> + static const struct attribute_group _attrname##_attr_group = {  \
>>> + .name = _fsname, .attrs = _attrname##_attrs             \
>>> + }
>>> +
>>>    /*
>>>     * ROG PPT attributes need a little different in setup as they
>>>     * require rog_tunables members.
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index e1aeafdf05d5..8964e601543a 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -134,6 +134,10 @@
>>>    /* dgpu on/off */
>>>    #define ASUS_WMI_DEVID_DGPU 0x00090020
>>>    
>>> +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
>>> +#define ASUS_WMI_DEVID_CORES 0x001200D2
>>> + /* Maximum Intel E-core and P-core availability */
>>> +#define ASUS_WMI_DEVID_CORES_MAX 0x001200D3
>>>    #define ASUS_WMI_DEVID_DGPU_BASE_TGP 0x00120099
>>>    #define ASUS_WMI_DEVID_DGPU_SET_TGP 0x00120098
>>>    #define ASUS_WMI_DEVID_APU_MEM 0x000600C1
>>
>>


