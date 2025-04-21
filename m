Return-Path: <linux-input+bounces-11904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19356A957FA
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 23:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F098A7A6896
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 21:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00211F09A7;
	Mon, 21 Apr 2025 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0e76SPF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F091E9916;
	Mon, 21 Apr 2025 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745271142; cv=none; b=YL8Rgm9AFWWdqaNkTt3F/dZco3Dp3+yCqM2cuUbnGJLanUlabtwntBDS0tYHIVJpUFvTQtwgDdJUYE924H9I354q3XTmvnn6kWceTPdoOtHBfMF4lK4+pw1nipbf75GN3km+KwPcoUzJzKWANetbSKdtujoazue9gQ0lmJQ009o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745271142; c=relaxed/simple;
	bh=7k5SrfzednksLuDcqLkNO+vrUZCu5xJak0tKi6gH72k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l2mrqHtvbcbPmcXXnqPeQ7oTBmgg6YomEOSjL0yhFhlc5RsUMWq21IZOb4P5xcFXMPYlCVX/QDlbPZhIXNcVQ+Y/R0uwtpule5wRm8jz2bSRI0aW1612Oejvss/NS/epdXCyyBGGkHlJcpRgsXDB2yiwBux1BMXzWnBDccBFql0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0e76SPF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5D0C4CEE4;
	Mon, 21 Apr 2025 21:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271142;
	bh=7k5SrfzednksLuDcqLkNO+vrUZCu5xJak0tKi6gH72k=;
	h=From:To:Cc:Subject:Date:From;
	b=a0e76SPFDifFT1pGCOFQsuv+7Rg71UCvfrVPfurGGLOT0tbZKsxP5omA5fWnzl8uA
	 0R7fUL+wvSLWwon6R/9Gz4M5DVXhLIqDVBYat+3Iv4phAihbuzIYu5I3dX1pHq7/w3
	 TeKE9BTN4phkSNV5nDDN8EYPTrFmvU/sAl2D/HDh3Jorpdk6FkHLFA5DA5+J74q9em
	 9VJKq/9AvB5pmCKYskfT6EIt4vI/GOfJYuRyl5+5h5dyhqJrm/oeGz477AYdcItcs6
	 fKCepr9UYjc+SpcyXWTXNllKBDRZP4l+RrRVq/kAxWsvSU7/iZoPnFI0wh9xftN6r1
	 KcyWrrcPAXeOg==
From: Mario Limonciello <superm1@kernel.org>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org (open list),
	linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 RESEND 0/2] Fixes for SRA sensor handling
Date: Mon, 21 Apr 2025 16:32:08 -0500
Message-ID: <20250421213210.1160665-1-superm1@kernel.org>
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

This is resend of V4 which ahsn't gotten any movement the past two
weeks:
Link: https://patchwork.kernel.org/project/linux-input/cover/20250407151835.1200867-1-superm1@kernel.org/

Mario Limonciello (2):
  HID: amd_sfh: Fix SRA sensor when it's the only sensor
  HID: amd_sfh: Avoid clearing reports for SRA sensor

 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

-- 
2.43.0


