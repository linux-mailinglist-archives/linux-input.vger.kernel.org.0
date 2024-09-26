Return-Path: <linux-input+bounces-6765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BF898766F
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 17:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40D22B298AD
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 15:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7170114BF8B;
	Thu, 26 Sep 2024 15:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZxZM6Hb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4145743AB9;
	Thu, 26 Sep 2024 15:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364314; cv=none; b=M9IBAJSWzIXLdu5dR5j/0jLQo++x0+HBh86RpuGYHahjZ7uwMDUtas8kDoRHD0+d31sA1/p8pHNjHBQrlkW47E0OekDUjs45N2sOwFFbxsUGveh5V0a8XMLIeTdfO6Q9GWuFMnrTqE+g3MCgZaHu8PiFa7US3Cnze3RpXJmCHqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364314; c=relaxed/simple;
	bh=TPt93JDjmbuI4Gvk/WBTVqtehfFofxIUzKliPwY8Qt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKdeGKXY/xxFAaBghxsM63CnepXt5z9SXnhFikq4jMWqezcTF0ngLjUT4Ne2FIIkD6L0w1f38b0Vl/HdBczYeywABHOJ3MsmAQTSPytc8XTopSXjg+25PpBfMwCBuiqpCEZeSOzs5QSBD0FBoCItEG0qgu/R0weAtn+MJIKbU1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZxZM6Hb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B97FC4CEC5;
	Thu, 26 Sep 2024 15:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727364313;
	bh=TPt93JDjmbuI4Gvk/WBTVqtehfFofxIUzKliPwY8Qt8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MZxZM6HbIf9Oui7WM7xWvF3yHPoSDip2tEFFtpHJrwQZ1tIFnIhOAW6MlSW4eIJHP
	 WcBIfXcv2lODsvOyRv9HOayqww29WlwvTs+K2Jh0aQ98UVhAXwOE+XFdJwsgspy3va
	 kxuYoEFoZ8kr1+k0pUjHB3ezi78A5u0Qu+t0E+QfrHJGsPLH9v4RaSvy+qnkm1m5Wc
	 l/2vmfM0b50WyVqekKKubRYhZJmCZ3W5jRk/NEGPsQco/zL4IZis/0Rw6+c92F/mXc
	 tgsklVtoyWWKROM4kWKYNoXNFBZA+AaU+cqoEFJwYegSjMY70l/J7vmiXLaEZH+Gfc
	 e/JBnzRmRr6Ig==
Message-ID: <b23a03d6-16c4-42ed-a99f-519b9ca8408d@kernel.org>
Date: Thu, 26 Sep 2024 10:25:12 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] platform/x86: asus-armoury: add apu-mem control
 support
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-8-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240926092952.1284435-8-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/2024 04:29, Luke D. Jones wrote:
> Implement the APU memory size control under the asus-armoury module using
> the fw_attributes class.
> 
> This allows the APU allocated memory size to be adjusted depending on
> the users priority. A reboot is required after change.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/asus-armoury.c        | 114 +++++++++++++++++++++
>   include/linux/platform_data/x86/asus-wmi.h |   1 +
>   2 files changed, 115 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 0f67b5deb629..a0022dcee3a4 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -456,6 +456,119 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
>   WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
>   ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
>   
> +/* Device memory available to APU */
> +
> +static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					  char *buf)
> +{
> +	int err;
> +	u32 mem;
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
> +	if (err)
> +		return err;
> +
> +	switch (mem) {
> +	case 0x100:
> +		mem = 0;
> +		break;
> +	case 0x102:
> +		mem = 1;
> +		break;
> +	case 0x103:
> +		mem = 2;
> +		break;
> +	case 0x104:
> +		mem = 3;
> +		break;
> +	case 0x105:
> +		mem = 4;
> +		break;
> +	case 0x106:
> +		/* This is out of order and looks wrong but is correct */
> +		mem = 8;
> +		break;
> +	case 0x107:
> +		mem = 5;
> +		break;
> +	case 0x108:
> +		mem = 6;
> +		break;
> +	case 0x109:
> +		mem = 7;
> +		break;
> +	default:
> +		mem = 4;
> +		break;
> +	}
> +
> +	return sysfs_emit(buf, "%u\n", mem);
> +}
> +
> +static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> +					   const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 requested, mem;
> +
> +	result = kstrtou32(buf, 10, &requested);
> +	if (result)
> +		return result;
> +
> +	switch (requested) {
> +	case 0:
> +		mem = 0x000;
> +		break;
> +	case 1:
> +		mem = 0x102;
> +		break;
> +	case 2:
> +		mem = 0x103;
> +		break;
> +	case 3:
> +		mem = 0x104;
> +		break;
> +	case 4:
> +		mem = 0x105;
> +		break;
> +	case 5:
> +		mem = 0x107;
> +		break;
> +	case 6:
> +		mem = 0x108;
> +		break;
> +	case 7:
> +		mem = 0x109;
> +		break;
> +	case 8:
> +		/* This is out of order and looks wrong but is correct */
> +		mem = 0x106;
> +		break;
> +	default:
> +		return -EIO;
> +	}
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
> +	if (err) {
> +		pr_warn("Failed to set apu_mem: %d\n", err);
> +		return err;
> +	}
> +
> +	pr_info("APU memory changed to %uGB, reboot required\n", requested);
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	asus_set_reboot_and_signal_event();
> +
> +	return count;
> +}
> +
> +static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
> +					    char *buf)
> +{
> +	return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");
> +}
> +ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
> +
>   /* Simple attribute creation */
>   ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
>   		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
> @@ -511,6 +624,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>   	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
>   	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
>   	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
> +	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>   
>   	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>   	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 86629e621c61..e1aeafdf05d5 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -136,6 +136,7 @@
>   
>   #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
>   #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
> +#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
>   
>   /* gpu mux switch, 0 = dGPU, 1 = Optimus */
>   #define ASUS_WMI_DEVID_GPU_MUX		0x00090016


