Return-Path: <linux-input+bounces-3495-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A978BD2AB
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 18:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E051C22422
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 16:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E74015625A;
	Mon,  6 May 2024 16:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="8dl2nYqh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B6315575A;
	Mon,  6 May 2024 16:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012648; cv=none; b=bfs/PVotmstY/6gqjLACvKkpj67UjQBBHm1FHM5Sv1i/za97neBdR0rInwSqQ+N9rau60Cls0OMAuTi0EnreZ4Hq41+EP7peYNYpKcIzAkMBSpxkTB5uUqH8cRBTX5A9xJAEYBpvvnpqYt+7d6ilofPb8VyzSurbWDlpCqzuLKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012648; c=relaxed/simple;
	bh=eFOl7PcsP3agx3qzdhbJJDR4zXY2SAfO3NMK3tEzZdQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=ILWERfYgvP0RpR4ZJOi+qohDJ6hk/Pww6ThJnorKqfGVTH5oPjkp2AokfWmzwWHSooLb9eoDvJSdWvQuy5kcQFZLc8f71nj+h8IvmfXQGCpvy6dLuO/VyWoa7DHL+OyVJCV0jk7kaWqYsSFDjMEhynOXb2MMyyzrqUlIxmU2zo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=8dl2nYqh; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418E-005r2Z-0a;
	Mon, 06 May 2024 18:24:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=utpz7iYXHktEzXWIgy4GD/ao0gKYmCpXe/gyJxy70Cg=; b=8dl2nYqhhIpZL8gCgRAbh94PuJ
	ypYzLpxAKlKVb/qg4a+PGlxPZX22Fc/FqM884Q2+OSHNdUOWAzbGwvN9XzFNVJ7OfXkZySbcqiVMJ
	TkeadAI83mGlg9kZYESsZ3j4Z2E7+J/IAr4/XtTnFHlQYPiV3wmVrYgu2LNZumgKWEOi8IkJFocBO
	hSitiurFdmJgONlY8bJ2s75yMopwBlYd0rJ+Ee79nsVD24cVsEGSugjq3KJFpXw/8iDaNhQIBmAkQ
	cJlL4su9uq9FyvpVoOW5gVlvVNX2OWwMV2aBfax4ATTusMiWvDF82yLJ2kpewQx7YRvoOfv6q3rCI
	0w4mwh6Q==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418D-000fJY-1S;
	Mon, 06 May 2024 18:24:02 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1s418E-003pVA-1K;
	Mon, 06 May 2024 18:24:02 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andreas@kemnade.info,
	hdegoede@redhat.com,
	andy.shevchenko@gmail.com,
	u.kleine-koenig@pengutronix.de,
	siebren.vroegindeweij@hotmail.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Input: Add ektf2232 support
Date: Mon,  6 May 2024 18:23:47 +0200
Message-Id: <20240506162350.912950-1-andreas@kemnade.info>
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

Changes in v3:
- use dev_err_probe
- use i2c_get_match_data

Changes in v2:
- separate patch for adding compatible
- use match data for selecting status shift

Andreas Kemnade (3):
  dt-bindings: touchscreen: convert elan,ektf2127 to json-schema
  dt-bindings: touchscreen: elan,ektf2127: Add EKTF2232
  Input: ektf2127 - add ektf2232 support

 .../bindings/input/touchscreen/ektf2127.txt   | 25 --------
 .../input/touchscreen/elan,ektf2127.yaml      | 58 +++++++++++++++++++
 drivers/input/touchscreen/ektf2127.c          | 36 ++++++++++--
 3 files changed, 88 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ektf2127.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/elan,ektf2127.yaml

-- 
2.39.2


