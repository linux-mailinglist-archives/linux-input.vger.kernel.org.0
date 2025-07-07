Return-Path: <linux-input+bounces-13400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD111AFAFE5
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 11:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1F3421D55
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 09:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C819428A3F7;
	Mon,  7 Jul 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bea3c/SO"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018E261595;
	Mon,  7 Jul 2025 09:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881087; cv=none; b=pw8kkcUJZ62KUCaxttRBfpVFrfChmag15Y+cTmO2ha1TYboLr+6y4iiOIdj9uaV0gDVpnZGDlEObNlISfKiyNbO7D4fDsUWNXxHz3+7kTBl8AKgSq4xsn2Y6Cyb6cRhWXcg5K0KW1A76voZ7DoZogBdoApkn4Ts8+ZkEUX0mIsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881087; c=relaxed/simple;
	bh=h8H2ZMHQHU30reUhzjHIqiH0k5eiT46TVB5gv9mUqJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Gdj+Q8ln5toMChFSj2QtUBdjr+Pmo2d8waf6lkopnhfYxbN9E4N9IGyBZ4o4DPIXSdx4Tb6som0COi9Vw7fdLzb3K6jyNuuhpVVgAqgeMrTFJwCdJ5SjRbPewFzDmQfaigp+gzgZ08dEXt1uyPlkt5IomMSKy/2LgjkiXjQ771Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bea3c/SO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881084;
	bh=h8H2ZMHQHU30reUhzjHIqiH0k5eiT46TVB5gv9mUqJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bea3c/SOhVOgHzaDQmR7oqYDcUhYqiuoihorPngopx/G2Veq/CBe2ifsTQjB/GDZ0
	 6f/tvFnz+rsAHXoK2NIzqmUwMxa+GFTdhyYH2Qz1fN1w5KhhCetm7YgLA3U6RAKoY9
	 Jk/lsdBt/53mOGoU9Om9YTkb85yhp8MqhiLzhKkaw3eIOItEwHiNgBLG5apThxaQ9H
	 YUtXcEynTuCWliloJvgXERthcoV4EaIl8I8PoXfSXgilc2G/63ldZrubfdeBTLT4yt
	 grPcQao4VdSkmtE1ucrSfP/Wib5ptLTtffo9O22BHrMMSZpDd6pkhovz4DVIA6izcG
	 Ri+CSyY62Icug==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B073617E07C9;
	Mon,  7 Jul 2025 11:38:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
Subject: Re: (subset) [PATCH 0/3] Mediatek Genio EVKs: add MT6359 PMIC keys
 support
Message-Id: <175188108365.72331.6601193991511899828.b4-ty@collabora.com>
Date: Mon, 07 Jul 2025 11:38:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 03 Jul 2025 17:41:02 +0200, Louis-Alexis Eyraud wrote:
> This patchset adds the support of the MT6359 PMIC keys (Power and Home)
> that can be found on the Mediatek Genio 510, 700 and 1200 EVK boards
> by:
> - adding the MT6359 SoC support in the mtk-pmic-keys driver
> - completing the existing definitions (only the Power key
>   support was present) in Genio 510/700 EVK board common
>   devicetree include file (mt8390-genio-common.dtsi)
> - add the needed definitions in Genio 1200 EVK board devicetree
>   (mt8395-genio-1200-evk.dts)
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8390-genio-common: Add Home MT6359 PMIC key support
      commit: cf0cdde64b3246aca28961ec169ba1c5e9295d8d
[3/3] arm64: dts: mediatek: mt8395-genio-1200-evk: Add MT6359 PMIC key support
      commit: a9b906f15995e18b700a7e7791865ecf2f1cee65

Cheers,
Angelo



