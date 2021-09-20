Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FBD4117CA
	for <lists+linux-input@lfdr.de>; Mon, 20 Sep 2021 17:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241089AbhITPIR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 11:08:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50948 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241077AbhITPIQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 11:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632150409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ne6pBnSeViv3eYGE4Ob9iSRFz91ZtJe57xzkiZ2iHXY=;
        b=gl+VlpC6N1VLxQRCkFSzPLAHBlYOitWz0IyEACX0+dCcqVHWSalwoahr2EqhtIrNXwPfqX
        pqvwn7F5AjXE8dRIndztnCA4h7HI6Ly6zI1rQ668GfB73Ha68HZIZIWwi21DaOlogli+Ld
        PfXjPmB2+fhWqEQcw7uRRZFIeYzkB+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-a-LSlvqyPmqtrZu0qhPYCg-1; Mon, 20 Sep 2021 11:06:48 -0400
X-MC-Unique: a-LSlvqyPmqtrZu0qhPYCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F04F835DE3;
        Mon, 20 Sep 2021 15:06:47 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D45055C1BB;
        Mon, 20 Sep 2021 15:06:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 1/6] Input: goodix - Change goodix_i2c_write() len parameter type to int
Date:   Mon, 20 Sep 2021 17:06:38 +0200
Message-Id: <20210920150643.155872-2-hdegoede@redhat.com>
In-Reply-To: <20210920150643.155872-1-hdegoede@redhat.com>
References: <20210920150643.155872-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change the type of the goodix_i2c_write() len parameter to from 'unsigned'
to 'int' to avoid bare use of 'unsigned', changing it to 'int' makes
goodix_i2c_write()' prototype consistent with goodix_i2c_read().

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 4f53d3c57e69..5d60dde88485 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -244,8 +244,7 @@ static int goodix_i2c_read(struct i2c_client *client,
  * @buf: raw data buffer to write.
  * @len: length of the buffer to write
  */
-static int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf,
-			    unsigned len)
+static int goodix_i2c_write(struct i2c_client *client, u16 reg, const u8 *buf, int len)
 {
 	u8 *addr_buf;
 	struct i2c_msg msg;
-- 
2.31.1

