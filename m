Return-Path: <linux-input+bounces-9740-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE2A26643
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 22:59:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E8CF3A26B8
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2025 21:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502D120F06B;
	Mon,  3 Feb 2025 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mS7D//xd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B19E1FECC5
	for <linux-input@vger.kernel.org>; Mon,  3 Feb 2025 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738619943; cv=none; b=Tz+LY92XzHHjU3+YhdlSa/3C2Zw6nkl7qeosvYR3F/04e7X7BdscV1TLw2y315yIxF1L0ihjo3/usI8h2qplaQ40DR8ax2F8Fp34xZ/gskTItlWuutpOFKWlJeYt5OrJy80qJ0sc7k2cnOJIQMJRMGVttUFVjeGGgJdgz9b+ZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738619943; c=relaxed/simple;
	bh=IvLm2s0WU6VzkAkC3eFtKMbIJchPQay/cV494TDOOWA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PsOp0r2PGAkjRGJA3BTMLvzQ3tFySipAn3Tyg/+Nk0vGaFlvSrs5ADpptRxDsQWV9VKrNnXQ3ez//eGhhf3frCapy39KQn9J4jNSGKP4RT1MYqPquPleiyKRGGeHF55Dccmxb22KC5EGP+iz+2y8pR7Wu38dXKG2CZX8OtKLSUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mS7D//xd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FA75C4CED2;
	Mon,  3 Feb 2025 21:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738619942;
	bh=IvLm2s0WU6VzkAkC3eFtKMbIJchPQay/cV494TDOOWA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mS7D//xdjHHub7se95y2Phob4xr0NamF2IKmdhTFGrln7CQeGcu/XFT9dGE/rdeqD
	 4aw81XYxN4ZGaumWUW6FnUCh90wV+MiysB03eCBpTF4raJFm91NfhhFZv0zJP7+TMH
	 orlgqcPPhNdCI8JGgMudcpVE4ToS8l4d9t0j1ZuSZEvq83W54qFpz0JdodcYm5B2Xr
	 MQiS83ohsS0+BB7c6o3nj2yor0ikvFs5ZKbgF6P4jKQfVRf13tQQNQG36CtflAlnO9
	 ObbeH+xzcmtIWRH5D/2Qksb6Ey5LztTNoDm4aBajJjqWFNH1+Lrhtf/G4FzbLGj0ei
	 ESn4Fxx8TnhXA==
Date: Mon, 3 Feb 2025 22:58:59 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, hemin.han@intel.com, selina.wang@intel.com
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add Panther Lake PCI device
 IDs
In-Reply-To: <20250123013044.806257-1-lixu.zhang@intel.com>
Message-ID: <sr07s90s-n088-424n-qr7p-3q005453o2r8@xreary.bet>
References: <20250123013044.806257-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Jan 2025, Zhang Lixu wrote:

> Add device IDs of Panther Lake-H and Panther Lake-P into ishtp support
> list.
> 
> Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


