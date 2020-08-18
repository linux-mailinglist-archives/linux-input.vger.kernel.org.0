Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5707D24826B
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 12:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgHRKAW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 06:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgHRKAU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 06:00:20 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8502C061389;
        Tue, 18 Aug 2020 03:00:19 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 74so9700573pfx.13;
        Tue, 18 Aug 2020 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OOenSclepS0MABruprKXkVZk2CmkqltRlMtrV3FqKk0=;
        b=c3C8yFsQurPTAqZp5ro2DQU9RyvdO3D6JEMGO6BND1O8fmHvaNLwU0BXpPovPyleiI
         +vXOUOIV5DPz3DG4vLwFMIsz6T+xgq2IwLiRgPhPy4d8v9wY4s62RXr9TvMn8LmGjuTS
         f+SrIXoOW/F3EGG9vAeSK0TtVfVl2PQJIy/QrFu2HVHmqlOjlGQJXUOskcapulDRaI5O
         a6gAL2n/0Avbc9kKN1Zn/lYdzgZufygWn6HNwT4RXxKrxX39/OepzkCw8LKuyhlTdtGm
         XHC5by/+f1aRJKJaqbbQrRwpDZi5tLFx1hcZsiLUBqiS3xHFUykRSDW0dj7Axmyx3f+k
         JXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OOenSclepS0MABruprKXkVZk2CmkqltRlMtrV3FqKk0=;
        b=Kif4EUl0NjIj9coTGg6YFiGMuFXAp3jmp8fkgaWVYcXBMz4D75wgaq2XV7MOEOFSi7
         4Lbly1msef+9u7fm00xxYe174PTQsCB7tNAX+S+0q3ITIE4pmJygDmB9Nme41mB3/o6p
         +2YHjOR4Hbl1hf3BjQX5aRpjsh70BWtSERv1lxmpxuOuB66LHosbs46zIvEpkNWO2PjY
         grzFQfolA8nk+PyShi0f4js3Ttw7rzSTUWQv4eyrXVYvi1Eyrg28jqMO2m/4XbSIHp8K
         3VoOfJZ0iSTW7Ax2FeeN45kIkOqszWrHmWXWKSNOOrWWG7KNEoiq9Xvwrd6l9aesQYZe
         15gg==
X-Gm-Message-State: AOAM533A/B1B/5w6KOrDb5FWwH3LhkiZg7FGzv72P1xNzuQ52uiPKCrW
        kCtiEwWKea/DyfvG/MdADw==
X-Google-Smtp-Source: ABdhPJw8bM1oYpBq691mtUzOLfn8tTF4UwM50ybp3c0lFYLllJw5jJLjkMd01hKUBOnsJZw5Rm1Xig==
X-Received: by 2002:a62:1ad0:: with SMTP id a199mr15047482pfa.56.1597744818002;
        Tue, 18 Aug 2020 03:00:18 -0700 (PDT)
Received: from PWN ([221.124.243.27])
        by smtp.gmail.com with ESMTPSA id j5sm24157839pfg.80.2020.08.18.03.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 03:00:17 -0700 (PDT)
Date:   Tue, 18 Aug 2020 06:00:08 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 RESEND] usbhid: Fix
 slab-out-of-bounds write in hiddev_ioctl_usage()
Message-ID: <20200818100008.GA2135@PWN>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200729113712.8097-1-yepeilin.cs@gmail.com>
 <nycvar.YFH.7.76.2008171221290.27422@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2008171221290.27422@cbobk.fhfr.pm>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 17, 2020 at 12:21:41PM +0200, Jiri Kosina wrote:
> On Wed, 29 Jul 2020, Peilin Ye wrote:
> 
> > `uref->usage_index` is not always being properly checked, causing
> > hiddev_ioctl_usage() to go out of bounds under some cases. Fix it.
> > 
> > Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=f2aebe90b8c56806b050a20b36f51ed6acabe802
> > Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Change in v2:
> >     - Add the same check for the `HIDIOCGUSAGE` case. (Suggested by
> >       Dan Carpenter <dan.carpenter@oracle.com>)
> 
> Applied, thanks.

Thank you for reviewing the patch!

Peilin Ye
