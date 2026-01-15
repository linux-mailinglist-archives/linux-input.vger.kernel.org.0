Return-Path: <linux-input+bounces-17108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31384D239A9
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 10:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7604D30BF3C8
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 09:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E02F535BDA4;
	Thu, 15 Jan 2026 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtL0NWYA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD2E340DB2;
	Thu, 15 Jan 2026 09:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768469491; cv=none; b=uN2y9JFaFYt5MbHKebq0Z35ob+OFtgIX9MJhF6HplP0rrdQ2hDPH28hxrCnDz+OzXSMPXGbkTke0Z3Rp2Y1X4SIaDt4PEiptv7iikqbR/FX2atJz44gkIZU1MKaHBzA1dDObZ5ZLgnElDt1ESF7PuiLgEi6gdJfLkaGbf/ukReA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768469491; c=relaxed/simple;
	bh=85nyOC+PMKZbrfcZTOloKjnNCK91/LgSl873eJtc56A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MaeKstxfZrjZEvTzb/v8EabNw88SZbR8x1w6E7GSyW7NAd/nfxBKdhJEOB/PPBregF2I1PrgOI22Tnii6wTYujIBI75B1ekXjA4+uCw5K4c0EoWxckJs9GrhK0E5rbozum0Uti19W2Q9XAhMMbtaAniV2zmeEu0aSI3sTaZ40Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtL0NWYA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC86C116D0;
	Thu, 15 Jan 2026 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768469491;
	bh=85nyOC+PMKZbrfcZTOloKjnNCK91/LgSl873eJtc56A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtL0NWYAgAXZbK5lFwixXX0MO/YpqDjJ+/bfPQw0sDA6oMZige7nuoYm4nLJjB0qf
	 oo80zJz6qa3Wbx8jADkcFvLZjhAlxS+QQdEwkNa1dAPJY+uQjFupj/HQ8ojQYaYCyj
	 aAIiYIvzUVcqNIIkdE7TYLVSm0gMhxU5k93mJeNhTXiCiU/E+6m1xN+BJS//FKfSnW
	 zhFWiKiLQ6UCWWF69mEeOyqk9pfypMf9OEJ9VKjFnmWo+LFKQjlDBsUAHdQ9Aeu7RJ
	 Xpz/zjOLZbSIPO0xZg92xaiZhUn6BrB3+QMnwODhe2orEKkReKkqVwwoqbR+dxC50N
	 V+k4Ois4vMipg==
Date: Thu, 15 Jan 2026 10:31:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: SzczurekYT <szczurek@szczurek.yt>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <20260115-sceptical-crafty-ammonite-8a09ae@quoll>
References: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
 <20260114-touchscreen-patches-v2-1-4215f94c8aba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260114-touchscreen-patches-v2-1-4215f94c8aba@gmail.com>

On Wed, Jan 14, 2026 at 11:31:06AM +0200, Yedaya Katsman wrote:
> Document FocalTech FT3518 support by adding the compatible.
>=20
> Co-developed-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Go=C5=82da <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


