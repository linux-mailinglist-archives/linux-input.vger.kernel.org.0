Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE345629E20
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 16:53:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiKOPxs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 10:53:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiKOPxr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 10:53:47 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66474248EE
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 07:53:46 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso10549635wmp.5
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 07:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6le63NWntkRnugNNAXImb4LRp68vUYKfNXmluVrFqE=;
        b=OvyWb/+liVN7xOQ8UJu8h4BtfUrk++kMIKd6VtwfV7L6gCy/OHVF5guaYAKrnGHD7P
         DRKdCGATDylDTCxQFjO+TGPIGEyD7s2+bQlAPyiVpBlc+6+9MOxSkODH8JXxAA6lDA5y
         NtGWwsmM0YDDqd0vwYAQt/X+b0NFizhJPoAlOmN68mKkG9EntEpP1U6MaGSq9lFq8jqT
         5PDQGhkpQHlB/eijrZFIuh3cOpHtzf9Y23aZmddkO3ClWCzERVYVnkOwnh90uL9qZvXu
         67zNONK9ShjkwK/XDxrcly+8pKUeI/Udl7PjXFjYltcM6V5DFFXAIPHKdFeoDABU+jqo
         k7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6le63NWntkRnugNNAXImb4LRp68vUYKfNXmluVrFqE=;
        b=jnuuF+iPGDUBxc+6NBUVIfc/xkXvl3YA6VcEbV7gik47r2vUo752PJPoPT3+e0iluz
         hwTihBsArqOj++uaRVSr+19JOwjLZCKT2c5ns0Y8K19ztSQ023SX4s0V86ZX/yIt8iWQ
         JddS4rIDmhRKlL3yjowohUHvoIS0qKeaJJJNeYQLE2aaEW7nlyNffjCQlqaGeDdhnd//
         TIH1gFan5pphFgx1BLNFzyF63qACm4SQj3nNWuXmcAsnbQ6LEyYhgm+TNEBbK9jxgZXg
         q5s5oOxhtbTksNyCUI3nZt2Mq8JfCXQTi6wPSU6lXizB5UO59n+OBG4RUOwy1T/rL17W
         4xyA==
X-Gm-Message-State: ANoB5pn3L+DMTmEZgeVSd1w2dcivGTspwz4nGcHmOAb8kJLhOT+hqGnJ
        6JATqgJyUEicpuWzh9y6GT0qeTJBvs2xKA==
X-Google-Smtp-Source: AA0mqf5N2RF8LzQPKA9Q76WP7MXx8nxNnZDWIGeE3JS7ckgQ9mG/EN4/PG427XwM3fk52SBklPZHtA==
X-Received: by 2002:a05:600c:4f92:b0:3cf:a895:a9cb with SMTP id n18-20020a05600c4f9200b003cfa895a9cbmr864128wmq.96.1668527624772;
        Tue, 15 Nov 2022 07:53:44 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id iz7-20020a05600c554700b003cf894dbc4fsm16192841wmb.25.2022.11.15.07.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 07:53:44 -0800 (PST)
Date:   Tue, 15 Nov 2022 18:53:40 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Christopher Morgan <macromorgan@hotmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [bug report] Input: add driver for Hynitron cstxxx touchscreens
Message-ID: <Y3O2BNEbd3aKWm7X@kadam>
References: <Y3OJe4lOkOsRMIcu@kili>
 <6373b1f3.170a0220.85a5b.3a48SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6373b1f3.170a0220.85a5b.3a48SMTPIN_ADDED_BROKEN@mx.google.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 15, 2022 at 03:36:18PM +0000, Christopher Morgan wrote:
> On Tue, Nov 15, 2022 at 03:43:39PM +0300, Dan Carpenter wrote:
> > [ I sent this a couple weeks back, but it turns out that mutt + msmtp
> >   has been silently eating my emails instead of sending them so I'm
> >   resending two weeks of email. -dan ]
> >
> > Hello Chris Morgan,
> >
> > The patch 66603243f528: "Input: add driver for Hynitron cstxxx
> > touchscreens" from Oct 28, 2022, leads to the following Smatch static
> > checker warning:
> 
> Apologies, but I'm a surprisingly un-skilled programmer.

Heh.  Every several years I realize that, "Nope.  I still don't
understand pointers."

> I'll be happy to fix the bugs though I just want to make sure I
> understand the problem clearly first.
> 
> >
> >        drivers/input/touchscreen/hynitron_cstxxx.c:238 cst3xx_bootloader_enter()
> >        error: uninitialized symbol 'tmp'.
> >
> 
> Does this mean I need to set the inital value of the tmp variable to 0? Looking
> at the code more closely I'm assuming this is the issue because if it runs through
> the loop 5 times and errors each time it will exit the loop without setting a
> value for tmp.

Setting it to zero works.  Although I had to look up that
CST3XX_BOOTLDR_CHK_VAL is not zero...  But presumably the people who
know the code will understand that right away.

> 
> > drivers/input/touchscreen/hynitron_cstxxx.c
> >     209 static int cst3xx_bootloader_enter(struct i2c_client *client)
> >     210 {
> >     211         int err;
> >     212         u8 retry;
> >     213         u32 tmp;
> >     214         unsigned char buf[3];
> >     215
> >     216         for (retry = 0; retry < 5; retry++) {
> >     217                 hyn_reset_proc(client, (7 + retry));
> >
> > I would have changed this to a while (retry--) { loop except the retry
> > value probably matters here.
> 
> Is that personal prefrence or guidance? The BSP driver did the incremental
> loop 5 times, so that's why I did it here.
> 

Yeah.  Just a personal preference.  I was trying to avoid using the
number 5 twice...  Never mind about what I said here.  Just initialize
it to zero.

regards,
dan carpenter

