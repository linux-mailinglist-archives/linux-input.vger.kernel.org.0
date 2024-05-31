Return-Path: <linux-input+bounces-3992-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF608D6886
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 19:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B541F23E2E
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 17:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0635717C9F0;
	Fri, 31 May 2024 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="XEc07oIy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A1517C9EB;
	Fri, 31 May 2024 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177998; cv=none; b=EBF/YfnjPSx8RvNlzMGjV7gEPJ96PwsgjnIS1aT3TdAUYlcaDp6ciLvB+69FK2YBE9MXFew4WnBRV3dfDoikOlWH8oYliuGloopJpax44PALLVUnSZHDgpw+9IzTNWczueAeci5WsZVjYjzjM/02LBW8LvuXbHiz2j7vhrAwpZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177998; c=relaxed/simple;
	bh=ZPgHrbjokg3R/Bb+Nr4nz0p02I7Sa0phcTE6lMVnJvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uvxBNKMEKd80s3XIZui3G+PXztglwO6G9m63tJUMVPUzVbR6ldyXO2at5w4xFXLQ7b/J9NgNq9/74+lBX+Y1apOoorBp1bXAFmrBAZ5OOpNpo+B5wbIf3iWsS10yTpQDujDw0EBd1/NGLWJ8MpKBa8b01zcpVoLjFI4+ZnP/HDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=XEc07oIy; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1717177959; x=1718477959;
	bh=0FgpR1aECR85O06IJpvA8Cs8BgOwF77lbIJOtehcqWE=; h=From;
	b=XEc07oIyL44bM9hvxjX+628HcCWHiVfbEPLhwhTegsVj4FHkyGQr7OULySozz0gT0
	 Qb3fnjDqDHmxGjCK17T6Yg6/uOFE05SsI8ZFll4kyIFtNgZQXAQUmbdRLM5a00C2LF
	 fcwLv8Ylo5JnMx2jvRGNOO6m5qN+ipScMUrChreiuQXFwqrsOYt7d9BILYDurjw5En
	 Sogov4yPK770rK/X90SlOqcf41Sh1JzQP9drt3yHIdQEkALR1hcj7bo9Hmq6JnDSOn
	 n6q3B7nefSJtNaf25mc/iAMLDD+XgTXP30RxgiaHv0tsOVDpBiWJsjE9/LErwTvS57
	 SHdWAi0A0+N/Q==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 44VHqbY6001107
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 19:52:38 +0200 (CEST)
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
Subject: [PATCH v7 0/5] initial support for Marvell 88PM886 PMIC
Date: Fri, 31 May 2024 19:34:55 +0200
Message-ID: <20240531175109.15599-1-balejk@matfyz.cz>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

the following implements basic support for Marvell's 88PM886 PMIC which
is found for instance as a component of the samsung,coreprimevelte
smartphone which inspired this and also serves as a testing platform.

The code for the MFD is based primarily on this old series [1] with the
addition of poweroff based on the smartphone's downstream kernel tree
[2]. The onkey and regulators drivers are based on the latter. I am not
in possesion of the datasheet.

[1] https://lore.kernel.org/all/1434098601-3498-1-git-send-email-yizhang@marvell.com/
[2] https://github.com/CoderCharmander/g361f-kernel

Thank you, kind regards,
K. B.
---
v7:
- Rebase to v6.10-rc1.
- v6: https://lore.kernel.org/r/20240504194632.2456-1-balejk@matfyz.cz/
v6:
- Rebase to v6.9-rc6.
- Fix patchset versioning: the previous version was marked as v1 because I
  considered RFC to be its own thing. Thank you to Krzysztof for
  explaining that that is not the case. The previous version is thus now
  marked as v5 and this is v6, sorry for any confusion.
- v5: https://lore.kernel.org/r/20240331105608.7338-2-balejk@matfyz.cz/
v5:
- RFC v4: https://lore.kernel.org/r/20240311160110.32185-1-karelb@gimli.ms.mff.cuni.cz/
- Rebase to v6.9-rc1.
- Thank you to everybody for their feedback on the RFC!
RFC v4:
- RFC v3: https://lore.kernel.org/all/20240303101506.4187-1-karelb@gimli.ms.mff.cuni.cz/
RFC v3:
- Address Rob's feedback:
  - Drop onkey bindings patch.
- Rename PM88X -> PM886 everywhere.
- RFC v2: https://lore.kernel.org/all/20240211094609.2223-1-karelb@gimli.ms.mff.cuni.cz/
RFC v2:
- Merge with the regulators series to have multiple devices and thus
  justify the use of the MFD framework.
- Rebase on v6.8-rc3.
- Reorder patches.
- MFD RFC v1: https://lore.kernel.org/all/20231217131838.7569-1-karelb@gimli.ms.mff.cuni.cz/
- regulators RFC v1: https://lore.kernel.org/all/20231228100208.2932-1-karelb@gimli.ms.mff.cuni.cz/

Karel Balej (5):
  dt-bindings: mfd: add entry for Marvell 88PM886 PMIC
  mfd: add driver for Marvell 88PM886 PMIC
  regulator: add regulators driver for Marvell 88PM886 PMIC
  input: add onkey driver for Marvell 88PM886 PMIC
  MAINTAINERS: add myself for Marvell 88PM886 PMIC

 .../bindings/mfd/marvell,88pm886-a1.yaml      |  76 ++++
 MAINTAINERS                                   |   9 +
 drivers/input/misc/88pm886-onkey.c            |  98 +++++
 drivers/input/misc/Kconfig                    |   7 +
 drivers/input/misc/Makefile                   |   1 +
 drivers/mfd/88pm886.c                         | 148 +++++++
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/regulator/88pm886-regulator.c         | 392 ++++++++++++++++++
 drivers/regulator/Kconfig                     |   6 +
 drivers/regulator/Makefile                    |   1 +
 include/linux/mfd/88pm886.h                   |  69 +++
 12 files changed, 820 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
 create mode 100644 drivers/input/misc/88pm886-onkey.c
 create mode 100644 drivers/mfd/88pm886.c
 create mode 100644 drivers/regulator/88pm886-regulator.c
 create mode 100644 include/linux/mfd/88pm886.h

-- 
2.45.1


