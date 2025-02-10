Return-Path: <linux-input+bounces-9870-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 103AFA2E366
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 06:11:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DABC43A540E
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 05:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC7115ECDF;
	Mon, 10 Feb 2025 05:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="PCeQxUKu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCD22F2A;
	Mon, 10 Feb 2025 05:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739164309; cv=none; b=BcEfbIGGHi7ZKjDZZuKqVxhXNW59B6a0v0tDXXa0+3yXAy08MqjmuhLMXqVcS1s1vtcTn6+5LJeYWlfo8h2O679OGQjzH4vKhs6H8GmoH/w22vZ0K7pyvSLanCkJikMOaNMJBlUAmZR2R1DUyNY9dPevXok2uALJea5vUn8JJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739164309; c=relaxed/simple;
	bh=RQuRbRVR4UVdNA2DTvombWmk52eOlM6uT7ww0MINmqk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hRUIXcZuLAhQ7QxCjXnJtgEPmBWeUHc4V2rjpHzm+RpE6ZyXPZzYUrfujRm+kC+rxBADv+UgA6MT3HiJZ9USkv9cFIX2GRlbB9Q4z+E604A+r9E4kPcGB6K2qd67rVSTn2udZYFBBpFZLKkuPGVspSYJylvZGWrog+vWOfOjP7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=PCeQxUKu; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01EDCC005F;
	Mon, 10 Feb 2025 00:02:26 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1739163752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L1jlj0wPzzLrmKzJ7Nl7eXF/I+hE7k1lnyTM+YRlftM=;
	b=PCeQxUKuG2V3pxhNEVpDmONBujXsehzzNkgZ44Ezw4gzCl20o04acNvJcuDLuLcWqLpx/q
	D32EfmOzBHh2o83RTnO7bEu2OMqGF7ffeozdUIq0TyEQCfk6cK9PrslpSAtuI3qQLAtFCG
	xSRg9OIySFFxMEjhWcaCjJdtQL41snY=
From: Felix Kaechele <felix@kaechele.ca>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] Input: rmi_i2c: introduce reset GPIO handling
Date: Mon, 10 Feb 2025 00:02:08 -0500
Message-ID: <20250210050220.634497-1-felix@kaechele.ca>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This patch adds handling of the GPIO reset line on Synaptics hardware
using the rmi4 driver.

The syna,reset-delay-ms device tree property is already documented in
the bindings but was seemingly never implemented in the kernel driver.
This property can be found being used in some downstream dts files,
mostly for Qualcomm-based smartphones.

Adding support to the mainline driver makes devices that require
asserting the reset pin work properly.

Cc: Barnabás Czémán <barnabas.czeman@mainlining.org>

Felix Kaechele (1):
  Input: rmi_i2c: introduce reset GPIO handling

 drivers/input/rmi4/rmi_driver.c |  1 -
 drivers/input/rmi4/rmi_driver.h |  2 ++
 drivers/input/rmi4/rmi_i2c.c    | 23 +++++++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)


base-commit: a7550ff59edfc768a8600c1e5c24c304208696a5
-- 
2.48.1


