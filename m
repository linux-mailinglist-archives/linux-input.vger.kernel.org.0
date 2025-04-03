Return-Path: <linux-input+bounces-11494-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCDA7A5E1
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 17:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8CB171198
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD2E2505A6;
	Thu,  3 Apr 2025 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncJP2Cha"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6864624E005
	for <linux-input@vger.kernel.org>; Thu,  3 Apr 2025 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743692438; cv=none; b=taW0XSQjd8W50f+Qp1LHLjQB07rWNS32be6o0Wgn9470+/iEKYphPeoi1E5K1eIelt5uqjwbMgaZyrHCwr3gFsnN40PYjXLPGvIAsresfjzhcWvxB0ICx4+wOt5UicDnh1lWJM1Isc+iXMtlHAnaT1pF8sK4+FWxHY388pv5UfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743692438; c=relaxed/simple;
	bh=aomKwtfhdIUoSO4nBGMPjrnn+UriWeFDK5mqBPIDHOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TUuxAwQq2Xs2dZwk4vuoz9c3XCCGT8gWgZMQvCPoV0g7FqC3S2XUuPnRAt3pDZG03lrRcbaXWhKr7J0iV+GNeupfcywF2EXJnuihnZxQtRKIgcsYW0tnz57tYL8oHfYBP7nOaz7wa00A8qhdQfBI8m8vu9KED0SaCRFEfs2J2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncJP2Cha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC949C4CEE3;
	Thu,  3 Apr 2025 15:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743692437;
	bh=aomKwtfhdIUoSO4nBGMPjrnn+UriWeFDK5mqBPIDHOE=;
	h=From:To:Cc:Subject:Date:From;
	b=ncJP2Chaonc9bHKoOl8qWmxjwQw6zy8cYmGhp+anrstDLVM3+K0T2JRBKSdE48ByW
	 BqU6A+xUhKLwWXA0lFPI7XqLtTP0opOoQQLNMWORCg5thclcFhgERj+TDIiwIwPOqI
	 Qhd38OfIuMnS3mVMUsJu9J8m0Go34Bf32MiTGwQDNRAJFeAxP7WlkZ8NLt+PD16t+X
	 R5M00IUmBkYS/RjhtWt1aPPC+Gy6w5ITBLmlEqxUmbOke4LmzBoe9OodgP9LPb3TH2
	 +IE6qjTgGjUK/J+qOrA+APPOb0H+RVYsOjepqlxlT+BwagAKuZtUbTdH9JFD+I+oIM
	 gZmpV+iAjMFbA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	akshata.mukundshetty@amd.com,
	basavaraj.natikar@amd.com,
	bentiss@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jikos@kernel.org,
	Shyam-sundar.S-k@amd.com
Cc: linux-input@vger.kernel.org
Subject: [PATCH v2 0/2] Fixes for SRA sensor handling
Date: Thu,  3 Apr 2025 09:59:21 -0500
Message-ID: <20250403150026.1657538-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

On systems with an SRA sensor there are some problems with both init
and failure paths.  This series accounts for both.

Mario Limonciello (2):
  HID: amd_sfh: Fix SRA sensor when it's the only sensor
  HID: amd_sfh: Cleanup all sensors when init fails

 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.43.0


