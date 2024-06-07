Return-Path: <linux-input+bounces-4198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B48FFF54
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 11:24:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485391C21F9E
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 09:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DC015B985;
	Fri,  7 Jun 2024 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QC3h8D1q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351615ADA5;
	Fri,  7 Jun 2024 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717752285; cv=none; b=gTV/Iaux5VCGjHGiSqvuUowV58Bca3YU+Ea+5uRRTlJY2Gyg+AjjL2v0AF8svD6XbAHJS/zpXOlc4S0AEyTNfsfA2CsIl8FXZRnap6hMDww1AiugMzp+zHnGYM8IK+viPFwa2+gDXCZfaXZ2GJYrqtg5IZG2eXu2TDxIh/qbhtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717752285; c=relaxed/simple;
	bh=Ai/nxfazLLCWh/3bdRJszh7k3lCJMV2XEd3vBUFJoOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q93asdGQti6SuQD/kJrOgr+GrVMkiEXV9sXl8PSY2PAYegozx8xcRKJUK27iQxEUzH68LozyY3AwnU9JE8W2aKz/TvXUJhLZZz06h4R8gP9tT5ezVF5/Kdy/hEb4q4NJ72lRFKPd499/qHW4L7A+Uh5ojrwmLzt6M8xncs3ZjcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QC3h8D1q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6F5C2BBFC;
	Fri,  7 Jun 2024 09:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717752285;
	bh=Ai/nxfazLLCWh/3bdRJszh7k3lCJMV2XEd3vBUFJoOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QC3h8D1qaaOBdKGODeHGrDZvqpt286T73I4bfkGGrDNF5iq5G2fD9vMQb68Hj62lJ
	 JVgWzd8/GCrN+XBZ5ZYBBgKclvg6R9eNpC4r8pzu6LANaC/IMbV49qsj1U5gV5d5HF
	 ybUmNuHnK5QB6lddvfPXXpMgS5eMYKDJ30qJey3NCNylpPTOW+hd/jb2LpnhTVmhSY
	 SL+SYoECCF+wNN4We4C9rApwSqRlvTEmBbVI/7Ed1omESoH47CpLdVTP5CsE5tdS4S
	 B3nOHl5kSMyhk4M9Pv7wiNYw/9P4R1eslLqXt/lrtganrqzyHAi23/eDLhWB+1vFYT
	 8dCe6TBmnmWMQ==
Date: Fri, 7 Jun 2024 11:24:39 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] HID/arm64: dts: qcom: sc8280xp-x13s: fix
 touchscreen power on
Message-ID: <wa5x3m33rpb6vwoyqnj2srfyylg6uzoeroprv27n45vxga5kqb@2kzps6mnublf>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
 <ZmBZPHbDv7ma_JaJ@hovoldconsulting.com>
 <fupsiajh2za5r7itt2naxtynyqiwpw3efubrjmydd5ohypo3jg@2u44rbhbvmym>
 <ZmFg-uBodIMkINof@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmFg-uBodIMkINof@hovoldconsulting.com>

On Jun 06 2024, Johan Hovold wrote:
> On Thu, Jun 06, 2024 at 08:57:47AM +0200, Benjamin Tissoires wrote:
> > On Jun 05 2024, Johan Hovold wrote:
> > > Hi Jiri and Benjamin,
> > > 
> > > On Tue, May 07, 2024 at 04:48:14PM +0200, Johan Hovold wrote:
> 
> > > > Johan Hovold (7):
> > > >   dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema
> > > >   dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M
> > > >   dt-bindings: HID: i2c-hid: elan: add 'no-reset-on-power-off' property
> > > >   HID: i2c-hid: elan: fix reset suspend current leakage
> > > 
> > > Could you consider picking the first four patches up for 6.10-rc3 so
> > > that Bjorn can take the devicetree changes?
> > 
> > We definitely can. But if it makes things easier, Bjorn can also take
> > the whole series through his tree with my Acked-by.
> 
> Thanks, but it should be fine to take this through two different trees.
> 
> It will probably take a little longer to get the DT changes into
> mainline anyway as they will also go through the SoC tree.

Alright, fair enough. I've applied them, and will let them sink in
for-next for 24h. I'll send the PR to Linus tomorrow evening. No
guarantees they'll make -rc3 (but they should be applied early next week
unless I messed something big).

Cheers,
Benjamin

