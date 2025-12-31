Return-Path: <linux-input+bounces-16747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABE7CEC16D
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 15:35:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4832A301395D
	for <lists+linux-input@lfdr.de>; Wed, 31 Dec 2025 14:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4276D26E6F8;
	Wed, 31 Dec 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V4u3+2af"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C284F19CD05
	for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 14:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767191745; cv=none; b=Pmi12NXb4HxkbvZDg60REUSJT/BJ+I3QeTyjAX/FGSs9B2tgI85GvrGspdQNfTv/Tm1XKqq3tZovgfoLVBO4F+ia0nONXJfJCjQoM11CBCo/TTlgdL8qMOytMHa+IUI6bvLlygIadnjE8Eqrvil7/j5jCfIKz2eXkuBbPzPTToM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767191745; c=relaxed/simple;
	bh=AhVg3Ya4t8+09xhLV2MFKHi58VKUWxRFzPDeqNG4M/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iw5rsaM6+68h2KOCGQ0BBchDIHvJ7dX5MA6rgNgj5TEmor4mwDH1cHAY2J1MHsYTT0BcV8aW6QllfPWdqcPHYnjcv5jNEdLqoNyMJ+G0BcbV8aRGslwBb2N9hPIJnJssvOAHyMOQVvV/41YJVKB7QK9UD+EF7lT/uRVYCusA6Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V4u3+2af; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47a8195e515so66232375e9.0
        for <linux-input@vger.kernel.org>; Wed, 31 Dec 2025 06:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767191741; x=1767796541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zJt+Vk5CZtSda+Qv6TxKnOwmdavVEtubrUrFCi+hJhQ=;
        b=V4u3+2af6X/1nRiVIEId6GMTTjDLPf9tthl+IdfsuuDMJNBRKFoVwne7yLRf2x9/n5
         EOriUGXADj/AObdPJNybqK1XtXiH/CvwDix92EKWuop77pWTb1CufReE2KPcl7fCPQvY
         7XpMlGdv4rn1qMuaxPxxJYhWKC2ubJcMZLXnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767191741; x=1767796541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJt+Vk5CZtSda+Qv6TxKnOwmdavVEtubrUrFCi+hJhQ=;
        b=LLeWomWHbyf+Ks+h9I2WKlF682pUUGUowa7ZHZ5ZMatVmTisSbD19SZC2D8laZsf2S
         guC4FRfbf78w4BWTZ+cCPizxMg1LH6BRoJS2xSFgaJgmeHORyIyEf+J0h7xaRgAam7D8
         doH3/6xSuYehnJQSkoYk61ZcsLNFSQFkgGPRCaNNE0em7c4W2AmLFW6l2MGxhIWtu39X
         Xe7suwbnKs1uwxFhQZso2B2s2ZUCNgaPjilSeakv85pkLP+asBurtmg6DhO/O8f9Nm7l
         BIHPNVLKJv/UUnOCd4iIhpG/kkfyDoamNvzMGCRsfdTq7tcxwqWWYdjcIL8zQSvPiUFv
         PqAg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Sj3FyFvA+kOFvF1QsCED3MLs8GvQtNjks5HNOWebu7GNchG13dIIA9QIixMd+Qfn7ROxIZfxHFs2lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI6ey9QUCZpOxrRZOGtBJ/LfeQFMN316cPLRf1eOUOCTcGnF3q
	vvWeKftXAWVNEYCDqnrZAt9TfrDIMl2F8jyXVcEdD/Rqf83eS7wG3fLFZNc1ceLwlg==
X-Gm-Gg: AY/fxX7RtrcTFCv7qynf8Tt7hezbNFSwCrUNrwcwyTqbmOLxMX7kmPpFTRGr4yPcRex
	zu+fI/KF16GVQ5tdjyX57D2q28i2SSyQ/5kBjdFoZ4HG68AqiGyGMpposdPuKQbX2EpCi9kcSLd
	DHItfZyKrBgxcI/PaftTFCzyM2FORvTs9vp3imzv06HJeFYBbEhqjMOq+9+7+PLsDUIZZC5xep7
	xXIyyjJGF4c419aaf3L9S5aKOSN/+mKiZDeSVgBqNxZXihNhEJuNw7OBtBz9fr4LBHXs0k2fS6h
	Ap4xvkySZAI8AGwkmwFXIh40ldG5MNZJ1qTtsgOkQqMDMGW+3kb6IrWpx8DjkvRZpvnm/aORFK2
	GnqanAe5ZG6ViaHv/qdsU5AIV7mXfC+Gp6cZmR9FGvXponKZCnPB+8S1xc7A3anqqCo8DMMq2yq
	V9GJVUcuxA1pkxdm51qlV5H9ra7A==
X-Google-Smtp-Source: AGHT+IEAuByjLQ/pUsJ9uqNDD9bJhs+aoCV8W8RpPLTDvlnGTrKTtFFsW+clPesgyA5XNjr0o/YF6A==
X-Received: by 2002:a05:600c:444b:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-47d19549625mr389224705e9.5.1767191741123;
        Wed, 31 Dec 2025 06:35:41 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm630300935e9.13.2025.12.31.06.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:35:40 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] Input: cros_ec_keyb: add function key support
Date: Wed, 31 Dec 2025 14:35:36 +0000
Message-ID: <20251231143538.37483-1-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, v3 of the cros-ec-keyb fn key support, just few tweaks from the
reviews.

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

Fabio Baltieri (2):
  dt-bindings: google,cros-ec-keyb: add has-fn-map prop
  Input: cros_ec_keyb - add function key support

 .../bindings/input/google,cros-ec-keyb.yaml   |   8 ++
 drivers/input/keyboard/cros_ec_keyb.c         | 136 +++++++++++++++---
 2 files changed, 128 insertions(+), 16 deletions(-)

-- 
2.52.0.351.gbe84eed79e-goog


