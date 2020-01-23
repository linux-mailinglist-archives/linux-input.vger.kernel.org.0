Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA77F146FE6
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2020 18:39:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgAWRj5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Jan 2020 12:39:57 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44430 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbgAWRj5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Jan 2020 12:39:57 -0500
Received: by mail-lj1-f196.google.com with SMTP id q8so4449735ljj.11;
        Thu, 23 Jan 2020 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yFNfvLLpVwrxfE4d/23goL8ipurkosHK6cucyJx3weQ=;
        b=NM3FsjMuPvJoEpN6PjTU2zC9O95D/1OOpI+dDQsgi+guT5b518OSJA7bMJ0Nk5xi98
         EMFIj2CGEvAVgLd6NNMShh7Z96gwdtymGCS3AublihRtzY813sfUFXwy0YAqbZutnH7B
         9qdIU1sPjgsqGXK9SKgGc9AX55NUp9j7k163QvhSBF3bokEE9mIrm18pQJHZ9RHeZGhz
         rHRAcVi6LmN1PLCTgu3NBE4T1nJF0DtXYUZIfCRF3Nu0W2L7t0ffguukI0nAxfdqBHJM
         FbiekKDoFJ+5ucboYonNJsNbNs0XA8IBOlPoIhpn7Uy9oHp7jo2Vbyd6zPYGIR3IKdat
         GtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yFNfvLLpVwrxfE4d/23goL8ipurkosHK6cucyJx3weQ=;
        b=ho8LYOv93Ovnkm7LDDIOpYPtNRuaC3BJxJvMahZT31QX0R4a8CvVC0pMQVzD6f7RfW
         ZULY8xy31niACU5SLNgne/z9r1NbDW6X40yLmCNgL+2HaRsVFh0riCGxQ40aI9j0fKs1
         JIammpbDNajGMqfjXagXnWzx1pAt9Wru5ih8fh4/8Jkh64BJ7aN9yaFK4z6EOl26W0Q5
         b1f25tL7zr1kt9oS+4rX9rIH8t4FzcgQSBBapW7XfqfqQpkFmPKSc/ShVKIr4wudpd0Q
         tKFhME0LBwXDklKIdQXYCmDeao5X80XNCPQ7TpraQyy8NhPhsM8VuZWg707EGcRk787B
         IG5w==
X-Gm-Message-State: APjAAAVEVGujtqyKJmdjgy6sDBW+4VX8Qfq6FZX7O6M3q0HcTaxoo1Sw
        fSILeLYnmIyrMRZWOAqqL6rbKcBn
X-Google-Smtp-Source: APXvYqxB/CslpriNX9CDhIYOGnL8o06dSzLt/0G5siEyvWLLw/p9f0d5ulOCOj1AlzCKbl//i4cDWA==
X-Received: by 2002:a2e:9ad0:: with SMTP id p16mr24499202ljj.111.1579801195468;
        Thu, 23 Jan 2020 09:39:55 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id s9sm1912778ljh.90.2020.01.23.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 09:39:54 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] Input: atmel_mxt_ts - correct local variable type
Date:   Thu, 23 Jan 2020 20:39:07 +0300
Message-Id: <20200123173907.6870-1-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

GCC produces this warning when kernel compiled using `make W=1`:

  warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
  if (byte_offset >= 0 && byte_offset < cfg->mem_size) {

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ae60442efda0..bd0fc4b08608 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1287,8 +1287,8 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 {
 	struct device *dev = &data->client->dev;
 	struct mxt_object *object;
-	unsigned int type, instance, size, byte_offset;
-	int offset;
+	unsigned int type, instance, size;
+	int offset, byte_offset;
 	int ret;
 	int i;
 	u16 reg;
-- 
2.24.0

