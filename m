Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406072EA0F9
	for <lists+linux-input@lfdr.de>; Tue,  5 Jan 2021 00:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbhADXhU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 Jan 2021 18:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbhADXhT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 Jan 2021 18:37:19 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B729C061795;
        Mon,  4 Jan 2021 15:36:39 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id p5so34063706oif.7;
        Mon, 04 Jan 2021 15:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F1xKNU7j0JxBJTDCKnk5htvqvHoOJoWkqEKy65FEwNE=;
        b=ZUtQgwhiGh6UZh0xgczxDgpHEOpX9XjJ+O2ag3umtxSaSNFJP9k/qvsASCalg9iw1O
         r90PlYLpClx0ewAxri4HtsGVYJE9J/b4ttpqloldWcUdr4UFz0SAug5/8Tp4I9s9St9s
         QapHl1oTocueaCdA18/kHX46rjP9uZoVs+HSHIeBydqTtEd+sH7lHR9blwxpH3Dm7LEe
         MosfbmYMk8ySBQufqpRtqp/pK75b6JuBGexFNPKCVcLw/gzXt2oAVQ9XKO1Ad+5V8GHW
         +XgYzpwUGMfubULYY2+j4aXCYevFkJQ/mRNmiUaewxemeQbg0tjfuREVXzJMT9TTjfqy
         VRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F1xKNU7j0JxBJTDCKnk5htvqvHoOJoWkqEKy65FEwNE=;
        b=PMUbl5MW+WACLNyOuGtV+pUJQefQOzEiCNumy8/u8FDVT61nssASONqQ4sY3kdBMZv
         O9hpOF4wDmK3k/u1s+VY+VJ4jFRAhil5xYp5g8wQPuIhji7rJKR4OM48wjAqaelhe82S
         HDWOVRXExSfFVDgCm8zCk1vwLsP0G2VQgr5l6WIGcf1GL5AXRf3XJQIFb0y8INNDb1ya
         QXPgOA7FW+Bs0HSlBXmC+PX8Vmi4C3Ov4XHepdLw23i6UKMiQQ3XyKcISHpy5ewl9Wsa
         ftlpLfrMrwPtiZemJxtkqoH/VZI8zqviaoETBF32SH6vwHEb1Q3OUQXlkBCYgQ+I1oM6
         7+xw==
X-Gm-Message-State: AOAM533jg9dL+He2kgekqCkx/Tk1FQ27eNvYoIkeq3mmZl4O1Svmc56+
        E/rDSxE59nPFk/a7AFVhYlxGbSqDl2g=
X-Google-Smtp-Source: ABdhPJxbRoUk3ZEctt3DZM+Q57QdoAUqJc5ay8suKwVXhDNR8q1jtvAHnwIRUrYHKo0qAO7fWu/zjw==
X-Received: by 2002:a17:90a:734c:: with SMTP id j12mr861216pjs.201.1609797736461;
        Mon, 04 Jan 2021 14:02:16 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 9sm41797278pfn.188.2021.01.04.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 14:02:15 -0800 (PST)
Date:   Mon, 4 Jan 2021 14:02:13 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Souptick Joarder <jrdr.linux@gmail.com>
Cc:     Lubomir Rintel <lkundrak@v3.sk>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: ariel-pwrbutton.c: Remove unused variable
 ariel_pwrbutton_id_table[]
Message-ID: <X/OQZcsD15Fl/XVw@google.com>
References: <1608581041-4354-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zb2O3SFx6xDtwdSgHYH-zeGXwuf1=Hr5yYXnCDqAza9KQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFqt6zb2O3SFx6xDtwdSgHYH-zeGXwuf1=Hr5yYXnCDqAza9KQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 29, 2020 at 01:15:10PM +0530, Souptick Joarder wrote:
> On Tue, Dec 22, 2020 at 1:34 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >
> > Kernel test robot throws below warning ->
> >
> > >> drivers/input/misc/ariel-pwrbutton.c:152:35: warning: unused variable
> > >> 'ariel_pwrbutton_id_table' [-Wunused-const-variable]
> >    static const struct spi_device_id ariel_pwrbutton_id_table[] = {
> >                                      ^
> >    1 warning generated.
> >
> > Remove unused variable ariel_pwrbutton_id_table[] if no plan to use
> > it further.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> 
> Any comment on this patch ?

Lubomir, would you prefer to remove the table or add it to the driver
structure as ariel_pwrbutton_driver->id_table?

Thanks.

-- 
Dmitry
