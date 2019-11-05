Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A336F01EE
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2019 16:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389764AbfKEPx4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Nov 2019 10:53:56 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:32962 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389571AbfKEPxz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Nov 2019 10:53:55 -0500
Received: by mail-ot1-f66.google.com with SMTP id u13so18067267ote.0;
        Tue, 05 Nov 2019 07:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9v8a/PzkmDRsrpwdgaeR7TWkLNG0Q683Xg54I265G2w=;
        b=rRVqq+4ZBPfA2YUAymgrz5An0lVZjIXc57k4wOmOI/wXaSqHw9pPCcV7EEgYbOKSFN
         hfNglky91reszAIObnfYJjA9mfhKwTrG4TS4Kirj7vtakSodP0gQnD6oW+P6gsRSnTmC
         z6Htqjss3D8D322MOUcDwAoKLJ/MVkYC4tt5RE2dT6+NQtPj6m8vBGKuvc511MZyJoaM
         MJ4I+uV+8TVw4C8XGNiNP7/aMvz2FaMOFnEyW06PY9pw6xUIcVAHsdCXQSKhemeMjlKZ
         d0q+XFFNoCbYYdUTvylf5R+Ivc0HcTBZxtOyWpq7323QnrgGrnz9byBJAJQlNfeszz5I
         vbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9v8a/PzkmDRsrpwdgaeR7TWkLNG0Q683Xg54I265G2w=;
        b=uG28Hf2QPdErWiIhxiZmnkaiamzDnFPVloN5dhg+Fe53A8fk8qAGMxBK6qaCaCZni7
         tDiiXA5idLHocAKSKTeHRVAX6CLK7gMGgaWJRbhEg1eu2H+eddiZyoq37QbbnPlGvEjJ
         9JxGmxKV1M+pl3V5G730wBN6RffHRBbQDf4gIg6DcuFnD73DYJTAMJTvSTzE3eB33QmO
         Yrj1RlptAvtPg1ZEYtAOjwdOE/ZQ2QPE3g7gXwa+/SSQnUD4jkqDO8N1XmbuBFfwTIkQ
         iVyR4h2VKjkWH6ZBUGD5Y85SBa+7N6G4GFRyet1rAyaZ5XMuJnZIvBvVYchSXo6aAwQ6
         o+aQ==
X-Gm-Message-State: APjAAAVfzMljb7J4ah21x2ajCsvH5wlYqiCn7PnUIFhz0Sz7LytS9/eK
        j3JUuQsdgQQ95fagiv2+NfsDaC9ea0HB55e6h/o=
X-Google-Smtp-Source: APXvYqwdcet+g8k959ze849JPip/1q3+KlQJ1DtfSwEz1SjelZjOztklNuK+s2RS6z8+JP/MPquxlotV6gK/RYGYiZ8=
X-Received: by 2002:a05:6830:11d2:: with SMTP id v18mr18387820otq.116.1572969234516;
 Tue, 05 Nov 2019 07:53:54 -0800 (PST)
MIME-Version: 1.0
References: <20191104070116.GM57214@dtor-ws> <20191104183702.8894-1-TheSven73@gmail.com>
 <CAHCN7xJc6DeyQV27OVjD14a8hZT+_Fo9qo-iHgLO414t3y6hVQ@mail.gmail.com>
 <CAGngYiXp52g7X=KLVqxTAhK0AJ9mpgGyaptbkYvhwWfRkQCaXQ@mail.gmail.com>
 <CAHCN7xLhqHzcHro7HYUdNAi8K3ToeruOtLw=0SZNAgNqUpxvHQ@mail.gmail.com>
 <20191104233621.GP57214@dtor-ws> <CAGngYiW0+QkLNmjp4yre2upqsvgEL4Or8rm09k5o7=9WHryyhg@mail.gmail.com>
In-Reply-To: <CAGngYiW0+QkLNmjp4yre2upqsvgEL4Or8rm09k5o7=9WHryyhg@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Tue, 5 Nov 2019 10:53:43 -0500
Message-ID: <CAGngYiXsxnnu5NkV61xWNqup_uOJxpX-UtJCGXfQ=fo0ZeAPsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Adam Ford <aford173@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 5, 2019 at 10:29 AM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> The max position on ili2117/8 is 0xfff.

Sorry, it's actually 2047.
