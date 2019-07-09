Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE60863A55
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2019 19:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfGIR5Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jul 2019 13:57:24 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43768 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIR5Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jul 2019 13:57:24 -0400
Received: by mail-pf1-f193.google.com with SMTP id i189so9658572pfg.10
        for <linux-input@vger.kernel.org>; Tue, 09 Jul 2019 10:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qkTnc9KFxu+eKkMI+ViyuqAH2l9mhes3oVPetOo6UQY=;
        b=kH2Xr5PKkvPiBIbtnj6MZx5BcJmwSCNPYlmSZPff6YRpV0M6JyGSKFG8UWWWGWc68e
         n6Re9PfR00VnhBuO4KV2ZMBLOnvhp/y4eFcficbncQiSTjlvCqFxFxdS7yQRdqoM9um1
         zefV9DGAXCSHUQsC8X7HKP2XKi8Ba+N+qHGt9g+erWPn7qLebacUdK42msZuFco6ScDg
         herty0K+BB91hoFzHBDw0P1SYh7wdS+1Mjhg+H0TkpPGDMPmIx49xaQMYzcfV52B+/G0
         uFOwQDbqMH8XDDffSwYoK//U10bYjw1Q6h8nqOXqSLfijDVD3dGqItfIf5X/OVt5VHWf
         HoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qkTnc9KFxu+eKkMI+ViyuqAH2l9mhes3oVPetOo6UQY=;
        b=j0MM34lJJssIb7vLYVKGYDnWSBPouj51232i7RSzy/M0bS5AwCmwbjqSxQmMIghRdY
         UAC2k45JII9YN9yshA7/29+8q0Jy3CDpM9QkCjGFv6rwAKrLwNi9guIrMFMmNAkE2fYj
         x+J6B7DW+Cb3WbV7NBNCG8bCPBCAGUZ/CqdwRzykjp9rIipxFJz6sEbBoghNxE0NUbuZ
         hpIRB4byKAsLri/MKvflT+rpgTQnUXmS5+F6GdKBzqfTYhPLnJ22NltkDFcvtIhwLMqE
         V4xnBweI0l05PENTkRDi68wEt7GylAPVJZMSs+16jUf/JktWOBwKb6fnp0FXdiyLzsmw
         il2A==
X-Gm-Message-State: APjAAAVTcsdc7npEBGKW3UL7lTYXpLEWDpugmliUMIrqzAyLbVG8CNjl
        5UMtWYon/jkxLaYO6clqLq0=
X-Google-Smtp-Source: APXvYqyHEj1ycd0OwQ4OuYIRtHZp+tj2PbBPUkVMBjOFdxSPMPV6yLypN53LzZ+IKw5gtq9D2WzA0A==
X-Received: by 2002:a65:47c1:: with SMTP id f1mr31464882pgs.169.1562695043418;
        Tue, 09 Jul 2019 10:57:23 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id o24sm20051491pfp.135.2019.07.09.10.57.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 10:57:22 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     hdegoede@redhat.com, dmitry.torokhov@gmail.com,
        maxime.ripard@bootlin.com, wens@csie.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] input: keyboard: sun4i-lradc-keys: Add of_node_put() before return
Date:   Tue,  9 Jul 2019 23:27:07 +0530
Message-Id: <20190709175707.14278-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in three places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/input/keyboard/sun4i-lradc-keys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
index 6ffdc26b9c89..4a796bed48ac 100644
--- a/drivers/input/keyboard/sun4i-lradc-keys.c
+++ b/drivers/input/keyboard/sun4i-lradc-keys.c
@@ -198,18 +198,21 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
 		error = of_property_read_u32(pp, "channel", &channel);
 		if (error || channel != 0) {
 			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
+			of_node_put(pp);
 			return -EINVAL;
 		}
 
 		error = of_property_read_u32(pp, "voltage", &map->voltage);
 		if (error) {
 			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
+			of_node_put(pp);
 			return -EINVAL;
 		}
 
 		error = of_property_read_u32(pp, "linux,code", &map->keycode);
 		if (error) {
 			dev_err(dev, "%pOFn: Inval linux,code prop\n", pp);
+			of_node_put(pp);
 			return -EINVAL;
 		}
 
-- 
2.19.1

