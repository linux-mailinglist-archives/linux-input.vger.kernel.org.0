Return-Path: <linux-input+bounces-4706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DEE91C149
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 16:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E80481C23592
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 14:41:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21421C0DDC;
	Fri, 28 Jun 2024 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU+Qtx99"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811661C0DD3;
	Fri, 28 Jun 2024 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585702; cv=none; b=HEY8wMf/s1DuqXXhodgE9IdAzAYUK2Pao8uvtV6ukKrhrkklAt2qfSgj/31rkzQ5bBYxRfUMRqsaIo2u9DLN2QfDX1F7p2nwqQ96MtDCiQTKwZZpCZGx1Lss2NZRJ2H04EBYEpzFOqnUsakPV/cvOTk41/LfumAiFmgBvGtu4VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585702; c=relaxed/simple;
	bh=YMs2picdLkkIkIWd4bCAgdTjEW1+BtE93cngzWn0Qh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=roPb+DGVWKuv5iglePWgp7QHmrq5wNcJ2N313v7F9PnOBiiXhEfQwvY306o5HlFmKO7pOJT42AHme/iEPu7EJbdd/Spi4VSQpNYvGpN2+5v3kMgrPlyMLKjnrB1fm9QiudDLPmu+1kMlH32kOOh4mW37l1WDxHgLYgfUBxmZO3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU+Qtx99; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BBF5C2BBFC;
	Fri, 28 Jun 2024 14:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719585702;
	bh=YMs2picdLkkIkIWd4bCAgdTjEW1+BtE93cngzWn0Qh0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PU+Qtx99bWVB2hiWppYPmZmeTiDjV3BsJ5BV/wbWaKvqSrXP4K/BsfVJ8yDpbhjHC
	 geo3FKH/+g+cS0xL+mXrnG+KuZYDo7RBjQxpqrWvc+duYgOaTTh+WzsLJ0gzk+PGEI
	 0bmDhB4i8Hba4UyLgwF3qZmGUe501OimB1G9LhiRBkPCiJqgqxgFP0k52+S/4YE7uI
	 2jlK5Ixu1zWbstNZt1fcqbRnjDRWnXcVQiZhhxIW/+/CeB0vUxhYSLqH3sAN9EcAwV
	 Ih9RF11YV8VYj9LW2ZjbGnNudIddxXsZPn2TRkVM4AH0dunKao0O/cV/SHEtM8GsMZ
	 Eo1XoSie7Kk1g==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-input@vger.kernel.org, Karel Balej <balejk@matfyz.cz>
Cc: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
In-Reply-To: <20240531175109.15599-1-balejk@matfyz.cz>
References: <20240531175109.15599-1-balejk@matfyz.cz>
Subject: Re: [PATCH v7 0/5] initial support for Marvell 88PM886 PMIC
Message-Id: <171958569931.3316488.12728822093231549974.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 15:41:39 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 31 May 2024 19:34:55 +0200, Karel Balej wrote:
> the following implements basic support for Marvell's 88PM886 PMIC which
> is found for instance as a component of the samsung,coreprimevelte
> smartphone which inspired this and also serves as a testing platform.
> 
> The code for the MFD is based primarily on this old series [1] with the
> addition of poweroff based on the smartphone's downstream kernel tree
> [2]. The onkey and regulators drivers are based on the latter. I am not
> in possesion of the datasheet.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: mfd: add entry for Marvell 88PM886 PMIC
      commit: c4725350a9f76fbec45cbbfffb20be2e574eb6ef
[2/5] mfd: add driver for Marvell 88PM886 PMIC
      commit: 860f8e3beac0b800bbe20f23c5f3440b1c470b8f
[3/5] regulator: add regulators driver for Marvell 88PM886 PMIC
      commit: 5d1a5144396e9570efea02d467df0a68fd28db6f
[4/5] input: add onkey driver for Marvell 88PM886 PMIC
      commit: 914089db309ccc590314b6c21df5a1f812e9ab0b
[5/5] MAINTAINERS: add myself for Marvell 88PM886 PMIC
      commit: f53d3efa366b1754f0389944401bb53397d22468

--
Lee Jones [李琼斯]


