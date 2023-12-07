Return-Path: <linux-input+bounces-577-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F28080F3
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 07:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0E991C209D2
	for <lists+linux-input@lfdr.de>; Thu,  7 Dec 2023 06:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE7B12B79;
	Thu,  7 Dec 2023 06:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="Zoy9TCBL"
X-Original-To: linux-input@vger.kernel.org
X-Greylist: delayed 572 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Dec 2023 22:44:01 PST
Received: from endrift.com (endrift.com [173.255.198.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFC0D62
	for <linux-input@vger.kernel.org>; Wed,  6 Dec 2023 22:44:01 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 9A132A26E;
	Wed,  6 Dec 2023 22:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1701930868; bh=2kBvNVJtVywUoIBHRTvqaNJxMQubVU7/aaghrciAqzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zoy9TCBLueVCAUzUu1gVrvNcOStdgB9YGyNrmgBZ2zhcYlgL5mH63A9Dc+jMyIsWH
	 GVPmmkpCxZ3BNq1fwyrDk+30VI4pl+in+skZGZ1HiNkJeVgA3R38zbVZgbv/sO+EqX
	 b4BHrQl+To2lKht1rvO0biq2DAdVPhzGyU2M8IVmv7KLHVCFSYBfoZy4WkDHxnAPHD
	 EeMeQZ8nckDmYbQ5qgjo2RJ4g2SrFQJN2fJp+05yM17IHb5N9xvYn8cpclMO3yHpjs
	 0nGBkzacUF9j3ykpUos9e6f504a982ej25K58VKCscslIkmZWtqKEGX0M4UQe9eZtx
	 gAn+eKit+Efeg==
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 1/2] Input: uinput - Allow uinput_request_submit wait interrupting
Date: Wed,  6 Dec 2023 22:34:05 -0800
Message-ID: <20231207063406.556770-2-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231207063406.556770-1-vi@endrift.com>
References: <20231207063406.556770-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, uinput_request_submit will only fail if the request wait times out.
However, in other places this wait is interruptable, and in this specific
location it can lead to issues, such as causing system suspend to hang until
the request times out. Since the timeout is so long, this can cause the
appearance of a total system freeze. Making the wait interruptable resolves
this and possibly further issues.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/misc/uinput.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index d98212d55108..0330e72798db 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -183,7 +183,11 @@ static int uinput_request_submit(struct uinput_device *udev,
 	if (retval)
 		goto out;
 
-	if (!wait_for_completion_timeout(&request->done, 30 * HZ)) {
+	retval = wait_for_completion_interruptible_timeout(&request->done, 30 * HZ);
+	if (retval == -ERESTARTSYS)
+		goto out;
+
+	if (!retval) {
 		retval = -ETIMEDOUT;
 		goto out;
 	}
-- 
2.43.0


