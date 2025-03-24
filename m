Return-Path: <linux-input+bounces-11131-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A03A2A6D3BE
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 06:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00AE8167EAA
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 05:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C50B22339;
	Mon, 24 Mar 2025 05:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="FIKPGMiK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XPjjb/eJ"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D1F2E3392;
	Mon, 24 Mar 2025 05:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742794703; cv=none; b=b6Mf3gK+73kggmS2czeo7KqU6PX+rCgdacxXeukZg1yJAD4fqHquzJQaaoegcxFtqtEoa1MF+ujnWoq9xznXLa79SVni8QMdlxBqjwTWQHLVmDyWlH76Cd7Rs0kjRC94OsVlqBuXfZ0eRosW1r8sE26e92lX6NaGfNlNl8ruMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742794703; c=relaxed/simple;
	bh=g/VzOJfo7GzzqaZ2wRFuw+/ngchPBkepmxgltEoYduE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TTxNHeR/YNyLGXVibT34G4Ym7XHzq2n1y1E8vhSwCBo+aEoM/t0VfydafDBlErvR29WOBbKh4ydsNUjAebl4AxB5dd9mQNlhQ77c7OsI/vxu1sQCT8IthgwY27qHzuzAEe/BG02yYUxMFsL242EeK7vvBxVVVjjAf5/Cl7tlsC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net; spf=pass smtp.mailfrom=who-t.net; dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b=FIKPGMiK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XPjjb/eJ; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 1464F1140107;
	Mon, 24 Mar 2025 01:38:20 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 24 Mar 2025 01:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
	 t=1742794699; x=1742881099; bh=VHN8RYiVxdh4pY4Zl3p5WIG0J/h0Gyla
	y4ga31AVAxE=; b=FIKPGMiKtJJniRksri0AwmOMUMlWrasoyTihBgKcK/Yedhr1
	R9voc7a3cYu+/3ETZYPnVaPWc9ooykqrcUtq+DoOGcaaH0CHwo7ttWAoF2iiSheT
	GepJD96JPGnFOV35C2bXvHXKLOQfQcY4Q5hZNeVZossMosJr5nixeYroywt9XJwV
	bUxgp6vIVanaVlQwlrSNuyGL3Y7cDxltmUGI6EZ9Y24RR6jRCmirDrWq79rAsg/o
	MzP6NUb6YE4HqVAjNpZE51q6yTM1ZWDv+XACiIn4vATSiL8bRh9ENODnrCWouWg2
	kRE7bfrfpxYdyj3bkmT4OPYGWE9i7AbuGDjk2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742794699; x=
	1742881099; bh=VHN8RYiVxdh4pY4Zl3p5WIG0J/h0Gylay4ga31AVAxE=; b=X
	Pjjb/eJQvzNjtcbNU04NNxBFt7eRq35yzD9x5wMCOLiEs/uY2kACpqxZ7X3uYNtC
	fAXfWNhsbsCgbXy85kXnxT55oe7OUlHkCqe3Hai1kqQlicy95IYBMo2imal705nD
	UwbyR7F48iDemMdnGtwyDgwxd5cV5qJoQ86XS7tA7yIO1v/f1iuMnk0kJO+s9TQb
	x+PboxZIf5cz8sWjwyqHmhW0Z9y0ZGIAXOdtfmY+E38aXBSin3cz1v53Y8F8F+PB
	h2jIf1yJPtI90mXEk7NUIz2QA46aGFMTxYe0eSJ3qbKbD8udGWyvHyOFw9/VeH5B
	1EJDmvMAV2CMi2XXCfaNw==
X-ME-Sender: <xms:y-_gZzZurhd9eUDCoiCrYOrT5uOiEUfX8zBHOcJDFsl8pHV7ybKyCQ>
    <xme:y-_gZyaNB4K_akqwNPASnwa4Ko2QyCnsoDIVA3ze-1AkChY4PC_dZqg3JjIRLsMZB
    AwU3n1VJRKZn1zLLXI>
X-ME-Received: <xmr:y-_gZ1-VbzBphl45fIHdVSJJPzrC63NRG23z0MpppJj4ukro7DLHOx57bRr5PaGJMiFvqAhxONRPBlAOt5mXPQtTqEyu-ppQPxHH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheekleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkgggtugesthdtredttddtvden
    ucfhrhhomheprfgvthgvrhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvg
    hrseifhhhoqdhtrdhnvghtqeenucggtffrrghtthgvrhhnpeeiueeuueeltdetuddtudeg
    tdduvdfgieduteevlefgudefteduudegtddtffdtfeenucffohhmrghinhepfhhrvggvug
    gvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgep
    tdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhuthhtvghrvghrseifhh
    hoqdhtrdhnvghtpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhish
    hssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhinhhpuhhtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:y-_gZ5pfLTr_YcovJj1aTPilRN55uuH3GJS9lNJZYwAjSn_HbYgjRQ>
    <xmx:y-_gZ-rUcXPyP5bryIESXqbW6MRHzNk5B--HQRAwwiSgukz60LPvmA>
    <xmx:y-_gZ_R_YCHALdMbZT2_hxkIP62J6-iXQesfqJQDdKCSNk5O3k2b6w>
    <xmx:y-_gZ2pEmejqdL5heCGyN1QPfdjuGtCwf7o16C7TrLDpEA4MlA2zhg>
    <xmx:y-_gZ3k2gzsLmNCzc-jiGvkU7C86UzpQvREvgCXPpqJ_188WKHVtlNZv>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Mar 2025 01:38:17 -0400 (EDT)
Date: Mon, 24 Mar 2025 15:36:25 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] HID: bpf: fix BTN_STYLUS for the XP Pen ACK05 remote
Message-ID: <20250324053625.GA79579@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Usage_Dig_BarrelSwitch was applied in the UsagePage_Button
which incorrectly mapped to BTN_TOOL_PENCIL

Link: https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/193
Fixes: 834da375 ("bpf: add a v6.11+ compatible BPF fixup for the XPPen ACK05 remote")
Link: https://patchwork.kernel.org/project/linux-input/patch/20250207-bpf-import-2025-02-07-v1-7-6048fdd5a206@kernel.org/

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
---
Please feel free to squash this one into the 834da375 if that's an
option.

 drivers/hid/bpf/progs/XPPen__ACK05.bpf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git ./drivers/hid/bpf/progs/XPPen__ACK05.bpf.c ../drivers/hid/bpf/progs/XPPen__ACK05.bpf.c
index 1a0aeea6a081..a754710fc90b 100644
--- ./drivers/hid/bpf/progs/XPPen__ACK05.bpf.c
+++ ../drivers/hid/bpf/progs/XPPen__ACK05.bpf.c
@@ -157,6 +157,7 @@ static const __u8 fixed_rdesc_vendor[] = {
 			ReportCount(5) // padding
 			Input(Const)
 			// Byte 4 in report - just exists so we get to be a tablet pad
+			UsagePage_Digitizers
 			Usage_Dig_BarrelSwitch // BTN_STYLUS
 			ReportCount(1)
 			ReportSize(1)
-- 
2.49.0


