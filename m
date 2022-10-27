Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC53A6102DE
	for <lists+linux-input@lfdr.de>; Thu, 27 Oct 2022 22:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236710AbiJ0Umb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Oct 2022 16:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236615AbiJ0Um1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Oct 2022 16:42:27 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E80392CC4
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 13:42:25 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id v1so4139511wrt.11
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 13:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBfdOCnlnTNoeWhUufsll1tQzKq84gT4U8gcUZU4jag=;
        b=l9WV8fEMtWejF5EGnltZbJA8TYasrE9cUX6xCypg8/5EDpRomQXCsncIWTJ4VJb3H7
         dI6py3AI9sQGSNrTp9n2V+h/0WFRGRPb6aexCqD6rKPVwb24FXt/qqhKf62cE1zS6DYp
         MzyvR7Q+zXjAcYM4SBo2vudSjztJ7RxXPpgbxafLO3Z0+d6e7c2pCNkM/pcBDuvdj7z6
         QeTRq7KgWiVOSPLMKGtZoIAocROpcovuKH8TuF0HMwPtg2a/ouJT/gZb3pugJY6kJFUe
         CRBR+zE1TGuTZEOJnSSq6jI3S1pMPCFHukl2kvVECGa+IqVdiMso+zJpWlE9V7jq5wZG
         HCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PBfdOCnlnTNoeWhUufsll1tQzKq84gT4U8gcUZU4jag=;
        b=lEqB9xi839ISDOmwlPaMeQ1LANopn7+Vp2BvjAqA/45cKdelPMZRUhUjBlVN2sBYSX
         KlbfBrVEzW543A7oPdHORPvK0Z8/RsIcAf9wjwayHIa9eu0znKQnuM3VoaaFQFldoOU6
         ejBJSevzi3omcA/tlUKnQkQ80rrgW2kK2JZgc/j6zavbGA0plyn4WhELzEm9boR9lJXi
         ioMvwfmSV+SkSuIoDE/HAvrnpS9nOcYdyxzUzElOFYy98jI+ztG6k50c+ADZx35cDw6R
         2im+uD4/NWIS/L8ZWY2LOfA+7KXTm8fzRHIIb469zPXVO7wmUjWtohHiC1lfK08jl6XE
         xT+w==
X-Gm-Message-State: ACrzQf2Gimn1T81t7hJHGVvaiX88v7Vas/uIppaWBCh0leHV4QyUux46
        FXFE2+RExizEjCXbIWTmNs8=
X-Google-Smtp-Source: AMsMyM4v/FRM7QR0q7b1xIzdq4a6iqb5COXwu2Ll8WabnE+PO4XJdFujX6RdcsvKvZ9XDRYM1r3Eig==
X-Received: by 2002:adf:e944:0:b0:236:5fe3:c482 with SMTP id m4-20020adfe944000000b002365fe3c482mr18297053wrn.441.1666903343809;
        Thu, 27 Oct 2022 13:42:23 -0700 (PDT)
Received: from elementary ([94.73.35.109])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d65c7000000b0022ccae2fa62sm2053041wrw.22.2022.10.27.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:42:22 -0700 (PDT)
Date:   Thu, 27 Oct 2022 22:42:19 +0200
From:   =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Alexander Zhang <alex@alexyzhang.dev>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Torge Matthies <openglfreak@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Nikolai Kondrashov <spbnick@gmail.com>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
Message-ID: <20221027204219.GA7559@elementary>
References: <20220804151832.30373-1-openglfreak@googlemail.com>
 <20220804180038.GA8906@elementary>
 <CAO-hwJJsKC=fyeFLCmdXMRkxEQFVGZ189GKphTVK83QJWc=udA@mail.gmail.com>
 <2717adbe-e9b2-3c5a-7ccf-3d851a55744c@alexyzhang.dev>
 <1db88d01-1004-0e42-b9aa-3e0bb2b22cdb@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1db88d01-1004-0e42-b9aa-3e0bb2b22cdb@leemhuis.info>
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Thorsten,

On Thu, Oct 27, 2022 at 02:06:43PM +0200, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker. CCing the regression
> mailing list, as it should be in the loop for all regressions, as
> explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> 
> [...]
>  
> What's the latest version you tested? This is not my area of expertise,
> but I noticed there was a patch with a fix for f7d8e387d9ae that went
> into 6.0.3:
> https://lore.kernel.org/all/20221019083311.156155236@linuxfoundation.org/
> 
> Maybe it helps, but maybe I'm just confusing everything with this mail.

Tablets have different nodes for their pad (the tablet per se) and the
pen. That patch fixed a missing prefix in the device name. For example,
"Tablet Name" becomes "Tablet Name Pen" after the fix. So, it doesn't
affect the problem Torge is trying to fix.

Bejamin, are there any updates on the broken automated regression tests
you mentioned? Do you think it is worth adding HID_QUIRK_HIDINPUT_FORCE
in the meantime?

Best wishes,
Jose

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
