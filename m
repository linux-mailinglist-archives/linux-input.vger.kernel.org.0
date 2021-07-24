Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E74F03D4AB6
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 01:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhGXXQL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 19:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhGXXQK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 19:16:10 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB161C061575;
        Sat, 24 Jul 2021 16:56:41 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id h8so6607608ede.4;
        Sat, 24 Jul 2021 16:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sTT02yc54QuiI+WSS8+q0Wem8gLR0T4+uhTFU7IOQg8=;
        b=sSp8s4HgWMf2XSTI3SyPBsTQMifdhTl+17fnipaSDC2HdbVl4kIYSwc3sOBdfphUA+
         wzb+AEEr8tatFpJLq1rmUJmTudqvqytThB06ZHwhb6xxUBBmUTbHy+KN7KPIxGhIB7Hr
         d21iOZSlj3TfKWefeEv2f+lGQkB0yRVm4gX7DVrwNbTTCyZibzQHrI2+rqwP/16Hjbys
         RbN4t2OikeRkwWm7zNQAwA3H+grun+qn/P7t6pKjBycb7dk9mH3Y2P3eOPuOgjKqrSM3
         y7XeY+br4HHOnEZ3/qK00+cWjpmuUGmDfUGmyI2StcOfM/jbomuCt1Xr4KQyGHg8scLt
         0N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sTT02yc54QuiI+WSS8+q0Wem8gLR0T4+uhTFU7IOQg8=;
        b=P6dLNmtOYauvsy7X2KsvyF0MesmYc5xBkTad6PJ+KLZSoNOEcIuHbt2qiOyoSW9fMk
         1F0nPojyrvkhTGB4ruJt0TjIX00IioUQaLa6xxderduaXlv138Qtye7c+82N9Z+pIUe4
         RdxAdZueNfUPg9qOYbrURopZduCkGYFKhOYs9/2s5vzuy+TmjP7GVMadrxP2e9ndfjhO
         omsSbr86sjHs7YKlFEBMjxy83DuusrP0YO6iEFgBJpvLEK+RV/Lgt7AHvhSMkXXKYF1S
         2f9lbrZND1/Hwx1hm/tAJdzMqvG0CpsBAtRa/UJ/ADKtA8kZdvSGU41+9i2UmsdhP8QL
         QCxw==
X-Gm-Message-State: AOAM531YYT9PBDRtjjavjfsCJFJqR4Qk/iaH8Le4wPJ4Ws16NmiwL3zd
        B8ku454GEqFj13k2lcHeTBE=
X-Google-Smtp-Source: ABdhPJzdm+u+kcIT7+ag4ihHiHvSQ2zD4g5XG9cQ5beUUTZnqOL+0jLOP+8oRIfduWb+AF3YJqJ8dg==
X-Received: by 2002:a05:6402:898:: with SMTP id e24mr6770361edy.197.1627171000269;
        Sat, 24 Jul 2021 16:56:40 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id dj16sm16993384edb.0.2021.07.24.16.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 16:56:39 -0700 (PDT)
Date:   Sun, 25 Jul 2021 00:56:37 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] misc: powermate: update the reference count of the usb
 interface structure
Message-ID: <20210724235637.GA590874@pc>
References: <20210724212016.GA568154@pc>
 <YPydUp9vc5U7vGIw@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPydUp9vc5U7vGIw@google.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Sat, Jul 24, 2021 at 04:08:02PM -0700, Dmitry Torokhov wrote:
> 
> On Sat, Jul 24, 2021 at 10:20:16PM +0100, Salah Triki wrote:
> > Use usb_get_intf() and usb_put_intf() in order to update the reference
> > count of the usb interface structure.
> 
> This is quite pointless as the driver will be unbound from the interface
> before interface is deleted.

From the documentation of usb_get_intf():

[quote]

Each live reference to a interface must be refcounted.

Drivers for USB interfaces should normally record such references in their 
probe() methods, when they bind to an interface, and release them by calling
usb_put_intf(), in their disconnect() methods.

[/quote]

Thanx
