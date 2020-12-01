Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87D502C979B
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 07:42:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726337AbgLAGm0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 01:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLAGm0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 01:42:26 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43672C0613CF;
        Mon, 30 Nov 2020 22:41:46 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id k11so632915pgq.2;
        Mon, 30 Nov 2020 22:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xN2kSxfpXS7iLORZcfKKRt6uOIYDmPB4iM8yy7ow6dw=;
        b=WdYPTStTgR1ukgObG3LMqZBW/3WUX8j443Kfq860WcPTK2eoiDKUM0BHc9sfOh/4a5
         ftamWn+OMbuUaPH7ORkb4o1QRua4MD8sePTmp6RtSUKDN9qmKo7SYdHEy1x8Prks3mvY
         rrF6dczUulLTIdQtCs0F8pza9aS07bj9Q4VaSxIte8/s84w4wk5plU3cjSsp92Z8WfO3
         nuPae9R0TY5Kc6bkMNh42v/ue8odfRZEypgHt8jH+MWrgMHWCNMEK87ld6nRwK+Cag63
         K9P+5tCvi59viV304WLtCQ3/l/c1B7RzWKm5h/Wyn4lEjA2ue5MsUloK0xBeEGGfPmsX
         nG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xN2kSxfpXS7iLORZcfKKRt6uOIYDmPB4iM8yy7ow6dw=;
        b=jOCGlxCLNrY7MH7smbDvL/LBL0kCAJxD0JFQl0nu7gTYL8G9dqWHsU7qba6/1/4Htx
         ddohPFQwCJEVb80qoMDiolSyIG+dOHI6eKqh2XCyI3NOHLULZ/4rQfEOp26DBE+9EzCU
         uvyPr9vjnbjWMXphcIdcca6RrmKgP0E6OQJp9/dQwd2U2I/5GjcC7FjpMjj74CcuGr2I
         YdfgDP1WcZEXUhSH3YSEBFSUEyZRxSnm1eW5LP+LyLwMgIdDDe+ZfPHyeaYa6N327kgx
         n0R/n5Dx0YW1E9fQCON2q1Ax7toBi/KZqUUHhXQt3XxQGVfW5MbaoT0zUQQcv0GP05Wv
         yBwQ==
X-Gm-Message-State: AOAM533fxed+1YjFS1chjVEQJxhtcDvZZ8kAgVWFVfqZJU4O+BDcyXNr
        aa0s0wXpDCen1lBdxRrZqFA=
X-Google-Smtp-Source: ABdhPJw9GvGGpfky5L1smizAgfAo76QQqqpv/vYZnU7bk5vueokmwBmJYf61lmX0xaU1LyK3VcEwrA==
X-Received: by 2002:a63:c60a:: with SMTP id w10mr1049539pgg.211.1606804905699;
        Mon, 30 Nov 2020 22:41:45 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id n127sm1231238pfd.143.2020.11.30.22.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 22:41:44 -0800 (PST)
Date:   Mon, 30 Nov 2020 22:41:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kevin@kevinlocke.name, hdegoede@redhat.com, limero1337@gmail.com,
        jkosina@suse.cz, rajatja@google.com
Subject: Re: [PATCH] Input: i8042 - Add ByteSpeed touchpad to noloop table
Message-ID: <20201201064142.GR2034289@dtor-ws>
References: <20201201054723.5939-1-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201054723.5939-1-po-hsu.lin@canonical.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 01, 2020 at 01:47:23PM +0800, Po-Hsu Lin wrote:
> It looks like the C15B laptop got another vendor: ByteSpeed LLC.
> 
> Avoid AUX loopback on this touchpad as well, thus input subsystem will
> be able to recognize a Synaptics touchpad in the AUX port.
> 
> BugLink: https://bugs.launchpad.net/bugs/1906128
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>

Applied, thank you.

-- 
Dmitry
