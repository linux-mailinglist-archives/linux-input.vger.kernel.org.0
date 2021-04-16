Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C462A36209F
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243526AbhDPNOG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40563 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240600AbhDPNOG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618578821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e4rWDrDfwyLsDweYXZDDicczuMT9JBPonwOXgMZ3Nl8=;
        b=TNDXG9wbYMSpu7Pq65j/cwlk1gN4t0pHUW1eyVhDJf88qDsz5IZZiLe3upbxyowlWJ5xYJ
        LEj6VVaFM4m3BVx35lCwJgZraDT/aJDLW9iyt9NJtx0H31ZQFA61jYUALkOssTPykRx3qh
        sWu528Q+20nboQhl3sIubqXRV6otd7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-Ms3Fs5yXO_qKlNvY_Tc65A-1; Fri, 16 Apr 2021 09:13:38 -0400
X-MC-Unique: Ms3Fs5yXO_qKlNvY_Tc65A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7548C87A83E;
        Fri, 16 Apr 2021 13:13:37 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-102.ams2.redhat.com [10.36.113.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5CA0B5C626;
        Fri, 16 Apr 2021 13:13:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Peter Hoeg <peter@hoeg.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 6/6] HID: lg-g15 + ite: Add MODULE_AUTHOR
Date:   Fri, 16 Apr 2021 15:13:23 +0200
Message-Id: <20210416131323.233184-7-hdegoede@redhat.com>
In-Reply-To: <20210416131323.233184-1-hdegoede@redhat.com>
References: <20210416131323.233184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I noticed that the 2 HID drivers which I've written and maintain were
missing a MODULE_AUTHOR tag, add this so that people can easily figure
out who to email with questions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-ite.c    | 1 +
 drivers/hid/hid-lg-g15.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
index 14fc068affad..430fa4f52ed3 100644
--- a/drivers/hid/hid-ite.c
+++ b/drivers/hid/hid-ite.c
@@ -135,4 +135,5 @@ static struct hid_driver ite_driver = {
 };
 module_hid_driver(ite_driver);
 
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 701ddb98e7d2..b2a08233f8d5 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -952,4 +952,5 @@ static struct hid_driver lg_g15_driver = {
 };
 module_hid_driver(lg_g15_driver);
 
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
 MODULE_LICENSE("GPL");
-- 
2.31.1

