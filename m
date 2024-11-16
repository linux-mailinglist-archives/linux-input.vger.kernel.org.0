Return-Path: <linux-input+bounces-8121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 534599CFF59
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 15:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15396281E20
	for <lists+linux-input@lfdr.de>; Sat, 16 Nov 2024 14:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58C488BE8;
	Sat, 16 Nov 2024 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wb+6HvqL"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35AF4A1A
	for <linux-input@vger.kernel.org>; Sat, 16 Nov 2024 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768322; cv=none; b=Xm0S04EBWgIQoe805NFc5k0cgIskBiXAAABKPu9Hmy78wlpWvUxI7quh3bPoB0ccGE6VTbIpADGvbYaLTg/A8AjkD0AIOa2ao+PQz36215ck/1xakH5GOxOLf/guNhJxzApG6p5BUkr6E0CSR22N3U0RxzsuLQfOuXmcM5J5yYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768322; c=relaxed/simple;
	bh=1v0YL+dShc5F/KyVGdu/2M8dmTmG1LMxWkS2llMDKEo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u87+VqLIl/kgMeTtJOqFvIAtlZq6Lmgqs7JKSLquulaqGd9NnUT4IDZ4/1DhZM6yraieTE35Lbq1a+DpVq5YPf1Kfa7TKh1v+2Gq754OWDdqUO2dKWpJi4FtLjgU37ex6CCDNsasr8FK99OFmyg4nys+DaWsPxtSprSvFtOJ7PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wb+6HvqL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768321; x=1763304321;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1v0YL+dShc5F/KyVGdu/2M8dmTmG1LMxWkS2llMDKEo=;
  b=Wb+6HvqL9NqNtn4JRTdBTBgTNfcKmSs/EcjM1Ylb8D8o4uaDUV3cgMtF
   JvXtws8yQhfz4jukEVqzBaLnQpPKzI3jl3MmV1ZxgJ8QwH8DLkJj9e3vB
   5D8kG465aT+SxL447/ki97IxIcg6+7wNVcZ2W+ZecMkm/8DfMmrpjDO8b
   3294dtGUUohCFOPPWJak08jbOgY2VOCCn3I2UoquUcuKFeNOqeX2KTJuF
   vZ7JJspPVWGYPRFIBTUgtHgXEhjJ8lowmnM9TbFPDRzhAUhAH7GmSTgNZ
   /z3adBJxQFpmQ5mAW3yU0iP7ozgydLBlLRXaoWv9G9MdYokMTz7pmAoCC
   g==;
X-CSE-ConnectionGUID: J7Ow75AKTemS8BEE7A4U+w==
X-CSE-MsgGUID: JHVHlaZ5S8WCFBeaXVJD3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31520957"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31520957"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:45:20 -0800
X-CSE-ConnectionGUID: PmGxsfT9RFm1/3RnNOn5Yw==
X-CSE-MsgGUID: fV0K9OuOQ92PF2wFfdQXXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88927344"
Received: from spandruv-desk2.amr.corp.intel.com (HELO [10.125.108.181]) ([10.125.108.181])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:45:18 -0800
Message-ID: <88a8d5f06fdf181c320240d8439a5d5c2762a8a4.camel@linux.intel.com>
Subject: Re: intel_ish_ipc: loader failure on Lunar Lake
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: melvyn <melvyn2@dnsense.pub>, linux-input@vger.kernel.org
Cc: jikos@kernel.org, Zhang Lixu <lixu.zhang@intel.com>
Date: Sat, 16 Nov 2024 09:45:16 -0500
In-Reply-To: <2d08e47f-ea9b-4d28-b345-36818eadf366@dnsense.pub>
References: <b74f8422-a7fb-4475-a1c8-383734449f91@dnsense.pub>
	 <2d08e47f-ea9b-4d28-b345-36818eadf366@dnsense.pub>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

+ Lixu

It is likely that Samsung needs their own firmware.

Thanks,
Srinivas

On Fri, 2024-11-15 at 15:18 -0500, melvyn wrote:
> Totally missed to CC the maintainers, sorry!
>=20
> -melvyn2
>=20
> On 11/7/24 21:42, melvyn wrote:
> > Hello,
> >=20
> > The intel_ish_ipc driver seems to fail on my machine. It's a=20
> > lunar-lake based convertible (samsung galaxy book5 ...) which
> > should=20
> > provide accelerometer/gyroscope/lid tild HID inputs. These work on=20
> > Windows fully, but do not appear to work on 6.12rc5. All I have to
> > go=20
> > on are the following kernel log lines:
> >=20
> > ...
> > [=C2=A0=C2=A0=C2=A0 4.416718] intel_ish_ipc 0000:00:12.0: ISH loader: l=
oad
> > firmware:=20
> > intel/ish/ish_lnlm.bin
> > [=C2=A0=C2=A0=C2=A0 4.430675] intel_ish_ipc 0000:00:12.0: ISH loader: c=
md 2 failed
> > 10
> > [=C2=A0=C2=A0=C2=A0 4.448263] intel_ish_ipc 0000:00:12.0: ISH loader: c=
md 2 failed
> > 10
> > [=C2=A0=C2=A0=C2=A0 4.467844] intel_ish_ipc 0000:00:12.0: ISH loader: c=
md 2 failed
> > 10
> > ...
> >=20
> > The kernel is very close to mainline (NixOS's linux-testing) and=20
> > doesn't seem to have any patches which would affect this driver=20
> > specifically.
> >=20
> > If there's any further information I can collect please let me
> > know.=20
> > It's my first time trying to use a kernel mailing list, so
> > apologies=20
> > if this is the wrong place or I'm missing something else.
> >=20
> > Thank you,
> >=20
> > melvyn2


