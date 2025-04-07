Return-Path: <linux-input+bounces-11559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ACDA7DFEA
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:48:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 917457A3E53
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 13:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B906F1B4145;
	Mon,  7 Apr 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atanWHlk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2B1B4140
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033706; cv=none; b=FK0+Yak/JWhJ5lrMEe8MRXLfma5gHIzPZTnQ9wZI+rSg4qyhSyb9zEqF+UtaIJod3ZUO3goBvg5QNxmyhB5VTEmZ60DTriNcoY4QDATaI081QU/yDUOkxkSrdny5v8WdFMD7itRnJlSHH7eBoX+RpP2ogtfsAZIOkru/A1AdwLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033706; c=relaxed/simple;
	bh=Z1wFlrfdX3wpxxcTk8TCmp2OjjYLbdM0H34fyUnwn+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=seA8pvgX+RMLnx1NRp5DfP7DhXm8N41S5F+yxPM0hgJ7za+m0wl77Rl/vxYpp0815jNtsF4m117AVLcdKsTnyixHj+64oYbZ4ZVPqpNHf0U9FTmiDKQHEE19QyA4WpPoE/7Yn+XP96cVj63PCB8o1JWYgNLRWcIl5Xj9fVKtq3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atanWHlk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2485FC4CEDD;
	Mon,  7 Apr 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033706;
	bh=Z1wFlrfdX3wpxxcTk8TCmp2OjjYLbdM0H34fyUnwn+0=;
	h=From:To:Cc:Subject:Date:From;
	b=atanWHlkaWIpyeVhZFGWs5Y0gbFlGYULd/5xjQXGCPCdA5Zekx/hc3naqkZthk8rv
	 UwtdRPeMZTB76tviuc0CIeuhiEWJEoaS9X3ejNIRxZPKPAFJlNMltvOr+JWvpFPTtg
	 A937hsVMZtXHILWP3RUu/X6YrRiuudJcOis3+SPsAgmnuHpwcvEPmDMa5mr6YIuHxx
	 eL3ZS775hXDA7VRq7nfkiSd8A3IGl6WFUJY8GWP39eCM/qXuctBR1FX0SxWSw9vPAA
	 v9pWeQN0PokuTM0jdZSBpmBZrZnEmKlWashMFSw20Zsrs9tuUN3pDz6AwROQbXhaBX
	 jyTl2cqVtdNkQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	akshata.mukundshetty@amd.com,
	basavaraj.natikar@amd.com,
	bentiss@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jikos@kernel.org,
	Shyam-sundar.S-k@amd.com
Cc: linux-input@vger.kernel.org
Subject: [PATCH v3 0/2] Fixes for SRA sensor handling
Date: Mon,  7 Apr 2025 08:47:47 -0500
Message-ID: <20250407134818.805775-1-superm1@kernel.org>
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
  HID: amd_sfh: Avoid clearing reports for SRA sensor

 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.43.0


