Return-Path: <linux-input+bounces-14366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE35DB39718
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 10:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8155E1B36
	for <lists+linux-input@lfdr.de>; Thu, 28 Aug 2025 08:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6D721C166;
	Thu, 28 Aug 2025 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acksNDrO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BDA1E47C5;
	Thu, 28 Aug 2025 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756370181; cv=none; b=HEmml2HyBoGXi7h+IeoOWnsiJwDRcLLJq1V2AUWoO7z1++E4p0SA/UMQfRQ6jo6BX3FuDJSNiB6fRZJP4Sab/3W7ZvSQdGkt1Ry1LUmzJ4I3NdL8ait+iB3XFgkOGC1v97l07e63eEQ3MovgA6r9KMQcwzgrRWDKxoNrsq/OPi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756370181; c=relaxed/simple;
	bh=7ZAAcxyHx+pgUA7PYtgrFdWy1bB9tScFDnnps51MMmE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K0G6BQ2tkk0MiQXMw9yVcj93kPciOt0OyIjXZCslgzJzZiOmKuhYGZj4xgravuFZKKnKEv8YbJcdlB5TEhztzLethWP1Hc+riNSNGLlL95YVQN8h3HBy2YJX4iT9uSBkI3ojRQCxXE9UUKWS9RSD7/eN3xGsv6vJk4F9MzGELnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acksNDrO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F13C4CEEB;
	Thu, 28 Aug 2025 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756370181;
	bh=7ZAAcxyHx+pgUA7PYtgrFdWy1bB9tScFDnnps51MMmE=;
	h=From:To:Cc:Subject:Date:From;
	b=acksNDrOCZ5mYiTfQZBsEC/xFige0fUcOwR2YQPju0SI8qe/xa5t4bUw9a8RWvdaG
	 UD/fYaAZkDpXxN3/ns4S5fqB6V9vqH9onDDYBhq8V358HEjNLcO5pXC+oGn0T7WRnx
	 b6qslOKdQ6IBm2Fqkl25FltOwkrCmFVjaBHc8KltaHYmSXA09Cxfs61GA+VcwGGVQu
	 dhUo3R8KnRydhOA6s13FSHmEDd7UmRQE1SXoP2uoefzaqajj4RVgbQKHUBjaHN0C+C
	 CwY9FQ2U0jBA8gDX3NarqSXhjbrIadW2/ncH4xZx9Vw3gMzzLeMOBMG/gLY51SV2I3
	 yLlvD1HR2vdIA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Date: Thu, 28 Aug 2025 08:35:56 +0000
Message-ID: <20250828083601.856083-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0.268.g9569e192d0-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
probed at the same time.

Example:

+ -----------------------------------------------------------------+
| Some init process (e.g. udevd) | deferred_probe_work_func worker |
+ -----------------------------------------------------------------+
| Probe cros-ec-keyb.            |                                 |
| - Decide to defer[1].          |                                 |
|                                | A device bound to a driver[2].  |
| Probe cros_ec_lpc.             |                                 |
| - Init the struct[3].          |                                 |
|                                | Retry cros-ec-keyb from the     |
|                                | deferred list[4].               |
|                                | - Won't defer again as [3].     |
|                                | - Access uninitialized data in  |
|                                |   the struct.                   |
| - Register the device.         |                                 |
+ -----------------------------------------------------------------+

[1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
[2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
[3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
[4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418

Note that the device link[5] can't help as in the observed environment,
the devices are already added via device_add()[6].

[5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
[6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177

The series fixes the issue by ensuring the struct is ready for accessing
before continuing to probe cros-ec-keyb.

The 1st - 3rd patches are preparatory steps to allow the per-device lock
can be used even if the struct cros_ec_device is unregistered.

The 4th patch introduces a new flag `registered` and use the lock for
protecting the flag.

The 5th patch defers probe if the struct cros_ec_device is not ready yet.

Tzung-Bi Shih (5):
  platform/chrome: Centralize cros_ec_device allocation
  platform/chrome: Centralize common cros_ec_device initialization
  platform/chrome: cros_ec: Separate initialization from
    cros_ec_register()
  platform/chrome: cros_ec: Add a flag to track registration state
  Input: cros_ec_keyb - Defer probe until parent EC device is registered

 drivers/input/keyboard/cros_ec_keyb.c       |  6 ++
 drivers/platform/chrome/cros_ec.c           | 85 ++++++++++++++-------
 drivers/platform/chrome/cros_ec.h           |  3 +
 drivers/platform/chrome/cros_ec_i2c.c       |  9 +--
 drivers/platform/chrome/cros_ec_ishtp.c     |  6 +-
 drivers/platform/chrome/cros_ec_lpc.c       |  6 +-
 drivers/platform/chrome/cros_ec_proto.c     | 15 ++++
 drivers/platform/chrome/cros_ec_rpmsg.c     |  6 +-
 drivers/platform/chrome/cros_ec_spi.c       |  7 +-
 drivers/platform/chrome/cros_ec_uart.c      |  6 +-
 include/linux/platform_data/cros_ec_proto.h | 18 ++++-
 11 files changed, 103 insertions(+), 64 deletions(-)

-- 
2.51.0.268.g9569e192d0-goog


