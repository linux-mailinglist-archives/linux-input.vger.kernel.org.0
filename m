Return-Path: <linux-input+bounces-3452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 585048BBDE2
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 21:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078B31F21A94
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 19:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FCF84D11;
	Sat,  4 May 2024 19:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="fwga94vN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D043AC0C;
	Sat,  4 May 2024 19:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714852058; cv=none; b=J6TyXCgLDtPKrLHjvkYKejic5w/M6TtkCKrtLgxKuwqqRyQPw9wLLmXg+T54EZRCR196NHCB5PSl3Kjqk3vdUYy0/MxyIRFcDjh6ZUSbk7gft+8Bbso9t70wDlqxe63jm2lS2vM+EwuSKoURw4yxv9g5ZPgYnMVFwYYt3178m8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714852058; c=relaxed/simple;
	bh=WP/DYNvSKotR2gm471Emcoi2L5GfCI3FrPAL+CpOoaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QhKy74iKzdWwjs4OkgsoNa6xbToG4pXliOXDhCJFmZ5wnSRHuo1wAqwSj4bDQElDZvG9iGBHaPUse+lqUihvtA1CXksUYtRfIpmrw7SuL5KQ3hmcOFILxmkIGRS6xI7oVjUxzH4tlwpmY7WyJhtsqsJYP6+2Up66A+IE7aSVEBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=fwga94vN; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1714852041; x=1716152041;
	bh=7yfSd6sy5ZEav7FZcqSBsdjeGxYbxF+Zqi0qMbzYWl4=; h=From;
	b=fwga94vN3MXCflEOEfT9X70mkC+bnzjLh2UMGyrLf8JZuuUf1N4XF5cyEtFb5uCen
	 WE8emMc4FHuXeQgIyH5dYdqUkLvx8066pLBDzsPlZ02v7pLzpRPW/jfLaXYHXhS8AA
	 QRq2RBfi10d13qFY3L0nQ7vpGOBH4AxqfWVkv6fkFkhYkzt4FE+ealQbdfLzkpUyYr
	 mUI7hgOu/MztolaPs9u+j5mtKtn5kEo57B6oyQHIqOHm8QkbqwEuVLEL5N73f15eXg
	 3F6VTNY1wKCeOiPP65KvkTVWTelDZ/7jUb23i20pPcb62E08HsmX0iAbADrhWdzvmG
	 P7kVgg22Bv+Kw==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 444JlKT1074216
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sat, 4 May 2024 21:47:21 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        balejk@matfyz.cz
Subject: [PATCH v6 5/5] MAINTAINERS: add myself for Marvell 88PM886 PMIC
Date: Sat,  4 May 2024 21:37:08 +0200
Message-ID: <20240504194632.2456-6-balejk@matfyz.cz>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240504194632.2456-1-balejk@matfyz.cz>
References: <20240504194632.2456-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry to MAINTAINERS for the Marvell 88PM886 PMIC MFD, onkey and
regulator drivers.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    RFC v3:
    - Remove onkey bindings file.
    RFC v2:
    - Only mention 88PM886 in the commit message.
    - Add regulator driver.
    - Rename the entry.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f6dc90559341..e1a0e02e098d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13044,6 +13044,15 @@ F:	drivers/net/dsa/mv88e6xxx/
 F:	include/linux/dsa/mv88e6xxx.h
 F:	include/linux/platform_data/mv88e6xxx.h
 
+MARVELL 88PM886 PMIC DRIVER
+M:	Karel Balej <balejk@matfyz.cz>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
+F:	drivers/input/misc/88pm886-onkey.c
+F:	drivers/mfd/88pm886.c
+F:	drivers/regulators/88pm886-regulator.c
+F:	include/linux/mfd/88pm886.h
+
 MARVELL ARMADA 3700 PHY DRIVERS
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 S:	Maintained
-- 
2.45.0


