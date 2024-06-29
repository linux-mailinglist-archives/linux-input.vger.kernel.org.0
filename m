Return-Path: <linux-input+bounces-4724-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D391CEF5
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 22:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 027561C20C09
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2024 20:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E61513A24B;
	Sat, 29 Jun 2024 20:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YYK4nMoS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3BC12BE91
	for <linux-input@vger.kernel.org>; Sat, 29 Jun 2024 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719691914; cv=none; b=Brjv4tbE0rX0IO/UquuGfqTV/GWrqfmEDpXwtjM/Y+n+oh7BdMNSAypxrhTTFgrTVLpxDl1TH1knWIyhDJec0g9P6PwtOhJml/2CHsVkAk3dQp/dq4Rqf1TgYj4j8jLXFjMmZraBJxmX58sdgEdWWgzmrIPoUR0adB75MxhE6PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719691914; c=relaxed/simple;
	bh=u9U4agHQZz3arjZWc8+RAjrm4Zn3fIFdm40yJ0V+gEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7MbLE+RkgOyZqkQYxbp/qG4BYQ+kLfYLV07Ul5mJ7x5WJWETUsNvIGuNlLOMGLmUgxidu9d7OTK7dDViefpyVyzTOZE8Bgjg+jWlokPQ4m282YiRRTcTtL00MnsBY8lbytVwnseqKMUVO/TwFN14h17wf8rFqXyrWzP3fOf6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YYK4nMoS; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c21f1bb810so870390eaf.3
        for <linux-input@vger.kernel.org>; Sat, 29 Jun 2024 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1719691912; x=1720296712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdgbjN/cTZJIT1mYXthvN3kyWcUGS/sAJ/m/sKyDdu0=;
        b=YYK4nMoSncOes4VDmfWwKN6ESQV+UiApDOVU41aMCoFPosvalaTsMunWlS7w3HTwaV
         Mpy43s2yoSZygTzLBIABkQ/YY7+3b5FcfPncdZcpALuOtfX0qyQsQMDpw36ZLkO/Sqop
         8j27re1/pgW6tvdxz0a86HUyJgYvol0U4NeBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719691912; x=1720296712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdgbjN/cTZJIT1mYXthvN3kyWcUGS/sAJ/m/sKyDdu0=;
        b=PToyY+BMgKkZZPOSiYG9e8pqBUirn63UNsBPeSVaSdPr7QeBzCwL6h870fuDwHaXPB
         ivgTdge7QaDVXe6A6Kd7LgeDewYarxP3ZciKIWk2zupP8L1oToP350xKI6HgG0974Sxx
         lYHKxDea9o4UvzI1jDYrGzrL0gc7AMH67oWSHRxWj49PK/46irfFLhzcDDmL9Zuim2St
         RDxdAbJi4PhePummDjGHxLYDUXC7+8qzg3CL8i5tzG4E/wWl+2k4Y+jdRTx4Ia7a2/ox
         cxnC3IGtcU0nqsNdaHVA9bK9p6h7dDH4BDdpoHcRBIdetaeZBPryNCXk3gpU8mQ1MRku
         EN1g==
X-Forwarded-Encrypted: i=1; AJvYcCXNCuQjUya64waEnkIKiNW8GidhhgAnMmd5pNkUsJ9J4n+hy/B+STHzYswB06XhVRq/Br9SxLoLtMVzPFJqs7uqI1TTnfZMRg+XSIQ=
X-Gm-Message-State: AOJu0YzRvl383eaqhvuCokx4fxadupUUJ8s+9KrCtDvJfNbX6dmfexd+
	7YldkOzMsIIX9Wmet/E6yNoXBMnjAz4s0Rt+HWjLFj78H0kBYMkXc0Zb38tG9Q==
X-Google-Smtp-Source: AGHT+IE4/DvMGIOavH9gdBcHblnF3ArmID6l3D9wIO4XmA6a6lYa/7qYXZO7zaibUCKcBvTBtvBF2g==
X-Received: by 2002:a05:6358:b10e:b0:19b:5c37:3616 with SMTP id e5c5f4694b2df-1a6acc7e15bmr157191555d.13.1719691911692;
        Sat, 29 Jun 2024 13:11:51 -0700 (PDT)
Received: from pc98uv11.mtv.corp.google.com ([2620:15c:9d:2:db78:5dbf:8bdd:601d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce43460sm3750412a91.20.2024.06.29.13.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 13:11:51 -0700 (PDT)
From: Daisuke Nojiri <dnojiri@chromium.org>
To: 
Cc: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Reka Norman <rekanorman@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@google.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v6 0/2] Consolidate ec_response_get_next_event
Date: Sat, 29 Jun 2024 13:11:29 -0700
Message-ID: <cover.1719691604.git.dnojiri@chromium.org>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
Changes in v6:
 - Fix cros_ec_proto_test.c.

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
 drivers/platform/chrome/cros_ec_proto_test.c  |  28 ++---
 include/dt-bindings/input/cros-ec-keyboard.h  | 104 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  34 +-----
 include/linux/platform_data/cros_ec_proto.h   |   2 +-
 5 files changed, 128 insertions(+), 56 deletions(-)

-- 
2.45.2.803.g4e1b14247a-goog


