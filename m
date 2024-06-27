Return-Path: <linux-input+bounces-4684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C9791B2FB
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 01:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D01A8283620
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2024 23:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1BB1A2FD0;
	Thu, 27 Jun 2024 23:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ANg6MnLv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383C01A2FCF
	for <linux-input@vger.kernel.org>; Thu, 27 Jun 2024 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719532427; cv=none; b=jom5eRURs6Gk84K250Bgc9DvZjQgMo2qPTvaUxLiddIkUNUg6hKzHwCs/6MlbL3oc4K1iliQVB+KrsliPgnvRTTxlGXR+S4bMWEx7DsLd9raRh3mYpvgQ68ITV0dFbpohsI3aBVRtrXB883VgfcAWmnwmBbDuW84VTLtsHRG4m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719532427; c=relaxed/simple;
	bh=8TDzL4LG+A2ddCLi6fgg9V+G2E1PrISrQcbK/zNYedM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lpVT6hiRq+kefA2cTDJpDADvaHp498sa7UrJUcxFM8tBsYZp76rdQ49mGjm9yP6lDCOZ01uz9RrkusllmhBLQg9FHp2BsyR20+z+EFE0zHXIM50pQPXE3xebHd2WJHrmIrLU3385VCfB5QGUiw74a8Kjgy16V4hkgl+qttzAyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ANg6MnLv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fa07e4f44eso8055ad.2
        for <linux-input@vger.kernel.org>; Thu, 27 Jun 2024 16:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719532424; x=1720137224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GvgNRfUrYC3vDPSHgELOXCgco+1ty8Hri5LXWyU0EuU=;
        b=ANg6MnLv9Nt+cvvg85p7tHx6wWPzblkE5JkOrwBtxxh7KZzqH0/h8E0lN1BGqnCYSv
         hbsR3B9eeSWxC10BuGLA32B0N63v3ewnnBwazfYnhz0mKDgcGBTqV6ovY5uj3oK0U9GB
         TUFDgcSof5vgtRJuvtX2ZO1bqUvbbbQ3xUMmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719532424; x=1720137224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GvgNRfUrYC3vDPSHgELOXCgco+1ty8Hri5LXWyU0EuU=;
        b=C23we0h5iNV2sqibg/qFMVEnWH1jRict5kH+XhomgvMGznqVcz/ZG9BRFdw9bXf29Q
         DJkMITo48P8P9bUnnC2wSvfLsCg17/B7WuX2lIws3FuZczLvJD4FQSykiQtnw/iwnYQH
         oeObsF8+zZSnL4ucx2PEGXBYULOGBloLNk30y/F92zyU9OlqL/Wyz5JqUMiftQPBIOgb
         LBo4fXnHIakvkCacZWih/uGst/nMBy39ke9ZR7NuzSRBk8BgIbn4SVH92A9ZE1Ouq0py
         dFb7ZpOY/G/wYyBT0xJAZoi5LTkhXabq1vJKOg42xbp6NrP6wURSE8ITigIPHMwpo/6r
         NV4g==
X-Forwarded-Encrypted: i=1; AJvYcCWWY8wzC3JVOlhfhIF0VmEMcZm3FVkEsAkP4cztYiXZjXmL1Zu37gdZk31j/GQQwSsFuicORCpNTexoJEmGRNr/cjrSryl8wlkx8xw=
X-Gm-Message-State: AOJu0Ywz4fp1tsVSjcQ72i2OAyTJsMjqOnqVpLJKY5xLwat+ysLbvANP
	8JW+FaOO1VD3ZMbnaDqbIXUkhplyF8le8voK6Ru6z4ZZbWaHTlfhBQnmRBj2cFDqUEF4UhhyNkA
	=
X-Google-Smtp-Source: AGHT+IFTGJHi0WhKn1jfdIqcqfPQxr8jYnm7Tq2RVmaHgug3fRpbKxlPiPDM9y6uifF4i205XhWnMg==
X-Received: by 2002:a17:902:ea08:b0:1f6:5013:7842 with SMTP id d9443c01a7336-1fa23cd95edmr158375265ad.27.1719532424505;
        Thu, 27 Jun 2024 16:53:44 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:cf5d:cb26:248e:ee00])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac11d8cd2sm3366595ad.107.2024.06.27.16.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 16:53:44 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Gwendal Grignou <gwendal@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 0/2] Consolidate ec_response_get_next_event
Date: Thu, 27 Jun 2024 16:53:06 -0700
Message-ID: <cover.1719531519.git.dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Changes in v5:
 - Merged changes in cros_ec_commands.h and cros_ec_proto.c

Changes in v4:
 - Change subject line: ARM:... to dt-bindings:...
 - Add description about keyboard matrix v3.0.
 - Add cover letter.

---
Changes in v3:
 - Remove CROS_KBD_V30 in Kconfig and macros conditionally set in
   cros-ec-keyboard.dtsi.

---
Changes in v2:
 - Separate cros_ec_commands.h from cros_ec_proto.{c.h}.
 - Remove Change-Id, TEST=, BUG= lines.

---
Daisuke Nojiri (2):
  cros_ec_proto: Consolidate ec_response_get_next_event
  dt-bindings: cros-ec-keyboard: Add keyboard matrix v3.0

 drivers/platform/chrome/cros_ec_proto.c       |  16 +--
 include/dt-bindings/input/cros-ec-keyboard.h  | 104 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  34 +-----
 include/linux/platform_data/cros_ec_proto.h   |   2 +-
 4 files changed, 114 insertions(+), 42 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


