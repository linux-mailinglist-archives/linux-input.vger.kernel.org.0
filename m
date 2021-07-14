Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3403C7FA2
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 09:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238368AbhGNIAR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jul 2021 04:00:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238341AbhGNIAR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jul 2021 04:00:17 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61674C06175F;
        Wed, 14 Jul 2021 00:57:26 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l7so2022011wrv.7;
        Wed, 14 Jul 2021 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cwFxHb1RMO4cnOHdLugJ8POw5D68KAhoXQGWFP4QlbQ=;
        b=WDP/an2Un/loGOsvZeeV3TVFrirIH1m7Twr1/xCuomcIzxrfwpy99MMnM6sWBL9Aml
         NfwHZG6fEjsiEmv5XyorFQbJTqm936vDiS0tL6L18n7mRO3Hh0lTd/pVHqDfYOCm5CMk
         PNFxqKiRHROe0xPpLO3eoHRtvshf20FS0lk4RPxCKAuVV4diai9VMGshZwkGCkWn6RXy
         FoaGWMExanGtElDBwHgEJy4Vyut2e6WJjufTVwSq4pnOwsflWv1k4RKeHLddjPTpZxJB
         WdSMj+KQoD8eEQmXqCUGF+FaJ0FJejiSPB908TBRbYb8yu/SlmxHG+nH7DsM93vh34mo
         zZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cwFxHb1RMO4cnOHdLugJ8POw5D68KAhoXQGWFP4QlbQ=;
        b=XBXQ+QwcByCO3XHunDtfTuddotyrutSwWhTs/ilO62G6RVqLuf3uFlkfAQJBAXjPD4
         c3x5cptWacLsAxyv/zSAtkBVDQwRaXLR+V+EGxwR6ZOcWPGNeHJj+jeMENV3fvWF0aBW
         0rM2K5GPoIbc1ztJdMM5tNQdq4wPF6mJGa5ySRoDmBZfI1W4AJszaHpE9AI37KFSES1G
         NNVkbMwCzIfiknmDIgm0XogsXdXstpz+eFauQ6z8nJfjOyUcGpqSZ6ZVFiJFPwygdoKT
         fp8NFwxawpJZxMptYc7WkYzdkWfjpudiw4MItzf0soV66F78PGFF7mF3YaLf+xqx7hQ6
         FgIQ==
X-Gm-Message-State: AOAM5312YNf7GESPLsBYjcE4+AxJq91qyAkEgUIFgseQKaUiWAw4ewZl
        XwvGplRuXVa86SUxge/G1ag=
X-Google-Smtp-Source: ABdhPJzvKMG5viVDtqo60yENJRpa5AXM4HYN9DswPrAWjv/nHMdAcKqmhIlYPm14TvSxnKXwksX9ow==
X-Received: by 2002:adf:f110:: with SMTP id r16mr11132237wro.358.1626249444969;
        Wed, 14 Jul 2021 00:57:24 -0700 (PDT)
Received: from localhost.localdomain ([94.73.35.100])
        by smtp.gmail.com with ESMTPSA id d29sm2016576wrb.63.2021.07.14.00.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 00:57:24 -0700 (PDT)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     juw@posteo.de
Cc:     alexhenrie24@gmail.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: BUG: cannot enable iso_layout with apple keyboard
Date:   Wed, 14 Jul 2021 09:57:23 +0200
Message-Id: <20210714075723.17294-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708141935.bx33mv2jxtm752z3@julianexternal>
References: <20210708141935.bx33mv2jxtm752z3@julianexternal>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Hi,
> 
> I have an apple keyboard model A1644 EMC 2815 with Finnish/Swedish ISO layout. When I connect it via 
> cable it works fine. But when I connect it via bluetooth, then the buttons >/< and §/° are swapped.
> It seems to make no difference if I set iso_layout to 0 or to 1. I checked and it turns out that
> hid->country below equals 0, and removing the check
> 
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 6b8f0d004d34..8a764ce4e518 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -267,13 +267,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
>         }
> 
>         if (iso_layout) {
> -               if (hid->country == HID_COUNTRY_INTERNATIONAL_ISO) {
>                         trans = apple_find_translation(apple_iso_keyboard, usage->code);
>                         if (trans) {
>                                 input_event(input, usage->type, trans->to, value);
>                                 return 1;
>                         }
> -               }
>         }
> 
>         if (swap_opt_cmd) {
> 
> makes the buttons act correctly. Please let me know how I can help fixing this.
> 
> Best regards,
> Julian Weigt

Hi Julian,

I can confirm I can reproduce the issue with a Spanish/Spain keyboard.

The problem seems to be that the field "bCountryCode" is not present when the keyboard is connected over bluetooth.

CCing Alex Henrie, hopefully he can add useful information about the issue.

Best wishes,
Jose

