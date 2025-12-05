Return-Path: <linux-input+bounces-16470-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C151CA84A1
	for <lists+linux-input@lfdr.de>; Fri, 05 Dec 2025 17:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAB7332907FE
	for <lists+linux-input@lfdr.de>; Fri,  5 Dec 2025 15:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A4F2EB866;
	Fri,  5 Dec 2025 15:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="V0nok/2b"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B27182D0;
	Fri,  5 Dec 2025 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948586; cv=none; b=YIq8bIULg+bDMq30hTAAHU/uNRY9lIpZr4u3+x5ieakPts1LDebJYJnQIbNJ24Un03O9lIXDuYKj7N9SC+O/6fmWlbtGMV1Njf29O1vzTI0eVCtLWDDmbVlg/qOXAGBLIlbT74SCuJzPqROkJevSJ2SDHQBm4AaaVRyaboa+QbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948586; c=relaxed/simple;
	bh=Oco+/BePH0tdyyzgeL7xD6k601w37Xe5ft56JtRHvs4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QwtcZxG+rRkq7e2Cp30xSEXiJ++SMrvJOVF4Ozj/PRMbpAbTTBkWqlcmVGeym/MFOjrlokn46ziTrNK4XBfnmMohzUrdF85K7KSx5zPgUa1TSTkguzK1KGlz+kroezmNpR91rVXzyrB+ZbmO8wLPcKP2bdnnw7h6YfFCK8tdXTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=V0nok/2b; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764948556; x=1765553356; i=hendrik-noack@gmx.de;
	bh=l64Yu0YO5YF4KmEDvYT8NtN2cRwCzRP2ZPuErFZZaCw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V0nok/2baPTscNYA2Bag070phroWikYRw5Ks7xv4vEukQReWdFDplczUkwyQ9uYd
	 qtdrNd3sGUAIOSJGm3TqU9nxTSQdziNbO7LbH/RCreczuBjDzSeR3AmOg6/Mb8aAP
	 31x9mLy3Mc2jUnPvnb8zLmqKHnbTUNGiGA57qVBrMVOE7IneH72Oef/B1G2gre8Lc
	 VITPgc5wojccO/5OBN6LEKm0RyNh/sLbp2TagjEVKJPYEEXIA3bM+Zl45lXauCUSP
	 G+aWFZ2qlx3wRgVnp1LICEUDUk6q1w5Axul1eH0x/hkpkqvi4Pcqy/xuRCLRfFQXS
	 ns6OwZVPAjjE3xI1yQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from guguhost.ddns.net ([217.85.36.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2nK-1vmnkX3ByM-00f8x6; Fri, 05
 Dec 2025 16:29:15 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for Wacom W9000-series penabled touchscreens
Date: Fri,  5 Dec 2025 16:26:16 +0100
Message-ID: <20251205152858.14415-1-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LIDbta93RXnuoZr608u3HMXO0NHEKI2ZtX5L4RZ3oA8T9oKWfhY
 6c1hBHVgmqrP/Z0OSEYx060jv50R+t7r1iOfkMVsgwMVXYDeUZTivE86sSIM3rK0nwnp93L
 maCF0mfufotW6gv0FQHYYHFMQpfwwiP7fVDg9V1dl3bj9WzyLRdCx4towmyv4rmC1/3D+Q1
 ZL6VwDlgKedGGiFAYhgLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:02woEWpoxOY=;KQxgkQSoRhkLIUf4Dhs8W0Tsp+j
 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

Add devicetree bindings and a driver for the Wacom W9000-series penabled
touchscreens.

The driver currently only contains the information for the W9007A, which I
tested on my devices. It should also work with other chips, such as W9001 =
or
W9010. However, I couldn't test it on these and the message length would
need to be added.

The pen-inserted-gpios is used to get if the pen is inserted in the device
or not. It's also used as an interrupt so that the power state of the chip
itself can be controlled depending on a change of the insertion state of
the pen.

Note: This is my first driver I have ever worked on so if there is
anything I can do to improve it please let me know!

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
=2D--
Changes in v2:
- remove pdct-gpios, as it's unnecessary
- fix devicetree example
- adopt to kernel coding style

=2D--
Changes in v3:
- fix missing include (thanks lkp@intel.com)

=2D--
Hendrik Noack (2):
  dt-bindings: Input: Add Wacom W9000-series penabled touchscreens
  Input: Add support for Wacom W9000-series penabled touchscreens

 .../input/touchscreen/wacom,w9007a-lt03.yaml  |  79 +++
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/wacom_w9000.c       | 480 ++++++++++++++++++
 4 files changed, 572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wa=
com,w9007a-lt03.yaml
 create mode 100644 drivers/input/touchscreen/wacom_w9000.c

=2D-=20
2.43.0


