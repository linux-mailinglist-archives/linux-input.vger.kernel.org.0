Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2CD1BB340
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 03:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgD1BIf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 21:08:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726263AbgD1BIf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 21:08:35 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D79C03C1A8
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 18:08:35 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id hi11so388041pjb.3
        for <linux-input@vger.kernel.org>; Mon, 27 Apr 2020 18:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BEILZUYs+SvCsGSTtlx7jkEZ/ywEHE68xuGsOzxeDv0=;
        b=VYp7cymG9Kts1ZHeRJWRFi9EVZ8n3VrrohAjwOSPFqwA5hdfdRiR17eBJ4cithJN6j
         laFJ1v14scOyNUi2kyuvf11OSKL2XRiMGBX/9wf6mjwbBqHAvdXYNiwvmZcRAynY1nUu
         gzXDBozuH5Focm+Ngx6SjxE+MnTGVXB2GEnD281owa+p+Un3udaHGojHi9IHW8H6Iuzd
         Xf5Pyz7AeG3pj47QIsx9s3ofLLo3aDtpSwz1Zq470QfqI/I7/5bb1KMMrXlFYOivF28t
         hHtEmSZew3FGVOXt2YNpbLGxEeOFmu3TlOeqxrOZxdbMR17BEXZs3NceHqLDXs9Bp5tK
         qXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BEILZUYs+SvCsGSTtlx7jkEZ/ywEHE68xuGsOzxeDv0=;
        b=opC+0hMfpK4jDWp2/l0H1C69W4EptPvTTIu8kGbjRwhXKROx/3gsg71rKQdSG5sTuC
         jFF3tKTihQNo0FQmRKlj909nHzgFwyjZQL3U7PaGzBmdcIFQSRbsUFmQIn7A74JAuyLB
         DUgJVROa5DmyJENjYc4DtMXiTUUL1xgb0MIWDwUu11QGOM3lP9y9hRzFD1hOXv36jzqY
         OvsV5GMveU3qgSKKgV2Ue+TWzawgLaOEEnECJc8Mbrk7jGCLxPNttpCam7ph/XxwnoR+
         fVGmR0EzB2M5etQUajSKGdOFCgsWmZM2tCZ6kRRL2dC//ARkfK5lE3boj0+ybIrEFFdg
         TfaA==
X-Gm-Message-State: AGi0Puaeyw30EDTgMm4uIIP5UJxxurxQRUmw2T8udCSfsKuWNL7Wl6d8
        dhs9B5Mwwn259cxr+UC+eM+jS9P9
X-Google-Smtp-Source: APiQypLHNRDkdRsZgPRCOn3Dcf198NzTt4Ggd/1u/dgk1FKNYAFturzpMcgj1zVOCo4M1f7FGj9LrA==
X-Received: by 2002:a17:90a:7105:: with SMTP id h5mr1763138pjk.3.1588036114322;
        Mon, 27 Apr 2020 18:08:34 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y21sm13328913pfm.219.2020.04.27.18.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 18:08:33 -0700 (PDT)
Date:   Mon, 27 Apr 2020 18:08:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Kevin Locke <kevin@kevinlocke.name>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: i8042 - add ThinkPad S230u to i8042 nomux list
Message-ID: <20200428010831.GT125362@dtor-ws>
References: <feb8a8339a67025dab3850e6377eb6f3a0e782ba.1587400635.git.kevin@kevinlocke.name>
 <20200420170234.GN166864@dtor-ws>
 <20200424042500.GA107217@kevinolos.locke.internal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424042500.GA107217@kevinolos.locke.internal>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 23, 2020 at 10:25:00PM -0600, Kevin Locke wrote:
> On Mon, 2020-04-20 at 10:02 -0700, Dmitry Torokhov wrote:
> > Applied, thank you.
> 
> I believe I was in error and nomux only appeared to fix the issue
> because the controller continued working after warm reboots.  After
> more thorough testing from both warm and cold start, I now believe the
> entry should be added to i8042_dmi_reset_table rather than
> i8042_dmi_nomux_table as i8042.reset=1 alone is sufficient to avoid
> the issue from both states while i8042.nomux is not.
> 
> Please drop or revert the previous patch, if possible.
> I will send a corrected and better-tested patch momentarily.

Reverted, thank you.

-- 
Dmitry
