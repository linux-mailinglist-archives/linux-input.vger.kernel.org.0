Return-Path: <linux-input+bounces-14373-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C9B3A5F5
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 18:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFD76188C680
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 16:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5354C32142D;
	Thu, 28 Aug 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pfa5R/Vl"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0203043AE;
	Thu, 28 Aug 2025 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756397939; cv=none; b=HNd9wc2p1F2lnZMut0Cy+95fVnInVRkclWpcA9Uo9atxrY+x9NNGtS1OB4ZwvHT4l7czWbfzShA2ZQSGme9u34gLQT8Szf11hVskluxALa/jIky60gVVu0sQCAqeJJnU9K6DFsrjQxq7eVUDyqsTZd91CSv10AXkAsQjf+zv4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756397939; c=relaxed/simple;
	bh=ifE9A5bNwclDjbgiVS6mrQPoH/qd5pskFhM3diTrrjA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gruYpoY8QI8M0iUg0+zUZvtP0r9E9JJa2gJw8KlGSm5nDmkKY5sbtzk4wBxqgwYjcckGsFPo4qfT2JjmBXtGR6pL3OBCT/ipFWoj61Pm0C3PmvB8kyjwl7dUd+6+3eNAjMIxbEQXeplNQQqksmZXNy+bAnedYBelNmiIbLoapKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pfa5R/Vl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756397937; x=1787933937;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ifE9A5bNwclDjbgiVS6mrQPoH/qd5pskFhM3diTrrjA=;
  b=Pfa5R/Vll4JUCZkGlsoyUpfilvJd+ij3VU685/F15iFDEzon9xcpoBDJ
   1ll26zkYwcKS4URnh7zxcW8gFLSAfwSm7NsqFIddC7UXqCbv+MtVDSNhr
   fZR4cpVGAnAolBTn3Nj1j+534Z90gEtdDyDJwrYgeQUwnBaT/UWOLBuuP
   RIyq1TqiCPrIQJfOtn5XLtyo1NcGiFumrZ6gRPAGAXjPx8PGIpKRTCF6o
   nZUr6szDNJNv/9+M+Q1wHWYKCI8pUfkUYncw/FTDBycsC+3IJojKY4kef
   5cY9ov/+3qtnN/2dErg3lzlck25Q8NYO8oVj9hYhc7pFRar3qEfSm6+4a
   g==;
X-CSE-ConnectionGUID: u5gSx2EDSAWEKks0a7XoFg==
X-CSE-MsgGUID: uQ8hr/NrSLmFHt+tZ6PFqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="58526874"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="58526874"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:18:57 -0700
X-CSE-ConnectionGUID: 33jqXWwmTvmYPKXfxw0dXQ==
X-CSE-MsgGUID: wEOQvljhRU6071pCjgYMBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="170051691"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:18:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 Aug 2025 19:18:51 +0300 (EEST)
To: Anton Khirnov <anton@khirnov.net>
cc: Hans de Goede <hansg@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, 
    Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: map more keys on ExpertBook
 B9
In-Reply-To: <20250827152954.4844-1-anton@khirnov.net>
Message-ID: <f4c39474-739f-855f-50ec-1aa0d24e8e4f@linux.intel.com>
References: <e39cf267-0784-4b56-a989-349e84487bbf@kernel.org> <20250827152954.4844-1-anton@khirnov.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 27 Aug 2025, Anton Khirnov wrote:

> * there is a dedicated "noise cancel" key in top row, between mic mute
>   and PrintScreen; it sends 0xCA when pressed by itself (mapped to F13),
>   0xCB with Fn (mapped to F14)
> * Fn+f sends 0x9D; it is not documented in the manual, but some web
>   search results mention "asus intelligent performance"; mapped to FN_F
> 
> Signed-off-by: Anton Khirnov <anton@khirnov.net>
> ---
> Hi Hans,
> would you mind applying this version of the patch, with the Fn+space
> mapping left out for now?

Hi Anton,

These days I'm the one handling pdx86 patches. I took this into the
review-ilpo-fixes branch and reinstated Hans' ack.

My experience is that long delays are nothing unusual when interacting 
with Dimitry so don't get discouraged by that when it comes to the
rest of v2 content. Once Dimitry has okay'ed the input side change, please 
resubmit the rest.

--
 i.

> Thanks
> ---
> 
>  drivers/platform/x86/asus-nb-wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index f84c3d03c1de..dba3c1488db2 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -618,6 +618,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_KEY, 0x93, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV + DVI */
>  	{ KE_KEY, 0x95, { KEY_MEDIA } },
>  	{ KE_KEY, 0x99, { KEY_PHONE } }, /* Conflicts with fan mode switch */
> +	{ KE_KEY, 0X9D, { KEY_FN_F } },
>  	{ KE_KEY, 0xA0, { KEY_SWITCHVIDEOMODE } }, /* SDSP HDMI only */
>  	{ KE_KEY, 0xA1, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + HDMI */
>  	{ KE_KEY, 0xA2, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + HDMI */
> @@ -632,6 +633,8 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>  	{ KE_IGNORE, 0xC0, }, /* External display connect/disconnect notification */
>  	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
>  	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
> +	{ KE_KEY, 0xCA, { KEY_F13 } }, /* Noise cancelling on Expertbook B9 */
> +	{ KE_KEY, 0xCB, { KEY_F14 } }, /* Fn+noise-cancel */
>  	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
>  	{ KE_IGNORE, 0xCF, },	/* AC mode */
>  	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
> 

