Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78063258BB1
	for <lists+linux-input@lfdr.de>; Tue,  1 Sep 2020 11:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgIAJey (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Sep 2020 05:34:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29377 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726105AbgIAJew (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 1 Sep 2020 05:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598952891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o5Y78x1ZbIMZDcyiKJ8JiDFugDPHcPR0uo/OCjQ9IBA=;
        b=I8R7EcxOU0XtL+pSEfK5zUjs+J42RTLpdjNvPLzd6qe7g86xvZNzRuiL7ZtlctWiry3QDt
        9U6d1zXO9kfVNikqkEQ7baOT7CFS7tPKD6vnstHE0QYniKR2kASntVIQEQijO9e+OsC/WM
        Q+7d/Nnu99ZGsRhhIjqLw9iEq/MDYsg=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-Y4JDxNnHM9a1Uf0IOdVXZQ-1; Tue, 01 Sep 2020 05:34:50 -0400
X-MC-Unique: Y4JDxNnHM9a1Uf0IOdVXZQ-1
Received: by mail-pj1-f70.google.com with SMTP id n19so252944pjt.1
        for <linux-input@vger.kernel.org>; Tue, 01 Sep 2020 02:34:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o5Y78x1ZbIMZDcyiKJ8JiDFugDPHcPR0uo/OCjQ9IBA=;
        b=At1BSNghGP0fKE1CIyF0dmf1n2ocbpbM+wl+2oYv0xU6rkpziXqphxgaUhQdDbnEdb
         oX2nl9YfmUQJAjv3JI0DWQBn8eUok69p6FMG19QMGJungzfr7MQRx/mqqcUleqWkYeUX
         ESCJxn5tcnk7/np93cVeo98bOvb+Z9g6AC65HPT0Up4+jyiV+gBkrDNHwdIioU7uq1wh
         /UwW9InlZhUa0i+FT8rs71vxA1cFlnOACrQyorZHf90lt6ICHpQy1WQl0EKINGnveQQA
         k+Fpx9Tq97C4lGjnYimVua3ZWQhrlrTzBSqoI0Fj1x9FsPOTZcqkf3TkT2JbTwk02wgR
         hang==
X-Gm-Message-State: AOAM533UH3k/BPiuy/mTqm3dV4VJ/xvYqf1Yx16I3x10ikdFOBxiH04a
        /eoqfY85RlOjxHp9U6bkNEnR6v4pmx1Ph2+WinH3c1oyPsCAxYvek3y1T7bb4fz94tJIiOO1cpM
        9+oD/C+FOpZ5/EoHpRNyAQtE/eTUgnwyo+fi/YCk=
X-Received: by 2002:a63:6e01:: with SMTP id j1mr743713pgc.147.1598952888717;
        Tue, 01 Sep 2020 02:34:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWGx5gRzrr+E1Ah23gCssdxWPYkby9RSfbimJo07tkodnjtRxFh3BSEUXgTJbgP/qmIUT/Y2585CMTPSDc8ZE=
X-Received: by 2002:a63:6e01:: with SMTP id j1mr743688pgc.147.1598952888314;
 Tue, 01 Sep 2020 02:34:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200829112601.1060527-1-maz@kernel.org> <nycvar.YFH.7.76.2009011013400.4671@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2009011013400.4671@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 1 Sep 2020 11:34:37 +0200
Message-ID: <CAO-hwJKa9QWxEo7PvCEjoEG3YZLS+1EKvaC8C3pga7R9Yc5_tw@mail.gmail.com>
Subject: Re: [PATCH] HID: core: Correctly handle ReportSize being zero
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 1, 2020 at 10:14 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Sat, 29 Aug 2020, Marc Zyngier wrote:
>
> > It appears that a ReportSize value of zero is legal, even if a bit
> > non-sensical. Most of the HID code seems to handle that gracefully,
> > except when computing the total size in bytes. When fed as input to
> > memset, this leads to some funky outcomes.
> >
> > Detect the corner case and correctly compute the size.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
>
> Thanks Marc; Benjamin will be pushing this patch through his regression
> testing machinery, and if all is good, I'll push it for 5.9-rc still.

Test results were good. I have now pushed this patch to for-5.9/upstream-fixes

Cheers,
Benjamin

>
> --
> Jiri Kosina
> SUSE Labs
>

