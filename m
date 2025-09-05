Return-Path: <linux-input+bounces-14515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CA374B462C7
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 20:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 762BA1894526
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 18:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBCB371EB0;
	Fri,  5 Sep 2025 18:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ByRW68pz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D77309F13;
	Fri,  5 Sep 2025 18:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098138; cv=none; b=SaeqX9obd9XbaynES1VdT9lrHoJxy8PfD1cpQy89Fe3KKbyhy9xrj8FTp8jrZ8+LjIfB7IQfnw12Pmfvh9RRhfBMfBUWno3QBf6DR3Pv2khsaJXZ8dZ0QHj6aIgeDE1cLqd0bghRh9oZyG+f9jAhrRnfnRHFDx/9zqzt1/R93l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098138; c=relaxed/simple;
	bh=Dp5RmIYk2nbwxrj985ZZ3tn3G9Tpdw2szPFrfRBiizM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bZBGgn/uqN0vL6sj25zS0vT8chcacqsXJO6rAb+yGhfmp7jFqu3jVF0SDtAD3T10fItwz1dtCUUyPQG1tKZuCs6dniuCAPmY9knDcLmTLNdby3CVATvB83gfWAjZQf78/tKuN5KyaqHkyQ5X7shSjjcsrYymSNEQwqic+cM7IsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ByRW68pz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757098136; x=1788634136;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Dp5RmIYk2nbwxrj985ZZ3tn3G9Tpdw2szPFrfRBiizM=;
  b=ByRW68pzynt8P6JuKF7RQKKyrsar46kNbAn19cF1fde75lPp0iEm68tp
   WGf4dXkmNpin+oNAtntXecjl7Glbdc3Td8l/xATBvWVslz1eEKMMiHAOj
   SUlMym20496BbLSVFPeYURFcQGV98iW7zHkfs5zNwsdIGbNgWTMizhsL7
   QQVZGLg7mG96mrIPvWjx7tJjyO4kXKO2d6Auo54zEF3oqGrzhw1tiNDmZ
   TNMNV5zLZoWifBMOE3qOSGR1Y1u2g7r62SzIuh2XBKNYxNnUamcPO5UHP
   CShNlFccf5EZ5gCBFbu6x/WsaAUpRn3LZcEITPP65Hp+NiSzizs8LwEjk
   w==;
X-CSE-ConnectionGUID: 7QcyZHXdTv2sLrp/141qlg==
X-CSE-MsgGUID: n+nz4hupRN+d8Ta1mD6qYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82045546"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="82045546"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 11:48:55 -0700
X-CSE-ConnectionGUID: rVFh1n2zQTGYFHzw4m+qyw==
X-CSE-MsgGUID: 3foXpiZmQRCGBOvJLfl+Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="203158361"
Received: from spandruv-desk2.jf.intel.com (HELO [10.98.25.49]) ([10.98.25.49])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 11:48:55 -0700
Message-ID: <5c83a18128bbc0b8cfd6900439e7349250732659.camel@linux.intel.com>
Subject: Re: [PATCH RESEND v2] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Xinpeng Sun <xinpeng.sun@intel.com>, jikos@kernel.org, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, Rui Zhang
	 <rui1.zhang@intel.com>
Date: Fri, 05 Sep 2025 09:54:36 -0700
In-Reply-To: <20250905013935.1356008-1-xinpeng.sun@intel.com>
References: <20250905013935.1356008-1-xinpeng.sun@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-09-05 at 09:39 +0800, Xinpeng Sun wrote:
> There is a new BIOS enhancement that adds the capability to configure
> the
> following two features of I2C subsystem introduced in commit 1ed0b48
> ("Intel-thc: Introduce max input size control") and commit 3f2a921
> ("Intel-thc: Introduce interrupt delay control"):
> - Max input size control
> - Interrupt delay control
>=20
> As BIOS is used for the configuration of these two features, change
> driver
> data usage to indicate hardware capability, and add corresponding
> ACPI
> configuration support in QuickI2C driver.
>=20
> Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
> Tested-by: Rui Zhang <rui1.zhang@intel.com>
> ---
>=20
Why the patch was resent?

If maintainer didn't review, just remind them after atleast 2 weeks
instead of sending again.

For any other reason add some change log here.

Thanks,
Srinivas



> =C2=A0.../intel-quicki2c/pci-quicki2c.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 43 ++++++++++++++---
> --
> =C2=A0.../intel-quicki2c/quicki2c-dev.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24 ++++++++++-
> =C2=A02 files changed, 55 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index 854926b3cfd4..787c32557d24 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -23,6 +23,7 @@
> =C2=A0
> =C2=A0static struct quicki2c_ddata ptl_ddata =3D {
> =C2=A0	.max_detect_size =3D MAX_RX_DETECT_SIZE_PTL,
> +	.max_interrupt_delay =3D MAX_RX_INTERRUPT_DELAY,
> =C2=A0};
> =C2=A0
> =C2=A0/* THC QuickI2C ACPI method to get device properties */
> @@ -123,8 +124,8 @@ static int quicki2c_acpi_get_dsd_property(struct
> acpi_device *adev, acpi_string
> =C2=A0static int quicki2c_get_acpi_resources(struct quicki2c_device
> *qcdev)
> =C2=A0{
> =C2=A0	struct acpi_device *adev =3D ACPI_COMPANION(qcdev->dev);
> -	struct quicki2c_subip_acpi_parameter i2c_param;
> -	struct quicki2c_subip_acpi_config i2c_config;
> +	struct quicki2c_subip_acpi_parameter i2c_param =3D {0};
> +	struct quicki2c_subip_acpi_config i2c_config =3D {0};
> =C2=A0	u32 hid_desc_addr;
> =C2=A0	int ret =3D -EINVAL;
> =C2=A0
> @@ -200,6 +201,21 @@ static int quicki2c_get_acpi_resources(struct
> quicki2c_device *qcdev)
> =C2=A0		return -EOPNOTSUPP;
> =C2=A0	}
> =C2=A0
> +	if (qcdev->ddata) {
> +		qcdev->i2c_max_frame_size_enable =3D i2c_config.FSEN;
> +		qcdev->i2c_int_delay_enable =3D i2c_config.INDE;
> +
> +		if (i2c_config.FSVL <=3D qcdev->ddata-
> >max_detect_size)
> +			qcdev->i2c_max_frame_size =3D i2c_config.FSVL;
> +		else
> +			qcdev->i2c_max_frame_size =3D qcdev->ddata-
> >max_detect_size;
> +
> +		if (i2c_config.INDV <=3D qcdev->ddata-
> >max_interrupt_delay)
> +			qcdev->i2c_int_delay =3D i2c_config.INDV;
> +		else
> +			qcdev->i2c_int_delay =3D qcdev->ddata-
> >max_interrupt_delay;
> +	}
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -441,17 +457,24 @@ static void quicki2c_dma_adv_enable(struct
> quicki2c_device *qcdev)
> =C2=A0	 * max input length <=3D THC detect capability, enable the
> feature with device
> =C2=A0	 * max input length.
> =C2=A0	 */
> -	if (qcdev->ddata->max_detect_size >=3D
> -	=C2=A0=C2=A0=C2=A0 le16_to_cpu(qcdev->dev_desc.max_input_len)) {
> -		thc_i2c_set_rx_max_size(qcdev->thc_hw,
> -					le16_to_cpu(qcdev-
> >dev_desc.max_input_len));
> +	if (qcdev->i2c_max_frame_size_enable) {
> +		if (qcdev->i2c_max_frame_size >=3D
> +		=C2=A0=C2=A0=C2=A0 le16_to_cpu(qcdev->dev_desc.max_input_len)) {
> +			thc_i2c_set_rx_max_size(qcdev->thc_hw,
> +						le16_to_cpu(qcdev-
> >dev_desc.max_input_len));
> +		} else {
> +			dev_warn(qcdev->dev,
> +				 "Max frame size is smaller than hid
> max input length!");
> +			thc_i2c_set_rx_max_size(qcdev->thc_hw,
> +						le16_to_cpu(qcdev-
> >i2c_max_frame_size));
> +		}
> =C2=A0		thc_i2c_rx_max_size_enable(qcdev->thc_hw, true);
> =C2=A0	}
> =C2=A0
> =C2=A0	/* If platform supports interrupt delay feature, enable it
> with given delay */
> -	if (qcdev->ddata->interrupt_delay) {
> +	if (qcdev->i2c_int_delay_enable) {
> =C2=A0		thc_i2c_set_rx_int_delay(qcdev->thc_hw,
> -					 qcdev->ddata-
> >interrupt_delay);
> +					 qcdev->i2c_int_delay * 10);
> =C2=A0		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, true);
> =C2=A0	}
> =C2=A0}
> @@ -464,10 +487,10 @@ static void quicki2c_dma_adv_enable(struct
> quicki2c_device *qcdev)
> =C2=A0 */
> =C2=A0static void quicki2c_dma_adv_disable(struct quicki2c_device *qcdev)
> =C2=A0{
> -	if (qcdev->ddata->max_detect_size)
> +	if (qcdev->i2c_max_frame_size_enable)
> =C2=A0		thc_i2c_rx_max_size_enable(qcdev->thc_hw, false);
> =C2=A0
> -	if (qcdev->ddata->interrupt_delay)
> +	if (qcdev->i2c_int_delay_enable)
> =C2=A0		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, false);
> =C2=A0}
> =C2=A0
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> index d412eafcf9ea..0d423d5dd7a7 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> @@ -38,6 +38,8 @@
> =C2=A0
> =C2=A0/* PTL Max packet size detection capability is 255 Bytes */
> =C2=A0#define MAX_RX_DETECT_SIZE_PTL			255
> +/* Max interrupt delay capability is 2.56ms */
> +#define MAX_RX_INTERRUPT_DELAY			256
> =C2=A0
> =C2=A0/* Default interrupt delay is 1ms, suitable for most devices */
> =C2=A0#define DEFAULT_INTERRUPT_DELAY_US		(1 * USEC_PER_MSEC)
> @@ -101,6 +103,10 @@ struct quicki2c_subip_acpi_parameter {
> =C2=A0 * @HMTD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line
> Transmit HOLD Period
> =C2=A0 * @HMRD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line
> Receive HOLD Period
> =C2=A0 * @HMSL: Maximum length (in ic_clk_cycles) of suppressed spikes in
> High Speed Mode
> + * @FSEN: Maximum Frame Size Feature Enable Control
> + * @FSVL: Maximum Frame Size Value (unit in Bytes)
> + * @INDE: Interrupt Delay Feature Enable Control
> + * @INDV: Interrupt Delay Value (unit in 10 us)
> =C2=A0 *
> =C2=A0 * Those properties get from QUICKI2C_ACPI_METHOD_NAME_ISUB method,
> used for
> =C2=A0 * I2C timing configure.
> @@ -127,17 +133,22 @@ struct quicki2c_subip_acpi_config {
> =C2=A0	u64 HMTD;
> =C2=A0	u64 HMRD;
> =C2=A0	u64 HMSL;
> +
> +	u64 FSEN;
> +	u64 FSVL;
> +	u64 INDE;
> +	u64 INDV;
> =C2=A0	u8 reserved;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> =C2=A0 * struct quicki2c_ddata - Driver specific data for quicki2c device
> =C2=A0 * @max_detect_size: Identify max packet size detect for rx
> - * @interrupt_delay: Identify interrupt detect delay for rx
> + * @interrupt_delay: Identify max interrupt detect delay for rx
> =C2=A0 */
> =C2=A0struct quicki2c_ddata {
> =C2=A0	u32 max_detect_size;
> -	u32 interrupt_delay;
> +	u32 max_interrupt_delay;
> =C2=A0};
> =C2=A0
> =C2=A0struct device;
> @@ -170,6 +181,10 @@ struct acpi_device;
> =C2=A0 * @report_len: The length of input/output report packet
> =C2=A0 * @reset_ack_wq: Workqueue for waiting reset response from device
> =C2=A0 * @reset_ack: Indicate reset response received or not
> + * @i2c_max_frame_size_enable: Indicate max frame size feature
> enabled or not
> + * @i2c_max_frame_size: Max RX frame size (unit in Bytes)
> + * @i2c_int_delay_enable: Indicate interrupt delay feature enabled
> or not
> + * @i2c_int_delay: Interrupt detection delay value (unit in 10 us)
> =C2=A0 */
> =C2=A0struct quicki2c_device {
> =C2=A0	struct device *dev;
> @@ -200,6 +215,11 @@ struct quicki2c_device {
> =C2=A0
> =C2=A0	wait_queue_head_t reset_ack_wq;
> =C2=A0	bool reset_ack;
> +
> +	u32 i2c_max_frame_size_enable;
> +	u32 i2c_max_frame_size;
> +	u32 i2c_int_delay_enable;
> +	u32 i2c_int_delay;
> =C2=A0};
> =C2=A0
> =C2=A0#endif /* _QUICKI2C_DEV_H_ */

