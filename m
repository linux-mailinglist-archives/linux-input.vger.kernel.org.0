Return-Path: <linux-input+bounces-4796-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EAE923A63
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 11:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE61B1F21A5F
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 09:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9833D155726;
	Tue,  2 Jul 2024 09:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="Ho1v5h9K"
X-Original-To: linux-input@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1B9150993;
	Tue,  2 Jul 2024 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719913390; cv=none; b=BAnKwCQdCUUvtzbprjYtihbFouwLXu+jsO4ourVnMk96XOqUomVHk0o7e6O+sgu9tBVh64VxBdLcBRf0h0r5wEorHvUKhl1WWxe8ilwJXjhm/DfJ2vUYLvB8AdUG8USBupaT7Q7LlAs9fLaYf7UFiS+o4jkd10yULo9hqdneveY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719913390; c=relaxed/simple;
	bh=GBMM0dVazdheQtySNQrd9itpZeEMvmwZWXhrnd+2J+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F7Wh8Rv+T55li4hG0Zsg9EkVE6rGp3s4KnVNkeLzpKk1RKWKOXhbEE6XI7IBArJj4qjtmiIQOE7qlraJSnd8do4rSDJsIFsJRkPlMUFwBs0U6EFEe55htTS8n5RFyhUoVlow+d51Rg8hNBUpEX2BQ52UPaeZ6UBuWBM3uw4nl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=Ho1v5h9K; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Envelope-To: dmitry.baryshkov@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1719913382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOKgP0GWvCCYbYaffXHDB7kZ4VKKj8957zGCIlU8n2I=;
	b=Ho1v5h9KPPiREQ1LtxXGM3qE54jU5wgUYiHjHw9g4QhuTJf4DVKUTWx7X6TrSTI8v6sQ6H
	AvZe5aiJCsHdw1MBWC+dw7235Jh40HqwikeQMvU+k53Di8+y4Mn5L2rUlGK0hIG8xmtw1a
	8w/eXlRVTHdX6Wt7DDhUIMZlclscKJEtr4v6/TW+jTSDOdA66zSNOXV5aroaYmKH201coU
	EW8+pO/vrRyWt1mvAhM4cvcH7BCTERcMRjXiFfF3K8ltD+q1OxM4tTLFfPZOq7MNvlf78x
	9akdpo5LJsk9Sb+8twQFUOFfp+7isrVfMjL8l1nFwZNfI6NicBuoHO2w3a10/w==
X-Envelope-To: neil.armstrong@linaro.org
X-Envelope-To: quic_jesszhan@quicinc.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: robh@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: dmitry.torokhov@gmail.com
X-Envelope-To: andersson@kernel.org
X-Envelope-To: konrad.dybcio@linaro.org
X-Envelope-To: rydberg@bitmath.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: linux-input@vger.kernel.org
X-Envelope-To: linux-arm-msm@vger.kernel.org
X-Envelope-To: ~postmarketos/upstreaming@lists.sr.ht
Message-ID: <efa5b7c2-05ac-4354-830b-1d5a66e2fb58@postmarketos.org>
Date: Tue, 2 Jul 2024 11:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/8] drm/panel: add driver for samsung amb655x
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Henrik Rydberg <rydberg@bitmath.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20240630-oneplus8-v2-0-c4a1f8da74f1@postmarketos.org>
 <20240630-oneplus8-v2-6-c4a1f8da74f1@postmarketos.org>
 <37y25ko7q2hoqlzvteqt3cj2lsms3lkwi6xu6qm4xaq5gm6pus@lxh4jo4hpryv>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Caleb Connolly <caleb@postmarketos.org>
In-Reply-To: <37y25ko7q2hoqlzvteqt3cj2lsms3lkwi6xu6qm4xaq5gm6pus@lxh4jo4hpryv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 01/07/2024 22:32, Dmitry Baryshkov wrote:
> On Sun, Jun 30, 2024 at 08:36:29PM GMT, Caleb Connolly wrote:
>> This is a 1080x2400 120hz panel used on the OnePlus 8T. It uses DSC but
>> with many non-standard DCS commands.
>>
>> The only user of this panel (the OnePlus 8T) has a bug somewhere in the
>> DSI stack whereby it isn't possible to properly initialize this panel
>> after a reset. As a result, the reset GPIO is made optional so it can be
>> left unused on that device.
>>
>> Signed-off-by: Caleb Connolly <caleb@postmarketos.org>
>> ---
>>   MAINTAINERS                                   |   7 +
>>   drivers/gpu/drm/panel/Kconfig                 |   9 +
>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>   drivers/gpu/drm/panel/panel-samsung-amb655x.c | 399 ++++++++++++++++++++++++++
>>   4 files changed, 416 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 807feae089c4..2b9cfbf92d7a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7142,8 +7142,15 @@ M:	Robert Chiras <robert.chiras@nxp.com>
>>   S:	Maintained
>>   F:	Documentation/devicetree/bindings/display/panel/raydium,rm67191.yaml
>>   F:	drivers/gpu/drm/panel/panel-raydium-rm67191.c
>>   
>> +DRM DRIVER FOR SAMSUNG AMB655X PANEL
>> +M:	Caleb Connolly <caleb@postmarketos.org>
>> +S:	Maintained
>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> +F:	Documentation/devicetree/bindings/display/panel/samsung,amb655x.yaml
>> +F:	drivers/gpu/drm/panel/panel-samsung-amb655x.c
>> +
>>   DRM DRIVER FOR SAMSUNG DB7430 PANELS
>>   M:	Linus Walleij <linus.walleij@linaro.org>
>>   S:	Maintained
>>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
>> index bf4eadfe21cb..7203d16ab20a 100644
>> --- a/drivers/gpu/drm/panel/Kconfig
>> +++ b/drivers/gpu/drm/panel/Kconfig
>> @@ -590,8 +590,17 @@ config DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01
>>   	depends on OF
>>   	select DRM_MIPI_DSI
>>   	select VIDEOMODE_HELPERS
>>   
>> +config DRM_PANEL_SAMSUNG_AMB655X
>> +	tristate "Samsung AMB655X DSI panel"
>> +	depends on OF
>> +	depends on DRM_MIPI_DSI
>> +	depends on BACKLIGHT_CLASS_DEVICE
>> +	help
>> +	  DRM panel driver for the Samsung AMB655X panel.
>> +	  This panel has a resolution of 1080x2400 @ 60hz or 120Hz.
>> +
>>   config DRM_PANEL_SAMSUNG_ATNA33XC20
>>   	tristate "Samsung ATNA33XC20 eDP panel"
>>   	depends on OF
>>   	depends on BACKLIGHT_CLASS_DEVICE
>> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
>> index 051b75b3df7b..be6d500a56a4 100644
>> --- a/drivers/gpu/drm/panel/Makefile
>> +++ b/drivers/gpu/drm/panel/Makefile
>> @@ -58,8 +58,9 @@ obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
>>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM692E5) += panel-raydium-rm692e5.o
>>   obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM69380) += panel-raydium-rm69380.o
>>   obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
>> +obj-$(CONFIG_DRM_PANEL_SAMSUNG_AMB655X) += panel-samsung-amb655x.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20) += panel-samsung-atna33xc20.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_DB7430) += panel-samsung-db7430.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) += panel-samsung-ld9040.o
>>   obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6D16D0) += panel-samsung-s6d16d0.o
> 
> 
>> +static int samsung_amb655x_prepare(struct drm_panel *panel)
>> +{
>> +	struct samsung_amb655x *ctx = to_samsung_amb655x(panel);
>> +	struct device *dev = &ctx->dsi->dev;
>> +	int ret;
>> +
>> +	/*
>> +	 * During the first call to prepare, the regulators are already enabled
>> +	 * since they're boot-on. Avoid enabling them twice so we keep the refcounts
>> +	 * balanced.
> 
> I see your intent, but I don't think this is fully correct. If the
> driver gets rebound, then it will perform one extra disable call. On the
> next driver probe / enable / disable / remove cycle the driver will
> perform one more, underflowing enable count. I think
> regulator_init_complete_work_function should give the phone enough time
> to boot the panel.

I do make an extra call to regulator_bulk_enable() in probe(), does that 
balance things out?
> 
>> +	 */
>> +	if (!regulator_is_enabled(ctx->supplies[0].consumer)) {
>> +		ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to enable regulators: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
> 

