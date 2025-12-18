Return-Path: <linux-input+bounces-16626-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D0CCCC33
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 17:29:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 434E731005B0
	for <lists+linux-input@lfdr.de>; Thu, 18 Dec 2025 16:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24522358D08;
	Thu, 18 Dec 2025 15:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="je2aV1an"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FBE2494F0;
	Thu, 18 Dec 2025 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766073450; cv=none; b=QcCVNEgLk0nh7gY6OW652x7EXrkoYW6Cx04qFrOIGqfClwiOV6PnHUSGWz35/dgEGRPT2L9ENhRwa6cbjTpcyamBqb1HKi3Q+Pms6jHrd5pBJtscA+lhlitU0/bE9sSFSGIRoE0MgrcvDS5LBp5xxDNcUYQJN7pjhcyPVBFGQ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766073450; c=relaxed/simple;
	bh=NZuGz23tFK8P+bO7U1OtC58X87ywfSWmuMee/MV701c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KlEMnK601FxWHUiPKbhy9xKrIGLAoVCum4371jE+04XCtxmm8dvfXsLN/xS7JExpP+ZMMyIECnj5yDJmWEsbilCJfSbRSaHns7+j6LQURn1X3pUEiOPIPSJIrroAdcIE8u3YnZLKhAOu5+LAD00l3ybtdqcUoBPt0XAHz8K4EG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=je2aV1an; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766073448; x=1797609448;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=NZuGz23tFK8P+bO7U1OtC58X87ywfSWmuMee/MV701c=;
  b=je2aV1anvCHFfxH7PS60RLM4xPZJdCw0WZEnvk9+ehdg4YrzBvOTlYKD
   /EyiJzQIPvHnGTGe2TOEljLDa3Hygb9iAN1fQWkP1aYgXmaYdE9U71uPn
   UW0I/8f/UMU5PqijqQNGSIYnjTSvx1VpFPxnzpNixb4qsLpzgBQv4DBHo
   yFkvUTfrpq4rqrNmjIMNnQr9CnMkMwbhNUHD9mNjhPgI0vOWuF/aKOtBf
   XAHLkMYGDaQPkS/CVPoln5z3dFybaXbezIlvqDdA6l0TnOBsEiTS0JSSQ
   eWc21Er/X2W1pN2mnwKst66p0hsgxm5bTW7Ns8IOvBng3DqyMGKgCGmMD
   w==;
X-CSE-ConnectionGUID: 5xeLW115QAaFDGtuEELpTg==
X-CSE-MsgGUID: LQO9PGMHTouDjvLysNU42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68072462"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="68072462"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:54:47 -0800
X-CSE-ConnectionGUID: GpcG3q4ORSSZNx2pg3+uqw==
X-CSE-MsgGUID: HcQPjryVTEOOQneGBdr0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203517309"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.124.223.203]) ([10.124.223.203])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 07:54:46 -0800
Message-ID: <950d627dc280af94a1073da7938a6f2a09e31e34.camel@linux.intel.com>
Subject: Re: [PATCH] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based
 firmware matching
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, jikos@kernel.org,
 bentiss@kernel.org, 	vsankar@lenovo.com, "Zhang, Lixu"
 <lixu.zhang@intel.com>, Even Xu	 <even.xu@intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Pearson
	 <mpearson-lenovo@squebb.ca>, Richie Roy Jayme <rjayme.jp@gmail.com>
Date: Thu, 18 Dec 2025 07:54:44 -0800
In-Reply-To: <20251218140003.636901-1-vishnuocv@gmail.com>
References: <20251218140003.636901-1-vishnuocv@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

+ Lixu
+ Even


On Thu, 2025-12-18 at 23:00 +0900, Vishnu Sankar wrote:
> Add support for firmware filenames that include the CRC32 checksum of
> the
> DMI product_family field. Several OEMs ship ISH firmware variants
> shared
> across a product family while product_name or product_sku may differ.
> This
> intermediate matching granularity reduces duplication and improves
> firmware
> selection for vendor-customized platforms.
>=20
> The newly supported filename forms are checked before existing
> patterns:
>=20
> =C2=A0 ish_${gen}_${vendor}_${family}_${name}_${sku}.bin
> =C2=A0 ish_${gen}_${vendor}_${family}_${sku}.bin
> =C2=A0 ish_${gen}_${vendor}_${family}_${name}.bin
> =C2=A0 ish_${gen}_${vendor}_${family}.bin
>=20
> The legacy product_name/product_sku rules remain unchanged and
> continue
> to provide fallback matching.
>=20
> ISH_FW_FILENAME_LEN_MAX is changed to 72 to accommodate the
> product_family.
>=20
> Tested with X9 series and X1 series.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Tested-by: Richie Roy Jayme <rjayme.jp@gmail.com>
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> ---
> =C2=A0drivers/hid/intel-ish-hid/ishtp/loader.c | 50
> +++++++++++++++++++++++-
> =C2=A01 file changed, 48 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c
> b/drivers/hid/intel-ish-hid/ishtp/loader.c
> index f34086b29cf0..4559d460fd83 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/loader.c
> +++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
> @@ -194,6 +194,11 @@ static int prepare_dma_bufs(struct ishtp_device
> *dev,
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> +/* Patterns with PRODUCT_FAMILY */
> +#define ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x_%08x.bin"
> +#define ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x.bin"
> +#define ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x.bin"
> +#define ISH_FW_FILE_VENDOR_FAMILY_FMT
> "intel/ish/ish_%s_%08x_%08x.bin"
> =C2=A0
> =C2=A0#define ISH_FW_FILE_VENDOR_NAME_SKU_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x.bin"
> =C2=A0#define ISH_FW_FILE_VENDOR_SKU_FMT "intel/ish/ish_%s_%08x_%08x.bin"
> @@ -201,7 +206,7 @@ static int prepare_dma_bufs(struct ishtp_device
> *dev,
> =C2=A0#define ISH_FW_FILE_VENDOR_FMT "intel/ish/ish_%s_%08x.bin"
> =C2=A0#define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
> =C2=A0
> -#define ISH_FW_FILENAME_LEN_MAX 56
> +#define ISH_FW_FILENAME_LEN_MAX 72
> =C2=A0
> =C2=A0#define ISH_CRC_INIT (~0u)
> =C2=A0#define ISH_CRC_XOROUT (~0u)
> @@ -256,8 +261,9 @@ static int request_ish_firmware(const struct
> firmware **firmware_p,
> =C2=A0				struct device *dev)
> =C2=A0{
> =C2=A0	const char *gen, *sys_vendor, *product_name, *product_sku;
> +	const char *product_family;
> =C2=A0	struct ishtp_device *ishtp =3D dev_get_drvdata(dev);
> -	u32 vendor_crc, name_crc, sku_crc;
> +	u32 vendor_crc, name_crc, sku_crc, family_crc;
> =C2=A0	char filename[ISH_FW_FILENAME_LEN_MAX];
> =C2=A0	int ret;
> =C2=A0
> @@ -265,6 +271,7 @@ static int request_ish_firmware(const struct
> firmware **firmware_p,
> =C2=A0	sys_vendor =3D dmi_get_system_info(DMI_SYS_VENDOR);
> =C2=A0	product_name =3D dmi_get_system_info(DMI_PRODUCT_NAME);
> =C2=A0	product_sku =3D dmi_get_system_info(DMI_PRODUCT_SKU);
> +	product_family =3D dmi_get_system_info(DMI_PRODUCT_FAMILY);
> =C2=A0
> =C2=A0	if (sys_vendor)
> =C2=A0		vendor_crc =3D crc32(ISH_CRC_INIT, sys_vendor,
> strlen(sys_vendor)) ^ ISH_CRC_XOROUT;
> @@ -272,6 +279,45 @@ static int request_ish_firmware(const struct
> firmware **firmware_p,
> =C2=A0		name_crc =3D crc32(ISH_CRC_INIT, product_name,
> strlen(product_name)) ^ ISH_CRC_XOROUT;
> =C2=A0	if (product_sku)
> =C2=A0		sku_crc =3D crc32(ISH_CRC_INIT, product_sku,
> strlen(product_sku)) ^ ISH_CRC_XOROUT;
> +	if (product_family)
> +		family_crc =3D crc32(ISH_CRC_INIT, product_family,
> strlen(product_family)) ^ ISH_CRC_XOROUT;
> +
> +	/* PRODUCT_FAMILY-extended matching */
> +	if (sys_vendor && product_family && product_name &&
> product_sku) {
> +		snprintf(filename, sizeof(filename),
> +			 ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT,
> +			 gen, vendor_crc, family_crc, name_crc,
> sku_crc);
> +		ret =3D _request_ish_firmware(firmware_p, filename,
> dev);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	if (sys_vendor && product_family && product_sku) {
> +		snprintf(filename, sizeof(filename),
> +			 ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT,
> +			 gen, vendor_crc, family_crc, sku_crc);
> +		ret =3D _request_ish_firmware(firmware_p, filename,
> dev);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	if (sys_vendor && product_family && product_name) {
> +		snprintf(filename, sizeof(filename),
> +			 ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT,
> +			 gen, vendor_crc, family_crc, name_crc);
> +		ret =3D _request_ish_firmware(firmware_p, filename,
> dev);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	if (sys_vendor && product_family) {
> +		snprintf(filename, sizeof(filename),
> +			 ISH_FW_FILE_VENDOR_FAMILY_FMT,
> +			 gen, vendor_crc, family_crc);
> +		ret =3D _request_ish_firmware(firmware_p, filename,
> dev);
> +		if (!ret)
> +			return 0;
> +}
> =C2=A0
> =C2=A0	if (sys_vendor && product_name && product_sku) {
> =C2=A0		snprintf(filename, sizeof(filename),
> ISH_FW_FILE_VENDOR_NAME_SKU_FMT, gen,

