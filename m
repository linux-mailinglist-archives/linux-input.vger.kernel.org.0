Return-Path: <linux-input+bounces-4356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C53908C53
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 15:13:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16B4F2897CD
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 13:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3720F1991B3;
	Fri, 14 Jun 2024 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA1MVbJU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C14114884B;
	Fri, 14 Jun 2024 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718370828; cv=none; b=puqAOxamSdHQSZzjv9+KcH/tvbSaGrUKSf9FFTyadpr22pqxJEmhrAOpx/8r5FdHP5A73kx+095oqohFWNoY75Ekp89XjJjIYLjXUSi/HslxXy805bmV5tgsF2WBJgIeRRT5/iRtVkrhMokOu9FIHxpxtJRZRt8BEYSrR0xgn4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718370828; c=relaxed/simple;
	bh=EFsyVQ9yc6G9SNkWxJq+v1+LXQUZrrnNQurQM1FlX6s=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=iYE1wcGu2K7U6t4wDXCI6ZpbaAZZTP9FUeuzN4oxFiX3kTY697o9YV8DJUdpeTBlcnEZKOjjLh2m6W4AQ7uUQMqsF7T0uaO8hvYel5w2nUHFZ1HDc73ShkgNPNRraDnWo05p1s1tAf7SMoZGiirekqWs3PeomEvCSBqXgcmjfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA1MVbJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A720C2BD10;
	Fri, 14 Jun 2024 13:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718370827;
	bh=EFsyVQ9yc6G9SNkWxJq+v1+LXQUZrrnNQurQM1FlX6s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=dA1MVbJUZltppLTH8LESe54yCtaHVcKLmgwu82ZiNpVu8AggLlMG0K2M0QSeyR0/0
	 MwLNu6vTnwyIDN08hXJINKisiUbpO5SHnoKqvMYyjOMSw3NnuleWBGii+jqWFFmq0s
	 S2lAs8wR7XGRikXxpYunjPD7aOMENhDsb/smD3Q0meScwXhCWuzRHsYPODU483ODx4
	 0qoq+ah2qupbgmBmAKDQF1YM5/bA5VwDGDiGRZmxlG7Xj4z6C0A/u+mKoIPpip78Nc
	 oOcj8ik2T/T/zxNRl+kIJQbgdzxuyA3tNTfMeTJtVQF2FyOMc8qM4y6k27wkncYZEy
	 Y8uDK7LFdYj0A==
Date: Fri, 14 Jun 2024 07:13:46 -0600
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
Cc: dan.carpenter@linaro.org, jikos@kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, bentiss@kernel.org, 
 hbarnor@chromium.org, dianders@chromium.org, dmitry.torokhov@gmail.com
In-Reply-To: <20240614121538.236727-3-charles.goodix@gmail.com>
References: <20240614121538.236727-1-charles.goodix@gmail.com>
 <20240614121538.236727-3-charles.goodix@gmail.com>
Message-Id: <171837082626.626508.10284320881127428760.robh@kernel.org>
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Goodix SPI HID Touchscreen


On Fri, 14 Jun 2024 20:15:38 +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/goodix,gt7986u.example.dtb: touchscreen@0: 'spi-max-frequency' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240614121538.236727-3-charles.goodix@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


