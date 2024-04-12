Return-Path: <linux-input+bounces-2946-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5469F8A2D27
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 13:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 083EF1F22E03
	for <lists+linux-input@lfdr.de>; Fri, 12 Apr 2024 11:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E68537E6;
	Fri, 12 Apr 2024 11:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+UXVPlv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177175339E;
	Fri, 12 Apr 2024 11:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712920666; cv=none; b=rqVFTI3g9JG93pY2sPJSdkuYV4WjYBQOf7fXmbvfQStdQIfMM4jxHFIuBaxldpaK66dcnmdblFus99IcU+I0F6i+gRfJDF7h4y/zgDWav+gCyQGe6qc1CyDPFl3wP9+9rGjhxZQ77RacK1V3nfSyWUwwajsPsEroVt0Eb4NkEl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712920666; c=relaxed/simple;
	bh=ls7xtquQi3dVJidgHtWCR5+lqJJW0q73T00BkLPUMPA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=m+2ApAzQrFu38DpvA2YD8ocfzfv856+uXNNkCpyERTpPO6M4YaRbKDKNWQcO70efqFH/2b0BWxp+HRtYhIQBizC6eqQdq6/AUllej6A0r8I7CFGRafj++kuSzkD2hGVnyGHCmlmMLxaqG9+uguYyvB9aerZYXSlPn4mlVPkgje4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+UXVPlv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F866C113CC;
	Fri, 12 Apr 2024 11:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712920665;
	bh=ls7xtquQi3dVJidgHtWCR5+lqJJW0q73T00BkLPUMPA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=C+UXVPlv8fr7CiW874HWac3zXYHPnMauhNNFggieuJa3JfnKB06yHbHzmG2gH/Hkh
	 EUrxPcu46EjA6lZO8xB+KHxiI0VH915i+YYMdrGbBm9cDaQjZJp66HLQSHPaqIfyQv
	 lfJcpsGTTkwDOscfeDN+v5epuWyz+Rlx7sUYDI7pwBK87eAD/sV0eHgNB/9ujDEw1b
	 M1zfEnEVrnxbGKFFPCiNogoDNMUGHvE/cIgFb2ObdeaJyJp+HYEY0Se+CIyz5gOjB8
	 B7KVVrgqIYoxYmDBuboZIzkXhdL3idXbyI8RYA34psJKAh9QcCQGHHDtgz9DvDmQIa
	 E/7IH5g5bw1dw==
Date: Fri, 12 Apr 2024 13:17:43 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: kernel test robot <lkp@intel.com>
cc: Ivan Gorinov <linux-kernel@altimeter.info>, oe-kbuild-all@lists.linux.dev, 
    linux-input@vger.kernel.org
Subject: Re: [hid:for-6.10/winwing 1/1] drivers/hid/hid-winwing.c:123:22:
 warning: variable 'minor' set but not used
In-Reply-To: <202404041038.aQ0aRTSK-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2404121317260.5680@cbobk.fhfr.pm>
References: <202404041038.aQ0aRTSK-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Apr 2024, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.10/winwing
> head:   266c990debad2f9589c7a412e897a8e312b09766
> commit: 266c990debad2f9589c7a412e897a8e312b09766 [1/1] HID: Add WinWing Orion2 throttle support
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240404/202404041038.aQ0aRTSK-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240404/202404041038.aQ0aRTSK-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404041038.aQ0aRTSK-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/hid/hid-winwing.c: In function 'winwing_probe':
> >> drivers/hid/hid-winwing.c:123:22: warning: variable 'minor' set but not used [-Wunused-but-set-variable]
>      123 |         unsigned int minor;
>          |                      ^~~~~
> 

Ivan, will you please submit a fix for this?

Thanks,

-- 
Jiri Kosina
SUSE Labs


