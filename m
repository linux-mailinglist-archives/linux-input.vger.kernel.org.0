Return-Path: <linux-input+bounces-15305-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B31BC4E32
	for <lists+linux-input@lfdr.de>; Wed, 08 Oct 2025 14:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F6DF19E2306
	for <lists+linux-input@lfdr.de>; Wed,  8 Oct 2025 12:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CE625228C;
	Wed,  8 Oct 2025 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="STWmbkQk"
X-Original-To: linux-input@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14EE24E4B4;
	Wed,  8 Oct 2025 12:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759927255; cv=none; b=pZ7B6Cen9bz2bLLeUbdfQcA2skQjAk3weEs6pgICehi+Pm/W5Q0PQmKNNnUegVO29gyeswMcq9ZE4E0vRQV7xStYep77N6mRH/rEY7aby5Jqxm2nHfdAkQakcZ48miNrh3WKjwVnAg7LJv0tuWhM8ybbDBz8jb0SD4TZxV9Ve3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759927255; c=relaxed/simple;
	bh=JxsTUsRxY6Wa1+x7XkX8xQLLNK836teI0hMoTFv2HKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fbzUSyPwcUchXW6gFpbEVoH5eYNQu/dV9kWeCOBDCekBFcAqfOMXWmfQerp+d3UPHQuei0t0ESliA1RGFGXWNF1WffkjUuurYp1GidF97aQLnpANBOiyPvhLkFaFYAInKXW9P55GEdo7NWAfgBRYywghiCMkHip2P8fos+U9YFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=STWmbkQk; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=9j2/gvEKR6ojvQsMyeXBkyts1QoK+RWdYdrNdt8GnS8=; b=STWmbkQkOtk+fvyTx6qYPE0m8o
	P+V2/fNIo+fDA91ftTOlB8zrCNT4AVD0LH75s8/+KZgex1ysccjw7x7lDvRUUXhT8AiOnTMZ/VDfy
	qAQ3OQWG6Syqm2uf/iSmA+YS1C26WiVWpxnmpNIDzC69ukVRji8TYCoqzmjZa9uCkvwdph+0MU7PQ
	V9uWpmgCYzldoaKIpKhLYLdkQjQJp0ug9i901GwEtNA/uyzoQGUZ280DdoRuOq7kS1LYypALli7qK
	Ypicz/6wypPLDr03OadvlARGCl7kPBr3mQgfuHEwEHNyG9XvU4NKtx1gR/b8gTeSy2C5WFbwEnB89
	5IfnQU9A==;
Received: from [191.39.132.223] (helo=[127.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1v6TTL-006dj5-PP; Wed, 08 Oct 2025 14:40:48 +0200
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Date: Wed, 08 Oct 2025 09:40:33 -0300
Subject: [PATCH] HID: multitouch: fix name of Stylus input devices
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-hid_multitouch_stylus-v1-1-9f43f7e79195@igalia.com>
X-B4-Tracking: v=1; b=H4sIAMBb5mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwML3YzMlPjc0pySzJL80uSM+OKSypzSYl3LFKMUI4MUCzNDAwsloN6
 CotS0zAqwudGxtbUAimIqpmcAAAA=
X-Change-ID: 20251008-hid_multitouch_stylus-9d2d20d86108
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Tero Kristo <tero.kristo@linux.intel.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
X-Mailer: b4 0.14.2

HID_DG_PEN devices should have a suffix of "Stylus", as pointed out by
commit c0ee1d571626 ("HID: hid-input: Add suffix also for HID_DG_PEN").
However, on multitouch devices, these suffixes may be overridden. Before
that commit, HID_DG_PEN devices would get the "Stylus" suffix, but after
that, multitouch would override them to have an "UNKNOWN" suffix. Just add
HID_DG_PEN to the list of non-overriden suffixes in multitouch.

Before this fix:

[    0.470981] input: ELAN9008:00 04F3:2E14 UNKNOWN as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-16/i2c-ELAN9008:00/0018:04F3:2E14.0001/input/input8
ELAN9008:00 04F3:2E14 UNKNOWN

After this fix:

[    0.474332] input: ELAN9008:00 04F3:2E14 Stylus as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-16/i2c-ELAN9008:00/0018:04F3:2E14.0001/input/input8

ELAN9008:00 04F3:2E14 Stylus

Fixes: c0ee1d571626 ("HID: hid-input: Add suffix also for HID_DG_PEN")
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
---
 drivers/hid/hid-multitouch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 2879e65cf303b1456311ac06115adda5a78a2600..513b8673ad8dd7ad135652f787812072d45e6c1a 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1742,6 +1742,7 @@ static int mt_input_configured(struct hid_device *hdev, struct hid_input *hi)
 	case HID_CP_CONSUMER_CONTROL:
 	case HID_GD_WIRELESS_RADIO_CTLS:
 	case HID_GD_SYSTEM_MULTIAXIS:
+	case HID_DG_PEN:
 		/* already handled by hid core */
 		break;
 	case HID_DG_TOUCHSCREEN:

---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20251008-hid_multitouch_stylus-9d2d20d86108

Best regards,
-- 
Thadeu Lima de Souza Cascardo <cascardo@igalia.com>


