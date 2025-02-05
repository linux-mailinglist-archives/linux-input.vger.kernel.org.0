Return-Path: <linux-input+bounces-9804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E7BA29851
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 19:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB927163497
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2025 18:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBD11FC0F4;
	Wed,  5 Feb 2025 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZb41hsV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C51FCD07;
	Wed,  5 Feb 2025 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778645; cv=none; b=Ym7Yr0vPYRbWpt8DQS0PeJkMvCa9M6Fr2BenIWSy1ZiPkmpoSdNrb7WuEnKGUCjcGxRORbTBqjkwrRQGQivh0W5Y+bl05N9P04S9x0F5F3q0Ju6V9ht115GiihlNpxg8ZTB/WHLTmShIo+7WaxCSnpoP4MpGh7bzCuboq5xH2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778645; c=relaxed/simple;
	bh=b/S0S4ms8ZtF26zFZfnCQQsbI1iT5ddXsOUo6Ul5rI4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAuan5kUs41pK9aX35kli8QZH6UGY5hEDjmlIB1dtUTwqF0XUpnCWBn7ctwb5RHCAOto5S5gPnlFTk0uuPKNwtPS/aeE/rM0qAIgDMtV2EwFSWuR1d/xk/FqsCmk307LUqNloDzxXVnYYHIHZDNEqzSX/nqiKLiZTqJH7et82r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZb41hsV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA2CC4CED1;
	Wed,  5 Feb 2025 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738778645;
	bh=b/S0S4ms8ZtF26zFZfnCQQsbI1iT5ddXsOUo6Ul5rI4=;
	h=Date:From:To:Subject:From;
	b=jZb41hsVjPVpDNEf3EhWP0M7DWzXhFUSMVoo2pKjPvAWZonwjRjEzNcjyT8a1Kggh
	 1TPu8adyQ8q8oyv/l6GoVQKNTfjeNdW/E09agnqHwbAbJuMDkzd8qn378hd7Ft1Yi2
	 BEhXzg6wAg1mXoeNRZpA9hMKFq9SAEEzhOQAnGOeBpG6cw2wvqyoZt3ZjOt2KCtF8f
	 x/zW4GnR45edqSv8tNEohs/5QFs1hPFaq+XjANZso+02vwz0ahCzxvQAwc97rHmRTi
	 W5l46M6SUTa3JPwyBemgJ5xx8maoxSKww1iJNXS80rVGLgM9cGOWRlsTsojQOZRxdf
	 5CRHc9xiZy04w==
Date: Wed, 5 Feb 2025 19:04:02 +0100
From: Helge Deller <deller@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [PATCH] Input: gscps2 - Describe missing function parameters
Message-ID: <Z6OoEnJFW118IuP0@p100>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Avoid compiler warnings when building with W=1 by adding documentation for
the missing function parameters.

Signed-off-by: Helge Deller <deller@gmx.de>

diff --git a/drivers/input/serio/gscps2.c b/drivers/input/serio/gscps2.c
index 4fada5bc2a38..9c6ff04c46cf 100644
--- a/drivers/input/serio/gscps2.c
+++ b/drivers/input/serio/gscps2.c
@@ -251,6 +251,8 @@ static bool gscps2_report_data(struct gscps2port *ps2port)
 
 /**
  * gscps2_interrupt() - Interruption service routine
+ * @irq: interrupt number which triggered (unused)
+ * @dev: device pointer (unused)
  *
  * This function reads received PS/2 bytes and processes them on
  * all interfaces.
@@ -329,6 +331,8 @@ static void gscps2_close(struct serio *port)
 
 /**
  * gscps2_probe() - Probes PS2 devices
+ * @dev: pointer to parisc_device struct which will be probed
+ *
  * @return: success/error report
  */
 
@@ -420,6 +424,8 @@ static int __init gscps2_probe(struct parisc_device *dev)
 
 /**
  * gscps2_remove() - Removes PS2 devices
+ * @dev: pointer to parisc_device which shall be removed
+ *
  * @return: success/error report
  */
 

