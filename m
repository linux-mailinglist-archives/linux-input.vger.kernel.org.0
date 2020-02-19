Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EDD7163E45
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2020 08:55:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgBSHzF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Feb 2020 02:55:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41412 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726260AbgBSHzF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Feb 2020 02:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582098904;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=i1mLBd9LWHB+KH9pfrmfXQPkFdMyiuEf6cTfBeditaA=;
        b=VITCrzzh4zioa0s73dEgfHRDsVtEc3q+3Uy+FsIfj5EEeL3ppkZnNQQRzJklzvBLop7G7R
        Gz1RtoeuSppyrKe1JbbAu4DKoevQyicb9AlcnU8eoK7tzDZfwtqJIFc+AKjjmMSe7UaRYp
        WDaRg8OjGqmjYLFd0azn76Y2flQ+GtY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-i_Io4FZXMjSzMcvnsr9-Sw-1; Wed, 19 Feb 2020 02:54:59 -0500
X-MC-Unique: i_Io4FZXMjSzMcvnsr9-Sw-1
Received: by mail-qk1-f200.google.com with SMTP id b23so15991331qkg.17
        for <linux-input@vger.kernel.org>; Tue, 18 Feb 2020 23:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i1mLBd9LWHB+KH9pfrmfXQPkFdMyiuEf6cTfBeditaA=;
        b=UKMfqiYrG8+hdUYtl+aVWR43CJBNEjef7cu5I+9pcb7e2JugjW8TrhatAjRSyMwpoP
         ZoTrERxFTRXCZEGpgIzFnerre9tnsa8zYi95qS3sE388S9EFSnOr17RD2NoC0qbAl/hR
         TKnpTJfH/Jeh68P7LiS6zpl8w0hXBG97urFfYRtII4R9BDfetTI9YzKxniCoVH6AHGhm
         kTzdWsmCD822KgEqR00tF/3Qb0qu9BQb1KMppch3GCn5OJV2k69ebSi0/uGnU9x90iow
         pQqrJTMh1mXXviR0Y91UDZB9vLClHu88LwzkY201n7S/TD0DPCLo/o7lnxa4Lc++cE7P
         G0qw==
X-Gm-Message-State: APjAAAUIlMiCmXOeAXjTqXOGy+p44yExeOhngg9V/5yxPs+i6SU6m0FZ
        SwVntArW1KcFg/rDF22NAFGgsoQ5NaUGGG97PxWpaeyxthpQQ1vMMt+a0/BokfATR+wxDFK2ecu
        uyorsbkfGnxJ3ijOaTc2bkTOfS/WPlXI8y92GCz0=
X-Received: by 2002:a05:620a:1366:: with SMTP id d6mr22176819qkl.230.1582098898545;
        Tue, 18 Feb 2020 23:54:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqy7039fN0rfpeY5AjhVmdUWeucyK4eyLBE67zRJtzyKFxN2zW/8mz/0vFANt1B8IQuhcyFS3m7H5RyH3TSFiQw=
X-Received: by 2002:a05:620a:1366:: with SMTP id d6mr22176812qkl.230.1582098898293;
 Tue, 18 Feb 2020 23:54:58 -0800 (PST)
MIME-Version: 1.0
References: <ae5eee33-9dfc-0609-1bf8-33fd773b9bd5@hanno.de>
 <CAO-hwJJ1sc_RAh4ytWSOmRqfVESi2dvB_Ao_Vn+6XXixxVyxrA@mail.gmail.com> <74d73ebc-0cff-768d-00b7-57bb9b44124f@hanno.de>
In-Reply-To: <74d73ebc-0cff-768d-00b7-57bb9b44124f@hanno.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 19 Feb 2020 08:54:47 +0100
Message-ID: <CAO-hwJL8cSJqG4TB6ZJiqoWr0RhV0zhMNK3qVwS6i9FmK7RCRA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] HID: hid-bigbenff: fixing three crash bugs in a
 gamepad driver
To:     Hanno Zulla <kontakt@hanno.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 18, 2020 at 12:44 PM Hanno Zulla <kontakt@hanno.de> wrote:
>
> Hi Benjamin,
>
> > I think the patches are correct (have you tested them with actual HW?).
>
> Yes, I did, and am also properly embarrassed that I didn't notice the
> double free bug in the original driver.
>
> > However, checkpatch complains that the From and Signed-off-by email
> > differ. Can you send a v2 with a fix for that?
>
> Here it is.
>

Thanks for the quick respin.

Not sure what happened, but the commit title was duplicated in all of
the commits.

Anyway, not a big deal, fixed and pushed to for-5.6/upstream-fixes

Cheers,
Benjamin

> Thanks,
>
> Hanno
>

