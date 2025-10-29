Return-Path: <linux-input+bounces-15792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA6EC195B9
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 10:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C84323B8775
	for <lists+linux-input@lfdr.de>; Wed, 29 Oct 2025 09:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D1C322774;
	Wed, 29 Oct 2025 09:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="CnysY0t4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7684231D742;
	Wed, 29 Oct 2025 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761729821; cv=none; b=C94uGvQPdckUC4qcQnyZAriKRsWCDVeewFGvMAhmOZyaiYPDoQtP94s8xpE+1t2xYlVpxOMqFNv6cEx021lLM6l/mPdtt77RFdSjzWItDHkD0j6+GkUpIZ/za+VCbw0ngUV55f8/ynBtT3xh7XybAhXGrniXmucbV6fuUT89KNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761729821; c=relaxed/simple;
	bh=J7iqhTzrlj86EMcGRA7xb60awDEhM6qHMzLGoaUVXis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZqRILK72kdQFBQoPqy9o74y9EAbKanYfZ2ymQtXivvJBBH/uHXR3xxqSUGroVOcG8R+uYDn6tJ69eXb5kbM4gycZD3g1SSY3CAJs59vbQRGMFePSAVg2xgs67pb5O8es7UqxTMPcmYcqWulR0k3835OvHBWe12zgkRJFmbKEKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=CnysY0t4; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 43E2C1489CE9;
	Wed, 29 Oct 2025 10:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1761729808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=1zLIEoaFBP4q/5p+hEtogKcFyzuImMfXPa+ST2olz9A=;
	b=CnysY0t4pIjp6NlKEvBZFdi3Y3jdok7H4tpzujTzN0+P3Q4HSFSE0Wy8kEvWBNQQAx2qzi
	Gz3vIodzUSWZfOwJXyKky1we/qFyzFFEECLnoANMVqvPJRrKhTjCVil567ApPhoHanQpkX
	d6WjXx0eVDVzAI39NDFWAwabMtuDYWfgqfvELfVSfoBwFG/xN5OX1IYttnilLTIzf6iD1w
	dt73CsRp67KCmTUmoVHsktfeOy90b5Sn1RurTuKEQ4t43brVGNuOXQRROd0137G/iQvl01
	o+Pi0TWAVaSDNh5XtJTlA1X/yk5R/ZkpKnWplOnynXthsEoMxhutw1MmJgrXfw==
Date: Wed, 29 Oct 2025 10:23:17 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH 08/10] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Message-ID: <20251029-jittery-ambiguity-14e03ad2f0df@thorsis.com>
Mail-Followup-To: Josua Mayer <josua@solid-run.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-leds@vger.kernel.org
References: <20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com>
 <20251027-imx8mp-hb-iiot-v1-8-683f86357818@solid-run.com>
 <2c54b7b7-4eb4-44a0-8025-8da16a28efd4@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c54b7b7-4eb4-44a0-8025-8da16a28efd4@solid-run.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Josua,

Am Tue, Oct 28, 2025 at 12:24:36PM +0000 schrieb Josua Mayer:
> Am 27.10.25 um 18:48 schrieb Josua Mayer:
> 
> > Add description for the SolidRun i.MX8MP HummingBoard IIoT.
> > The board is a new design around the i.MX8MP System on Module, not
> > sharing much with previous HummingBoards.
> >
> > It comes with some common features:
> > - 3x USB-3.0 Type A connector
> > - 2x 1Gbps RJ45 Ethernet
> > - USB Type-C Console Port
> > - microSD connector
> > - RTC with backup battery
> > - RGB Status LED
> > - 1x M.2 M-Key connector with PCI-E Gen. 3 x1
> > - 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
> > - 1x LVDS Display Connector
> > - 1x DSI Display Connector
> > - GPIO header
> > - 2x RS232/RS485 ports (configurable)
> > - 2x CAN
> >
> > In addition there is a board-to-board expansion connector to support
> > custom daughter boards with access to SPI, a range of GPIOs and -
> > notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
> > to this b2b connector, or a termianl block connector on the base board.
> >
> > The routing choice for UART and CAN is expressed through gpio
> > mux-controllers in DT and can be changed by applying dtb addons.
> >
> > Four dtb addons are provided:
> >
> > - dsi panel Winstar WJ70N3TYJHMNG0
> > - lvds panel Winstar WF70A8SYJHLNGA
> > - RS485 on UART port "A" (default rs232)
> > - RS485 on UART port "B" (default rs232)
> >
> > Signed-off-by: Josua Mayer <josua@solid-run.com>
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile             |   6 +
> >  ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  70 ++
> >  ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
> >  .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
> >  .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
> >  .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 710 +++++++++++++++++++++
> >  6 files changed, 927 insertions(+)
> cut
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> > new file mode 100644
> > index 0000000000000..2e4cb676bc9da
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot.dts
> cut
> > +	led-controller@30 {
> > +		compatible = "ti,lp5562";
> > +		reg = <0x30>;
> > +		/* use internal clock, could use external generated by rtc */
> > +		clock-mode = /bits/ 8 <1>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		multi-led@0 {
> > +			reg = <0x0>;
> > +			color = <LED_COLOR_ID_RGB>;
> > +			#address-cells = <1>;
> > +			#size-cells = <0>;
> > +
> > +			led@0 {
> > +				reg = <0x0>;
> > +				color = <LED_COLOR_ID_RED>;
> > +				led-cur = /bits/ 8 <0x32>;
> > +				max-cur = /bits/ 8 <0x64>;
> > +			};
> > +
> > +			led@1 {
> > +				reg = <0x1>;
> > +				color = <LED_COLOR_ID_GREEN>;
> > +				led-cur = /bits/ 8 <0x19>;
> > +				max-cur = /bits/ 8 <0x32>;
> > +			};
> > +
> > +			led@2 {
> > +				reg = <0x2>;
> > +				color = <LED_COLOR_ID_BLUE>;
> > +				led-cur = /bits/ 8 <0x19>;
> > +				max-cur = /bits/ 8 <0x32>;
> > +			};
> > +		};
> > +
> > +		led@3 {
> > +			reg = <3>;
> > +			chan-name = "D8";
> 
> chan-name gives the led the name D6 in sysfs.
> 
> The bindings do not allow however setting chan-name on
> the multi-led, and it has an auto-generated name in sysfs.
> 
> Am I missing something? Can multi-leds have a custom name?

The sysfs names are auto-generated based on the attributes "color",
"function", and "label" with the last being discouraged for new
designs.  If the "ti,lp5562" driver does nothing special, you could
add "function" to the multi-led node and see if that fits your needs.

Adding linux-leds to Cc, because this is a LED related question.

Greets
Alex

> In v6.6 leds-lp5562 driver if I set in each multi-led led@[0-2] sub-node
> chan-name to the same string "D7" - then the sysfs name becomes D7.
> 
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			led-cur = /bits/ 8 <0x19>;
> > +			max-cur = /bits/ 8 <0x64>;
> > +		};
> > +	};

