Return-Path: <linux-input+bounces-16856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F401D001E9
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 22:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 383B430185C8
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 21:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DC2346A10;
	Wed,  7 Jan 2026 21:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9wq9baU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9873D346A07;
	Wed,  7 Jan 2026 21:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767819997; cv=none; b=Lfup33+HoDast17nWKM4iwZAl+0Wc0wyLYcdlC9Sybuou3WZy21ASiINOr/cI/aY11yoSOS+KDQ5Gn5D/LBGgm/A8KMGpHKPgEsdsxgEFoZPmt0f9GlQMAQU/tne2+mpD3j29bQuhbbVsts+yipZjNoNCpf+C+/rJ7TUDNt8Vfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767819997; c=relaxed/simple;
	bh=XJ/aH/UXImobHEpBonwT4utxgcIk2/HtQi769+wBpkI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VWC2lrdfx1HB7I9xXZO0sXS49a8DntRkrFyRciRvwJoi9uJuToOyKJH/Gy+njJ4nK/qnNb5TgNuiS44M7rc6j947rDSCBPBagNzgJNe4Ne+/N67ZHhz6Np4gYBWllUG+nA1jFA/Ga2J+KpusMVt7Of0sLb7zlnjLE9NpcoaCXTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9wq9baU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9753C4CEF1;
	Wed,  7 Jan 2026 21:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767819997;
	bh=XJ/aH/UXImobHEpBonwT4utxgcIk2/HtQi769+wBpkI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T9wq9baUba+++UeK5UQgkuRBPi9ibB4D5Wz2bx4/PitH5yrhm+ZspY4kyGhToOsds
	 KfOSJQJGdKIwEm9pn6ncyLKN4GGbplbIoacXppZZHsZ5ZDQmDYKWI/I+HcNqseQTJP
	 mls2FEk7nbzU8FnImvU+uB7ELB6GYgFSlXRN4mLAyBRibmyR7I7petEsdM5QC4RLue
	 Ij4f0savSc2VlggOaYkR1f7U4jagegUv+nX/3Xeanqw9mJyIfdBCnULf7EYGjFJrbh
	 ixN1lYfmrNaNLDSRSxqDiGAid2Bjh+lXyuIwJvIuzvsgcWRmV0kUZgQBIe4u27ha72
	 ecCMEopdesUfg==
Date: Wed, 7 Jan 2026 22:06:34 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Vishnu Sankar <vishnuocv@gmail.com>
cc: srinivas.pandruvada@linux.intel.com, bentiss@kernel.org, corbet@lwn.net, 
    vsankar@lenovo.com, linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Richie Roy Jayme <rjayme.jp@gmail.com>
Subject: Re: [PATCH v3 1/2] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based
 firmware  matching
In-Reply-To: <20251222080512.956519-1-vishnuocv@gmail.com>
Message-ID: <5n18nonr-5292-60sr-2634-0q0r870n3oq8@xreary.bet>
References: <20251222080512.956519-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Dec 2025, Vishnu Sankar wrote:

> Add support for firmware filenames that include the CRC32 checksum of the
> DMI product_family field. Several OEMs ship ISH firmware variants shared
> across a product family while product_name or product_sku may differ. This
> intermediate matching granularity reduces duplication and improves firmware
> selection for vendor-customized platforms.
> 
> The newly supported filename forms are checked before existing patterns:
> 
>   ish_${gen}_${vendor}_${family}_${name}_${sku}.bin
>   ish_${gen}_${vendor}_${family}_${sku}.bin
>   ish_${gen}_${vendor}_${family}_${name}.bin
>   ish_${gen}_${vendor}_${family}.bin
> 
> The legacy product_name/product_sku rules remain unchanged and continue
> to provide fallback matching.
> 
> ISH_FW_FILENAME_LEN_MAX is changed to 72 to accommodate the product_family.
> 
> Tested with X9 series and X1 series.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Tested-by: Richie Roy Jayme <rjayme.jp@gmail.com>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>

Applied both to hid.git#for-6.20/intel-ish, thanks.

-- 
Jiri Kosina
SUSE Labs


