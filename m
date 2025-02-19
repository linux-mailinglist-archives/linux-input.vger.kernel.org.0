Return-Path: <linux-input+bounces-10192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52763A3B7F1
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 10:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA595188C95C
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B8E1DEFE5;
	Wed, 19 Feb 2025 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ez+RmOmA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4691DEFDC;
	Wed, 19 Feb 2025 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956199; cv=none; b=SQDCvNkUOrIZWQbYETkI3LKOWKDvWLGz5i0B6GyzD7eGVXpD0xbft2oM+n10T8QuswUyjf6LidZbkgnHGjIIPhhP+Y4IS9yd+MEM60czFBuA4tuJph+icMbxFG3dRY00VC7X60y6+4W8zf3VZYOJC0+do3zEn+VNHCZaigOGGuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956199; c=relaxed/simple;
	bh=rAe0aAGoUjqy345llVVV+SbCkeyy9hdKXlSsPP+TR/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XpIpDWRV+5X5VD7NvmNK331noEseanZ5D9QbxW4OC9KZIe1vr9IIzlUG7IG+qN62j03B1Z2ijwtGSNBhaZBaP6SxYnCPRys1JuO737oTAI/0o+lAWWkjOj6AG4arS6VaMWCAIhiNarbxEeqqR3M3VgSFnO04wX5XM9141+B0HxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ez+RmOmA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61CAC4CEE6;
	Wed, 19 Feb 2025 09:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739956198;
	bh=rAe0aAGoUjqy345llVVV+SbCkeyy9hdKXlSsPP+TR/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ez+RmOmAf9kYZK9kxrsg6UZpZd2t0zznJgTcG0Myxbq3f4iX9WbUWiiz0Xn9BV5BQ
	 MlEJOt7+TPtf4x09GvaphEHnpeyZllpwhoBywBFf8ZwjpGr92iRSuuBE0KbUk349pM
	 fz4Qy4WMvAImAMB+Ersrin4DyWS26bBlIFmRgcc0MA/nyltWiOfNzNw/tjACOC4CU0
	 RZzunNHtTm8Ju0U56yQPFvJj834YHyr73Evin/0TeCBHWqDD9X6U07q0Xfun4k3SG3
	 YmsONLW0wk3oEjYNvS9GV2TEpAV2XIyayeVhaF7c14bo3oIr483+Znu9saocrmZvBK
	 Vwtg1nrJLEAMQ==
Date: Wed, 19 Feb 2025 10:09:54 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Zhang Lixu <lixu.zhang@intel.com>
cc: linux-input@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
    benjamin.tissoires@redhat.com, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: intel-ish-hid: Fix use-after-free issues in
 driver removal process
In-Reply-To: <20250218063730.1211542-1-lixu.zhang@intel.com>
Message-ID: <0o60q8ps-6q54-157q-q627-sn09p3n00784@xreary.bet>
References: <20250218063730.1211542-1-lixu.zhang@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Zhang Lixu wrote:

> These patches address use-after-free issues in the `intel_ishtp_hid` driver
> during the removal process.
> 
> Zhang Lixu (2):
>   HID: intel-ish-hid: Fix use-after-free issue in hid_ishtp_cl_remove()
>   HID: intel-ish-hid: Fix use-after-free issue in ishtp_hid_remove()
> 
>  drivers/hid/intel-ish-hid/ishtp-hid-client.c | 2 +-
>  drivers/hid/intel-ish-hid/ishtp-hid.c        | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Applied to hid.git#for-6.14/upstream-fixes, thanks.

-- 
Jiri Kosina
SUSE Labs


