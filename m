Return-Path: <linux-input+bounces-4156-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 223ED8FDF35
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 08:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DA2D1C21648
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2024 06:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F8AE13BC30;
	Thu,  6 Jun 2024 06:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNlqMDCB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D7D19D898;
	Thu,  6 Jun 2024 06:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717657074; cv=none; b=jADhp5YuWLsl4NWTsqCiokJIjre6HywdO85QSC6T0+rTzHxQBfY34njJ80TMtEjqnAJpV7Kf2Ob5Gbc9WAc8K4s4qunpyFIPQ9jrWC+2YstynWlTEpERSAXcwnroAu2bquIcnUrY7RGMElSI7AJesQwToLG+1ymf1rTVSLYJ5XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717657074; c=relaxed/simple;
	bh=Y1QGCsG4sNiWJEzr1Fn7n1E794mS092qLQjOEa8ZQYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9RDZkaZNwDUxTnKgw2an03JLYcTcPUFQayyMx4Du5ibsm3JqOwP54LbLDcAHErzV7TKol3EsXVdD4tAMXCRKFQYT08x6UXFG406tW2yLO8+Q8Ah/AOYFs2rDjSEcv5vbZ+hsR6oV68i4c2jTsbMKzsWu/YTwKzTVen6TlnHYjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNlqMDCB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FCF3C4AF0E;
	Thu,  6 Jun 2024 06:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717657073;
	bh=Y1QGCsG4sNiWJEzr1Fn7n1E794mS092qLQjOEa8ZQYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GNlqMDCBUsnnK0DuaVMMIuoZ5tNuAdvFxjzWX/XSleUj9AK/fSYYeslNQadVN78dj
	 QvbgHGzNksPIGIAiAEZp07xBum4dwl/ZpGKNle8Z6GyGDRU8RBeVATID3yRI3pkStm
	 RIhf0Cz9o9kxC/d1BjcBONmdTEpUyquxQjTJDqU+X7VutRvTHRQDuQ44c5dTaT1kTG
	 O8zuwUFrJu9EZrdG8iwkYgr4sgvdW2Vz1Cp8Pw4pwbGQtrxcULmdSmrEkGWB1hpCjZ
	 W3rGO3ETAHzzdDhkKCesv5zhLbkksbVnaixR+C1MiOXxmP9sMpN4dGG2xSXCZin5Ny
	 PvvbBA9Ei9OPQ==
Date: Thu, 6 Jun 2024 08:57:47 +0200
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
Message-ID: <fupsiajh2za5r7itt2naxtynyqiwpw3efubrjmydd5ohypo3jg@2u44rbhbvmym>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
 <ZmBZPHbDv7ma_JaJ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmBZPHbDv7ma_JaJ@hovoldconsulting.com>

On Jun 05 2024, Johan Hovold wrote:
> Hi Jiri and Benjamin,
> 
> On Tue, May 07, 2024 at 04:48:14PM +0200, Johan Hovold wrote:
> > The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
> > before sending commands after having deasserted reset during power on.
> > 
> > This series switches the X13s devicetree to use the Elan specific
> > binding so that the OS can determine the required power-on sequence and
> > make sure that the controller is always detected during boot. [1]
> 
> > The devicetree changes are expected to go in through the Qualcomm tree
> > once the binding and driver updates have been merged.
> 
> > [1] The reset signal is currently deasserted using the pin configuration
> >     and the controller would be detected if probe is deferred or if user
> >     space triggers a reprobe through sysfs.
> 
> > Johan Hovold (7):
> >   dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema
> >   dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M
> >   dt-bindings: HID: i2c-hid: elan: add 'no-reset-on-power-off' property
> >   HID: i2c-hid: elan: fix reset suspend current leakage
> 
> Could you consider picking the first four patches up for 6.10-rc3 so
> that Bjorn can take the devicetree changes?

We definitely can. But if it makes things easier, Bjorn can also take
the whole series through his tree with my Acked-by.

If I don't get answer by tomorrow I'll apply the first 4 in the hid
tree.

Cheers,
Benjamin

> 
> >   arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
> >   arm64: dts: qcom: sc8280xp-crd: use external pull up for touch reset
> >   arm64: defconfig: enable Elan i2c-hid driver
> 
> Johan

