Return-Path: <linux-input+bounces-4131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C928FCE84
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 15:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7BC81C24EEE
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 13:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72CDC19B3C0;
	Wed,  5 Jun 2024 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YLcABzRG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4428949648;
	Wed,  5 Jun 2024 12:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717590331; cv=none; b=ezLasBLCuewGmSGdchvOZxdeqmK2vsMBmNXEbRKxVi/POctiRnccNa7LlZN9kRDH4Xem6aU/fn4o3jmvN30pjL8I2aZJBR1pv7Qcfo6VSV/1mOfYY4r5LXL0ubBCgYqJnhhfEFMKirODjXWZ8LKak7/XGfG33zVg1f/SL/nErtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717590331; c=relaxed/simple;
	bh=rR/Q4P46U3pOq/PmUwPDvoqv+BmPUlNdpUfj/CxYLOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QvBnjXHRafv9VZWWiKjbic0XTAoW8QQLX7DXbdsWoVt5u5K1pxiqqDyDZeBV1wLmTSqoNO7QoT470pk4IFvUBKWNSV5MLE8gPRZHDFkpEdAILn9J09F1DU2a+9NchoCvmB1lZT2x9bHDF9N5z6cdOWoSVSruW6nJhizDwtrcyNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YLcABzRG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2454AC32781;
	Wed,  5 Jun 2024 12:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717590331;
	bh=rR/Q4P46U3pOq/PmUwPDvoqv+BmPUlNdpUfj/CxYLOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YLcABzRG//qfBJ9Ucp78uHilNfnMpfa9Vgb9ZWBrgZFawvXPYGTk7p2LnS6ejYcG1
	 0mVnepQMsMDUF8uC9QfENDmEnPVm2aV93urCZmH3aF0JS1R1RIGVOspW1WXtVmFg4a
	 gad0LsLL5LFLkOVBqnnDR24OfRtid8L5THn7gnm+c6FwwrDg0e7xFPG0O3UQYB6ma2
	 9EUp038Hegamu2sAooKl708eqDrqnLMpTWovbrZCUcQpg9dNF6UPv8W8BSORSRzWgY
	 2gznQ5UrN53UApnVNbL0bnaEc8g5Hz9yY2VjExlJ38eQT3XP+ZWWua9IbsHO4ZPO8K
	 uSjwhWCvXSyQA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sEphs-000000007OW-0H4Z;
	Wed, 05 Jun 2024 14:25:32 +0200
Date: Wed, 5 Jun 2024 14:25:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] HID/arm64: dts: qcom: sc8280xp-x13s: fix
 touchscreen power on
Message-ID: <ZmBZPHbDv7ma_JaJ@hovoldconsulting.com>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>

Hi Jiri and Benjamin,

On Tue, May 07, 2024 at 04:48:14PM +0200, Johan Hovold wrote:
> The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
> before sending commands after having deasserted reset during power on.
> 
> This series switches the X13s devicetree to use the Elan specific
> binding so that the OS can determine the required power-on sequence and
> make sure that the controller is always detected during boot. [1]

> The devicetree changes are expected to go in through the Qualcomm tree
> once the binding and driver updates have been merged.

> [1] The reset signal is currently deasserted using the pin configuration
>     and the controller would be detected if probe is deferred or if user
>     space triggers a reprobe through sysfs.

> Johan Hovold (7):
>   dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema
>   dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M
>   dt-bindings: HID: i2c-hid: elan: add 'no-reset-on-power-off' property
>   HID: i2c-hid: elan: fix reset suspend current leakage

Could you consider picking the first four patches up for 6.10-rc3 so
that Bjorn can take the devicetree changes?

>   arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
>   arm64: dts: qcom: sc8280xp-crd: use external pull up for touch reset
>   arm64: defconfig: enable Elan i2c-hid driver

Johan

