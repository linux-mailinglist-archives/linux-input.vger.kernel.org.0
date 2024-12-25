Return-Path: <linux-input+bounces-8769-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 729D69FC65B
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 20:27:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9AB162619
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 19:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10ABF14A0B7;
	Wed, 25 Dec 2024 19:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="AR95h++w"
X-Original-To: linux-input@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A1B12EBE9
	for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 19:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735154847; cv=none; b=OGYF5hkwFVm9Wg2oexdWYVWeU65OR9M9ZPskHS2a/lQc8/Fc5TKv1gOSnbBMboN3fnCm8CXTrg5WB206eJnONI6b3CNKTK8n4SLvSHHH+GSX9XLJ3LHIschY7xsw27n4sgsb8E4optQfzOAzyQ1vjrnRpDkxTtK8FTz7fg7V+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735154847; c=relaxed/simple;
	bh=FFgHM1jKW8IqTC1OZnFIs8vICky0jlaO6V4Wz+H52eU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YygzWp1e9sJUZ4VY4imnvhZIFG1VP3+Bn+m0TCJkuqGtDjDeBjzCzdnH+ESJbd8VF5fI7auMKhlkJAUZdCGpWubPfDguLU2qvA5W14LbSEqCgdnCTP3Iv0OMdqAmbPwGiRESaOaKXCRfNQHzVoZ78g8C57a5APXchw8IgHfu6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=AR95h++w; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1735154842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KOnKLDsqb4xiEOhltwQDh4HgtA1cKvX5nht3wAdDSxY=;
	b=AR95h++w7RE76dw9MHkXuquH0j3GJ05notgIN80CpNosyE+oNzkdRcQXGgjz2tg9gzr09x
	Nc3dZdr21batB9XBUJyRXolEpJCpNu5396rdiy9ZITHe5GAWlAmjV582r4kJlix0EVJsYR
	lBAAn7btvwu10n9+jW71Hq/WxOl7eL9+JpLtXQ3FaCkx3aEIo7viF4vOS0B2Byy53Mg4oT
	XCWTE1pnHAvMwQ6tnbnR+b2IQbhWhcTRR4dvQVeuvVr/6h1PKR0VlP4qqGkyJRp00lYjKR
	sPcgoKuQRYlSBMCpYXJ2Hue/aXd8EUGNNhtUGQeSYcM2D2VI58n9R6Ti6t2W2g==
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
Date: Wed, 25 Dec 2024 16:26:18 -0300
Message-ID: <20241225192631.25017-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The mt8516 patch was previously sent in another series but rejected due
to not using an mt8516 specific compatible - which the other usages
of this driver (mt8183 and mt8365) weren't doing either.

It's only fair to add the SoC-specific compatibles to all of them then :)

Val Packett (3):
  dt-bindings: mediatek,mt6779-keypad: add more compatibles
  arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
  arm64: dts: mediatek: mt8516: add keypad node

 .../bindings/input/mediatek,mt6779-keypad.yaml        |  3 +++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  3 ++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi              |  3 ++-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi              | 11 +++++++++++
 4 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.47.1


