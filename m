Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F4CE0CE4
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 21:57:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388823AbfJVT4f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 15:56:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44926 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388700AbfJVT4f (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 15:56:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id e10so10572653pgd.11;
        Tue, 22 Oct 2019 12:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CyuPGtUaRLfcMYhsRGlBb14GcxLRh4RB3RjBNNR29a8=;
        b=BucvffFXDdFlhcm5K+i6XepEBuH3I6hj2kr8h+A7Wva/SanlS9qBEkol9e57ZGUi58
         vkii8r1fUF+hUZ/BE7TmQSwQH9tN09LNAKZ/pmLLNiK6ODW7WEtLzuJld7kSRqMORl8b
         4D5gMyLFk3jDJtbI11gOmAkf3gG3zq+KlI+DlzzGY+sjaMnqccG0//Qwxohr1c/Rh+3f
         cTy4EYaHCeYjwrXh+d1T6AhjkWSwiUfAgkaOvyomdrxj9q9LnDHGASe1dzh9zHl7jBgE
         Fwez+fpmDNaByMpSOqiztnPHy1Hp8Pi1rChkAq0evwuWAIifhqoIAr7ZQTXgVGWhBzJN
         0BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CyuPGtUaRLfcMYhsRGlBb14GcxLRh4RB3RjBNNR29a8=;
        b=NmXJDE8bt5q+Rp1UllGhYvNCEB9R/m6CQxTZrT5N6PNKSGyzwPMaLpZ7Hw6Ra7yEem
         hh/fBWuI5q7zrVO7l/MvOFpaZDQe5t935LFW3wHRKrHm5MSY5yq61JxQuAzTadFqN1rf
         mi7996TAs6a/xars+W7P9FSYXs8N94F7AiZwcF3KsLoCITrIP+tDJboATadW4z5O6RnW
         ib+FzrCFm5rfHd8YoRWj5LGFYMmkuMHqWAP+WHtgjawRgXyl8LRt0QZpdlHenspJMLcn
         4o3od3EnpGKLYtXXAaLiiwH0mltt8Sql7AanI+h472H/p97sB1Cc1k70x+OPGKhJRcvC
         BbRw==
X-Gm-Message-State: APjAAAUb96zcbraxwNwKSOyo4jqMZpMfVsk56+dVhIf4jOSppx3v/rEO
        mOGV3ft21G56HDgrc6EbZdA=
X-Google-Smtp-Source: APXvYqxTQjjndjMGgwC6UPQFk/2FOfoWqxYS1DIz89+JLVXzbz+lB8tQ5lauV2+O9iiV2uBt5LNHlA==
X-Received: by 2002:a17:90a:868b:: with SMTP id p11mr7049473pjn.58.1571774192968;
        Tue, 22 Oct 2019 12:56:32 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id c34sm20212715pgb.35.2019.10.22.12.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:56:32 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Martin Kepplinger <martink@posteo.de>
Cc:     Dixit Parmar <dixitparmar19@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Matthias Fend <matthias.fend@wolfvision.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] Input: st1232 - do not set parent device explicitly
Date:   Tue, 22 Oct 2019 12:56:20 -0700
Message-Id: <20191022195622.66976-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
References: <20191022195622.66976-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_input_allocate_device() already sets parent device for us.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/touchscreen/st1232.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index dfc0c6cb0213..0aee330731c9 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -239,7 +239,6 @@ static int st1232_ts_probe(struct i2c_client *client,
 
 	input_dev->name = "st1232-touchscreen";
 	input_dev->id.bustype = BUS_I2C;
-	input_dev->dev.parent = &client->dev;
 
 	__set_bit(INPUT_PROP_DIRECT, input_dev->propbit);
 	__set_bit(EV_SYN, input_dev->evbit);
-- 
2.23.0.866.gb869b98d4c-goog

