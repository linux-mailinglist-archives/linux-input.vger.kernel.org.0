Return-Path: <linux-input+bounces-4040-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA88D7DA0
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 10:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1574B2832CF
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 08:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BFA6D1B5;
	Mon,  3 Jun 2024 08:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GE+wB6Pb"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A274C6F06A;
	Mon,  3 Jun 2024 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404182; cv=none; b=kCnXx+DBr6zXBhZozl1kYyZQOMxoyRF0MEZoEGqj0BDkYtYjV0bLiMVkKM6D/5yHJwe5++q7CZ0HzsUatWBJQIT6/2XRlP0NgsmqT/1qNeLtFYQys5Zb/8m6nXrGEAqBiR2BzB6yezAaaH7s2KiV7qnaaxMrRTDxcGwG9xMiKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404182; c=relaxed/simple;
	bh=gKs4DdfZHlvyEPMtQDrBrynyC/04fa5B4e8ZrojMzsA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YX0VH0fFwT6dA5YbCu9ZpA8+/ncysxC0nQGFwTUe+QHcQtzEdETkJfCP7NfV2bCFdy924vGZ/CKqAHf127KKVNZgHNCIqD9BMQ07KgxRIGmMg/xj+EcmQKuszYSGO2aLwuiKmZgtIg6ml3OiCLrrbSa0SjN9zdprdgqHnq4gwyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GE+wB6Pb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717404181; x=1748940181;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=gKs4DdfZHlvyEPMtQDrBrynyC/04fa5B4e8ZrojMzsA=;
  b=GE+wB6Pb9i0uhxSVvlELMAYwag2dPyR1btlgoXkNd1yAjUBsE66vwzaW
   pOmpJf0h3MZ9IjCB/5bVVSVfCQXY+mICdOMIl/VvOYGKWjfpEzUtk4c6O
   BNOv4opPxIXdFHOfLKJnuEbNQ8I5aHUN0tbYbJF2sQ5azsj0BXhwOLX+i
   A1JvuKy3mpztZfzA/taBKb1AHGW0ayqgvNQRxlrF9Z04LBCoxjRI8NfRu
   Q3ZrouSQdv1OOa6zLpXAX8OU1BHtt4pIoSxdQGCrzVoVKq4okbKWIy0py
   J9605kpgxMy8ojPc37YVhg3zCO4KhQIAsTOjmRBDWn1z7rIgnYMhyEoSI
   w==;
X-CSE-ConnectionGUID: LYoLzzW2Tv6D72nXBli+Kw==
X-CSE-MsgGUID: VK/m07uFR02U6Gstv9lPlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="17713271"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="17713271"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:43:00 -0700
X-CSE-ConnectionGUID: vEwPwksMSMOWtp3wyZy6qA==
X-CSE-MsgGUID: ayqCtxtwRLqWP02qGbB2IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="41256952"
Received: from spandruv-desk.jf.intel.com ([10.54.75.19])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:42:59 -0700
Message-ID: <caaf913e7862f28783572e64cdc445669a9adb62.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] HID: intel-ish-hid: fix ishtp_wait_resume()
 kernel-doc
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Jiri Kosina
 <jikos@kernel.org>,  Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kernel test robot <lkp@intel.com>
Date: Mon, 03 Jun 2024 01:42:59 -0700
In-Reply-To: <20240525-kd-ishtp_wait_resume-v1-1-fec87a6f7916@quicinc.com>
References: <20240525-kd-ishtp_wait_resume-v1-0-fec87a6f7916@quicinc.com>
	 <20240525-kd-ishtp_wait_resume-v1-1-fec87a6f7916@quicinc.com>
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
> Fix the 'make W=3D1' kernel-doc warning:
>=20
> drivers/hid/intel-ish-hid/ishtp/bus.c:853: warning: Function
> parameter or struct member 'dev' not described in 'ishtp_wait_resume'
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202311060843.dXENYlGc-lkp@intel.com=
/
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0drivers/hid/intel-ish-hid/ishtp/bus.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c
> b/drivers/hid/intel-ish-hid/ishtp/bus.c
> index 03d5601ce807..f3042c4b8710 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/bus.c
> +++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
> @@ -844,6 +844,7 @@ EXPORT_SYMBOL(ishtp_device);
> =C2=A0
> =C2=A0/**
> =C2=A0 * ishtp_wait_resume() - Wait for IPC resume
> + * @dev: ishtp device
> =C2=A0 *
> =C2=A0 * Wait for IPC resume
> =C2=A0 *
>=20


