Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239E442B2D6
	for <lists+linux-input@lfdr.de>; Wed, 13 Oct 2021 04:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236974AbhJMCso (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 22:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbhJMCsn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 22:48:43 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156CAC061746;
        Tue, 12 Oct 2021 19:46:41 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id k26so1158299pfi.5;
        Tue, 12 Oct 2021 19:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=FMEXIPNbonyFdTY8B9TvCugTrgc+K9SofuDZ7xTg0nc=;
        b=VFSV21mabifpeaOxrWBTv1sSFzQa5lz9M9nDY+QJsUs211pCDdOpVeY0U2wPumnN+E
         l718ybRCLZD302WazJ07ZudValPJUKUYJeqNBoCY53D1lB5qNP3j2SuivetM0t9k2Nf/
         JmAq87CYSKIRa9IlyWBZDJwLpzOxHlUvKjMtuoTviKrmgnvCuHvzRSYXAfPEztkEgOSA
         2l+3tOaxyDXe7Z2/3rfNbjKapbo87ZgFtBJ+SALRzdKRmtkrlaMukxmROpw/PveoAC0s
         2M3NRItkPsGZvdF1IaexNGoLyN4GTc3PGjiX0cSf7z2eye4r7ipGJ1hDdHzvA6fYFQp0
         +5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=FMEXIPNbonyFdTY8B9TvCugTrgc+K9SofuDZ7xTg0nc=;
        b=MeNOAdLhG93uSML1jv3jJA4g9mSQNxWriq6O1kj7/FNu8QnYk1h4UXuXE3aUNcouDo
         JzYYzKQNh4g4S15wqkf3uyeajktCT4slHMyYCIUL4AY3RZ2jmATWKsQfgvtxIqsT+3M4
         WLwNZWKnuKCEJDQQen6Er7Wp71IpDcqZB7bd+Og53aO6x2w6e7K6VRkhfeT+F0m5XRAO
         RPlhPmREcXpdjHjGmWFK99aeICnIdf7T3mLHNIbO1OHl1h8A+4Yoqzo+J7Xe8gSFVaiU
         HX8H8dAyKqUhTeLuLWR7Kmge9HQNnXhHHl3mwT6tLjG6dAsTx5uQTzvbcCfFHJOff9xo
         FbMQ==
X-Gm-Message-State: AOAM531JSMtFMO9Dy9gvf6+JiG7nmUoRTtTGyUDzDzi7EuDFMWMfsIOv
        6m9qpA6iLSer/xf1Ru4VJzs=
X-Google-Smtp-Source: ABdhPJzZVfiKt7EcdbRsbFlucNQi9GWtSvz/e9OavuhatDTzX7yD0rIvI8qEik0blltHNMMy8+uH9A==
X-Received: by 2002:aa7:9f05:0:b0:44c:619e:87da with SMTP id g5-20020aa79f05000000b0044c619e87damr35501477pfr.42.1634093200512;
        Tue, 12 Oct 2021 19:46:40 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:618d:87ca:8f95:87c0])
        by smtp.gmail.com with ESMTPSA id p2sm12579812pgd.84.2021.10.12.19.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 19:46:39 -0700 (PDT)
Date:   Tue, 12 Oct 2021 19:46:37 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michael Hennerich <michael.hennerich@analog.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: adxl34x - fix sparse warning
Message-ID: <YWZIjb91d6aAwgss@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes the following warning from sparse:

  CC [M]  drivers/input/misc/adxl34x.o
  CHECK   drivers/input/misc/adxl34x.c
drivers/input/misc/adxl34x.c:245:29: warning: cast to restricted __le16
drivers/input/misc/adxl34x.c:248:29: warning: cast to restricted __le16
drivers/input/misc/adxl34x.c:251:29: warning: cast to restricted __le16

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/misc/adxl34x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/adxl34x.c b/drivers/input/misc/adxl34x.c
index 34beac80e6f0..a4af314392a9 100644
--- a/drivers/input/misc/adxl34x.c
+++ b/drivers/input/misc/adxl34x.c
@@ -237,7 +237,7 @@ static const struct adxl34x_platform_data adxl34x_default_init = {
 
 static void adxl34x_get_triple(struct adxl34x *ac, struct axis_triple *axis)
 {
-	short buf[3];
+	__le16 buf[3];
 
 	ac->bops->read_block(ac->dev, DATAX0, DATAZ1 - DATAX0 + 1, buf);
 
-- 
2.33.0.882.g93a45727a2-goog


-- 
Dmitry
