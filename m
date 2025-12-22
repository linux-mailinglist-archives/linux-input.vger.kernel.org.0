Return-Path: <linux-input+bounces-16667-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDBECD495D
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 03:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 989BF3003BDC
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 02:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C36D3246FF;
	Mon, 22 Dec 2025 02:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMNUbI9H"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87933246FD;
	Mon, 22 Dec 2025 02:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766372078; cv=none; b=YbMPT4fNvtDdYkkGGlYUTYAHu78eY4IXkvxnRbhkTxM1VxntxqswpVE9tcJOYswfs1uoMlXmwCmuqLEVXFOG0ikcXL0RbZsQDrrscsGx8WnUgKrntB4zEnSS6bHsvpYPwbp4HrRlTolx0JEvgomXaVyXSNbRUII/c3jxEWuQNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766372078; c=relaxed/simple;
	bh=WebokSk2Nplc6crErYgYi2zDRs0RXlID3qZbkjVwZNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jRGR2DbbT/zHTa2Ch1BjwAOsooJhZ3tTMovSTGNKD7lhuzJBfpvmulqpkDNDmIzcbTTIwfHCZmAjyyHf1cbHdECvmy/xDqCrmsxl8A01tU+4hZlAwuJ0yHQ9Dh/h4txjM3scS26v4rxqSiLidxsdY/ScVFmvzPJ0LurZdLobWFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMNUbI9H; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766372077; x=1797908077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WebokSk2Nplc6crErYgYi2zDRs0RXlID3qZbkjVwZNQ=;
  b=BMNUbI9HnqI8fi/DFC43DW4bw1QarS095zEpSMeLIrBKxjmrSKSWv2wr
   LUlIw4zoeamarOc7cpDI62feTxGPHAUqQQ0c27MHaZkEAylc26ZmVvkCi
   hWB5Rcni9ZcDERe0WLX8EOa8L55l6wFdlISHmmS77fdlsdv60ORjYJKz2
   ATb8+MDNRkeJKLzH3939sGUcZlZo66CGa5hBjQsl853frJ2yVjsotKTVU
   KPLDKzWx2PryQtQxq9hrp/nf94elTggd0Hluf5fgO54y9QxXeIxJc1x8W
   W2NaTn6G+xdLyFwl/hb2aEr807sovlFCsFM5m9nYp4fjWDSKl07C1zER+
   A==;
X-CSE-ConnectionGUID: 5n+gO5l5RoqKknQCbnaJEg==
X-CSE-MsgGUID: RvOX/KX8R7+8tS1KxbiWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78866306"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="78866306"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 18:54:36 -0800
X-CSE-ConnectionGUID: cmDcC8JoQleJykthEHsMtw==
X-CSE-MsgGUID: JAT61ZlOSBKvZZFY3DZPWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199928418"
Received: from shsensorbuild.sh.intel.com ([10.239.132.250])
  by fmviesa009.fm.intel.com with ESMTP; 21 Dec 2025 18:54:34 -0800
From: Even Xu <even.xu@intel.com>
To: tim@linux4.de
Cc: bentiss@kernel.org,
	even.xu@intel.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xinpeng.sun@intel.com
Subject: RE: [PATCH] hid: intel-thc-hid: Select SGL_ALLOC
Date: Mon, 22 Dec 2025 10:55:35 +0800
Message-Id: <20251222025535.1879559-1-even.xu@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20251128075426.628500-1-tim@linux4.de>
References: <20251128075426.628500-1-tim@linux4.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Xu, Even" <even.xu@intel.com>

> From: Tim Zimmermann <tim@linux4.de>
> Cc: tim@linux4.de, Even Xu <even.xu@intel.com>,
> 	Xinpeng Sun <xinpeng.sun@intel.com>,
> 	Jiri Kosina <jikos@kernel.org>,
> 	Benjamin Tissoires <bentiss@kernel.org>,
> 	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
> Subject: [PATCH] hid: intel-thc-hid: Select SGL_ALLOC
> Date: Fri, 28 Nov 2025 08:54:22 +0100	[thread overview]
> Message-ID: <20251128075426.628500-1-tim@linux4.de> (raw)
> 
> intel-thc-dma.c uses sgl_alloc() resulting in a build failure if CONFIG_SGL_ALLOC is not enabled
> 
> Signed-off-by: Tim Zimmermann <tim@linux4.de>
> ---
>  drivers/hid/intel-thc-hid/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconfig
> index 0351d1137607..9d74e53b8c62 100644
> --- a/drivers/hid/intel-thc-hid/Kconfig
> +++ b/drivers/hid/intel-thc-hid/Kconfig
> @@ -7,6 +7,7 @@ menu "Intel THC HID Support"
>  config INTEL_THC_HID
>  	tristate "Intel Touch Host Controller"
>  	depends on ACPI
> +	select SGL_ALLOC
>  	help
>  	  THC (Touch Host Controller) is the name of the IP block in PCH that
>  	  interfaces with Touch Devices (ex: touchscreen, touchpad etc.). It

Thanks for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

> -- 
> 2.51.0

