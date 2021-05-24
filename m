Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1E0A38F1DD
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 18:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhEXQ7E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 12:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbhEXQ7D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 12:59:03 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D651C061574
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 09:57:35 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ot16so13244442pjb.3
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9I/XsWMXtMz+ESX3VQ352Y8Vwzp8BXAC9/WFX8h7XFQ=;
        b=DkyjsnS33dRajUucO/2OLqylCtXHhJJl7rzSTdhTe42xHVOILcx/mhuXAgVXBxdpr8
         YnD6Av/mayyMJcSKhRv/5+ulWeUmsLvEPd9hkLnLleNVOszBGT24/0Kmz7ZPDDZ5e7uC
         lh99K/w/COLVdRF34BBQSUoRj49D0oqLUgXoM3EuvFwYRx8MJvB5KfiK9BCINZCtpofp
         C3k1dZCQ4uja7JAWKxlOnuUKEl0o0v/CwCdl9MqCWoeKZDAuCDguwhYMIwkoJzvfafBY
         he3VZ9hV3wjQ4nDUOP4fak2xh39hsyFv7l1sFTVErXucAliYL5v1BF692yGeMhR0WpRr
         xOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9I/XsWMXtMz+ESX3VQ352Y8Vwzp8BXAC9/WFX8h7XFQ=;
        b=mKVCzuxGnHGu9R8yYG+cIaO5NTrmrStyi9bA7oL8cXxJm8+SjBTk1wloudETh4WbXM
         dX/Urc3fLPn3D+cRaYSIvYscXUdxwlCpJY/N15DHdInEUTDzNdyScAuDz4wdJGU/TuLj
         WIyyP9qXCyYgx++E7MDLhubFFdVqlnLpq/CWXr6MFg3W5H40MGqbzoOkL6Q3JOeKohFe
         BZEGgabu3Q6XQDIxQ7HuA78VZU120fFm5/i2p2L/ozAlR2GDIaZ+NLdhuOEtZBabTPH+
         tLqc4IHc6GJMh0jAQ5mHjoX5+IkLOVViXggUkCzc5NHIwpq12aL7PxaA/jQ7aswMJW0Q
         9rfw==
X-Gm-Message-State: AOAM532Pj70yhFq8O299u/GhkW0MTZX8diBxPletRMxVg0fqoQJowyde
        h2GUTWHuGsWhZHq8WjkvA7bfs4vmRpY=
X-Google-Smtp-Source: ABdhPJyly7f5lInSaS6eHW99Ag3skprOJUULGglVOT/QJqumQDGAwV5+wFmCuyxMwq9V+lAwxpDBUQ==
X-Received: by 2002:a17:903:3046:b029:ee:f24a:7517 with SMTP id u6-20020a1709033046b02900eef24a7517mr26590519pla.17.1621875454646;
        Mon, 24 May 2021 09:57:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:870d:a395:9098:674])
        by smtp.gmail.com with ESMTPSA id q196sm11820818pfc.208.2021.05.24.09.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 09:57:33 -0700 (PDT)
Date:   Mon, 24 May 2021 09:57:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nico Schottelius <nico.schottelius@ungleich.ch>
Cc:     linux-input@vger.kernel.org
Subject: Re: Regression in Elan Touchpad driver / Linux 5.12
Message-ID: <YKva+4+hIcrvMj17@google.com>
References: <87eedw5ptw.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eedw5ptw.fsf@ungleich.ch>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, May 24, 2021 at 01:38:06PM +0200, Nico Schottelius wrote:
> 
> Hello,
> 
> since migrating to Linux 5.12, the Elan touchpad stopped working for
> me. I created a bug report on
> https://bugzilla.kernel.org/show_bug.cgi?id=213093
> 2but I am not sure whether that reached anyone here.
> 
> The symptom is that when running 5.12, the touchpad does not show up.
> 
> I tested so far with 5.12.3, 5.12.4 and 5.12.6, all behave the same,
> latest dmesg output on 5.12.6 does not show the touchpad driver loading,
> only the one for the trackpoint:
> 
> [13:35] nb3:~% dmesg| grep -i elan
> [   11.845386] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x62, buttons: 3/3
> [   11.857853] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/serio1/input/input23
> [13:35] nb3:~%
> 
> The hardware I am using is an Lenovo X1 nano, however other people also
> reported this problem before.
> 
> If there is anything I can do to debug this, any pointer would be
> appreciated.

Do you have i2c-hid-acpi module enabled?

Thanks.

-- 
Dmitry
