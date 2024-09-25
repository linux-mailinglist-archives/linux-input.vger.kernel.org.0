Return-Path: <linux-input+bounces-6695-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9894B9856D9
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 12:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 573522811A0
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 10:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729121684A2;
	Wed, 25 Sep 2024 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNwWItpy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1065A15F3EF;
	Wed, 25 Sep 2024 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258604; cv=none; b=NomIvDOi/Ws8bsTtGPa2WrJDdHwc17e+fDV/1RonfhZMbGWKHSAZcnsl2KbUCO2DZgnMbhMX2NRig9IpnMlQfcXzMV0e/sqkXrTkwxsnEH0UshufbZuu4qNquNTOa7efJXxaAQ2ioZzkyisJ7SEbWC3b3RSb0rLxutzKKQyhvDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258604; c=relaxed/simple;
	bh=MPuNoi/yzXzpAnBRvO/xiDLuLsdlyohqKZY8gcPLFsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QctksGrVmLNnc6J6exMNbFouBLf/SOenrpom0wtK78v1FcfNnwOSrLnqbzRLReJbdWewhsNBEHZqEKMvXUSBTDBlA90vUrKZqzg3SpWk74HVR+IFjnghsR4XkiJa3FKymy+wq30F1tRRTB5W0YPpZ5lauv5afy63GIU2RSZfEbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jNwWItpy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71971d2099cso4951467b3a.2;
        Wed, 25 Sep 2024 03:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727258602; x=1727863402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/fSNkyPnWXjQ2kqnNMie6EpXe8PNDAHTytx3zdflWA=;
        b=jNwWItpyO+LkoJZIYc5ZKm5xF/TtLrjYNNajFGypBQ8q8SEo7IFPiytulJqFZthoTx
         p0W3HYuph01KthMMuyTxlbJQnsy3YB9LXF0m1LoJRc+1cV8kyQloz54AZioT1u+zzalf
         xmH+rEFBo7GhimfHud7tX9rHPcT07ssFzn6Q7l/1ZS44xxhiJWEcHABoz+e6s9mFd0SF
         nc56eFSQEUN4FJ98tIklbJ5x2sE0fTbw5tWHcq7itjmNvQ2ilZ4cPTZXpbJZ5KumvmA2
         s+GhY/bC9JVD0XcFm2PdtSzzHG8tk91GjtaDLgfTDfxOqzOcrbsm13ApftqC+1QPcoe0
         M7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258602; x=1727863402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/fSNkyPnWXjQ2kqnNMie6EpXe8PNDAHTytx3zdflWA=;
        b=OuKx2azWZV1cMFqeOyHiPGBlN8dOlQhj/GNx/YNiYHY7SQ6i4JUjne0NA+x5p4+Ag1
         uJrfFEl124R8IhwD499uYitS0Ili4CQIEJRafJlvgowr3TqSFRNCS/gDO9//of/r+RYB
         jry/4S3m91gKk1/ZrUO96cVcpxX5NFWojZOkFIdUVKVv1wekE1h2T98q3kyD6M+doWUt
         O9er63Fe3A3TmrH8wTfCxGB9BXF00lJb8Zx8dCJRiSlxcsbhSqwoBLWtVhOsywkG9weU
         SnPMiSoXQ66qYO017jyvBppP6DgISAjMKDgGhtkaOa/dyzRFjBb72LDfB+yUnRsSPjrD
         bXsA==
X-Forwarded-Encrypted: i=1; AJvYcCWpyG7WwsxlhdsqqyT8xUt31lQeedMHhk+aCEDUY5Rp2gXIxnioVbhKbN4ZsCIMbiatryw6Io/sQ54JRw==@vger.kernel.org, AJvYcCX9PgnyX70m9WuSM2clyEpysLRF7EoNIJtKqVcNPMGa/iQJYzM76tosbaJDHrZC69MM+cc9vK1T8gAXZgyH@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZtyfzj2S+JSBjsyVhIq54zc66ojF4WUOCb4WkRONOuPxmsoy
	IlS3OmjO0wQOZF22Y6YyUujF+0jVzWm4HKY1OA6S43mzQVmSkL6wINX8u3OHblfR
X-Google-Smtp-Source: AGHT+IHq7zInVSSlbjvege1VntDcRUMz0Dz7MsYHNeGGUdhQ0aUOBAcA7mOaTFVQj1HgOb02V9xv9w==
X-Received: by 2002:aa7:8894:0:b0:717:87d6:fdd2 with SMTP id d2e1a72fcca58-71b0aaa58e4mr3984842b3a.4.1727258601999;
        Wed, 25 Sep 2024 03:03:21 -0700 (PDT)
Received: from localhost.. ([42.116.8.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71afc9390adsm2462546b3a.134.2024.09.25.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:03:21 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 0/2] HID: i2c-hid: re-power-on quirk for QTEC kbrd
Date: Wed, 25 Sep 2024 12:01:58 +0200
Message-ID: <20240925100303.9112-1-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve keyboard not working out of the box for Dell XPS 9345 13"
codenamed 'tributo'. X1E80100-based laptop's initial support is currently
being upstreamed [1].

In present state, keyboard is succesfully initialized, however attempt to type
anything throws 'incomplete report' errors. When utilizing
I2C_HID_QUIRK_BAD_INPUT_SIZE quirk the error is gone, however raw data coming
from the keyboard is always the same, no matter the key pressed. Issue
'resolves' itself when suspending and resuming the device.

It appears that calling power on command one more time after device
initialization before finishing off the probing fixes this weird behavior, and
keyboard works right away.

Introduce a new quirk for such behaviour, and enable it for particular keyboard.
Vendor is shown as 'QTEC', however device id is reported as 0000. Given that
vendor was not present before, using HID_ANY_ID to match the device should be
okay in this case.

[1] https://lore.kernel.org/all/20240921163455.12577-1-alex.vinarskis@gmail.com/

Aleksandrs Vinarskis (2):
  HID: i2c-hid: introduce re-power-on quirk
  HID: i2c-hid: introduce qtec vendor, enable re-power-on quirk

 drivers/hid/hid-ids.h              |  2 ++
 drivers/hid/i2c-hid/i2c-hid-core.c | 12 +++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.43.0


