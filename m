Return-Path: <linux-input+bounces-14131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 969B7B2B969
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 08:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3377B1708BB
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 06:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B342652A4;
	Tue, 19 Aug 2025 06:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bq6PI60W"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6072620C3;
	Tue, 19 Aug 2025 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755584957; cv=none; b=ecerGtFz5TGypuVxH+iQ7NrmGYffrR9dnXSAECVkD3+Fb+oOcZwPTvOQL3Q5VMPAtCzvVSvV8aDIFzKhkCeXrU16jwIAACwSs2wrgQhwbOG5ZZf9/axkfjyyxxRgzlZ/vyA9QxbhO9h+MwAVV31isewDLGEZ5cxrX9rJQgOTcSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755584957; c=relaxed/simple;
	bh=Ds/kYnJixEUoFRnXtUsQJvHiSZQr8WOM/RaU3EBAFv4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PM6EjmR2gY5V+VoiDprEqyvtbJc6Cli8pNWS5xckovBGJ8z0H8ALOSjQhaASQux78jGqGaF852jp/PeqIgm74xNgdoA6JA7swNYcG80q4JKX15Zv1rngXiDLPofaoyxQ2r+YLUiTvIx/tnBLGYPjgpBAmRyFjCnX+ApjYLfv1Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bq6PI60W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6090C4CEF4;
	Tue, 19 Aug 2025 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755584956;
	bh=Ds/kYnJixEUoFRnXtUsQJvHiSZQr8WOM/RaU3EBAFv4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bq6PI60WYmKRIGvFdLyxhcqWoHr48sPYL6I8r0PFSxnU3m4eNKGSxHd91V9h2lWIT
	 mxBIDYKLM3FduoRiOtyqArmX6JiKY3Q/4DYZgEctttb6XHV6CbM0vhUpc7zXHWMkLB
	 RGrbMT7Ar5+OFbeVdCRlpg09dn4WMX7F3oSGvkxWFQz3veLOF8DjnSC4TekSzjTDmy
	 0NbzL5ldXoPtNV3IrJuvhQzZPbMbnnIha3OG6T3jRvF2/xqgdS4hKNUKdy7tfE32jY
	 MTuXtluTk88RTTOPwqTZsRkDhja2lCv5ZLaAi9B7FyqCwadE4/JnEoi/Kl0CxVV8x2
	 ulCDqTsZjkIwg==
Date: Tue, 19 Aug 2025 01:29:15 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com, 
 linux-input@vger.kernel.org, dianders@chromium.org, bentiss@kernel.org, 
 devicetree@vger.kernel.org, jikos@kernel.org, conor+dt@kernel.org, 
 krzk+dt@kernel.org
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
In-Reply-To: <20250819034852.1230264-2-yelangyan@huaqin.corp-partner.google.com>
References: <20250819034852.1230264-1-yelangyan@huaqin.corp-partner.google.com>
 <20250819034852.1230264-2-yelangyan@huaqin.corp-partner.google.com>
Message-Id: <175558495339.3265543.8952208535079492565.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: HID: i2c-hid: parade: Introduce
 bindings for Parade tc3408


On Tue, 19 Aug 2025 11:48:51 +0800, Langyan Ye wrote:
> The tc3408 touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---
>  .../bindings/input/parade,tc3408.yaml         | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/parade,tc3408.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819034852.1230264-2-yelangyan@huaqin.corp-partner.google.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


