Return-Path: <linux-input+bounces-3519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35658BD6EB
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443D51F21300
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB8515B0FC;
	Mon,  6 May 2024 21:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YGsuEcfV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BAF446AC
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 21:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715031280; cv=none; b=AsbSAtgyp/tb2eKtopKJJ0jg7q+voavPIG+o2Aa6Jg/TADcLh7HZGIQsECbBdWmuswWVbhOwei234MlsQZgUUvJiMXjcriLiov7XJNf77uV4tvdJejhaPQa9ChZCMr8BBXk6k1U8p7ky3r6uU26vgcOS5uEjqeztr8laPkShy+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715031280; c=relaxed/simple;
	bh=suDR7ao8iyifFiyqir9cRGwP6pm7Iss9bRiXwBg9Gos=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PT1USn2QBRCa8PlGF16Ecu32sFPIVZJeSnvVufLh9EB4S+igVPE/GxWibn1XNOCHQ+chpr8iBXktKS61W9giAhxRCBoA3e5vq1ATO+W1GVYmp2naqX+DalCBQGeL0iCRJvbeyRHHTnLhTOTWmNve/NWDsv6ofBrdoTopHy1KLU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YGsuEcfV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C5EC116B1;
	Mon,  6 May 2024 21:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715031279;
	bh=suDR7ao8iyifFiyqir9cRGwP6pm7Iss9bRiXwBg9Gos=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YGsuEcfVueS/r0nOZWV68fULjIzPDrmyYAVCebtBlmPXG0+qmWoyrG1tOSDQeibCK
	 RM7RgK6iI3WTG4q+nrDMsVn8QRwoH2/VrqPFbYUjkiV41a9rvrdkCeqrJUT9aJqpiw
	 sMUiJDECSM+JzpE3o3uTvIMHHEw+0ZufJfC8pBWcVtQ6BORSMpIeKqoaVgrcpomeyp
	 3bK9hyd4F/7xYPIRCVzvWcWPb4znkCpf86w8RRkgeJ3eOOxzUeCCvh7CD78TYxdXfX
	 ManVGX+bfZGXFfsfrFBENG1Gw8zkQRKqgTFYXPfps75A+m0wipzBR7ZgHaElyPrb5z
	 es9hz24YPsb9Q==
Date: Mon, 6 May 2024 23:34:37 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com
Subject: Re: [PATCH 0/5] HID: intel-ish-hid: Implement loading firmware from
 host feature
In-Reply-To: <20240506013040.10700-1-lixu.zhang@intel.com>
Message-ID: <nycvar.YFH.7.76.2405062334210.16865@cbobk.fhfr.pm>
References: <20240506013040.10700-1-lixu.zhang@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 May 2024, Zhang Lixu wrote:

> This patch series is comprised of 5 patches. The first two patches are to add documentation
> for firmware loading. The third and fourth patches introduce support for the 'Load Main
> Firmware from Host' feature in the ISHTP driver, applicable to Lunar Lake and subsequent
> platforms. The last patch enhances the firmware reset handler in the ISH driver. This
> addresses an issue where the driver receives two MNG_RESET_NOTIFY messages upon implementing
> the 'Load Main Firmware from Host' feature.
> 
> This patch series is based on the following 3 commits, which have already been included in the linux-next/master branch.
> - HID: intel-ish-hid: ipc: Fix dev_err usage with uninitialized dev->devc
> - HID: intel-ish-hid: Use PCI_VDEVICE() and rename device ID macros
> - HID: intel-ish-hid: ipc: Add Lunar Lake-M PCI device ID
> 
> Qianru Huang (2):
>   Documentation: hid: intel-ish-hid: remove section numbering
>   Documentation: hid: intel-ish-hid: add section for firmware loading
> 
> Zhang Lixu (3):
>   HID: intel-ish-hid: Add driver_data for specifying the firmware
>     filename
>   HID: intel-ish-hid: Implement loading firmware from host feature
>   HID: intel-ish-hid: handler multiple MNG_RESET_NOTIFY messages

This is now queued in hid.git#for-6.10/intel-ish.

Thanks!

-- 
Jiri Kosina
SUSE Labs


