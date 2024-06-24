Return-Path: <linux-input+bounces-4589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF09141F6
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 07:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C99BD284B10
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 05:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4247C10A3E;
	Mon, 24 Jun 2024 05:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hdkbigkC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9CBDDCD
	for <linux-input@vger.kernel.org>; Mon, 24 Jun 2024 05:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207084; cv=none; b=RqhjGot60lbQNkUHQaNCJyXL1iLGVCPUPFOjErUgo/uPaGlBRr+NIuvPcpHRngUmaqt2Ve5YAu5EzDhqIFP4ueOCj0pge+zTW2qOKm6jSXhweWNnu/2CGPC0xxWDPmD/nG+KnSpKhkY/p6lIwx/2a5NJQkjc33aw5K7sDxfTLYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207084; c=relaxed/simple;
	bh=mC6YmdP6iUZsMpkTlQTL5Lttmys4aoXQHGhQ9fwz4Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UD6sLaMG1H5KmBZgnMfnA/tZa3d7mFMHz7g3geu57ORxy0byPUQ9X+kiQdqPbjjBTxVowmPu8hP7vhYg0vhH3VdCItsVu5iSd5OyTTTCJSTjstcSZ6YCEZHqs96joPFd+STC0Txip+jV/FSRWBdNkIi388Ztj/xsfmSOjTGQ8BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hdkbigkC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52cd87277d8so2288665e87.2
        for <linux-input@vger.kernel.org>; Sun, 23 Jun 2024 22:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719207080; x=1719811880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oEeMqLzWPtuHbd7DMdLxKIfGpNKakGZfL/lhpzQLB6U=;
        b=hdkbigkCrZQHwPxv77Co/+CRs2dOzi8OLAaMYGGP8Jzv4Z/ZGhI3TFTPYgqfTDe2cw
         VOH/wTl9DgD9FuyJ/WtsRSFPVkyPaIJKIT4EQ3QY6+QUbeb/R3jPesAEVImJvWfZ9IJA
         lJXEGSDEX2MMcXdhWnAZLePGYQ8xlDrXfiAx8GIAcRGVDwZJl9YKMA4aJ0UgfecUB2LV
         +lTXFMIirsRRGnOAzQI/4PV9lMOty3V8ailkKpAomA+VxHj8vR/fz+bjhLRwacV6++hq
         NpuH6LBfvWdL515CvKyIghjEjEemFg1FhHqPDEFJEZJRdsIQd9lctvBnWa85EXuj0/sd
         2Cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207080; x=1719811880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEeMqLzWPtuHbd7DMdLxKIfGpNKakGZfL/lhpzQLB6U=;
        b=uRqtwzLcNX3TcW1gW/84KTbDLhVvTqTvlbtYspHWM3tMgsSyGSHRRNNpvGRnizKqdv
         BaoWiR0KCuMu+9thNWaCGLnF/dlnPfvMChSU6KPQlkK4v8Md8G3ijx5g/n8rKVELrIck
         vKZhL7dSH3m1DBjwkzuykExhGr/Alx2Oj67tLAMkfv8rkrEeS69Sfsrywp6WUtubk6Sj
         XBTnuahEEA5spCFRgIHL8Irvcn3eX8odJsd8qoSlZCXdW0d1SLI8faOxL07MB8qBLmLx
         OWE25HWr5ZilfQFuVE9q8VmbpvXr2UKSyc6XOw25pwtQrBWdjCsncTYTLqtrkauND6y7
         iWcg==
X-Forwarded-Encrypted: i=1; AJvYcCUWOLq/ymmly07kgO5kwFmTiq30ZQHUAeBjD6KhkoMJCGcOms3inqmeaPaZMlJKPRjADljhhhdVtipy5gRqRMG+sJ0mbmOZ00Z7YL4=
X-Gm-Message-State: AOJu0YwEFLPDFeOPtnGHdCWk92GXC131ZIJpPlgE175g8nkYbeBeCE90
	dUCTyHt+4cCsP9wlSatMZ4r5GTpqyhiJRvqBUu2SLusjM/ptjj6CSCFLgC3JxKI=
X-Google-Smtp-Source: AGHT+IGDR4WXp3BrtdW/oZ54TDqH52mJ/FrYWjDaLO9Oi22YZv6nU3DEUmhIjwPYW7xV1aybF8+z8Q==
X-Received: by 2002:ac2:5e83:0:b0:52c:e41a:b666 with SMTP id 2adb3069b0e04-52ce41ab71fmr1575041e87.7.1719207080428;
        Sun, 23 Jun 2024 22:31:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd810d633sm864075e87.165.2024.06.23.22.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 22:31:19 -0700 (PDT)
Date: Mon, 24 Jun 2024 08:31:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Caleb Connolly <caleb@postmarketos.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 5/7] drm/panel: add driver for samsung amb655x
Message-ID: <mnxpybk4nqdyp2xo22dxbprtxt5v6spr2ax4p3vrpwafqcbonv@ga4o2xxtkkov>
References: <20240624-oneplus8-v1-0-388eecf2dff7@postmarketos.org>
 <20240624-oneplus8-v1-5-388eecf2dff7@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-oneplus8-v1-5-388eecf2dff7@postmarketos.org>

On Mon, Jun 24, 2024 at 03:30:29AM GMT, Caleb Connolly wrote:
> This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
> uses non-standard DCS commands.

Please add a note regarding the panel using long packets for all the
commands.

Also the cover letter had a mention of the panel not fully comming up
after being reset, is that still true? If so, it should be mentioned in
the commit message too.

> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-samsung-amb655x.c | 420 ++++++++++++++++++++++++++
>  4 files changed, 437 insertions(+)



> +static int samsung_amb655x_on(struct samsung_amb655x *amb655x)
> +{
> +	struct drm_dsc_picture_parameter_set pps;
> +	struct mipi_dsi_device *dsi = amb655x->dsi;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	drm_dsc_pps_payload_pack(&pps, &amb655x->dsc);
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_buffer_multi(&ctx, &pps, sizeof(pps));
> +	mipi_dsi_dcs_write_long(&ctx, 0x9d, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);

_multi. Shouldn't it be a long package too?

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +	usleep_range(11000, 12000);

mipi_dsi_msleep() or add mipi_dsi_usleep_range().

> +	ret = mipi_dsi_dcs_set_column_address(dsi, 0x0000, 1080 - 1);

_multi, adding the function as required

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set column address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mipi_dsi_dcs_set_page_address(dsi, 0x0000, 2400 - 1);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set page address: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* FD Setting */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xd5, 0x8d);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x0a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xd5, 0x05);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	/* FFC Function */
> +	mipi_dsi_dcs_write_long(&ctx, 0xfc, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xe4, 0xa6, 0x75, 0xa3);
> +	mipi_dsi_dcs_write_long(&ctx, 0xe9,
> +			       0x11, 0x75, 0xa6, 0x75, 0xa3, 0x4b, 0x17, 0xac,
> +			       0x4b, 0x17, 0xac, 0x00, 0x19, 0x19);
> +	mipi_dsi_dcs_write_long(&ctx, 0xfc, 0xa5, 0xa5);
> +	msleep(61);

mipi_dsi_msleep

> +
> +	/* Dimming Setting */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x06);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb7, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x05);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb7, 0x13);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb0, 0x01);
> +	mipi_dsi_dcs_write_long(&ctx, 0xb7, 0x4c);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	mipi_dsi_dcs_write_long(&ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +
> +	/* refresh rate Transition */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	/* 60 Hz */
> +	//mipi_dsi_dcs_write_long(&ctx, 0x60, 0x00);
> +	/* 120 Hz */
> +	mipi_dsi_dcs_write_long(&ctx, 0x60, 0x10);
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +
> +	/* ACL Mode */
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_long(&ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_dcs_write_long(&ctx, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);

_multi

> +	msleep(110);

mipi_dsi_msleep()

> +
> +	/* Enable backlight */
> +	mipi_dsi_dcs_write_long(&ctx, 0x9F, 0x5A, 0x5A);
> +	mipi_dsi_dcs_set_display_on(dsi);

_multi

> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_ENTER_NORMAL_MODE);

_multi

> +	mipi_dsi_dcs_write_long(&ctx, 0x9F, 0xA5, 0xA5);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int samsung_amb655x_off(struct samsung_amb655x *amb655x)
> +{
> +	struct mipi_dsi_device *dsi = amb655x->dsi;
> +	struct mipi_dsi_multi_context ctx = { .dsi = dsi };
> +	struct device *dev = &dsi->dev;
> +	int ret;
> +
> +	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0x9f, 0x5a, 0x5a);
> +
> +	ret = mipi_dsi_dcs_set_display_on(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display on: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);

mipi_dsi_msleep

> +
> +	ret = mipi_dsi_dcs_set_display_off(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set display off: %d\n", ret);
> +		return ret;
> +	}
> +	msleep(20);

mipi_dsi_msleep
> +
> +	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);

_multi

> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> +		return ret;
> +	}
> +
> +	mipi_dsi_dcs_write_long(&ctx, 0x9f, 0xa5, 0xa5);
> +	msleep(150);
> +
> +	return ctx.accum_err;
> +}
> +

-- 
With best wishes
Dmitry

