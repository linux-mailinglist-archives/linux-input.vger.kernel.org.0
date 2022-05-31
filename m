Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA2F539443
	for <lists+linux-input@lfdr.de>; Tue, 31 May 2022 17:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbiEaPvD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 May 2022 11:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230142AbiEaPvC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 May 2022 11:51:02 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D847A469
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 08:51:01 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id q12-20020a17090a304c00b001e2d4fb0eb4so3143037pjl.4
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 08:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UCz3T3cNlUlcl+vTuj+aemzqAG1y/5K07Rxr5yFu5Yo=;
        b=GqsBWqb0Ny4TrESiJZj08ErKYtTdGwHK/+nXToOZhJaScEwEKYdf5g6mDyXPa4pkHN
         7jvEiC5C2Tf2LunKZ0aGklhLdY+J8XYAqYn8QgIbPLzJmp5aSQrR6/uNTa/1F5d40E3M
         +c2SpaQKNr5WdBKa/ENa066NfJN2rxNCYWj1VwD+AeLtD/cygK9gOzKbquSnhyk/lBR6
         riSvwc3k9eVJSuR0zDOGgUg/OHD51D720QpNrZIJbwffErhCUIhUE9BkirU4lcMLowR5
         PIN+r1nAY/7qc6mhVgW9S5ELJms1pzC1wKlCe3GqotqRmHbjmJKsZIUSoF0B2qaSG19C
         D1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UCz3T3cNlUlcl+vTuj+aemzqAG1y/5K07Rxr5yFu5Yo=;
        b=7W11pZxxiBMc3zA3Fp6MSe1GatXZxPuYeIcn39HGUUFwXuFi6mbQ650yBG8MYri0gI
         VnG14czoK8BEaG4BDPI05xle9M0oCH3WoM3W37+FMtBJDW5ADrY4AIrpuoU7+Tsfq7Sl
         bc0lf8XeVUcvtBuSLzaYuHrAL1ow+ZWHMIrUHO/P2C2aivA53qkZDKgjrhQzwOqkNAAu
         vlh/iPlGo1rxBlLZp/dhCHrJTcTXBt8ZdnUHN1Tn4gpQq72OESkVVZenCOnqTeskfWHn
         pJe9MypqhDNddmHjeOHiq0z9CnH6R2EgSQdjlDw9j82a6neSoZNDuYxrpLK4cG8KoTps
         /Stg==
X-Gm-Message-State: AOAM530XlCkthIqVtrbj3dTt6P04CYQ/494XD2My+7de7hOOLdfFgIAu
        ia7QXGuw10eAueEySc9arQ0=
X-Google-Smtp-Source: ABdhPJy1EmjHvyYV+6GxcbY07zuwfFMaWUg/I4FRa4YaJqksu4m5axodY8R2hgSM6nzpLLMzZabF+A==
X-Received: by 2002:a17:903:22d0:b0:164:ec0:178c with SMTP id y16-20020a17090322d000b001640ec0178cmr2468164plg.127.1654012261013;
        Tue, 31 May 2022 08:51:01 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3b8f:bcac:41a7:7a32])
        by smtp.gmail.com with ESMTPSA id i16-20020aa787d0000000b0050dc762813csm10902539pfo.22.2022.05.31.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 08:50:59 -0700 (PDT)
Date:   Tue, 31 May 2022 08:50:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-input@vger.kernel.org, Hugh Dickins <hughd@google.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: Suspend/Resume (S3) issues with rmi_smbus
Message-ID: <YpY5YU+KTg/Dmaex@google.com>
References: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net>
 <YpUX3EAzpL4+xgu1@google.com>
 <YpXXu2tbCSCUtUYQ@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpXXu2tbCSCUtUYQ@worktop.programming.kicks-ass.net>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 31, 2022 at 10:54:19AM +0200, Peter Zijlstra wrote:
> On Mon, May 30, 2022 at 12:15:40PM -0700, Dmitry Torokhov wrote:
> 
> > Can you check the entire list of resume operations to make sure that
> > PS/2 device is resumed before RMI one?
> 
> It reports psmouse failure *after* the rmi4 failure. Is there a knob to
> make it print more device model details on resume?
> 
> > You can also try overriding devices driven by rmi_smbus as needing
> > synchronous resume (see
> > https://lore.kernel.org/all/YgHTYrODoo2ou49J@google.com/).
> 
> I can confirm this works.

Let's ask Rafael if he has an idea why adding a link between PS/2 device
and its SMbus companion did not seem to affect resume order. Was there a
change in 5.18 timeframe (since original reporters said that adding
device link helped their case).

Let's also add a couple of more folks who experienced original issue to
see if they observe this as well.

Thanks.

-- 
Dmitry
