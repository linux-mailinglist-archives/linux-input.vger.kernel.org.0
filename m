Return-Path: <linux-input+bounces-14180-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB55B2DEC8
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 16:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0EEB7AACB9
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 14:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56E52641E3;
	Wed, 20 Aug 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oluJR3lY"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BB0263F28;
	Wed, 20 Aug 2025 14:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755699148; cv=none; b=FBvslu+l+rRb57lGlqKbhiv98YJi55o5qEHzl9EvzzgExx7g99avar7XQkpH8z5U5Eek13okefq8LG5Vs3intN0prOl0ZfMnqLnVGu8ga4SsDRPx4fck5E+RLzA1cz9QdDV6g45/LGvZd9WVDCUB/LhwBVDZpXxrn73Ny/DsJ9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755699148; c=relaxed/simple;
	bh=sOQr8yffbQ/+IOQl6NWTMrHW4wUlh8Jhbg3Cjrv2hcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uX3jt/+1suc8JuhYt+zI6CBZfe7hMkneDLQoqiypNzpAvPyPmP9grth+Bns8wCwoqaCNE5yS+UYMEqnSUwmZ45HWVGVxPTrmkmiUSM18QYXPsqzSiFrWhvjQGuRBv0EW6PNra8YiGFYXxuyitseOjpcTeEKRCGgvX1cCeYXqF+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oluJR3lY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3D8C116B1;
	Wed, 20 Aug 2025 14:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699148;
	bh=sOQr8yffbQ/+IOQl6NWTMrHW4wUlh8Jhbg3Cjrv2hcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oluJR3lYHewJGVf/ZHSt7d9jYsvqkVGm3QAjzOYMqOdh/RTlO7tPxiIjHi7iriEUF
	 xWDluKUH6gJiPdtukcB0GaEmfFu/2YC/KoHsjnpST4w5mXrAkbCWYeVfPq4Wu/NMxt
	 zTLJAk4pOSI1zcwGL4VzJ6MPbwfH+o1lTobJuR0r5E+cUy6Vx1+h8K7rQH2WiCCqWi
	 KOOJEJll2siPgiABDeN0+o63OqHL6aPx0SV1QriA9zFQyqADKWiIQsLbO2FWCHi5g7
	 QphzfGldwZUOIkTsDuTdrqNMXuNjDfrFQTdcioOs772WmY6KnNeDBI5Av352KlS/DR
	 09BS/onYFPAfw==
Date: Wed, 20 Aug 2025 09:12:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: shuah@kernel.org, peter.ujfalusi@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH v4] input: dt-bindings: ti,twl4030-keypad: convert to DT
 schema
Message-ID: <175569914663.3379918.5538718443722944593.robh@kernel.org>
References: <20250819222823.157943-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819222823.157943-1-jihed.chaibi.dev@gmail.com>


On Wed, 20 Aug 2025 00:28:23 +0200, Jihed Chaibi wrote:
> Convert the legacy TXT binding for the TWL4030 keypad module
> to the modern YAML DT schema format. This adds formal validation
> and improves documentation by inheriting from the matrix-keymap schema.
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> 
> ---
> Changes in v4:
>  - No changes.
>  - This patch is split from larger series per maintainer feedback.
>  - v3 link:
>     https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/
> 
> Changes in v3:
>  - Made 'linux,keymap' a required property as suggested by the reviewer.
> 
> Changes in v2:
>  - Simplified the description field by removing redundant '|'
>  as it does not affect formatting in this context.
> ---
>  .../bindings/input/ti,twl4030-keypad.yaml     | 59 +++++++++++++++++++
>  .../bindings/input/twl4030-keypad.txt         | 27 ---------
>  2 files changed, 59 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/ti,twl4030-keypad.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/twl4030-keypad.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


