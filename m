Return-Path: <linux-input+bounces-12735-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09FAD168A
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 03:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50D29167386
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 01:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A0F2A1BA;
	Mon,  9 Jun 2025 01:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iooJH0um"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3CC12B94
	for <linux-input@vger.kernel.org>; Mon,  9 Jun 2025 01:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749433650; cv=none; b=DIBG8+iFIbS8BT60qpiE+CsKnMfIwfJvf5gG402i1x4Bqej6n624RwjaNvUjYo7J0YI4wpyWX0DSXazJzvokznT54C35JXE6vdt8YoljuFujV8DKEwp9+w5TaTyNjh0B3BcWu4liMhSCUYg0UTJL0BvklYtpqpyiqfufOMRX3qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749433650; c=relaxed/simple;
	bh=yM+akVHv4W9YBKuubeZQv9dAs40wZv/IH4nFkRfF++0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=emrKjgUwQ86uZIbCcJ6eA3b1hmKuUvp7NR6RSE05ozUH/mI3bq5kLEJTmIn4wiGAyuDE9rnTT+Je7E17S+9032MBsZOHN/fbzGL0u23qZo88d6qJ7QYIV4+H12aGZnDjTKRL3NdhqVe8wA7DhduHB6hHx8Uf2TTpPYyT3UvjcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iooJH0um; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2E59C4CEEE;
	Mon,  9 Jun 2025 01:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749433650;
	bh=yM+akVHv4W9YBKuubeZQv9dAs40wZv/IH4nFkRfF++0=;
	h=From:To:Cc:Subject:Date:From;
	b=iooJH0um8lJ2F2U9RwY/7bU5A9OGkc1O7ybo2vcXAoDqVfzfMprOi6Lj3tRFZ5n/c
	 t12Rxlz71VkfVn2f0C1Z8tQj4om+EvSBfzZo3S7C+qsLENiUYBTmru5ZYqFPrZZfyJ
	 wQQIW4GPNF2+XDT74MNkdpQLiVXn648r6XhzFQmqe/umT6H//EM8WyVOYI1EgG2Lnl
	 2d3QXn4PwQimBPdVc7W7ttuuE7+RwB/JtkjUb9LrNteRw67MozkU77j7VYcLn9cpqY
	 AbgslFJ9BD4SuVxMwku1gjUYvANTsXZZhWv0v7wMd7PnAXlTvc2kqm6sKp4/VmCBnC
	 71aBb6tIRYMnw==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	dmitry.torokhov@gmail.com,
	rojtberg@gmail.com
Cc: linux-input@vger.kernel.org
Subject: [PATCH 0/2] Adjustments to xpad handling for unplug
Date: Sun,  8 Jun 2025 20:46:29 -0500
Message-ID: <20250609014718.236827-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When an xpad compatible device is unplugged there are errors in the logs
and the correct error code also isn't passed up.

Mario Limonciello (2):
  Input: xpad: Adjust error handling for disconnect
  Input: xpad: Return errors from xpad_try_sending_next_out_packet() up

 drivers/input/joystick/xpad.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
2.43.0


