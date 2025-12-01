Return-Path: <linux-input+bounces-16427-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8219C97BE2
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 14:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3790B3447A5
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 13:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656A9314A90;
	Mon,  1 Dec 2025 13:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="Pb1Pysdx"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB25D72622;
	Mon,  1 Dec 2025 13:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597412; cv=none; b=Dd6okdF4Ft5cP807zNl60wv53bhS3m6bu1IUz+Rzu9xBEJoLuN/4koaevfkG1/kxuda74G/N8eHVijuPeT5UvETqs383u8+REk6EroDf/55p9eflYsba8fXw753m/71BIr1bPB1nFkzSubY7sqHsmrV4GgwnqWsW7xVDcBqQYMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597412; c=relaxed/simple;
	bh=Zx3ztaPlQBBCu668OGugNYAbGylE2FXMWyD0mHhbNvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hAnYgMuLKFYlN5KzZdzpIt/9OLWrQUp9SnJC+IzM9VLOaTFRCaE2+XQjI2v1t0Qv8ub7Y+aFU0h2/KePnojr4BeenC6DJ+KjQtaTVmbFUPbo04F1S+uqaEK7t3wfVbYulidFWwriIZTf7gf5XcPOsm2VsVBMpNowAPeq68qIVDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=Pb1Pysdx; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764597408; x=1765202208; i=hendrik-noack@gmx.de;
	bh=Elx/oLyBBzioz+fKcLTnmxbV0qVUkCZTVU8zfU8d7bo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Pb1PysdxFb2Ith+uHNN+MWbgCALpZh0SfJu9iPwAosGZZ+t3MWW9KkKWDsWHmo24
	 nb3IV2v8vWA/5anbgedsVruDWV/SGqGl+CzsRddIm/OsmqJk6+G1Mrwa1Hx79AngE
	 5WeYWnBtTZPG+oeYyDMn2jHHKGuJpavvcnnoBw1KJl7GMVqGh4PEsMpp6A3iOYCgj
	 KcH4cSl8/NMCQRHxxR5bnQO2Tdh9CU3jSd+YpHqQMmdFZbRZS/bg0+Yq5QPlHhjbF
	 yjp91x/ij1HtGN/o4Q2ykqGVcrLwJwu+xfRdTY72nbrU8ORC6LB6jlUWBpip5vAkw
	 ayedCf+T7BZYjdF+mQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from Hendrik-Linux ([217.85.36.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6dy-1w0kNt2y34-00hR2D; Mon, 01
 Dec 2025 14:56:47 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for Wacom W9000-series penabled touchscreens
Date: Mon,  1 Dec 2025 14:31:12 +0100
Message-ID: <20251201135552.93540-1-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k/dVtS1S3Hn825twvdb6SDgLLXIhRKFGl5FU7l9CINCT0EQDuYq
 JMNyvpbQwOucia0uP+wYcL9737XLSvQ7aZVqD9rv9EJeOsRV87ugvkeRPIcyDGckM2/dlL6
 BXQHNoKDaxjuhVKPNuPZ/OzniLYoxLWJxCPmhVOtSitpbw6tqW/4YmBgYTtFjyjE8sRQhDH
 w0Wl81w1KP+QH3rSZ4qpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+ikRAdS7l5Y=;DmPEhhf215XKkvPprrQGuEA74VB
 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
 rQURcPSA=

Add devicetree bindings and a driver for the Wacom W9000-series penabled
touchscreens.

The driver currently only contains the information for the W9007A, which I
tested on my devices. It should also work with other chips, such as W9001 =
or
W9010. However, I couldn't test it on these and the message length would
need to be added.

The pen-inserted-gpios is used to get if the pen is inserted in the device
or not. It's also used as an interrupt so that the power state of the chip
itself can be controlled depending on a change of the insertion state of
the pen.

Note: This is my first driver I have ever worked on so if there is
anything I can do to improve it please let me know!

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
=2D--
Changes in v2:
- remove pdct-gpios, as it's unnecessary
- fix devicetree example
- adopt to kernel coding style

=2D--
Hendrik Noack (2):
  dt-bindings: Input: Add Wacom W9000-series penabled touchscreens
  Input: Add support for Wacom W9000-series penabled touchscreens

 .../input/touchscreen/wacom,w9007a-lt03.yaml  |  79 +++
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/wacom_w9000.c       | 479 ++++++++++++++++++
 4 files changed, 571 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wa=
com,w9007a-lt03.yaml
 create mode 100644 drivers/input/touchscreen/wacom_w9000.c

=2D-=20
2.43.0


