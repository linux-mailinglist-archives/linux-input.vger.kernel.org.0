Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED5D1B2965
	for <lists+linux-input@lfdr.de>; Tue, 21 Apr 2020 16:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728802AbgDUOYt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Apr 2020 10:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726691AbgDUOYs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Apr 2020 10:24:48 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD701C061A10;
        Tue, 21 Apr 2020 07:24:47 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id q8so11142689eja.2;
        Tue, 21 Apr 2020 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rou5d8kf8gUOpnxl5qqoSrEqJx1ddpn4a1Q8nLvOF3E=;
        b=WG0tmbqNiM0ZDNu6cGinyGt7KU8mkcPgmaXT6myRHwIhGPuspl8rIni5QSBAZ1kBjb
         HurR9Y0r1I5FJpTE21v4O87mc3c3XQB0EXY7LmSSku0YacGqyh3j2XSmz41TR7xbCSH5
         uXsmOOSRDubgrKbUijD7dYYA2IkNaNbSjCwesJxuH60aaX+Wx4e3unvkwTiEtUbH8xxb
         f73JTyhdcxyOjFlX/fE2lcuuetHzL/VFuF1cuR/4SXBb7ezYiZWRPFdfX+erHSeJ9PI2
         70NOH733h5F/RuuzPx4jF11kj1cQ6jMOQ/v1MMY/6Zci+keUVd99+qJr9dWlep0AOcCt
         yWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rou5d8kf8gUOpnxl5qqoSrEqJx1ddpn4a1Q8nLvOF3E=;
        b=RAsyuJs0M8OFwbY0+LkBdw0OtWUP7F6aNFsrmIftXvkWu7DgBxowoT3EGhlSj1bQf7
         mtnh2fU2NB0B+BmpLR8Z8Viwj58aM9TvB4QyOmHKwl5z7fUl9I8XMW1MFO/7b8u9AKRi
         tZ4PuRyZSLgrqr8hEGcpr03ztEYYw4vElJRoEXl2bDTlWMVpenqLlAXNLYY14dNpMQ9e
         ltw3huzGE10ZpHSfIMbr1dXAqU9BZ/3TsHcMhJuE0G1VYd/B1j9ZjBYiwsAgZibXkVAi
         jrxdRMdReh6fFRNC+aS+SqbZk9+n4GazTgz0yCRsQCrCaWqaXn9CMxiY9gyKGtLKaAkh
         RIxQ==
X-Gm-Message-State: AGi0PuZJuHh3P7finKko3jbMDQBJH16ExVis4tciy3Ygkx9MSkjAWTup
        tipxpa4m5KyVJWNSJz2wZ5j0gauBZV8i3/K24kY=
X-Google-Smtp-Source: APiQypK/Q0dKBixOSg4+O0hH/xrTT3hKVNKA8YzeCPmVxFKoc/Aveny5Hl5FpUQXHRD/tAN9qJyCRKD2u735t6CLVcE=
X-Received: by 2002:a17:906:160a:: with SMTP id m10mr20703653ejd.8.1587479086617;
 Tue, 21 Apr 2020 07:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200421132548.5627-1-karasevm98@gmail.com> <1fd3919b-6094-9c33-64d0-e8775c4428bc@redhat.com>
In-Reply-To: <1fd3919b-6094-9c33-64d0-e8775c4428bc@redhat.com>
From:   Maksim Karasev <karasevm98@gmail.com>
Date:   Tue, 21 Apr 2020 17:24:34 +0300
Message-ID: <CAFTSnMhSF39MeiRccRm1QB0nk1F19iZ0w5K_ChxVvJqGh9FMAg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for the ONDA V891
 v5 tablet
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,
Sorry, but I think you are mistaken,
the v891 and v891w are 2 different tablets (different screen, battery,
camera, and internal storage).
My patch is for the v891.
Thanks.

-------------------------
Maksim Karasev
