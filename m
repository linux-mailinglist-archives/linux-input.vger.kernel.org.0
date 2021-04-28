Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A327D36D6B9
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 13:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbhD1Lq7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 07:46:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22275 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229600AbhD1Lq7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 07:46:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619610374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4bYrXjMpCbxFn9DcJKRxk//23nPBASbfUTD5aQP+36w=;
        b=AaZYd5+ixI/XWBSnil4X0RiU6P+wZuUBsIc36AFZeSlOBPtBGAVP0Rz1aFhcZ6DiZvgrH2
        75fHe2SZdv3jdvlA+dcXnaU7vz2PNQfznH23O9QtcHpr1L7+6H4dwpNuXVLBdUj8uVe16V
        jLgAaKpJ4VBg5QfTbw5nQ73aDphaZGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-M7nUTW1tNciq2TFtDKfYYA-1; Wed, 28 Apr 2021 07:46:12 -0400
X-MC-Unique: M7nUTW1tNciq2TFtDKfYYA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E6D710054F6;
        Wed, 28 Apr 2021 11:46:11 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4E3065F729;
        Wed, 28 Apr 2021 11:46:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/7] Input: goodix - Change goodix_i2c_write() len parameter type to int
Date:   Wed, 28 Apr 2021 13:46:02 +0200
Message-Id: <20210428114608.101795-2-hdegoede@redhat.com>
In-Reply-To: <20210428114608.101795-1-hdegoede@redhat.com>
References: <20210428114608.101795-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change the type of the goodix_i2c_write() len parameter to from 'unsigned'
to 'int' to avoid bare use of 'unsigned', changing it to 'int' makes
goodix_i2c_write()' prototype consistent with goodix_i2c_read().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index c682b028f0a2..fddbc6c5127d 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -289,8 +289,7 @@ static int goodix_i2c_read(struct i2c_client *client,
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

