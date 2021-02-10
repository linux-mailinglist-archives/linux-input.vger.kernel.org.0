Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F051A316B2F
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 17:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhBJQ2B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Feb 2021 11:28:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29636 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232171AbhBJQ1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Feb 2021 11:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612974388;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=rkhGNQG431H7a4/O/oJ6RWaDYdESXQ6nPiGIWilyChA=;
        b=Uwrx4zEYYtu9vUSqhdAWZzKNbjaKGxdHXlPgiZDvDWeyVfZM+UO+OuaHmzuAWrHdGGcQBv
        bTocK/H5gNQpQ15mgTFO8T1jHO7H0Hk6fBv9QVmIyhEm94FeNnlkasGWq360gR/HFo2wVI
        Qg2AdXslQ99dRa0k+34dkFTFTj3RzsE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-p0MuO-BePTO6J66lsbPGRA-1; Wed, 10 Feb 2021 11:26:24 -0500
X-MC-Unique: p0MuO-BePTO6J66lsbPGRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 229B6801962;
        Wed, 10 Feb 2021 16:26:23 +0000 (UTC)
Received: from treble.redhat.com (ovpn-120-169.rdu2.redhat.com [10.10.120.169])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AD029190D0;
        Wed, 10 Feb 2021 16:26:21 +0000 (UTC)
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        linux-kernel@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        linux-input@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH RFC] input/elants_i2c: Detect enum overflow
Date:   Wed, 10 Feb 2021 10:25:28 -0600
Message-Id: <59e2e82d1e40df11ab38874c03556a31c6b2f484.1612974132.git.jpoimboe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If an enum value were to get added without updating this switch
statement, the unreachable() annotation would trigger undefined
behavior, causing execution to fall through the end of the function,
into the next one.

Make the error handling more robust for an unexpected enum value, by
doing BUG() instead of unreachable().

Fixes the following objtool warning:

  drivers/input/touchscreen/elants_i2c.o: warning: objtool: elants_i2c_initialize() falls through to next function elants_i2c_resume()

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 drivers/input/touchscreen/elants_i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 6f57ec579f00..4c2b579f6c8b 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -656,8 +656,7 @@ static int elants_i2c_initialize(struct elants_data *ts)
 			error = elants_i2c_query_ts_info_ektf(ts);
 		break;
 	default:
-		unreachable();
-		break;
+		BUG();
 	}
 
 	if (error)
-- 
2.29.2

