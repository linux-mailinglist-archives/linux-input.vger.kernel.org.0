Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3FE44D6DC7
	for <lists+linux-input@lfdr.de>; Sat, 12 Mar 2022 10:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiCLJkm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Mar 2022 04:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbiCLJkl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Mar 2022 04:40:41 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8083F1C9476;
        Sat, 12 Mar 2022 01:39:35 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id bg10so23905296ejb.4;
        Sat, 12 Mar 2022 01:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KD+oc4KMOZFZqyy05BxBaij+NSVnV6yAHAxIKGc6i5g=;
        b=AcHkGvDKkpqI9q+qaMnliOEPsdQAk85sskDc1VjWrjh/MxC4WWSxGFQd6q5U+KgIjy
         E1XUb584zNlqkm8y0bUAJGfUmE1q3KTyIkQ2h/pSH6gCuv1Azlxyx6uTOB298Hx0HP6R
         o93JFxLDebJawHdpfhfujuml9rbJ8cz05xyqqbviwKul319nOqByZRlLthfwp3zHoHSL
         J0PTDwDzHhgeieQMYpE1vUGExd63T+fdoHWVAdbrDtYgQOM4fIUckevhiDgFNIdq0tvz
         XD9zssQyz9P7x/LjgUBBPWu7JSyTIjrue4YRKM5QD5mUANv1LbGSuUOUMe2CCANMGBb8
         fqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KD+oc4KMOZFZqyy05BxBaij+NSVnV6yAHAxIKGc6i5g=;
        b=j36UE7qinQCBtVH93Rwi+eaU7X4zScuNac991bCP+j0xocOGYKTxLr88KomMos+HfC
         O8ZUvRm7jmZV2bYnsbtBdghm6QRKM9IAlLJ/+oEOph4ii2x047j8SRNTt0pCluvL2sfF
         TJr2t5aK2WSrt5dhrHdXebixTYBOYMPFyRc9baD1VRFUEK5FV16tnkHTnjMnyzrKDp0Y
         3/5JAnD+JwS2kKbn2LEKzcPw0OSQl2K/XljKgTzm35YjiASH87u64M2WNeTpUF9bHgOi
         +Nns6OwTpyuFLD48BDRgobkBb5whihVaQx0ECrQ4wk80qae7r9/+Bv/9/l16UIiD1hiT
         72sg==
X-Gm-Message-State: AOAM531UJVaSakI1jkY0Zl8gxlHrk/R2OUWfpBT9phUP2Vq7MPE27/un
        QqU0oeJ4nHw1WC8yx88kRj+Urg6IH91WHIqiJYLeKK9oKW0=
X-Google-Smtp-Source: ABdhPJwJJDX6opDEjsmdQYYItX/K5QwVvIxO6kqGkIFXepCGLDYfJFvEfoFXvMNb07UYvhimI24akt6Sb8QTRJZPNPs=
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr11385011ejg.413.1647077973739; Sat, 12
 Mar 2022 01:39:33 -0800 (PST)
MIME-Version: 1.0
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu> <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu> <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
 <YgpqHEb1CuhIElIP@rowland.harvard.edu> <20220217080459.GB2407@kadam>
 <Yg5ozvWf0T+NTWPz@rowland.harvard.edu> <YhieIzbS0OLSZTdj@kroah.com>
In-Reply-To: <YhieIzbS0OLSZTdj@kroah.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Sat, 12 Mar 2022 17:39:05 +0800
Message-ID: <CAD-N9QXx7aq_4ZH_AOkOeE+RgQUgehRXm1diuzsrVgJDDohC+Q@mail.gmail.com>
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
To:     Jiri Kosina <jkosina@suse.cz>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Salah Triki <salah.triki@gmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 25, 2022 at 5:15 PM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Feb 17, 2022 at 10:25:02AM -0500, Alan Stern wrote:
> > On Thu, Feb 17, 2022 at 11:04:59AM +0300, Dan Carpenter wrote:
> > > Salah sent a bunch of these.  The reasoning was explained in this email.
> > >
> > > https://www.spinics.net/lists/kernel/msg4026672.html
> > >
> > > When he resent the patch, Greg said that taking the reference wasn't
> > > needed so the patch wasn't applied.  (Also it had the same reference
> > > leak so that's a second reason it wasn't applied).
> >
> > Indeed, the kerneldoc for usb_get_intf() does say that each reference
> > held by a driver must be refcounted.  And there's nothing wrong with
> > doing that, _provided_ you do it correctly.
> >
> > But if you know the extra refcount will never be needed (because the
> > reference will be dropped before the usb_interface in question is
> > removed), fiddling with the reference count is unnecessary.  I guess
> > whether or not to do it could be considered a matter of taste.
> >
> > On the other hand, it wouldn't hurt to update the kerneldoc for
> > usb_get_intf() (and usb_get_dev() also).  We could point out that if a
> > driver does not access the usb_interface structure after its disconnect
> > routine returns, incrementing the refcount isn't mandatory.
>
> That would be good to add to prevent this type of confusion in the
> future.

Hi Jiri Kosina,

from my understanding, my previous patch and patch from Alan Stern can
all fix the underlying issue. But as Dan said, the patch from Alan is
more elegant.

However, the revert commit from you said, my commit introduces memory
leak, which confuses me.

HID: elo: Revert USB reference counting

Commit 817b8b9 ("HID: elo: fix memory leak in elo_probe") introduced
memory leak on error path, but more importantly the whole USB reference
counting is not needed at all in the first place ......

If it is really my patch that introduces the memory leak, please let me know.

best regards,
Dongliang Mu

>
> thanks,
>
> greg k-h
