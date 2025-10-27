Return-Path: <linux-input+bounces-15743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 980C5C0F656
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 17:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1DFAF34F8AD
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 16:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAFA313263;
	Mon, 27 Oct 2025 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="kFxbWRJb"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB2311C32;
	Mon, 27 Oct 2025 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583344; cv=none; b=aVkMJlap10d2kfZHeAdaPEsE1B3nQtiFbJCKhbYPxKRQ2KYSnTw1avx0p9zkA0LbH1J5zW3IsL/fHd3DKyPN3F0+nm0pC17efoXtHOuddgOUhXyY2yT0WYukOx0msS0Lr/ilXW0re5mw9NSEJam86xo7UMU55T0LBz9rFrsh6Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583344; c=relaxed/simple;
	bh=SsHdZ25xCvtFBqedql5pR7f928ab+bzGC8496+VFiYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/nUWf7WcbM1OzVOey8WujnWTydNXorxz53Sb0Gjjx1nIwNf31gijXEijoOmKXSmOS01mQK/2c80ntNyjA3G2I9JxlEAN8p7lg/rd5WCK/wlRxwpapk6NWyBFP2nfQib+fTr0JmTJPfjFUb9pNQqXc53wnZ1DLry9E36DWSVoX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=kFxbWRJb; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1761583340; x=1762188140; i=hendrik-noack@gmx.de;
	bh=C3ct9384JvzpeFOW0JMSzQYjvWTxzKv6eLhEAKeWWYM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kFxbWRJbQgR7M48TVnrudXJBGIOL3MBNR23yTfjS+2mIhCcD+pvcB6qz9VK+T8e6
	 py9EY7Tr2H7VuwRttQR/PzCeK0db0BELQNeXa4jF1edjjNx9ZDhVtj8GBDPexPC+5
	 oSyJjVuuOyuFcuu9Q+kNQCnvw6dyi9spMIW+AQl1UNVW5YcHb6nzZtEpktMhgqEG0
	 TrWj3a05jQGZKgGGSxO1JqF8YuwYL2ysbgsJygeYTavYsj6THKR07TWK1cpkRyrTg
	 GG8ZSAWDPSEGzMILZ/DQegc3S3/HS7PI7FVIAd44v7hdE+fQ+skJtsPUNHYigw7ks
	 0ZHLzTfd8LVG3CTuZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from Hendrik-Linux ([217.85.39.201]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McpNy-1udXVx31lq-00bL5O; Mon, 27
 Oct 2025 17:42:19 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Add support for Wacom W9000-series penabled touchscreens
Date: Mon, 27 Oct 2025 17:36:59 +0100
Message-ID: <20251027164050.113623-1-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iW/V621wLGB//froWQUVpqYUexPaqC6GZSTklH0TmXqITIXDQkj
 hwsXhrZGjtbJjLABVJVpDRr39IMn3fnbmSCIEvLLmyTS30Nrk06p1TYoDKwveP2S05+segZ
 EbdtpGAOf9MBYxqGaDrDAtSMehQkuSGtvOPnnNS8Y6oTEBajJWtHXLRENUrJWqthEoE/NLa
 6aahuuLOdVELjS2Bnggjw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:un/QzTzQFGI=;e7XuMIpUa5msnfz0EAvCghWqYgR
 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
 OBKrA==

Add devicetree bindings and a driver for the Wacom W9000-series penabled
touchscreens.

The driver currently only contains the information for the W9007A, which I
tested on my devices. It should also work with other chips, such as W9001 =
or
W9010. However, I couldn't test it on these and the message length would
need to be added.

Note: This is my first driver I have ever worked on so if there is
anything I can do to improve it please let me know!

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
=2D--
Hendrik Noack (2):
  dt-bindings: Input: Add Wacom W9000-series penabled touchscreens
  Input: Add support for Wacom W9000-series penabled touchscreens

 .../input/touchscreen/wacom,w9000-series.yaml |  79 +++
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/wacom_w9000.c       | 525 ++++++++++++++++++
 4 files changed, 617 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wa=
com,w9000-series.yaml
 create mode 100644 drivers/input/touchscreen/wacom_w9000.c

=2D-=20
2.43.0


