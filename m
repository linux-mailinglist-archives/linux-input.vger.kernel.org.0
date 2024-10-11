Return-Path: <linux-input+bounces-7359-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B58BD99A292
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 13:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C61321C219DE
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 11:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9831E5720;
	Fri, 11 Oct 2024 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="be2MYkpz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CFF804
	for <linux-input@vger.kernel.org>; Fri, 11 Oct 2024 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645459; cv=none; b=GJHhQYlgdH9Y41nSVFvrU2IhNJAjwaAbf7RaComygv49pC4HD7K4InU067aIlbHdONbVD28IhQ2R6PXFdGpRXW2c0msopd9AprLAhsrH9uuXxwFoGE/Ot2BpwpCt2e6LiKH8JxGn4i/wsI98L4o3GQ8DrnMO0UTxTraC1wihPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645459; c=relaxed/simple;
	bh=+nxOnBNb196XUQBEJR9YHR7qiY31MoyqF35VBNY708I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B9p9ZngaQzURuomv0AQQnM/pjno6WFFhWeCjYmJL86JyTK9QPlhfAeDVSE/thmHkbcTb9cInFolq98pLrYfi5wJao4AsjZojBiZYE1i0au9sfAI/TkGoeEkANIxYTvj4/J++6LPjoxeO8FRxqAiJuLZblPOiUBYL8zpDKs0I2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=be2MYkpz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74612C4CEC3;
	Fri, 11 Oct 2024 11:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728645458;
	bh=+nxOnBNb196XUQBEJR9YHR7qiY31MoyqF35VBNY708I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=be2MYkpzGsPa8IDAIJ6pVOJxwRbVQOei0dlAVMSyw0Q9nPvgexQE88k0h/AXlfZbX
	 cN3/5WsgYsY4EcousQYlVffuA2+mlUMMOy0jnscD2obPHSCcloAaSEI0o9Fh7KcyvD
	 TryF3OJ+ihODPCWimxc/2j846gGHnVICRzaH/gsTfiPrDFQnRx2aRU73w/LukK4Pzj
	 w13Wep977pwFsjy1Xq0bFkJhhMZdQ/vuiVxUKBnS15tQAAql2VwvJ/Y/BeHxOzwXoL
	 IjsiNmZp95MTtxeUxVvyOwGe87qpDyMUeGYi5FOlJ/DxOy7L/gKZ2bh4u5e1xcz4pS
	 TkYkauajsC5og==
Date: Fri, 11 Oct 2024 13:17:36 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, zhifeng.wang@intel.com, even.xu@intel.com, 
    neo.wong@intel.com, hemin.han@intel.com, yoshi.wang@intel.com
Subject: Re: [PATCH] HID: intel-ish-hid: Add firmware version sysfs
 attributes
In-Reply-To: <20241009011023.497147-1-lixu.zhang@intel.com>
Message-ID: <nycvar.YFH.7.76.2410111317210.20286@cbobk.fhfr.pm>
References: <20241009011023.497147-1-lixu.zhang@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Oct 2024, Zhang Lixu wrote:

> Introduce sysfs attributes to the intel-ish-ipc driver to expose the base
> and project firmware versions for ISH devices that load firmware from the
> host.
> 
> The build tool embeds these versions into the ISH global manifest within
> the firmware binary during the firmware build process. The driver, upon
> loading the firmware, extracts this version information from the manifest
> and makes it accessible via sysfs. The base version corresponds to the
> firmware version provided in Intel's Firmware Development Kit (FDK), while
> the project version reflects the vendor-customized firmware derived from
> the FDK.
> 
> These attributes provide userspace tools and applications with the
> ability to easily query the firmware versions, which is essential for
> firmware validation and troubleshooting.
> 
> Example usages:
>   $ cat /sys/devices/pci0000\:00/0000\:00\:12.0/firmware/base_version
>   5.8.0.7716
> 
>   $ cat /sys/devices/pci0000\:00/0000\:00\:12.0/firmware/project_version
>   5.8.0.12472
> 
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


