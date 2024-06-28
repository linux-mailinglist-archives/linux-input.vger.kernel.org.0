Return-Path: <linux-input+bounces-4694-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3927491BA28
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 10:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9266AB24243
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 08:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF6C150997;
	Fri, 28 Jun 2024 08:36:07 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8E214D719
	for <linux-input@vger.kernel.org>; Fri, 28 Jun 2024 08:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563767; cv=none; b=BTbHBT/fnMlD1KtjFmv1fCfoT1qmeB/qhtGlZHLRh9aN9s1W1e0i2xPlivQhGapx96LVDc6T4Lwu8wUnetqezNFCQ/v3g4e331AEGHnJiMr3bHeXdnpEtV82/3v0hgmeZK+z9KdwmqSSYU5RzFVTyPhi5b2lFhPRTXg6QtZfGBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563767; c=relaxed/simple;
	bh=1S0u1GGcU4Iih3nBffGu0cDJuMprk04uG036ikLgtCo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=goS/9gW+AfQoATONAJMwxcaPvS+lej0F93DKRe4QobhaTUGiclnzZxnPH+EcIkosm7BFEVowTTqonyn+NHorokZFcS6wU/ankFbWd4iwhJzbl4PCkKCKCDbk3l+M4ZkCFx3RDZzh/wJOB6jQfQiz64S4ja6+q5XxsjaZEMJaO0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sN75J-00079Y-DT; Fri, 28 Jun 2024 10:35:57 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 0/2] Input: exc3000 - EXC81W32 controller support
Date: Fri, 28 Jun 2024 10:35:50 +0200
Message-Id: <20240628-input-exc3000-exc81w32-v2-0-c2b21a369c05@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOZ1fmYC/4WNQQ6DIBREr2L+ujSA1tKueo/GBcpH/wYIqLUx3
 L3oBZpZTN4kM7NDwkiY4FntEHGlRN4VkJcKhkm7ERmZwiC5bHgrW0YuLDPDbag554cr8aklu6m
 iXjf6oSyUcohoaTuH313hidLs4/f8WcWR/p1cBRNMD400da/u2tpXQDcuc/SOtqtB6HLOPx7ng
 WnBAAAA
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.14-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

EXC81W32 controllers use the same protocol and have the same resolution
as the EXC80 controllers. They can be supported by the exc3000 driver
with minimal changes.

Their featureset may differ, though. Looking at the messages, it appears
the EXC81 also supports touch pressure or area measurement, for example.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes in v2:
- split device tree binding compatible update out of the driver patch
- Link to v1: https://lore.kernel.org/r/20240626-input-exc3000-exc81w32-v1-1-ac42d3b87aff@pengutronix.de

---
Philipp Zabel (2):
      dt-bindings: input: touchscreen: exc3000: add EXC81W32
      Input: exc3000 - add EXC81W32 support

 .../devicetree/bindings/input/touchscreen/eeti,exc3000.yaml        | 1 +
 drivers/input/touchscreen/exc3000.c                                | 7 +++++++
 2 files changed, 8 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240626-input-exc3000-exc81w32-58585ba4a98f

Best regards,
-- 
Philipp Zabel <p.zabel@pengutronix.de>


