Return-Path: <linux-input+bounces-7218-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D6B99706A
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 18:05:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 133721C22377
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893D51DEFE8;
	Wed,  9 Oct 2024 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ks9orqre"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7D32AD1C;
	Wed,  9 Oct 2024 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728488467; cv=none; b=Za3EJr7JWnx8OrIxLq16fVX302S0uV6mhPd8JQocfDLJz7qz1VLxy8U4xDhb8pvEbezfKf2NgRYgG7EwyF6kJRGHyrMWJXKo1x//txd1lACWLBecEojFf5Y86cE15BASbQ5vIhDwcTanO4PmXunnVodmWaQmekYbKzRdlnwJFtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728488467; c=relaxed/simple;
	bh=WOHh/UpaH8St+UhgxQ7+nTUjI5YWKW9EZ0ZmLituKTo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ek6oeOpkN9lykuk2wjAGuiBak60wCZp3o9lJbp9Cs03MuMlfCx0pGbucTwOgeRi5dVGvmZZftEmQptkHrudO6q/r4qib97JZZvitRRPOhwY52vQ+GwpPEeRY/CiZTuYLKlvTYu6IRjxDnpgX7KhODqZbIy0vBTdo+DnD9V7d/O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ks9orqre; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499499oJ031691;
	Wed, 9 Oct 2024 10:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=DPKVopMgdrrwHMHENM1Bl0UTsCXlqlh0hbgfzu8Bkwk=; b=
	Ks9orqreO8RDzO+qAl1EUmkQkJ0lnLO4eRuyjMwlQf3gGYsOby2ZgLuMNWYXyv2J
	sknUsTEwFwxv+tlpA/a/g6Kc77d9j7//c/PHATCVFiwzDTUCSh1Drlf9auH0jqaJ
	k/p+FadzezJQiaQlyOofnNgl+1VCHxF0dFy5veQIr/BWjnCO0AuX6QWAuUThviaY
	D6w6QHVR2NfXIY6i8/Ptd/PyBiRKQ4YYgJQI32AaVRa6rr09eP1HhzDzHNI38NYk
	i8WjipksTLZhW3sYdIEoOqD/Enlnosr5qi4rFqkIsDW7vwKJUfrjOdhLQ9ZVgGcu
	Kjl3G3OEYhIJ0RYXjSzAEw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4232uy661f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 10:41:01 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 9 Oct 2024
 16:40:59 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 9 Oct 2024 16:40:59 +0100
Received: from aus-sw-rshr002.ad.cirrus.com (aus-sw-rshr002.ad.cirrus.com [141.131.145.15])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 2B2B182024A;
	Wed,  9 Oct 2024 15:40:58 +0000 (UTC)
From: James Ogletree <jogletre@opensource.cirrus.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <dmitry.torokhov@gmail.com>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <patches@opensource.cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>
Subject: [RFC PATCH 3/6] HID: pidff: Assign max concurrent playbacks
Date: Wed, 9 Oct 2024 15:40:43 +0000
Message-ID: <20241009154046.1011226-4-jogletre@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241009154046.1011226-1-jogletre@opensource.cirrus.com>
References: <20241009154046.1011226-1-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Ogz8504EGo22Y_caY7Ly5IX8rKNFVwXM
X-Proofpoint-ORIG-GUID: Ogz8504EGo22Y_caY7Ly5IX8rKNFVwXM
X-Proofpoint-Spam-Reason: safe

Explicitly assign the maximum number of simultaneously playable
effects.

Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
---
 drivers/hid/usbhid/hid-pidff.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd811..dd260fcdad60 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1309,6 +1309,7 @@ int hid_pidff_init(struct hid_device *hid)
 	ff->set_gain = pidff_set_gain;
 	ff->set_autocenter = pidff_set_autocenter;
 	ff->playback = pidff_playback;
+	ff->max_concurrent_playbacks = max_effects;
 
 	hid_info(dev, "Force feedback for USB HID PID devices by Anssi Hannula <anssi.hannula@gmail.com>\n");
 
-- 
2.43.0


