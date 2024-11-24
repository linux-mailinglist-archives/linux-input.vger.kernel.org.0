Return-Path: <linux-input+bounces-8224-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374149D781C
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 21:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98792B2106F
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 20:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E905103F;
	Sun, 24 Nov 2024 20:39:23 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosmicgizmosystems.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4002E2500B5;
	Sun, 24 Nov 2024 20:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732480763; cv=none; b=NwnoP4KU5Qgy4QO9y8lL/t5k9F9w3QEbGAEfHd/OCLT0GMUqr0Wvb+5+UxsqdkZRVmfMZ/Yqqrs4oYg+G6ZmEl37pbQPb9p/2Y3nd8BaFHROOJ4+WK/9zEUqQ/2FRumUu49+2dlZ+0mw9dXJIjgON//GHb/7/dEHskfZvOF1Yp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732480763; c=relaxed/simple;
	bh=tbFfOT0weA1+4h6Fh0DLo5WeX/MqkSQ3kGRBp1yIPkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dkk3Efs1p4BzAa+M5ao2zHO8eGRtf1xQO3wFopDLJaj1ErbKSEJGSLVQtRHu2YquevoGQplbI5QnW7w9HnLb8WIZQiICxXuSpVqKos6jmgF1FrETLeLw1yM0lqblRe9oiqTElwhObGPvER+AKepBBX7834itZsBXV+rteJwHHfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from terrys-Precision-M4600.hsd1.wa.comcast.net (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id A910B246D150;
	Sun, 24 Nov 2024 12:33:40 -0800 (PST)
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
To: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/2] Introduce Poly/Plantronics mute event support
Date: Sun, 24 Nov 2024 12:32:39 -0800
Message-ID: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jiri and Takashi,

I'm not sure how it works with two different maintained trees
but this patch set needs to be applied and flow upstream together.

If the HID patch is applied without the ALSA patch then mute sync
issues will occur with multiple Poly/Plantronics product families.

This patch set was tested by Wade and myself with multiple
Poly/Plantronics product family headsets.

Hi Wade,

Please feel free to add your Signed-off-by: and/or Tested-by: tags,
as you see fit.

Thanks,
Terry

Terry Junge (2):
  HID: hid-plantronics: Add mic mute mapping and generalize quirks
  ALSA: usb-audio: Add quirk for Plantronics headsets to fix control
    names

 drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
 sound/usb/mixer_quirks.c      |  35 +++++++++
 2 files changed, 100 insertions(+), 70 deletions(-)


base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
-- 
2.43.0


