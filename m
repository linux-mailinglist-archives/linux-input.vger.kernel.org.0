Return-Path: <linux-input+bounces-8126-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A39D0498
	for <lists+linux-input@lfdr.de>; Sun, 17 Nov 2024 16:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D99E3B21862
	for <lists+linux-input@lfdr.de>; Sun, 17 Nov 2024 15:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C9C481DD;
	Sun, 17 Nov 2024 15:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYY4HTG9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697A9A937
	for <linux-input@vger.kernel.org>; Sun, 17 Nov 2024 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731859052; cv=none; b=BEGPASQSh9Ka0gAYn7PXAtC+mnWHk2pmnaSl08q8ikxk3sTsHzkUKu4BpIGonolCXdFAEFRY4YtzghLv6ocZdmXJrgUuf5iQQAoicw/QCaUQl/XGLj0OrRJwCPmYpVlWAtALMl59qsJkPkX20GZ9EgCEXTJFshjmt7q9NYG11ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731859052; c=relaxed/simple;
	bh=7VGMl8KZ7lggzYyEkNECdK+RVkqSyBZOp4te6cWg9HY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fp+u53QgVFPyR3S1tuRkOXG8mw1L8l6jYxriA/WN8sTVZOn6qkjLBKAwKSpKf+Pv8YCdw9S7k3KQCI14MR7OQrFgRt7TI3Pj/2ve0WA1256JmxsQTKB23V+bSLAK1MVvrjPfBwhZKcaGW/wnmu2+l1yZ1GX4OiG1FmIs3KtN8rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYY4HTG9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731859050; x=1763395050;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7VGMl8KZ7lggzYyEkNECdK+RVkqSyBZOp4te6cWg9HY=;
  b=QYY4HTG9jqvyNjvZt8IcOfDU1tskt5f7m4JifTngRT2RWwgnqsMypLek
   tVz/kOyS7NSetXEf+aN1bTzvEtrDVtN1JOxWpRlqVJLNq5E9rKc5yzFRn
   Rq3bCF4g2nNvgPJnjQ3JWDpfvFeRdIOxqabqamkgB/hQdKggxmyNFpddr
   ckbWvCQsAls1gxRUGntR1fM67bMGYqfht1iro4CxNTt4s+NYoDRxFIek9
   mQjnRkvW+G6F/IioITXzkQuoh4A+y1WQVVPYFsiEn8gY7rD9rG5X5CEEn
   cI8UsKMrNM510QKHADNffKVI1GSUeSrXkmxGZH5JhyTUGdxTnIhTYKvS4
   A==;
X-CSE-ConnectionGUID: ZS7KIg6ITayeX3nw9i05nw==
X-CSE-MsgGUID: eHLIWjVkSN66tumrB2Se4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="35488730"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="35488730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 07:57:30 -0800
X-CSE-ConnectionGUID: fpB6+AtqSIaPO/iCg6R7Qw==
X-CSE-MsgGUID: B5tCEeZjQRWenEOcDtdRWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89785342"
Received: from spandruv-desk2.amr.corp.intel.com (HELO [10.125.108.202]) ([10.125.108.202])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 07:57:29 -0800
Message-ID: <91750f86cdd647f1b2d43617aa45b8e095c0fdb5.camel@linux.intel.com>
Subject: Re: intel_ish_ipc: loader failure on Lunar Lake
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: melvyn <melvyn2@dnsense.pub>, linux-input@vger.kernel.org
Cc: jikos@kernel.org, Zhang Lixu <lixu.zhang@intel.com>
Date: Sun, 17 Nov 2024 10:57:27 -0500
In-Reply-To: <9564a26c-37ec-4b5b-82ec-2b5153e1fe61@dnsense.pub>
References: <b74f8422-a7fb-4475-a1c8-383734449f91@dnsense.pub>
	 <2d08e47f-ea9b-4d28-b345-36818eadf366@dnsense.pub>
	 <88a8d5f06fdf181c320240d8439a5d5c2762a8a4.camel@linux.intel.com>
	 <9564a26c-37ec-4b5b-82ec-2b5153e1fe61@dnsense.pub>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thanks for testing. Probably left over license.
We need Vendor approval to add to linux firmware git.

Thanks,
Srinivas

On Sat, 2024-11-16 at 12:32 -0500, melvyn wrote:
> This was correct, I missed the "ISH extension" driver on windows
> which=20
> provided a different ISH firmware. Loading it on linux renders these=20
> sensors fully working.
>=20
> Unfortunately, I couldn't find any license information apart from the
> "INTEL PROPRIETARY" header in the INF file, which Samsung probably
> just=20
> left from the Intel-provided extension template; the firmware
> probably=20
> can't be upstreamed without vendor cooperation (unlikely here).
>=20
> Thank you for the assistance!
>=20
> -melvyn2
>=20
> On 11/16/24 09:45, srinivas pandruvada wrote:
> > Hi,
> >=20
> > + Lixu
> >=20
> > It is likely that Samsung needs their own firmware.
> >=20
> > Thanks,
> > Srinivas
> >=20
> > On Fri, 2024-11-15 at 15:18 -0500, melvyn wrote:
> > > Totally missed to CC the maintainers, sorry!
> > >=20
> > > -melvyn2
> > >=20
> > > On 11/7/24 21:42, melvyn wrote:
> > > > Hello,
> > > >=20
> > > > The intel_ish_ipc driver seems to fail on my machine. It's a
> > > > lunar-lake based convertible (samsung galaxy book5 ...) which
> > > > should
> > > > provide accelerometer/gyroscope/lid tild HID inputs. These work
> > > > on
> > > > Windows fully, but do not appear to work on 6.12rc5. All I have
> > > > to
> > > > go
> > > > on are the following kernel log lines:
> > > >=20
> > > > ...
> > > > [=C2=A0=C2=A0=C2=A0 4.416718] intel_ish_ipc 0000:00:12.0: ISH loade=
r: load
> > > > firmware:
> > > > intel/ish/ish_lnlm.bin
> > > > [=C2=A0=C2=A0=C2=A0 4.430675] intel_ish_ipc 0000:00:12.0: ISH loade=
r: cmd 2
> > > > failed
> > > > 10
> > > > [=C2=A0=C2=A0=C2=A0 4.448263] intel_ish_ipc 0000:00:12.0: ISH loade=
r: cmd 2
> > > > failed
> > > > 10
> > > > [=C2=A0=C2=A0=C2=A0 4.467844] intel_ish_ipc 0000:00:12.0: ISH loade=
r: cmd 2
> > > > failed
> > > > 10
> > > > ...
> > > >=20
> > > > The kernel is very close to mainline (NixOS's linux-testing)
> > > > and
> > > > doesn't seem to have any patches which would affect this driver
> > > > specifically.
> > > >=20
> > > > If there's any further information I can collect please let me
> > > > know.
> > > > It's my first time trying to use a kernel mailing list, so
> > > > apologies
> > > > if this is the wrong place or I'm missing something else.
> > > >=20
> > > > Thank you,
> > > >=20
> > > > melvyn2


