Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7141285658
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 03:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgJGBfi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Oct 2020 21:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgJGBfi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Oct 2020 21:35:38 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C168C061755;
        Tue,  6 Oct 2020 18:35:38 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h4so244931pjk.0;
        Tue, 06 Oct 2020 18:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wXmU6E7pPkGTKuI6i2a6iOAeXxZcqsnNzDeA2uG/Lbk=;
        b=OEDfeZZ4qfVfI4VPpjddk6X+YnGrEC391f0/6Hk65592Y13Ol/mQV+BPnbn3/HQxOg
         KpTu+o5RYip+bLEsE6Bsxmys7P5hRWQmCJItrbjaGeg3P0Lbw9inspCr5QpWPnCYjbkR
         i437CkMNLSWOoYOG0c3uZk1Sr2Waia9K+3QkIgKOEzGvj8Y8Q4lUsgIXsKVMhZIBaWDp
         VwVtYpHX+bLmJUoc8OFwwsQv193LiojMNDZCXDdwOKmTS/gANDC3kxc8UpV3LL19wTrq
         pfESHzxOukYL384ojzzHqEIil5u+KrMLeeh6o6BMwmsW4wnrVSZPioHcKrlUuMpFW0BH
         BeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wXmU6E7pPkGTKuI6i2a6iOAeXxZcqsnNzDeA2uG/Lbk=;
        b=VSZ57BZOpJyp+twQX4Cols3okZHrSXpcKTpKyOn/lY/AgMOeiBiLKH+1ySY2Dif4yP
         UczajNGKQgljGiKtUWkDF4dM7ozPdNXwAhEbXrBSO/BoKAuqh3ZRY3xRsllO8lGTDLVn
         HrVuGk0JuLPVxXvdmIrt2y9en/ws8tSlA6pbDO89yJhxskZjClMS8uexrZ9yNIwiSlgZ
         0ORkG+xtsCrCiqcaNKqOfgxjk2LFI3HlD/6fUfGDBf5cxDFtWIloSP4khahmGk9Nhx0+
         zocrr+q8+vKEgmC1BgXGCJ4/stD4MpNnW1/NWU/y0JuPh5SKb7SDz92x2XMX8+XLr2cv
         7XEw==
X-Gm-Message-State: AOAM533/m1A+6LbPWEpL7IC12tbN30vs3nVTD9rI14mGKb31qHqxzRvD
        hoSrJSfTTQ1NnS7uHqttMAI=
X-Google-Smtp-Source: ABdhPJwKS/LE5MMp07odF2ti3YPUH/10Min8uEKAnLwPb/26IQDKwczqqelpPx+xDdz+jx8Vbql21A==
X-Received: by 2002:a17:90a:2ec8:: with SMTP id h8mr780424pjs.173.1602034537910;
        Tue, 06 Oct 2020 18:35:37 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id fy24sm272835pjb.35.2020.10.06.18.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 18:35:37 -0700 (PDT)
Date:   Tue, 6 Oct 2020 18:35:34 -0700
From:   dmitry.torokhov@gmail.com
To:     kl@kl.wtf
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: evdev - per-client waitgroups
Message-ID: <20201007013534.GT1009802@dtor-ws>
References: <20201005233500.GM1009802@dtor-ws>
 <20200429184126.2155-1-kl@kl.wtf>
 <0ec848359962ebce267168618b816bb4@kl.wtf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec848359962ebce267168618b816bb4@kl.wtf>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 06, 2020 at 09:15:32AM +0000, kl@kl.wtf wrote:
> October 6, 2020 1:35 AM, dmitry.torokhov@gmail.com wrote:
> 
> > On Wed, Apr 29, 2020 at 08:41:26PM +0200, Kenny Levinsen wrote:
> > 
> >> All evdev clients share a common waitgroup. On new input events, this
> >> waitgroup is woken once for every client that did not filter the events,
> > 
> > I am having trouble parsing the changelog (I think I agree with the
> > change itself). Did you mean to say "this waitqueue wakes up every
> > client, even ones that requested to filter out events that are being
> > delivered, leading to duplicated and unwanted wakeups"?
> 
> Ah, I suppose my original wording was a bit convoluted. Perhaps the following
> is clearer:
> 
> 	All evdev clients share a common waitgroup. On new input events, all
> 	clients waiting on this waitgroup are woken up, even those filtering
> 	out the events, possibly more than once per event. This leads to
> 	duplicated and unwanted wakeups.
> 
> What I tried to say is that not only do all clients polling the device/blocked
> on read end up woken up, instead of being woken just once, they are woken once
> for every client that was interested in the event.
> 
> So, if you have two clients interested and one uninterested, then the shared
> waitgroup that all three clients are waiting on is woken up twice in a row.
> 
> Should I send an updated patch with the new wording? I'm also fine with your
> suggested wording if you prefer that.

I used the new description from above and applied, thank you.

-- 
Dmitry
