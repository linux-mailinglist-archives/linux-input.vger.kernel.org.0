Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1C62DDEBF
	for <lists+linux-input@lfdr.de>; Fri, 18 Dec 2020 07:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbgLRGyg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Dec 2020 01:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgLRGyg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Dec 2020 01:54:36 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB114C0617A7;
        Thu, 17 Dec 2020 22:53:55 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id b8so917033plx.0;
        Thu, 17 Dec 2020 22:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hz+n8sgcprA6LhyVXY2YPhKyM2gTWxdov4mu8BPj34U=;
        b=jkQVQ3FFyQSW3O83sApBrX9x5afL3sflJQ0+gpX4mY4FG9sJwiGzI50eAPHlt+23lY
         mG4+NBulxSFkVZTPku26NrlLVRtIZo9LjlnY0yjV9IiQw0x+X00vN4GVwHjo20C4N3hP
         JQ/Obht1CkMw8NfNu8wxparwImmRyHj4AzX2eAX0qla2GSBNdzEPmDO47lA8Bh0Gb7/P
         TbXS+ZoqPWE73LdbTAuHod95cavCP5KWD49EfKv8hFm0u1sRI2Qvaz5YOW6xaG6wk9Oi
         JX3EPANWk3KX4tnASp38hAvEMw7fvsQgEvL742LHfLaOIRR08dQsMLyQEF12m++fv2oR
         7Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hz+n8sgcprA6LhyVXY2YPhKyM2gTWxdov4mu8BPj34U=;
        b=biy0+vufp2vrKs6D8xg/8lcmwEj1h8SWvMU9qGiNO2GY733LPhSNyiIBIwO/tF8LhW
         R9M8ZqaJWQ6dj5EOMwFXxDF/lwqfUjE0YtzBKWz0Rpcv0y2u4ZQi7BAuxN4yPEb1rBE2
         J5mbDizwF/frLFore/6/NyezffpYw2Yf5hvyV5btBMkbLC0j5gb/gRpw3MvXv3uzuDFY
         DUj57e2gSiUMMicIxN7UOxE+S5SIY7aZn0kAQDNtktxGTnh+xBf/gdYAcEchRbiYH80c
         l7KJWG6zCRc58lVq6466upxtGLVNuftDc0hdan69t+AdooUBfENkXtLUe4VK1L80J8Vd
         RZ5g==
X-Gm-Message-State: AOAM533/QTUieKFhL2ule9SFtkA4DOX/5hLpcUumcLFWhmputntxKkNd
        6+mZK1rIN3P4bPKmuCI88JBK0xVI1RM=
X-Google-Smtp-Source: ABdhPJwgDSO67k+nVlT3HiPyIVMhprCtTsvl5ncczRKCaKa9p/cWPcHQKvETkaLpHvpRoeNqPpEhEA==
X-Received: by 2002:a17:90a:fa18:: with SMTP id cm24mr2949223pjb.220.1608274435361;
        Thu, 17 Dec 2020 22:53:55 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f29sm7918141pfk.32.2020.12.17.22.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 22:53:54 -0800 (PST)
Date:   Thu, 17 Dec 2020 22:53:51 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Paul Hollinsky <phollinsky@holtechnik.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gtco - remove driver
Message-ID: <X9xR/wTjU1tLS5JV@google.com>
References: <X8wbBtO5KidME17K@google.com>
 <nycvar.YFH.7.76.2012171221350.25826@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2012171221350.25826@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

On Thu, Dec 17, 2020 at 12:22:17PM +0100, Jiri Kosina wrote:
> On Sat, 5 Dec 2020, Dmitry Torokhov wrote:
> 
> > The driver has its own HID descriptor parsing code, that had and still
> > has several issues discovered by syzbot and other tools. Ideally we
> > should move the driver over to the HID subsystem, so that it uses proven
> > parsing code.  However the devices in question are EOL, and GTCO is not
> > willing to extend resources for that, so let's simply remove the driver.
> 
> Acked-by: Jiri Kosina <jkosina@suse.cz>
> 
> > 
> > Note that our HID support has greatly improved over the last 10 years,
> > we may also consider reverting 6f8d9e26e7de ("hid-core.c: Adds all GTCO
> > CalComp Digitizers and InterWrite School Products to blacklist") and see
> > if GTCO devices actually work with normal HID drivers.
> 
> Sounds like a good plan to me. Perhaps you can do that in a series 
> together, and stage that for 5.12?

Sorry, I already zapped the driver in 5.11.

Unfortunately I do not have this hardware, so while we could remove
these devices from the blacklist we will have to do that blindly. Please
let me know if you still want to do that.

Thank you.

-- 
Dmitry
