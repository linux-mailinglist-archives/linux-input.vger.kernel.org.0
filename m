Return-Path: <linux-input+bounces-4493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F8891091D
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 816FF1F2153C
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 14:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE2F1AED5D;
	Thu, 20 Jun 2024 14:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="hsIagqz6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38A91AE0BC;
	Thu, 20 Jun 2024 14:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895381; cv=none; b=hePiB/KmoPC3zpjxMQoan16wvvGo2X19RIrHi3SRiqfuzcCPxzcI91lTTWDfFyyvzXPVvwbjl9SCV3nKExltERNZ1DlDqm1Me+WHXD7H/LfUM1N9trAYff4NjvkuEo9pwUERDIcuFD5yJhMAxZs08+bca1jeHkeU+JrUn5v9H24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895381; c=relaxed/simple;
	bh=BpEV79eo6xk9KXuJ3PMnb12OvINVybVtAnOBSCvI/6k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AutrwL3pSY2eNlhZvCA1jZeFhDtFH0eDKlIEPAzgKiZuK2RLIvqbtKOQGAlfbvvqsO3RuVFFEuh+dAvCk2FqQlUWa170SHKHO2sPJ4+yxlMBp/I7kqMTHbM7B3sYIq8L5otqhGPg5W54HHPAiaKBYLdz2JmsEGos2ypAC6WGUMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=hsIagqz6; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 557CCC005F;
	Thu, 20 Jun 2024 10:52:03 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1718895125; h=from:subject:date:message-id:to:mime-version:
	 content-transfer-encoding; bh=RbUp2ReLkv8gW9t5ybofz1VtOsfVeEDuSj6SOVF6e7k=;
	b=hsIagqz6wRdxIBZkmLSqDdevXOJCGY+pn9TkzPGYp6Z00UL2BE3hUWM4kko/9FW2cGLodo
	KTz7sqql7hziNSqgXf/ib+/TfuWDz5+Js/ltgrwATIue8svQBDtOhRMdsfSsbMgZtEp2XX
	n0BwPl2PuwKmSX6ncfyaWT27akPtEFw=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] himax_hx83112b: add support for HX83100A
Date: Thu, 20 Jun 2024 10:50:01 -0400
Message-ID: <20240620145019.156187-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Original discussion around v2 here: https://lore.kernel.org/all/20240511121245.109644-1-felix@kaechele.ca/

Changes from v2:
- reworded dt-bindings commit message to specifiy how the HX83100A is different
  from other chips in this series to justify having its own compatible string
- added Acked-By from Conor that was given in the v2 thread to commit message

I've done some more testing in the meantime and haven't found any issues.
I haven't heard back from anyone with an HX83112B, but the HX83100A works as
intended with these changes and I assume the HX83112B will too.

Thanks,
Felix

Felix Kaechele (5):
  dt-bindings: input: touchscreen: himax,hx83112b: add HX83100A
  input: himax_hx83112b: use more descriptive register defines
  input: himax_hx83112b: implement MCU register reading
  input: himax_hx83112b: add himax_chip struct for multi-chip support
  input: himax_hx83112b: add support for HX83100A

 .../input/touchscreen/himax,hx83112b.yaml     |   1 +
 drivers/input/touchscreen/himax_hx83112b.c    | 135 ++++++++++++++----
 2 files changed, 110 insertions(+), 26 deletions(-)


base-commit: 9b9247397e2e20016031e59f76dae563b79b6ee2
-- 
2.45.2


