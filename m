Return-Path: <linux-input+bounces-10442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 183CDA49EDB
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 17:32:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CDDF1759E0
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 16:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FA2271815;
	Fri, 28 Feb 2025 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uz23Zo6j"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A79326B0A1;
	Fri, 28 Feb 2025 16:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740760335; cv=none; b=FdQGs3nscvM+mJYIUME9jkZvWHnKhd4w6ignURkJ6wLdQchGU44Z9bUDSMtQbAeJr46cXswwusZr65icqLy7JZ1Ld1noHjIP8GiiV06Vi5650zmZS9XAlKMTyNY0HUyErovN2w+A9Hyx5F0eII9dh3VGh+WeDBPjWfqr9C0Rz+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740760335; c=relaxed/simple;
	bh=KaTaZzLzrA1kT8zu03uIMcS/eRL3mFksmGhNbRqrIlY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vDUaHLyraLoUWF/89BiJdmO7EXzy7gSz5hNgvroC+5l5vEVwdjS95sRApqdvaeLBFDP/C4d8rkmCG7o4FiP8HPweQ7AZL0kAvaOI4QMMIsw4+w67RS8Ve3yJTdmlUrw5RhxcgHRoa/BXAtZOl6AiPj55IFTorHGRCW8550qMBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uz23Zo6j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53A0C4CEEC;
	Fri, 28 Feb 2025 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740760334;
	bh=KaTaZzLzrA1kT8zu03uIMcS/eRL3mFksmGhNbRqrIlY=;
	h=From:To:Cc:Subject:Date:From;
	b=uz23Zo6jTi59SOKar3TnUL0n3/EcPnLwAZoes/e+VFLDe+6qb20sttaAl0ZuYjjDg
	 DdzurnqTk8otdQEYZP79USvrgwp0pePpYVScP8RtfoWIkrawKqRWNnDzp9XO4GS6Wd
	 prLZy+YR2oVdW/ZjQPz+DabcQjkJhQtEAcNpcZbyXRk28/6HURuy22ptw//qrgwZ8a
	 58tIF2BLJNGvodGatv1vJG2C4YGJYgpG61WkQzh+ZEE8lbUInzqLSsm0hm+kBw4uGt
	 +Ksb2FEX9A+XAvyeMwBFlQx0vomncBrDAk+zi0bR8kzOaFN9zM+1XGYlOWHviMnAer
	 oT7c2gN2ef8ow==
From: Mario Limonciello <superm1@kernel.org>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org (open list),
	linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>,
	Anson Tsao <anson.tsao@amd.com>
Subject: [PATCH 0/3] Adjust behavior for HPD sensor
Date: Fri, 28 Feb 2025 10:31:50 -0600
Message-ID: <20250228163153.2554935-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Some platforms include a human presence detection (HPD) sensor. When
enabled and a user is detected a wake event will be emitted from the
sensor fusion hub that software can react to.

Example use cases are "wake from suspend on approach" or to "lock
when leaving".

This is currently enabled by default on supported systems, but users
can't control it. This essentially means that wake on approach is
enabled which is a really surprising behavior to users that don't
expect it.

Instead of defaulting to enabled add a sysfs knob that users can
use to enable the feature if desirable and set it to disabled by
default.

Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: Anson Tsao  <anson.tsao@amd.com>

Mario Limonciello (3):
  HID: amd_sfh: Allow configuring whether HPD is enabled or disabled
  HID: amd_sfh: Default to HPD disabled
  HID: amd_sfh: Don't show wrong status for amd_sfh_hpd_info()

 .../ABI/testing/sysfs-driver-amd-sfh          | 13 +++++
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 58 +++++++++++++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 50 +++++++++++++++-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h |  3 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  2 +-
 6 files changed, 124 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-amd-sfh

-- 
2.43.0


