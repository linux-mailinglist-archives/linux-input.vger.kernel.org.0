Return-Path: <linux-input+bounces-12960-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AADAADFD49
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 07:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47007176D1B
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 05:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57750242D8C;
	Thu, 19 Jun 2025 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kuzMUVdA"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49B242D69;
	Thu, 19 Jun 2025 05:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312378; cv=none; b=N4Cyy+IMKhETrNfXC/tuQ42ylFmN3pfVN4g1DGuvSTTp48pnuH/CxU5QElH03Do3hy9EszGTj4d0evC43gJ5yOV5TXV7/wO/nSy8ZPENwx47rvDDKuSrWQEmIPkp6Gj63EHFUeD67bEtu8TWZbdglKQBb8Qt1B3VkpQ3rqg8VgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312378; c=relaxed/simple;
	bh=S+P2It97TueKH/kAbwyhYnXNnN0tqQNO09MpJUtK+fQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uEULDZkIYYSq8FwaZfOHK1wnMI14oC379b7nkYMP3LvwAle9YN/MCrQCUazl9BygrZqbGEsJ2UxLCZH2Jt5iHeTMFKFTuVC7WS8tEyYURlMgZJajORO2eLGuDdUjtZaxVP5hhcZU6q352moNKwoXk3W8ZjumN2toaUxGvDL2ERA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kuzMUVdA; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750312373;
	bh=S+P2It97TueKH/kAbwyhYnXNnN0tqQNO09MpJUtK+fQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kuzMUVdAfcV/tHeVYxKywMBdeZTdXvqN6JkF+2Z+7W0I52mstLMSE7Hz5+xwDmqtO
	 v2PFVxqDnc8wJVCegk6de7OGF8y2WwNVXIQH6sZiBVmwuAG/xYSZ4m86ZXYTshMhPE
	 uSOgkuJuDxXv90Ay6AnmiSK6ASsE/SrMwPVKZ+f/m1PX4JqXuPpGqYyqA/n3TBRBKY
	 U8NBmXgQ6fum4McfnLKB/Er6Km7G+u5Jtt53+F2clY2n8HjuUO3zjnI9PIZy5yVJiU
	 AS8MLCwH0dNT0xj3wQ+cggx/LdAIwefMq0C0zkFzJXSuKCms7HflAeBODKztyHSv+s
	 MpbNWr27zyWPA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 716E717E06BF;
	Thu, 19 Jun 2025 07:52:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH v3 0/6] arm64: mediatek: mt8186-corsola:
 Consolidate and add new devices
Message-Id: <175031237337.17587.18276191221301074786.b4-ty@collabora.com>
Date: Thu, 19 Jun 2025 07:52:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 17 Jun 2025 16:19:57 +0800, Chen-Yu Tsai wrote:
> This is v3 of my "component probe for Corsola devices" series.
> 
> Changes since v2:
> - Rebased onto next-20250616
> - Collected reviewed-by tags
> - Dropped driver changes that are already in v6.16-rc1
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[2/6] dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
      commit: b292005d5cafb0993f7ff2c0477d5b71cbd3e387
[3/6] dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
      commit: a883bc5dc12d52a6a8d5afbd0131be55f0684364
[4/6] arm64: dts: mediatek: mt8186-steelix: Mark second source components for probing
      commit: 5349994cfd89ca17b8a820ddb41e4572d9e52b49
[5/6] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
      commit: 14e8332e5c5d3b9f8ccfa1f3e0dfe05ca136ba2a
[6/6] arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
      commit: f7ef352d45b71e6f3cb7bb572f68eaa0981e9e5c

Cheers,
Angelo



