Return-Path: <linux-input+bounces-14869-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E34B86D60
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 22:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23A863B3E2E
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 20:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7BB31AF1E;
	Thu, 18 Sep 2025 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9Gsdkvh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9DA27EC73;
	Thu, 18 Sep 2025 20:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758226123; cv=none; b=YlVweRwYcilc0psHjEItFpSWV8meIExJ7kZW2VGTGvrSrrwiZ9zwA17wf+jxLG/Amfkvi6Z9WDGsLYOLtB1sRnrStw1IRa+gigpUmSp1rgGdoEKbsS/NDStdMdBgbkWUhgIeCiJsAdxM2KORN6fmT9cp6Qc3Gj974JWTV4Z3Ip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758226123; c=relaxed/simple;
	bh=Vms/KylUpk9uvkMpfKe1ZNBexCpigHmUzXBTWL0d1ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUbrLV99BLELcuVq58AfABuwjybTBF8YAKO7kIK9vOlBDcRymIl9YXYtdaWdzMx5o8aEu41GnnwMvzLz2iPm0XF9gC6dlexuxI43gabNBLvzGM/lHNcAfF6qG/AQKl1DlFMro95qNwtX0kd0C0+SxXICwSYCksInV2gVGVjqJ2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9Gsdkvh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B310AC4CEE7;
	Thu, 18 Sep 2025 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226123;
	bh=Vms/KylUpk9uvkMpfKe1ZNBexCpigHmUzXBTWL0d1ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9Gsdkvhmd/FG6NSz7hlzyU88v9DJBZ1Tto9fVZ5LT3gwAkWNbmP+eyqSFo6BhfdA
	 /mh6u2ENOYiuYTIHAkYOclSdng7vK6goR1LDJpiou9FePr5Dez4XrRC6BXb6jbeSDa
	 jVlBaUBqpVBcWHuulDMVwqfQunSq3Kj8VU5xqVNraxOhFzfOS8ktHW+j8OLjbrqLPR
	 h7oaqRt3BQMWexq/I/YY9RcpQq7Xi2ms5A/wCuKVd6h0QIK73mJxttYG9C8E8ZIMq9
	 xxJlXK7FSnmWXf/t0tF3XOx0Xfo8/7YPeRWZC/fOoFWM/l75B1wkJUIg4+hpKMzM5z
	 91IcjGP0LuTDg==
Date: Thu, 18 Sep 2025 15:08:40 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: touchscreen: convert eeti bindings
 to json schema
Message-ID: <20250918200840.GA2541285-robh@kernel.org>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
 <20250918153630.2535208-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918153630.2535208-2-dario.binacchi@amarulasolutions.com>

On Thu, Sep 18, 2025 at 05:36:07PM +0200, Dario Binacchi wrote:
> Convert EETI touchscreen controller device tree binding to json-schema.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Added in v2
> 
>  .../bindings/input/touchscreen/eeti.txt       | 30 ---------
>  .../bindings/input/touchscreen/eeti.yaml      | 62 +++++++++++++++++++

eeti,exc3000-i2c.yaml

>  2 files changed, 62 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/eeti.yaml

