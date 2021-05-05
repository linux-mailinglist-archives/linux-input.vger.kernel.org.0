Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9817D374AA4
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 23:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbhEEVlB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 17:41:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23402 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234780AbhEEVkm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 17:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620250785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fot0NGl2ai1R4LucSAk0T+YoOHYuoLoy5rq36GvX/iQ=;
        b=MqU5wSXSu/C4y1jMb0jb7eGcwoJXNUFx6znLh/GK39rXi2ETMO+q3KZuj8D1lcOhBQitIO
        yz73fle2LsERK/gNcddYi9XbF5WGR3dRhlM1EN7+UUTd3NPaVDGVC9LyUrS7RkEsnsY0xf
        bHqNY3ZYxfgCPnRoGOHBBRzzGLl3fLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-O8SGOd2GN4-hrlxiwcFHOg-1; Wed, 05 May 2021 17:39:43 -0400
X-MC-Unique: O8SGOd2GN4-hrlxiwcFHOg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36C34100A67A;
        Wed,  5 May 2021 21:39:42 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-71.ams2.redhat.com [10.36.112.71])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4B15E5D6A8;
        Wed,  5 May 2021 21:39:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 1/6] HID: core: Remove extraneous empty line before EXPORT_SYMBOL_GPL(hid_check_keys_pressed)
Date:   Wed,  5 May 2021 23:39:30 +0200
Message-Id: <20210505213935.631351-2-hdegoede@redhat.com>
In-Reply-To: <20210505213935.631351-1-hdegoede@redhat.com>
References: <20210505213935.631351-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Normally the EXPORT_SYMBOL of a function immediately follows the
declaration of the function and all the other functions in hid-core.c
follow this pattern, drop the extraneous empty line before the
EXPORT_SYMBOL_GPL(hid_check_keys_pressed); line.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 097cb1ee3126..b593dff411a6 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2588,7 +2588,6 @@ int hid_check_keys_pressed(struct hid_device *hid)
 
 	return 0;
 }
-
 EXPORT_SYMBOL_GPL(hid_check_keys_pressed);
 
 static int __init hid_init(void)
-- 
2.31.1

