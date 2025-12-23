Return-Path: <linux-input+bounces-16680-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3F4CD9F34
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 17:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BA7913001638
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 16:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B009227BA4;
	Tue, 23 Dec 2025 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FBPdTSM/"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE02773C3;
	Tue, 23 Dec 2025 16:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507177; cv=none; b=W1CRmi0YtapjZ+ibUWW02NZyhmSnnJUFj4QjPK1IEx6LgSchbfe3KyLvE3NNGhTeMWFmKvzlsdFpXJR5yFyseaJsVWa114F9hTYhDbxagiJ/xPbMQTfQdA3f6WmjMXZl50q2hz8WdDOqlW2a66W+cBdQmUTukHWkYxv2JGrM6r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507177; c=relaxed/simple;
	bh=661SOfQrxKC5CoW8V4trWYwJmaK3ezqXf07VFvR/ErI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lc9tQof1usaXblGLcUXTt21K+AXpg/Fg6Mewh7kn5apNl9DPGq7a5Mf06QqQsAXcXrKPlYXBbf1a7TctVedKX5CWYPrqvMctu8W3LVYL+O0qgeA44Z5t7BbWeJjEfPRXANO/A2LTROL80e2iNdlUu+WZGabUy0z/xXjLDTg1mDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FBPdTSM/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766507175; x=1798043175;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=661SOfQrxKC5CoW8V4trWYwJmaK3ezqXf07VFvR/ErI=;
  b=FBPdTSM/POWmQ5O9tPhyUjNinm659dCRGXW0kC/gEyUiv0jBmQczCd9v
   gVOp3D/wEYQeKh4sjSAyWQWWwHdGKaS3LB/6W3tPhAk0lGos+sb2TltUk
   PSQ7dRsSFcKx+WLaPJ4mkH/TqvVoE2p94fOHLziT/P9Xy7grp/VCGXsSD
   4XxFHa4f5t6rMeAuInCqw0j5/qJFeHajyJLVpmhEAlZVjqkW6fZP5Yehj
   ijYwRE19pZoXFVZIuLZBWIZhjTywASFUgw6k3imTndObFeGUN5GUaZK1i
   29Ik3bK87PrzqxROORnAFtQZjeaZYYwJN0j/xOiKYNR1FuuMN2SdjnrPH
   A==;
X-CSE-ConnectionGUID: 0ImHwIhvQAe57EMl7SGyXw==
X-CSE-MsgGUID: ry7VimQAS36JJxpYw8cBqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="70935188"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="70935188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:26:14 -0800
X-CSE-ConnectionGUID: nt7cF4AeRQiRGxS28KWb2Q==
X-CSE-MsgGUID: s9cn0VC2RZ2mPIKg9QLGcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="200713271"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.124.220.160]) ([10.124.220.160])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:26:14 -0800
Message-ID: <703b926724cb988d9a5724cdc238c5c81b4de886.camel@linux.intel.com>
Subject: Re: [PATCH v3 2/2] Documentation: hid: intel-ish-hid: Document
 PRODUCT_FAMILY firmware matching
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, jikos@kernel.org,
 bentiss@kernel.org, 	corbet@lwn.net, vsankar@lenovo.com
Cc: linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 23 Dec 2025 08:26:12 -0800
In-Reply-To: <20251222080512.956519-2-vishnuocv@gmail.com>
References: <20251222080512.956519-1-vishnuocv@gmail.com>
	 <20251222080512.956519-2-vishnuocv@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-12-22 at 17:05 +0900, Vishnu Sankar wrote:
> Document the ISH firmware filename matching rules, including the
> new PRODUCT_FAMILY-based patterns and their search order.
>=20
> This aligns the documentation with the driver behavior and provides
> clear guidance for vendors supplying custom ISH firmware.
>=20
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>

    Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> =C2=A0Documentation/hid/intel-ish-hid.rst | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/hid/intel-ish-hid.rst
> b/Documentation/hid/intel-ish-hid.rst
> index 2adc174fb576..068a5906b177 100644
> --- a/Documentation/hid/intel-ish-hid.rst
> +++ b/Documentation/hid/intel-ish-hid.rst
> @@ -413,6 +413,10 @@ Vendors who wish to upstream their custom
> firmware should follow these guideline
> =C2=A0
> =C2=A0- The firmware filename should use one of the following patterns:
> =C2=A0
> +=C2=A0 -
> ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_$
> {PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
> +=C2=A0 -
> ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_$
> {PRODUCT_SKU_CRC32}.bin``
> +=C2=A0 -
> ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}_$
> {PRODUCT_NAME_CRC32}.bin``
> +=C2=A0 -
> ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMILY_CRC32}.b
> in``
> =C2=A0=C2=A0 -
> ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}_${P
> RODUCT_SKU_CRC32}.bin``
> =C2=A0=C2=A0 -
> ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin`
> `
> =C2=A0=C2=A0 -
> ``ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_CRC32}.bin
> ``
> @@ -420,16 +424,21 @@ Vendors who wish to upstream their custom
> firmware should follow these guideline
> =C2=A0
> =C2=A0- ``${intel_plat_gen}`` indicates the Intel platform generation
> (e.g., ``lnlm`` for Lunar Lake) and must not exceed 8 characters in
> length.
> =C2=A0- ``${SYS_VENDOR_CRC32}`` is the CRC32 checksum of the
> ``sys_vendor`` value from the DMI field ``DMI_SYS_VENDOR``.
> +- ``${PRODUCT_FAMILY_CRC32}`` is the CRC32 checksum of the
> ``product_family`` value from the DMI field ``DMI_PRODUCT_FAMILY``.
> =C2=A0- ``${PRODUCT_NAME_CRC32}`` is the CRC32 checksum of the
> ``product_name`` value from the DMI field ``DMI_PRODUCT_NAME``.
> =C2=A0- ``${PRODUCT_SKU_CRC32}`` is the CRC32 checksum of the
> ``product_sku`` value from the DMI field ``DMI_PRODUCT_SKU``.
> =C2=A0
> =C2=A0During system boot, the ISH Linux driver will attempt to load the
> firmware in the following order, prioritizing custom firmware with
> more precise matching patterns:
> =C2=A0
> -1.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_
> CRC32}_${PRODUCT_SKU_CRC32}.bin``
> -2.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_C
> RC32}.bin``
> -3.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_
> CRC32}.bin``
> -4. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
> -5. ``intel/ish/ish_${intel_plat_gen}.bin``
> +1.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMIL
> Y_CRC32}_${PRODUCT_NAME_CRC32}_${PRODUCT_SKU_CRC32}.bin``
> +2.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMIL
> Y_CRC32}_${PRODUCT_SKU_CRC32}.bin``
> +3.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMIL
> Y_CRC32}_${PRODUCT_NAME_CRC32}.bin``
> +4.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_FAMIL
> Y_CRC32}.bin``
> +5.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_
> CRC32}_${PRODUCT_SKU_CRC32}.bin``
> +6.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_C
> RC32}.bin``
> +7.
> ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}_${PRODUCT_NAME_
> CRC32}.bin``
> +8. ``intel/ish/ish_${intel_plat_gen}_${SYS_VENDOR_CRC32}.bin``
> +9. ``intel/ish/ish_${intel_plat_gen}.bin``
> =C2=A0
> =C2=A0The driver will load the first matching firmware and skip the rest.
> If no matching firmware is found, it will proceed to the next pattern
> in the specified order. If all searches fail, the default Intel
> firmware, listed last in the order above, will be loaded.
> =C2=A0

