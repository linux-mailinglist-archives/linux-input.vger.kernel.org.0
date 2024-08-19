Return-Path: <linux-input+bounces-5681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E69572B3
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 20:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24B82B21E81
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 18:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52DE8187850;
	Mon, 19 Aug 2024 18:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1E7yccp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AD1CAAF;
	Mon, 19 Aug 2024 18:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090927; cv=none; b=u1jN+jJFclVaSarZK7YbyfgoM1cJKs32clEjD9IOpLTgX/VsZhJU3fwVKN0a5/TSGwMDcnGh5vk9F9gvCUGjqM/a5wytXLqKzHGur0IP3XqbMeE/lLdnm4HCiUzPcb5FwqDqgqJJOjl9lzK96NCG697uLO1yuUToExbw5qs6GNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090927; c=relaxed/simple;
	bh=6XNbShd/LtTZCU3d+Q5wh2cIlADGPZyh8kowhidkYXA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kSq5NGaPTAROPlGSSiVUAy6AWR08JftQ+Xwro19MnxpY4nBdx7TA9TIxbvBM418VVBfgY3QuExuAnTRfjhFAkPuWwhxNQeVI9BlYJG63TkMgbEvDi1f6Dd2WpeSEb7fQBLsCpEjZTD2lKax0WdbxTeOUO10KDByKhAzdP/Xlfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1E7yccp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFFEC32782;
	Mon, 19 Aug 2024 18:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724090926;
	bh=6XNbShd/LtTZCU3d+Q5wh2cIlADGPZyh8kowhidkYXA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=o1E7yccpnohDHZR997v/i+Nb/K29E/Gnp8kFWBuxG3lTaLDEorngh/Wsi76RYkkwr
	 87x/2PT39rZTPyELZxSi2V3/S1sM//Lh3VsBFixCNSNYTdkfcCFmI4G62vO+yqQe/W
	 ZTy5qVXlN/Mt9L/blMx4FwnynwgDoy9Fjn9lq9JLRMdZjQOxrwdpfK0WV9zEoOTIdE
	 wA3pHy2wmQz8hDlR3AAr/R7qn9FPWbmeUVoe/FuBHzZnWyJU+A7qFmZd3pKmnbn0uF
	 VHSCmucGpkfPWArdq6DkZJI4kaPZYHNVsboBuWOCxYOfoY/PuVaws9iDA7TrgTWYSw
	 2XmcnNh7UoZZg==
Date: Mon, 19 Aug 2024 20:08:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Yue Haibing <yuehaibing@huawei.com>
cc: srinivas.pandruvada@linux.intel.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend -next] HID: intel-ish-hid: Remove unused
 declarations
In-Reply-To: <20240731103122.1897331-1-yuehaibing@huawei.com>
Message-ID: <nycvar.YFH.7.76.2408192008350.12664@cbobk.fhfr.pm>
References: <20240731103122.1897331-1-yuehaibing@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 31 Jul 2024, Yue Haibing wrote:

> Commit 3703f53b99e4 ("HID: intel_ish-hid: ISH Transport layer")
> declared ishtp_remove_all_clients()/ishtp_can_client_connect()
> but never implemented them.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


