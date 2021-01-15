Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53972F89AC
	for <lists+linux-input@lfdr.de>; Sat, 16 Jan 2021 00:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbhAOX53 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Jan 2021 18:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47186 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726811AbhAOX52 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Jan 2021 18:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610754962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cGjEZEFUxe554punPGhls5fx0stMnIYqvwbTtWgboaU=;
        b=ArwV7KCD9Ca5GPkdBxmyxlJTMNTtvGhF+ad4dUEtr66n0Hjtvnjqfcfk5r4y981ZKw9ZGa
        1zUQX/UGTLEzNGKC26pzPApBjdou0YOOp6eD+dLsLQCN4JEcfUM91sSYTLY2dkAKu7b1oP
        R4qxUMM/LlT7wC6df+sY33pY0bljQgU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-dCUyY_nkP8C7v2w2SH2GEw-1; Fri, 15 Jan 2021 18:56:00 -0500
X-MC-Unique: dCUyY_nkP8C7v2w2SH2GEw-1
Received: by mail-qk1-f198.google.com with SMTP id i82so9649535qke.19
        for <linux-input@vger.kernel.org>; Fri, 15 Jan 2021 15:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cGjEZEFUxe554punPGhls5fx0stMnIYqvwbTtWgboaU=;
        b=Fn+8ZwirS5dHzrMVN6nQ5VLRfXmf0GSrSfV0ufK9STGxcteACsUxy71Ow40QYr2uX2
         tyOn/IM9BjGCZ+zLCrCUWsCAhmtlH8Uq7JaVVyWcnGgMXeEEFp1pULwOgn+ZcqwlhdgY
         lkRZD+o8eGbtk2XqalEAb7iuZHCfPCJElaqooWPExZp1NQ3HBzYUiiXaV5N4/2APLpta
         BSPUUwatOlVJvYdN4k0s4r+/KUlYc8V6ZvupUtvQc+Jvr3tDZCS82nc/kjZYoVS17Htq
         nRkJLalKNLNNkLbkbv9kAjbp0RVaxP5oXLCGCn6BBT5YXwL9a5L4JH6J4cucBcxY7uFn
         XhUg==
X-Gm-Message-State: AOAM533RpJxBIptwXD7zsQWIG6Yb8l+pjHI/50N5wAt1S700v5YTNi6+
        Cl59+vnzfwd2kJ/ymea6502VRRwxXiWeWEzaGXie8OcVhMr5Rjsr4zEki2N2ZNhNszws1DhXytW
        BCcSlueKa9y9uATheHeQM+i0=
X-Received: by 2002:a37:9ac9:: with SMTP id c192mr14533318qke.453.1610754959965;
        Fri, 15 Jan 2021 15:55:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpls7ZQlmvJu5XrFUrVZ5xSL5nXDsB8rVwbVCjXoNaUiafJx+npfQJFw5ceiTr+wxzt4bN1g==
X-Received: by 2002:a37:9ac9:: with SMTP id c192mr14533309qke.453.1610754959804;
        Fri, 15 Jan 2021 15:55:59 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id q3sm6075310qkb.73.2021.01.15.15.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 15:55:59 -0800 (PST)
From:   trix@redhat.com
To:     dmitry.torokhov@gmail.com, hdegoede@redhat.com,
        gustavoars@kernel.org, luomeng12@huawei.com, rajatja@google.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] Input: i8042: remove definition of DEBUG
Date:   Fri, 15 Jan 2021 15:55:53 -0800
Message-Id: <20210115235553.290476-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Defining DEBUG should only be done in development.
So remove DEBUG.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/input/serio/i8042.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index abae23af0791..411ebb2cefb5 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -111,7 +111,6 @@ module_param_named(nopnp, i8042_nopnp, bool, 0);
 MODULE_PARM_DESC(nopnp, "Do not use PNP to detect controller settings");
 #endif
 
-#define DEBUG
 #ifdef DEBUG
 static bool i8042_debug;
 module_param_named(debug, i8042_debug, bool, 0600);
-- 
2.27.0

