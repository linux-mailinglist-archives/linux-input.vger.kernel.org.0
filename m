Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A002623A7
	for <lists+linux-input@lfdr.de>; Wed,  9 Sep 2020 01:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgIHXj6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 19:39:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgIHXj6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Sep 2020 19:39:58 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE22AC061573;
        Tue,  8 Sep 2020 16:39:57 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q3so615plr.13;
        Tue, 08 Sep 2020 16:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Yk0Oeo7I/lK8V0Cta8eWPW8YqT4HApOA17doZKN9Uo=;
        b=JrNWJy5raaslWzaBiEMRMEbyo4cJ6sPdyW/BLdxulXYAHm02ww4CMUrgxGZLk2YUec
         Sa2kxd0qRiUoyOQuoOA6ltCoyVm33h/VckMnyoP+HBY1bD9SvhLqnzv5RIju4k1h/i2L
         iWJeLlfvHzlgcVkPIGfzhYFnI71rS/hcloIa6yoLZ4DBOpqJhvKJUqW2TKgxQ0B4M56x
         Z6Rj1SOm0uQRT4QBTWSyB3Pw8DZDChOwTxb6fCWtHHFFHlfKAqOzM3P7DoOWqQylRsN+
         eUdoYVQ2nT+4uVfp9UfBpmrodtdlE5eiuxjsQfWirmw1/SZUAsL6f/UJ4nCRiHLxrXVC
         WLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Yk0Oeo7I/lK8V0Cta8eWPW8YqT4HApOA17doZKN9Uo=;
        b=Tyd/HgdGIRrBBI08YL80wKt+0cCbLUWz1TGmd4bA7AwjoA9vsvGkEw9qMu9RaEH07G
         W5YRK5IazqO84dipi+sOB8y/DvYPRoQbF4TJZIIYx86ZqcvWYx3OPBqvAG8LzQvgyvQm
         DXaJ4HxrekSQvnWJK/TG2/1FDKL01YV0hM9KskHd0m0gKZknhnfFYoE1zexElviJxh92
         689xm7dVdLf1i+39I967ilY51/+ArZWc8NYafIGZAmbQfUpSVMBIN/u5AvZvcqvpT0qE
         /mEbNQTklpb3NcIv1ucNjHKbfmZRsJWT0GFmGtQMramuuzyjJYOwXACLB5XMqd5galFP
         cSMQ==
X-Gm-Message-State: AOAM530VSHsqvxAa1eXXwOWrHyVrCSInBKG8oXXcunWVuEcTaeh4ejVs
        MJyZkAgtVskgAigTzFtYXcI=
X-Google-Smtp-Source: ABdhPJxvRkujCJovwIcHcF1ZrC+XcMyK8ti/b2fBiGBr9ZrsQTrIz78oKu5RhL+0Ih0pPHXwPCwMzA==
X-Received: by 2002:a17:90a:e517:: with SMTP id t23mr1034958pjy.25.1599608392918;
        Tue, 08 Sep 2020 16:39:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q7sm334213pgg.10.2020.09.08.16.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 16:39:52 -0700 (PDT)
Date:   Tue, 8 Sep 2020 16:39:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        linux-input@vger.kernel.org, Mark Pearson <mpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/4] Add 4 new keycodes and use them for 4 new hotkeys
 on new Lenovo Thinkpads
Message-ID: <20200908233950.GC1665100@dtor-ws>
References: <20200908135147.4044-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200908135147.4044-1-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Tue, Sep 08, 2020 at 03:51:43PM +0200, Hans de Goede wrote:
> Hi All,
> 
> Here is a v2 of my series to get a couple of new hotkeys, and matching
> thinkpad_acpi hkey event codes seen on the last 2 generations of
> Thinkpads supported.
> 
> New in this version that Lenovo got back to me and explained that the 0x1316
> hkey event belongs to Fn + right Shift, so that is mapped now too.
> 
> Since these make both include/uapi/linux/input-event-codes.h and
> drivers/platform/x86 changes one open question with this series is how to
> merge it.
> 
> Dmitry, for v1 of this series you suggested you could merge them all
> through the input tree ? Andy, one of the drivers/platform/x86 maintainers
> gave his Acked-by for this:
> 
> Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I queued up the series, thank you.

-- 
Dmitry
