Return-Path: <linux-input+bounces-5303-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7799469AF
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 14:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F9931C20BA2
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 12:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B34F14F9F1;
	Sat,  3 Aug 2024 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="eHNqszlJ"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57341D53B;
	Sat,  3 Aug 2024 12:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722688480; cv=none; b=n816nOFhtxHN4Nw7WF1wWJovC76Pxxf7w6AkQzryw+0hUu7Wr2UGpZzxGLdHZTds/Oni4Z/AD/eQxXJb5Q315EgVmnLjTrpvolM5C5lLjGXRn8w7gqfCwac3TCO5owmRx98JTS8UKIp4CUGen8DnPtx51SUptXaW3y0XGXToa6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722688480; c=relaxed/simple;
	bh=rIjK2v3itbUClmV07cGn/DmowobIVih2/McrUw39ixU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LSXuJDv9l4e2r38zsNKPycwDAWJhR34qDdle0n+opfwIosQJfkmTVmZ79r97Xxy3tl++4CQyCsKnf6y5dzO+K+VNRcRprCcBqoZp6fCFFcYf7qi3CzPziBFv8+cbMfDBTCz/HdzleiilKAwjXf1zavKR6YOZJnfIWQL4rJJYB7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=eHNqszlJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722688475;
	bh=rIjK2v3itbUClmV07cGn/DmowobIVih2/McrUw39ixU=;
	h=From:Subject:Date:To:Cc:From;
	b=eHNqszlJooOJGF9AiW5y4+c5TDmqIaKJEce6i2+G7wT9S7bP4nIi8MeSSYsqu0fVQ
	 aVAtsWu2ndtOgPugLzmWueAcX1eh3x/LPDSwF6G2qR6Iz7y9Aixx1dqRhs8/jPo7EB
	 i08SWEicTi/cl48EiYg022PZmQLdI9II7PkTCNXk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/7] HID: constify report descriptors
Date: Sat, 03 Aug 2024 14:34:16 +0200
Message-Id: <20240803-hid-const-fixup-v2-0-f53d7a7b29d8@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMgjrmYC/3WNwQ6CMBBEf4Xs2TUtIIgn/8NwaMti91JIF6qG8
 O9W7h7fTObNBkKRSeBWbBApsfAUMpSnApw34UnIQ2YoVVmrtlLoeUA3BVlw5Pc649Uq7exgtK0
 7yKs5Ui4O46PP7FmWKX6Og6R/6X9X0qhwbJp27Exzqay5v4hFxPnVnwMt0O/7/gVlQoF7swAAA
 A==
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722688475; l=4469;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=rIjK2v3itbUClmV07cGn/DmowobIVih2/McrUw39ixU=;
 b=97HAXYKT8zF2eAxko/nyZJpFQB7djuL6CfIUylx32DZPHM4rS/zJ6YVgIJhlnjr5chlW0p69F
 aqAjBGIuOO3Ce1/Z1tkNecX8z1nEDCGMO3Ut2DjzsfcCh2tI0Wu8PbJ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

report descriptors are not meant to be constified outside of the HID
core. Enforce this invariant through the type system.

In addition it also allows the constification of static report
descriptors used by the report_fixup() callbacks.
This makes it clear to driver authors that the HID core will not modify
those reports and they can be reused for multiple devices.
Furthermore security is slightly improved as those reports are protected
against accidental or malicious modifications.

Patches "HID: constify hid_device::dev_rdesc" and
"HID: constify hid_device::rdesc" are very similar but the patch 
"HID: constify params and return value of fetch_item()" needs to be in
between.
It would however be possible to squash them together.

Only the cmedia driver has their static report descriptor constified as
a proof of concept as I'm the maintainer for that one, I didn't want to
spam all driver maintainers at this point.
I have patches for all other drivers that I'll submit after this series
is merged.

Note, this is only compile-tested.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Drop RFC state
- Constify more of the internals of HID
- Drop now unnecessary patch introducing the variable "fixed_up"
- Link to v1: https://lore.kernel.org/r/20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net

---
Thomas Weißschuh (7):
      HID: bpf: constify parameter rdesc of call_hid_bpf_rdesc_fixup()
      HID: constify parameter rdesc of hid_parse_report()
      HID: constify hid_device::rdesc
      HID: constify params and return value of fetch_item()
      HID: constify hid_device::dev_rdesc
      HID: change return type of report_fixup() to const
      HID: cmedia: constify fixed up report descriptor

 drivers/hid/bpf/hid_bpf_dispatch.c |  6 ++----
 drivers/hid/hid-apple.c            |  2 +-
 drivers/hid/hid-asus.c             |  2 +-
 drivers/hid/hid-aureal.c           |  2 +-
 drivers/hid/hid-bigbenff.c         |  2 +-
 drivers/hid/hid-cherry.c           |  2 +-
 drivers/hid/hid-chicony.c          |  4 ++--
 drivers/hid/hid-cmedia.c           |  6 +++---
 drivers/hid/hid-core.c             | 14 +++++++-------
 drivers/hid/hid-corsair.c          |  4 ++--
 drivers/hid/hid-cougar.c           |  4 ++--
 drivers/hid/hid-cypress.c          |  2 +-
 drivers/hid/hid-dr.c               |  4 ++--
 drivers/hid/hid-elecom.c           |  2 +-
 drivers/hid/hid-gembird.c          |  2 +-
 drivers/hid/hid-glorious.c         |  2 +-
 drivers/hid/hid-holtek-kbd.c       |  2 +-
 drivers/hid/hid-holtek-mouse.c     |  4 ++--
 drivers/hid/hid-ite.c              |  2 +-
 drivers/hid/hid-keytouch.c         |  2 +-
 drivers/hid/hid-kye.c              |  2 +-
 drivers/hid/hid-lenovo.c           |  2 +-
 drivers/hid/hid-lg.c               |  2 +-
 drivers/hid/hid-logitech-hidpp.c   |  4 ++--
 drivers/hid/hid-macally.c          |  4 ++--
 drivers/hid/hid-magicmouse.c       |  4 ++--
 drivers/hid/hid-maltron.c          |  4 ++--
 drivers/hid/hid-microsoft.c        |  2 +-
 drivers/hid/hid-monterey.c         |  2 +-
 drivers/hid/hid-nti.c              |  2 +-
 drivers/hid/hid-ortek.c            |  2 +-
 drivers/hid/hid-petalynx.c         |  2 +-
 drivers/hid/hid-prodikeys.c        |  2 +-
 drivers/hid/hid-pxrc.c             |  4 ++--
 drivers/hid/hid-redragon.c         |  2 +-
 drivers/hid/hid-saitek.c           |  2 +-
 drivers/hid/hid-samsung.c          |  2 +-
 drivers/hid/hid-semitek.c          |  4 ++--
 drivers/hid/hid-sensor-hub.c       |  2 +-
 drivers/hid/hid-sigmamicro.c       |  4 ++--
 drivers/hid/hid-sony.c             |  2 +-
 drivers/hid/hid-steelseries.c      |  4 ++--
 drivers/hid/hid-sunplus.c          |  2 +-
 drivers/hid/hid-topre.c            |  4 ++--
 drivers/hid/hid-uclogic-core.c     |  2 +-
 drivers/hid/hid-viewsonic.c        |  4 ++--
 drivers/hid/hid-vrc2.c             |  4 ++--
 drivers/hid/hid-waltop.c           |  2 +-
 drivers/hid/hid-winwing.c          |  2 +-
 drivers/hid/hid-xiaomi.c           |  4 ++--
 drivers/hid/hid-zydacron.c         |  2 +-
 include/linux/hid.h                | 10 +++++-----
 include/linux/hid_bpf.h            |  2 +-
 53 files changed, 83 insertions(+), 85 deletions(-)
---
base-commit: c0ecd6388360d930440cc5554026818895199923
change-id: 20240730-hid-const-fixup-8b01cbda1b49

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


