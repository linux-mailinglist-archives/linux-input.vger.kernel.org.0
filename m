Return-Path: <linux-input+bounces-5038-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 023349317AC
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 17:33:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 750ED1F221BA
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 15:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E6618FC91;
	Mon, 15 Jul 2024 15:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XoBJtES1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E318FC82;
	Mon, 15 Jul 2024 15:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057615; cv=none; b=YfV2jQWrueJCTaQMn7AW6GehzxPNMfkhpXriHlfMw6ym/RSiD046OFD3Pz3z1iQp6l615PBgcuV1F/a0zKQeNvQYn2IqcNPxowGxMWb1f1zxE2QLuUCSrT4LwJSI1v5FEDIAjfx2SLyGxlNX46wVB4txtQNdHejcFtiAjVNHUFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057615; c=relaxed/simple;
	bh=42X1XcSiyhr9rYbdrgBDVEy9bPWF4PwzXgU6n/VhVGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mRKQk83/3A4eXaEKJT6s85/O9ihKyrp4633T2wUvRyWPrq1rKFR3kG7Z4ePMDubKw8eijN//KUUZ2Fsba1f7X0M3/K/BcC6fL6R8+7yu72p7oOXY2GXpKzY3O0DpsH6wffJDgpfuo7X8olt2V2jU+7TPCtcRjbTNjAjjNRGEBao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XoBJtES1; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3679f806223so3278384f8f.0;
        Mon, 15 Jul 2024 08:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721057612; x=1721662412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KjxCwRmZxD0NghIAdi0Gj+hYNdC308NqnsUVK+w6DfE=;
        b=XoBJtES1G3ndQJsaU5pOFW5haOkNcMeZQv9iDZ6d/YQgvwmJ4NxzWWtyCpvdrBze+q
         XS74D2V08Ogm1S/+MHUIoyk4wR9Ut12uJMHs5xdWv6IC75fHP+r72vIuol3IN8L2mdr1
         +rfKeZ0OtCZSICrRwghtBEUv7hfOgvHT1cENjs+2CBFturlQr1S/9FGjT7bTg4BLTCpp
         6Wcazvl7/uWzjRv2RauxwmXA4GzgVKiNoVdWUp7/Opehn1brIQnHUkvpaYWmMiah1csm
         d7kcQVTqGOZJTw8GiZoae5ukpFrEu//Z3pGX4dDAskx/CXRO+bYihIfNyt7sQn+SKZAJ
         oGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721057612; x=1721662412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KjxCwRmZxD0NghIAdi0Gj+hYNdC308NqnsUVK+w6DfE=;
        b=pO/bNyGKjDExciNH+phoKxkjABTHkn3v8Sc92yZcmAdPHEwn9gwy1LVEOMN2Yytcny
         RXQlPC/WqiqljwGGmUubSVNgF9OjmSpRb+9rQu7Yty0rAdj1CYnT2EVY9V45Wg6cYEYJ
         KPHE/hv6kbsRcnB0jmFuVoHfmbOLq5VgZrbq2dT+TYI/jwhUTxQyGjgHP8DG/T9bnpVN
         7EbeJ3MQh2xczAQb+CoNCW/NAZn8bQTRLkxuyH1NSFJQxksoCfqlb7906CIbRPheLLzW
         nDso3cWSoCBENyem3wL9B2NRXBuFEp2X19lzFuejjrgZdYFil14OYtrTDZhe0Rj3JRh1
         ZZyw==
X-Forwarded-Encrypted: i=1; AJvYcCWZU1Fpqggq4CDbOicxv8j64DKftmBqKjMYdfxcp67EPdp63JXqpoKJMeFZ3NoCSpD6R5uEVllnnNUv2fakfQ7QLOOKwcfu7u59Z6+1vy/ImB86tpTerliOpDwomAed9rsdUSzho/j8mw==
X-Gm-Message-State: AOJu0Yye2k7sbAlOtD1Hhnt2Zm6wMFn5OYuVl7vvUI9kS8bk+z3b9U6S
	/i1mbdNPbHbys/JFXlo9K6FpaiIzzHDdQHikAQUzxmqa0ZVk8w+M
X-Google-Smtp-Source: AGHT+IF8lHceTME+XT0pHLUI+dbiNjpEZB4/QdSQgJ4j5SKkXA1Gy/sqaXaS97dqmAsS4RVL2gwAUw==
X-Received: by 2002:a5d:4f04:0:b0:367:89b0:f584 with SMTP id ffacd0b85a97d-36823c4ce4dmr227387f8f.11.1721057611736;
        Mon, 15 Jul 2024 08:33:31 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbf4bsm6720866f8f.73.2024.07.15.08.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:33:31 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/3] Add a property to turn off the max touch controller if not used
Date: Mon, 15 Jul 2024 17:31:20 +0200
Message-ID: <20240715153330.91979-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Our hardware has a shared regulator that powers various peripherals such
as the display, touch, USB hub, etc. Since the Maxtouch controller
doesn't currently allow it to be turned off, this regulator has to stay
on when not used. This increases the overall power consumption. In order
to turn off the controller when the system does not use it, this series
adds a device tree property to the Maxtouch driver that allows the
controller to be turned off completely and ensures that it can resume
from the power off state.

Changes since v5:

- Keep reset pin untouched in mxt_power_off (Dmitry)
- Generate proper reset signal in mxt_power_on (Dmitry)
- Drop introduction of mxt_device_register (not necessary)

Changes since v4:

- Load configuration firmware during probe and not after resume (Dmitry)
- Do some improvements on error handling (Dmitry)
- Add Reviewed-by tag from Joao

Changes since v3:

- Move the power on part to mxt_start and the power off part to
  mxt_stop. This allows to turn the touch controller off even when not
  in use and not only when being suspended (Dmitry)

Changes since v2:

- Add Reviewed-by tags from Linus and Krzysztof to the dt-bindings patch

Changes since v1:

- Rename the property and change the description (Krzysztof, Linus,
  Dmitry, Conor)

Stefan Eichenberger (3):
  Input: atmel_mxt_ts - add power off and power on functions
  dt-bindings: input: atmel,maxtouch: add poweroff-sleep property
  Input: atmel_mxt_ts - add support for poweroff-sleep

 .../bindings/input/atmel,maxtouch.yaml        |   6 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 134 +++++++++++++-----
 2 files changed, 108 insertions(+), 32 deletions(-)

-- 
2.43.0


