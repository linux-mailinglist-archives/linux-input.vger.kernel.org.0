Return-Path: <linux-input+bounces-8027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 266F09C4E3C
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 06:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7006B247BF
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 05:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06FD17333A;
	Tue, 12 Nov 2024 05:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWNoud94"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4855B5234;
	Tue, 12 Nov 2024 05:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731389490; cv=none; b=Vp4XcB/KPoE9eBYj5FJnlm5Rkx4RLOyVHfQfVv4sWbzAhB1oB4HGIDBChZFdVwV2oHRCwNljovav5PmWa+wBeh68QYq7+Vb21zhWJ1yas61+USHNkoKvKMs2xNBkbu5NEbYXFWb23r5lPpznNWafvXaaojc1GnIOx0idszHRp0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731389490; c=relaxed/simple;
	bh=3eCxTT4b1WO5+0qSZnpCZ8wcSo+kg8vDgcs+dEJZvoA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=u3nIBUImnUjsh1MrDk07vxwwQ4/hY94LxF6GJWfKPP70pzyrEsDLL+vuXC5yequ0eeujK/icY0mbWBN8Lmmx9T6WryR0wYWObuAWENtRVS9ZCpId8yE9iJmzR7y9gOiLIbfE/9QyP3vFvg3FNBZtOOZZAfMUTLFPJfO36oukVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWNoud94; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c77459558so47639495ad.0;
        Mon, 11 Nov 2024 21:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731389488; x=1731994288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaIHE/alJNdCEm+B0Rt5E8wgvLMuusJFryUQsYRdIFo=;
        b=LWNoud94p6flTupLUjrMUQjYvjmgwIoTWHy0IGy1HkPUkve9fSnKfKeVMa6vbUZI7r
         gtorqRtb4KBY+E2EDyaTRvAfJFly3EbW+ds9SPvo8ZoGPTwR9/AWrBtwvb8hb62pQbNa
         UfOyzi9kgD+fA6g9vIddLsK644AyAeoXX4lp65UlLGPMi81nn0Nbad4owqnaUJbH2Qw8
         awU8eTwIBx9o4MoTyx9l8ka0LfM3d7QXWLbCvaGooaL3edm5K619m2Xgh+BX1b6uS4Us
         7w8x3We3kf61MJyZuM2ciGTkPgfc2JWSH2sF43+gNb+yxe2mTnW5z4fAJRoUy0ikmLrx
         vMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389488; x=1731994288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MaIHE/alJNdCEm+B0Rt5E8wgvLMuusJFryUQsYRdIFo=;
        b=P1sv1BdMA9yjFY7NQkqVnD2BMntlK+Bu1nDDfy3BD5yke2IDxX/N/AFyYW7XAUEx+P
         4b35cVLALb3ahBBkt4qRgKrzgZ6vWt8Z/xKXHhhjrtuvfXh1EJhh+zjnCTezrIEI0pBb
         L5314zydJ0GPp86/1oe0GdkkITDtHQKskIxr2UMWV/9AOLVodn+2VX7O5oBdKwafduc5
         okCHMhvzvXfqy0oxk4abuyYqKL8Hh7ic74W75eamPz9Q151aTO+8aEVvKNZXaLpT1TdS
         9e13ViGz1ln9vHvHUv4l9sjLhGF2R9Akwi1iRN3IDLDIf5VfUxr4FU7WexJPOJbpcMET
         ws1A==
X-Forwarded-Encrypted: i=1; AJvYcCUL75YQOutVeHHHme4RqAlaiekqBe0x8YA6+w6pTOq2Ehqn9bYEOYfMMici8JzYDTejZRaMktDJzQIL@vger.kernel.org, AJvYcCUd8VUoTPzh9dKsqITylELPCDaPv/+Q+oxQP2X9iIKKln/npb35QH+MB5jorta8/pbr8TcI8yeD0O9lspsN@vger.kernel.org, AJvYcCWhsgVYOGUXhjvRUIGD6maOtsSNSNcMwC5nQmM65iOKWULUdMN2vZCIp1S+NXSev9Nobdn9fddz65bEG/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0TTXeLN0e8CXnZel/6kjmzgeikZvp+hRhCIn06WUk3HypxG8q
	03fKi8+CXqxrqArGf6C8EAWUIWPIAyZbXSU46gdWWnaFhTvWoxd8YoWSKe/t
X-Google-Smtp-Source: AGHT+IFYV/HkU5vKmvN9DeHIWDv9WwtrlICSMfN6c3n88t9hMHe86wslFyujjptm9OyAiEzxvztnBA==
X-Received: by 2002:a17:902:ea05:b0:20c:d5d9:95dc with SMTP id d9443c01a7336-211ab9c4a9amr16506285ad.40.1731389488377;
        Mon, 11 Nov 2024 21:31:28 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf19esm85815505ad.92.2024.11.11.21.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 21:31:27 -0800 (PST)
From: mjchen <mjchen0829@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sudeep.holla@arm.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	mjchen0829@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: [PATCH v2 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Tue, 12 Nov 2024 05:30:57 +0000
Message-Id: <20241112053059.3361-1-mjchen0829@gmail.com>
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

mjchen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  89 +++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 308 ++++++++++++++++++
 4 files changed, 408 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


