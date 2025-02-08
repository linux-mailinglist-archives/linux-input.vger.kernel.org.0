Return-Path: <linux-input+bounces-9859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DA2A2D85C
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 20:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EFDF166403
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 19:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E8919F120;
	Sat,  8 Feb 2025 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sfhW0Vdn"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0C19DF6A
	for <linux-input@vger.kernel.org>; Sat,  8 Feb 2025 19:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739043757; cv=none; b=jw88Qls/VMkI5slUDoG4XJRzr/dhrVzGybnrRqkYIvzJE0gkWIUz5xKh6eFOdQCMLIAaLyFq+MjPVlnCdBVI2o+X1pDGerBU0gOQpMor+lA3C7snCrhpJeKVWhSnAXgrSe26QhZ760DnmlKRVwcSFA4Wgfd3UNAS4aLASPtEE5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739043757; c=relaxed/simple;
	bh=wQKV6RWv4e9Ld3XLqVQx2tDp9MI6hhAc5t3V+Ml8Q5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=of3zWCPWz0LFMSnQXr+5g5ej4tdZFg3OQMh6KIeg08iAF0z4RYHQ+xKfVzD2wu1CFXE3sZ2psZRG9AZO5lEYfMs/3InRvaX0FTZ+6MQ5LDcnT+eD87HgE/94st6GYkmKL457prIXxw9E6celXQ31KMnbiabkHI/OVcMWcaI3bU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sfhW0Vdn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C738C4CED6;
	Sat,  8 Feb 2025 19:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739043756;
	bh=wQKV6RWv4e9Ld3XLqVQx2tDp9MI6hhAc5t3V+Ml8Q5M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sfhW0VdnDU7G8wpwCrgBlCKI6BJJJqSfThcJDKUCN2ily+A9/oFuiTXg5J2H95LPX
	 YxauP0nrcV70/WlZVZZoNmr6Bgwws8dj4M/NTgfY04i2Hvbg4CryhEhA7yrexSAAG6
	 ytXB/z6iOHQC8liBTg5KGFloIO01zmxMa3BS38uT2l/hIhz+PxsFlohMGYohxA4EYC
	 ajEYSouUoDL+zPX6tUwuj1HVq5ttv4hyprVxy3Bq3Mifu2BV868vTEpSxPhCPXrQPb
	 eygnHn9l+O9itiempEf6altMIUpnNilU3PY5WT8hA8E/XXq4uuLapd08IjoWxTalAB
	 6yfcPRxzbEbZw==
Date: Sat, 8 Feb 2025 20:42:34 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Alex Henrie <dhenrale@amazon.com>
cc: thunderbird2k@gmail.com, roderick@gaikai.com, 
    roderick.colenbrander@sony.com, linux-input@vger.kernel.org, 
    alexhenrie24@gmail.com
Subject: Re: [PATCH v2 0/2] HID: hid_have_special_driver fixes for playstation
 driver
In-Reply-To: <20250206234708.7214-1-dhenrale@amazon.com>
Message-ID: <r18o57p3-051n-91oo-q0n2-78674r22qrop@xreary.bet>
References: <20250205202532.2586-1-dhenrale@amazon.com> <20250206234708.7214-1-dhenrale@amazon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Feb 2025, Alex Henrie wrote:

> Changes from v1:
> - Add a second patch to enable the hid-playstation driver for PS5
>   controllers
> 
> Thanks to Roderick for your feedback.
> 
> Alex Henrie (2):
>   HID: Enable playstation driver independently of sony driver
>   HID: Enable playstation driver for PlayStation 5 controllers
> 
>  drivers/hid/hid-quirks.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Both now applied to hid.git#for-6.15/sony. Thanks,

-- 
Jiri Kosina
SUSE Labs


