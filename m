Return-Path: <linux-input+bounces-12575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D1AC3F95
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 14:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03D113BA71B
	for <lists+linux-input@lfdr.de>; Mon, 26 May 2025 12:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AAF220CCCC;
	Mon, 26 May 2025 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R3ZuXxkc"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C28F20B803;
	Mon, 26 May 2025 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263920; cv=none; b=JPithaK6nFE4j/jmbT0tgVy3cPVHu6jCsD7BdcDH6AzOulsJ7oUuoKobwlI0Ak7NfQfVLaSZxMa6hl02P3szZ0rdFOO06NEZUn3JvWwHKXBSgu9/bPNPkNc9eR5zsf4EMTLUelrXyW9Os+ySF41zD06o5ETuEqiaNwPTUYs2+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263920; c=relaxed/simple;
	bh=oaWNzOLMoOgeNwj+kEJE2H+cuxlKmYC1sg88/tCA//g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c1ZxCitrMupAhnD/P+dXwcrpQUXD72Hi37zRHYXYm/ZkWG+qkFicQuTZ9w35uuVyutBZpMQ3ygRfb3ZUWbsLZFrmETm7d+aiCyWO1wHQ96kXdRUOoVFWZEIjD6+REeVmZ8evr8zslLtQWpu8jZ7t8b/w3lha+qrFtxm1WyuzJ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R3ZuXxkc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748263916;
	bh=oaWNzOLMoOgeNwj+kEJE2H+cuxlKmYC1sg88/tCA//g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R3ZuXxkcgbEe1/u+dVdfVwrkISC573bZW/HKfjNipIGPp0uldWXfdxsEGouSIfyc4
	 7ff9NNlcl7xS8liy+o8Z7rCLnWSG6iP/i35aiyuKqiK8N2FjQW0ty0TjXqowQF66wS
	 f4Elzyje8US03WMfzRDngXNh4SJrd/VMmbW8aL+lONWXiLzdZKUFizuxqfICTsYt88
	 JS66aB/d/t/5mZIzwPj5sn57MM06xh6nRdx/Y8VMtIQr7ZYodzURvGO69E5KXFjqEU
	 dEKnmP8IgOr2FlFTiOelSGXozE5WwNXGgrAFjWaSdrLKIHhhEaEtxTawutlEhHvVgs
	 8sCXFRB4IpwVQ==
Received: from localhost (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 2E7C517E36B9;
	Mon, 26 May 2025 14:51:56 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Mon, 26 May 2025 15:51:28 +0300
Subject: [PATCH 05/11] HID: playstation: Correct spelling in comment
 sections
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-dualsense-hid-jack-v1-5-a65fee4a60cc@collabora.com>
References: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
In-Reply-To: <20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com>
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Henrik Rydberg <rydberg@bitmath.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

Handle a couple of spelling complaints from checkpatch.pl:

  CHECK: 'connectd' may be misspelled - perhaps 'connected'?
  CHECK: 'Comptabile' may be misspelled - perhaps 'Compatible'?

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/hid/hid-playstation.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index d36370d001edd0d82e8616f8f2803d8b7ad13954..837d6917b1002b80474b4e0d6241c455708294c8 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -339,7 +339,7 @@ struct dualsense_output_report {
 /* Battery status within batery_status field. */
 #define DS4_BATTERY_STATUS_FULL		11
 /* Status1 bit2 contains dongle connection state:
- * 0 = connectd
+ * 0 = connected
  * 1 = disconnected
  */
 #define DS4_STATUS1_DONGLE_STATE	BIT(2)
@@ -2170,7 +2170,7 @@ static void dualshock4_output_worker(struct work_struct *work)
 
 	if (ds4->update_lightbar) {
 		common->valid_flag0 |= DS4_OUTPUT_VALID_FLAG0_LED;
-		/* Comptabile behavior with hid-sony, which used a dummy global LED to
+		/* Compatible behavior with hid-sony, which used a dummy global LED to
 		 * allow enabling/disabling the lightbar. The global LED maps to
 		 * lightbar_enabled.
 		 */

-- 
2.49.0


