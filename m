Return-Path: <linux-input+bounces-12777-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABECAD42DC
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 21:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 978937A35DD
	for <lists+linux-input@lfdr.de>; Tue, 10 Jun 2025 19:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD359263F38;
	Tue, 10 Jun 2025 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ffsNmdUA"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592F23AE83;
	Tue, 10 Jun 2025 19:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583611; cv=none; b=DnRtdQi6fG37qjdpDbB1aXGMf2yDdjlpYite+mJ65AWFM/PKQj06hC2DiN3Xibx7SAZa8oeYz/wwi9jB4hbbUryVSfp4UsDLDkZYj0zbvbtwq/h5Wqc8w4P3YCVE24CmVrUEi7Rjf9Lb3lBLmT9Sa1hrXAfjF5FxvYmW2NFnIkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583611; c=relaxed/simple;
	bh=B1731WGlq5ZYQEHLJSCoY+viCqv8V/qH6BFMdj/tGyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s9SOhb9ExeDBbP/dCvhMN6lwSF8ON4InAAqE2PADcZRxY5/KE3e+xRBRbXlaQ4t3KG/4cIXhzyvGoVtfROVH4EvNbAcWpQhcE9fpKOCr0pvd9+/xRvmqBoSYmE2tPgqtJre/+6xlwFBb1VsX9EsM6T6i6vJkgT+t7uguMZHWJy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ffsNmdUA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBBD6C4CEED;
	Tue, 10 Jun 2025 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749583611;
	bh=B1731WGlq5ZYQEHLJSCoY+viCqv8V/qH6BFMdj/tGyM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ffsNmdUAFmDLNU/j9JbHyeu9SCLw9KDih+rj6b6ylCdCiH019CQr22Xjxb2uRTobz
	 YpbJijch0YiONR4okgobPpwh97ytzEN4/NgkXB2efVWCD9DTM1M+Bq5AQk1qG+Gq0p
	 /LCDzx4I/HxEbVIQFt6wPQUcyhdyYbfADOVgEgxEPn1BymUhbdbAXOszeB8MCTsFYe
	 rFvb76V5ZATtulcCf1VpBqNCgJC+Lx5tWdyPfcs6tK7MGt8zOraKYwxFR/cP5e0F2q
	 bXyzEiryREVLFEXgCljwSN246yMw4/eTLFYItKuvuacHp5OKGIKVk38OeGZbEEzjB5
	 rmTgIEQNDAY+Q==
Date: Tue, 10 Jun 2025 21:26:48 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: kernel test robot <lkp@intel.com>
cc: Even Xu <even.xu@intel.com>, bentiss@kernel.org, 
    oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@linux.intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-doc@vger.kernel.org, Chong Han <chong.han@intel.com>
Subject: [PATCH] HID: intel-thc: make ptl_ddata static
In-Reply-To: <202505171535.Yrj5T8jh-lkp@intel.com>
Message-ID: <r55n2p5s-1rno-n14q-8n6s-7737pr4655p4@xreary.bet>
References: <20250514061944.125857-8-even.xu@intel.com> <202505171535.Yrj5T8jh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Jiri Kosina <jkosina@suse.com>

ptl_ddata is local to pci-quicki2c.c, so it'd better be static.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505171535.Yrj5T8jh-lkp@intel.com/
Signed-off-by: Jiri Kosina <jkosina@suse.com>
---

This is now in hid.git#for-6.17/intel-thc

 drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
index 208e933e23d8..e944a6ccb776 100644
--- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
+++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
@@ -21,7 +21,7 @@
 #include "quicki2c-hid.h"
 #include "quicki2c-protocol.h"
 
-struct quicki2c_ddata ptl_ddata = {
+static struct quicki2c_ddata ptl_ddata = {
 	.max_detect_size = MAX_RX_DETECT_SIZE_PTL,
 };
 
-- 
Jiri Kosina
SUSE Labs


