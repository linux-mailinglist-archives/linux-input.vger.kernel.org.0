Return-Path: <linux-input+bounces-7410-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ED499EF8D
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 16:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67DA1F24790
	for <lists+linux-input@lfdr.de>; Tue, 15 Oct 2024 14:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCDC1B2191;
	Tue, 15 Oct 2024 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUitH/qC"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E1F1FC7CF;
	Tue, 15 Oct 2024 14:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729002424; cv=none; b=bO8y2ulQDUWwklLMy3o99bwgd9VPT/GveE4/3V+uDyu+2EmyqphUUu93GAO8ZhlGbqmLvPN+aGWPzb54ZyfTbXYO77CaZoZy+4s8wF2OAX3dBeQeE23xFbTG1+DY9oZfvNHtguW29pz51NcqpFfwEDGdhjBcoEcN/Dvp11QBN4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729002424; c=relaxed/simple;
	bh=6ev/262Ol0s7OAdxXxHZ06Pvd3q4TF+wxwIAYjD+2R0=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=C8Lc1ltP/xPSIettm5sOefvk2MmqWJqxfNbZRPeiv+lDhnpu9Ma0SK0vJx//pU5hKYYayhJ3Cj2kGKja/JKC2svyiomxvZen/UtauBKhsgNvBfYZBEW8jCY3WbMrrKOQuKLIVEft2alGmCwzX0qWTVjyyPahYauY89T8SgxFN5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NUitH/qC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE188C4CEC6;
	Tue, 15 Oct 2024 14:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729002424;
	bh=6ev/262Ol0s7OAdxXxHZ06Pvd3q4TF+wxwIAYjD+2R0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=NUitH/qC5feNe9f8lxe/O5lEMsNSiFlXuTVd7B8yZuYBp1qbj9XzQFlCNQYxzFBNh
	 PE/sDa98Nx88X5ff6yMC/cypsbLjLikopZa5PwsxfLNN5vmgAZD5u68FZ4PNQXkTwT
	 HnIJGd1GOdqMnO36k/HIuFbK4TewY2OmsWYTEztWXUcpmLzMKgjTifyWRsQkEFcCMM
	 GWzAJ9nt+qkvf8JBRuGY5GsoiWK2AWMn7QVlBYvxmo1dDN/9KDm6YeN400czC0RQm/
	 9nIsil5cUViH9rTAfo6AMlIr3L7EO8plvkDtUYTLZjyuJqOgTeIykH/ZBs323Yasjr
	 WJLnMYT2lp2+g==
Date: Tue, 15 Oct 2024 09:27:02 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Chan <gchan9527@gmail.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
 Del Regno <kholk11@gmail.com>, linux-kernel@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20241015-nt36xxx-v1-1-3919d0bffee6@gmail.com>
References: <20241015-nt36xxx-v1-0-3919d0bffee6@gmail.com>
 <20241015-nt36xxx-v1-1-3919d0bffee6@gmail.com>
Message-Id: <172900242289.881163.3310212462918589940.robh@kernel.org>
Subject: Re: [PATCH RFC/RFT 1/3] dt-bindings: touchscreen: Add binding for
 Novatek NT36xxx series driver


On Tue, 15 Oct 2024 20:53:29 +0800, George Chan wrote:
> Add binding for the Novatek NT36xxx series touchscreen driver.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> Signed-off-by: George Chan <gchan9527@gmail.com>
> ---
>  .../bindings/input/touchscreen/nt36xxx.yaml        | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml:19:9: [warning] wrong indentation: expected 6 but found 8 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml: title: 'Novatek NT36xxx series touchscreen controller Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241015-nt36xxx-v1-1-3919d0bffee6@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


