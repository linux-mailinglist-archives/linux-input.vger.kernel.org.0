Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72192E332C
	for <lists+linux-input@lfdr.de>; Mon, 28 Dec 2020 00:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgL0XIM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 18:08:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgL0XIM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 18:08:12 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 183C4C061794
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 15:07:32 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id v126so7648914qkd.11
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 15:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q0jESGDJuKBF/wwstpF++At7ApAGR+UpBkxEOaUQQtY=;
        b=rLtRjYWMURvv4nboF+5KBERaH2IvsQDte8pnu9s7F/onHlRDSF/sqejXoxOCLffRJu
         2Ff8m6Us3hjDXHCGlWCGW/1ccTMklCSJE6oNzUFD+PIdYRx6/6khd1hGJBtBdf+t/52D
         cazd5ucm2xfVvcWj/POajh5LhkezXgaH2S+xap+ZypBqxAnQU7hnEA9wtOLa8AxSorAe
         BMW1NkuHQfCPhME+PobqOY3VJs4wy84sK8wnRBPonQpdmWtaL64aifT8pxSJJu6wtcTP
         SMSA9jktnA3QrCRW4smh1VQNf6qxyHgxiLdwt6kgeHlJkZjLtPBEehnDOyrekENONzWI
         zg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q0jESGDJuKBF/wwstpF++At7ApAGR+UpBkxEOaUQQtY=;
        b=H6KilvAWAray6RTw1qp84veF1lBP+5CIDCYOWSr8pPclFue2DgZEFDIlKtzO1j2sdZ
         C1ofqvgCiEqQsKwM3SSjjx9BrdeNiC4zOSigBa1QjcJI6cFQ00R52jLQ7Pymmqptd2s+
         +3hg0HJusZASvf+IUy0WwQuj1eouT69ChHKewZ1zPOhMaNdVz6CVKnXxMgJFxqtaDd8T
         o0WQ6JNPr6iV+k4t5MfM8M/pAKVcs5mg1hQtyBELf/IBqlYH6ygJ1iDgSqCLP6X8urYM
         lVgy+0cVsTulBw27tGXZAmIIf+x4tTxILr+wGRmHLRbftZug+kojbVWI31hidYCtArCi
         N7bw==
X-Gm-Message-State: AOAM531xO3q+3/lY3Ysfs37Ha+A1yQ1Wlnpuc6C5l4Mbx4urjyJLkGtB
        V+pmODWm7NwvcdxmbiDrOPpmwa945ye83aQXeCdkKQ==
X-Google-Smtp-Source: ABdhPJzSjBsc+VTH+dHCsUMoKiLFSM7Bl6Fd6QQ3bN2rvEMnDfYwHVKOSPoc7zMSfV2kHDixgN2fsQ9cRd4NtY/Rr/A=
X-Received: by 2002:ae9:e64d:: with SMTP id x13mr41911667qkl.464.1609110451170;
 Sun, 27 Dec 2020 15:07:31 -0800 (PST)
MIME-Version: 1.0
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-13-roderick@gaikai.com>
 <20201227000813.axo7h2tsaa4eqqbr@fastboi.localdomain>
In-Reply-To: <20201227000813.axo7h2tsaa4eqqbr@fastboi.localdomain>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Sun, 27 Dec 2020 15:07:20 -0800
Message-ID: <CANndSKmRswAAJKS9tkFoiskaerwkeFbPzSfR1wmtx3iF8Wr-2g@mail.gmail.com>
Subject: Re: [PATCH 12/13] HID: playstation: DualSense set LEDs to default
 player id.
To:     =?UTF-8?Q?Samuel_=C4=8Cavoj?= <sammko@sammserver.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Dec 26, 2020 at 4:08 PM Samuel =C4=8Cavoj <sammko@sammserver.com> w=
rote:
>
> Hi Roderick,
>
> this one is very much just a nitpick, yet not completely pointless.
>
> On 18.12.2020 22:23, Roderick Colenbrander wrote:
> > @@ -837,8 +859,8 @@ static void dualsense_output_worker(struct work_str=
uct *work)
> >       }
> >
> >       if (ds->update_player_leds) {
> > -             r->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATO=
R_CONTROL_ENABLE;
> > -             r->player_leds =3D ds->player_leds_state;
> > +             common->valid_flag1 |=3D DS_OUTPUT_VALID_FLAG1_PLAYER_IND=
ICATOR_CONTROL_ENABLE;
> > +             common->player_leds =3D ds->player_leds_state;
>
> This change should be merged into the previous patch, as it doesn't
> compile without it (typo, I suppose). Could lead to annoyment during
> git bisect and all that.
>

Yep that doesn't belong here. Rebase artifact and I didn't compile
that particular patch after the fact apparently... Will run a 'rebase
-x' with a compile script on the next revision to make sure nothing
got messed up...

Thanks,
Roderick
