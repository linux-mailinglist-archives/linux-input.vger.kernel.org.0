Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66CB03ACD44
	for <lists+linux-input@lfdr.de>; Fri, 18 Jun 2021 16:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhFROQU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Jun 2021 10:16:20 -0400
Received: from mail-m121145.qiye.163.com ([115.236.121.145]:39616 "EHLO
        mail-m121145.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFROQT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Jun 2021 10:16:19 -0400
X-Greylist: delayed 331 seconds by postgrey-1.27 at vger.kernel.org; Fri, 18 Jun 2021 10:16:19 EDT
DKIM-Signature: a=rsa-sha256;
        b=HO9w3gRK59eJoIOwdACwms5KDVLaPvYdpnVBujmMK4wAZns5fTHDgz9ve4HcURvsC2rLO57sOBaDGLLh7xLo8XPZMab5lvF//fLLjPHHFxAr3nHdvYGg79yAm/GGlppZCoIRdPak+YHK4YFnocDYmsUGLBjmVN31mFy3EkYwtEY=;
        c=relaxed/relaxed; s=default; d=vivo.com; v=1;
        bh=Gd5CtuneNHxQl+0mWZwuYlaWq6LDI8Zmek0NOCUzXW0=;
        h=date:mime-version:subject:message-id:from;
Received: from ubuntu.localdomain (unknown [36.152.145.182])
        by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 3E42580033E;
        Fri, 18 Jun 2021 22:08:38 +0800 (CST)
From:   zhouchuangao <zhouchuangao@vivo.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        zhouchuangao <zhouchuangao@vivo.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Philip Chen <philipchen@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/input/keyboard/cros_ec_keyb: Use kobj_to_dev() API
Date:   Fri, 18 Jun 2021 07:08:01 -0700
Message-Id: <1624025283-56360-1-git-send-email-zhouchuangao@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGkwfGFZJT0wYQk1MTk9MHx1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBA6Ojo6Kj8KQkI1PS4dFC4B
        Vj4KFA1VSlVKTUlPS0lOSEpDTEJKVTMWGhIXVQETFA4YEw4aFRwaFDsNEg0UVRgUFkVZV1kSC1lB
        WUhNVUpOSVVKT05VSkNJWVdZCAFZQUlLTks3Bg++
X-HM-Tid: 0a7a1f73c417b03akuuu3e42580033e
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use kobj_to_dev() API instead of container_of().

Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 38457d9..fc02c54 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -644,7 +644,7 @@ static umode_t cros_ec_keyb_attr_is_visible(struct kobject *kobj,
 					    struct attribute *attr,
 					    int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
 
 	if (attr == &dev_attr_function_row_physmap.attr &&
-- 
2.7.4

