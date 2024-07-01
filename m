Return-Path: <linux-input+bounces-4741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B266791D7D7
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 08:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAFD51C219E7
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 06:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FC47364BA;
	Mon,  1 Jul 2024 06:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKdXkyyp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0717D33FE;
	Mon,  1 Jul 2024 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719813965; cv=none; b=DJtZ8gUEALNPVOE/5/E5835t857Qkm5nQ+sKg9+t2irKdYowwJOX8YUlviprRyVrXgi9fyd00i+YpbqS5l5jxZxJkj+TFe+W9ckaYDcGYgAJFyJpmwXHARpDPZnK3icDsdRaFVOsh8DLk1PxGEE6PVMNUG3v1bqdh5t1Qa9GIZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719813965; c=relaxed/simple;
	bh=jyHmhz6YtxBCoF+b+T+iIrjoSkrSmFJevOyDQJKyylI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XmEBURCIrRmruSskDiGMm+StK+HSwh1vtQnWyfEsIQewYAjOJIhEb2pZhVu/4VRocRzvWjV/52tEjnCnKQXh+yvTGk8nE8D/w5u9+CVBxEpKfWW3o+JMo2+OSolUMZmmkbguLDx3EX2BMU5zx4Gxrhko6DCl7BQlYbzwODdQDgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKdXkyyp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-70b2421471aso1427728a12.0;
        Sun, 30 Jun 2024 23:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719813963; x=1720418763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLiIJ+2Vic/d/7Emq4DIWvGCTnwHORSzkrZU78QtsoY=;
        b=DKdXkyypCZo9dJ7LFmOzgbyf3tYUZLDY3Sr+6zYZyodzJLnkLRhp4U37lh1N6d+qmW
         BTJ4iPXeI+TbZtbViVjTvkZ4XAm/mbumPuaS0rVtcKbOKDbK3eK03Tc6BJPy5xQp2ms3
         930FUSPC0MQtagoz2dZslDuWv0AwOxbdZ1XSehILFUmoVSRjIAZ3fNUG0UckORgq9tPX
         88EDIAhfUaHjDI1BeCDE3IbTmhM69RhXplSOvlM+Htr3lcvb68aKgWHDFPiZkBex9Vep
         Qkte0LcFLA0HGKJEhZYohSyR7N7e0LpVExHrkE+NY9FnyXySlkWi6i8ndx4csBIP+9Lo
         Pbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719813963; x=1720418763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sLiIJ+2Vic/d/7Emq4DIWvGCTnwHORSzkrZU78QtsoY=;
        b=QyT3pTzYjuKliB0Qai2H7Pu9ViRjONbr0F6A8mGGJ/9yA0/cX22t5dtDMNDmIposf9
         vMlWDAFa31rrE6q+8gxP81BQ+wRO9X1XiS4QwerBrtUoymhfvGPyDkoNoHTpjj34hUu+
         XCHDUmQzGjwehqjTK/RwMqhRPN1Drch9paaJfYVXh2FHgdzxLUC4x2I6vjOO4tnBS6BB
         OY2YyJ+f9WUpynu1DYwYds3RGOUjdjLnOTDQ/W0x+9iJdtFylKhuc0N1LQdRdA8f6ZZ8
         snnUs2yNikT1hIOwLdYKcAdbx2GYmyPWKz5AAGpty6Swa2diQdKGuOPVe5Fowp2rlhMX
         uxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsamF5x2Wm9Swgq1J6egLGw9/+TakTw1W3QM1a9/lPnpUp9XKEW2u2B812Cx1PXJXxQtY37jPWc9KoMQc7BuwYQBCAiNtt3knMOVO+
X-Gm-Message-State: AOJu0Yz9WB8+/PiBVTCKaDzgYmX/a58Eldi4telJXYu0tz1x9PViGyLk
	RKNxeAFKBj2ffM0r1l1XTL6cDnoFUTwdRmEonwcGrsQarkWERsiyhKbRcA==
X-Google-Smtp-Source: AGHT+IHCKtehDdiR0dyGWpJB4TkdD2rqJOm+yBoFMsLgUGeMZvz3UCWY4g6qCx6Am5plA5LWYhG87w==
X-Received: by 2002:a05:6a20:431b:b0:1be:d74c:dd5a with SMTP id adf61e73a8af0-1bef6101c9bmr4058728637.23.1719813962961;
        Sun, 30 Jun 2024 23:06:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:7783:69e6:8487:f6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fad304311csm44588205ad.31.2024.06.30.23.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 23:06:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Simplify event handling logic in input core
Date: Sun, 30 Jun 2024 23:05:48 -0700
Message-ID: <20240701060553.869989-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series tries to untangle somewhat convoluted logic in the input
event processing in the input core by realizing that input handler can
be either a filter, or a handler that handles a single event at a time,
or a handler that can handle a sequence of events, but should not mix
the 3 behaviors in one handler. This allows us to reduce both filter
functionality and single-event handling functionality to batch handling
and have the main event handling path to only deal with
input_handle->events() batch method.

Dmitry Torokhov (4):
  Input: make sure input handlers define only one processing method
  Input: make events() method return number of events processed
  Input: simplify event handling logic
  Input: preallocate memory to hold event values

 drivers/input/evdev.c |   6 +-
 drivers/input/input.c | 210 +++++++++++++++++++++++++++---------------
 include/linux/input.h |   7 +-
 3 files changed, 146 insertions(+), 77 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


