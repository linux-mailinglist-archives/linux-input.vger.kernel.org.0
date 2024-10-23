Return-Path: <linux-input+bounces-7643-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 604AC9AC8E8
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 13:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 213422825C5
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 11:28:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D371AAE37;
	Wed, 23 Oct 2024 11:28:34 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E89B154439;
	Wed, 23 Oct 2024 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729682914; cv=none; b=T4S74AbX8GNNoLTNxwimT/M1jaksnw8qkFNNezAyfC+Qq+GNyhaA56R6j4IfKNutrXWdmgQ+aNXOwdXO4FGaZga8GycuRN2UsQBDL1Biq6n4QoPaN1I7u8FgkZtx/KYjXKrs1J4RQ48V+HJVQ07csAZ6OXWc/wCF5AZzVBSt+uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729682914; c=relaxed/simple;
	bh=GqTYAOl7cc4VcNc1E1dwaKhqZe3YTizqExvYMx6H4Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iuWaLdlibXovpLpfeh3inUlYZuuWoV5uBb4ghXfRBXB0Lb07Jiorrm0qRA7+xMp8yjIrtocjO62cFRH7wagRp1N6CM5N88xA7pnH94fW7d6n2wKlgtMRmZoypXssXee9ELbXf320ZpT0/+5I9t/2bTTztuf/BcPF2KRVbR433mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net; spf=pass smtp.mailfrom=hadess.net; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hadess.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11198C0007;
	Wed, 23 Oct 2024 11:28:29 +0000 (UTC)
From: Bastien Nocera <hadess@hadess.net>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH 2/2] HID: steelseries: Add capacity_level mapping
Date: Wed, 23 Oct 2024 13:24:38 +0200
Message-ID: <20241023112828.320157-3-hadess@hadess.net>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023112828.320157-1-hadess@hadess.net>
References: <20241023112828.320157-1-hadess@hadess.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: hadess@hadess.net

The capacity level mappings are taken from:
https://support.steelseries.com/hc/en-us/articles/360049205612-How-do-I-know-the-Arctis-battery-level-how-do-I-charge-the-Arctis

Even if we have a percentage, exporting a capacity_level that matches
with the hardware warning levels means that upower can show warnings at
the same time as the hardware. So the headset starts beeping at the same
time as the critical warning notification appears :eyeroll:

Signed-off-by: Bastien Nocera <hadess@hadess.net>
---
 drivers/hid/hid-steelseries.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 16138f7dae17..f9ff5be94309 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -411,6 +411,15 @@ static void steelseries_headset_fetch_battery(struct hid_device *hdev)
 			"Battery query failed (err: %d)\n", ret);
 }
 
+static int battery_capacity_to_level(int capacity)
+{
+	if (capacity >= 50)
+		return POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
+	if (capacity >= 20)
+		return POWER_SUPPLY_CAPACITY_LEVEL_LOW;
+	return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
+}
+
 static void steelseries_headset_battery_timer_tick(struct work_struct *work)
 {
 	struct steelseries_device *sd = container_of(work,
@@ -442,6 +451,9 @@ static int steelseries_headset_battery_get_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_CAPACITY:
 		val->intval = sd->battery_capacity;
 		break;
+	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
+		val->intval = battery_capacity_to_level(sd->battery_capacity);
+		break;
 	default:
 		ret = -EINVAL;
 		break;
@@ -469,6 +481,7 @@ static enum power_supply_property steelseries_headset_battery_props[] = {
 	POWER_SUPPLY_PROP_STATUS,
 	POWER_SUPPLY_PROP_SCOPE,
 	POWER_SUPPLY_PROP_CAPACITY,
+	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
 };
 
 static int steelseries_headset_battery_register(struct steelseries_device *sd)
-- 
2.47.0


