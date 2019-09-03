Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99C69A6CA2
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 17:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbfICPOB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 11:14:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48204 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728576AbfICPOB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 11:14:01 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 5F9DA2D6A0B
        for <linux-input@vger.kernel.org>; Tue,  3 Sep 2019 15:14:01 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id f19so19302342qtq.1
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 08:14:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CaPZ1zkWwINlsmN10NDJY2kQHdXVRLZB3mGk6bOHXV4=;
        b=Nnh6BwhxFkI6CBwGAlg0IPFFU/DdZYHFwF/HmVrAYk0sJhKfy5xOFagUAwiyiL5miM
         ByZnocQ7RjB/eI26oVDbgV+DJ0PPWc2N5cZkwvf3T1ePVQwPbGZVgsh7iKxPkkpvlAqx
         h/Ia63Vhsvil/PDQCS9puQvaUFlY1zXF0ePValyITryNKAy7mZyKaT/hgWnCLs0SFFea
         6+tJugIDpnZcLrVRfdQ364CKE3ABdU6KeMTZ+QcEN+JLr58+qXBeU374IowkAhKIs8Ur
         LXEbPTFfcacz2vm/rXlQ4T0Wow36vDPADY4JHuzHFtmhM/s5+DNFkVNuRmfv7wTsd4r3
         hrCw==
X-Gm-Message-State: APjAAAUuTy99AtSa99/+xvg7feHa2sThM/xNOMJypvc7cIJpG7fajj8o
        Sem0oAXenVCEDtI/FYY/1zNqCs67sFb4GfFrLC4JQRKf8KxW/QTPgzrlKuvSjCxtioQm5RJ3utI
        NzMkGTpzGwTUTh5rGOsaFeVwGLsC0gcaBX0yowuQ=
X-Received: by 2002:a37:6756:: with SMTP id b83mr12785603qkc.170.1567523640750;
        Tue, 03 Sep 2019 08:14:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyAtP3KTpDw6MJmnw+mTpEUCk0L7u6deDIOslI5akLbIxzDuWVhXLPbeq9LcRcqgABTlssXjj2hrV0WTZg4FGc=
X-Received: by 2002:a37:6756:: with SMTP id b83mr12785584qkc.170.1567523640616;
 Tue, 03 Sep 2019 08:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190702083931.7392-1-hadess@hadess.net> <2505a7c3e29afb5a140ed47e54ea9c72d0192367.camel@hadess.net>
In-Reply-To: <2505a7c3e29afb5a140ed47e54ea9c72d0192367.camel@hadess.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 3 Sep 2019 17:13:49 +0200
Message-ID: <CAO-hwJLGfvNMgV9eU8xAur+a1NbvtV62gD2XVY6WXdOKrx0JUQ@mail.gmail.com>
Subject: Re: [PATCH v6] HID: sb0540: add support for Creative SB0540 IR receivers
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Bastien Nocera <bnocera@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 3, 2019 at 4:15 PM Bastien Nocera <hadess@hadess.net> wrote:
>
> Hey,
>
> On Tue, 2019-07-02 at 10:39 +0200, Bastien Nocera wrote:
> > From: Bastien Nocera <bnocera@redhat.com>
> >
> > Add a new hid driver for the Creative SB0540 IR receiver. This
> > receiver
> > is usually coupled with an RM-1500 or an RM-1800 remote control.
> >
> > The scrollwheels on the RM-1800 remote are not bound, as they are
> > labelled for specific audio controls that don't usually exist on most
> > systems. They can be remapped using standard Linux keyboard
> > remapping tools.
>
> I'm back from travelling, so ready to update/respin this patch if
> needed.
>

Nope, looks good now.

Applied to for-5.4/sb0540

Sorry for the delay, a mess in my mailbox hid the v6.

Cheers,
Benjamin
