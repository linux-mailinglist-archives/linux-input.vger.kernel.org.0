Return-Path: <linux-input+bounces-5686-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EA957437
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 21:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C6EB283D70
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 19:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3E619645D;
	Mon, 19 Aug 2024 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPwMZdLQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA57C175D46
	for <linux-input@vger.kernel.org>; Mon, 19 Aug 2024 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724094796; cv=none; b=NPz0vZsoWqcxRJPC2NJi+6RSdHm9wNfEIXNjDMXTryrVRg/9z5hgTWMp5KkUwPNfYxOa4CrYc1MlzPLwk88G6YUSmmkGDbg5brBEaEV1YkQnlWGtiWmpWzyevHfy6aLdI+dUQM0OG3qcPq/XZyPg6YkSWULTAGufPZP0xkE7rr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724094796; c=relaxed/simple;
	bh=FvO4qeqSa9B/Lr5WZNp7EU8MSSXdJDWR11etnrWa6bY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uSKAS47fC2qRNVcDxpvcTUlv7Wz23C+p/diMqZoAM0YYSk72z3RdNuZeMEqAxcBCNGGG7lFGTq5/oNWFZLWP8cjYuiyMvBVSY/6mr375xNcK7OVlpIzGvsfwxaWEUB5mii0R2F4jMbFG3InRLzf583nOxEPU8zl923+RJypc+uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPwMZdLQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 180ABC32782;
	Mon, 19 Aug 2024 19:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724094796;
	bh=FvO4qeqSa9B/Lr5WZNp7EU8MSSXdJDWR11etnrWa6bY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TPwMZdLQKoXzYwtKk5Pn5LSgjwJmJrSLc/QvX6rEpu2Tq2ZU39DyH9N+PVaFLtTi5
	 0IEkJDLSVOIJaVKB/Q2syXLDva9abdqa0myxvJsfwUVMLd6Dyt+zmTDHyfyOfzxw5u
	 NC7KmzXZukF+0kwOoMZr5ctBBha+IJsUsxEBM97BUwS/+LejqTFTWwmFI+rrGaDZ3L
	 19BPzhgBth3Qol9sDL4UzaD4CJKlGwk6XjXrNXb0q3y4ayCPjNahv/O2RbmZPUToVJ
	 Zi4VlDYTN+Z5tKfFQUruAnEEi5uqmnHpU1x2RyItBq0CwrjMDPD5XJOJ2kvE8Wm4kx
	 O3wUeiO/TArmA==
Date: Mon, 19 Aug 2024 21:13:14 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, hemin.han@intel.com, yoshi.wang@intel.com, 
    even.xu@intel.com, ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v2 0/3] hid: intel-ish-hid: Add support for vendor
 customized firmware loading
In-Reply-To: <20240815021001.936277-1-lixu.zhang@intel.com>
Message-ID: <nycvar.YFH.7.76.2408192112590.12664@cbobk.fhfr.pm>
References: <20240815021001.936277-1-lixu.zhang@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 15 Aug 2024, Zhang Lixu wrote:

> This patch series adds the capability to load vendor-specific customized
> firmware. The loader now constructs firmware file names based on the
> DMI_SYS_VENDOR, DMI_PRODUCT_NAME, and DMI_PRODUCT_SKU information in
> Desktop Management Interface (DMI). The loader will attempt to load the
> firmware files following a specific naming convention in sequence. If
> successful, it will skip the remaining files.
> 
> v2:
>   - Address the review comments from ilpo.jarvinen@linux.intel.com
>     Fix the typo and capitalization, remove unnecessary inline.
> 
> Zhang Lixu (3):
>   Documentation: hid: intel-ish-hid: Add vendor custom firmware loading
>   HID: intel-ish-hid: Use CPU generation string in driver_data
>   hid: intel-ish-hid: Add support for vendor customized firmware loading

Applied to hid.git#for-6.12/intel-ish

Thanks,

-- 
Jiri Kosina
SUSE Labs


