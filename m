Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22EF21856FC
	for <lists+linux-input@lfdr.de>; Sun, 15 Mar 2020 02:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgCOBba (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Mar 2020 21:31:30 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:37143 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbgCOBba (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Mar 2020 21:31:30 -0400
Received: by mail-oi1-f194.google.com with SMTP id w13so13920583oih.4;
        Sat, 14 Mar 2020 18:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VXyJJa4oBQQ+uT+JNHNMnu1aQ1PPRYgU53MpHacnB7c=;
        b=IT3icGRKBm9ic21ACgD6K3BR5Ki512PXjI8zdm9gI1P5+KExSZzXQwsWDYK7nAlbqa
         7cux/ZEByz8CaAhEWvMekA+85IBKIpdk5vj5sdjmK3jXeHSS4LBH97AOMtXA9uFgaC9p
         6vzFN2lflyUQDb00gvVNW8TrM14naGifClbL1duQZVSbGBZwfjyuGwV66JUbdlmepzjY
         uhwhCMbRDPk47o1/bo/wzkqtIl3e8OGEnoUWonrlMHZ1oA4AdOiQ0XTRp+bC3KMixUrN
         lF/VVFIW8nXvleXSYeegLD14+G0uZq0E62vhAJlevFlG9CrASB6HwVx/P0iqG9B/jW9z
         8Dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VXyJJa4oBQQ+uT+JNHNMnu1aQ1PPRYgU53MpHacnB7c=;
        b=ofMxecK8TXi8pvAgpcU4437k4dI/KdSqiUz2Ck3cSaZzicIczcwj3YmxRRiPCWIFsg
         92UNIcus/qMNby1f3ygGXf3U0bgKlqb2sqtlLtvacKRS7CCYsa4osPfdF+gwJ63MLejF
         ePCX2BjzBdJEE8+KEDyjbghvH47l6iIbA3kXjW7246h0qqz6IX95L6ZArsKAwiXuvAA/
         /zzV25n/HcsycYb+DkqL1ZWoBmVdmXoHinfKRXppPuX3v9h8hgfz94DiJuWp9SthDK5F
         oLCUpha76DGWOqAPJVp9HzvmlNATwrvDzCWkjWKjA6KXyYXk+reVXlurhVusVudF5Gwf
         apXg==
X-Gm-Message-State: ANhLgQ2/lx0P1oPF52yh1wjbiGZpHnzVx7s6r8tKtAk5nkB04qvFjMCp
        IoR89fqg4fyn9cWmnLu0nn37DaC84hoiSQbqukeDDVwng5s=
X-Google-Smtp-Source: ADFU+vtg+w1KKGgnLsXrURgTNcshIGy36gF0ch/IG3LaOgW1UuDSzmI1mtZ3NDBJUL3AozKVHuZTjqhsLxytZoBjUls=
X-Received: by 2002:aca:3f09:: with SMTP id m9mr11970001oia.55.1584234462459;
 Sat, 14 Mar 2020 18:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200304164700.11574-1-tony.fischetti@gmail.com>
 <6c58685f039d329615d84e2df1cd2a155db73c61.camel@archlinux.org>
 <CAOMV6SVxL=DLP6yWa+jHzu5A+PUJTJi4bk_1ZW-kXXwnaCBT5Q@mail.gmail.com> <nycvar.YFH.7.76.2003131222470.19500@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2003131222470.19500@cbobk.fhfr.pm>
From:   Tony Fischetti <tony.fischetti@gmail.com>
Date:   Sat, 14 Mar 2020 21:07:31 -0400
Message-ID: <CAOMV6SV-_A_vAXQ7y=vZheE9A6+Aye0xjst_Zdwk6Y--W3JEmA@mail.gmail.com>
Subject: Re: [PATCH] add ALWAYS_POLL quirk to lenovo pixart mouse
To:     Jiri Kosina <jikos@kernel.org>
Cc:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Before I got your email, I sent the patch again, separately.
I'm terribly sorry but I'm new to kernel development=E2=80=94how do I send =
it
instead as a followup patch? Do you mean just responding to this
thread with the new patch?

On Fri, Mar 13, 2020 at 7:23 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 12 Mar 2020, Tony Fischetti wrote:
>
> > Thanks for the feedback, y'all.
> > I will rename the device and add the signed-off field and resubmit.
> > Thanks again
>
> Please do it as a followup patch on top of your previous one, as I've
> already pushed that one out and we are generally not rebasing live
> branches in hid.git.
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>


--=20
--
Tony Fischetti
tony.fischetti@gmail.com
(718) 431-4597
