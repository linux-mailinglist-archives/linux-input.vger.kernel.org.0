Return-Path: <linux-input+bounces-10730-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A1A5D7D9
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 09:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C6C169E3D
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 08:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B580230278;
	Wed, 12 Mar 2025 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gok7tGpa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FF7A94A;
	Wed, 12 Mar 2025 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741766905; cv=none; b=GJvujqGouVRr+YKX5WnbYWHFSTPCznfNqfXBmtTQLEh2O/GlCcO05OuY7FaJ0Ig2HPjMVWITFge1/82j9vUUdp9fgXeQJmaelApvNuQ5fwzkBCgEO33zKA0uMXKqqHSHTfvP6gXNbbvtNqPj7vyJILVNN0nd22XRDQn48NyktUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741766905; c=relaxed/simple;
	bh=9Z5jsYiK81qAnjfa5azm4CeqbWktXoLhQ8QfCpB11c0=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=mSr16CVZGykyfviCC2IvpVhehmj39JlvOiGZMsc+vKx4+R0W1L7OqsBD9XEqndusB/w/rcoP+DfkgoIZU1mOP9xiumCFNmzprlSC63FyB03iWgsXLCoN1G9Q+VOoDPCKAWskbLvhEXO7KIsDQfWgD1/d7Ak1HYx7k63UYHUsfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gok7tGpa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8154EC4CEF0;
	Wed, 12 Mar 2025 08:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741766904;
	bh=9Z5jsYiK81qAnjfa5azm4CeqbWktXoLhQ8QfCpB11c0=;
	h=Date:From:To:cc:Subject:From;
	b=Gok7tGpaTClZOQI2k+XxVj4RcWhxp73enzY8xWkw13xCdP9+0k88Vu33Qu5aAZXBY
	 IK3T4o0IgW+5xVbVU1mzAKbqB1SRZEkcdRanYxYumnwoPjffmAd31pYbhZrED2XVYh
	 fc947+cPYDqhQfDyI/2kKCMtsPXXUOXWN8ZgmIn1jzUo5cnJp0T2xUgoE4w7dIvOja
	 BAv0hO0Edx/bTBosG53USWaV8QHuBkTy8N2pvu2iLrWI2sDVysHI6RpHMzY/wtIWcg
	 7VvLViPFSGEiljRhQqKbJjp1vWg1Kas2PzoSu8k08LKM3iqwcjKKXb/RoVtoQf+IRl
	 o4RZKer+jSs6g==
Date: Wed, 12 Mar 2025 09:08:22 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>, 
    Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
    Nick Crews <ncrews@chromium.org>, Jett Rink <jettrink@chromium.org>
cc: Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-input@vger.kernel.org
Subject: [PATCH] HID: remove superfluous (and wrong) Makefile entry for
 CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER
Message-ID: <54o2s270-779o-q635-37o5-7s0o11o74o25@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Jiri Kosina <jkosina@suse.com>

The line

	obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)   += intel-ish-hid/

in top-level HID Makefile is both superfluous (as CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER
depends on CONFIG_INTEL_ISH_HID, which contains intel-ish-hid/ already) and wrong (as it's
missing the CONFIG_ prefix).

Just remove it.

Reported-by: Jiri Slaby <jirislaby@kernel.org>
Fixes: 91b228107da3e ("HID: intel-ish-hid: ISH firmware loader client driver")
Signed-off-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/hid/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
index 482b096eea28..0abfe51704a0 100644
--- a/drivers/hid/Makefile
+++ b/drivers/hid/Makefile
@@ -166,7 +166,6 @@ obj-$(CONFIG_USB_KBD)		+= usbhid/
 obj-$(CONFIG_I2C_HID_CORE)	+= i2c-hid/
 
 obj-$(CONFIG_INTEL_ISH_HID)	+= intel-ish-hid/
-obj-$(INTEL_ISH_FIRMWARE_DOWNLOADER)	+= intel-ish-hid/
 
 obj-$(CONFIG_AMD_SFH_HID)       += amd-sfh-hid/
 
-- 
2.43.0


