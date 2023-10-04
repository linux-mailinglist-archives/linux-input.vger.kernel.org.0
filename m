Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165287B7621
	for <lists+linux-input@lfdr.de>; Wed,  4 Oct 2023 03:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbjJDBIu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Oct 2023 21:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232262AbjJDBIu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Oct 2023 21:08:50 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2B0AB
        for <linux-input@vger.kernel.org>; Tue,  3 Oct 2023 18:08:45 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-536ef8a7dcdso6588a12.0
        for <linux-input@vger.kernel.org>; Tue, 03 Oct 2023 18:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696381724; x=1696986524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vxM4zNVFuUMx5H9x8OKQLI8DNjHa1TcGf47a6wRUPc=;
        b=KIdclyHoEzmJklFaDJN6ZoZSUZj3CFGeEKoiI2ETrEnikSBUc9hC3ODwehaskiFsZs
         RoutitI9TP/W4DuaZAHyF3dfd3ymjk3XTe/TVHVur8pGpd2HGiPaJHEw0DcO3K1Bpiev
         Ojidu1dW64GoMd4P4watTW8JjJeuB2JwsrvPyj9151Qb9UrppgrfNotnYOlB2050JvjK
         aO575CsyrhOXhc9q/CyOGiqac64IS2nUO/LRy+GD4osP9/ImISd3gMhBaBlPI//TbiYn
         VSQwu490tB9drluMeUji5XW3W7yLxdlfZOoLvsqrIXNfTBnCkMAIc5YagRvE9KgrNFxz
         Z49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696381724; x=1696986524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vxM4zNVFuUMx5H9x8OKQLI8DNjHa1TcGf47a6wRUPc=;
        b=MTaulGMaO4+3offbntqGzJWk3sc/sRdICUUOuj4arn4gTaoNjxEYGnAzHe/ly185hV
         q1H1Gc4ZG1hCw6keouCnY0hVKdR4E6riA+dZXbwNsc3+9skmeAlvf1QTw0zu13kggmue
         6aomd5HdTiMSh3xUtxHDxJxzTyeJTZy5L8KpC/3dd1JULR36LYEKTdnmKO2EOPnSocJs
         qNYFIzI6WvcAvh5kKAsYrtTa0UcmFDyC9hAbcv7Q9i317ykZMBuawMrr+v58+I/OZzOy
         wAFpXf+d3b6fuFEL7Y7WKDR3SqzI9q7cGgZ0xFTXVX6elOrhUkmCpoKI1H7tH4rxUEV2
         kBeA==
X-Gm-Message-State: AOJu0YwxTRDcSaLQkmtzLflxoUu/QOLZ6bZBMZke4ZKWl0dp8X9Ohk2N
        6/nxek1Jt9tsexPkwzZLc6i4WX5mIPOTeFqxxRF4Kg==
X-Google-Smtp-Source: AGHT+IHDHKR3s5a3A/HxReBTzQR4+rqVuNCkERmQJmVfXcOBVLD3NZxto2J5t2WUWe44svD4BC43pI66NQw+/k+o6qI=
X-Received: by 2002:a50:d083:0:b0:522:4741:d992 with SMTP id
 v3-20020a50d083000000b005224741d992mr64635edd.4.1696381724108; Tue, 03 Oct
 2023 18:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <ca0109fa-c64b-43c1-a651-75b294d750a1@leemhuis.info>
 <CAAzPG9NkoaUz_JRtZt_JomsYj-8ZPn4QH0w0eeR-oxd55-18Qg@mail.gmail.com>
 <CAAzPG9NWp8yPU52o7d2-jLjxjLodFOiE_AjoxmCAZ=MXtV__Aw@mail.gmail.com>
 <cf87d6a5-7ff3-4add-8c48-fd3447b32697@leemhuis.info> <1b3f8dd2-6364-4f00-a33e-8b15b8911dbf@leemhuis.info>
 <CAAzPG9MD+UQb_RdiMkPkpQGYe-arD1nMKWngMj4P5s3_zJvphQ@mail.gmail.com> <906cfb11-ee93-4251-a6ff-1c4d9656b577@leemhuis.info>
In-Reply-To: <906cfb11-ee93-4251-a6ff-1c4d9656b577@leemhuis.info>
From:   Jeffery Miller <jefferymiller@google.com>
Date:   Tue, 3 Oct 2023 20:08:32 -0500
Message-ID: <CAAzPG9PrOzOawLBRNenO0Xx1bArg020Qf0iPh1bNJbwUK1c-6A@mail.gmail.com>
Subject: Re: [regression] Resume broken on T14s Gen1 (AMD) due to "Input:
 psmouse - add delay when deactivating for SMBus mode"
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Andrew Duggan <aduggan@synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 3, 2023 at 2:30=E2=80=AFAM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> This didn't print anything on resume, so `psmouse->private` apparently
> is set.
>

Thank you for reporting this and providing the information!

need_deactivate is never being set on the smbdev struct since it's elantouc=
h.
On this machine SMBus is not used so it falls back to PS/2 mode.
When this occurs the psmouse->private pointer is being replaced but
psmouse_smbus_reconnect is still being called on resume expecting smbdev.
That explains why when it is setup needs_deactivate is false, but on resume=
 it
has somehow changed to true.

I've submitted a fix for this at
https://lore.kernel.org/all/20231004005729.3943515-1-jefferymiller@google.c=
om/
and it should resolve this issue for you.

Thanks,
Jeff
