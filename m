Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4413FE31AB
	for <lists+linux-input@lfdr.de>; Thu, 24 Oct 2019 13:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407311AbfJXL7U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Oct 2019 07:59:20 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55105 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404689AbfJXL7U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Oct 2019 07:59:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571918358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=VP9P+y2LBq3is/X+u19Z1Amoj9uRPVkhSW5HqMpDr5o=;
        b=HPQ5YH7aVBGyOTOmiO6AKVQ5A+YRrwWmBQUqTbK6ktaHB/FvOt3gPiU9acqtUFR+FgS8Dk
        N0fEuOGKwL70HyNP4vzn/exH6wVsyF1/b6aEXNp2cY0eOXZ+duYFeAFuVnDwAcffOsDmCZ
        ko9tDsVHMdpdYqYX2foMa9K26CHNb4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-7xe3gGXWP0mb43EbWLJtqg-1; Thu, 24 Oct 2019 07:59:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E17A107AD31;
        Thu, 24 Oct 2019 11:59:14 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.40])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0C4A060852;
        Thu, 24 Oct 2019 11:59:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] HID: asus: Ignore Asus vendor-page usage-code 0xff events
Date:   Thu, 24 Oct 2019 13:59:09 +0200
Message-Id: <20191024115909.109402-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 7xe3gGXWP0mb43EbWLJtqg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At least on a T100HA an Asus vendor-page usage-code 0xff event is send on
every suspend and again on resume, resulting in the following warning:

asus 0003:0B05:1807.0002: Unmapped Asus vendor usagepage code 0xff

being logged twice on every suspend/resume.

This commit silences the "Unmapped Asus vendor usagepage code ..."
warning for usage-code 0xff to avoid these warnings being logged.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-asus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 8063b1d567b1..e6e4c841fb06 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -261,7 +261,8 @@ static int asus_event(struct hid_device *hdev, struct h=
id_field *field,
 =09=09      struct hid_usage *usage, __s32 value)
 {
 =09if ((usage->hid & HID_USAGE_PAGE) =3D=3D 0xff310000 &&
-=09    (usage->hid & HID_USAGE) !=3D 0x00 && !usage->type) {
+=09    (usage->hid & HID_USAGE) !=3D 0x00 &&
+=09    (usage->hid & HID_USAGE) !=3D 0xff && !usage->type) {
 =09=09hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
 =09=09=09 usage->hid & HID_USAGE);
 =09}
--=20
2.23.0

