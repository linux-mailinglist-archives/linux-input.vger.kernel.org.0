Return-Path: <linux-input+bounces-8822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813F99FEA5C
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2024 20:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 529501883536
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2024 19:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F38191F74;
	Mon, 30 Dec 2024 19:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtXzOW98"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18A92EAD0;
	Mon, 30 Dec 2024 19:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735587426; cv=none; b=i4gagtBjqCrDcOHnTS8X+/o4GE8++/+q8lusmOfxBVgCM4IQ6hwwvfSMix7Ry0nVFF3Pz18UvPVL0F/go7LvfeeGN3aMZWtV/+/bLGkS1N2+TNvHlG16qsJPFcqzA18vl9aYaSmOumTcy+mjKgZ24LpAIrc5pf3fOZq+939L4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735587426; c=relaxed/simple;
	bh=hcD3hQhqQaTxECM9Jn39OrNH51WOSiZYjSikhAunMXo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d1OBvmGpbY51f1qBAPJG4GdTJ7+CLM2JnJQwVgniViezrnIdDWL2KAdI7Ib0LRV56BzBj2Y4sg7AHp1IFnwlnTwvD24MnPCZdJ0WQZEHSpN2J01nm9ixENrFaIrDpTbTI2A/24wOXwT7D8mmKXvmOBMFdqFge/j4aIgsF34LBCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtXzOW98; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735587424; x=1767123424;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=hcD3hQhqQaTxECM9Jn39OrNH51WOSiZYjSikhAunMXo=;
  b=NtXzOW98uPGnneuKAtab5qdF2LZWkeD8OsPIiyKQL46mLnTdYtaAPdbS
   G9lQ+57sQcYkdY1GvgTlfZ0ZBbubPAFsEaMXc82yiF2K5EZI/w0F5X4+y
   6z5Y2zAnFDDNI+opJvrlnHaug9LH4CvPzfx/Wx7WNCpkKEBi/15/CSZF8
   8YYNu49vqrPcJed+Uj7xsNxt2i3H5SZpAC2zp5GSxsfqlLzdNDqTBjEZK
   uas3ZLptvXu8YebxgZTs54pixpvhGkLV7reSF5l+ronkQVbtNB97oLbgI
   i6Gf/K/xgkRa8k1AvVofAOmflK7gW0Z8J+JCPUZe3IAbKx5O2GcNYVM68
   Q==;
X-CSE-ConnectionGUID: Pt/DEHAbQK+1rBTF9ASSeg==
X-CSE-MsgGUID: 6ZcgaEI8Qb6ZkH0jbg/kPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39649193"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; 
   d="scan'208";a="39649193"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 11:37:04 -0800
X-CSE-ConnectionGUID: XAlEnZMpR6uUC5+8D4rUQA==
X-CSE-MsgGUID: ZCw6QQNVRPmo5ujQBNzg1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131811505"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 11:37:03 -0800
Message-ID: <d95d2951a6ab595d9e5cdb24eeb577e243b543d9.camel@linux.intel.com>
Subject: Re: [PATCH 0/3] HID: intel-ish-hid: deadcoding
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: linux@treblig.org, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Mon, 30 Dec 2024 11:37:02 -0800
In-Reply-To: <20241225015509.458032-1-linux@treblig.org>
References: <20241225015509.458032-1-linux@treblig.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-12-25 at 01:55 +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>=20
> Hohoho!
>=20
> Please find a small series of deadcode cleanups for functions
> that were added many years ago but haven't been used.
>=20
> Build tested only.
>=20
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

>=20
>=20
> Dr. David Alan Gilbert (3):
> =C2=A0 HID: intel-ish-hid: Remove unused ishtp_dev_state_str
> =C2=A0 HID: intel-ish-hid: Remove unused ishtp_cl_tx_empty
> =C2=A0 HID: intel-ish-hid: Remove unused ishtp_cl_get_tx_*
>=20
> =C2=A0.../hid/intel-ish-hid/ishtp/client-buffers.c=C2=A0 | 21 -----------=
--
> =C2=A0drivers/hid/intel-ish-hid/ishtp/client.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 19 ------------
> =C2=A0drivers/hid/intel-ish-hid/ishtp/client.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 --
> =C2=A0drivers/hid/intel-ish-hid/ishtp/init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 30 -----------------
> --
> =C2=A0drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A0include/linux/intel-ish-client-if.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 -
> =C2=A06 files changed, 74 deletions(-)
>=20


