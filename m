Return-Path: <linux-input+bounces-9020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC666A04E9C
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 02:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5B31887DD7
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 01:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27E6288DA;
	Wed,  8 Jan 2025 01:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVRTlEGt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A849259497;
	Wed,  8 Jan 2025 01:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736299103; cv=none; b=t3/xqnokzxQSlMciDzq0059K7lMlzIBhpwwY3VvKGn/t9oH9JFz0IfTb4BRGMrG0Cm+G9ELdiuNnq83TPxpTSd+SGlOWb8zWceffMus30afZgd+GpILjN3DUwMzuH9WHO07AEVSDO+RtrNDEp8fUu72sWUAlvgvz4Z5c6EMFOI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736299103; c=relaxed/simple;
	bh=jBOo1puqpX/q5ZAG/ImV4cok+3Wgvk1HYt+37Vk5hRw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=L+LDgQ+KRCLH03+g4QyPaLsezR0/6Fd2ow7NDRMwwx/kH0AvyxXxYyA1UEA7SYAZOQQr68YrGGu07BuBeTbj9/0o9+8rDooYtuWioABYqvMv6H7eH3TG2WzfadNQ5In3JA18bA5Di4NaUK9XuTQMwOBI8SxDy2cvf9gXP7cL/xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVRTlEGt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2162c0f6a39so6609615ad.0;
        Tue, 07 Jan 2025 17:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736299100; x=1736903900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vx99Y8SQrugXLJ1+GA+aTfa0OBhtUac94dHDKuroZ0M=;
        b=ZVRTlEGt/Rp/WCKeMBM3UutMYiMZLd9W1DUWtWOeYA8PzNpNb1AzOkgZ0p2m9rJii6
         d/7l/i5fT8bNwvF5Gshh3TyoDFCvtlQA9PZ2aU8eVpZd4TGamMmQNVKzwDUNlFMMHhpH
         KjYQCyn5f7lW2Ow/jvGwvUduNoEJHFq92bGcj7QqvlVEbe1HR7mw+Nyj0rhAffCJ0MiB
         9tqMoPi4cIVmM0UdDbxfnByK2w4WvOKDPjEXrXqa3vNQVccgGR9ItNhvUZYnxD9kggoc
         7riGytqqEnl6txv/1KZ60QoMx9oqySrU+MJhSfgvdgfB8olVB5XD7p3Ic9HlL1HIYHu1
         TguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736299100; x=1736903900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vx99Y8SQrugXLJ1+GA+aTfa0OBhtUac94dHDKuroZ0M=;
        b=i+XiLlG+Tdvk1+iBhhKFL42u1bZfSELpgZ23OI7ypqX6QkU4F5VVKU6RBqvWFHcO5B
         vAmI5QLVus9RxUYtU2rIDI4V1Rh2rgnbs/SqgbI7yG13dD+TOCZumH9I5pnJ2P7NZR/6
         2abxLMGiMmdURpq18j6mVp1Xr+w4QVkuuhdD9A0R9VB9TQb4ZYi213BBA+wYRrQ1t2Xw
         2/p3PXn3gIO8/FdZcbjqBmQmJvJ87VuppRaL/jW1mMo57gXqzRULHDq7uul/eE5wsFiX
         JPU7ai6GtVzdgxResBl5rO4wEKrbFrgbsTtumv7azYco34TIFkxZsTRq/z6TxMakbF9A
         Wmew==
X-Forwarded-Encrypted: i=1; AJvYcCU9zoSgxAzkuZisirNEpcLorYUSWl1umK+WzxYRXTDaWpqagqy6ZjWah2z0bcGkiYras6K7w9kfmd2Z@vger.kernel.org, AJvYcCWr4z5pN8+9dYXCIx5SUua5ukXn47UdDmHuzLG3WDXw9fDlfxyHK3VJJpUCESDFLt7ZLKnfQHBSZJniX4A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhyt248VSQNyLNugzRPK0on+bQb2asFYBO3SuGoV0wii5+yqzp
	JV602c5/CcckIec9r6rAPVJZheSSuMOzoHPM+yoq59NqYhPPb1L2F0jdrUG4
X-Gm-Gg: ASbGncsDx+BJCSE/rpvJhveyQ8wmQIbSo8KVYgY5cHipTnY+W8ZTzOfMB6EyIz1xLBj
	fcW1oxrbJmSMR78vBorMsbM0iOdTc7/xOCwub/asbiUOJxmGv/fJTCVJNx/ZCDtoJTPyQ43Mr78
	ZfSpzYqtyDDf2bM5U6Z98DWg2WhzrgRpI01AtCn+RfJu2F/FNfCR5rDAa53wwytP6nsN4eV9J02
	V5hLZJ3QiMvFr1dtLJAaQnM37ibljXU69QfxhnZvnd3MkUYszuJEfrS0a++TUfOtqAzzY31aAtB
	273xJ7m0HGOGoP+3YMARJTEkcptsfLy18TEwGHdflQ==
X-Google-Smtp-Source: AGHT+IHBXjlnMHsFnSJ7x0oLswpnhQiItsRr5cWXQazhFwNjODFq+rz7pmKosjS34A3gO044xDQ+pg==
X-Received: by 2002:a05:6a00:843:b0:72a:78a3:7f57 with SMTP id d2e1a72fcca58-72d2171f607mr2054335b3a.9.1736299100053;
        Tue, 07 Jan 2025 17:18:20 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad83033esm34045009b3a.48.2025.01.07.17.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 17:18:19 -0800 (PST)
From: Ming-Jen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	sudeep.holla@arm.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v5 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Wed,  8 Jan 2025 01:18:10 +0000
Message-Id: <20250108011812.627-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming-jen Chen <mjchen0829@gmail.com>

This patch series adds keypad driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 keypad driver.

v5:
  - Update nuvoton,ma35d1-keypad.yaml
    - Reorders the items in the properties and required blocks to ensure 
      their order and items are consistent.
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

Ming-jen Chen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  82 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 387 ++++++++++++++++++
 4 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


