Return-Path: <linux-input+bounces-4016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 778BB8D7466
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 11:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0332DB216FD
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 09:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058FB39FCF;
	Sun,  2 Jun 2024 09:02:58 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674B4374F5
	for <linux-input@vger.kernel.org>; Sun,  2 Jun 2024 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318977; cv=none; b=IJSHAG2n0RnmTCLeGML0MBxOASCD0HzMhw0JncTk1vOV3nxWg6/gORvOw9ok2H88X2wuCpkrjBL4kN/mQIbvVoFzSPwkk1VJ+jFMzwT/+ppif8cTSfnciKskz7PXUKn/aaJgFR9yAAQaGuoyTC7QYL3/aP6Dk/aCqFYXVz5xpN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318977; c=relaxed/simple;
	bh=kvjM+fA8m/X7nFchC9GtlIpylkN/zyU5xhYjmg6++aU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rj8+hvi606ia9Hr4IYrcOgJzGCHyoCjVgk3n95cmrTM3aC2pU3u0vs8yMd198SAuPN3kFlj99+LI1ynq6pRQMatxfjU3odHU2RmxcWpmRNXbuykbe/bBJSABc9xmmBd8XTrXV2mfuHLjxuCx25bYkVO8TRoEoCWIz/R0gnEEs+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id e0b351d6-20be-11ef-8e3d-005056bdf889;
	Sun, 02 Jun 2024 12:02:48 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Li Zetao <lizetao1@huawei.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-input@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Mark Pearson <markpearson@lenovo.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH v1 0/7] platform/x86: Move to 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:53 +0300
Message-ID: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move to 2-argument strscpy() to make code shorter and have an additional check.
No functional change intended.

Some cases are let untouched where it looks better with the 3rd argument.

Andy Shevchenko (7):
  platform/x86: asus-tf103c-dock: Use 2-argument strscpy()
  platform/x86: hp: hp-bioscfg: Use 2-argument strscpy()
  platform/x86: intel: chtwc_int33fe: Use 2-argument strscpy()
  platform/x86: serial-multi-instantiate: Use 2-argument strscpy()
  platform/x86: think-lmi: Use 2-argument strscpy()
  platform/x86: thinkpad_acpi: Use 2-argument strscpy()
  platform/x86: touchscreen_dmi: Use 2-argument strscpy()

 drivers/platform/x86/asus-tf103c-dock.c       | 10 +++++-----
 .../x86/hp/hp-bioscfg/enum-attributes.c       | 18 +++++-------------
 .../x86/hp/hp-bioscfg/int-attributes.c        |  7 ++-----
 .../x86/hp/hp-bioscfg/order-list-attributes.c | 18 +++++-------------
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 19 +++++--------------
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  3 +--
 .../x86/hp/hp-bioscfg/string-attributes.c     | 12 ++++--------
 drivers/platform/x86/intel/chtwc_int33fe.c    |  6 +++---
 .../platform/x86/serial-multi-instantiate.c   |  4 ++--
 drivers/platform/x86/think-lmi.c              |  4 ++--
 drivers/platform/x86/thinkpad_acpi.c          |  6 ++----
 drivers/platform/x86/touchscreen_dmi.c        |  2 +-
 12 files changed, 37 insertions(+), 72 deletions(-)

-- 
2.45.1


