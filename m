Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C261F8DEC
	for <lists+linux-input@lfdr.de>; Mon, 15 Jun 2020 08:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgFOGft (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jun 2020 02:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgFOGft (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jun 2020 02:35:49 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9C7C061A0E;
        Sun, 14 Jun 2020 23:35:48 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id x18so14274685ilp.1;
        Sun, 14 Jun 2020 23:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1TsNpet0kPA2yLEVEKHNLGs/+445G25oFUvw6oaAJ0w=;
        b=DDtyxcaqXE1CbSTIHz+12EXHjLAq53Fctk19+Ph/3cGHlqp9WD5EapNKVHNyqUFIuQ
         XOsU2rM7k0GZTJ2liGiVhbxmHiqLoFYiht1wFUCPUbpGZBK8FJF6U8skfiYtS7eCiaM1
         2+k0srp9yCaRI9JY14eI3x+jdGOX8eUHJjURs6aVMT4EBSpuugZo086AVk3RVS7uHt6M
         V33R73TypSyI6nzGxw/doTKWZN0JvCPizmpDF5JEV5+AzFmdx5/p9VGBlpgdY+YASulO
         Bg78tG+pla90oHx87MU1s3tEQHM4W9sAGXxG3QlztrZe10OunjY5JQMinGQHRA/C0NV1
         jCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1TsNpet0kPA2yLEVEKHNLGs/+445G25oFUvw6oaAJ0w=;
        b=FC7JDeLeQ5PHJyAKWKJPpVS189Obu59/kVdF6HoRCQMyggllA/Az9QNg2ex+kAk7RH
         Vz+zhn5VU+vScEOG+DXtaPwj5G/H0Q1u873CBZrMfDszwvG7D2FUFFqwVQGH58qAZeAU
         vv27aLWcbsUtYzo3NAHTbTSCuQ2arLPRCa9ZVMCChUmTSlxwJSjdEoYydT/PO3Anj14W
         vWueXBUbaIVTXtzGAYBXLi0uH8seZtOfGx3GLPQpm+uwzyosURrsY8uuwtUlRiu76azk
         XVb4a7qhctil8YQLDFJgy1rW/ge7uxa5QVVaB0cRvDsDnLm4nrUV3RZjCqLZ2wahbdbQ
         /8+g==
X-Gm-Message-State: AOAM53173lwd0wg6IbhSKz/YMUEBgu5ZxAe2agohTWmQNvpyu8klmuMM
        ebfLfeUPydidApk132CUi+UoWXblqw4=
X-Google-Smtp-Source: ABdhPJyl4VbD63c0LIONL4RXBr7lyvsOsefVC/7P3Ibl1HQ8tg+KhzI+mYTN/v8v0kw0WqLNRFjJgA==
X-Received: by 2002:a92:d811:: with SMTP id y17mr24753982ilm.31.1592202948360;
        Sun, 14 Jun 2020 23:35:48 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
        by smtp.googlemail.com with ESMTPSA id q75sm7392753iod.22.2020.06.14.23.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2020 23:35:47 -0700 (PDT)
From:   Navid Emamdoost <navid.emamdoost@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu,
        mccamant@cs.umn.edu, andy.shevchenko@gmail.com
Subject: [PATCH v2] Input: bma150: fix ref count leak in bma150_open
Date:   Mon, 15 Jun 2020 01:35:33 -0500
Message-Id: <20200615063534.80497-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAHp75VcuRvaQwcTP0+Y+QJTvjoEzYTvV40coUxnsZPfWnwcNMg@mail.gmail.com>
References: <CAHp75VcuRvaQwcTP0+Y+QJTvjoEzYTvV40coUxnsZPfWnwcNMg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

in bma150_open, pm_runtime_get_sync is called which
increments the counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
Changes in v2:
	-- repplace pm_runtime_put with pm_runtime_put_noidle
---
 drivers/input/misc/bma150.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
index a9d984da95f3..ec394b4faa14 100644
--- a/drivers/input/misc/bma150.c
+++ b/drivers/input/misc/bma150.c
@@ -348,7 +348,7 @@ static int bma150_open(struct input_dev *input)
 
 	error = pm_runtime_get_sync(&bma150->client->dev);
 	if (error < 0 && error != -ENOSYS)
-		return error;
+		goto out;
 
 	/*
 	 * See if runtime PM woke up the device. If runtime PM
@@ -357,10 +357,13 @@ static int bma150_open(struct input_dev *input)
 	if (bma150->mode != BMA150_MODE_NORMAL) {
 		error = bma150_set_mode(bma150, BMA150_MODE_NORMAL);
 		if (error)
-			return error;
+			goto out;
 	}
 
 	return 0;
+out:
+	pm_runtime_put_noidle(&bma150->client->dev);
+	return error;
 }
 
 static void bma150_close(struct input_dev *input)
-- 
2.17.1

