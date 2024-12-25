Return-Path: <linux-input+bounces-8762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E49FC331
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 02:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC629164E44
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 01:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70B517BA3;
	Wed, 25 Dec 2024 01:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="mU2b1O8+"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB662581;
	Wed, 25 Dec 2024 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735091717; cv=none; b=IdrxuV+5oay7YuVPd+bc+mG4yQETA0kepZIc9J/Mww113bIcoD4d9b8f1lxzrcALwm78oEZGfowvEnv7d9lHLLi/eU7C5CqKXDkS4d14cIKW51ABbnP5aK+OdJyUo3mHDz9w6Ps2vUYhleLP7HToqzHsizHm9XqsQr69AhfErdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735091717; c=relaxed/simple;
	bh=iybJcfwJ4rSL5i1A6BkxWBBACwSiUwgob5wGKtuP/KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B849M9cia2eAwwbv894WidPEDyyjFZFqo8Fbqc4WUFxYg+SjsJ6EfhzToK02dA433gpIhEaV5DrvX1lr3r/BHxbnQt0XlCQ+vv5T2reZrOr6Sa7l3zux39hrmufHW0bTrbtD/4TC5Z9Ahsp75yb3uq7g/Mp2X0pys0qUx8UpjjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=mU2b1O8+; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=3V3xeppvBaTjMu7mYTgUvYK5hmQ2ifRluYRdLh10P4M=; b=mU2b1O8+eyUneDeN
	ntuuGzC+44VSYc1NfIyIM4la/rWN3Z/FvX5+KeIMMWQh+KesAfI3S0nUzKWLWB9nN3RI8I266Eh7h
	dH33MVnLwX6CZIEpBlWwUT+fXLwTcjuAQBs2OJqQ0DUbuabP/Aky993xCFxeSYSofUiNkKWu8RYc9
	Kl9Fhoej3sbcynMPs2akaQzRT+H+zAyOuy2mcQ/mfUwmrU5DOqIK4aLO9PpYqy1ELERqygw2zx/4t
	V4msUyE0Jhn51KI107NBem4b8xzBIYAfzCVWPnwLc8NNh8swSFDP75OFbQn2+zKnoNPCvFDyflCeq
	j4U6Iu+r1jNpGHwR0A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQGcB-0073l1-0i;
	Wed, 25 Dec 2024 01:55:11 +0000
From: linux@treblig.org
To: srinivas.pandruvada@linux.intel.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] HID: intel-ish-hid: Remove unused ishtp_dev_state_str
Date: Wed, 25 Dec 2024 01:55:07 +0000
Message-ID: <20241225015509.458032-2-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241225015509.458032-1-linux@treblig.org>
References: <20241225015509.458032-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ishtp_dev_state_str() was added in 2016 by
commit 3703f53b99e4 ("HID: intel_ish-hid: ISH Transport layer")
but has never been used.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/hid/intel-ish-hid/ishtp/init.c      | 30 ---------------------
 drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/init.c b/drivers/hid/intel-ish-hid/ishtp/init.c
index 07fdd52e4c5e..26bf9045a8de 100644
--- a/drivers/hid/intel-ish-hid/ishtp/init.c
+++ b/drivers/hid/intel-ish-hid/ishtp/init.c
@@ -14,36 +14,6 @@
 #include "client.h"
 #include "loader.h"
 
-/**
- * ishtp_dev_state_str() -Convert to string format
- * @state: state to convert
- *
- * Convert state to string for prints
- *
- * Return: character pointer to converted string
- */
-const char *ishtp_dev_state_str(int state)
-{
-	switch (state) {
-	case ISHTP_DEV_INITIALIZING:
-		return	"INITIALIZING";
-	case ISHTP_DEV_INIT_CLIENTS:
-		return	"INIT_CLIENTS";
-	case ISHTP_DEV_ENABLED:
-		return	"ENABLED";
-	case ISHTP_DEV_RESETTING:
-		return	"RESETTING";
-	case ISHTP_DEV_DISABLED:
-		return	"DISABLED";
-	case ISHTP_DEV_POWER_DOWN:
-		return	"POWER_DOWN";
-	case ISHTP_DEV_POWER_UP:
-		return	"POWER_UP";
-	default:
-		return "unknown";
-	}
-}
-
 /**
  * ishtp_device_init() - ishtp device init
  * @dev: ISHTP device instance
diff --git a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
index effbb442c727..44eddc411e97 100644
--- a/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
+++ b/drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h
@@ -57,7 +57,6 @@ enum ishtp_dev_state {
 	ISHTP_DEV_POWER_DOWN,
 	ISHTP_DEV_POWER_UP
 };
-const char *ishtp_dev_state_str(int state);
 
 struct ishtp_cl;
 
-- 
2.47.1


