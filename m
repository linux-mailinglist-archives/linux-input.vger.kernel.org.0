Return-Path: <linux-input+bounces-9829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A624A2B6B2
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 00:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E42DC165AB4
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 23:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7F222654C;
	Thu,  6 Feb 2025 23:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="AxPaYuDK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp-fw-52002.amazon.com (smtp-fw-52002.amazon.com [52.119.213.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627A2417D3
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738885694; cv=none; b=GE6XK5vQNhhAbtevj+QW+3rnkVr5mydAT1ZKjCpTp7PG4jmAA6HoX2yOMx8YSjuDiIXapWtjlRNrgLehaeaM3Ea1pd6ZSCHcuhD3LnGo5BJ2YhL4S3eXK8bHuJu33kR41qnCdt/lqivew46jo6K64OO1qx3Onhx1ypOLyY5Gm+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738885694; c=relaxed/simple;
	bh=OvrpRpGBrZZQdL8g7PQ4SX3eI8PzBCPkf2bmY2zLVjs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gDSn2TbCKjfKmhruOg00DUKKIHgFy9GAgXeSA6cIoIv/QATSS6u+DUeiscmcZd6Pu+SAP1cc/LCqo6TjclZsSQW5MgRjydYoBHNP6PHtRQpZVD4T2feZsE4qsBAVyf880TTLeAWO8x0+f+bPE8kp2vdwazPKsDstdfVPyjrPzys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=AxPaYuDK; arc=none smtp.client-ip=52.119.213.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1738885693; x=1770421693;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X4RBbFCLiqizmL7A5Hgx7uooVzX3df3f+aafU8GttOM=;
  b=AxPaYuDKN7CfOEb663pHC/aiQ1mIwUCl+kdDYsawhGi9nd5WyFVet3Z6
   JCnyjQ3I7jz7KAeyLj1puykMAbv5jOSH8J3wKWekH9aBrNKGm1TULI8cS
   et9z/YEvofL/Vb1VtTdf8FtyDEPNiXdSjjEOwTI8ruN8UoDJWu0sFSnMb
   g=;
X-IronPort-AV: E=Sophos;i="6.13,265,1732579200"; 
   d="scan'208";a="695066299"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 23:48:11 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.38.20:25661]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.10:2525] with esmtp (Farcaster)
 id 6f063ada-c150-4cb9-adf7-b9406e979d1b; Thu, 6 Feb 2025 23:48:10 +0000 (UTC)
X-Farcaster-Flow-ID: 6f063ada-c150-4cb9-adf7-b9406e979d1b
Received: from EX19D006UWB001.ant.amazon.com (10.13.138.59) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 6 Feb 2025 23:48:03 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D006UWB001.ant.amazon.com (10.13.138.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Thu, 6 Feb 2025 23:48:03 +0000
Received: from email-imr-corp-prod-iad-all-1a-47ca2651.us-east-1.amazon.com
 (10.43.8.2) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Thu, 6 Feb 2025 23:48:03 +0000
Received: from dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com (dev-dsk-dhenrale-2a-9787ff00.us-west-2.amazon.com [172.19.238.164])
	by email-imr-corp-prod-iad-all-1a-47ca2651.us-east-1.amazon.com (Postfix) with ESMTPS id C090F4023B;
	Thu,  6 Feb 2025 23:48:02 +0000 (UTC)
From: Alex Henrie <dhenrale@amazon.com>
To: <thunderbird2k@gmail.com>, <roderick@gaikai.com>,
	<roderick.colenbrander@sony.com>, <jkosina@suse.cz>,
	<linux-input@vger.kernel.org>, <alexhenrie24@gmail.com>
CC: Alex Henrie <dhenrale@amazon.com>
Subject: [PATCH v2 0/2] HID: hid_have_special_driver fixes for playstation driver
Date: Thu, 6 Feb 2025 16:44:44 -0700
Message-ID: <20250206234708.7214-1-dhenrale@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205202532.2586-1-dhenrale@amazon.com>
References: <20250205202532.2586-1-dhenrale@amazon.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Changes from v1:
- Add a second patch to enable the hid-playstation driver for PS5
  controllers

Thanks to Roderick for your feedback.

Alex Henrie (2):
  HID: Enable playstation driver independently of sony driver
  HID: Enable playstation driver for PlayStation 5 controllers

 drivers/hid/hid-quirks.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

-- 
2.47.1


