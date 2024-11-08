Return-Path: <linux-input+bounces-7985-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD27F9C1E28
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 14:34:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76A3FB22E87
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 13:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91DD1EF923;
	Fri,  8 Nov 2024 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBOmfKI4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCD91EF0BA;
	Fri,  8 Nov 2024 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072818; cv=none; b=V0FFMldOd22NjUzbmBUbxmRYd8VMVTslerNlgVL76joaAWwtB2DmHv6Gd9lGKmbUJPNDndgbDkZPmN04GVsmiqUms3yY0UHmVwMR1tv/9OQBcthLqjA71Hz5NvSR/wEcM4TAn3UIlg7hd6qPFqlQV+oC2gBNyHaeO9DHPda/3Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072818; c=relaxed/simple;
	bh=zCA/JpP4hG7Cm20AZD8gvPB3WdwCtYmRnnxOWoGkJzg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=piiVd17WcTVv9hqZNWtjUnvgC35v4h4VzdpmsInCtnSfxxl/ze5sDjwPOxBVuikcrhls5RtyVfWaRD3OIWo3dYUmAsu1bLp5g08KTX7NgcGirriXHzXzqqq8F42A+TlJj2TghV5lliwGsPWZPIiYWgnc92w7PuBt2rLM5gYU+rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBOmfKI4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BB0C4CED0;
	Fri,  8 Nov 2024 13:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072818;
	bh=zCA/JpP4hG7Cm20AZD8gvPB3WdwCtYmRnnxOWoGkJzg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=HBOmfKI4MYUGQmfoz99SmLEyR+oQTtmsCkxsFQjjg77I4+/KwV9b1kTX/cRUXTg+H
	 nkOR6UugCu4E29ZHZQlIkvFxgaIvEUPbgNot+qXnfMjh8tNJPCiEJllTRqcp2X6SMn
	 Cv7Sc2uArxknk7VLL2r34ocwJol7/LYFiKfhnZ/O60XwJoUTcCW2C3Fx87uut591t3
	 zihwpCf2gD24zqoDTGJ5QRIjUvgZaWBkZptx1tqBPMyanpyHuwKMKdy03KTPX6I1Z0
	 A03Kzt+nngk8Ny1NBItb9gU4N3ZFrX5dmDOOPwY5L9GFS1prVNbSYjm96TFuPKMPDa
	 FEx0gp+TJdEkw==
Date: Fri, 08 Nov 2024 07:33:36 -0600
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
Cc: bentiss@kernel.org, linux-kernel@vger.kernel.org, 
 conor.dooley@microchip.com, hbarnor@chromium.org, krzk@kernel.org, 
 dianders@chromium.org, linux-input@vger.kernel.org, 
 dmitry.torokhov@gmail.com, jikos@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20241108120311.87795-3-charles.goodix@gmail.com>
References: <20241108120311.87795-1-charles.goodix@gmail.com>
 <20241108120311.87795-3-charles.goodix@gmail.com>
Message-Id: <173107281430.1752099.17871606474453144556.robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: input: gt7986u-spifw: Remove
 hid-report-addr property


On Fri, 08 Nov 2024 20:03:11 +0800, Charles Wang wrote:
> Since all boards use the same address, drop the goodix,hid-report-addr
> property and hardcode it in the driver as a default value.
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../devicetree/bindings/input/goodix,gt7986u-spifw.yaml    | 7 -------
>  1 file changed, 7 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108120311.87795-3-charles.goodix@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


