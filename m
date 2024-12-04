Return-Path: <linux-input+bounces-8374-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E360B9E3125
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 03:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 486F8B23B34
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 02:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B247927466;
	Wed,  4 Dec 2024 02:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YeVYA+4t"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA617C60;
	Wed,  4 Dec 2024 02:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733278234; cv=none; b=dan2zuTTOJXKSEeBcp0mCyEQ2pvyzq+EomUfhGmW9NaIdO6JJ/ocP+O755hwbo04PQLKhVj7N12F4qIKNLB2Y66htu155wg6awCWGzAbeytNw67tDynOBuYfePy2irOsb8m6CP182yDvgZarliqar7dsIFLx6Ew+wOPhcZMlsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733278234; c=relaxed/simple;
	bh=d48TqX7QbSHZcFmtF3lb5uviS9X1LZSAnPQ6o9bjV3I=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=DPJEi99BTbRoF68R9aTWeLmtAAoSZqWgBZKOaKt/tt2uCGmtkEeMkpiqiEnTH5YueKgeyKGUanyu6Wad4YdfxiS1+I8fsCsYmwh3nz/HF7ODvB/4+jro2Z4h+gCbo6BAMkkicegBK8R0Ic+qvB+nTXwSHwl9076vMm1soKWr72k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YeVYA+4t; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cf3e36a76so58761485ad.0;
        Tue, 03 Dec 2024 18:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733278232; x=1733883032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IaKghO/r+2Gyti02wCKlEV8is/DOem4Byb1BzTfl/uk=;
        b=YeVYA+4tby6Q+Z8WcwJkxkxNer6/nl4H0qjyvGostseCL/9jK9NOA88N6evtU6mN3l
         kLRjvnRs5qKeuLe/0G0xxd62zMCLUuSWUneL8m8a+dpdHiM5Iny9eIEDpAki3BZSv9TN
         VwwLNP9qeyn7rUhMObjqOue9/rLHbbQaEMaKDOlPDDuCuI2UGmQoV+/LFDu6Gn1I/fxw
         OH7AXeSTCFm5bIgPNYrHhkua4ZMRcSR/FETWMG3hFv/cMsEVzw+cg8DNUDmIJ47u1d/k
         wYdogonFM7Z7BfA/G4104KiNN+TGRyexf7hlFxhrvV+6bnqOdqkWbS8Hfe8aVbZxrGtl
         nhwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733278232; x=1733883032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IaKghO/r+2Gyti02wCKlEV8is/DOem4Byb1BzTfl/uk=;
        b=LsRqvIpTqmoeyQwObg1sVDJUIfsI63/qb/Uq3jfVQLmOIdnfC1kt5PC3ENY3a/vO9/
         paK0s3iGLgxfH/VUV2qXu6m31XzTLq7XX1C7O3fd02dz+fyznaNdzuWhxPYMqsMQN3JX
         leZffip35pkSgiVPHV7Ik8kAIWQ5q9OWMRfhUW9wt23sIRiDAZ3Jjj6U9YGHeKiSpSlx
         JeIDuEod+9GNARftwAf243+1+yAETeHxOY/Qh64yWguXWfT3/bzeikZE3XwENXlVgsuD
         6hNn2VA7xlbpyPmC/OOP+tORj0zKFz+zeFy7pnswWBo7fVM4eEmkiXFuTPbssrrW5S2C
         +FFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiw8Mrtz4Giv4vCfx9S6colYzisXuiHCGkq0dQNmDVqYDix0no2CHnpGHcXH3qwRCNVnvnJM4EHWBw@vger.kernel.org, AJvYcCXn1R0yGAv39A5Qqbx2w1Qa2gI15VYDnbI9jybTqydQ9+bACkV6Yd0gw2oxSqWlH9tdwON73YF5iLMxrUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJU0dm9YlTVqV13jsYa3iJMwjiO7M8zIeEDrlOMjX03veHBZ65
	1Q4g2TcouG8GrbQqROBLdoCdbkAZOM8QBBeLa8JyREDhHLQ/WbC+VOAt2Q==
X-Gm-Gg: ASbGnctTuyIIYylGwR0Vwjhiy7FvhC1utFfwKcGJrXxwaoUXRFgzrFZMKVvxMqH4eKS
	+oSXod5+IMdCBihQEoKek5A9pdQFBx1B5wHiVXoz0c0vk34gMeZrHunCfhIR2a+kgt+qzxdcN2e
	R5BTuees7kSX+RjNk/aNFVmvtq4O9tqYObjvmArSWtgCssfK+U3O4waApsB9sGWrFnul5YbNp3+
	ow3zu7tG3ZN2Ghd5JZ3NpwGPkVi9GKobWUBUDZTlele3BGXBb4I+UaciICpZBS/GqQ7X8pKkxEd
	v5ft9RKIOfB72Omr2bl/V36QBidfdcV/URk=
X-Google-Smtp-Source: AGHT+IEc9TYX6FFd5h8hWzBuIlSjssU8B0ZQDuXFK/cXrs5QVelUZhulFTMRvrIPuDQyFFV2pQNAWQ==
X-Received: by 2002:a17:903:189:b0:211:6b21:5a88 with SMTP id d9443c01a7336-215bcfbe4f4mr55902545ad.20.1733278230412;
        Tue, 03 Dec 2024 18:10:30 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2156815bcfesm62785115ad.215.2024.12.03.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 18:10:29 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v4 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Wed,  4 Dec 2024 02:10:12 +0000
Message-Id: <20241204021014.5083-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds keypad driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 keypad driver.

v4:
  - Update nuvoton,ma35d1-keypad.yaml
    - Kept the same order of properties as in the required block.
    - Changed register addresses to lowercase.
v3:
  - Update nuvoton,ma35d1-keypad.yaml
    - Removed vendor-specific properties and replaced them with common properties
  - Update ma35d1_keypad.c
    - Modified the driver to reflect changes in the YAML properties
v2:
  - Update nuvoton,ma35d1-keypad.yaml
    - Fixed warnings and errors generated by running checkpatch.pl
    - Removed the previous version's properties and rewrote the
      properties in the Device Tree schema.
    - Renamed the Device Tree binding file to nuvoton,ma35d1-keypad.yaml
  - Update Kconfig
    - Added COMPILE_TEST to the depends on line in the Kconfig
  - Update ma35d1_keypad.c
    - Refactored error handling within the probe function.
    - Fixed the mixed use of devm and non-devm resource management.
    - Corrected alignment issues in the code.
    - Updated suspend and resume handling methods.
    - Fixed variable naming to remove camel casing.
    - Used for_each_set_bit() to check key states.
    - Modified the code to align with updates in the device tree binding

Ming-Jen Chen (2):
  input: keypad: add new keypad driver for MA35D1
  dt-bindings: input: Add Nuvoton MA35D1 keypad

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  69 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 386 ++++++++++++++++++
 4 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


