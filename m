Return-Path: <linux-input+bounces-8443-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B12ED9E8EA1
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 10:24:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE3D71883B00
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2024 09:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE1C321639E;
	Mon,  9 Dec 2024 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H7vxzXYl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD2A216391;
	Mon,  9 Dec 2024 09:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733736240; cv=none; b=ZkRNWA0t3ZxxfYYg4zQUmJtfA2LbXMm7WDQPblLK2covU6M1Oa2oF1L0CtuXsamOKKQw5DoCyLs25Ua4m+3aCuPfJ30WKISnboAtUHDHbCwXAEEkuY6kVaQGyeRz4RFDFmAb0tu16dSYl555iEr6oH4yljrNRT/B5PL+h+i7DjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733736240; c=relaxed/simple;
	bh=j6OMdHnj5bwMA4tTNTUu9UZbByzXzbqHoSB2mg8RA1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPOu++i3zvxP5qdYNnA0LGRxr9VFU4Anu+RPRe82hrYRCkBa9tTpBzOoX0UZvzEYUQgKqlf9zA/bjVjPjEEEf3hzuU4fkvktB6M6a39rND6snj6xOSv0Phq//oYsqLgK0jbC+nZrxxVkn8Lt80rpWhZkoKEf/UsE0wjJevlH5DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H7vxzXYl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F89FC4CEE0;
	Mon,  9 Dec 2024 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733736240;
	bh=j6OMdHnj5bwMA4tTNTUu9UZbByzXzbqHoSB2mg8RA1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7vxzXYlWUXMAmT+pW2/YD6bvfCEId/DeT42lRvcehUj2muJr8OFN22Pc2jdqpXk/
	 d3pG40J/NTftbyus2XfXJL8ZDhPXsQUpFxTZ3mvHl5JGJJN4nNeR09NlKsrj4xdwVQ
	 Xs8j4/zCZF1qCe7TylyHmwNIQIYza/5reD5bTGgfiGS8LTo5azjP2ZvFOGXytsQ6CA
	 S3q8vsU7aHaKQFnnQ+wEfgz8qLse21gKKYIVPfcOJc39y6N4pAvbrIjzDPEo0a2H5I
	 LAD4xAOjtrSy77BwtzU33Srx/uE5pwUASiDCJTAdBGqKQWs0XJUiQZztMSc5XryIf5
	 gkduh54aoZfEg==
Date: Mon, 9 Dec 2024 10:23:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Joel Selvaraj <foss@joelselvaraj.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: input: touchscreen: edt-ft5x06: add
 panel property
Message-ID: <psgcnoeyutfkebbi2aavqrcsdqslfu74gmchc4csvkzssniqua@i4n5x6rpdhtr>
References: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
 <20241208-pocof1-touchscreen-support-v2-1-5a6e7739ef45@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241208-pocof1-touchscreen-support-v2-1-5a6e7739ef45@joelselvaraj.com>

On Sun, Dec 08, 2024 at 09:23:27AM -0600, Joel Selvaraj wrote:
> In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
> FT8719 touchscreen is integrally connected to the display panel
> (EBBG FT8719) and thus should be power sequenced together with display
> panel for proper functioning. Add the panel property which optionally
> allows to link panel to the touchscreen.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>

SoB mismatch.

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run 'scripts/checkpatch.pl --strict' and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

>  Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> index 70a922e213f2a..35a6ac4ded7c7 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> @@ -103,6 +103,7 @@ properties:
>      minimum: 0
>      maximum: 255
>  
> +  panel: true

So you just list all properties from touchscreen... no, use
unevaluatedProperties instead of additionalProperties.

Best regards,
Krzysztof


