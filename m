Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7650A1568DC
	for <lists+linux-input@lfdr.de>; Sun,  9 Feb 2020 06:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgBIFFF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 9 Feb 2020 00:05:05 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:36299 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgBIFFF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 9 Feb 2020 00:05:05 -0500
Received: by mail-qk1-f195.google.com with SMTP id w25so3359269qki.3;
        Sat, 08 Feb 2020 21:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0WxM1glhIHjjmYurDeLuwSMUWAv8GZusKOox9UoQmHA=;
        b=YpCKXdq4e/ZXIPs4qBNeOCqrj4t31kXsyUGJRwzK1YGTllAuHfzDWtC9x1Nev/Mu5c
         BOJIn7lBL0zRHBTAIGnQkXDokkbZqfKh5Q07zFXt+LKS3ga0IZ1JvXGDVcJpr7St8wev
         62bXjtn0Vin3/1dSsOR62vxp6a226jATfZt0YhKGYaRIYMBnVb43DOJzyL59mWnpXfYb
         qb/sGW8pIIL+F9xJfgxKztWCqJ+jYOTKSGwNlQl7stYGkoO2ZheIL4HZYYZqAhysQEQV
         xChdPkoFSQg5dkPouEyTi0nb5+zgihtSNZueFNFnmVduA2aTKjiTO/lvK+yqn019eco+
         BSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0WxM1glhIHjjmYurDeLuwSMUWAv8GZusKOox9UoQmHA=;
        b=r/NF5s1tdktiwvbXZBVEzW88Jylep42XMD6CmbfvmQsB5GYZQDruffw3/eyKIQSTlx
         GkQO0cvkTwFtmyXI1vxytW+hpAzLcfUc5Hi5TbYrIrT5QRcKa5uo0TUAysQG875UlFkB
         lZW72BI8hwdae8eVANISb5OIjofPq9pjOh0ICr3E82lMz6hls5x7Ev7LVWEAvNLY7/91
         VwOfIFo5wjMLbNkLOIcQA9brNEt3AKM4zXP0MenAGJiCONBHZ0MTIJugrZyo5f+IK1UK
         G6m5Xlpet68wRkkfxIzRbtAb71M+IS9FKdbJ6VEp39TlZkPdw5jgA+IcMX+TmG3iW0l9
         ehEg==
X-Gm-Message-State: APjAAAUqO05RM3WeoNoDldnUyJBHwfQEhdw7cw/6ulWtXKiJQvRIG1Xm
        l42xfcF2h8kwVNt0hWOmwpWfDCB+DCt0F19ta2R64Q==
X-Google-Smtp-Source: APXvYqxMaFnuxS5GfhlBEbE5HlQXiqUXBYU/S6sHRodHl12GIYOkvxTkK0Tx3b3UzFErLCu+nhZEdGVj9grt366ooac=
X-Received: by 2002:a37:e109:: with SMTP id c9mr5238665qkm.366.1581224702791;
 Sat, 08 Feb 2020 21:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com>
 <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk>
 <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
 <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm> <CAO-hwJ+k8fxULS1xC-28jHmhZLZVN5EGc=kY5sqNX1GCNKpt4A@mail.gmail.com>
 <nycvar.YFH.7.76.2002031218230.26888@cbobk.fhfr.pm> <CAO-hwJJk411hGTJ6uSdzAFCzf1WJehhifdN0r5kMG6aqL=dnpw@mail.gmail.com>
 <7234b9c22612f43c9458e84f74faf32f658b0015.camel@hadess.net>
In-Reply-To: <7234b9c22612f43c9458e84f74faf32f658b0015.camel@hadess.net>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Sat, 8 Feb 2020 21:04:51 -0800
Message-ID: <CAEc3jaB-99-=rHgFTNODigVhxPXdPv3d3j6=EnjP=b1UTZOjvQ@mail.gmail.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Martyn Welch <martyn@welchs.me.uk>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "Conn O'Griofa" <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 6, 2020 at 1:34 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Thu, 2020-02-06 at 09:09 +0100, Benjamin Tissoires wrote:
> >
> <snip>
> > If this is something Roderick would be interested in, we can then try
> > to extend this initial work on Bluetooth controllers and the
> > DualShock
> > ones.
> > Adding the clones ones based on the current kernel code is something
> > doable, but I do not expect Sony to be involved in that process.
>
> Sony didn't provide any of the code that allows us to support those
> devices over Bluetooth, and support isn't complete either.
>
> I'd certainly appreciate getting information about how to pair those
> devices (if there's anything on top of the code already implemented),
> how to pair the PS3 headset and keyboard accessories (which are still
> unsupported), and how to access the headset pairing for the PS4
> controllers.
>

At this point our main priority is supported related to DS4 (this is
what our permission is for). The other areas are very hard for me to
get info on, so I can't promise that right now. Audio related stuff
for DS4 is a maybe at some point. It is very complicated and all
tunnelled through HID... (in case of Bluetooth).

Thanks,
Roderick
