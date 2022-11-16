Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B2162CF11
	for <lists+linux-input@lfdr.de>; Thu, 17 Nov 2022 00:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiKPXrQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Nov 2022 18:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238962AbiKPXrM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Nov 2022 18:47:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1DD2FB
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 15:47:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E29FD6204F
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 23:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBE1C433C1;
        Wed, 16 Nov 2022 23:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668642429;
        bh=3d4FkAFWfv5wc25G1CgBNcjIy7Lxy4qFnhO1hMQwHfs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Safrr9t50TldJavI3yDlc3K0sZacOLg16L6K0XGAyp6qqvjXdnmt+d2XTdOoWlpC+
         vZWgkqXGSho0x3MfQahCcMDIIgKjbFIUzCEByTsZVG/JZdEwcK1oLSbibvFSDayBRo
         id9VtqV8YWtGIZLYaHjc7UDyw6P+oHh/a90PuD8HTeNbgyw87+J8hz7aDPK49/NTKo
         BsrASqdWOYePJbA/ol8YmKbGjigBHwl0KgtHAWqLgnqf0mqv2OvJY6Iu0Nffxjizea
         LlCITmNXJfg/T6FGDhaLt/sA/R3fSysSPqVGL5HQne+NQPEFo11yNVh0eX0boeYhqW
         DsGG5uCYYdqlQ==
Date:   Thu, 17 Nov 2022 00:47:07 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Roderick Colenbrander <roderick@gaikai.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH 1/2] HID: playstation: fix DualShock4 bluetooth memory
 corruption bug.
In-Reply-To: <CANndSKm99jpEyc4qqaHFmSL9ge2xk_QbKBqzU-UM9Tr8nPkmBA@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2211170046430.6045@cbobk.fhfr.pm>
References: <20221116160022.51829-1-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2211170010120.6045@cbobk.fhfr.pm> <CANndSKm99jpEyc4qqaHFmSL9ge2xk_QbKBqzU-UM9Tr8nPkmBA@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 16 Nov 2022, Roderick Colenbrander wrote:

> > > The size of the output buffer used for output reports was not updated
> > > to the larger size needed for Bluetooth. This ultimately resulted
> > > in memory corruption of surrounding structures e.g. due to memsets.
> > >
> > > Fixes: 2d77474a2392 ("HID: playstation: add DualShock4 bluetooth support.")
> > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > Roderick,
> >
> > thanks for the fixes. I believe
> >
> >         Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > would be appropriate for this one, right?
> >
> > --
> > Jiri Kosina
> > SUSE Labs
> >
> 
> Yes, that would be appropriate there. I can submit if you would like.

No worries, I've added that and applied on top of the previous series.

Thanks,

-- 
Jiri Kosina
SUSE Labs

