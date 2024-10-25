Return-Path: <linux-input+bounces-7699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 672DB9B01D9
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 14:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD671F2251A
	for <lists+linux-input@lfdr.de>; Fri, 25 Oct 2024 12:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C446A1FF020;
	Fri, 25 Oct 2024 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0ciwRAB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9624B1D8E1A;
	Fri, 25 Oct 2024 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729857795; cv=none; b=QzKlPZWrWx81I4Wf09JOEdcNYDPnaJjP2OHtMWbP5NCYU6PVYEp4APIn+T8tkZSudA1czOxvg94gJA2nYUzCmelOS/sJAQUaXlxALO1DYJGoy8wqRMreIXCAWhwHkQDf2pnTR56ascpQbl4wWzrK0molyuLjcd3FHkxOr1XbkFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729857795; c=relaxed/simple;
	bh=YIPgskxaRgmNM/C1y0SMv1wfYyZ2ZORMIhQS1t9qut0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljgZYsmPnBxqLp0d89dmJk6GSI5nYUxNs672Gk0sf15SUGzGPD/02Bw8S3lUby3O2YzLaVLIkvQ0VbanVLWv8sTSuNCSypfFbTrqIQ8WKzabKCFbrOljHwyFgEkkWCqol9RRQBpgsDHyI5Mrsw/TQkMpMsl100HWIre+++ESAxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0ciwRAB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD2AC4CEC3;
	Fri, 25 Oct 2024 12:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729857795;
	bh=YIPgskxaRgmNM/C1y0SMv1wfYyZ2ZORMIhQS1t9qut0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0ciwRABqowSjoU3zM1Mn3cqHIDRt+YSIC1bx40VWUjL0/zauFvsuSOs/PTnBHKZk
	 DiMGpi29qC7LyXt0x34r3dJD3AL1HGcp7pH4HOlXf7hxi8uweojsUtn59//24nH+j2
	 00Qpu7Y+KSgwbZdWC5Q+NS1+yGM7Fl4saXMPnGRlrxtZ1lUBgAJGXDtWG5eEaeTTF1
	 +KgsbXWrg2cQmZ8lGFFT1Ffl6QITkKgk6aWOCo94OtXgCe54K3yfrpCe9plut/ajMw
	 54tmZ7VwPp8d1ixt/frC5+VP4zDsM1pGNZR5dw0J5+Hp7gZLmrEZo/TMMaEZjikOgT
	 icl15hROOO5UQ==
Date: Fri, 25 Oct 2024 14:03:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dianders@chromium.org, dmitry.torokhov@gmail.com, hbarnor@chromium.org, 
	conor.dooley@microchip.com, jikos@kernel.org, bentiss@kernel.org, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
References: <20241025114642.40793-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025114642.40793-2-charles.goodix@gmail.com>

On Fri, Oct 25, 2024 at 07:46:43PM +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u.yaml        | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> new file mode 100644
> index 000000000..849117639
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GOODIX GT7986U SPI HID Touchscreen

GOODIX or Goodix?

> +
> +maintainers:
> +  - Charles Wang <charles.goodix@gmail.com>
> +
> +description: Supports the Goodix GT7986U touchscreen.
> +  This touch controller reports data packaged according to the HID protocol,
> +  but is incompatible with Microsoft's HID-over-SPI protocol.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt7986u-spi

Compatible is already documented and nothing here explains why we should
spi variant.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  goodix,hid-report-addr:

I do not see this patch addressing previous review. Sending something
like this as v1 after long discussions also does not help.

No, you keep sending the same and the same, without improvements.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The register address for retrieving HID report data.
> +      This address is related to the device firmware and may
> +      change after a firmware update.
> +
> +  spi-max-frequency: true
> +
> +additionalProperties: false

Wasn't there a comment about this as well? This goes after required:
block.

Best regards,
Krzysztof


