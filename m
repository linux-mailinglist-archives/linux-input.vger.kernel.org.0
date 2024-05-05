Return-Path: <linux-input+bounces-3462-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FEE8BC404
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 23:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D82631C209B7
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 21:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E90136E03;
	Sun,  5 May 2024 21:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="zKwFO1Hc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F67823D0;
	Sun,  5 May 2024 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714945728; cv=none; b=uPfi2ArUOmuRiANWkj1hM3sWRKuUmhShnf7s9vWoTU9pm4F5UA8ib8SdbcnXtgi9prMpTC+lOQ8GXCcPpzDGgBrAm7APGAKUB5QHcTceELhRpLcVLdbVoPSz0ce4X1hVwl0ksvYfrnUrT3VCZ5GWyS+/wxFW9+ZDEkxihsSfSSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714945728; c=relaxed/simple;
	bh=ftSZBxPvk1GpwtZ2kcuLB/2CMjzvp6SUeCt6guu3Do0=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=rjJDrKpWBL3Rv8EywGFbe9Hr9tv69ZwanAVq/7KN12bwjYbKFDs8ijpXmEDJg+cabusVmG8kWMij8WS0iF9bTXJJjo/FTJBif7IYuUDPrrcZl+woEq5iYLwsTrmKR6tyDWEMvIqAEtxQmCMnNwXuyPxzAep3yiF4KOA3po0oF8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=zKwFO1Hc; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jiq-005kk4-2I;
	Sun, 05 May 2024 23:48:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4A0Qn+DwuT308WfmIsaQKubV/VKtoQ5VwJ8k4+59Dso=; b=zKwFO1HcDZMFspYaCfvnZoWTBa
	6ijuQJNOzDncobQ8FyiSEos1sVOewO8NHxh5+bj3EaMZEKjujrNfgh7je1K8jnNKo8FBIOWzbfWiO
	iYBBYVvMHRwqfaXXdq5iPcdgccoR2A/50fkqIUH1AheRli1PWJ9mpP8Gt3VKCi6OL7YA5FPdWiGN6
	/yf2eYNn2B1NL3CvwDg4I3opZnvG6aVRwM8trGxsPTA4TBHy3wbF3x059tBfN4ZUmPsOSPwkX52KM
	KnqYHR9Ap88LEgFYQvrAvsP6JUzV1rwD+qypVwzd3LoOmde7Lh8iG2FxLWV7qh9d9uqk0hWPuwTXO
	bqix/DGg==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jim-000cc7-0s;
	Sun, 05 May 2024 23:48:37 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s3jim-003jyR-2e;
	Sun, 05 May 2024 23:48:36 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	u.kleine-koenig@pengutronix.de,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Input: Add ektf2232 support
Date: Sun,  5 May 2024 23:47:51 +0200
Message-Id: <20240505214754.891700-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the EKTF2232 to the ektf2127 driver which
contains support for similar chips.

Add the needed compatible to bindings and convert them.

Changes in v2:
- separate patch for adding compatible
- use match data for selecting status shift

Andreas Kemnade (3):
  dt-bindings: touchscreen: convert elan,ektf2127 to json-schema
  dt-bindings: touchscreen: elan,ektf2127: Add EKTF2232
  Input: ektf2127 - add ektf2232 support

 .../bindings/input/touchscreen/ektf2127.txt   | 25 --------
 .../input/touchscreen/elan,ektf2127.yaml      | 58 +++++++++++++++++++
 drivers/input/touchscreen/ektf2127.c          | 41 +++++++++++--
 3 files changed, 93 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml

-- 
2.39.2


