Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26E76363B33
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 08:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhDSGBJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 02:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhDSGBI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 02:01:08 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9A5C06174A;
        Sun, 18 Apr 2021 23:00:37 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id m9so19862568wrx.3;
        Sun, 18 Apr 2021 23:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=IYmFJ+BJKkV6xPPlNj0ePpOdoBvoVWpe2CwMz3Be8Ss=;
        b=Bx+I8SIqnxfc3KJVfIaC2oBMA/L4EgNFa92VX6KUDIUF/U14nTrnjPkjluEi6kzKUG
         moN01JivZ6Ck9ID5HPo5sZM1z3XygR94dzlOzBb4wbspl1H/dn2eIwil8jKN7HS+YIfJ
         PkVaiEOMmLmx9KpWivXVxdyCS62UtNmVIUA4kaLyavDPYO63BhZYnzLQ/T/fc/WHY5Ar
         QvsV31kmlU6ifzAGsTxmucmyrDKyOJw7fCWnysRhODnQPnXUfvXHpvWxqinvv3/YLT5q
         slvJWet+ZTLGqsWquqNQSz+KOYzLYLwLn01MHUlKdELUdZRUcLnwzyMn7CSFLGL5sIKO
         bEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=IYmFJ+BJKkV6xPPlNj0ePpOdoBvoVWpe2CwMz3Be8Ss=;
        b=pG1QJ1TYRQenIpl5ua1t91ywJgm3YjnsvNysQoz5cM7Vco9HQKi33Zsr61G1yBNLXU
         yzW1ZHb6NW8ZdD3kln+ZY0zNzjhtbhrgkK7vnCm49RW4mp4fByOXBYFWLdGA6aTso+GZ
         PsOiA98fN927MpRwG+ePA/RlsQmMlUeVU6v12FViP8ZMNZx0JnEmUK54nBGinMnEEDad
         RUGyLBYdoYJhQI52HCjDjMNfcw6yGyDXowWIyYepfDh8yBurktAdkXNqoxl1yYp9F/h/
         wZ0yW26luSzd4TVphvZIhSLgF/ADYir9HNxKen8rHpUPQ3JqkQQqbjqdgbntaE7UUo7H
         1DfQ==
X-Gm-Message-State: AOAM530Bx8P0BvdrNsx81jOW7v5oXz+V4uLKytu+cFexfTxVSXUd4WEJ
        d0ofGTq8fntNf4iXDZrtwXI=
X-Google-Smtp-Source: ABdhPJzYywU4adD/FSSILOqIQ2oUcfN8M9ai7CyR3KbsTivPZ0TmissuJy2yFcha1mQSvrljanSTMg==
X-Received: by 2002:adf:f38e:: with SMTP id m14mr12103905wro.34.1618812032763;
        Sun, 18 Apr 2021 23:00:32 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2dc6:900:a414:a08d:9e82:6738])
        by smtp.gmail.com with ESMTPSA id d200sm3837731wmd.45.2021.04.18.23.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 23:00:32 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] MAINTAINERS: repair reference in HYCON HY46XX TOUCHSCREEN SUPPORT
Date:   Mon, 19 Apr 2021 08:00:23 +0200
Message-Id: <20210419060023.3460-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Commit aa2f62cf211a ("Input: add driver for the Hycon HY46XX touchpanel
series") adds the file ./drivers/input/touchscreen/hycon-hy46xx.c, but the
file entry in MAINTAINERS refers to ./drivers/input/touchscreen/hy46xx.c.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:

  warning: no file matches    F:    drivers/input/touchscreen/hy46xx.c

Repair the file entry by referring to the right location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210419

Guilio, please ack.
Dmitry, please pick this minor clean up patch for your -next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c54b8e4520d1..bbe356508f29 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8425,7 +8425,7 @@ M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
-F:	drivers/input/touchscreen/hy46xx.c
+F:	drivers/input/touchscreen/hycon-hy46xx.c
 
 HYGON PROCESSOR SUPPORT
 M:	Pu Wen <puwen@hygon.cn>
-- 
2.17.1

