Return-Path: <linux-input+bounces-10792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54BA60266
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 21:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FCFB1898323
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 20:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355331F37C3;
	Thu, 13 Mar 2025 20:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="RzVw9DjX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E6513CF9C;
	Thu, 13 Mar 2025 20:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741897261; cv=none; b=T3T3SeG2jH7Sst7SUdSptFxjyFdy5Tcmckq8LqxMDMTyRGXwhTUOwDuEAxTz1ppsasI7A/CacOwXVGl58xTCmfKoSXVoIGOZqlpPUlwXCwYDhPxTAhre1mhvqiumAhJlAH33x11CMI/s6qBwfg3Y3gL6jN6IDWR452oS3MKK9nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741897261; c=relaxed/simple;
	bh=znyasu6OgxD7QEN7xhvv+EL5QEszFzl0LeJoKkCF2+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=anmz64n9vWIJ3KachKsnl4EddddIQuGczAzUAxfw6NhwC0fQbVjNGQd14zACKqnET62XDvyoRSNRzc9SXoiC4VUSSOfAQuoGAQv/R+Jd+vkk8EgK+bKrIGDYMqPpvaoSI6hBOCO76Ys4r7qfz36M+AtnloJWGe0vJCYsH2Em1YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=RzVw9DjX; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from karma.space.aachen.ccc.de (xdsl-78-35-81-182.nc.de [78.35.81.182])
	by mail.mainlining.org (Postfix) with ESMTPSA id 07EF2BBAAE;
	Thu, 13 Mar 2025 20:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1741897251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/B5M0KFsM0DgaxoXpjc1mIdwfZ0M0cSAduiwjWXC+x4=;
	b=RzVw9DjXNE4e0/vXwgBDKJSOkxxgaffD3h/R7I/rMEq9y5wWWqZE67q5REmfW6/PH+UuPK
	Jg2aeR1UWurL80HZaYT79GbBEcVG34+z7o+73R94oK8v34d5rhg9Z0gEK//mmc/TOe/w8c
	NaI4wrK2P0vz8mBB8h5u9x71L8JvP9cT2tRz5eiWOscOYDU4kqZCwk+NHkBjPX0/kDSmoP
	jKa5IIGH6MY7vDX9f+ylm43TTb+fOvPKtl2m/0zShHH1iyn1TC7XhVaqmI4VwU7wiseuoG
	eCTWQ8Rcf5qPVgRS9iPp0p5/H7MxAiv/HsUs9WNzi2YVPnfNTmeJfCGSntjczQ==
From: Jens Reidel <adrian@mainlining.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Andreas Kemnade <andreas@kemnade.info>,
	Fabio Estevam <festevam@denx.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Yu Jiaoliang <yujiaoliang@vivo.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jens Reidel <adrian@mainlining.org>
Subject: [PATCH 0/2] Add FT8716 support
Date: Thu, 13 Mar 2025 21:20:15 +0100
Message-ID: <20250313202017.19621-1-adrian@mainlining.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the FocalTech FT8716 touchscreen to the
edt-ft5x06 driver. It was tested on the BQ Aquaris X (bq-bardock) and BQ
Aquaris X Pro (bq-bardockpro).

Jens Reidel (2):
  dt-bindings: input: touchscreen: edt-ft5x06: Document FT8716 support
  Input: edt-ft5x06 - add support for FocalTech FT8716

 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml   | 1 +
 drivers/input/touchscreen/edt-ft5x06.c                      | 6 ++++++
 2 files changed, 7 insertions(+)

-- 
2.48.1


