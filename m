Return-Path: <linux-input+bounces-13463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3E6B003C7
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 15:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26C6D5A528F
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 13:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2280259C85;
	Thu, 10 Jul 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXvWA31U"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964B585C5E;
	Thu, 10 Jul 2025 13:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752154529; cv=none; b=VG8rDlIoY4bJDkVeco/h0IvmFw7HR5lkORNuj7aSFYITj1asoku2dOHg9iOKzcJLC1+onbcSP7j1/y47l0tI3vQ7ZsDXqEPF0YuxxqNoL32wyBxP4gS6SCjClWM5Q8ySmIM8ijIzu1TOrL89KFJiC5xuBKgXPH1U2S7fH8l56iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752154529; c=relaxed/simple;
	bh=/M9ZOPzseAGnVx1rmBuaTNmSZf0uj5N2aDhVIjjH//c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Xy3yAAAXV2SRJ31Ga1/7gzMlDsR78uYPdxV9scF791aNpjj0UT9CXALZsiZjqhZCd5MacO8lNs2VdmDoh8BkkDb3htgzsFFSssUvcVZZnLbS4AoxufE1EcaaojAkOcfitrKfOj/u8/2IWevH8K5+svNhTHbUuQ5U9ba8LZFb6+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXvWA31U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F8EC4CEED;
	Thu, 10 Jul 2025 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752154529;
	bh=/M9ZOPzseAGnVx1rmBuaTNmSZf0uj5N2aDhVIjjH//c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EXvWA31UTuNtfzdaSHQ8/iRGlSJoB2uv5Cmam2Y3bRByEnwnsWarTgkRa7chW0wv0
	 swQi+ElI9FUnSwECXBnsKhwlEvK5y825vqTFCjT5by88TfCPRUCjTNvSrQmSpWUP2M
	 DFjmPCi2ZJNeTzLAyq0biwbXjCDzuNGJu+guyBZpevLH1ogNDUJdBHYaGRkKk7mSY3
	 W+TjcNgpwcWL5RTx1IuMF2PdUqrahJd0bnhzjOvFZYI4yiVVXOm6W7J7WA9bmgW++Q
	 wnBBvBNO1cDBpAkb3rsRLwDz7Q9YUzOWOD9xWXE8lAoZTEfbpmhDYOW9nNKTQFj+q1
	 cRUcO/drvw/6w==
Date: Thu, 10 Jul 2025 08:35:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Charles Wang <charles.goodix@gmail.com>, devicetree@vger.kernel.org, 
 Hans de Goede <hansg@kernel.org>, Luke Jones <luke@ljones.dev>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ingo Molnar <mingo@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Len Brown <len.brown@intel.com>, Al Viro <viro@zeniv.linux.org.uk>
To: Pengyu Luo <mitltlatltl@gmail.com>
In-Reply-To: <20250710115733.226670-2-mitltlatltl@gmail.com>
References: <20250710115733.226670-1-mitltlatltl@gmail.com>
 <20250710115733.226670-2-mitltlatltl@gmail.com>
Message-Id: <175215452823.2039713.12986563371135237841.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: input: goodix,gt9916: Document
 stylus support


On Thu, 10 Jul 2025 19:57:32 +0800, Pengyu Luo wrote:
> Document stylus support. Optional support for DT properties:
>   - `goodix,stylus-enable`
>   - `goodix,stylus-pressure-level`
>   - `touchscreen-x-mm`
>   - `touchscreen-y-mm`
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../bindings/input/touchscreen/goodix,gt9916.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml: properties:goodix,stylus-enable: 'description' is a dependency of 'type'
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250710115733.226670-2-mitltlatltl@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


