Return-Path: <linux-input+bounces-11503-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D11A7B186
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 23:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C64A3189E59D
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 21:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F8219D07A;
	Thu,  3 Apr 2025 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="msGY8iOo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEBE224FA;
	Thu,  3 Apr 2025 21:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743716169; cv=none; b=dxim5TGthlo4kQdbfB1fbh0GIGdAWPb9G4h0QEH+KzDb0hZR8P4ThopdJbausWy+X/qJnbNSiFPQR8i2nBTDR1PCjnaKyHXs7ytBA73HAjmPg5XE2PRIyVU6HgL7sSG2UEMxlH/gjCQmAY7plKcbSAx5xwTnhmnC5slttFx3VGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743716169; c=relaxed/simple;
	bh=DyQIUl9KUZbuGHNgqdhsItBKzNAvksQhEaVxQDncniE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1y1FKSklkYnHOHeo62QorA1uN3QKl7Bdsstt1/6Tl/lkHIsuq5xurg7CiJ/99khoOpyx4OQdCwCrP6xSMaBAkzK896y7Y9ZFheh73j8JPT63UwjO78ag9Jv8zxcKaKLXyqu7qzl/naPo/kPKhvUukbGVn7Jip5WjMzTgzf/7OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=msGY8iOo; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (p5b164989.dip0.t-ipconnect.de [91.22.73.137])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id BF30B2FC007C;
	Thu,  3 Apr 2025 23:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1743715778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r0Y0yi9Bsd4jUb7Uw5Y05SXXGBmaviGNn16+UuXiFE0=;
	b=msGY8iOoqaFW1B5zfXJOKovskTnWqzbBD5GPn11DAvCH1CJsUAOZd2Uwbk8d/t7pFGuv8E
	FRAgB2FkMuiyvVpoHGIxXaBP0VHJMrOT7QPyVUopNZwm++KQ1mZjfHoUJ3pvr0CAsoADvZ
	td6OERlCH5JYNthlKGgSpPB+IHzzHD8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v6 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
Date: Thu,  3 Apr 2025 23:02:08 +0200
Message-ID: <20250403212934.561943-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Next version and hopefully the final one? Lets see ^^.

I integrated more coding style suggestions from Ilpo he gave me on a different
patch, but were applicable here too.

For the why I named the subfolder nb04 and some functions *wmi_xx* see this:
https://gitlab.com/tuxedocomputers/development/packages/linux/-/tree/tuxedo-drivers_upstream_wip/drivers/platform/x86/tuxedo?ref_type=heads
- We have several ODMs identified in the board_vendor dmi string (NB01, NB02,
  NB04, and NB05) and are planing to upstream drivers for all of them. So I
  already incorporated it in the folder and module name.
- On NB04 devices there is a wmi_ab interface for the keyboard and a wmi_bs
  interface for power control and some device informations. Util functions that
  will eventually be used in both drivers are named *wmi_xx*

I also hope it was ok that I significantly cut down the cc list that was ever
expanding since v1.

v2: Integrated Armins feedback and fixed kernel test robot warnings.
v3: Fixed borked subject line of v2.
v4: Remove unrequired WMI mutex.
    Move device checking from probe to init.
    Fix device checking working exactly reverse as it should.
    Fix null pointer dereference because,
        hdev->driver_data != hdev->dev.driver_data.
v5: Move everything to subfolder nb04 in preparation for the eventual
        upstreaming of other tuxedo-driver parts.
    Integrated Ilpos coding style feedback.
    Use dev_set/get_drvdata() based on Armins feedback.
v6: Integrated more of Ilpo coding style feedback from a different LKML
	patch-thread (less files, local functions prefixed with a short string).

Werner Sembach (1):
  platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices

 MAINTAINERS                                 |   6 +
 drivers/platform/x86/Kconfig                |   2 +
 drivers/platform/x86/Makefile               |   3 +
 drivers/platform/x86/tuxedo/Kconfig         |   8 +
 drivers/platform/x86/tuxedo/Makefile        |   8 +
 drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
 drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 847 ++++++++++++++++++++
 drivers/platform/x86/tuxedo/nb04/wmi_util.c |  95 +++
 drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
 10 files changed, 1103 insertions(+)
 create mode 100644 drivers/platform/x86/tuxedo/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h

-- 
2.43.0


