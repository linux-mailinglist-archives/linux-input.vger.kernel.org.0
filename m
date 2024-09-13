Return-Path: <linux-input+bounces-6484-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7C69778B6
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 08:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AC62286B20
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 06:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1B91B373C;
	Fri, 13 Sep 2024 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b="cbYKMUGC"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-162.mimecast.com (us-smtp-delivery-162.mimecast.com [170.10.133.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E650413D296
	for <linux-input@vger.kernel.org>; Fri, 13 Sep 2024 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726208145; cv=none; b=Gpzm4LypEt+objlp6kxOHz7D2YOCFukt89bpExRFeoRVy+rP7KLtTpW1ns3N3OIGSRCXlNbwejIC13x43EdqnF6oUaeW+PbTBDfHxS8yKFwRWJcXSCC2MJQm180ghdqgThCVMPYe8fwb7x6RQFQq+CnUmoXX1n5/RL37/tsFu2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726208145; c=relaxed/simple;
	bh=dSSZCLqJrCrxAWOzdFx7LtvdZ65kcJjv55yZSeigVKs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=owuoRSjCLcH+EpnW7hBmCEA/kPgW8r8Lprml//LxAfoKvbQJ5XKRNQ0ovbeNF2Sax9iLaNJeeE72vdrMCekve/PiOq8ztGQ5HHo5Gy4ANXWkCZjxW4tQ5Ss/AbvS8mMQwfbh5+nhg5IXzgKp5jjCulACUGBQT4Cg8umsqIfnkDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com; spf=pass smtp.mailfrom=hp.com; dkim=pass (1024-bit key) header.d=hp.com header.i=@hp.com header.b=cbYKMUGC; arc=none smtp.client-ip=170.10.133.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hp.com; s=mimecast20180716;
	t=1726208141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dSSZCLqJrCrxAWOzdFx7LtvdZ65kcJjv55yZSeigVKs=;
	b=cbYKMUGCumSzeSzhPph6BQQWXmlVl3M0WTSpvpVHhZ1cH8Oj/HtYKeW/0RaIFWAgezRgBJ
	nrJieYvz7Ij4NU8V61EtaSSAzhfIDjWF/knnsdOME/tSQe7GHRjjrTB2B2/a+zVfPKE3Yz
	TxhJrea3mGttRZTGhOHc8q5dBrbled8=
Received: from g7t14361s.inc.hp.com (hpifallback.mail.core.hp.com
 [15.73.128.136]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-576-R6_kcrN8N6WC44JbgxhUEw-1; Fri, 13 Sep 2024 02:15:40 -0400
X-MC-Unique: R6_kcrN8N6WC44JbgxhUEw-1
Received: from g7t16458g.inc.hpicorp.net (g7t16458g.inc.hpicorp.net [15.63.18.16])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by g7t14361s.inc.hp.com (Postfix) with ESMTPS id C4DB220298;
	Fri, 13 Sep 2024 06:15:39 +0000 (UTC)
Received: from mail.hp.com (unknown [15.32.134.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by g7t16458g.inc.hpicorp.net (Postfix) with ESMTPS id D3A2D6000092;
	Fri, 13 Sep 2024 06:15:38 +0000 (UTC)
Received: from cdc-linux-buildsrv17.. (localhost [127.0.0.1])
	by mail.hp.com (Postfix) with ESMTP id AFDC0A40465;
	Fri, 13 Sep 2024 14:08:02 +0800 (CST)
From: Wade Wang <wade.wang@hp.com>
To: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wade.wang@hp.com
Cc: stable@vger.kernel.org
Subject: [PATCH] HID: plantronics: Update to map micmute controls
Date: Fri, 13 Sep 2024 14:08:00 +0800
Message-Id: <20240913060800.1325954-1-wade.wang@hp.com>
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

telephony page of Plantronics headset is ignored currently, it caused
micmute button no function, Now follow native HID key mapping for
telephony page map, telephony micmute key is enabled by default

Cc: stable@vger.kernel.org
Signed-off-by: Wade Wang <wade.wang@hp.com>
---
 drivers/hid/hid-plantronics.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index 2a19f3646ecb..2d17534fce61 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -77,10 +77,10 @@ static int plantronics_input_mapping(struct hid_device =
*hdev,
 =09=09}
 =09}
 =09/* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
-=09/* 'basic telephony compliant' - allow default consumer page map */
+=09/* 'basic telephony compliant' - allow default consumer & telephony pag=
e map */
 =09else if ((plt_type & HID_USAGE) >=3D PLT_BASIC_TELEPHONY &&
 =09=09 (plt_type & HID_USAGE) !=3D PLT_BASIC_EXCEPTION) {
-=09=09if (PLT_ALLOW_CONSUMER)
+=09=09if (PLT_ALLOW_CONSUMER || (usage->hid & HID_USAGE_PAGE) =3D=3D HID_U=
P_TELEPHONY)
 =09=09=09goto defaulted;
 =09}
 =09/* not 'basic telephony' - apply legacy mapping */
--=20
2.34.1


