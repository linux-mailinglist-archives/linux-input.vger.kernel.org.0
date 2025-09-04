Return-Path: <linux-input+bounces-14496-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBB2B446CB
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 21:57:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A0C7A06519
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 19:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A5027780E;
	Thu,  4 Sep 2025 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PgFHKxgk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="IsHrLgJ5"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C6B1BD035;
	Thu,  4 Sep 2025 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015868; cv=none; b=tKKSoo72eOAh6p18azmc9JsaA9cNhFDGFV5PZ3PCJ3ySOLxUdMmKH73KmcNfVpRvDD1frS+YOm6YydRsUrElebSpTINsXwAuh7BOB1UjXk+A966h5sXOLlY6uwIouKu7YToE9j9UtDESM7bFXWS05r2/oEXa9kJtTstyNp6PY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015868; c=relaxed/simple;
	bh=n5nrwsjWsKuEqHajZEaLFb/qo1iIyEfFFoVWELct2zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iluGbym3piXy5elQi03brTIg89lNcFjXRiP2uDL3hpGlif/iJMTARW3Fz2wvjS/9N8JR9Rq/jaRT/7fbTbzwlbaveUH+UBoMTHnm3Ccez88kI7MWLRSD8Cue8551sqDmmzg/MODo+hchJ1eA+CHoquzJLbIa2zT50UvZXFGchI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PgFHKxgk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=IsHrLgJ5; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cHqyc52Nyz9skk;
	Thu,  4 Sep 2025 21:57:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757015864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xp//stt9NXgtksT8Wy/exrEd6nmzs3RkU+yIcz8kMtY=;
	b=PgFHKxgkkXT2ksNpcRaml11ZFM365Rq2ux8l1feSo+lIH7nrytPwaOGpWtCB79an4NJpTg
	C7Pnad47SLLvLYU0RP4VWUqT5h8wYjklj/d3+W7xEDgBZySytQQwh0/OILwLEuPezN5moh
	KFvfUFF9qRI/Pv1d/CfIKQWvMG85D3lylN8Ylfe0jCDyXIZt+PbyuKCshMzTyRmws3Wxbi
	GkPRlabIC8myLqU4IpEdS2S/MasRB3m1Z2z+L15FeYfyj0dIgNZmEHopeeQgoXywRD1Ia1
	uTY6GQhrABlukNKbwRGYzt0j3HXdbEIIpad3+5ywYcVvBaz6USG2pga3G6tpXQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=IsHrLgJ5;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757015862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xp//stt9NXgtksT8Wy/exrEd6nmzs3RkU+yIcz8kMtY=;
	b=IsHrLgJ56GTXpG/eEakha6fsVddd1A3/u+2S8G8iiymdEurVwbqXCy6lz/5vkdfPmw2+M/
	c2NklRJYRuqOVaNCSoNA5zCUwV+Xw7+WEhQsWoSfuzAxmMDOKjZDM0fPBFhNy3pmTwVV/x
	ZFQuJOyR8GQ3VdCuqcf4HhLNyg4tT5OoCa1ys+G37n3q+yqbqzy7GquVJlLkreNwKAvNwZ
	xib0ozkRwG9MNpu1svIXCuATq7FeXTbhhUUVN1NsrUb3tOlun1WA7joF31h+5jKYWbFJeR
	obh1X31jMNJiOG5mvfdFd3YGZRIrgBoo32UaomJmABm6gsb+DNVEuHSxqockxA==
To: linux-input@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: input: touchscreen: goodix: Drop 'interrupts' requirement
Date: Thu,  4 Sep 2025 21:57:04 +0200
Message-ID: <20250904195727.168152-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0a9de777aa544b54acd
X-MBO-RS-META: odpy85haxabhfu8ab7pbdqje9t1iu8sd
X-Rspamd-Queue-Id: 4cHqyc52Nyz9skk

Since commit 409fe0cea366 ("Input: goodix - add support for polling mode")
the interrupts property is optional, since at least the Linux kernel driver
supports also polling mode.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
index eb4992f708b70..a96137c6f0635 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
@@ -62,7 +62,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - interrupts
 
 examples:
   - |
-- 
2.50.1


