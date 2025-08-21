Return-Path: <linux-input+bounces-14238-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6BB2FD61
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 16:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A8F35E21A5
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 14:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7203614AD2D;
	Thu, 21 Aug 2025 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr7QZvXF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A982EC57A;
	Thu, 21 Aug 2025 14:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755787104; cv=none; b=kCbJ9bECXgu5YwBXdExqFbg52bInRNa2WAWcvaC4VRAUkCK+YLeE4t94R3tNjEjUPHCIry8zA2Y/OsiQ4mjd/hqKfXM0rv3q0tuRL+Oh3gZhtqAmEtF7BbXrbI/wNFgro2PQ4vSgSFbUoAYck223aKVQX7dMsXLuLx+uWcS0VwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755787104; c=relaxed/simple;
	bh=ci+XWHC6JbntK+eo8OpgVrxWzQ9GdCDGAXlSRw2F/0w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B4q4yVK1j5vfNMF3/9qbhAUBmc4NyWhIA9IDqGNfxwP8wsZ4qcTCkvu+CF37JJzzsL7arYtKvupIBqBGGKwaMi7V9Zu2laZKNlFCRAEaza88QFVLAc90LBAV2FlXQNhyunVADkT1qYYbCqH6lsPVRxH1Sr4Ff+GzruLzdVdpCXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr7QZvXF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6F4C4CEEB;
	Thu, 21 Aug 2025 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755787104;
	bh=ci+XWHC6JbntK+eo8OpgVrxWzQ9GdCDGAXlSRw2F/0w=;
	h=From:Subject:Date:To:Cc:From;
	b=Tr7QZvXFxa5QMlmdilnHZSWo9z0K1KgAoC10nkA8tTfXbtymuYiblQCvpLYb8cQoz
	 ibBFOC5Rdm62fq51BvMKFEdzIUoKv1qMgcdGluz8oaDnxEI+Mro96OWce4GoEnbj7x
	 bUM6iZFqSGVj0Gvko8vdqhbhzCZ8m+xESWL1mZCrxnFmCJVXd8wTMlWuLWOYJhuRci
	 URvL1lDPjRsdvG6ldT1TP37LTTcOv1faNIdmNjq9PgF15f+T5o5egUeq+N0C+Q/2/T
	 K6OxCHLGUJcf0IpRll2gtgOn+W+KprvX8stlot6oyLhidsV8D5UNEkbqrx4CFQOgS4
	 LePNefgPUvu7g==
From: Benjamin Tissoires <bentiss@kernel.org>
Subject: [PATCH 0/2] HID: bpf: allow bpf to rebind a driver to
 hid-mutltiouch
Date: Thu, 21 Aug 2025 16:38:12 +0200
Message-Id: <20250821-bpf-rescan-v1-0-08f9e2bc01bb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQvp2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyND3aSCNN2i1OLkxDzdFBNzMxMLM9NkM/M0JaCGgqLUtMwKsGHRsbW
 1AOnZ9pxcAAAA
X-Change-ID: 20250821-bpf-rescan-d4764865c67f
To: Jiri Kosina <jikos@kernel.org>, 
 Peter Hutterer <peter.hutterer@who-t.net>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Tissoires <bentiss@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755787102; l=961;
 i=bentiss@kernel.org; s=20230215; h=from:subject:message-id;
 bh=ci+XWHC6JbntK+eo8OpgVrxWzQ9GdCDGAXlSRw2F/0w=;
 b=G1nknLlkWEDEBf53V72Lga6TBPufh/UBVIuh+GSm/HWi6YChZbs+AtJBkfdOY/gAAHRii1FsV
 GsX70Y3dGVIDd0R3IEpG2Ba6GQHzOPiigWZ1UGTVFoOTHxAVrEOfsMi
X-Developer-Key: i=bentiss@kernel.org; a=ed25519;
 pk=7D1DyAVh6ajCkuUTudt/chMuXWIJHlv2qCsRkIizvFw=

This happened while Peter was trying to fix a Viewsonic device: the HID
device sending multiotuch data through a proprietary collection was
handled by hid-generic, and we don't have any way of attaching it to
hid-multitouch because the pre-scanning wasn't able to see the Contact
ID HID usage.

After a little of back and forth, it turns out that the best solution is
to re-scan the device when a report descriptor is changed from the BPF
point of view.

Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
---
Benjamin Tissoires (2):
      HID: core: factor out hid_set_group()
      HID: bpf: rescan the device for the group after a load/unload

 drivers/hid/hid-core.c | 44 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)
---
base-commit: f55f91622e6f10884d30049f6748588b3718eecd
change-id: 20250821-bpf-rescan-d4764865c67f

Best regards,
-- 
Benjamin Tissoires <bentiss@kernel.org>


