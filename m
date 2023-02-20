Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5849669C7B8
	for <lists+linux-input@lfdr.de>; Mon, 20 Feb 2023 10:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231539AbjBTJcT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Feb 2023 04:32:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbjBTJcO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Feb 2023 04:32:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDEFD14E9B
        for <linux-input@vger.kernel.org>; Mon, 20 Feb 2023 01:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676885489;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c/2hEfHyhsS/IdkC85EBrleARAWcDpZrTsae9Uls03Y=;
        b=YzaWcfTemK6BnfDlvQ/yEHWKt7pRZKowyhCJYznVev0TgllY66IlfQkaZVrd3RmDI7N5VS
        xAEtY4FU0uc53TQmQzD98hC4FhFBsLlxgH3hV5MfBawCBiLskpesEfP3UgOfK2/Y7oio/b
        YGHYixkalB87CRk2jg8mmab1V1TkUgI=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-XIo1winaOlyBLGJiQ_szkw-1; Mon, 20 Feb 2023 04:31:20 -0500
X-MC-Unique: XIo1winaOlyBLGJiQ_szkw-1
Received: by mail-yb1-f199.google.com with SMTP id r13-20020a25760d000000b0096c886848c9so1993775ybc.3
        for <linux-input@vger.kernel.org>; Mon, 20 Feb 2023 01:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/2hEfHyhsS/IdkC85EBrleARAWcDpZrTsae9Uls03Y=;
        b=dtPUPzRns+E5HBbbnTiBIf3NcXWRALy3POwIXSm4WV+lpdyY6BPfRGum+9pwh9uYDw
         RyS0ek2oDBLn2njs6G47rXBip4o2tPL1CevloHYtqJxQdUP5+rTWjWBzzo4eMuSgz4en
         oeEPzf6iM7+t5c/jk4M0cE5i4FrCIkM27SZnBt8GRr48x0QdzcVMZrY/775m7BTAvL6h
         pgNKMniRc2CDdEmxAQxKoqMQMEll3Wax6ocR3G+Oo5l0Gm45RExsvxu0bhYSsSuxjs89
         oR1vzGtqqwZSMIAN75dFrPtec3VNVo+lnZ9M6lRWM0P2ktHWNYbdxoGXURFZOguY4buX
         AO9w==
X-Gm-Message-State: AO0yUKXDbCJRs5rcvSBSh8/XSClU0YBiC5G7OUXe8l9xmX84S0VdIc3A
        cIohLCn2LkwNF7gAR5VU/Ny8McNkXWiFrF8pWCMy+KBRHt7b6rUAOENaDPOV404UROX3a0DHMCg
        0/xmwipMrb+WBRZd20ZQ1e8nYuA1ZYDEdaZuYrto=
X-Received: by 2002:a81:86c4:0:b0:52e:eb3f:41ab with SMTP id w187-20020a8186c4000000b0052eeb3f41abmr1658488ywf.287.1676885479746;
        Mon, 20 Feb 2023 01:31:19 -0800 (PST)
X-Google-Smtp-Source: AK7set+GKDE1fmfkWyXmZMcFemjLeuON9REVdfPKIpqRCZV1b3nYJWIXAhug2L7b6fBD09FEwIMfA4bY4yy0T9KHQ4U=
X-Received: by 2002:a81:86c4:0:b0:52e:eb3f:41ab with SMTP id
 w187-20020a8186c4000000b0052eeb3f41abmr1658485ywf.287.1676885479485; Mon, 20
 Feb 2023 01:31:19 -0800 (PST)
MIME-Version: 1.0
References: <20230215-wip-mcp2221-v2-1-109f71fd036e@redhat.com> <nycvar.YFH.7.76.2302201009430.1142@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2302201009430.1142@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 20 Feb 2023 10:31:08 +0100
Message-ID: <CAO-hwJKQRL1Tp42yWL-+mJgy-_nFskc3kXEHQSFC-LSnk1cFzA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: mcp-2221: prevent UAF in delayed work
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Rishi Gupta <gupt21@gmail.com>,
        Pietro Borrello <borrello@diag.uniroma1.it>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 20, 2023 at 10:10 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Thu, 16 Feb 2023, Benjamin Tissoires wrote:
>
> > If the device is plugged/unplugged without giving time for mcp_init_work()
> > to complete, we might kick in the devm free code path and thus have
> > unavailable struct mcp_2221 while in delayed work.
> >
> > Canceling the delayed_work item is enough to solve the issue, because
> > cancel_delayed_work_sync will prevent the work item to requeue itself.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> Acked-by: Jiri Kosina <jkosina@suse.cz>

Thanks a lot.
I realized I was missing the Fixes 960f9df7c620 and Cc: stable tags.

I am adding those right now and will push it as soon as the minimum CI
reports back that it's OK.

Cheers,
Benjamin

>
> Thanks Benjamin.
>
> --
> Jiri Kosina
> SUSE Labs
>

