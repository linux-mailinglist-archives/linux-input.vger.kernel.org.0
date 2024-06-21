Return-Path: <linux-input+bounces-4553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C862691307E
	for <lists+linux-input@lfdr.de>; Sat, 22 Jun 2024 00:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F9FBB27476
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2024 22:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0DC16F835;
	Fri, 21 Jun 2024 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="G4MJ77J/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAA516F282;
	Fri, 21 Jun 2024 22:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719009642; cv=none; b=tQcgC8K+d7Jc0Z4BWXsDry9ZoG2rfVmz7edc+eYlTC1zg4I+c+fEavFSInASA691zSZk94fbDT0xQ3RXgYyK7xg7dqAIXpM/96cg3q/Mm55v815+NgKXZqzOHB805Wxn5yBVCkc+E+hvnJ/ET6wd4h7lxmDz/xnfDGmC1qPwXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719009642; c=relaxed/simple;
	bh=eFOl7PcsP3agx3qzdhbJJDR4zXY2SAfO3NMK3tEzZdQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=jsJu1Peak6hjSWFgJkLT0+Idfy6dkLS0Cn/ctOS0eTupuZJZkDPT6UPWYe+UlxAO05VCxRymoPyp7MWssWq56xAVKqkIR8z2i7sWoqYSj6OJ8D/XIGRz00+rm2Sg1+j32Im6flbYQGL+PJG3Bv/FwKQHcggu7wRoOD3+o2+FLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=G4MJ77J/; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvi-000Utr-3C;
	Sat, 22 Jun 2024 00:40:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=utpz7iYXHktEzXWIgy4GD/ao0gKYmCpXe/gyJxy70Cg=; b=G4MJ77J/2S5l+fJbgJ8ldn4cVi
	ODiG79zUspt+f6hkGB7Wo6sRgl8QCCUQu3HsUPcGKEp//Wjcy1X+4J4/bk4kxxaobMsIUhvWvTnbv
	D7PVk8UfBMbiFW1Imlq6HT6XKVAtA89WdTcxY/iLp+zVLY5bZFA95R9CtGmuYRJLkeDSzYeBUQjMz
	H450bhdl92E8NDRbuzqzSIJ4SO3DZt1Yfsh/Njh+nYjehBEXxixcVGKvG2+pywr1J/4lZgtIXLsj/
	7z0JTtwxCCOrgcmhYR3RqbdvL+JLUuv8vn4EuZBQwD38C642dbvRI6Q945GQLVYIP8lB4SxlVioxZ
	WYcW2yJg==;
Received: from p200300c20737c2001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:c2:737:c200:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvh-003Pl3-08;
	Sat, 22 Jun 2024 00:40:26 +0200
Received: from andi by aktux with local (Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1sKmvh-006nff-30;
	Sat, 22 Jun 2024 00:40:25 +0200
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
Subject: [PATCH RESEND v3 0/3] Input: Add ektf2232 support
Date: Sat, 22 Jun 2024 00:40:19 +0200
Message-Id: <20240621224022.1620897-1-andreas@kemnade.info>
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


