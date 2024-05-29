Return-Path: <linux-input+bounces-3958-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BC88D415C
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 00:25:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E386B28921C
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 22:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7085F16B756;
	Wed, 29 May 2024 22:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9i5bAzb"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CD315B0E6;
	Wed, 29 May 2024 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717021531; cv=none; b=MuSh1G+sQtP0rF6ezAxl3zSBIHGils4nAdjAskUUJ3TmmruEMg29baWA2M4cTxvAY5qRjAkQcgqNQeKYk2bsqE020J2bmAWmKP9irDfvKi8SqtW4y4NBbJR6NaZMLzOiExjRHo8755r6bWLUl61wXIVq9k/oZ7ovhJVJz4bSNkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717021531; c=relaxed/simple;
	bh=AGtL+i/Wng6uW6DDsXTEUWcLV+lXmoKtPV0wTUjC1Jc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFABYtawrBMHXwK2zto4HYYM1wMDxBaVwhPWw1uMvvo0Zr6x1xbJxIPHDDGXkui1bN/ckzfEnqtxNn6niGUTMJBpKkfeK3vEnaS/y97WDCWSFfX/mOr9kMUEhVIWE5OI8BXXZm8r2AVgXfADaUz5YRFWKYW3e6viN6E9kKFdTy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9i5bAzb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717021531; x=1748557531;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=AGtL+i/Wng6uW6DDsXTEUWcLV+lXmoKtPV0wTUjC1Jc=;
  b=S9i5bAzblpFxHs++p3i2PruTlE83Y+Y+1X30VjZ1H8ws5IspGJ3VnRxq
   cNwBrX1uyMMLAC/RN7/UkJrymZ6CTNR7l5mHisqYC+qs1gP8yG88NLja6
   skv8Yum9uJJbET+lXLQnR/C1yzv5s+Y2Ga8S7Lvdl4lP77TkU3VCdgkXN
   oJHL508UsMDLR3IoyfRzOapvbUneEZd5+/o0bHyhvWSZcL8xZiMCo8f02
   UIK5orNq7nih+x14Yjjm1w51cqKIP/H/ogScBxxhxSrFICu7IjG+diZLt
   oPXOUlh8h5dzqFGK01jYW5vWL3JfYSxd0l8l3S3WQJRGs9rpDjJcpQRvU
   A==;
X-CSE-ConnectionGUID: D97Dv2OrQRST+LS4s0mzFg==
X-CSE-MsgGUID: UYjPMf0FTImecJLbqon1zA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13307928"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13307928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 15:25:30 -0700
X-CSE-ConnectionGUID: mcormglJS+SLcUoYVa8V+Q==
X-CSE-MsgGUID: D6/CoNRWRk61H6Vt4pzFYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="36135896"
Received: from mpiske-mobl2.gar.corp.intel.com ([10.213.75.20])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 15:25:26 -0700
Message-ID: <ed3236173ff6fdb1cb6962f388b41e6b90586335.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Lixu Zhang <lixu.zhang@intel.com>, Arnd
 Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>
Cc: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Wed, 29 May 2024 15:25:22 -0700
In-Reply-To: <fcbdc4a5-abee-4de8-9fe8-c8486195b96d@app.fastmail.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
	 <DM4PR11MB5995875EEC9ACCFC43D8B86A93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
	 <fcbdc4a5-abee-4de8-9fe8-c8486195b96d@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 09:06 +0200, Arnd Bergmann wrote:
> On Wed, May 29, 2024, at 08:46, Zhang, Lixu wrote:
> > >=20
> > > -#include <linux/cacheflush.h>
> > > #include <linux/container_of.h>
> > > #include <linux/dev_printk.h>
> > > #include <linux/dma-mapping.h>
> > > @@ -175,10 +174,11 @@ static int prepare_dma_bufs(struct
> > > ishtp_device
> > > *dev,
> > > 			return -ENOMEM;
> > >=20
> > > 		fragment->fragment_tbl[i].ddr_adrs =3D
> > > cpu_to_le64(dma_addr);
> > > +
> > > +		memcpy(dma_bufs[i], ish_fw->data + offset,
> > > fragment-
> > > > fragment_tbl[i].length);
> > fragment->fragment_tbl[i].length was used before assignment.
> >=20
> > > +		dma_wmb();
> > I tested it on the platform, but it didn't wok.
> >=20
>=20
> What behavior do you see instead? If the manual cache
> flush works around a bug, that would indicate that the
> device itself is not coherent and the dma_alloc_coherent()
> in the architecture is broken.

Lixu,

What happens if you remove manual cache flush in your code?
It is possible that boot loader at this time not ready to do fully
coherent ops.

Thanks,
Srinivas



>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 Arnd


