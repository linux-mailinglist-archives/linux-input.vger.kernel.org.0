Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9DE9991D
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2019 18:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389927AbfHVQZS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Aug 2019 12:25:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44892 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732572AbfHVQZS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Aug 2019 12:25:18 -0400
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 03B3C59451
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 16:25:18 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id h15so7025445qtq.18
        for <linux-input@vger.kernel.org>; Thu, 22 Aug 2019 09:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BobyCGhcbReGb3WBS4gHw8mqIof48hpNCYG3u+entU0=;
        b=TC2aoEnQhzxiTF0PI/3Tdbx5UfPWFknFouyOmJUDwBF3pXVODupjT+lEfaKBimRMDY
         sqrwyLZMB6/7Ei5NbX6TL7GP5B76L8JhYOOj3zdJ1zchNBfeR+s+bUTXF+nqgtbUVznQ
         pBByyDcPEb3NEMvFFpPJBL63L1zL9I5SS3babeYZu00u+B8pPLRVgNJN0lHZD1xGpCRM
         /2qUy4F0bPVYHGqECEiWladWTYPJHmdowKyGG4cFxFurULoRpArwIdiX6TbXJi17nwXg
         PiA2GucUqaywlPs/WD8i8HDFx5aQVF11GXwWe5UyumZsrB/9H2HUs81bkzglntJZD5Db
         LQUQ==
X-Gm-Message-State: APjAAAW53Q/ArhKMhahzncoQmL14fIhke8mw35jpF94T8Q6bBbI7fNO7
        D50qoD6MOOWI6apmLhKJQLt+LLTAydyQ1PQHU4yaqLadHVED+VFoKug6FVKUR2CDhILy0xwDQJx
        1SdJcrOXAqqSjK85n7N8n1hUQlQL5txhiu5GObOg=
X-Received: by 2002:a37:9bce:: with SMTP id d197mr37776553qke.230.1566491117397;
        Thu, 22 Aug 2019 09:25:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCzxx9GIlrS4XEeCbX2mQfjnH5qofbbfKKPHcUlTryzHxO5TNoQ52Nj0sQTldgDLnPN/3HYP791B71A1K3g2k=
X-Received: by 2002:a37:9bce:: with SMTP id d197mr37776528qke.230.1566491117241;
 Thu, 22 Aug 2019 09:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190812162326.14253-1-benjamin.tissoires@redhat.com>
In-Reply-To: <20190812162326.14253-1-benjamin.tissoires@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 22 Aug 2019 18:25:05 +0200
Message-ID: <CAO-hwJ+kujRCBw-A8HV7ppLbnD-nkOsqFd3_KgCD9UBR23oq2w@mail.gmail.com>
Subject: Re: [PATCH 0/2] HID multitouch: small fixes
To:     Matthias Fend <Matthias.Fend@wolfvision.net>,
        Jiri Kosina <jikos@kernel.org>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 12, 2019 at 6:23 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> First one should prevent us to add more quirks for Win8 devices
> that have a trackstick.
> Second one is a weird device that doesnt work properly in recent
> kernels.

Looks like there is not much traction for this series.

The test suite is still passing, so I applied the series in for-5.4/multitouch

Cheers,
Benjamin

>
> Cheers,
> Benjamin
>
> Benjamin Tissoires (2):
>   HID: multitouch: do not filter mice nodes
>   HID: multitouch: add support for the Smart Tech panel
>
>  drivers/hid/hid-multitouch.c | 37 +++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> --
> 2.19.2
>
