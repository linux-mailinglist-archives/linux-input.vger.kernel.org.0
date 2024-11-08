Return-Path: <linux-input+bounces-7984-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BD9C1E25
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 14:33:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23EE6289802
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 13:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0EB1EE000;
	Fri,  8 Nov 2024 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX7otQVr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CAB1EBFEC;
	Fri,  8 Nov 2024 13:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072816; cv=none; b=aqDYvw8wVCHDWzheUyV37W5b4uH9H8U65dx3O+aYT8NyqpVUq+5QPYaQ2GIA8OfRJKKsvtfGHbY4y8PyoACcqSqV45SwCXUPq2JGvq4Nxwu5p16QOM763AfDqZJMri2UL01YIjzBGKquApkiLIwY5+HfYlORl9ZtwCviBJgDQlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072816; c=relaxed/simple;
	bh=0+9I6a17DhDluTMcO1f3FyZp7HLkpHtnP3pCVCnjzsk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=BUbVnhhXTT7QUcaqvgZEsMU1pCDU15UIqv3cPAXZ+Qej5FNBAyOyOgKHkEpys4TIrUKTM88Emr0jIS4EDnRY4G9beG4GoI+hr2dtKlHniHQfkh93sfs3EZ3+cUpCOFU9UY2l91oFzCwtf5vVplNwC8mcdBn8JnlJSGUfooIqjW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lX7otQVr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119BFC4CECD;
	Fri,  8 Nov 2024 13:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072816;
	bh=0+9I6a17DhDluTMcO1f3FyZp7HLkpHtnP3pCVCnjzsk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=lX7otQVrBkqMWgJFBkbg0DVYa92IZL+Ucqodfh5Xw8gJJ2QBPpBSdhkAICBPS3A7X
	 dP1tfsTcDFmUEk8+TeO8wZjcEOtMXGqn/ioWLePPHkNiRJcWBoIA8zoLLSf8PwfP1z
	 fZAN6hw/TkYJkJBSwL2xV5J0wHcXGIGMNLwtAcdlHVqQN/ZiQo5C9AOSHmoCpXqkCO
	 1t2Iy+OrZXKug71713zhiihWHtyZWsg4qNomQjZhuuic0YgPlC6MBoeFZZQtWoVTWc
	 W4tIN9Jp1GJPKngM+YysUVYedGPuko+svalu9oU8464h+DRlhjWVOecNMtKxfq4pFc
	 OZBHlWOM1GdFQ==
Date: Fri, 08 Nov 2024 07:33:34 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: conor.dooley@microchip.com, linux-input@vger.kernel.org, 
 bentiss@kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, 
 hbarnor@chromium.org, devicetree@vger.kernel.org, dianders@chromium.org, 
 jikos@kernel.org, krzk@kernel.org
In-Reply-To: <20241108120311.87795-2-charles.goodix@gmail.com>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-2-charles.goodix@gmail.com>
Message-Id: <173107281349.1752060.15353696141928017835.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen


On Fri, 08 Nov 2024 20:03:10 +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
> 
> NOTE: these bindings are distinct from the bindings used with the
> GT7986U when the chip is running I2C firmware. For some background,
> see discussion on the mailing lists in the thread:
> 
> https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u-spifw.yaml  | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml:16:7: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml: ignoring, error parsing file
./Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml:16:7: mapping values are not allowed in this context
make[2]: *** Deleting file 'Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.example.dts'
Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml:16:7: mapping values are not allowed in this context
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_binding_check] Error 2
make: *** [Makefile:224: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108120311.87795-2-charles.goodix@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


