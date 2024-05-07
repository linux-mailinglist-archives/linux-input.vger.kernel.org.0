Return-Path: <linux-input+bounces-3551-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 119CF8BE5F0
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3ECB91C22294
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:30:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6276315CD53;
	Tue,  7 May 2024 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpzj+KH+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0031DFEA;
	Tue,  7 May 2024 14:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092233; cv=none; b=PP28ex1PuXJPlAAsp5bqJsVphh0VXY5NLrtmCMyfoX1NMx0xSfhF5MPE8qIa4s99V4OPUi8pRxP341Uz/jSV15CIpkaSoWqXKZmGX7kLVJzyg6lAJEuJjJCRCGwtSXbv8XrmEyARf4jGKQE23EW+9eEJY+IT9VQ6H0OVakwVGmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092233; c=relaxed/simple;
	bh=o0lOuJYJuGexb0hyjD9GPEecAcOFpUWl3uozSm2KGHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1bgDRv0Q9H5eT8XBh+y31tlvtdeIDpeIKoJyRN/4+akE525DlgM4pR1LnXoLC2EuDARw/Zl8R1AMzwhBztgD/oIMySzd6H8sVDHFkTw84v3y3S7rT7MnUWbimh2tvpmGdV45Iai/6ESSB+Odbs1Rs4lBarAqoF4pHrW3F93XAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpzj+KH+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A090BC2BBFC;
	Tue,  7 May 2024 14:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092232;
	bh=o0lOuJYJuGexb0hyjD9GPEecAcOFpUWl3uozSm2KGHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qpzj+KH+gkUheVxRL6XFPOxp8sBEtegOzZjQBdOGZoMCzi5fyRliO0IjMa1AuhFVk
	 rvxNwMr7k8P7EjsXFUqiyjHZdCbzXYR3R8YvzXCJdLOSRdWkdLsz2a5GYW7x+G+Lrj
	 6O5pfJQkBVI602nWS0BzXgWcMfAYDLvulliSUs4FL1tsdcsH0f+jflANFkz3ZPocPV
	 mfJ2WWRnixUXZbuyfmamTkmjgaUMm1JymEJT/d/NXM85AOlIlzzcobciLd3lY7wE1a
	 zG3JEyWf9Ce+hIUrwHUB0UxC8n35vz8RL/v5noKXiuyRZGumbltle+3C9CpLTaYgzV
	 0R6jwbfWAd+sQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s4Lpy-000000002rs-2neG;
	Tue, 07 May 2024 16:30:34 +0200
Date: Tue, 7 May 2024 16:30:34 +0200
From: Johan Hovold <johan@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: HID: i2c-hid: elan: add
 'no-reset-on-power-off' property
Message-ID: <Zjo7CuT7UyQC57Rr@hovoldconsulting.com>
References: <20240423134611.31979-1-johan+linaro@kernel.org>
 <20240423134611.31979-4-johan+linaro@kernel.org>
 <CACRpkdYXfZwBdLSTTPbruD9qynOPuQBOZjCwA_6eE+1MUBCkgA@mail.gmail.com>
 <ZjSksM07OlgpE3yO@hovoldconsulting.com>
 <CACRpkdYZWixc1E3=Y2j0etuDS7vNY3QcqK2Qiac_KPorr7s0Ug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYZWixc1E3=Y2j0etuDS7vNY3QcqK2Qiac_KPorr7s0Ug@mail.gmail.com>

On Mon, May 06, 2024 at 08:29:40AM +0200, Linus Walleij wrote:

> +  no-reset-on-power-off:
> +    type: boolean
> +    description:
> +      Reset line is wired so that it can be left deasserted when the power
> +      supply is off.
> 
> To be nitpicky: *should* be left deasserted rather than *can* be left
> deasserted, right? If the behaviour is desirable but not strictly
> required.

I considered that too, but settled on the above description as it is
pure hardware description and leaving the decision to act on it up to
the OS (e.g. if support is implemented).

On the other hand, the "should" is already implied by the property name
so perhaps there's no reason not to include it also in the description:

+  no-reset-on-power-off:
+    type: boolean
+    description:
+      Reset line is wired so that it can (and should) be left
+      deasserted when the power supply is off.

And "should" (unlike "shall") still leaves room for an OS to ignore it
at the cost of increased power consumption.

Johan

