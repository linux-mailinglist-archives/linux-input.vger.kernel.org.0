Return-Path: <linux-input+bounces-4041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7E38D7DA3
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 10:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F7731F23849
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 08:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D943B6EB5B;
	Mon,  3 Jun 2024 08:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PXt++toj"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2D6A032;
	Mon,  3 Jun 2024 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404208; cv=none; b=pdpwco5uzmj2zOR+e2ekunxuKscZOmwCo4fISIrGe5QykSCc39nOdnip8NxLi6CZHAMli4RSbfoy5ssSy9nZ7F3ywQbtF722qwUtoR0yS1RwyrRv+NHKvuq/aXbeBULXtzGy6Yy12kOk+PcoSnSdiJlKk8RvIHlJgtiTzg7Xlyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404208; c=relaxed/simple;
	bh=eJIV/jebYVXPHvZaB9P06fnUZf5mzRKSx+cI6OfoOnU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EBXtZEmbnhCYu0xaOXsBg83BFExzuLNncYNbpH5WX5IW2MmvfeE1THCBxPTYUsyaWRJ7A/zZMEeBy8Ilbzq+CV8eHKe98GQJPRpJ4qgfUQfyMch1CAkddnd7jW+S5GtytvrmGryCMArdAcrrpNQAK5/R/Ta/0yOfwzSpHL6Y9HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PXt++toj; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717404208; x=1748940208;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=eJIV/jebYVXPHvZaB9P06fnUZf5mzRKSx+cI6OfoOnU=;
  b=PXt++tojED4gVYMYfC2Dn7hH7lZ3eSWiSp4MOtX3vMZfqlgTewqDvlT+
   A4qH2/Fl0eW2R9lu4P0Qazw33E5nutNHpf4aAGk7ijBeuriMVeUSgYoNv
   xY44HPnNctnsn5UecZbybLulaH8pRZZY3BmqzgCp+EQr3uW093QMFelNl
   lxiIYcMW3apg2tSpC9vhamnK/GG0/aGcoWR46q5pQOXOB+VmCsJ2WksTj
   qP6YJM/n7Q0VzDJnXn4C7LbKCtVZ1WTH3hahhwJvYj2VhSF9GO2TR3Gw2
   msBLY0O1quZZsxEqP23Tk7p2tRb3e9LDcTPpau/xTPq2/bQBpZl5h+13u
   Q==;
X-CSE-ConnectionGUID: xu8qiJASQV6eBOLfdqT77g==
X-CSE-MsgGUID: 0LIuUtBoSqG/knUbKEWA/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17713349"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="17713349"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:43:27 -0700
X-CSE-ConnectionGUID: XYwI3YB6RTS6Kp9xhYRVvw==
X-CSE-MsgGUID: I78gk7t/QWmI3Hgclw0h6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41257037"
Received: from spandruv-desk.jf.intel.com ([10.54.75.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:43:26 -0700
Message-ID: <b0d758c495b7dd16076d896c41f5c38af48b863f.camel@linux.intel.com>
Subject: Re: [PATCH 2/2] HID: intel-ish-hid: add MODULE_DESCRIPTION()
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Jiri Kosina
 <jikos@kernel.org>,  Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Date: Mon, 03 Jun 2024 01:43:26 -0700
In-Reply-To: <20240525-kd-ishtp_wait_resume-v1-2-fec87a6f7916@quicinc.com>
References: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
	 <20240525-kd-ishtp_wait_resume-v1-2-fec87a6f7916@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, 2024-05-25 at 08:17 -0700, Jeff Johnson wrote:
> Fix the 'make W=3D1' warning:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/intel-
> ish-hid/intel-ishtp.o
>=20
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/hid/intel-ish-hid/ishtp/bus.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c
> b/drivers/hid/intel-ish-hid/ishtp/bus.c
> index f3042c4b8710..cc76b295b632 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/bus.c
> +++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
> @@ -932,4 +932,5 @@ static void __exit ishtp_bus_unregister(void)
> =C2=A0module_init(ishtp_bus_register);
> =C2=A0module_exit(ishtp_bus_unregister);
> =C2=A0
> +MODULE_DESCRIPTION("ISHTP bus driver");
> =C2=A0MODULE_LICENSE("GPL");
>=20


