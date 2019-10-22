Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDAE7E0CDD
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731436AbfJVT43 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:29 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35245 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733028AbfJVT43 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:29 -0400
Received: by mail-pg1-f195.google.com with SMTP id c8so5771101pgb.2;
        Tue, 22 Oct 2019 12:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KTnOBZV7yx8NmDils5fAf50gZrGC7vwGvWz6YsCLa7I=;
        b=B36yGOPVjnjNGjTLoIt7BVqcQ2A4Xgmqsf6WNSoXtuxNfa+xAq62kGvdLhk2iFayUi
         cibSHMGD/P7EHfMfRNlonn7jnkYpRe6akm09HwLCe/1oF3c+UkNyQAwb6+2/sjy40Dnt
         AjhYG0Y7lBYlvVp0Reuk+fzaG8/qpC//XuqfzBaco+fCSm3SMG2e5vA0ulPXNMyAnqCx
         0kQ78Bo9F9cbOU/xZu+DxNckZRSmVkuZwe3Wk6VdpCybRO1UDJ7UOdPlNIx2VQh2AKcW
         t6NIWMVC6FzCDsz98onm6V1Q0ahY/Ehg23X2EX/yX7IbrFNT9z3eTJkXqmIiNoeinr4a
         gg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KTnOBZV7yx8NmDils5fAf50gZrGC7vwGvWz6YsCLa7I=;
        b=mWBC0oFRFBhk+2imAQiyDx6GRkCDsxBFcLOfSh6vPc+wC3LV06etQ51OghBdGmPFx9
         NE2ZezqVgFHhqHHDM2UpFcDLD19BuSfCTVhUscy1GXeoKZJkU/6k+SLdhtgkOWq+69L1
         d6QrcvyJCH29bykw0jIgQaB/LB7spqC8ATMqvPCOS6a4yxuUskM4qTbZORXX8SSMDPty
         IFLJVnU/gdTTiyZKTsHZf1MyJLTa19phQqmWzSvzTGNI+OrBUlt/KhuqIeNJD2v8ssp2
         30QSCv+HqKDQHvl3bhdruZorJqEExXJefJYRC0U/IdaDIXzWaNEY5kC1ezmsl6lG7G9q
         xdMQ==
X-Gm-Message-State: APjAAAWAEvZvu/chR94PdvHwGY/wGnVpfIVJN0F1JqXi4yO152bUG2d9
        elsKCI4/TmjsY8vH3F21yNo=
X-Google-Smtp-Source: APXvYqwNarsIKzR/4LFw0H3HX4iVDgWFexava5gDwyk/CkpJenhnBQ4BkrFPX50pSryuYiBuxsakRA==
X-Received: by 2002:a63:2224:: with SMTP id i36mr5771312pgi.9.1571774187769;
        Tue, 22 Oct 2019 12:56:27 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:27 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] Input: st1232 - do not unconditionally configure as wakeup source
Date:   Tue, 22 Oct 2019 12:56:16 -0700
Message-Id: <20191022195622.66976-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Do not unconditionally configure the touchscreen as wakeup source but
rather rely on I2C core to do that when requested (either via
"wakeup-source" device property, or when creating a client with
I2C_CLIENT_WAKE flag).

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/st1232.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 47033ef3749a..f1b97075aa9b 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -266,7 +266,6 @@ static int st1232_ts_probe(struct i2c_client *client,
 	}
 
 	i2c_set_clientdata(client, ts);
-	device_init_wakeup(&client->dev, 1);
 
 	return 0;
 }
-- 
2.23.0.866.gb869b98d4c-goog

