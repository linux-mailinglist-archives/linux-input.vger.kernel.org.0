Return-Path: <linux-input+bounces-5738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DE95B2A0
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 12:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27E051C20A23
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 10:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312CE17C224;
	Thu, 22 Aug 2024 10:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDi3xLFE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1EC18C31;
	Thu, 22 Aug 2024 10:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724321427; cv=none; b=Uf952mtv13WghLCLmISG7YCgHAdCyYY/i6059dKheakplNdvlAboLFV5Rj5OBybuhpOu33jyVByS5q4u2eORUlXuvDUetKne2zdSMI5fjwE6CRPuCtSoamUaM9pQCn/dsssN3erqx245rI2n5CItI7A4U5X2bV+RpboNRLy+LB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724321427; c=relaxed/simple;
	bh=0ApU82SZWq6n9EuyshuodUqSF2/9WM8FQ5lruXW/bCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blFJEXtjnijPwHGvxq4lMA0zMN/8aLA0W16V061VvY6+O1uHNs/5omTvzxDk3boN3WwgYvKQlRGZnp87EbbZTCv5aaIDn1kX9iGjLGfXbafMRzZ0Uagk0hYPmsBs9pxFGKKbHSOm38s/MyyW4APdr/abab6OUA7lBNdQYWxKPqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDi3xLFE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638D7C32782;
	Thu, 22 Aug 2024 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724321426;
	bh=0ApU82SZWq6n9EuyshuodUqSF2/9WM8FQ5lruXW/bCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDi3xLFENzGU+hwTJNHpp2Tv9TkveDcGPJzLrErcnV2m3J+wIGxAVTL89EfAU7mC1
	 qan8wL6poGR5P5BzvhGZVchExNIHO9fgZFABEWm2iRstQv8dMCCXg4gCY4+a9LTdfz
	 2v4Txgn5TMg2THG96HTc3SOjFaoaKKHfVOKQ5SD2H023KnQIf+qu52AIsxL5sxQq+w
	 d9HMp8JBexoZYP4T671NgsUdb0ocilmLUtCvoyR+Qo3TErQ942yqwbsRSC+R16ZCoB
	 MJjmgY6yQJnlZTDVIKNi5gvTFFwkcObt0a9lGCuI+rF1aKYhw2aeYfy/IeG4wJDa+Q
	 e0weELHrOI0Qg==
Date: Thu, 22 Aug 2024 11:10:20 +0100
From: Lee Jones <lee@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, dmitry.torokhov@gmail.com,
	pavel@ucw.cz, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ukleinek@debian.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-hwmon@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v4 2/7] mfd: add base driver for qnap-mcu devices
Message-ID: <20240822101020.GG6858@google.com>
References: <20240810184743.277248-1-heiko@sntech.de>
 <20240810184743.277248-3-heiko@sntech.de>
 <20240816171336.GF5853@google.com>
 <2875938.88bMQJbFj6@diego>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2875938.88bMQJbFj6@diego>

On Sun, 18 Aug 2024, Heiko Stübner wrote:

> Hi Lee,
> 
> thanks a lot for your review,
> 
> Am Freitag, 16. August 2024, 19:13:36 CEST schrieb Lee Jones:
> > On Sat, 10 Aug 2024, Heiko Stuebner wrote:
> 
> 
> > > +/*
> > > + * MFD core driver for the MCU in Qnap NAS devices that is connected
> > 
> > No such thing as an "MFD".  Please describe the device.
> > 
> > Is it QNAP or Qnap?  Please be consistent.
> 
> Looks like QNAP spells itself in all upper case on their website, so I did
> go with that

Super, thanks.

> > > +
> > > +/*
> > > + * The MCU controls power to the peripherals but not the CPU.
> > > + *
> > > + * So using the pmic to power off the system keeps the MCU and hard-drives
> > > + * running. This also then prevents the system from turning back on until
> > > + * the MCU is turned off by unplugging the power-cable.
> > > + * Turning off the MCU alone on the other hand turns off the hard-drives,
> > > + * LEDs, etc while the main SoC stays running - including its network ports.
> > > + */
> > > +static int qnap_mcu_power_off(struct sys_off_data *data)
> > > +{
> > > +	struct qnap_mcu *mcu = data->cb_data;
> > > +	int ret;
> > > +	u8 cmd[] = {
> > > +		[0] = 0x40, /* @ */
> > > +		[1] = 0x43, /* C */
> > > +		[2] = 0x30  /* 0 */
> > > +	};
> > 
> > u8 cmd [] = { '@', 'C', '0' };  ?
> 
> see above.
> 
> I guess this is a style choice, we could of course go with
> 	u8 cmd[] = { 0x40, 0x43, 0x30 }
> if you prefer that.

Yes please.

-- 
Lee Jones [李琼斯]

