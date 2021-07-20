Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18CA3CF5F4
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 10:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233852AbhGTHhE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 03:37:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38884 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233801AbhGTHhB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 03:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626769059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GbhaOIAB8JP1tVeWV2DeWDm9pyDVq+ItJKvwLf1sJck=;
        b=iDvSs4qLZ0Cp3wAakIPXeKMUZh9oho7mKm4tkscg7e7MYAwiHlfhldiFcun0E3We3uzrP1
        WBIih1HX6kt2q9Befzi6tlKoQaZMATNWSj0v8TgdPMAIJPVdBk/dYOmbeqUXUWSvX51kWz
        DIdxPmfEpj0XxrPiVrldjdE0d0W4obs=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-Sd8SssTQO4qQe0fat1WotQ-1; Tue, 20 Jul 2021 04:17:37 -0400
X-MC-Unique: Sd8SssTQO4qQe0fat1WotQ-1
Received: by mail-pf1-f199.google.com with SMTP id p42-20020a056a000a2ab02902f33d81f23fso15606744pfh.9
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 01:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GbhaOIAB8JP1tVeWV2DeWDm9pyDVq+ItJKvwLf1sJck=;
        b=X4oL3sVRMSUUEgz7O3xE9zvDh0PbKO+YQR2Yax5W/BU/8PXaRE5SlET4v/tLQWPXMn
         hzAR5GudxahfVC+QWFNsNngVsWmH/GAIf2DAx9IiXisgIIZ/xz5MyYQ1fgnWvNHFhyK2
         U6us5S4F47dbrg0TLqbGkYVwHd/213GSYyMfJP+Gp91IzNhpZ0oLscx/SEVrvShLwBuq
         XnlIGZ9EYURMzjMkaaJzo+QrI/z5bdlXOUGkdAH3t7O5QNoZLoLbXsH8yJZUUI1rB+yx
         68Y+6T9JmGCp/ifsUQxmff5F1viylWVNFvJrPza3WOviQbWXISKUiEUY1TkJ4089nIH4
         UC9Q==
X-Gm-Message-State: AOAM531hLF+cNMtRxkAMWN4lOm7ku2DV4fec2Umq7qog++1qDjj5kgOn
        /m8Ivu3d8IOskWeirh0vnQ2pAX4bqrMsJs0YkanvK3ZJBvCt/5p2ZiYvW87nG5oRquwy7Sraqto
        b7i/sTE1yj179PtOfIVtgwbiRvR6MlG62kJcGegY=
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id 26-20020aa7921a0000b02902cfb55b9d52mr29444572pfo.35.1626769056766;
        Tue, 20 Jul 2021 01:17:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCddIcUnvOSK8Xk9eo4CVrdPuvQxVTSI2wVrmmw0WmxWVs1cSN2FiAYPwQGvUgAIfr5J56xeGPOH0Y7Nm4GW0=
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id
 26-20020aa7921a0000b02902cfb55b9d52mr29444555pfo.35.1626769056604; Tue, 20
 Jul 2021 01:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210604161023.1498582-1-pascal.giard@etsmtl.ca>
 <nycvar.YFH.7.76.2106151053340.18969@cbobk.fhfr.pm> <CAJNNDmnnZYPEWJiEq6Th1wp1Oc3yyXhjPef+abWL+cTT-uEFiw@mail.gmail.com>
 <nycvar.YFH.7.76.2107152143060.8253@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2107152143060.8253@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Jul 2021 10:17:25 +0200
Message-ID: <CAO-hwJKb9vy-jGvN9ChBOn14EdrGcJVSQeSRPFFNJr=G9ocfLA@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: fix freeze when inserting ghlive ps3/wii dongles
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Pascal Giard <pascal.giard@etsmtl.ca>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 15, 2021 at 9:44 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 13 Jul 2021, Pascal Giard wrote:
>
> > We (Daniel and myself) have a patch that we want to submit that will add
> > support for the PS4 version of the Guitar Hero Live dongle ;-) IIUC our
> > patch should be against dtor/master and not Linus' tree.
> >
> > However, we see that dtor/master is still behind, it does not include
> > the fix. Is there something I need to do? Do I just have to be
> > patient?
>
> Just base the patch on Linus' tree, submit the patch to Dmitry and
> indicate that it's based on more recent upstream than his master. He will
> manage :)

FWIW, if the patch in question is
https://patchwork.kernel.org/project/linux-input/patch/20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca/
then this patch is not destinated to Dmitry, but the HID tree like the
current one :)

Cheers,
Benjamin

>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>

