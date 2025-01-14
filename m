Return-Path: <linux-input+bounces-9230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BE2A10B72
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 16:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CC8318857AE
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 15:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3A0142E9F;
	Tue, 14 Jan 2025 15:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uv28DB7r"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5F223242C;
	Tue, 14 Jan 2025 15:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736869749; cv=none; b=YARdep8AFhHjBdmxrGBcJ16xKWJBujAaTiDtayx2vAY41e01vw5jBP3IWmOhgVQIrVuHZP/uFwWOdmtsJ0F8QkrZLdHMEeX/nAUtT7iBjp9cUYsz1ttP+Bq6gXIIsUarlF4E+iSvC0/xtEvOVrSsl/9lnK8JfPD78WUWyqWfzjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736869749; c=relaxed/simple;
	bh=UbZMKdRirfZiedBMg+fqj6lT3E9UXe2nxD7/8LHGzDo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N/GDU0Wa1+cSMR5Ed6ffw4EIUk+xgQjJOo+5q6LuZE/2e3xo4+Eb86vJmVkuUeh41I7wSP92tnx+kpz69mbHwYwaOXiGTMS9pq2/iA1OzEAW8SUeqVFLFmc3dP68jquhyRBX4rMwRjSCbfsX/s7jnK9lP79yupRmRxIe3J90eCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uv28DB7r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736869748; x=1768405748;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=UbZMKdRirfZiedBMg+fqj6lT3E9UXe2nxD7/8LHGzDo=;
  b=Uv28DB7rNA6EsuacBkn+8EanLk2sUCsMxC/koMBSb6a3Vipht+H1sT16
   HCfFqe+BUbU6jponyEQcxjkDErrGzEXufprGkOFMQD0JOrNkEcRN/D7jh
   ISX+DOmLsenEmhPHYlPT/uisMXfU1JRx8/6i3MvAzqfmCCS5bTZ1ciF+H
   WhACmoASAU0LrozOwhX8obJDvHEFf8tNqbgkanj7szQmRD8ZKIdG7sBVI
   kc3fBnztRYNx5eAE+yYARxsZo2XjyKCmKn1yxONzND5TD4xUz+FDPLuyK
   1vZlse+QD1FEr1xC5wGTzx4zQbjwf3aZlSeeF9pPMi7JJQ6YzMg4eJHyw
   Q==;
X-CSE-ConnectionGUID: 4LtKgji7T8yLtwcSaLg6+g==
X-CSE-MsgGUID: c666LAO/T32/kOj7ApB63g==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="59655603"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="59655603"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 07:49:08 -0800
X-CSE-ConnectionGUID: CG0wMHJBTe6ueOTxe8MykQ==
X-CSE-MsgGUID: G4CaROsKRpyIEqPEnQqgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="105354853"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.54])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 07:49:04 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: dmitry.torokhov@gmail.com, o2g.org.ru@gmail.com, 
 Armin Wolf <W_Armin@gmx.de>
Cc: hdegoede@redhat.com, corentin.chary@gmail.com, luke@ljones.dev, 
 mjg59@srcf.ucam.org, pali@kernel.org, eric.piel@tremplin-utc.net, 
 jlee@suse.com, kenneth.t.chan@gmail.com, coproscefalo@gmail.com, 
 linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, josh@joshuagrisham.com
In-Reply-To: <20250113221314.435812-1-W_Armin@gmx.de>
References: <20250113221314.435812-1-W_Armin@gmx.de>
Subject: Re: [PATCH v3] Input: i8042 - Add support for platform filter
 contexts
Message-Id: <173686973958.7065.12791132870545458476.b4-ty@linux.intel.com>
Date: Tue, 14 Jan 2025 17:48:59 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 13 Jan 2025 23:13:14 +0100, Armin Wolf wrote:

> Currently the platform filter cannot access any driver-specific state
> which forces drivers installing a i8042 filter to have at least some
> kind of global pointer for their filter.
> 
> Allow callers of i8042_install_filter() to submit a context pointer
> which is then passed to the i8042 filter. This frees drivers from the
> responsibility of having to manage this global pointer themself.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] Input: i8042 - Add support for platform filter contexts
      commit: 08cd46acfc4fc6d810433f35dbc1dab6e1a6891b

--
 i.


