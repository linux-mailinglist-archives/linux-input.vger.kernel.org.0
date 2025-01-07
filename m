Return-Path: <linux-input+bounces-8992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C14EA03EDC
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 13:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31C37160E0F
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 12:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CA5B1E3DE7;
	Tue,  7 Jan 2025 12:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="TqXS3RsS"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3949B1EE00C;
	Tue,  7 Jan 2025 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736251928; cv=none; b=PzMkQYR+jUu24thAUy1FwIuWXuf50S1Oh61Ec8mOVFbNZSCPVVqdzPnnG+4IFZFugA87QMIy8mMEc6M9CC8FC5+wE9RVUGeg2iHJBqy0kZWiSL/rlIHEhl4RWqqO7bV/epOZrT4s2TtAwAqZT+Va0NlzkAkdqatK66VIdEhlLjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736251928; c=relaxed/simple;
	bh=HVZqv3iMD3u/yLNSo6b7LYCx1bSeTRxSx/Qpuv+cJHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WvMdwEW3w6kPee00IW7OZPKGWpr7iLcwx9Nz8+cpwzTY1k4xL5qt0zacxxou/dV19jQlmsO/NieGEct9FNFqzp24UJqwxl5t/aSuvgdvzOGhCqNZnFVn+y/Tq+Fp/8cReg6iXr5etX2Z0waPYfISVlQ7zDw03UqfS93YfG4Hs0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=TqXS3RsS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736251924;
	bh=HVZqv3iMD3u/yLNSo6b7LYCx1bSeTRxSx/Qpuv+cJHk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TqXS3RsSldw/NUimwX1+CTL0hMA5ARGNP+nxLNA/mTBkSWFC99KATsm3zNR6e4P+m
	 NQ/1iMTIHQMnQPalj5D9KMo5Pyz3TjUZydEq1TGQ5sToZ8R0yUja7q1ohLH32lwIUD
	 jKD6qJjnvZBLdQYcWW0SWxnplUeIgf6+nuMz/uxLsi0vC+8vyQGiwDzWGQ/thXBGmN
	 xuajTcgmWdw7NNfUroAYOtktkN2WDQwHg1/VoTp3JjzHdPuLIXesXICIXuiNolp7A1
	 oafZ89/BCPRMSUsJIuJE1LPzDHcfr3vMn5hkdUl7/7ZTzJfq13ESdd8BETa/BDL+dm
	 Ij3cf9Yv/wySA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A18B17E152A;
	Tue,  7 Jan 2025 13:12:03 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
References: <20241225192631.25017-1-val@packett.cool>
Subject: Re: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
Message-Id: <173625192333.58193.14854384840814849260.b4-ty@collabora.com>
Date: Tue, 07 Jan 2025 13:12:03 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 25 Dec 2024 16:26:18 -0300, Val Packett wrote:
> The mt8516 patch was previously sent in another series but rejected due
> to not using an mt8516 specific compatible - which the other usages
> of this driver (mt8183 and mt8365) weren't doing either.
> 
> It's only fair to add the SoC-specific compatibles to all of them then :)
> 
> Val Packett (3):
>   dt-bindings: mediatek,mt6779-keypad: add more compatibles
>   arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
>   arm64: dts: mediatek: mt8516: add keypad node
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[1/3] dt-bindings: mediatek,mt6779-keypad: add more compatibles
      commit: 3b19239ad4201123a2bc05af5859f5d75a30a49e
[2/3] arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
      commit: 6139d9e9e397dc9711cf10f8f548a8f9da3b5323
[3/3] arm64: dts: mediatek: mt8516: add keypad node
      commit: 0fb0d360218129f00b76f13e30b86321b64e36f6

Cheers,
Angelo



