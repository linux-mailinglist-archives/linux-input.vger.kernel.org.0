Return-Path: <linux-input+bounces-12129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D072AA7F92
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 11:08:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB6711B658D5
	for <lists+linux-input@lfdr.de>; Sat,  3 May 2025 09:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DCD1CEAA3;
	Sat,  3 May 2025 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cVcvYxtR"
X-Original-To: linux-input@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25076374F1;
	Sat,  3 May 2025 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746263333; cv=none; b=UrpZAGls3+ZaI1MgYsJ6QyNui3Xd6AVgGOzNdN3WVhb84OXJZG/sq8Euqby6Yyc/GaM+pTDeedli+lpUQ1lZhQbF4ynn2p2QOc4417IfK9VR/zvj5wEcfFjxG6sRv7lpJANEAOoRyb++LaF/3M8NKKpDkqVucaAAG/RKya6wAVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746263333; c=relaxed/simple;
	bh=wMxHVRVgFbTIQhrecFqp94HX3M4QeBu5lTzrxZwQSUM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cvUo1WaSQlGsQAKCGvqTRyKaRpxRqqqMu+8XaV2vgArUbHO3NOeseuMw2aiTZScds8KeQV5R1d3BOn/Tgo5CkS3ws0j+ZS4lWOeKSCt0oc9uUk1JIniPm/Ynm1vwP7ybQmvKC+sJPS0UgcgIfctcDTWYxWsCpgaW9j8rIIKiLnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cVcvYxtR; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 19A0F25D47;
	Sat,  3 May 2025 11:08:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5SZ0WT7lUvW; Sat,  3 May 2025 11:08:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1746263326; bh=wMxHVRVgFbTIQhrecFqp94HX3M4QeBu5lTzrxZwQSUM=;
	h=From:Subject:Date:To:Cc;
	b=cVcvYxtRlSYaGRROHM9HE7uQBFF8Wfy8Um79hYpNBsHGSqa5HM/qagibRrAX+REmE
	 mOZRFZX0CxLZJG8lQKuwXPq+JKyaO4v/joAeQYWnQXMnAqvJnaXdgthTp818s+LTIf
	 0ZF6dUehV9cmwJQM1DY2TDF1dEj27s3DEBpghx1gejtXyCMauxis9rFElAfxq7NCUw
	 IQN4XEsRzOUVUA/TFnrxWQ7l2dH5NZvZSM6uS3MkPfyyqfWZTv3DCichbq1EENQhSL
	 as02Zy8hn1visrhqAmsk53waO/pE4ER51a+Bg9+E/2ZCG4N5tOdW/vwbmSEy8barIK
	 ZeJv5DmNH45Qw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH RFC 0/4] Support for MELFAS MIP4 touchkey devices
Date: Sat, 03 May 2025 14:38:26 +0530
Message-Id: <20250503-mip4-touchkey-v1-0-b483cda29a5b@disroot.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAArdFWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwND3dzMAhPdkvzS5Izs1EpdM7NEQ0NjIyOzpORUJaCegqLUtMwKsHn
 RSkFuzkqxtbUAvsQEB2QAAAA=
X-Change-ID: 20250501-mip4-touchkey-66a113226bce
To: Sangwon Jee <jeesw@melfas.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746263323; l=1369;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=wMxHVRVgFbTIQhrecFqp94HX3M4QeBu5lTzrxZwQSUM=;
 b=lEmBgsGDqJD7p2ok4ZO0G9blk2vNLqO9DbxTZvUD447FY2n+wo1B1Q+nbgH7aQSEpYbG4ywo4
 7sanHRYgzShC6cehOTwCwk3iio7f0Tu/UBMhi8sLnqJkwscxrUEHNKk
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
dtschema is 'melfas,mip4_ts', which implies that it's a MIP4 touchscreen
by MELFAS.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (4):
      dt-bindings: input: melfas-mip4: document linux,keycodes property
      Input: melfas-mip4 - add support for touchkey input events
      Input: melfas-mip4 - initialize touch events only if the device is a touchscreen
      Input: melfas-mip4 - add support for event formats 4 and 9

 .../bindings/input/touchscreen/melfas_mip4.txt     |  2 +
 drivers/input/touchscreen/melfas_mip4.c            | 98 ++++++++++++++++------
 2 files changed, 74 insertions(+), 26 deletions(-)
---
base-commit: 3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
change-id: 20250501-mip4-touchkey-66a113226bce

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


