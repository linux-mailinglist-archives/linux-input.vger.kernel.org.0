Return-Path: <linux-input+bounces-6763-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97B987656
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 17:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9496D1F290F0
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 15:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B8C12AAE2;
	Thu, 26 Sep 2024 15:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghv63Q3a"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18B24F21D;
	Thu, 26 Sep 2024 15:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727363881; cv=none; b=rSv1gmKv4bSg+OtR0IUWVBWBkt5LC+PFaw/1+cDOXp0H3T92okG9d8pf5DAScGN2Navg7DCxKNJydy3JINboYaIieTSVA85kvRchw2G1MoriA61hiGRTa/76gcCqtGWJG6imQ00z4SDIOh8nmgVf0hifBSCOAUnrC1Iq4MQcw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727363881; c=relaxed/simple;
	bh=35anoPTx9RLAi1Mfm1XxL/WF5AXSs+T4/mD5yvvmXBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pBT757EhHNz9C3tffdIvMqxYxUNN9B7Q5q3NeENyFDbcOORB36JNZaInpi2yNgNjc0QiJw9KeDyqQb9KMSaid+nGO/nWZgk6ZJywBwdP4mxQkXU2lHz79aRx4so6BelG4rxOzPDw/EFSmWhnyYgFDuN2RxNUra+ptC8nw1ztGOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghv63Q3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3D1BC4CEC5;
	Thu, 26 Sep 2024 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727363880;
	bh=35anoPTx9RLAi1Mfm1XxL/WF5AXSs+T4/mD5yvvmXBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ghv63Q3a6acCVgUWmgSDrmaEgWcc45PuPOHbIhIZvMSb0GM+zZxH+levuBD4SRFwR
	 gfjVrj6p34ffQ2/Jef7PlN6zfu2TsLprgibXbl1RWjFQ+lj9yUernBuGUeAKlAqtBI
	 qZRwb4RK+ibFCOm3OYjPuFWQWyCJvnOD8FIQZorC/WZO3DdMhyPf+eoln8kx/ObjtH
	 4pB79OdAdOF5bSSjo+q3avxaW1WSwJwx/TE1xR7Awti4yM3oxlOtf4s3hZNa4aRHB1
	 mCyxY+tEQCz7UHRgrUu8i+u0fBtXz77M+wOcgv2fY1Oi6JDS/wR6RoCJ2/MyfqSNVz
	 ihuqiHIwduinw==
Message-ID: <efca6c13-e1d4-4148-8c41-4983b8fca032@kernel.org>
Date: Thu, 26 Sep 2024 10:17:58 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] platform/x86: asus-armoury: add panel_hd_mode
 attribute
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-5-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240926092952.1284435-5-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/2024 04:29, Luke D. Jones wrote:
> Add panel_hd_mode to toggle the panel mode between single and high
> definition modes.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

This patch looks good to me.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

---

But that being said; mostly to satisfy my curiosity could you share more 
about what this actually does?

Does it change the EDID exposed in the BIOS in ACPI _DDC?  At least for 
AMD platforms that would mean it only works with this patch (which is on 
it's way):

https://lore.kernel.org/amd-gfx/20240918213845.158293-11-mario.limonciello@amd.com/

> ---
>   drivers/platform/x86/asus-armoury.c        | 6 +++++-
>   include/linux/platform_data/x86/asus-wmi.h | 1 +
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 39e422b16b8e..15eab4d45b81 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -106,7 +106,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>   
>   static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>   {
> -	return !strcmp(attr->attr.name, "gpu_mux_mode");
> +	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> +	       !strcmp(attr->attr.name, "panel_hd_mode");
>   }
>   
>   /**
> @@ -429,6 +430,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
>   		   "Set MCU powersaving mode");
>   ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
>   		   "Set the panel refresh overdrive");
> +ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
> +		   "Set the panel HD mode to UHD<0> or FHD<1>");
>   ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
>   		   "Show the eGPU connection status");
>   
> @@ -442,6 +445,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>   	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>   	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
>   	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
> +	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
>   };
>   
>   static int asus_fw_attr_add(void)
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 6ea4dedfb85e..7caf2c7ed8c9 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -73,6 +73,7 @@
>   #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
>   
>   /* Misc */
> +#define ASUS_WMI_DEVID_PANEL_HD		0x0005001C
>   #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
>   #define ASUS_WMI_DEVID_CAMERA		0x00060013
>   #define ASUS_WMI_DEVID_LID_FLIP		0x00060062


