Return-Path: <linux-input+bounces-15646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA17BF9406
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 01:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7796018C7819
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 23:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A4E26B75B;
	Tue, 21 Oct 2025 23:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRa/HhFF"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CEF29BD87
	for <linux-input@vger.kernel.org>; Tue, 21 Oct 2025 23:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761089724; cv=none; b=pIONEOFKF3dBACkqthldgi2AGzJqGMHIPQ9uo8iFyu9qVZAKI7mv9x99/uH2wAn1yT8yK4FppOxDlbau1gx4Tnn41Z3MSi6kcK/6MTltLmJJmxHYZSnLMNoS8y9IDr01wOoP8K8148rM6zYo7obUrDv51I79+azv3+Gyp8C/Yfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761089724; c=relaxed/simple;
	bh=tMJQqR5HgB+fqJpxC0KpZuhcQamoWx70k5uS+QxRvRc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XkgBgCt1XTsHU0gQO6shLLxCJrjQG3BH0b41VRTGnqmkp6B5CgFSjtL/HEK1lp3JZx9WOVXmwHvbq+5QDIcxaKzaG5IGuI37239D37eTfEyTp8nGd+kcv4y1dVn0/vhhEsXHbnh8sK2OHu6Buo3xg5gNORJeLDHbuw+rnJSOcCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRa/HhFF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761089722; x=1792625722;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=tMJQqR5HgB+fqJpxC0KpZuhcQamoWx70k5uS+QxRvRc=;
  b=fRa/HhFFg4qmfQ5KFDP0ThvcsKFD9z8FNH3gDxhyN4SiU0YmgUIes2wD
   sT5exItUPxYOCinWsGsGxRVIrv/i2dgu2Gh8t0JDlpnX131ntJwsWcCsc
   zhScpwV3ECJzv8tkLgInYajzzgugePIXxU+xhLtY9BIrNoWmvrfeMyfzI
   PdNFi6kZA2fOf4SVd+dFF5p8+9Mi3HciuqT4E38HtmsOO+PZay2yvEGzg
   QEaHy0X2lReAmSTGWONBY6jmxRGl5PjUz0rbg0nrP8S2ynK9qOMXIMY6C
   0qbCKaN6G8SLtmOkkWXKcTfwGMIo12YKR1RHuydgLjcQKIaB8esm45xCu
   Q==;
X-CSE-ConnectionGUID: I5699ELzTViuun2vxUKsvQ==
X-CSE-MsgGUID: phv/2ggfTAaobgI+qE+IOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80852133"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="80852133"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 16:35:21 -0700
X-CSE-ConnectionGUID: sc6S852oSfa2761F4y1y6g==
X-CSE-MsgGUID: +wFJ1APOT9mq1WGb+Nns9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="187991412"
Received: from uaeoff-desk2.amr.corp.intel.com ([10.125.108.176])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 16:35:21 -0700
Message-ID: <939f507b8e8d6768d42ed1d380500f3cd22aee88.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: Fix -Wcast-function-type-strict in
 devm_ishtp_alloc_workqueue()
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires
	 <bentiss@kernel.org>, Zhang Lixu <lixu.zhang@intel.com>
Cc: Kees Cook <kees@kernel.org>, linux-input@vger.kernel.org, 
	llvm@lists.linux.dev, patches@lists.linux.dev
Date: Tue, 21 Oct 2025 16:35:20 -0700
In-Reply-To: <20251022-ishtp-fix-function-cast-warn-v1-1-bfb06464f8ca@kernel.org>
References: 
	<20251022-ishtp-fix-function-cast-warn-v1-1-bfb06464f8ca@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-10-22 at 00:49 +0200, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=3Dy / W=3De):
>=20
> =C2=A0 drivers/hid/intel-ish-hid/ipc/ipc.c:935:36: error: cast from 'void
> (*)(struct workqueue_struct *)' to 'void (*)(void *)' converts to
> incompatible function type [-Werror,-Wcast-function-type-strict]
> =C2=A0=C2=A0=C2=A0 935 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if (devm_add_action_or_reset(dev, (void (*)(void
> *))destroy_workqueue,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =C2=A0 include/linux/device/devres.h:168:34: note: expanded from macro
> 'devm_add_action_or_reset'
> =C2=A0=C2=A0=C2=A0 168 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
__devm_add_action_or_ireset(dev, action, data,
> #action)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~
>=20
> This warning is pointing out a kernel control flow integrity (kCFI /
> CONFIG_CFI=3Dy) violation will occur due to this function cast when the
> destroy_workqueue() is indirectly called via devm_action_release()
> because the prototype of destroy_workqueue() does not match the
> prototype of (*action)().
>=20
> Use a local function with the correct prototype to wrap
> destroy_workqueue() to resolve the warning and CFI violation.
>=20
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2139
> Fixes: 0d30dae38fe0 ("HID: intel-ish-hid: Use dedicated unbound
> workqueues to prevent resume blocking")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/hid/intel-ish-hid/ipc/ipc.c | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ipc/ipc.c b/drivers/hid/intel-
> ish-hid/ipc/ipc.c
> index 59355e4a61f8..abf9c9a31c39 100644
> --- a/drivers/hid/intel-ish-hid/ipc/ipc.c
> +++ b/drivers/hid/intel-ish-hid/ipc/ipc.c
> @@ -924,6 +924,11 @@ static const struct ishtp_hw_ops ish_hw_ops =3D {
> =C2=A0	.dma_no_cache_snooping =3D _dma_no_cache_snooping
> =C2=A0};
> =C2=A0
> +static void ishtp_free_workqueue(void *wq)
> +{
> +	destroy_workqueue(wq);
> +}
> +
> =C2=A0static struct workqueue_struct *devm_ishtp_alloc_workqueue(struct
> device *dev)
> =C2=A0{
> =C2=A0	struct workqueue_struct *wq;
> @@ -932,8 +937,7 @@ static struct workqueue_struct
> *devm_ishtp_alloc_workqueue(struct device *dev)
> =C2=A0	if (!wq)
> =C2=A0		return NULL;
> =C2=A0
> -	if (devm_add_action_or_reset(dev, (void (*)(void
> *))destroy_workqueue,
> -				=C2=A0=C2=A0=C2=A0=C2=A0 wq))
> +	if (devm_add_action_or_reset(dev, ishtp_free_workqueue, wq))
> =C2=A0		return NULL;
> =C2=A0
> =C2=A0	return wq;
>=20
> ---
> base-commit: 828aeac92901c1f31b51ae0b9d792b9af5bd3e27
> change-id: 20251021-ishtp-fix-function-cast-warn-660d3dae8af4
>=20
> Best regards,
> --=C2=A0=20
> Nathan Chancellor <nathan@kernel.org>
>=20


