Return-Path: <linux-input+bounces-15463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245C3BD884A
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7664C428543
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C842EB5B7;
	Tue, 14 Oct 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2oz2DXT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280A2EB5A1;
	Tue, 14 Oct 2025 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760435062; cv=none; b=YZPWc1YFQ/CorEDpv92rjvw6L7Rp1Y3DUesp4GXGWwHiDfglk7jA/yZ0BL0TQIWfZCDICjQMPlUi1paUiYxdkgHfmJGpOc34U/hCkK/tWt/48wmcNgRE2b2zv/7Du5ogd/4xULA94DX9IcxQ0U2rXrtQsPuZ9qKFJ0ouaFIKGLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760435062; c=relaxed/simple;
	bh=u0PZLj8fxWL+gCuLr/cip8ykYdMLS1CNw5rMEc6dkx0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H+VW8nZG1bTIUgIaBLsTLEmJi2EbtAXi6iRhXq6gzzyKhIqyeTM3gKFSthxIaiYwa3Z4yVUEBTw9Zsiyw5K/0qLb8pnyc1N8EiwAF+zdwcthLPR3M/s31Truxz+lTJwGrhNjlLedKHJhwucIWKMi6sm+8wl2YRTWogEu6FxcIzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2oz2DXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC53C4CEE7;
	Tue, 14 Oct 2025 09:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760435062;
	bh=u0PZLj8fxWL+gCuLr/cip8ykYdMLS1CNw5rMEc6dkx0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O2oz2DXT7HZdPRZjIPE7h+aj4onrTt2uYNrCzPSVdMjGiMZ6FDc6p1UbuqO6zAUNX
	 5zR3m4Wh4KPgbhoQ+Kl/+Kc/yhIyzAXAVIepNsfsB5jgDUCG+J6cj+HiH+Tbr3IU0D
	 cBrboZgtdn6Ilzqoi0Wmjg2MHMFi9D/s2Ig1oGuqjq0AE19WSioCcbyM9G+yj24vfO
	 tzTb3Ic4d8zzhfy/QfzjWc/65mJzZqCz0vTKW+1d1mfURzTJdJs/p9Hug6RadLO91W
	 va5hT0ft4QZmmFonc43avcxx1F67+qUV9NRCYDRRCvIrGR83WcDQi8jS2wlE5xLNgZ
	 Bqg4r7VlcThRg==
Date: Tue, 14 Oct 2025 11:44:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
cc: even.xu@intel.com, xinpeng.sun@intel.com, bentiss@kernel.org, 
    mpearson-lenovo@squebb.ca, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device
 Id's
In-Reply-To: <20250924043720.5545-1-abhishektamboli9@gmail.com>
Message-ID: <rrn3n057-qr45-po2s-s1ss-12qr4903p1s1@xreary.bet>
References: <20250924043720.5545-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 24 Sep 2025, Abhishek Tamboli wrote:

> Add the missing PCI ID for the quickspi device used on
> the Lenovo Yoga Pro 9i 16IAH10.
> 
> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=220567
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Change the max_packet_size_value to align
> with MAX_PACKET_SIZE_VALUE_MTL

Applied to hid.git#for-6.18/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


