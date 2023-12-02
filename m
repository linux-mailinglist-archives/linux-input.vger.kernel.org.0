Return-Path: <linux-input+bounces-394-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEBF801CF6
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 14:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA481F2119C
	for <lists+linux-input@lfdr.de>; Sat,  2 Dec 2023 13:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0EB918C0F;
	Sat,  2 Dec 2023 13:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gimli.ms.mff.cuni.cz header.i=@gimli.ms.mff.cuni.cz header.b="DcC1Hdrn"
X-Original-To: linux-input@vger.kernel.org
Received: from nikam.ms.mff.cuni.cz (nikam.ms.mff.cuni.cz [195.113.20.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF26198;
	Sat,  2 Dec 2023 05:09:42 -0800 (PST)
Received: from gimli.ms.mff.cuni.cz (gimli.ms.mff.cuni.cz [195.113.20.176])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by nikam.ms.mff.cuni.cz (Postfix) with ESMTPS id CB41528BDE5;
	Sat,  2 Dec 2023 14:00:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gimli.ms.mff.cuni.cz;
	s=gen1; t=1701522018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xcZHxF0TOnC7j0lzNEeq08B9JFECUUdheP0hD3aOB9U=;
	b=DcC1Hdrnh66CtqoxKlvEgAxrQRvSsBH9T20U46E+seBHNwP+ijXbh4l9l3LIHLApYhelqR
	kIgBevmC9Y3NWCUqBM0GlkC+fAJhh+27W85tYMk3IzEbzwfN0mX8lHXNSAf5eFnFuYdz2N
	u0JjyigAXg62HpOhLJSMrSyz1o5V4mE=
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: karelb)
	by gimli.ms.mff.cuni.cz (Postfix) with ESMTPSA id AA1EC4443E5;
	Sat,  2 Dec 2023 14:00:18 +0100 (CET)
From: Karel Balej <karelb@gimli.ms.mff.cuni.cz>
To: Markuss Broks <markuss.broks@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>
Subject: [PATCH v3 0/5] input/touchscreen: imagis: add support for IST3032C
Date: Sat,  2 Dec 2023 13:48:31 +0100
Message-ID: <20231202125948.10345-1-karelb@gimli.ms.mff.cuni.cz>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Karel Balej <balejk@matfyz.cz>

This patch series generalizes the Imagis touchscreen driver to support
other Imagis chips, namely IST3038B, which use a slightly different
protocol.

It also adds necessary information to the driver so that the IST3032C
touchscreen can be used with it. The motivation for this is the
samsung,coreprimevelte smartphone with which this series has been
tested. However, the support for this device is not yet in-tree, the
effort is happening at [1]. In particular, the driver for the regulator
needed by the touchscreen on this device has not been rewritten for
mainline yet.

Note that this is a prerequisite for this patch [2] which implements
support for touch keys for Imagis touchscreens that have it.

[1] https://lore.kernel.org/all/20231102-pxa1908-lkml-v7-0-cabb1a0cb52b@skole.hr/
[2] https://lore.kernel.org/all/20231112194124.24916-1-duje.mihanovic@skole.hr/
---
v3:
- Rebase to v6.7-rc3.
- v2: https://lore.kernel.org/all/20231003133440.4696-1-karelb@gimli.ms.mff.cuni.cz/
v2:
- Do not rename the driver.
- Do not hardcode voltage required by the IST3032C.
- Use Markuss' series which generalizes the driver. Link to the original
  series: https://lore.kernel.org/all/20220504152406.8730-1-markuss.broks@gmail.com/
- Separate bindings into separate patch.
- v1: https://lore.kernel.org/all/20230926173531.18715-1-balejk@matfyz.cz/
---

Karel Balej (2):
  dt-bindings: input/touchscreen: imagis: add compatible for IST3032C
  input/touchscreen: imagis: add support for IST3032C

Markuss Broks (3):
  input/touchscreen: imagis: Correct the maximum touch area value
  dt-bindings: input/touchscreen: Add compatible for IST3038B
  input/touchscreen: imagis: Add support for Imagis IST3038B

 .../input/touchscreen/imagis,ist3038c.yaml    |  2 +
 drivers/input/touchscreen/imagis.c            | 70 +++++++++++++++----
 2 files changed, 60 insertions(+), 12 deletions(-)

-- 
2.43.0


