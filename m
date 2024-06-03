Return-Path: <linux-input+bounces-4045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F33D8D81A9
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 13:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59A20281483
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 11:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1C98625D;
	Mon,  3 Jun 2024 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lw0TtGBh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A968595B;
	Mon,  3 Jun 2024 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415652; cv=none; b=Kl7Qyn5AX8YfeH8xBhhouVr0RZ/dCBhcVALKv3sovcUt94TFSOkkQtO4oTV7LHM4qCPAilkv4aJpxWHmYzA/l9ulUYGOC41t1UKKU7XL0ujNsnkXQ3FjUDwNS6uS1//HFabqSBw7p4WCCHmFpOlwFiDjIrhKPfrb8lv4DHf/TxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415652; c=relaxed/simple;
	bh=GPMUJJ53l+0ecXS1pAoUJQYrHF+UZHS+9Mt++PXszzU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s04M1AUnkBiAJyDhMwQ8TAYVxc2f1bRm7Ss//LTss3YA365RoeqQiLtmLtu5FUIC+g32rC9yVkjcml2GnDO4WkxPPzg3ASBg8Zn9s8QkNLJbr1c0Ic2rsvrswwSutrUVVdI4aRkfHNS9+JdWcp0Rmbd6ysT0/2xT7xx834RDiE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lw0TtGBh; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717415651; x=1748951651;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GPMUJJ53l+0ecXS1pAoUJQYrHF+UZHS+9Mt++PXszzU=;
  b=lw0TtGBh+DQXKWh1iIb8hLe1oY/jwgiSCBSdtzV7OnmkHauzTkfDHQvW
   WuVNnZkLb2LudwyRzIooHNcODTnpZS7YHnZQwkmDhmIZcrRVY4iocy8a/
   LaEHpqAU0loYeOiJkSXrF5VbkHte99yfms+aThhDCnf0AnQGDRLdfm8n3
   4JdfDa1Gd5Z1kxUuJFF6iv+iKM1fO9KXYj9KvHag3yEHutIWiQLziiI5d
   NpfRXt6SjpcATUJrCPZyKJ0nu1TX888C0lMliYlwJ/JhwCO6capW4CBeD
   1LxupYrzeUlD+cyNE4rwA1DQ4MhiT9gzM5AfqRF7t0Pp938kes2MC5rmm
   Q==;
X-CSE-ConnectionGUID: Rr2AK2xvQiCcl4NkXv3hxQ==
X-CSE-MsgGUID: fzzvlTjCRMySF9qe+lMITg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13650913"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="13650913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 04:54:10 -0700
X-CSE-ConnectionGUID: eHH8JyTaRQ2o1D3/0McGlQ==
X-CSE-MsgGUID: UO/ceDCRQKu7ajfICb02Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36753925"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.161])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 04:54:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Jun 2024 14:54:01 +0300 (EEST)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
    Li Zetao <lizetao1@huawei.com>, 
    Simon Trimmer <simont@opensource.cirrus.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net, linux-input@vger.kernel.org, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Mark Pearson <markpearson@lenovo.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v1 0/7] platform/x86: Move to 2-argument strscpy()
In-Reply-To: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
Message-ID: <35a722b6-995b-25d9-189c-5283a52a379f@linux.intel.com>
References: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 2 Jun 2024, Andy Shevchenko wrote:

> Move to 2-argument strscpy() to make code shorter and have an additional check.
> No functional change intended.
> 
> Some cases are let untouched where it looks better with the 3rd argument.
> 
> Andy Shevchenko (7):
>   platform/x86: asus-tf103c-dock: Use 2-argument strscpy()
>   platform/x86: hp: hp-bioscfg: Use 2-argument strscpy()
>   platform/x86: intel: chtwc_int33fe: Use 2-argument strscpy()
>   platform/x86: serial-multi-instantiate: Use 2-argument strscpy()
>   platform/x86: think-lmi: Use 2-argument strscpy()
>   platform/x86: thinkpad_acpi: Use 2-argument strscpy()
>   platform/x86: touchscreen_dmi: Use 2-argument strscpy()

Patches 1-6 applied to review-ilpo branch.

-- 
 i.


