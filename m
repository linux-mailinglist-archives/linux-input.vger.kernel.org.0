Return-Path: <linux-input+bounces-12791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C58AD435B
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 074F93A51CD
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F166826563C;
	Tue, 10 Jun 2025 19:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjKWZaYK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3BF264FBB
	for <linux-input@vger.kernel.org>; Tue, 10 Jun 2025 19:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749585307; cv=none; b=iwHn3H4DtoaDzF6hFxjI9RvFpxQRv4tJVXVifdzUNgWOGg+Mzjz7n8VWnjlEop5898M233mCQQ5Jh0eJeiXhuYlSQKcEJJRXHBV5gLoJND+UMjIE0FtQD1tphL2x4C1BE7Hc2FMXr0xJoMpbSr6nZrge45L2AMJShrCvGI87gh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749585307; c=relaxed/simple;
	bh=T6ddU/mpgRVUKOMzLroKvuNqDs45h0mOMxhk1msOkEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s6PhlVdy0tsl5c4gF1wBpaq1po0oDUoaccx+VR5Uhz2CCSVFYXN+dnV1eh218FSejDuIFNoeuYtmRUeN/FAeOQ8xWswbG6lu81aLqkLNI3KZFsNwth9qCXYbwd9zs35nKrPRm/N28qI+uQiCvwkrw7xWouj12gH035MxjZ4lKFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjKWZaYK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4B8C4CEED;
	Tue, 10 Jun 2025 19:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749585306;
	bh=T6ddU/mpgRVUKOMzLroKvuNqDs45h0mOMxhk1msOkEs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SjKWZaYKTxeWQVL6y6enm0x9MhCDcRfIl7fxy+xfTpSM0Pd0HLBo4zWN/RNzmmMjd
	 5+YM01TkxquDoeRt3WM0ctWp4nU1xFlx81agV2eUSyz+AG0BQgF1t20PAYIhm54obQ
	 sWgkbte78pOO/vvzpsDY69CUcs5YHxNb+4wi8xedsjBef+us3Yd+R4keNczY98hzXw
	 EyFRzmFhHRFMCLf8AhQlmFAF193kHtKJTJqYdJT4BwXu4C24wnquaxxkzw2iS6/mFz
	 P0UQvVzUUwZsPCzb0SGIBKLLW1sVVRpfDX72blxcWmCgRAi9OO5Xpv7OfToejNKUZL
	 u9IFzLXh8cw2A==
Date: Tue, 10 Jun 2025 21:55:03 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, even.xu@intel.com, zhifeng.wang@intel.com, 
    selina.wang@intel.com
Subject: Re: [PATCH 0/2] Enhance ISH Device Table and Add Wildcat Lake
 Support
In-Reply-To: <20250610020132.1544110-1-lixu.zhang@intel.com>
Message-ID: <0o860ro4-rs5s-o872-9q5q-3s9q791qnq08@xreary.bet>
References: <20250610020132.1544110-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Jun 2025, Zhang Lixu wrote:

> This patch series aims to improve the Intel ISH (Integrated Sensor Hub) driver
> by enhancing code readability and expanding device support. The first patch
> replaces the usage of PCI_VDEVICE() with the PCI_DEVICE_DATA() macro in the
> ISH PCI device table, which simplifies the code and improves maintainability.
> The second patch adds support for the Wildcat Lake platform by including its
> PCI device ID in the ISH driver.
> 
> Zhang Lixu (2):
>   hid: intel-ish-hid: Use PCI_DEVICE_DATA() macro for ISH device table
>   HID: intel-ish-hid: ipc: Add Wildcat Lake PCI device ID
> 
>  drivers/hid/intel-ish-hid/ipc/hw-ish.h  |  1 +
>  drivers/hid/intel-ish-hid/ipc/pci-ish.c | 12 +++++++++---
>  2 files changed, 10 insertions(+), 3 deletions(-)

As this is pretty much a device ID(s) addition, I've now queued this in 
hid.git#for-6.16/upstream-fixes.

Thanks,

-- 
Jiri Kosina
SUSE Labs


