Return-Path: <linux-input+bounces-7510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121B9A2908
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 18:35:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB0C61F2326B
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2024 16:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372A01DF73A;
	Thu, 17 Oct 2024 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELGX+r8d"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2D61DF733;
	Thu, 17 Oct 2024 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729182910; cv=none; b=IDKmBPw5NXRduLyiQ7VDat5N3sEwXx14jQHQkckR2TzHyUFWv5D8CD3pVEMr490SLFu7+TQsZqVrYb9UOiZN3di+4Lhar+i1pjZgYbztj0Ht6+TRQ3x0/T5zAzh1YURXURbyPp100bNdSFxM6m4mE+ZQM2KFMZp1myArlAksTNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729182910; c=relaxed/simple;
	bh=zWk1IfB5LS8y+1LUS1OnXowlFx8bzZy8lIfkYaTiUc4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A5SV/H+3CTsdP2iYsVJubujMy1CI4q9tNtLbuwIKTPvMos8yJjhJOIW2G+S8XvTmj/qBrPrmjwBMLE7KW7yig/JEp7pWjUe3KGd/w4Xe88Cy2i2Ou+YesDV2n49tDSCyy2+KizWzU5ViKpUaYy3gu2MEw/hi4RKJvM+spcjnjVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELGX+r8d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12934C4CEC3;
	Thu, 17 Oct 2024 16:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729182909;
	bh=zWk1IfB5LS8y+1LUS1OnXowlFx8bzZy8lIfkYaTiUc4=;
	h=From:Subject:Date:To:Cc:From;
	b=ELGX+r8dNcyBJhv+kNXIOkp9czn/tZKVZ+VzuYeC7zspkhIxhhSeCqCj5cS8yofkm
	 dhDL3ju+QuG2LiIssSXLxZcl756QERNtgiL6CuBXGITx5PxXwb3lNO2e9r3QFz2+Ry
	 iLWx12Rmapx2qWpWXV+aSrKIARds8HTstMsjMyphzA/Ei7ktJ09VGXXzX2Hv9pfH3d
	 cbacXa8QCXWAWCrOsQrkKc/U740bpMKMnv0/m+0F1ly3e7yoteP9snDkVxNEtbcCCg
	 sHlvA5oXzEZ0yVeksswkS+vD8P4ZyusR6VomhvMUKjTXU80B6k8UkK6GEzihTFt7j7
	 ELcgPMfdJvGSw==
From: Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH v2 0/3] HID: bpf: add a couple of HID-BPF device fixes
Date: Thu, 17 Oct 2024 18:34:57 +0200
Message-Id: <20241017-import_bpf_6-13-v2-0-6a7acb89a97f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALE8EWcC/3WNQQ6CMBBFr0JmbU2nGIuuvIchBOgUJiptpoRoC
 He3snf5XvLfXyGRMCW4FisILZw4TBnMoYB+bKeBFLvMYLQ5oUar+BWDzE0XfXNWWCrtqNcVdtZ
 7B3kVhTy/9+K9zjxymoN89oMFf/Z/a0GlFV6sqyrTOirt7UEy0fMYZIB627YvNu4zra8AAAA=
X-Change-ID: 20241017-import_bpf_6-13-0dec081b7ffd
To: Jiri Kosina <jikos@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>, 
 Peter Hutterer <peter.hutterer@who-t.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729182907; l=1234;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=zWk1IfB5LS8y+1LUS1OnXowlFx8bzZy8lIfkYaTiUc4=;
 b=tqiZx3kRo5CjEogwZMoWASUVSqgulZKF4AzQNa2EFVn1lfEI0kPNg0CUefKX5xOy3uAREn0yP
 oGu9sbBfKvpCLMB9zl/G00ELLfAK9o6KYmjWBU2zd/IsTpq1jcnDqZ7
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

Both files have been in udev-hid-bpf for too long.
Both files are actually simple report descriptor fixups, so
there is not a lot to explain here :)

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
Changes in v2:
- Sorry, while preparing the udev-hid-bpf tree I realized we had a
  change in hid_report_helpers.h, so added the third commit
- Link to v1: https://lore.kernel.org/r/20241017-import_bpf_6-13-v1-0-197d882ade37@kernel.org

---
Benjamin Tissoires (3):
      HID: bpf: Fix NKRO on Mistel MD770
      HID: bpf: Fix Rapoo M50 Plus Silent side buttons
      HID: bpf: drop use of Logical|Physical|UsageRange

 drivers/hid/bpf/progs/Huion__Dial-2.bpf.c          |  66 ++++++---
 drivers/hid/bpf/progs/Huion__Inspiroy-2-S.bpf.c    |  60 +++++---
 drivers/hid/bpf/progs/Mistel__MD770.bpf.c          | 154 +++++++++++++++++++++
 drivers/hid/bpf/progs/Rapoo__M50-Plus-Silent.bpf.c | 148 ++++++++++++++++++++
 drivers/hid/bpf/progs/hid_report_helpers.h         |  36 +++--
 5 files changed, 413 insertions(+), 51 deletions(-)
---
base-commit: 6485cf5ea253d40d507cd71253c9568c5470cd27
change-id: 20241017-import_bpf_6-13-0dec081b7ffd

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>


