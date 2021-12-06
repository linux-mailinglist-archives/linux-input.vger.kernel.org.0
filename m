Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61C446A1C7
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 17:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238986AbhLFQvb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 11:51:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35447 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238455AbhLFQvb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 11:51:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638809282;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JNrybFogw3U5ywlOZ64zTWuuO+9Skiyn6R2f5vO2vT4=;
        b=ByAzmk/1/mzS9yz/T14oEaTDDvXeTxqrqci90ao6kGVD7ceORAjMNfb8vf1gCZCWXlnl/s
        AndSDZ8+113CMYlviLqt+K01N4M1epDa5MJbhJjLuXA8ObutX4/KqSNNqD6N7aOBQEYrn1
        48QXkmtpnGdvSJ6Xs9W/xjjmmXLXJ1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-3ot0JR_LOc6JV9xBA-et4A-1; Mon, 06 Dec 2021 11:47:52 -0500
X-MC-Unique: 3ot0JR_LOc6JV9xBA-et4A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0572381EE69;
        Mon,  6 Dec 2021 16:47:51 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.105])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DF09C1E6;
        Mon,  6 Dec 2021 16:47:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 1/4] Input: goodix - Add id->model mapping for the "9111" model
Date:   Mon,  6 Dec 2021 17:47:44 +0100
Message-Id: <20211206164747.197309-2-hdegoede@redhat.com>
In-Reply-To: <20211206164747.197309-1-hdegoede@redhat.com>
References: <20211206164747.197309-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add d->model mapping for the "9111" model, this fixes uses using
a wrong config_len of 240 bytes while the "9111" model uses
only 186 bytes of config.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/goodix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index eaa659969097..aaa3c455e01e 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -102,6 +102,7 @@ static const struct goodix_chip_id goodix_chip_ids[] = {
 	{ .id = "911", .data = &gt911_chip_data },
 	{ .id = "9271", .data = &gt911_chip_data },
 	{ .id = "9110", .data = &gt911_chip_data },
+	{ .id = "9111", .data = &gt911_chip_data },
 	{ .id = "927", .data = &gt911_chip_data },
 	{ .id = "928", .data = &gt911_chip_data },
 
-- 
2.33.1

