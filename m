Return-Path: <linux-input+bounces-6766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC350987677
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 17:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B55282DE5
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FE1156228;
	Thu, 26 Sep 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoRKmUM7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE0614D2B9;
	Thu, 26 Sep 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727364369; cv=none; b=gmlocjnQxpYXVQLDQL4twWQgmmps8gUh48ZMthjoam+AS1CqibAJvnMFPV8V+YAhp/zTDKUkXeuJn0MJEv5RV5Pala4B5rRv+QV0f+kFTXdJi9SHkUXZA36Y4G4L0ED4seJeouPH7Z4vYMxGjLsIHiztl6MCxUJCLWvP6bSPDYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727364369; c=relaxed/simple;
	bh=BMiIOSUxopLG6e1njGV3dMlAmMpn9fX3oJAibeYazyA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WJ5VLLEGmmRIAsoiGzYjhnORo155hyrjE3WnTuPDpUfkOQBVXzKK2I26f/q/h3QxcV5stAG6/Gk5hYFKFQTM6B0ti7kbN3Dnc7KwfU+YcCvQLCQfy41n1Hssq0X4MwQ+m0zVZDTj4B21FmVyUyKt2RqmXng74KjwFUze3RxMSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoRKmUM7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EE4C4CEC5;
	Thu, 26 Sep 2024 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727364369;
	bh=BMiIOSUxopLG6e1njGV3dMlAmMpn9fX3oJAibeYazyA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BoRKmUM7N3oavMhPcQ56/PfeynRDMgnRWX82voLLjZYRUKISqhkYsXV4qvQIu+UAE
	 POVzsTJzNO07nDuzfL3lhGFyxauf2hHB9mLEjwl3ql9vDQCIlAGG7aQrYuIA837Dzg
	 So0nqonG6/x2dYdyhCDjyYILM90WzUy8pgcd/wj+Zyp3FVJyDaLdy3NpbwR6vXmN5g
	 oDuY0or+XIRmtAO+nluDHdVCSM6zidrezxuqRueCe8PzFzHgmwXD/gqaOGrMo3diQ2
	 4KgI3CcXx2kSU24n7ArevakcaPdAJ2Jk7h8wGpGTqLs+p/N/8TPUXeK3y5DtBcx8iQ
	 z7N6oCqkpZ+OQ==
Message-ID: <f325a481-ee4b-48c0-9ac6-91bd81e18536@kernel.org>
Date: Thu, 26 Sep 2024 10:26:08 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/9] platform/x86: asus-wmi: export symbols used for
 read/write WMI
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240926092952.1284435-1-luke@ljones.dev>
 <20240926092952.1284435-2-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240926092952.1284435-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/26/2024 04:29, Luke D. Jones wrote:
> Export some rather helpful read/write WMI symbols using a namespace.
> These are DEVS and DSTS only, or require the arg0 input.
> 
> Also does a slight refactor of internals of these functions.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/asus-wmi.c            | 51 ++++++++++++++++++++--
>   include/linux/platform_data/x86/asus-wmi.h | 10 +++++
>   2 files changed, 58 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6725a27df62f..0a5221d65130 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -385,7 +385,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
>   {
>   	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
>   }
> -EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, ASUS_WMI);
>   
>   static int asus_wmi_evaluate_method5(u32 method_id,
>   		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
> @@ -549,12 +549,57 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
>   	return 0;
>   }
>   
> -static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
> -				 u32 *retval)
> +/**
> + * asus_wmi_get_devstate_dsts() - Get the WMI function state.
> + * @dev_id: The WMI function to call.
> + * @retval: A pointer to where to store the value returned from WMI.
> + *
> + * The returned WMI function state can also be used to determine if the WMI
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
> + *
> + * On success the return value is 0, and the retval is a valid value returned
> + * by the successful WMI function call. An error value is returned only if the
> + * WMI function failed.
> + */
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
>   {
>   	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
>   					ctrl_param, retval);
>   }
> +EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, ASUS_WMI);
>   
>   /* Helper for special devices with magic return codes */
>   static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 365e119bebaa..6ea4dedfb85e 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -158,8 +158,18 @@
>   #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
>   
>   #if IS_REACHABLE(CONFIG_ASUS_WMI)
> +int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
> +int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>   int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>   #else
> +static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
> +{
> +	return -ENODEV;
> +}
> +static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
> +{
> +	return -ENODEV;
> +}
>   static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
>   					   u32 *retval)
>   {


