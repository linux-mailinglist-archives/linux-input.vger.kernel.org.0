Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D97811F3B6E
	for <lists+linux-input@lfdr.de>; Tue,  9 Jun 2020 15:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgFINJb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jun 2020 09:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgFINJa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jun 2020 09:09:30 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5188AC05BD1E
        for <linux-input@vger.kernel.org>; Tue,  9 Jun 2020 06:09:30 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id x18so1260253ilp.1
        for <linux-input@vger.kernel.org>; Tue, 09 Jun 2020 06:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SJh9CwyVSTXvz8wjovEtRYmvQcXfzwMmH19UP5w8CfQ=;
        b=J79mn1sJKyQZNH5+KkNYW2OTKgDQ0Gn+axadbJEwFwqudq7vqcscgE/1jNDpW2nPmo
         rLwDOZbs/9HHSt/JSWdmoLer8uenNKZ8113uN43Gvk36rlG88c7L93v/dQgyWhx7ETe8
         qJz2LF4nKduWTFdHAnDciFyQVug/cHmD2NFqUoi/5sL1ons5lvMAgP2iE1dtoPZYgQK9
         vKuch5hym9zHHf/S8TLkxneHp9nitW/YQXmGrV3gUprFstjCf0KRoeYYI293x4jGZPtT
         v0V35fNEqm/tOPhWOJ+pgsK4bKGqwfKLRkJYajpxzwPbCv0M4sz958FqkfBsgZAaT+29
         U3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SJh9CwyVSTXvz8wjovEtRYmvQcXfzwMmH19UP5w8CfQ=;
        b=eGpTxUm9tdFrthZofU/+hWFkswXqzq8ORz6b0+2b89ir98ee+HmZhnSep6IVTqD+PC
         qCoV/0Tv/kwyUrhw3LKGDmAa3W5z0/bKx6A9MlhOY6tu9jzTwf6fqQZQIVkyuOxHPSy8
         G0sCUtvvQXJG05ZKg52WDGZqT5jsX8O4+wMoMe2cWCN9k4WrTG2hgB5toRr1Q5hCNhCq
         rk2bwXW5l/okbwnFVNAR+uNxYOaxL2VkLXgzmZXgha+s5eJCRzeFVziCPO/X2ESqzds+
         FFlWxKS0Cbt+WDCNauRlnAhj97p5MwqdIPaux78Pyc3OaIJ2DNJvclmcYqdHUvbmS4mV
         ClYA==
X-Gm-Message-State: AOAM530h2t1OKx7x0gUEYhFKiG1n/PnjtZ+BhuCmTSDepKoiOJoSKp5N
        oMHbqbgBt4bVfkRmML9fooyxJS9demSu+Yv5Q7flFiNA
X-Google-Smtp-Source: ABdhPJzPzt4oIrZp5bEYFCafCphSMyQqb3hNhb99Nl8LBjw+kfZY3wHdBnBNjnXtzKs2/G7rHrIvsHH9hCvTE/nHpoI=
X-Received: by 2002:a92:d0cc:: with SMTP id y12mr25959801ila.308.1591708168992;
 Tue, 09 Jun 2020 06:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
 <CADyDSO5=fN=yw0kZQDpEgrbYXO-PCHDVcYbTk9n1X5XKFef+cA@mail.gmail.com>
 <CANFaMLFFqGi__011BFEL485X91LOw6rxTGynRyNDPD5JVr5c_g@mail.gmail.com> <CANFaMLHGUHgV6xL1kCYj7Uy2GhdJp=og6Rb0sL=2d-Uihkf2ag@mail.gmail.com>
In-Reply-To: <CANFaMLHGUHgV6xL1kCYj7Uy2GhdJp=og6Rb0sL=2d-Uihkf2ag@mail.gmail.com>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Tue, 9 Jun 2020 15:09:17 +0200
Message-ID: <CADyDSO4Fy2zH_d8k=yZRkqK+nN3YSCKpx1ysK3+GPk=s+G_9TQ@mail.gmail.com>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     Daniel Morse <daniel.morse@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 9 Jun 2020 at 11:16, Daniel Morse <daniel.morse@gmail.com> wrote:
>
> Just wanted to check in and see if there was anything else I needed to
> do to this patch before it gets merged?

There shouldn't be. But sometimes it takes a while for non-critical
patches to be picked up. I will add Benjamin as well, maybe he is
around and can apply patches.

Thanks
David
