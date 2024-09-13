Return-Path: <linux-input+bounces-6481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3E897789B
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 08:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF4A91C22B61
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 06:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDEB2187356;
	Fri, 13 Sep 2024 06:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="JsRzNHRu"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE97224CF
	for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 06:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726207584; cv=none; b=PC1ksYh+LoFOj/uzkgfGo/ltO4n5A37A7Ho5reVHRVziprgbPYkCfTpngu5+7wqzxh+osdiCbvIvUZqX/dEPFjkz4EICbl371xF9DAao0tUbDlw6Iff9HV31GKqpHYDDOj82LoVG2veIZHrQrg6BpAcEOtfi6LeomDTRLU7pzDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726207584; c=relaxed/simple;
	bh=T2WVPeItws/8KSshd4JJuacLfIblNmrXh3m4eR9SqGM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nBjAVgVP5jelIWRNMQ8qdAL21WFlODtlro8tAcK1SGsvUqAUzpu99w1jYFr06GHebUW8B4uXP12WI3Iigy+sCeLJZC6g/GOaVjE/Lrtuz+JNcg8VXrqLl6spDf5P48MLUtmcV9LW/PO2632KaQetERL+SDgWpYyH4EmprrEoBuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=JsRzNHRu; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1726207581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u5UMeaxqG4NmIWc0i5zrZ9ZlV9cl6Ku3OxStJMFQQko=;
	b=JsRzNHRurluhdnh49hvgigSVA2xx3+T2tIk2uSnApPb7jTy3kNvipGK9vym0LCjwOlIk+4
	gIh5nZvsFz5eXCiUOn5cOiDjyk8OUhc/XxL7Ks1XuX3Pm7rcCnI4rg6U5TQc0IOCVDowjY
	euQy0pGdVBeAysFgiFMQK2AzqboR/zY=
Received: from g8t13017g.inc.hp.com (g8t13017g.inc.hp.com [15.72.64.135]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-350-KkGqon8TN8qbvEYjHahyow-1; Fri,
 13 Sep 2024 02:06:19 -0400
X-MC-Unique: KkGqon8TN8qbvEYjHahyow-1
Received: from g8t01565g.inc.hpicorp.net (g8t01565g.inc.hpicorp.net [15.60.11.226])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by g8t13017g.inc.hp.com (Postfix) with ESMTPS id D6C796000C02;
	Fri, 13 Sep 2024 06:06:18 +0000 (UTC)
Received: from mail.hp.com (unknown [15.32.134.51])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by g8t01565g.inc.hpicorp.net (Postfix) with ESMTPS id 374F2212D3;
	Fri, 13 Sep 2024 06:06:17 +0000 (UTC)
Received: from cdc-linux-buildsrv17.. (localhost [127.0.0.1])
	by mail.hp.com (Postfix) with ESMTP id E83BAA40465;
	Fri, 13 Sep 2024 13:58:41 +0800 (CST)
From: Wade Wang <wade.wang@hp.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wade.wang@hp.com
Cc: stable@vger.kernel.org
Subject: [PATCH] HID: plantronics: Additional PID for double volume key presses quirk
Date: Fri, 13 Sep 2024 13:58:31 +0800
Message-Id: <20240913055831.1322457-1-wade.wang@hp.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: hp.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252; x-default=true

Add the below headsets for double volume key presses quirk
        Plantronics EncorePro 500 Series  (047f:431e)
        Plantronics Blackwire_3325 Series (047f:430c)

Quote from previous patch by Maxim Mikityanskiy and Terry Junge
=09'commit f567d6ef8606 ("HID: plantronics: Workaround for double volume
=09 key presses")'
=09'commit 3d57f36c89d8 ("HID: plantronics: Additional PIDs for double
=09 volume key presses quirk")'
These Plantronics Series headset sends an opposite volume key following
each volume key press. This patch adds a quirk to hid-plantronics for this
product ID, which will ignore the second opposite volume key press if it
happens within 250 ms from the last one that was handled.

Signed-off-by: Wade Wang <wade.wang@hp.com>
---
 drivers/hid/hid-ids.h         |  2 ++
 drivers/hid/hid-plantronics.c | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 781c5aa29859..a0aaac98a891 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -1050,6 +1050,8 @@
 #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES=090xc056
 #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3215_SERIES=090xc057
 #define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES=090xc058
+#define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES=090x430c
+#define USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES=09=090x431e
=20
 #define USB_VENDOR_ID_PANASONIC=09=090x04da
 #define USB_DEVICE_ID_PANABOARD_UBT780=090x1044
diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index 3d414ae194ac..2a19f3646ecb 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -38,8 +38,10 @@
 =09=09=09    (usage->hid & HID_USAGE_PAGE) =3D=3D HID_UP_CONSUMER)
=20
 #define PLT_QUIRK_DOUBLE_VOLUME_KEYS BIT(0)
+#define PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS BIT(1)
=20
 #define PLT_DOUBLE_KEY_TIMEOUT 5 /* ms */
+#define PLT_FOLLOWED_KEY_TIMEOUT 250 /* ms */
=20
 struct plt_drv_data {
 =09unsigned long device_type;
@@ -134,6 +136,9 @@ static int plantronics_event(struct hid_device *hdev, s=
truct hid_field *field,
 =09=09cur_ts =3D jiffies;
 =09=09if (jiffies_to_msecs(cur_ts - prev_ts) <=3D PLT_DOUBLE_KEY_TIMEOUT)
 =09=09=09return 1; /* Ignore the repeated key. */
+=09=09if ((drv_data->quirks & PLT_QUIRK_FOLLOWED_VOLUME_UP_DN_KEYS)
+=09=09 && jiffies_to_msecs(cur_ts - prev_ts) <=3D PLT_FOLLOWED_KEY_TIMEOUT=
)
+=09=09=09return 1; /* Ignore the followed volume key. */
=20
 =09=09drv_data->last_volume_key_ts =3D cur_ts;
 =09}
@@ -210,6 +215,12 @@ static const struct hid_device_id plantronics_devices[=
] =3D {
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
 =09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES),
 =09=09.driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS },
+=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
+=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES),
+=09=09.driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS|PLT_QUIRK_FOLLOWED_VOL=
UME_UP_DN_KEYS },
+=09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
+=09=09=09=09=09 USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES),
+=09=09.driver_data =3D PLT_QUIRK_DOUBLE_VOLUME_KEYS|PLT_QUIRK_FOLLOWED_VOL=
UME_UP_DN_KEYS },
 =09{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
 =09{ }
 };
--=20
2.34.1


