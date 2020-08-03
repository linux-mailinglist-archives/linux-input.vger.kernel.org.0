Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3751323A7E4
	for <lists+linux-input@lfdr.de>; Mon,  3 Aug 2020 15:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgHCNsn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Aug 2020 09:48:43 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43931 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726579AbgHCNsm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Aug 2020 09:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596462521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=SMxVmqh9+IpJqntX4TYmN4Y+TTmVHJNY5eblJs9DUyI=;
        b=Um/nxUAC1qB4cQfQL5bK5OEqDTuEpy/BmMl/5LKCPgISS75heJhk+3aQJIygDm+6Ao6nt9
        iKyNSp+ExCi1QiRJUzG7ttgID9ZRAXys4cXNaxt55YOxhRh3HjIJRkLKhvyHCQjgbCIGqr
        xA96mNggB5/kMX0nCD1voEdARP6foms=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-FzrubfngOTao59S9twjAdw-1; Mon, 03 Aug 2020 09:48:39 -0400
X-MC-Unique: FzrubfngOTao59S9twjAdw-1
Received: by mail-qv1-f72.google.com with SMTP id d9so16860484qvl.10
        for <linux-input@vger.kernel.org>; Mon, 03 Aug 2020 06:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SMxVmqh9+IpJqntX4TYmN4Y+TTmVHJNY5eblJs9DUyI=;
        b=azeiDE8Th4lwhL4jwp6fRc8y6+wEUCDFqyNjgQHhIjs78I88PSKQYah9yVejPXWlCg
         6WWBuQhAmWYO68tZhpPlRunq1SHgThjnwHEMIaxEf2JEca051wyGaU0K81MphYDAwbkh
         2mWuOgLeh1PmMvECl1MUG/5J7gd9mVOivalZ9TDvqOS6lzGUuXtJL3SVyrDktA+/lKoS
         DQJsQ9qeEpgRhLEyz2j/nu86PY5pwmz84xrW2KOw5rbLbiCwESVi2B0uB5Z0LbYn5waY
         WEFnzCUSZuThTJdC3e8hiKf3jAofbNEkLUxgY0vAspjDQUkdTJlZ+SNaeffMazssSXHR
         WXcQ==
X-Gm-Message-State: AOAM531jAS7nqJH/MwxXAgSOUfHGzPHNb1H79pZn9zQMC8X2n4OCRWuf
        r/2UCpfLWFgVveBQnjkLzupFgw6MSHrSZyrcF1ZRUKEYwMyiS6ZQ9LwdQ71PZFaCf5JzcwYGM0h
        FMRFQSc5gF1wuKOwXw2y6oro=
X-Received: by 2002:a37:90e:: with SMTP id 14mr16647328qkj.102.1596462519484;
        Mon, 03 Aug 2020 06:48:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Q9H9YNB/cgP7w/wWSAvOIBiIgVexrNtMfORoaMNYcUfqssZruqZR5pgv924elJAriQdwDA==
X-Received: by 2002:a37:90e:: with SMTP id 14mr16647309qkj.102.1596462519240;
        Mon, 03 Aug 2020 06:48:39 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id d46sm22820662qtk.37.2020.08.03.06.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 06:48:38 -0700 (PDT)
From:   trix@redhat.com
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com,
        ezequiel@collabora.com, bleung@chromium.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] input: atmel_mxt_ts: fix double free
Date:   Mon,  3 Aug 2020 06:48:32 -0700
Message-Id: <20200803134832.6290-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Clang static analysis reports this error

atmel_mxt_ts.c:1850:2: warning: Attempt to free released memory
        kfree(id_buf);
        ^~~~~~~~~~~~~

The problem is with this code block

data->raw_info_block = id_buf;
...
error = mxt_parse_object_table(data, id_buf + MXT_OBJECT_START);
if (error) {
	dev_err(&client->dev, "Error %d parsing object table\n", error);
	mxt_free_object_table(data);
	goto err_free_mem;
}

mxt_free_object_table() frees id_buf

kfree(data->raw_info_block);

So skip over the second free

Fixes: 068bdb67ef74 ("Input: atmel_mxt_ts - fix the firmware update")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 6b71b0aff115..1cc0f492f4f4 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1839,7 +1839,7 @@ static int mxt_read_info_block(struct mxt_data *data)
 	if (error) {
 		dev_err(&client->dev, "Error %d parsing object table\n", error);
 		mxt_free_object_table(data);
-		goto err_free_mem;
+		goto err_free_mem1;
 	}
 
 	data->object_table = (struct mxt_object *)(id_buf + MXT_OBJECT_START);
@@ -1848,6 +1848,7 @@ static int mxt_read_info_block(struct mxt_data *data)
 
 err_free_mem:
 	kfree(id_buf);
+err_free_mem1:
 	return error;
 }
 
-- 
2.18.1

