Return-Path: <linux-input+bounces-4074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA958FB0FC
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 13:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0020028328C
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 11:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F68D14532B;
	Tue,  4 Jun 2024 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfWTU/yC"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33B41442E3;
	Tue,  4 Jun 2024 11:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717500206; cv=none; b=Z6hkysnGTBfL8ytFkWJKIibkT09ur+JoFxTHt4M2WDbh7U6v0Pmn/oinFtP7OH+BKFm8ChHf/gd5vgJLg67yFiSFBN6zuj5K01lLLnLRu35RBmnMVfTs1konsqozrrt3RL7TOoUgvqb27p+XpZtZLEMdJwihVvJwqDpy5mPrvMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717500206; c=relaxed/simple;
	bh=IoD1rYuc39XAqZaHhZqHonxQQWSS0sseJz2Cx9pU6QM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B95hz/lT6qk6DK/pcunoR13hQUwJEJS1QoaqAiJ58GAQ3UnO4CP2gfuV+pEYDQ8KrD1R2yY7RFsTWh01z9b/cR3cpi4j/ZE0b53xLJ1vO/USNWT1yJn97EAMwuxKwRlVH7WFabRKkYCQTek8ULtwwQx7yZDbFPtW01Aa6EzldYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfWTU/yC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717500205; x=1749036205;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=IoD1rYuc39XAqZaHhZqHonxQQWSS0sseJz2Cx9pU6QM=;
  b=PfWTU/yCpNqykBsUyIfilYn/ULiNVVlYVyllnL+QYdACPzaWoWBzIZK3
   BRELxGTzC2NS5xz02D4h0xtWle/+PZ+ZwPALLrKB0GgM2wabz81i9gNBh
   JNKnkOqyi/QdlYlJObE5bCrXrW2tLHxE8xbB0VJMOp1csTBJphAU+6dKF
   RYlU8z5uawfPCBlm5Mx7bEyuF1JX1OpRWitfEfezzC0gLW0EvzbYBNmPy
   P1VPAHxQVripiJLO24ZQmfhhMRbcvRV8e/VYdCNn3/L54jBnbb2d6d/Dl
   8tgYGjYbGWku+70kWt27T8AQWtWXBfOG0eEq8eejXqwN6RyGC+ofTDqp7
   A==;
X-CSE-ConnectionGUID: uU70syWiRPew/34hMJ4LDA==
X-CSE-MsgGUID: DTqOgGtbT8GdqAiqgXLhtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17876668"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="17876668"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 04:23:24 -0700
X-CSE-ConnectionGUID: 28UDohSwQWa2LEZzzXR+Yg==
X-CSE-MsgGUID: yjHFfmnYS2ytERv+7dqn5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; 
   d="scan'208";a="37075851"
Received: from thankacx-mobl3.gar.corp.intel.com ([10.215.124.111])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 04:23:21 -0700
Message-ID: <ade5ed726ad79a3111f90370eac670c3cb1c7161.camel@linux.intel.com>
Subject: Re: [PATCH] [v3] HID: intel-ish-hid: fix endian-conversion
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Zhang, Lixu" <lixu.zhang@intel.com>, Arnd Bergmann <arnd@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>, 
	"linux-input@vger.kernel.org"
	 <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>
Date: Tue, 04 Jun 2024 04:23:15 -0700
In-Reply-To: <DM4PR11MB599501461E04F76B9F32374093FF2@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240603074125.2963801-1-arnd@kernel.org>
	 <DM4PR11MB599501461E04F76B9F32374093FF2@DM4PR11MB5995.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-06-03 at 08:38 +0000, Zhang, Lixu wrote:
> > -----Original Message-----
> > From: Arnd Bergmann <arnd@kernel.org>
> > Sent: Monday, June 3, 2024 3:41 PM
> > To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Jiri
> > Kosina
> > <jikos@kernel.org>; Zhang, Lixu <lixu.zhang@intel.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>; Benjamin Tissoires
> > <bentiss@kernel.org>; linux-input@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH] [v3] HID: intel-ish-hid: fix endian-conversion
> >=20
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > The newly added file causes a ton of sparse warnings about the
> > incorrect use of
> > __le32 and similar types:
> >=20
> > Add the necessary conversions and use temporary variables where
> > appropriate
> > to avoid converting back.
> >=20
> > Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading
> > firmware from
> > host feature")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Zhang Lixu <lixu.zhang@intel.com>
> Tested-by: Zhang Lixu <lixu.zhang@intel.com>

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

>=20
> Thanks,
> Lixu
> > ---


