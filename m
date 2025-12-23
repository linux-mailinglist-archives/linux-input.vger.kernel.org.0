Return-Path: <linux-input+bounces-16679-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1BDCD9F3A
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 17:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8AB53032712
	for <lists+linux-input@lfdr.de>; Tue, 23 Dec 2025 16:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43746327C0D;
	Tue, 23 Dec 2025 16:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k3XFCQ1z"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161832222A9;
	Tue, 23 Dec 2025 16:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766507145; cv=none; b=lDWK1QXH4lPOvJMpXj3UaXf+b86Q4YqX/JkkFXsHx6ElHofI4fIwY6cAYDwICx0Ic4Ay6Y/JhFul9m1QeEivPxG5E7LEKt/gWIj42+pe3z7UtigSIPc3kIRPuy8ylt+2A7IjwAR0I2C+sNRYWlsaAB0vjMtt2xt+kaLM92nedw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766507145; c=relaxed/simple;
	bh=ReiD3BfvzmQqYw+05JDtthhmY+pag9xTdTLmSaOvttA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dBGYzsqkQNHN/BWtbeYKJC4G0VX56gDz+4ZUYjgVbq5luDR5IUPZsrSZNtEU3otEu//cEvwgkmxwDtnHkfi/Pvbuq2xVO9FHgujFPurSmXGfcjMttucaEMpYOEWlAPQ28DMFKbsBQyrcMpfWYPFqLBxrgQZwjggRGt1Fzlv1nCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k3XFCQ1z; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766507133; x=1798043133;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ReiD3BfvzmQqYw+05JDtthhmY+pag9xTdTLmSaOvttA=;
  b=k3XFCQ1zjIV9n6X+OW9EorZUQURWhUJnTsH2SqprdoiSjgThU4ENXykC
   PXPLOEuvLotI39zXtcU5UNdHa5tvLzWi4lsinGyrlpoOov+kZTxruKvZa
   lNdZVGS6/WBgILPNrnKimU/lZ/QXe9ocLVxSdB7DI1N2GaLcIGG3F57y7
   qcZS99fjlZ1riXsUri0Mbrw53k5FO839yB0VoTDANiah8jn3VOmphqidJ
   pRq4sbDwvnJnXsFHeDrwvFczx8nensz+c1FnbvRjTs87bKWbqslZ6rlLG
   B9Wc5ae3/IiVjnBx/n1PWl2428B2cn16OM2AO9jPdtw0Eg9hAiqNITWp4
   w==;
X-CSE-ConnectionGUID: dO5dOaPdTDuXf3dgpn3k6w==
X-CSE-MsgGUID: HdIyEeV/QkqJgVOwXp44LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68293422"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68293422"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:25:31 -0800
X-CSE-ConnectionGUID: MEKvKWzKRyOJ0bjxVU50vQ==
X-CSE-MsgGUID: j1plzUj5ThC3ngWLxnDcNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="203947199"
Received: from spandruv-mobl5.amr.corp.intel.com (HELO [10.124.220.160]) ([10.124.220.160])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:25:30 -0800
Message-ID: <d4d4931e8c189ee5e87bf87d0090ca0c4f626e5b.camel@linux.intel.com>
Subject: Re: [PATCH v3 1/2] HID: intel-ish-hid: loader: Add
 PRODUCT_FAMILY-based firmware  matching
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Vishnu Sankar <vishnuocv@gmail.com>, jikos@kernel.org,
 bentiss@kernel.org, 	corbet@lwn.net, vsankar@lenovo.com
Cc: linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Richie Roy Jayme <rjayme.jp@gmail.com>
Date: Tue, 23 Dec 2025 08:25:29 -0800
In-Reply-To: <20251222080512.956519-1-vishnuocv@gmail.com>
References: <20251222080512.956519-1-vishnuocv@gmail.com>
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

    Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
> Changes in v3
> - Removed the duplicate defenition of ISH_FW_FILE_VENDOR_FAMILY_FMT
> ---
> Changes in v2
> - Indent corrected
> - More comments added
> ---
> =C2=A0drivers/hid/intel-ish-hid/ishtp/loader.c | 58
> +++++++++++++++++++++++-
> =C2=A01 file changed, 56 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c
> b/drivers/hid/intel-ish-hid/ishtp/loader.c
> index f34086b29cf0..ffa2042bb316 100644
> --- a/drivers/hid/intel-ish-hid/ishtp/loader.c
> +++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
> @@ -195,13 +195,19 @@ static int prepare_dma_bufs(struct ishtp_device
> *dev,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +/* Patterns with PRODUCT_FAMILY */
> +#define ISH_FW_FILE_VENDOR_FAMILY_NAME_SKU_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x_%08x.bin"
> +#define ISH_FW_FILE_VENDOR_FAMILY_SKU_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x.bin"
> +#define ISH_FW_FILE_VENDOR_FAMILY_NAME_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x.bin"
> +#define ISH_FW_FILE_VENDOR_FAMILY_FMT
> "intel/ish/ish_%s_%08x_%08x.bin"
> +
> =C2=A0#define ISH_FW_FILE_VENDOR_NAME_SKU_FMT
> "intel/ish/ish_%s_%08x_%08x_%08x.bin"
> =C2=A0#define ISH_FW_FILE_VENDOR_SKU_FMT "intel/ish/ish_%s_%08x_%08x.bin"
> =C2=A0#define ISH_FW_FILE_VENDOR_NAME_FMT "intel/ish/ish_%s_%08x_%08x.bin=
"
> =C2=A0#define ISH_FW_FILE_VENDOR_FMT "intel/ish/ish_%s_%08x.bin"
> =C2=A0#define ISH_FW_FILE_DEFAULT_FMT "intel/ish/ish_%s.bin"
> =C2=A0
> -#define ISH_FW_FILENAME_LEN_MAX 56
> +#define ISH_FW_FILENAME_LEN_MAX 72
> =C2=A0
> =C2=A0#define ISH_CRC_INIT (~0u)
> =C2=A0#define ISH_CRC_XOROUT (~0u)
> @@ -228,6 +234,12 @@ static int _request_ish_firmware(const struct
> firmware **firmware_p,
> =C2=A0 * for the given device in the following order, prioritizing custom
> firmware
> =C2=A0 * with more precise matching patterns:
> =C2=A0 *
> + *=C2=A0=C2=A0
> ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)
> + *=C2=A0=C2=A0 _$(PRODUCT_NAME_CRC32)_${PRODUCT_SKU_CRC32}.bin
> + *
> + *=C2=A0=C2=A0
> ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)_${PR
> ODUCT_SKU_CRC32}.bin
> + *=C2=A0=C2=A0
> ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32)_$(PR
> ODUCT_NAME_CRC32).bin
> + *=C2=A0=C2=A0
> ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_FAMILY_CRC32).bin
> =C2=A0 *=C2=A0=C2=A0
> ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32)_${PROD
> UCT_SKU_CRC32}.bin
> =C2=A0 *=C2=A0=C2=A0
> ish_${fw_generation}_${SYS_VENDOR_CRC32}_${PRODUCT_SKU_CRC32}.bin
> =C2=A0 *=C2=A0=C2=A0
> ish_${fw_generation}_${SYS_VENDOR_CRC32}_$(PRODUCT_NAME_CRC32).bin
> @@ -256,8 +268,9 @@ static int request_ish_firmware(const struct
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
> @@ -265,14 +278,55 @@ static int request_ish_firmware(const struct
> firmware **firmware_p,
> =C2=A0	sys_vendor =3D dmi_get_system_info(DMI_SYS_VENDOR);
> =C2=A0	product_name =3D dmi_get_system_info(DMI_PRODUCT_NAME);
> =C2=A0	product_sku =3D dmi_get_system_info(DMI_PRODUCT_SKU);
> +	product_family =3D dmi_get_system_info(DMI_PRODUCT_FAMILY);
> =C2=A0
> =C2=A0	if (sys_vendor)
> =C2=A0		vendor_crc =3D crc32(ISH_CRC_INIT, sys_vendor,
> strlen(sys_vendor)) ^ ISH_CRC_XOROUT;
> +	if (product_family)
> +		family_crc =3D crc32(ISH_CRC_INIT, product_family,
> +				=C2=A0=C2=A0 strlen(product_family)) ^
> ISH_CRC_XOROUT;
> =C2=A0	if (product_name)
> =C2=A0		name_crc =3D crc32(ISH_CRC_INIT, product_name,
> strlen(product_name)) ^ ISH_CRC_XOROUT;
> =C2=A0	if (product_sku)
> =C2=A0		sku_crc =3D crc32(ISH_CRC_INIT, product_sku,
> strlen(product_sku)) ^ ISH_CRC_XOROUT;
> =C2=A0
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
> +
> =C2=A0	if (sys_vendor && product_name && product_sku) {
> =C2=A0		snprintf(filename, sizeof(filename),
> ISH_FW_FILE_VENDOR_NAME_SKU_FMT, gen,
> =C2=A0			 vendor_crc, name_crc, sku_crc);

