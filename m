Return-Path: <linux-input+bounces-16957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E39D11827
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 10:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7B76A30471A1
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 09:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78ECA26980F;
	Mon, 12 Jan 2026 09:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aYmL4FIw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE01F25B1DA
	for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 09:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768210396; cv=none; b=hMuaSM/8/DWiFw+RnCR14ZwQekzw9t0D+ClsyrJReVsCP5Q5k1fsCRgqDPuUDNX0rV2ZRd67u4uR4H86AnRYyjRlobq58nsjWM5X16qHVU4sonqn2LaVFvKKTxw6uWGdgF/QdISce67fIyxpcJoAigI9cRkdYByakP/JowB2e/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768210396; c=relaxed/simple;
	bh=IAKl4vpIBEFH7+YWJ3gRbOu7pA7TosM0+vs3odp96+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ncPXeWfcvjlUXiJX8pHTCZ1nvvrfQs0ilA6VDfk7Oo+TDyiSQeYMs849thmjoMci/8NAsToTBaP/+tBje/Z53a1Mh/jKQ38OFXAutr9L4ejlqaEFWjCIKtLSwm3JXPGtS/hwHITJ/7N0CIfLGoFbggH+1ty3r806mZ9INYjfoxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=aYmL4FIw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so5287845f8f.0
        for <linux-input@vger.kernel.org>; Mon, 12 Jan 2026 01:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768210393; x=1768815193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DP5z3e0ZOiisg8hZsQ1FZqU1iTR24BbzmoSmozFADbc=;
        b=aYmL4FIwelrT9K8g+P3MbfaTO3XwTo0Hwd8Y3nGLcyrns0TNsJ8Qs9P4fa3YwbPhmp
         /mQRfv8da++YjE5TNxClgDsLlmcccHtU40QEG+ryprVpFpY3jZ3BxQ5nLAIos596KCdp
         xKBOWIoAhiAdIFGcN7Z9KR2blI/4MOscVRTbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768210393; x=1768815193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DP5z3e0ZOiisg8hZsQ1FZqU1iTR24BbzmoSmozFADbc=;
        b=mKqaoYViqKW60N07h8zthtjRAkA21JSsMIA2ZHCMUPRoAcPzIrUpyvdqzaf8+5M3qq
         cj6IcUEW44Vho1YZb00aFNOCyT/jmmJ/PeVtLtUDv+DauKjYJmatGvS+tGXvNV3ppkRl
         5ktDUaoZuXW+essNJASrfMnxaDYZNZg4LSvUdr1jTH+ihmWsyB5Afwj+ft/yaNTAsr2q
         94aMyzArChZtFz1BaFhI+OCQQBI2A7sPoNkx0hu5jyO9/Hv5khm6Nui1DqzfxDdrIkVk
         /r/CdvQAi1oY3n6fdrFu5zcgylMfF/aubFs6hhC+RU5YrQ9UOojKvF4upRtwiCyVxNvC
         /aAw==
X-Forwarded-Encrypted: i=1; AJvYcCU3ZAADzRbg6M0F5QAD5rYMjm1Mr13bleFC7qWsSIOVPMGHyzvqy119IZIPTx1SYqMQ1cprmyALBj6Ncw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+tp46k7cHNSI0g++vZ6vx3xMF7uTyHnf6V9/Q7bny8+iLprEJ
	1I5QKPR+CWU603Jm4T6DpyxbF4P1+3ZDgfnGnvUhb5zZmY67zXgeiqPuRulfq1p49g==
X-Gm-Gg: AY/fxX6SV/V7WfEdSCyJ3DIXNNPyKJ2vM2WiOQ7O021uPUUoSTvOzO7sbpyoyyM+3i/
	gNveAvS7eoyHsqiW/OID0dAyeKOKAwbU3aAbC6YTw70EMdNw5n3vex/so9k5einqPO+42xLZfq4
	e5aC9kSBAfuUUJZ4yxh3SNY0ftL6Fgcdys4agPD1uWXSxGbAdf7ziLVTb7IVzkWCeYZl9tTtOno
	i65Ygyp0kgNUsQi+uOnvdqJaiFzZ++vIqGj/OxABA5+SrmGB+hnMcVtnvfkrTRdjS4xAN+FgV65
	wltCPbbUgy7MgG40o86yjcB8M7y7eTA2N+pvlDhDuKknxReuMjCRFumKtoc0EFIG87NTpUkNN6J
	81RBGLCFld5HwpHOJ1nbt1AYFhXR7Zv+cwWN3PV9u5n4581tOXMPlMfk0GXj5fID6OQDrwx6xrJ
	xGF6iEiMFZ/66pzi5UNKtjZgthUw==
X-Google-Smtp-Source: AGHT+IFswOEiIqy/9YWajbGN1gT75zToUj2gfiKRmyBNuc6vk7aVyRzAS/0ByYHRt5DYQaP6QCA7xQ==
X-Received: by 2002:a05:6000:24c2:b0:431:c73:48a8 with SMTP id ffacd0b85a97d-432c37c8796mr20710449f8f.29.1768210393125;
        Mon, 12 Jan 2026 01:33:13 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16ffsm38608881f8f.12.2026.01.12.01.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:33:12 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/1] Input: cros_ec_keyb: add function key support
Date: Mon, 12 Jan 2026 09:33:08 +0000
Message-ID: <20260112093309.240905-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes from v4:
  - just a comment tweak

Changes from v3:
  - implemented fn layer runtime detection
  - tweaked cros_ec_keyb_fn_code to return back the correct position
    code

Changes from v2:
  - renamed the dt property to use-fn-map, dropped the example
  - added few function comments
  - added a helper for obtaining the fn code
  - reordered, dt patch first

Changes from v1:
  - change struct to short types
  - refactored the fn key handling in its own function
  - changed props to use the google, prefix
  - reworked the properties to use an overlay map rather than a
    dedicated one

Fabio Baltieri (1):
  Input: cros_ec_keyb - add function key support

 drivers/input/keyboard/cros_ec_keyb.c | 174 +++++++++++++++++++++++---
 1 file changed, 158 insertions(+), 16 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog


