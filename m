Return-Path: <linux-input+bounces-14357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E38BCB38B58
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 23:29:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC3BD4612E6
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 21:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B25A6237165;
	Wed, 27 Aug 2025 21:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="In/RzUcs"
X-Original-To: linux-input@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AF51DE4CA
	for <linux-input@vger.kernel.org>; Wed, 27 Aug 2025 21:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756330194; cv=none; b=YvWVjXztvo3Uw1sh7Mvv29KQK3KHnvstm64+oKQe+GmoUDmRe9KcS3k6bDpJa+ZQZMQ2EFKlx0MomkjgvezFO26kPXeYoHu5IBDYT7Uhkc7xFitnb2XBT8yFBX5Jih4S+uXV0/6X3bDQKeiI/s7yYL0kg7vDD7KIRKbr6MiD9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756330194; c=relaxed/simple;
	bh=XDtCFwvvNMey6wTqiIrDKsQ/oOJGKJKxwF7UGO21WcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTEySU13S0ahKou0AkMoQhh325DNQrRlLU4WlFHDzfaBtZNU7uIAKlQnp972tUjjaXVgfRph0eMw6wbDy1T6EDF9geJ5bxWs803a187n6Ek9FF4NZCZPyYV0lJcnm8k6c6XdoWlbxvkFoi4JLJ4RZksQ8YfChuJDBSVRER4h2DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=In/RzUcs; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 27 Aug 2025 15:29:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756330179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5MioykTIfASSWtcO1+DcZuIhvR3bjW8+wvoMlo7QyT8=;
	b=In/RzUcskcU+3iiJUnvCmHJ9fG88xhn7ZWye5DiepQDaWju+HkOwkZdwblaHre2kdKi+jE
	iMcwnCDrbe+hGoUwHmPhP8MpmVwMazE+A3p1/qzzisqCx4s47tfzYEGgFcxPQ7GRfJBZtx
	/k74OOqkOQvHTnjFpTM/2c2jmR3AagY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kamel Bouhara <kamel.bouhara@bootlin.com>, 
	Marco Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
X-Migadu-Flow: FLOW_OUT


On Thu, Aug 21, 2025 at 07:26:36PM +0200, Marco Felsch wrote:
> Add FW_UPLOAD_ERR_DUPLICATE to allow drivers to inform the firmware_loader
> framework that the update is not required. This can be the case if the
> user provided firmware matches the current running firmware.
> 
> Sync lib/test_firmware.c accordingly.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Russ Weight <russ.weight@linux.dev>

> ---
>  drivers/base/firmware_loader/sysfs_upload.c | 1 +
>  include/linux/firmware.h                    | 2 ++
>  lib/test_firmware.c                         | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> index 829270067d1632f92656859fb9143e3fa9635670..0a583a1b3f4fde563257566426d523fbf839b13f 100644
> --- a/drivers/base/firmware_loader/sysfs_upload.c
> +++ b/drivers/base/firmware_loader/sysfs_upload.c
> @@ -28,6 +28,7 @@ static const char * const fw_upload_err_str[] = {
>  	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
>  	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
>  	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
> +	[FW_UPLOAD_ERR_DUPLICATE]    = "firmware-duplicate",
>  };
>  
>  static const char *fw_upload_progress(struct device *dev,
> diff --git a/include/linux/firmware.h b/include/linux/firmware.h
> index aae1b85ffc10e20e9c3c9b6009d26b83efd8cb24..fe7797be4c08cd62cdad9617b8f70095d5e0af2f 100644
> --- a/include/linux/firmware.h
> +++ b/include/linux/firmware.h
> @@ -29,6 +29,7 @@ struct firmware {
>   * @FW_UPLOAD_ERR_RW_ERROR: read or write to HW failed, see kernel log
>   * @FW_UPLOAD_ERR_WEAROUT: FLASH device is approaching wear-out, wait & retry
>   * @FW_UPLOAD_ERR_FW_INVALID: invalid firmware file
> + * @FW_UPLOAD_ERR_DUPLICATE: firmware is already up to date (duplicate)
>   * @FW_UPLOAD_ERR_MAX: Maximum error code marker
>   */
>  enum fw_upload_err {
> @@ -41,6 +42,7 @@ enum fw_upload_err {
>  	FW_UPLOAD_ERR_RW_ERROR,
>  	FW_UPLOAD_ERR_WEAROUT,
>  	FW_UPLOAD_ERR_FW_INVALID,
> +	FW_UPLOAD_ERR_DUPLICATE,
>  	FW_UPLOAD_ERR_MAX
>  };
>  
> diff --git a/lib/test_firmware.c b/lib/test_firmware.c
> index 211222e63328f970228920f5662ee80cc7f51215..603c3a4b385c849944a695849a1894693234b5eb 100644
> --- a/lib/test_firmware.c
> +++ b/lib/test_firmware.c
> @@ -1133,6 +1133,7 @@ static const char * const fw_upload_err_str[] = {
>  	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
>  	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
>  	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
> +	[FW_UPLOAD_ERR_DUPLICATE]    = "firmware-duplicate",
>  };
>  
>  static void upload_err_inject_error(struct test_firmware_upload *tst,
> 
> -- 
> 2.39.5
> 

