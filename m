Return-Path: <linux-input+bounces-5070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF90933E06
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 15:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091641F222E8
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2024 13:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20345180A72;
	Wed, 17 Jul 2024 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="2JIRp6a5"
X-Original-To: linux-input@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447D7566A;
	Wed, 17 Jul 2024 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.87.146.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224562; cv=none; b=u6jWwO4j1yDA9yB7tfMnx1l+/flg/be1UawQJFRDxyBc1pMXpNP3xeGN8qUzDJmbkf2LOyZ4svcdCikfCM6Gy+5kh+Qp/3Excd+9ysncK62p57FSAkY5+Xc3EZu7W7I/ys7H4V7DOJbuBHTMzVF9YXdII4L0bH8jCv8dRyXJefU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224562; c=relaxed/simple;
	bh=3JLeakvUoL1c9iCizxlAZxvMR1xaK8Nc1uhBJnc4gOc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BQTF9KoG0Pm+2ymVYU5a1S93+bPrp4aog//cCtjEwaB7uurZj77xVZbBJqQ7nLViCrulSV83KumnI8e63IAsmY/lWgSqmoGXRzwTfvn195iFQHP4Ufd3X2LmwtF5o+8CxB4OFdLSWhOKxy6DAoB3fpIz1O3kFBoLu2zSDW0LLdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=2JIRp6a5; arc=none smtp.client-ip=194.87.146.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 51E49401C4;
	Wed, 17 Jul 2024 18:55:42 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1721224544; bh=3JLeakvUoL1c9iCizxlAZxvMR1xaK8Nc1uhBJnc4gOc=;
	h=From:Subject:Date:To:Cc:From;
	b=2JIRp6a5G6U5vL3ZQBf05kTszGUESN0aJukfyIuSO+LQ+OhPQfjVr/6uoygC3VFcC
	 SbfWaRoabYP6tVq0vQX5DTxh9o7/A4Nilm2aYmdgkJ/9M8J43rFW1TfBBpGsVTb3m8
	 KhlBT5hufAahj3Iq1OdGcLuYWRCAbfZcgnT4eNpONaw0BDGQREjg5KlkEUwzR36CA0
	 7yRByqEjP+tUpxQqrbuft60ar3UDiOF/qVCCqYQ7KZ3fKQfokpsEhQn50o9SuiSvbo
	 xDX8+RKBD3twklpq9P67JCtREj2eXqkfNQ0CJcAMqu9pr+CfTm3XT9WaxkgU1PXxgu
	 x7+bbekLGxzIQ==
From: Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH v5 0/2] Add touch-keys support to the Zinitix touch driver
Date: Wed, 17 Jul 2024 18:55:32 +0500
Message-Id: <20240717-zinitix-tkey-v5-0-52ea4cd4bd50@trvn.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTNl2YC/3WMQQrCMBAAv1L27EpsEi2e/If0kMbVLkIqmxhaS
 /5u7N3jDMysEEmYIpybFYQyR55CBbtrwI8uPAj5Vhla1WrVqQN+OHDiGdOTFrROVz94rYyHmry
 E7jxvu2tfeeSYJlm2ezY/+2eUDSocOmvbo7fOnMwlSQ57eUNfSvkCf1lI7aYAAAA=
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michael Srba <Michael.Srba@seznam.cz>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=3JLeakvUoL1c9iCizxlAZxvMR1xaK8Nc1uhBJnc4gOc=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBml81Z8Vc3wWbuvFJA2X998N8NoOdXWixcDxDZ8
 seybOilss6JAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZpfNWQAKCRBDHOzuKBm/
 dZ+kD/9rxBC0vKVA3Wb/ydCS9nohtOw5U8ojU9e5OJQMRvHSN2ifC31DWL7EdsJNtySvs0k+sQP
 oGx2wgAPFMjDr35EJgWw13HV5/PiPNfLew63hmayYzuIbkAHmxgt2iKX8zJhfjVE9qj7KzT2QmQ
 ZbxOQkIbg/0Ndc6fpENle4zihJuyW5edebZQydBxkHSRg9MzZQHTgNzubbwZGNBrF8kMIGuU6W2
 llyozQRIBNn+Z8uqiBS3Gqd0SuNKAXl+ovckse6yjXvVVdNJaPbbcgLEhsPZUf93IPUCsFoUeFS
 VeQxNiRoAQBP7MQc9Z1sJ4SezEykQrotjAdkISbvPhW2scz3Aa2Nv6SsMCNpXsaSr4lR1PDv3li
 ewzXfXWYG64O0wRbJE2q2/wGFk5TaJ1vkUfWnYxQeQ5gzYnkE+d2uLsiah37QwMrr7ELTUwvkL/
 ++pg1cgmd9mSuD/unwNDt5QXOj/IKtrPlHGn++kjuz9hqlLMDxaZdgPRLzoBzTKptPwTNc5w8sV
 R83dwKtOawMSgT8JObcfjqYOfbyKRGJpdYKWkcxVjFYhH3q7iW2exZ3TeZ55IVNkpNecreMQJjh
 QdG62Rw/QA1RKKw/8V/pC6iZFRIfeYmWYHH66t6dmAVxO+kQpqeUSIok1vu0mWhIIYlNN9RkD1w
 HvmWsPuYFXAqaxg==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

This series adds support for the touch-keys that can be present on some
touchscreen configurations.

To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Michael Srba <Michael.Srba@seznam.cz>
To: Linus Walleij <linus.walleij@linaro.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Changes in v5:
- Switch to using device_property_ (Dmitry)
- Link to v4: https://lore.kernel.org/r/20230801-zinitix-tkey-v4-0-b85526c5a474@trvn.ru

Changes in v4:
- The series was partially applied, these patches dropped.
- Link to v3: https://lore.kernel.org/r/20220106072840.36851-1-nikita@trvn.ru

---
Nikita Travkin (2):
      dt-bindings: input: zinitix: Document touch-keys support
      input: zinitix: Add touchkey support

 .../bindings/input/touchscreen/zinitix,bt400.yaml  | 10 ++++
 drivers/input/touchscreen/zinitix.c                | 63 ++++++++++++++++++++--
 2 files changed, 70 insertions(+), 3 deletions(-)
---
base-commit: 797012914d2d031430268fe512af0ccd7d8e46ef
change-id: 20230801-zinitix-tkey-5a3023bc304c

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


