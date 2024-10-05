Return-Path: <linux-input+bounces-7095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD95E99169C
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 14:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF87B1C21A3B
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2024 12:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE90145348;
	Sat,  5 Oct 2024 12:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b="QA08mRHy"
X-Original-To: linux-input@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E33482D91;
	Sat,  5 Oct 2024 12:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728129826; cv=none; b=kZltX9y1N4rJv4wJMuXtvYL3INYKYtdfsEVh7RkhY7LWExfzlqgX19OC8GIWGyEWSOdLP5lNm/MTurhOztRrY14x3T/3v5M9NG6tmy0vGaVORSjlFah6n0KRGGFXNCGPJFPgiVm2H99t7RGxO7RsdIPbpYT8+SWJa9yu6lXfXdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728129826; c=relaxed/simple;
	bh=b+tC7wTVsYnbjNDHIqDYPUyLMUv94zugrCVQoonnx+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SUYzcb68Gx4khZXSyX3X0VC3bSSLtjf9ienImoquVTijhK6l5myku+ToZJXigyehh/gP1Udj0KftA5J/ar88IL49ZYhqBisMIPz1tKUmAUoWwhU3fdew9tA0Npmbk7bjsZIMolCuy/MRNjcPDmtjr/zXyOcYDSJadEasxDgOuBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com; spf=pass smtp.mailfrom=lodewillems.com; dkim=pass (2048-bit key) header.d=lodewillems.com header.i=@lodewillems.com header.b=QA08mRHy; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lodewillems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lodewillems.com
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4XLPFg0lcHz9sqH;
	Sat,  5 Oct 2024 14:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lodewillems.com;
	s=MBO0001; t=1728129815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uTzVXYUxoAhjNTsfPGGzOIqTSoUfDKgg+F7VcwtTZXY=;
	b=QA08mRHyHaBSqgyjSQ0zEEBiXMV/UcWTHPXF0Q3dx6xa0LW6oHOkyPO1dnHFxnI2jqrgF5
	yJVtlflokugE2xqNs6gNtVW+yUAkdlkBZoe4TQyU3jVA0QXI/+lxyMQIXXLr5XlRRXyDVj
	xCwsKsSmF8QuRyxKbp7ab1NeLQZu8TWgGkWgjoPukjV6WMt7JemlT/otKuhwKHBYhlRSjI
	lGlWRda/SuYW/DJuTmkSLFDUUfHIP6PFGVPIfuqLcR6gBctP+YOujV5RP0NJ7GXbYIKsh9
	17FueWjhLb8wy8hk0ls9Fm2B4PmKnyYKd9AJB2crXKsjIhU9/H5n3w5yPLgODA==
From: Lode Willems <me@lodewillems.com>
To: linux-input@vger.kernel.org
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-kernel@vger.kernel.org,
	Lode Willems <me@lodewillems.com>
Subject: [PATCH 0/4] HID: add Kysona driver
Date: Sat,  5 Oct 2024 13:57:02 +0200
Message-ID: <20241005120256.13847-1-me@lodewillems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds a driver for the Kysona M600 mouse
with support for battery reporting.

Tested with a Kysona M600 V-HUB Special Edition

Lode Willems (4):
  HID: Add IDs for Kysona
  HID: Kysona: Add basic battery reporting for Kysona M600
  HID: Kysona: check battery status every 5s using a workqueue
  HID: Kysona: add basic online status

 drivers/hid/Kconfig      |   9 ++
 drivers/hid/Makefile     |   1 +
 drivers/hid/hid-ids.h    |   4 +
 drivers/hid/hid-kysona.c | 248 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 262 insertions(+)
 create mode 100644 drivers/hid/hid-kysona.c

-- 
2.46.1


