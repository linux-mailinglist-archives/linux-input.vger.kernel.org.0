Return-Path: <linux-input+bounces-12853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA85AD7B2D
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 21:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7934A162A81
	for <lists+linux-input@lfdr.de>; Thu, 12 Jun 2025 19:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 340162D3237;
	Thu, 12 Jun 2025 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="iwuWdcMO"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A376C2D29AA;
	Thu, 12 Jun 2025 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749757310; cv=none; b=M0kHCfJbqDG5N8cCOJHKo7qpF1tTJrrQkpzEd9uPUi3EU2jzcu3NfBX0YdbIlfAd3RUPDlsvkORKw61HzEvsQVeGTb4rE/4lOJLj7EbWvjGAAIm+tuwZ5Em1Xnkim9CXWvIJcFrqlWvpUHNY4crwc1C/H+BQoXmU8+TKG5SvZWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749757310; c=relaxed/simple;
	bh=OJM7JNWlTUzf1xUxJgwu57MELGGCUiSw++88Cp+n4Gw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eCkHOh010LXFkOKcTo2xdiLqQw885CqplmK93IMCztXAhqj8u8xi8kibBKokbTHes4yJfgH2F0oZ6XMT3GTLQr9WFILBIMXoMKPKq6pW9tq6Xn6kKl0rNcAmiEsLxWJyhsQbX3jt1xeuC+qyTe+deq7PM0qUAQLS3DnUTD0GVwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=iwuWdcMO; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id C131B2599D;
	Thu, 12 Jun 2025 21:41:45 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyVDj1AS3vIG; Thu, 12 Jun 2025 21:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749757304; bh=OJM7JNWlTUzf1xUxJgwu57MELGGCUiSw++88Cp+n4Gw=;
	h=From:Subject:Date:To:Cc;
	b=iwuWdcMOvfU7rdtZeeCy3R0DC3iTqUl2HRPHj6hikA0SJar+bwgI1Lo45hID+MbdT
	 kyU2+gZ2A0Hya7dwJp09giC+spUmX3awyhq+IkpGyiSyXMBOhvWJvSnU0xOZ+aK9gs
	 dWCFnk2oDS6Kx+ijOhnF6HAs7eBjOZ3nmS7+lQAK1L6OoJlCtF1wBIpiy9B9AdUoYt
	 WgbLiHVTUIbtwXGujmNX8PfaAKrlJMyAhQqpnlIhfSY2n0HUsgVPU+c6cbEKBB/A3U
	 RWvuk/yAc5p1O+2+DD8Mj+6Tz7jwvBuH5na7Jbmfy3Cn/7UtuUtEGvYckZW+hNxz03
	 B3AqqFgVtu2YA==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH RFC v2 0/5] Support for MELFAS MIP4 touchkey devices
Date: Fri, 13 Jun 2025 01:11:32 +0530
Message-Id: <20250613-mip4-touchkey-v2-0-9bbbe14c016d@disroot.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGwtS2gC/12NywrCMBREf6XctZEkbYO6EgQ/wK10kce1uYhNS
 WKxlP67obhyeWaYMwskjIQJTtUCESdKFIYCcleB9XrokZErDJLLlrdcsBeNDcvhbf0TZ6aUFqK
 WUhmLUDZjxAd9Nt8dbtcLdCX0lHKI8/Yxia366eo/3SQYZ6Y51NZpedStOTtKMYS8D7GHbl3XL
 zcLURCxAAAA
X-Change-ID: 20250501-mip4-touchkey-66a113226bce
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749757299; l=1675;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=OJM7JNWlTUzf1xUxJgwu57MELGGCUiSw++88Cp+n4Gw=;
 b=d7WreWmeW/saH9fpvmprvbmg+mjO6+8g1MS0tx1rK4zMrOQ/ffuG1vQwK7RBf39K2nnQw6FW1
 5V0jklDIjbWDCsVyM5PJueJgJ5Jfw2UsKeoxnaIDfnkH77htAeQfJ5N
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

MIP4 is a protocol developed and used by MELFAS in its touchscreen and
touchkey devices. The MIP4 touchscreen driver acknowledges the
touchscreen capabilities, but touchkeys are left unimplemented.

Apart from touchscreen + touchkey devices, the protocol is also used by
devices which are, functionally, touchkey devices. Thus, the driver
should also be compatible with those devices. This series aims to
introduce such required changes.

RFC: How should the compatible string be handled? The string defined in
dtschema is 'melfas,mip4_ts', which implies that it's a MIP4 *touchscreen*
by MELFAS.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v2:
- rewrite MIP4 documentation in dtschema (robh)
- Link to v1: https://lore.kernel.org/r/20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org

---
Kaustabh Chakraborty (5):
      dt-bindings: input: melfas-mip4: convert to dtschema
      dt-bindings: input: melfas-mip4: document linux,keycodes property
      Input: melfas-mip4 - add support for touchkey input events
      Input: melfas-mip4 - initialize touch events only if the device is a touchscreen
      Input: melfas-mip4 - add support for event formats 4 and 9

 .../bindings/input/touchscreen/melfas,mip4_ts.yaml | 61 ++++++++++++++
 .../bindings/input/touchscreen/melfas_mip4.txt     | 20 -----
 drivers/input/touchscreen/melfas_mip4.c            | 98 ++++++++++++++++------
 3 files changed, 133 insertions(+), 46 deletions(-)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250501-mip4-touchkey-66a113226bce

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


