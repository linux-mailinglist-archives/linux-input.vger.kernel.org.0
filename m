Return-Path: <linux-input+bounces-8345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18C9E0A66
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 18:48:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF21FB45F7D
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 17:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCD11DD889;
	Mon,  2 Dec 2024 17:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIwsIBgU"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931851DC1BD;
	Mon,  2 Dec 2024 17:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160390; cv=none; b=Kq46QZTuQ94RR/m0eRqvZYaOXbQPq9yK2PJrLzomyJGLa5YgaJJsu25wBTwIjEzHg+7Z+iNuOS9nbExoURxY9KCmEEY7Ju3oNYRlwsLvRgzQSTRm6qJ4Wty0eaaQyVw2bhjkeSovOyT2C+E+UGCgYJYV9wyYNn8iNM9DWnAb2iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160390; c=relaxed/simple;
	bh=Y+WumHtOMY05KufTKmNmz4ua2A4KkuwUlgtAE39QaVk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WXnt0slJKY91qSe2XHO2ziVWGgn9twzX4JVEmZz+48oGRrd59TPsV2shDzY+6zh5JjsZatU5IaQXrLik7dNUSq/h+Qng1Hyxdmnf4TO0Ifb7478kOpW5dsRQ/o4liYYTdn+RT8ebIP1wBL+tbR0T/ngAolwgO6fxp06gqcxKx3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hIwsIBgU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733160389; x=1764696389;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Y+WumHtOMY05KufTKmNmz4ua2A4KkuwUlgtAE39QaVk=;
  b=hIwsIBgUMCBRPAgV4R/KLC3GIEXUOHcRTIpq4uZYJhMd8N4EJK5B9Bjz
   wRzJfyP9oETGMWj49TmP4qzKCFE/7dscmLR4tbukaGYVOuqPL9lZfMVoX
   Nwa2SEqo/9DOff2L5MOrF5L251+dBbCBjZEHf1vEjnLNxtYARLL9R1cgO
   l5Pp2ZN70vvh7iy0pdXrp/VOFQ6n2ISPewaAh3t05MgqzYZSyMsV5Zd7V
   xZmyARmyOQdqf/gREFM3M8wJQgBbxFcX8UhQYzDtNEHV7Sk2Se5bFTzDp
   60inF8R76x9fTGOgmzoRqQCJ0zMbMBTskHZnEeM7+v0A8gWi/tzaC3cDG
   w==;
X-CSE-ConnectionGUID: 9d2FNtJPS3+CRttBmHQYrA==
X-CSE-MsgGUID: KKLQEEotQwm6ZTemlMoVpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="32701924"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="32701924"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:26:28 -0800
X-CSE-ConnectionGUID: sMn1ouFSQQyqa1k8TCg/4w==
X-CSE-MsgGUID: XExYUV0eRYSm3fnuFFh0ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="124105533"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:26:25 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 2 Dec 2024 19:26:21 +0200 (EET)
To: Illia Ostapyshyn <illia@yshyn.com>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
    Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/2] Input: allocate keycode for phone linking
In-Reply-To: <20241114173930.44983-2-illia@yshyn.com>
Message-ID: <8127d500-6eb4-d196-849a-48c3847ebc53@linux.intel.com>
References: <20241114173930.44983-1-illia@yshyn.com> <20241114173930.44983-2-illia@yshyn.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Nov 2024, Illia Ostapyshyn wrote:

> The F11 key on the new Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s
> Gen 5 laptops includes a symbol showing a smartphone and a laptop
> chained together.  According to the user manual, it starts the Microsoft
> Phone Link software used to connect to Android/iOS devices and relay
> messages/calls or sync data.
> 
> As there are no suitable keycodes for this action, introduce a new one.
> 
> Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
> ---
>  include/uapi/linux/input-event-codes.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index a4206723f503..5a199f3d4a26 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -519,6 +519,7 @@
>  #define KEY_NOTIFICATION_CENTER	0x1bc	/* Show/hide the notification center */
>  #define KEY_PICKUP_PHONE	0x1bd	/* Answer incoming call */
>  #define KEY_HANGUP_PHONE	0x1be	/* Decline incoming call */
> +#define KEY_LINK_PHONE		0x1bf   /* AL Phone Syncing */

Any thoughts about this Dmitry?

-- 
 i.


