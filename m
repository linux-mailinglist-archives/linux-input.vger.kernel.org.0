Return-Path: <linux-input+bounces-5309-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F33946C04
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 05:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B09E2281CDC
	for <lists+linux-input@lfdr.de>; Sun,  4 Aug 2024 03:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1693D76;
	Sun,  4 Aug 2024 03:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="Ust8GNk+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A196FC5;
	Sun,  4 Aug 2024 03:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722741526; cv=none; b=id/jV54hnFyL88137Alhc1Ur9Zpnj1H8hSj3arxG9kGORZAbfQ+AvDgaoiWcUnPiqiV/zsDp03SOM2Fk27My4vGCUiiIKdIQ7u+5hqDsfpYV8Hh2+jTBKx2dCVVjAuPNOnJNsSJVnmtGme5vhA6+nk2FoBpJFz2QRXkmZa24YlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722741526; c=relaxed/simple;
	bh=hJkjnewQOl8E/GTTWHwVQ4J9dpDcHIQ6PauVMJiZSMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r3JUOVEnAdCqtNJU5iJbSGp2AZ7F+/EPPBMU8ZDU5+5sszVio67ApHc8//rgAXvbszIQGWglvW5bIdXWdgj7MHZ9YdAuIbBmJSJimDzVEoDDdELu+O6oh253aDIkThgmNfD7R/qOObe3NimaNicUAgsENw7F/YRw0/nq9xsqCGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=Ust8GNk+; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1E1CC005F;
	Sat,  3 Aug 2024 23:13:36 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1722741217; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=YMqQuPXvEyz+0BAsk1nZKMemLLbC8pw/xGoIr6BVOpM=;
	b=Ust8GNk+22BvMGVsg8LLUNQxCVPiWzRlYcUhVoflhzyLnVVP6rjfKXd0tZaX+OFPKyUclw
	zRNZ5qizATiah9xB90h6oMj3rZVLsMzCViYu8Aj/SxZ3gUBJL9MIxBqvkTFQD8oaVDn1OU
	do3NiwqaIVOCWsMgDySpimA0IMo9uo8=
From: Felix Kaechele <felix@kaechele.ca>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Input: edt-ft5x06 - add support for FocalTech FT8201
Date: Sat,  3 Aug 2024 23:13:08 -0400
Message-ID: <20240804031310.331871-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The driver supports the FT8201 chip as well. It registers up to 10 touch
points.

Tested on: Lenovo ThinkSmart View (CD-18781Y), LCM: BOE TV080WXM-LL4

Felix Kaechele (2):
  dt-bindings: input: touchscreen: edt-ft5x06: Document FT8201 support
  Input: edt-ft5x06 - add support for FocalTech FT8201

 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml   | 1 +
 drivers/input/touchscreen/edt-ft5x06.c                      | 6 ++++++
 2 files changed, 7 insertions(+)


base-commit: 8bd2aa8529aca1f39bc2bfac4f68adc47c6bd1d7
-- 
2.45.2


