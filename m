Return-Path: <linux-input+bounces-13859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D9B1E145
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 06:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 427BE3B5684
	for <lists+linux-input@lfdr.de>; Fri,  8 Aug 2025 04:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FED71CBA02;
	Fri,  8 Aug 2025 04:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="JF48Njxg"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888F018871F
	for <linux-input@vger.kernel.org>; Fri,  8 Aug 2025 04:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754627536; cv=none; b=rr648IRSDCjerhLxfXs82F5z+CthHmUdJn4tPV6V8rvMof4frUk063yGedN8XNTCSaIL8QVmuDpunstZL01z/JxBcfFP4vvwqDHS7AKPekIrn7JApLhAI16/19R1qvbOEGmT0uCsjTPc3gw9tKvOZAp5B58JVikD5vYs9jyuLfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754627536; c=relaxed/simple;
	bh=N4zRw2sT5mpXKGHiK7Lq6l4GEUSwnwZ4EW0XVLAZchM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tr9p2ginL7NGTWLLwSZrcSHbLlRrQUdRdF23UddWwmcPR4td6Qi4fXhDLRcdT1L7w9anVyiC+TEJzCRZeMq/k+xe4/9Ua71sPWKWShMiNcdiU6GPMlh3aweN58lGZBmslR1oklHci3KKznQmFGHnf2ue0q1q4SPQu35J1/k8c24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=JF48Njxg; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754627528; bh=N4zRw2sT5mpXKGHiK7Lq6l4GEUSwnwZ4EW0XVLAZchM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JF48NjxgU+p4vobFnQ7/Ax1spaSbh5oe/oxuodzUOcUxahKXxkfPykN9f62oLNLbd
	 DfHs/stgxKRvKUijd8W9fIpvWmdRpqALOqT1eHzSv8K+budRAF+ofdi5tP2dcVk0s8
	 Ik87MjsknFjtdU4OzVuYWwY1RwmwV/PFMglG7Qzb8kKMIwgAXwbGmhiIzBe8lLKaLu
	 ULACQVollyRDzxG+HMbrWZlkbE08tgRcTjJk/A9f9q7FW+wRE5FQ2k3dLPROI3C/2J
	 bPqlDg+aSf3PCM2JvnRx82wLiR1z2E3IzJS/tEi+uw314GzXu9/6dZNNu2HmihmUDa
	 /FpyhMKnhsQWA==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 717FEA25C;
	Thu,  7 Aug 2025 21:32:08 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 4/6] HID: Map more automobile simulation inputs
Date: Thu,  7 Aug 2025 21:30:11 -0700
Message-ID: <20250808043017.1953101-5-vi@endrift.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808043017.1953101-1-vi@endrift.com>
References: <20250808043017.1953101-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HID usage tables section 5.3 specify clutch and shifter values that had
previously been ignored. As the ABS_CLUTCH and ABS_SHIFTER bits now exist,
we should use them appropriately.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/hid/hid-input.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index ff1784b5c2a47..adcffbcb30834 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -782,6 +782,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case 0xbb: map_abs(ABS_THROTTLE); break;
 		case 0xc4: map_abs(ABS_GAS);      break;
 		case 0xc5: map_abs(ABS_BRAKE);    break;
+		case 0xc6: map_abs(ABS_CLUTCH);   break;
+		case 0xc7: map_abs(ABS_SHIFTER);  break;
 		case 0xc8: map_abs(ABS_WHEEL);    break;
 		default:   goto ignore;
 		}
-- 
2.50.1


