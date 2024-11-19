Return-Path: <linux-input+bounces-8140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A54459D1E8C
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 04:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50FCD1F227C9
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 03:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C4E13FD83;
	Tue, 19 Nov 2024 03:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrHbWpNw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3557C13DB9F;
	Tue, 19 Nov 2024 03:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985240; cv=none; b=Sr7LiOfsnoyWozazbQs7RHyc2dL04VaL6PJN2sSZW6qhksxM7QmhTy9xiRI+bqT8mfmatjd5uBC2VYUc1fuAMr7wq7ks0Rv6Yt1hFEXBKUwfXJzo3K3K5a3tITHHH6e6EabCNnNCpKqriQ9gmw7F7757jEZltjC3FYswfLVyZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985240; c=relaxed/simple;
	bh=VcvIkT5AVTbAYNXcxqjG5F7G/n+hGoVioH/Ravd3wlE=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=A/sI2iI3lQYDf7MtGcY7vRkbS9l01Uu8ru7KlnRQx8c2v0gE8myfRX2mqCsK/7ABI0GJ0QPAAlm6Ln9eXvCWBkzVW8kwPGqwQycmY9BsvItqZl+LexAyBV2h7Zn/ftqp5HRKEfBYdZm77gQ4o7JMjfn39LcbNIdQrLazCk7t8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrHbWpNw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cdda5cfb6so34514025ad.3;
        Mon, 18 Nov 2024 19:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731985236; x=1732590036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hOThp0u4KkIhCVtLoJEiqxjdPOsJLC7BccGXL9jCE=;
        b=QrHbWpNw/ffL9N+PUKCIvaSO/UNF9/d1kAjiDKc/sfvwaA5/zkfybPpDfbrcoqA9fY
         3RxjljZqHBXFzuScpLN7rdmsgcPVJAhbWD46PlO4EbgSMkNricelvNdmP4AP3KPaPRR9
         S+P91VLIJE2CdBA4DTPcBzlM7WT8fGn7Ed+TnzE6JLtp4fuetIxVQEzu4cEbAdrOLrR3
         SmPd5/G4e47ysaQRT3Fa0b3SAyXbSRf/z6Mon6nBTRUE1QxIFsGTyUrXh2mYK8j/hYkc
         bVGtLNYsgUm5J7kXzcDcm9NxHC1qYpsPzQxA4QeR21I4Oir2G0ghLpA3zmGm7p3xMdTo
         /F6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731985236; x=1732590036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hOThp0u4KkIhCVtLoJEiqxjdPOsJLC7BccGXL9jCE=;
        b=pVJd+zjgk9CACH/enu7LuRiL8joDruGJYOx+Z4r5gyQHMr40Ne0Ctn085icQzriAjT
         mzJVvcz/5Fi71kL2JqfLnpKSGS4iK+VjDBM0LmlonRicMqdJ98M9G4yiSvq6UBDdKRRx
         J/Xp+apEUq3nbrAa32dwLJ76F/FFT4JTcdJX0pkBAhksPOfBYyMydCkAJ03bwGRWAbiY
         oJ+j5uvJ8E6iii3nAPDAYgDE4NEMqGUcGSCOQfhv3jjm9yRYw6IsNDcEC/faGndlfU+q
         Rx7hI62ufWoWYaGlXPyAm95bkCcU1sUw325R6I9UW0LKEtk9s4Ksna2bPyAJKKSolNPf
         zmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9GkYlLb8EEny/J+SDIGnvaUqO+Cced4+DUwH79/rVC2AiQjWGafTdZ/lA/wr/q4r5u7XxSpQUXIYz@vger.kernel.org, AJvYcCXIMVp9URaGea4jihaQNcs5gHyw3dUYbUPEhwN1D+Rb9llDaOe72vTLVVEn4cV7oZ2lB3tQAwQ8xHa+KZ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGVdDT/vyL/X8jXAU2y/AqRc73ib9VLwxJr1Nal+Pll/4oOpJG
	oaSHd55APqRikvtSQhXj/Ab2yDN5Bp+FruDVaXxTltIiyyB/w32uArmOvyxP
X-Google-Smtp-Source: AGHT+IGKlIRFA/JCEBusSyrc7OfG6NQ5YDS4enGmbxctQfmlSsnccIVXGFL1ug5k6eDj8VaeOzV7bA==
X-Received: by 2002:a17:902:d4ca:b0:20c:f3cf:50eb with SMTP id d9443c01a7336-211d0ebd3e9mr222502395ad.44.1731985235603;
        Mon, 18 Nov 2024 19:00:35 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21210fe87f8sm32760785ad.29.2024.11.18.19.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:00:35 -0800 (PST)
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
Subject: [PATCH v3 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Tue, 19 Nov 2024 02:59:52 +0000
Message-Id: <20241119025954.4161-1-mjchen0829@gmail.com>
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
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  69 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 386 ++++++++++++++++++
 4 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


