Return-Path: <linux-input+bounces-9231-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60058A10B8C
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 16:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 112FE7A2347
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 15:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C570615746B;
	Tue, 14 Jan 2025 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WIRkiVRY"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A37123242C;
	Tue, 14 Jan 2025 15:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870029; cv=none; b=Yl3eDyhVO49RzJo3WJpwZ0kRQgk7Cap0GAttWaWb0Jb1rsS0piDsGnRkSYoVZ12IPKXLAB0Arm5EKUmmi3flSGss2zHc00y+FbSZgHY4ujnu9TBr5pPhQyiMwNxFIhEY2s33YWsnmdIozVwGrvXrGIzlEaowJ6V40HE3Wccidvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870029; c=relaxed/simple;
	bh=TiF1SVw3pB17GN/PzUw+DKewY+X6PT9IgRmCjsG5jms=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Y3r516FSuKSVU8ppcmYIxqQIgwX8EruGv+JAHAOpuZhUNs80ZHneZ/3ZHsJoJx4qgV4O8+aefrsDq0jZo22V4G7mdMfbJtIcr0JkcSAXKWB0TRSMNEayHzLcN8fslZ0tYFqfJ1bxEbwo/ErnvPMBvSWejD63mt7yhR3shnV/7h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WIRkiVRY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736870029; x=1768406029;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=TiF1SVw3pB17GN/PzUw+DKewY+X6PT9IgRmCjsG5jms=;
  b=WIRkiVRY8b66wxDJ1KQpicpJBOhYN0VMvHJA7EWJQ3nZW7FjXD/zYFHt
   4vEViS0Nx4Gl7BCVAouhlOdieJ42Sx7YkED10cCTUrXDNf73V5oBpaLhg
   VZZ4utCjcLp7NplmE4paZoId9CZN256nnP3VZYJe8NwgLZMwEnvukN3s1
   lM5lxdekbTpg3tpBwM7FLaY0B7XAdKQ8hKfeSToGrvIKQVIaVobzYpNaB
   lO4G5f5dCHLZqz20p2rnwQEPFJNv8MUu37/l72mgedcWxD0g6YKFoa0I0
   ZDosFyu84SnRhJg0+VQV/DtA+v4nTXskT4OG8tqJ2dIwZE/gZ157kDRoY
   A==;
X-CSE-ConnectionGUID: JHp42I0QQDCkI3NxxQI+Uw==
X-CSE-MsgGUID: +0KZmWIjRyuhj78gNpJ6Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37284840"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37284840"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 07:53:48 -0800
X-CSE-ConnectionGUID: aAia3+BbQ2yiBvPBjrJ/lA==
X-CSE-MsgGUID: jJWR01oUSBe0Q+UT/eksQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="104919118"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 07:53:45 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
 Illia Ostapyshyn <illia@yshyn.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
In-Reply-To: <20241114173930.44983-1-illia@yshyn.com>
References: <20241114173930.44983-1-illia@yshyn.com>
Subject: Re: [PATCH 0/2] Add support for the new phone link hotkey on
 ThinkPads
Message-Id: <173687002044.7262.7561484982670124076.b4-ty@linux.intel.com>
Date: Tue, 14 Jan 2025 17:53:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Thu, 14 Nov 2024 18:39:28 +0100, Illia Ostapyshyn wrote:

> The Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s Gen 5 laptops feature a new
> hotkey on F11 showing a smartphone and a laptop chained together.  According to
> the user manual [1], it launches the Microsoft Phone Link software used to
> connect to Android/iOS devices and relay messages/calls or sync data.
> 
> This new keycode can be interpreted by desktop environments to lauch free Phone
> Link alternatives like KDE Connect or GSConnect.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/2] Input: allocate keycode for phone linking
      commit: c3c1bf65b9f28a30b2b6f42fcbb644b53db4f87c
[2/2] platform/x86: thinkpad_acpi: Add support for new phone link hotkey
      commit: 2677cc0a7519b6a816611a8a2a3e05bd028119ed

--
 i.


