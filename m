Return-Path: <linux-input+bounces-11562-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BA3A7E419
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 17:24:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03D667A24C7
	for <lists+linux-input@lfdr.de>; Mon,  7 Apr 2025 15:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D9881FDA97;
	Mon,  7 Apr 2025 15:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U490H8zU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783191FDA8A
	for <linux-input@vger.kernel.org>; Mon,  7 Apr 2025 15:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039150; cv=none; b=jDJQg9TYhE8OPmwO9G5PRqruXzpNGF42BSaWvwNMq8YqRc0IbHZDNmVhUvaG6XLaxQZVzmnoXlbqSUsBGX3vo2KugC3PjhXJqDdJhCKluigGQ5zpo4yhPsrD0mu8IXLO5p9IPXwUov4hXC2olxUcFOgW3isi1Me2a2ff3MoGn00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039150; c=relaxed/simple;
	bh=AwT4z+xkbfHtWZOzrBlNFdq1qebkCqIisSjYZDFsdDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNIcP8Pw6HZseimUYx08i3hOyh2TqD1UtSJ4Ntr0m5sP51nx2nZQVLowedWLUHzcV8TruCM2u7DFY0zDvpHg1Q6dB5khlkcG0e9V1vLtlITMmDAefYBbeyNsPEpnzL414TaxcpBK5lR6RKx9KFmC/13yOhhzbU7SDkyQ2+CeVWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U490H8zU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A46AC4CEE7;
	Mon,  7 Apr 2025 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744039148;
	bh=AwT4z+xkbfHtWZOzrBlNFdq1qebkCqIisSjYZDFsdDA=;
	h=From:To:Cc:Subject:Date:From;
	b=U490H8zUYF4oiSPmYen5WDnE288r/voxJ+lJTqZVpfXOMMDOlVQoZEher5aA2tGxC
	 ZMJEhia9ddSULh7PzFjAZbsIgaPAkLqgpuAB5yPivSkNh8lvrCb5y+O+W5SxGNQm1G
	 0piCwWQK1UcNlSpm1JzCWJeP+vdcg6W6XlbFyLuX5Np73l9pyEJyytFMx5Nsdtk92t
	 1Qgg0x59iUo83Mfy5Ijf9WfbspoB95WLlMz+5h6K5kXiv+1uMYZxzVqhCRam6Vh57D
	 qwWGZfONcykgq7N/XSDjR7FQ8xX3kVoWcLlDmP/oPqw1kBWVDpiTTz05ByInyN6ARQ
	 L0Iejqf5xpNmQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	akshata.mukundshetty@amd.com,
	basavaraj.natikar@amd.com,
	bentiss@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jikos@kernel.org,
	Shyam-sundar.S-k@amd.com
Cc: linux-input@vger.kernel.org
Subject: [PATCH v4 0/2] Fixes for SRA sensor handling
Date: Mon,  7 Apr 2025 10:17:46 -0500
Message-ID: <20250407151835.1200867-1-superm1@kernel.org>
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

v3-v4:
 * I got pinged offline with a missing cleanup case. As the patches
   otherwise looked fine I added it to the second patch and sent it.
Mario Limonciello (2):
  HID: amd_sfh: Fix SRA sensor when it's the only sensor
  HID: amd_sfh: Avoid clearing reports for SRA sensor

 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.43.0


