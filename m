Return-Path: <linux-input+bounces-12009-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A05A9D3B1
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 23:01:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCAEE16E030
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 21:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E94721CC49;
	Fri, 25 Apr 2025 21:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="SIq5p77C"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27DC7FBA1;
	Fri, 25 Apr 2025 21:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745614857; cv=none; b=RSeU2ugYZR0S9cWuZhXBbinu5RDSdjLT57wG+ruZeFc0eeUWzKS866Q6hsmRDaqMLJSP60NccEeiThF5Ssn4c/wLJkj7NZc4mXP6ozp1wZwGtS6gTXkRJ7eBpldha8Aleq1oIjl0NYYc/qnhlQN8EQKnQIcnO+4jeaxp7Qn92k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745614857; c=relaxed/simple;
	bh=py4Mr8ZhYttK82+/VOKKCG8+er46k3cOwQkiGy7ZSqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bN88YVPh4RvlAhyr8g7ATCvt9doySL5GSfYwj4qf4nK36qEQzaf2aV/jaxztlR4p3rQApwh659Sq2UwAwK9P+Ul2dRGgHdZrcUnW+z0Z1ub5GAzwtHGnHE5owgHRXZpp5wnu0sXVAAhkoYiR3q9D+1IDnYnOrFjpE2RJbsl7ngQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=SIq5p77C; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 197112FC0052;
	Fri, 25 Apr 2025 23:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1745614845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L693lwnxdntwJ9NnwBHhT2YiPwQuMglplqIIMjIpokk=;
	b=SIq5p77CD5Su1ClFFvcOijC3zFSqEIvay+35Qlb4J2hyQRxCUxhCsiJaUuRgFLvlakznOw
	FoHKCCqmxsHd92g20Rq5jmuauzI85ldkTARHwfSfHfr476A7dvjkLMIoDsqu7oQgvB3ObI
	Efgp1qFAl8+lJRKRF0SpomlZ1t/zBeU=
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
Subject: [PATCH v9 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices
Date: Fri, 25 Apr 2025 22:53:28 +0200
Message-ID: <20250425210043.342288-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note that I'm away from my work PC for the next week so expect my next
response the monday after.

v2: - Integrated Armins feedback and fixed kernel test robot warnings.
v3: - Fixed borked subject line of v2.
v4: - Remove unrequired WMI mutex.
    - Move device checking from probe to init.
    - Fix device checking working exactly reverse as it should.
    - Fix null pointer dereference because,
        hdev->driver_data != hdev->dev.driver_data.
v5: - Move everything to subfolder nb04 in preparation for the eventual
        upstreaming of other tuxedo-driver parts.
    - Integrated Ilpos coding style feedback.
    - Use dev_set/get_drvdata() based on Armins feedback.
v6: - Integrated more of Ilpo coding style feedback from a different LKML
        patch-thread (less files, local functions prefixed with a short
        string).
v7: - Integrated more of Ilpos feedback e.g.:
        - Use cleanup.h
        - replace some if cases with a pointer in driver_data
        - coding style oversights
v8: - Integrated more of Ilpos feedback
    - Typo fix spotted by Alok
v9: - Introduce lamp_rgbi_tuple_t to group some values
    - Introduce LAMP_MULTI_UPDATE_REPORT_LAMP_COUNT_MAX to not manually set
      a fixed number at multiple places
    - Move lamp_multi_update_report initialization in
      handle_lamp_range_update_report out of the loop again as a small
      performance optimization as the unused entries do not actually be
      zeroed (I mixed up the spec of this devices wmi interface and the HID
      spec)

Werner Sembach (1):
  platform/x86/tuxedo: Add virtual LampArray for TUXEDO NB04 devices

 MAINTAINERS                                 |   6 +
 drivers/platform/x86/Kconfig                |   2 +
 drivers/platform/x86/Makefile               |   3 +
 drivers/platform/x86/tuxedo/Kconfig         |   8 +
 drivers/platform/x86/tuxedo/Makefile        |   8 +
 drivers/platform/x86/tuxedo/nb04/Kconfig    |  15 +
 drivers/platform/x86/tuxedo/nb04/Makefile   |  10 +
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c   | 923 ++++++++++++++++++++
 drivers/platform/x86/tuxedo/nb04/wmi_util.c |  91 ++
 drivers/platform/x86/tuxedo/nb04/wmi_util.h | 109 +++
 10 files changed, 1175 insertions(+)
 create mode 100644 drivers/platform/x86/tuxedo/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Kconfig
 create mode 100644 drivers/platform/x86/tuxedo/nb04/Makefile
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_ab.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.c
 create mode 100644 drivers/platform/x86/tuxedo/nb04/wmi_util.h

-- 
2.43.0


