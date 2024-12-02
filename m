Return-Path: <linux-input+bounces-8349-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F99E0B84
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 20:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08F5016622E
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 19:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE261DE3BF;
	Mon,  2 Dec 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="e0C+EX9+"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8805961FD7;
	Mon,  2 Dec 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733166101; cv=none; b=bGAk6A6yXhO6iAgSuZJg599mjHwMTT6FiT9P/G2+fhY0uthfwt0PDm5+VIrKMhbaoj9Ux/91jfRJFGdh8ofvy2vt+uysf1qSg0djS30JQ41bE+iq36vKZwIBXq9qVxuDPDzDjxG8qVwO294L3tzu6aWJhFZVisPerrMBz/0xeAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733166101; c=relaxed/simple;
	bh=zfxEranPfl00GWlGO/QXt0N31OcDIy9hu3D6j1hm3To=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PfBy1GmZN1jJPGRQL0k19WveMGx9g8fSAmAsRff5NhZLjsbE/Wi75mYxKtWEQzkSrSgP4J0u1QZKDfae6OrWiE7UGSMJH7sHVnhNfvFk+X0/2tqlrAlwNVcmLKaHeQplx4Mw2dvBR4BFKRtUYitr1ULLkuvvpXCMXln8jkYHGEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=e0C+EX9+; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733166097;
	bh=zfxEranPfl00GWlGO/QXt0N31OcDIy9hu3D6j1hm3To=;
	h=From:Subject:Date:To:Cc:From;
	b=e0C+EX9+c7HKOQSdFZDKygVpHJFl35yR9OzgbgPeWkBsnZP7jJQ503wL1qcYt3vX+
	 QoX86a9B57akuOZOP771eFze728JrHXS1DTUgq3TlkmVCxoolOTHNJmJUAdj1YjIRN
	 w6bcDhep1/TBiKcY9In7crr+fBkv1hwk7c8HezBs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 00/10] HID: constify 'struct bin_attribute'
Date: Mon, 02 Dec 2024 20:01:31 +0100
Message-Id: <20241202-sysfs-const-bin_attr-hid-v1-0-16369423a48a@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAsETmcC/x3MTQqAIBBA4avErBtI6Ye6SkSUjjUbC0eikO6et
 PwW7yUQCkwCQ5Eg0MXCh89QZQFmX/xGyDYbdKVrpSuF8ogTNIeXiCv7eYkx4M4Wja57sk3TmbW
 FnJ+BHN//epze9wPZrFLtagAAAA==
X-Change-ID: 20241201-sysfs-const-bin_attr-hid-c249ed557cb6
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Stefan Achatz <erazor_de@users.sourceforge.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733166097; l=1968;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=zfxEranPfl00GWlGO/QXt0N31OcDIy9hu3D6j1hm3To=;
 b=1oyTLgKCkVjsm4s3uFujVV96j4jTA/hsCOArr5y59kl/9IeXwxR2as0guPoSbWYcvETAjThzY
 JxJXn/T+wYtARycK+YsIYAdX/Cv75RnAEue6SnIYhXCboT8Yq5GFSLq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

The usage of read_new/write_new/bin_attrs_new is a transition mechanism
and will be reverted again after the transition is complete.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (10):
      HID: core: use utility macros to define sysfs attributes
      HID: core: constify 'struct bin_attribute'
      HID: roccat: common, konepure, ryos, savu: constify 'struct bin_attribute'
      HID: roccat: arvo: constify 'struct bin_attribute'
      HID: roccat: isku: constify 'struct bin_attribute'
      HID: roccat: kone: constify 'struct bin_attribute'
      HID: roccat: koneplus: constify 'struct bin_attribute'
      HID: roccat: kovaplus: constify 'struct bin_attribute'
      HID: roccat: lua: constify 'struct bin_attribute'
      HID: roccat: pyro: constify 'struct bin_attribute'

 drivers/hid/hid-core.c            | 27 ++++++++-------------
 drivers/hid/hid-roccat-arvo.c     | 20 ++++++++--------
 drivers/hid/hid-roccat-common.h   | 22 ++++++++---------
 drivers/hid/hid-roccat-isku.c     | 22 ++++++++---------
 drivers/hid/hid-roccat-kone.c     | 22 ++++++++---------
 drivers/hid/hid-roccat-koneplus.c | 42 ++++++++++++++++----------------
 drivers/hid/hid-roccat-konepure.c |  4 ++--
 drivers/hid/hid-roccat-kovaplus.c | 38 ++++++++++++++---------------
 drivers/hid/hid-roccat-lua.c      | 10 ++++----
 drivers/hid/hid-roccat-pyra.c     | 50 +++++++++++++++++++--------------------
 drivers/hid/hid-roccat-ryos.c     |  4 ++--
 drivers/hid/hid-roccat-savu.c     |  4 ++--
 12 files changed, 129 insertions(+), 136 deletions(-)
---
base-commit: e70140ba0d2b1a30467d4af6bcfe761327b9ec95
change-id: 20241201-sysfs-const-bin_attr-hid-c249ed557cb6

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


