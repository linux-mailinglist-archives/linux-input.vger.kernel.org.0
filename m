Return-Path: <linux-input+bounces-7496-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D649A0BE6
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 15:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9180B21C70
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EF820820A;
	Wed, 16 Oct 2024 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUWb6vX1"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDBE209F29;
	Wed, 16 Oct 2024 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729086645; cv=none; b=MUEnpBRHFBFtK57wa5txJEDZhjiTOFcP2XWgXioLK78CpoN9LeLZqukKXTckb7UV0wcNoK0w9CpJ265KXs+eiU6tUJv7CNU9aEyWqhmAmV+XgVQHLXwhKTLtBa8UobvWncEmeUlHBb6ndM35Jg2bFcmJtEAXdFWgc0ymQz2AY98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729086645; c=relaxed/simple;
	bh=cCyFp+t7Sd2137gzIoliicbY/KrEXDYP1DWhSlBdV7s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h89tyvqBeflmeHNK83Z3zXE4nRv+fiHO+0bp6R0td2dsImo3vUmbYDjeiYc9+ODLRzaF+f43yG3lFw3WFbrCEQCQzI13RTnHIusJpGDd2ukfWT/utheOojmPRtUzS1ZZi0XaSiEg50gOqswRtR1F9R/XomUlsdOJxhXmOi4F3TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUWb6vX1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729086644; x=1760622644;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cCyFp+t7Sd2137gzIoliicbY/KrEXDYP1DWhSlBdV7s=;
  b=FUWb6vX15ffsYOJUas4WryVTqAHXYDKa7f5+uBt4DqL7lDt9UBAVrLSD
   CSqrFozKyfxoCsvRbHu3Oy5YdA/HzB+yGNVCFakctnqD+1dw/y38WslbH
   TUJ+fOiqsn+OTu+CE2s/lKiQx5eT35GTaUDr6gvGQpcE6HSb6sWjOBb84
   RUu14VCzUc7+5NsJKqMSJCtcyGd8TzqIPCliKlGzcx8f7Ub0oIndMxl2K
   HZcJxffbp6vhkq/9hZRaofwspPzD+PW3csAJPDaJy5d+1zl8caknxcKxT
   1Kcyf1zHYajsPSiXOcI7BBmwEQdzra7Ns3pETaVNES0ZpQ7DSE52BBAi7
   Q==;
X-CSE-ConnectionGUID: Weih43BESR+Tp7a6mGTqPQ==
X-CSE-MsgGUID: WaC/yloqTHGyyoSVaQ85lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32335398"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32335398"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:50:43 -0700
X-CSE-ConnectionGUID: XtF+9bcWTiuxW3e/nAlDmQ==
X-CSE-MsgGUID: /rZ8/DDoQa+7goQess2q8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78283275"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:50:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Oct 2024 16:50:37 +0300 (EEST)
To: "Luke D. Jones" <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    jikos@kernel.org, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    superm1@kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v6 1/9] platform/x86: asus-wmi: export symbols used for
 read/write WMI
In-Reply-To: <20240930000046.51388-2-luke@ljones.dev>
Message-ID: <39044aeb-f00f-c9f2-4249-437906d56631@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev> <20240930000046.51388-2-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Luke D. Jones wrote:

> Export some rather helpful read/write WMI symbols using a namespace.
> These are DEVS and DSTS only, or require the arg0 input.
> 
> Also does a slight refactor of internals of these functions.

I'm a bit lost where this refers to. I see you're adding another function 
but nothing is being refactored AFAICT.

> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/asus-wmi.c            | 51 ++++++++++++++++++++--
>  include/linux/platform_data/x86/asus-wmi.h | 10 +++++
>  2 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6725a27df62f..0a5221d65130 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -385,7 +385,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
>  {
>  	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
>  }
> -EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, ASUS_WMI);
>  
>  static int asus_wmi_evaluate_method5(u32 method_id,
>  		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
> @@ -549,12 +549,57 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>  	return 0;
>  }
>  
> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> -				 u32 *retval)
> +/**
> + * asus_wmi_get_devstate_dsts() - Get the WMI function state.
> + * @dev_id: The WMI function to call.
> + * @retval: A pointer to where to store the value returned from WMI.
> + *
> + * The returned WMI function state can also be used to determine if the WMI

"also" ?? You're lacking some context here what else this is useful for,  
you only talk about "also" part.

> + * function is supported by checking if the asus_wmi_get_devstate_dsts()
> + * returns an error.
> + *
> + * On success the return value is 0, and the retval is a valid value returned
> + * by the successful WMI function call. An error value is returned only if the
> + * WMI function failed, or if it returns "unsupported" which is typically a 0
> + * (no return, and no 'supported' bit set), or a 0xFFFFFFFE (~1) which if not
> + * caught here can result in unexpected behaviour later.
> + */
> +int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
> +{
> +	int err;
> +
> +	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, retval);
> +	if (err)
> +		return err;
> +
> +	*retval &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
> +	if (*retval == ASUS_WMI_UNSUPPORTED_METHOD)

This seems buggy. First ASUS_WMI_DSTS_PRESENCE_BIT bit is unmasked from 
*retval and then you compare it to ASUS_WMI_UNSUPPORTED_METHOD which can 
never be true.

> +		return -ENODEV;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_get_devstate_dsts, ASUS_WMI);
> +
> +/**
> + * asus_wmi_set_devstate() - Set the WMI function state.
> + * @dev_id: The WMI function to call.
> + * @ctrl_param: The argument to be used for this WMI function.
> + * @retval: A pointer to where to store the value returned from WMI.
> + *
> + * The returned WMI function state if not checked here for error as
> + * asus_wmi_set_devstate() is not called unless first paired with a call to
> + * asus_wmi_get_devstate_dsts() to check that the WMI function is supported.

Please try to rephrase this mess. :-)

-- 
 i.

> + * On success the return value is 0, and the retval is a valid value returned
> + * by the successful WMI function call. An error value is returned only if the
> + * WMI function failed.
> + */
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
>  {
>  	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
>  					ctrl_param, retval);
>  }
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, ASUS_WMI);
>  
>  /* Helper for special devices with magic return codes */
>  static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 365e119bebaa..6ea4dedfb85e 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -158,8 +158,18 @@
>  #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>  
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
> +int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  #else
> +static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
> +{
> +	return -ENODEV;
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +	return -ENODEV;
> +}
>  static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>  					   u32 *retval)
>  {
> 

