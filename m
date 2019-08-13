Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E46968BB9F
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 16:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729449AbfHMOgN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 13 Aug 2019 10:36:13 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:42596 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729407AbfHMOgM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 10:36:12 -0400
Received: by mail-qk1-f195.google.com with SMTP id 201so79741339qkm.9
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2019 07:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZjanPZgBBEyPxWCrNvo0+y8QHT418sTUREN8w8Bqq60=;
        b=NuxEx9NIhZUrMq80zzVM5EEb/i/b4J8kTmfGEiutS77zLTgcvmbUMTpRHjfGSVydMv
         1G0+4vud6plgg1FWbt98XviBJ5DOEkNlIRa7ZJULieuRJYjC+3YayVnoLlxgR3+zBa8y
         eHooxXnEwuJRevg/jPDsb+ofRIx0FhLBlnYiRuHZWDXh6qMuyCkLRl/1OXZ78dqnW6jK
         FQeqytlHP86jMAQ1CkYMZisNVPfzx78U2COJsM8HQp8+C0m+cz8Jas/5lgUNbWKSFbVi
         hkkkdVb0DW1mnsJkJhz81qnSyGcf4m6d1i/uNggRxUYCxbWMJ4DZUhIrtrKKu1U8Rvy7
         GKjA==
X-Gm-Message-State: APjAAAXwlqS1BmWYswA7RSWPqZI1Lz6c9vJ7LUH6z7fd/h3L6U2CdfRw
        ApoatcbzTw+5MaqNYqbV+eAz71nSdyzG6BgNooxz0Q==
X-Google-Smtp-Source: APXvYqzRol019NvPSrNTT/VjJtyRE4DhuaWy8x//z/XoJpF7W6l814UutHYRA0WSSHYSqXPbS+8qa/qvhBuu0aJxris=
X-Received: by 2002:a37:9bce:: with SMTP id d197mr22500298qke.230.1565706972142;
 Tue, 13 Aug 2019 07:36:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190813133807.12384-1-benjamin.tissoires@redhat.com> <d558b953e88558b8d7955e591fefbe898edeb3ae.camel@archlinux.org>
In-Reply-To: <d558b953e88558b8d7955e591fefbe898edeb3ae.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 13 Aug 2019 16:36:01 +0200
Message-ID: <CAO-hwJL+u+ELM4W5hwzGmh-sDO33wk1yxjqoqf9wz=qn88ROsg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix support of a few Logitech devices broken in 5.3
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 13, 2019 at 4:21 PM Filipe Laíns <lains@archlinux.org> wrote:
>
> On Tue, 2019-08-13 at 15:38 +0200, Benjamin Tissoires wrote:
> > Hi Jiri,
> >
> > another set of patches to send to Linus ASAP.
> > It turns out that we have been breaking devices, so this should
> > be sent before 5.3 final.
> >
> > Cheers,
> > Benjamin
> >
> > Benjamin Tissoires (2):
> >   Revert "HID: logitech-hidpp: add USB PID for a few more supported
> >     mice"
> >   HID: logitech-hidpp: remove support for the G700 over USB
> >
> >  drivers/hid/hid-logitech-hidpp.c | 22 ----------------------
> >  1 file changed, 22 deletions(-)
> >
>
> Reviewed-by: Filipe Laíns <lains@archlinux.org>

Thanks.

I have schedule those 2 patches into for-5.3/upstream-fixes.

Cheers,
Benjamin
