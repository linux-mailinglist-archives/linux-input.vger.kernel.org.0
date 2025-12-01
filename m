Return-Path: <linux-input+bounces-16426-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9EC97B6C
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B2DE4E156F
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665B33101A0;
	Mon,  1 Dec 2025 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="w4QavFHU"
X-Original-To: linux-input@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3E30F811;
	Mon,  1 Dec 2025 13:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596955; cv=none; b=PT7amRZJM0ARo4BzM7IkSBqYg3eG+kOqusnzdgwv1Tw2Xur3BgjgjjQAyxWpd3Dr2ojGTc86mXqpPLPHSFXGHzmHVNvCTBwaeqLODDh26nP3d2/Z6zW/yBa7F4dZDFk1MMPO7/4QUN9KLegfCr2ZrvXc85JY69asU27l/UtyGUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596955; c=relaxed/simple;
	bh=zRk/Zm6+XLlKxgVh+eDkppc5kEhgRpWDkRB940zxREM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKb4ne7p24zQYnLhX2BnkSEk0Oa92Bf4jcjn2eJVrBGDWOw98OQTufMcxG2Xcu0boLCGy6MilH2fRqKdeTBJl7ENZG/cFHjYJ4d3sKQqrNBqJRqoClpeaLSol0CoFdSikNLTX/p8gV4p+/tnpNoqSxrRSwa30qxGCWHgZRU1DDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=w4QavFHU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=eAKJcwb4xUIoD3fQ+tNAoCXDMNOYAe8cY5ilwthWLuk=; b=w4QavFHUpcuRdBcUGocCypwemT
	HzccrGFLUh7EGnR/bpKrwpHWgUzKWBARj+3UzCD5u5OayoCCUpIlcwb8MAUKx5glS4v/vN+Af9UiF
	BwEL9QmR9cCzUff/njpKay/ughXu//SmyuptfFIq1yhAFFCl+rkQ2jRnDzehPC2/HwSo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vQ4H4-00FZsO-Lv; Mon, 01 Dec 2025 14:49:06 +0100
Date: Mon, 1 Dec 2025 14:49:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 7/8] arm64: dts: add description for solidrun
 solidsense-n8 board
Message-ID: <c06e5a6b-6150-4771-8ff6-b2cda0863a21@lunn.ch>
References: <20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com>
 <20251201-imx8mp-hb-iiot-v4-7-53a4cd6c21bf@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-imx8mp-hb-iiot-v4-7-53a4cd6c21bf@solid-run.com>

> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&fec1_pins>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&phy4>;
> +	local-mac-address = [00 00 00 00 00 00];
> +	fsl,magic-packet;

Has WoL been tested, or is this copy/paste from the binding
documentation?

> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/*
> +		 * Depending on board revision two different phys are used:
> +		 * - v1.1: atheros phy at address 4
> +		 * - v1.2+: analog devices phy at address 0
> +		 * Configure first version by default.
> +		 * On v1.2 and later, U-Boot will enable the correct phy
> +		 * based on runtime detection and patch dtb accordingly.
> +		 */
> +
> +		/* ADIN1300 */
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10>;
> +			reset-deassert-us = <5000>;
> +			interrupt-parent = <&gpio1>;
> +			interrupts = <10 IRQ_TYPE_LEVEL_LOW>;

The analog devices PHY has interrupts, so can it implement WoL? Has
this been tested?

> +		/* AR8035 */
> +		phy4: ethernet-phy@4 {
> +			reg = <4>;
> +			reset-gpios = <&gpio3 19 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			status = "okay";

The Atheros PHY does not interrupts, so i assume it cannot support
WoL? You only have MAC WoL?

     Andrew

