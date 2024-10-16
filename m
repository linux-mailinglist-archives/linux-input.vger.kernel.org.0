Return-Path: <linux-input+bounces-7497-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068699A0C0F
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 15:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF51B286578
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2024 13:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E878920C001;
	Wed, 16 Oct 2024 13:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9rV4i0v"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB2209F29;
	Wed, 16 Oct 2024 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729087099; cv=none; b=nlVC5BLJWVdU21iOaO7VSMHi9wB7kWCeU7MtsscfVWezS5cf3CA/QB4TvkUzZBwHrLBxWQ/+ia7adf6rMW8xbgxaWaW4x+YN8g+t09p+nRxzioU3cTQJJEjGAbXkSBCebmVX/9WaTeCh4bYLB3uKnPJZBL7uz5wvn2RUN9vD/30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729087099; c=relaxed/simple;
	bh=7XwaLaOi3QwKn5rdJ6u6Zlm3LP9PKGU+Zvv9lFFGZVE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hdtpHNPWD9GVpP5d+MAJyTsmE6xjwYaVX+3lN4BmrHsB7HDuxWAr/yuzgIxqZJLbD2Ego9oOlGrN4o6DnUx3tmBh+dM6YH/Qk1tE5KsXjpn2tbVlx9vlH+QKS/UfziFCTgal6D7o0GIJw9OAzxX6bKfPcmaGwusueWh1qOeiFCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9rV4i0v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729087099; x=1760623099;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7XwaLaOi3QwKn5rdJ6u6Zlm3LP9PKGU+Zvv9lFFGZVE=;
  b=R9rV4i0vS2dU6+wCasSIcbCEfj9OwYxkeiBcoA8gJxW/HbGN4hklcP+M
   ZyqsyRr/Pe/+CdXpP7Aypf85GqCBZ0mU8iY7hHFmeQwpvsE3Pe9My8U+l
   MYC37qjqeLbBryZKm0RiGYvdSR2mnijLTCoBj9GZdhT+XkYIZijhBNsWP
   Qdf1FymFU5kYqRIrpLo0Yv2Nkie4C9ieKvcYuRGZDayOBTO7Djpt2Qi0n
   v746XeFnH21n6rypLtsFKocJ9MXMiww+TTZsCnGKqzmgZfRhXU8ra+ZOg
   zyuaod924dxNHK+AR7UBYHk6nS5x8kH4Hev4/w/xSELJb6VRANDSbSqMl
   A==;
X-CSE-ConnectionGUID: f5bB+Tk5RFKmLaQy/FViDA==
X-CSE-MsgGUID: okZaWS8AS4mIVRT6UY/gyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28320506"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28320506"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:58:17 -0700
X-CSE-ConnectionGUID: 9btx4gfwRuKCbr9DW0Wexw==
X-CSE-MsgGUID: 6mUvBo3yTnWY8sblDfBy9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="108986402"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:58:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Oct 2024 16:58:10 +0300 (EEST)
To: "Luke D. Jones" <luke@ljones.dev>
cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    jikos@kernel.org, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    superm1@kernel.org, Jiri Kosina <jkosina@suse.com>
Subject: Re: [PATCH v6 2/9] hid-asus: Add MODULE_IMPORT_NS(ASUS_WMI)
In-Reply-To: <20240930000046.51388-3-luke@ljones.dev>
Message-ID: <ef6d1656-9e5c-d201-705e-66741f3485cd@linux.intel.com>
References: <20240930000046.51388-1-luke@ljones.dev> <20240930000046.51388-3-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Luke D. Jones wrote:

> A small change to asus_wmi_evaluate_method() was introduced during
> asus-armoury driver development to put the exports behind a namespace.
> 
> Import that namespace here.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> Acked-by: Jiri Kosina <jkosina@suse.com>
> ---
>  drivers/hid/hid-asus.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index a4b47319ad8e..9540e3e19cce 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -1301,4 +1301,5 @@ static struct hid_driver asus_driver = {
>  };
>  module_hid_driver(asus_driver);
>  
> +MODULE_IMPORT_NS(ASUS_WMI);
>  MODULE_LICENSE("GPL");

This order of patches will break the build since 1/9 put 
asus_wmi_evaluate_method() into that namespace so this module will fail 
build until this patch 2/9.

IMO, this change should just be part of 1/9 or perhaps better approach 
would be to make a new first patch into the series that does this and 
moves the export of asus_wmi_evaluate_method() into the namespace. The 
rest of the patch 1/9 would then become 2/9.

-- 
 i.


