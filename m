Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE8C1F8331
	for <lists+linux-input@lfdr.de>; Sat, 13 Jun 2020 14:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgFMMWm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jun 2020 08:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgFMMWl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jun 2020 08:22:41 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74B93C03E96F
        for <linux-input@vger.kernel.org>; Sat, 13 Jun 2020 05:22:41 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id l26so10246059wme.3
        for <linux-input@vger.kernel.org>; Sat, 13 Jun 2020 05:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JzoVj8ZbOPznrQQWw5+PHzf2GdbYD0QexeUhGOvRrYQ=;
        b=LnZTWcAC4RmMdQpJ4Wn/GHDGEpYwO8b69YtK00URbVR8bDRoL4HGnvgCyyYCPqRH0c
         wp8+qYyVTtPfqP9e3wPX9FkTtmSOFP9m8BdnE52mle44zvfVopp+OYG1zOSBtm9OjUmp
         DBwc3K3N1SrfAQDrQqYRComQmRDKeMdGxJo9A74rYjvfnIvtKnPlBHFQXSOVUr6TlpWF
         Mr9lTFfl0PKeNAywh35K4zQbuz4N0CuXBL/qjMQPN6QJrD7VCbbfAbg6LHjYHEMNy4ib
         dc3ZY3zaR6/ZBORp58dMXWcDiYRlojKHl0n1GHZ7Xt+OIDpk3bgaGdGZsp8VUZF+5F5z
         bXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JzoVj8ZbOPznrQQWw5+PHzf2GdbYD0QexeUhGOvRrYQ=;
        b=iekKE7LSDaYeby7R1cZbh7qCW9NV/ALjJJDtUce7a0LcE5aSrY2kiElV0j4cRW3laV
         +eE4SUyopQ08MzvFrw9CsSglsI7en9lkQVrc6Ir+2qHaYDbtSkLhxkQxEpAkyHXvaBV0
         S9boOu48mVM5uJ1aLYDXL6GWoWbCDMQJdrnDcFwznOPnjTi9fMx+/08KhLJIoftv2soy
         3MU0RQANt6BBNDseq+d2wmre2jGkx//SkZ3iVy3Ihi7zqL9JsZZDJiu6l1O5n7mX5zkc
         q5ZXJj2H6fuEi7N352/Pni3KYPW1jY+jq9j5hlDkUtjU0x7nCoNh+x7PlQ252hFaF0oD
         CYVA==
X-Gm-Message-State: AOAM530UUl7lTg0ZYHklN0aq++g9VjaP11mBjfpYSASIczjXrCpDsF1+
        aB91esY7yu26Hn+DEYc23VI=
X-Google-Smtp-Source: ABdhPJzbxRSl40N9H2u42dqvn5Fe/xjUjeuTlC8Q6sNHMlemmrFCy3WnDYYL2xpSb0p8vDJ8VA+lkQ==
X-Received: by 2002:a7b:c951:: with SMTP id i17mr3648889wml.44.1592050958123;
        Sat, 13 Jun 2020 05:22:38 -0700 (PDT)
Received: from casa ([92.176.4.241])
        by smtp.gmail.com with ESMTPSA id u130sm13609590wmg.32.2020.06.13.05.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 05:22:37 -0700 (PDT)
Date:   Sat, 13 Jun 2020 14:22:35 +0200
From:   Rodrigo Rivas Costa <rodrigorivascosta@gmail.com>
To:     Siarhei Vishniakou <svv@google.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Subject: Re: Kasan crash in hid-steam
Message-ID: <20200613122235.GA11175@casa>
References: <CAKF84v0xsK2d+XEEnNC+SnE987fDaD=RyvZzZW3ew8L4K0JHzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKF84v0xsK2d+XEEnNC+SnE987fDaD=RyvZzZW3ew8L4K0JHzg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, thank you for the report.

It looks like using uhid you exercised some codepath that are never seen
using the real HW. And that exposes some race handling the list of
devices.

Please, see if the following patch fixes the issue.
Best regards.

---
 drivers/hid/hid-steam.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
index 6286204d4c56..a3b151b29bd7 100644
--- a/drivers/hid/hid-steam.c
+++ b/drivers/hid/hid-steam.c
@@ -526,7 +526,8 @@ static int steam_register(struct steam_device *steam)
                        steam_battery_register(steam);

                mutex_lock(&steam_devices_lock);
-               list_add(&steam->list, &steam_devices);
+               if (list_empty(&steam->list))
+                       list_add(&steam->list, &steam_devices);
                mutex_unlock(&steam_devices_lock);
        }

@@ -552,7 +553,7 @@ static void steam_unregister(struct steam_device *steam)
                hid_info(steam->hdev, "Steam Controller '%s' disconnected",
                                steam->serial_no);
                mutex_lock(&steam_devices_lock);
-               list_del(&steam->list);
+               list_del_init(&steam->list);
                mutex_unlock(&steam_devices_lock);
                steam->serial_no[0] = 0;
        }
@@ -738,6 +739,7 @@ static int steam_probe(struct hid_device *hdev,
        mutex_init(&steam->mutex);
        steam->quirks = id->driver_data;
        INIT_WORK(&steam->work_connect, steam_work_connect_cb);
+       INIT_LIST_HEAD(&steam->list);

        steam->client_hdev = steam_create_client_hid(hdev);
        if (IS_ERR(steam->client_hdev)) {
--
2.27.0

