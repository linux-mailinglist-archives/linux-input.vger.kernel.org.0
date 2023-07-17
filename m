Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 445807568BE
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 18:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjGQQLu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 12:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231985AbjGQQLo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 12:11:44 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC2FE4F
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 09:11:43 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-66872d4a141so2981887b3a.1
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 09:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689610303; x=1692202303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ns5ACBrUJ/ITwe0oonaZelwqgqy98PBTHDYf/wBgJMs=;
        b=LX+FNvJ9aIYnc++vOMTIIbmc7rbBYSvi556+ekemgACuYSW+NrLZZ/4ljCa6/4bzXi
         Tg3gpxG2qlYPetBf5wzPbCGtdD3f/bglqKfVyNdfyzJ7z2iag4k1+tOpLs1e+pKuoM31
         qINLcERE0I03fNBc1R05a5t9AlNHKdIL+J6WgsHsvshJW1OA9xLKE5xcpzAgSyFt8b7n
         Uf4Tsk9b8aQ+uRO7UAYo196uzZG4P6Q2NcKy3WOtVn/7QpLbrMRIowRRXJ+92qnEA+BC
         opZdFtzeOGNfLwQX39o+JLF5OJpdQxXqIkcEbG8gMp6BmivdxHEByxRADiQZEobIj08g
         LVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689610303; x=1692202303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns5ACBrUJ/ITwe0oonaZelwqgqy98PBTHDYf/wBgJMs=;
        b=G4BPVJTRdOjsal/CJKHMaMFSicoX/Gu4cYq8gJjIJ5/2vL70Q5JVQxqBUoDla6u22s
         4sTEPjwmGWyfpcXKtUUwodDmYrtj/XW+t/zuE2Gxa88ZkfTHurjLIEXbqLd7qBvw3u8w
         mJzeXIJEBILTLwwbBp7SLSEZPf9lNVW5OnKebxJWNARprluWtUGYQZa91iJYRlSqnfmY
         nwQSb1ra+dZwjVQhfek9XjaPSlu6PaDxR1MTjVjp7Sic7x7V23ufXMWipffuYmG9/wdZ
         Fe6SSVOIZrbvOYBjQ2X8Bt3A4jBtMIdd/SYhlkXWPRaGnY6scdelAQGj65jxQm1pEcmZ
         7Bmg==
X-Gm-Message-State: ABy/qLbpZunUjApIolb4ZqgD568OvxqLHV1yikj3OO9NF02MA1oPfCDS
        wx6/g/ye6n0XNT/8I1gM/DyQ+aPw6Qw=
X-Google-Smtp-Source: APBJJlEiKsaQezdgVZiHlX2PQED6MFuIKNOcWIP1b8hQqjheVkZVqTyQjPiiUQODYIo/wkgcxGtvOQ==
X-Received: by 2002:a05:6a21:6d8f:b0:134:e14c:851b with SMTP id wl15-20020a056a216d8f00b00134e14c851bmr2947285pzb.23.1689610303181;
        Mon, 17 Jul 2023 09:11:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1e30:2510:1b57:a9cd])
        by smtp.gmail.com with ESMTPSA id e7-20020aa78247000000b0066a31111ccdsm12635pfn.65.2023.07.17.09.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:11:42 -0700 (PDT)
Date:   Mon, 17 Jul 2023 09:11:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Nguyen, Max" <maxwell.nguyen@hyperx.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: xpad - add support for HyperX Game Controllers
Message-ID: <ZLVoOzvOj+lIdxyL@google.com>
References: <MW4PR84MB17807ECDCBA17E38BA87F9A5EB32A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
 <ZKxVBULWtM30ZJ7D@google.com>
 <MW4PR84MB1780BBFAD855717EB1EA86A9EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
 <ZLA2cE+ojFwCLO+2@google.com>
 <MW4PR84MB178010F3A35DFF92FE8CC909EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR84MB178010F3A35DFF92FE8CC909EB37A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 13, 2023 at 09:18:37PM +0000, Nguyen, Max wrote:
> Hi Dmitry,
> 
> There is an option on outlook to change outbound mails to plain text instead of HTML.  Would this work?

Sorry but I do not know if that is enough. I have not used Outlook for
more than 15 years.

> 
> Regards,
> Max
> 
> -----Original Message-----
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com> 
> Sent: Thursday, July 13, 2023 10:38 AM
> To: Nguyen, Max <maxwell.nguyen@hp.com>
> Cc: linux-input@vger.kernel.org
> Subject: Re: [PATCH] Input: xpad - add support for HyperX Game Controllers
> 
> CAUTION: External Email
> 
> Hi Max,
> 
> On Thu, Jul 13, 2023 at 12:43:19AM +0000, Nguyen, Max wrote:
> > Hi Dmitry,
> >
> > I have sent over a new patch.  Let me know the whitespace-damage issue is resolved.  I will need to adjust the acks since I had missed it.
> >
> 
> It looks like you are using Outlook, and it will not work. It sends a mix of HTML and plain text, and it mangles the plain text.
> 
> You need to look into setting up "git send-email" or mutt or something else besides Outlook to send kernel patches.
> 
> Thanks.
> 
> --
> Dmitry
> 

-- 
Dmitry
