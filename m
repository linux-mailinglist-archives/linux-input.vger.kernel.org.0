Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F21FD2A4EE8
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 19:32:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727852AbgKCSc0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 13:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgKCScZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Nov 2020 13:32:25 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CF0C0613D1;
        Tue,  3 Nov 2020 10:32:25 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id x13so14988936pfa.9;
        Tue, 03 Nov 2020 10:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l4JCOmPWAT+yYUBvCZET+yptdj/Tc0NVm0IibQB+PfQ=;
        b=txDAmFVb38CY1nzZOdVrps35WpTW/egoyq+ZQwWkhr1p7LPJUqzVkXNpsPXj9EF8kw
         XvlQ+hWIeF+xPL5kkLIUopLElRQAEKVsXsC5DFAhhnAquT8aVWLfoz2xc3ToZe9pijhg
         323BGdu6O7G8yMgVn35CkYcMBDy3a5i9a1WpOAKnDVfbxTfPL4UOygILSD1ysqNvMG5E
         veVzRWIbXpnFzmG6Ebx1JIJk8ffeZvmtKnMBsFZs0yb2thLEFrsgApOLRNQuSDMReM3q
         B6mx1Sy8H+Z1w7aYx1iA3IfIeiOxC5bvK2pcPKMQUF/cWYn3KB6BssO8o6Y12EK7qX3w
         CExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l4JCOmPWAT+yYUBvCZET+yptdj/Tc0NVm0IibQB+PfQ=;
        b=Vdy0UZBxZAxfEoN6++9q5MVjdCAOR+JP+1AA6luB1XBTnlwa4QLDBm/nP0oMl/XUbj
         FkxnKmI205EP8ftUdlSIz/Cyu8yDMTFffUQXKAcOWtvFNwOqS/DCqjSTdunAYb6O3ECf
         GeRhkrwD3EE19AhZ4Mu2vIlYyJzgxmJJcJEddbibjQIowcgRhY/5pnN/vWprNf0BgGwC
         2Q+yE9eZ0+3RJYltYtniOpJE/H7u7XaMtaPNM10+HfQyeEjO21wHx04ywb46vJrbVstW
         kEOBo4hOs8a6Wpv9hJO0zJJ9kR9hGjQSONhS2RSgcMKnS9W33Oh9Zxz9rweB6z6UD+rZ
         sIPg==
X-Gm-Message-State: AOAM533csAVoI57n543RZCH1iKENiCuXjhZCBm7xAC20e/fLoKO3M5Pv
        1pxiaIFoSQg1bLQHfUnUbx0=
X-Google-Smtp-Source: ABdhPJxamAUIYShiGUjLUpK1A3Mov75jUY87XCIC8TU8klzaOr2s0LD58FQ8Rmh6kneN+k2ELxu2RA==
X-Received: by 2002:a63:fc15:: with SMTP id j21mr18250946pgi.258.1604428345144;
        Tue, 03 Nov 2020 10:32:25 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id t26sm11495683pfl.72.2020.11.03.10.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2020 10:32:24 -0800 (PST)
Date:   Tue, 3 Nov 2020 10:32:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Jiri Kosina <jkosina@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        andrea@borgia.bo.it, Aaron Ma <aaron.ma@canonical.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Jiri Kosina <jikos@kernel.org>, Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] HID: i2c-hid: Allow subclasses of i2c-hid for
 power sequencing
Message-ID: <20201103183221.GA1003057@dtor-ws>
References: <20201102161210.v3.1.Ibb28033c81d87fcc13a6ba28c6ea7ac154d65f93@changeid>
 <20201102161210.v3.2.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
 <CAL_JsqLxGugWg7Xwr-NQa1h+a_=apQsfFCU0KF-97xt1ZB8jMg@mail.gmail.com>
 <28e75d51-28d8-5a9a-adf9-71f107e94dfb@redhat.com>
 <CAO-hwJK2DfU_v==uwWyyPkH9N6zb9Vh_pJOxz8dZ_mqJ1+CdsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO-hwJK2DfU_v==uwWyyPkH9N6zb9Vh_pJOxz8dZ_mqJ1+CdsA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 03, 2020 at 01:42:47PM +0100, Benjamin Tissoires wrote:
> 
> I also want to say that I like the general idea of Doug's patch.
> Having a separate driver that handles the specific use case of goodix
> is really nice, as it allows to just load this driver without touching
> the core of i2c-hid. I believe this is in line with what Google tries
> to do with their kernel that OEMs can not touch, but only add overlays
> to it. The implementation is not polished (I don't think this new
> driver belongs to the input subsystem), but I like the general idea of
> having the "subclassing". Maybe we can make it prettier with Hans'
> suggestion, given that this mainly means we are transforming
> i2c-hid-core.c into a library.
> 
> As for where this new goodix driver goes, it can stay in
> drivers/hid/i2c-hid IMO.

Yep, I agree, it has nothing to do with input (except the device being
physically a touchscreen ;) ), so driver/hid/i2c-hid makes most sense to
me too.

Thanks.

-- 
Dmitry
