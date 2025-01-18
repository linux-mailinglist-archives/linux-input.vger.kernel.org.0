Return-Path: <linux-input+bounces-9362-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE9A15AB9
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 01:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41646188BB08
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 00:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7A5BA2D;
	Sat, 18 Jan 2025 00:58:59 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A882814F98;
	Sat, 18 Jan 2025 00:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161939; cv=none; b=GNZeIn3j6/TfUHz1LVX68DJirmTnUrvgsyyQPvt1Oaow02I/le0IzslvkbySZlrLHwj4rp2pWlANrJqR+rjrPmf+ocvR9VCgdT/+OPyxJkncBJyk4ppOrW9mjVVDFQd5YLMokyXiUDUoriAa8aEpRY7EcmGKz8qgoARElfrCE0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161939; c=relaxed/simple;
	bh=nPl5BDwG0fCVjxV6z09nI4m9uVNE72RQ5lyj52Dy2t4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YR3rAFFn/fhOsJrmT+w7MSTHKo7mbCeSiuTuGyI7oasa5kv9V1G9guAIxTjts9JCkuuafyP6/ddScpOMcm/xCrbOO+/cGcz/o+vJlJ5mKvTtdCL+Ay/Sm/4VfhcIhpH3m2Fx+VWqlRGvqlrmbz7uZss9GRlAh9yI7fFvNpBiIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from terrys-Precision-M4600.hsd1.wa.comcast.net (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 4C59C229CC5D;
	Fri, 17 Jan 2025 16:58:50 -0800 (PST)
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
To: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Introduce Poly/Plantronics mute event support
Date: Fri, 17 Jan 2025 16:58:37 -0800
Message-ID: <20250118005841.6618-1-linuxhid@cosmicgizmosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
References: <20250113235212.78127-1-linuxhid@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jiri and Takashi,

If at all possible, it would be preferred if this patch set could be
sent upstream and to stable together.

This patch set was tested by Wade and myself with multiple
Poly/Plantronics product family headsets.

Thanks,
Terry

Link v1: https://lore.kernel.org/linux-input/87zfl333uy.wl-tiwai@suse.de/T/#t
Link v2: https://lore.kernel.org/linux-input/4a25e5d0-5e09-4246-8d70-8083d3189d53@cosmicgizmosystems.com/T/#t

Terry Junge (2):
  HID: hid-plantronics: Add mic mute mapping and generalize quirks
  ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
    names

 drivers/hid/hid-plantronics.c | 144 ++++++++++++++++------------------
 sound/usb/mixer_quirks.c      |  51 ++++++++++++
 2 files changed, 118 insertions(+), 77 deletions(-)


base-commit: 09a0fa92e5b45e99cf435b2fbf5ebcf889cf8780
-- 
2.43.0


