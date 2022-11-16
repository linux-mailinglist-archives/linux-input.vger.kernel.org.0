Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F297062CEFD
	for <lists+linux-input@lfdr.de>; Thu, 17 Nov 2022 00:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231394AbiKPXol (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Nov 2022 18:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbiKPXo0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Nov 2022 18:44:26 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9503E6CA2A
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 15:44:13 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 130so429695pgc.5
        for <linux-input@vger.kernel.org>; Wed, 16 Nov 2022 15:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fnn6EojPFoncA7wtl9c/q9nGwWk66aOEG1mC4evGu/8=;
        b=bqEWOR6AMIoYmtpe8Aaf0d62VxaKBgkj++HVP7gwomVPfwEo2Uxer+Kiz+lb7yNPnQ
         +ghFJnNzenPe5UA16LpLeIdXY0V0+IJXkTH/JpYyPyAvBF3/zFquOn0NHk0MvT5bNDg2
         7AG1ltowF/UG8B2aHdjvkLcP1TKVvK04XmSTHG8f7oYgZ0lYXChkycoUojWkoDJE84E+
         XiNZSfv4oNZVEWOfxtaMXkgBHMKaw/YLGlg+unwI8wW8jeP/RJEcSVs9FJ4K/zzDKuaM
         xpKAmpQKjA+JLd7XdzJoD38N4OQIAGVzAGzO5URjQqpQMvGuu/vFYNGj6JaHbhL07RMq
         zfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fnn6EojPFoncA7wtl9c/q9nGwWk66aOEG1mC4evGu/8=;
        b=QgZna74UV9ghUDUe+vnJzrbTrNk0hGkIGHpsZlPVg2/eHjRODqS/za+eqERqtdYYTB
         C0uwhMAuQ9t7DovDwxL5TCtvepQo17+ieCF0h12h8lBG561HHXZ49j2bvffzEWFuShiR
         rZ9QgvLaf7ag61nk5BTyFssY/DFupE9jIczZrTohOCrMOLQc49+QxfBIsGxQZOGm6NgB
         f46ZPkazGfIUn8f+fHi3jgNxZpwg4yBqhZMEqBxGKbioTEgOQhkML6fN0ymeGXPPqZkR
         bnTUP7O3URtT2XH4lD24bY7BhBONQQDNHVt5yh9r3CuW4Sga4/IcT+ezAIwrpOWKILVB
         8mIQ==
X-Gm-Message-State: ANoB5pnBCJSU8KcL62ujM7v1mpAMBSGoXEpPGWRajL4+Ejsul0NfMorE
        vZgvSoElh3mOrp+mSTVLoy0z9wxj3d/qF8HTNIKzAg==
X-Google-Smtp-Source: AA0mqf4k0WCaROXcsWljYcZBvjVCvGeXDHx3dCzP9LBqLCd64xjcUHTwZereWirmSGxyHZo209cc9r4C+H9EvQrKHE0=
X-Received: by 2002:a05:6a00:2a8:b0:56c:db44:7b1f with SMTP id
 q8-20020a056a0002a800b0056cdb447b1fmr338611pfs.54.1668642253159; Wed, 16 Nov
 2022 15:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20221116160022.51829-1-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2211170010120.6045@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2211170010120.6045@cbobk.fhfr.pm>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Wed, 16 Nov 2022 15:44:01 -0800
Message-ID: <CANndSKm99jpEyc4qqaHFmSL9ge2xk_QbKBqzU-UM9Tr8nPkmBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: playstation: fix DualShock4 bluetooth memory
 corruption bug.
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 16, 2022 at 3:10 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 16 Nov 2022, Roderick Colenbrander wrote:
>
> > The size of the output buffer used for output reports was not updated
> > to the larger size needed for Bluetooth. This ultimately resulted
> > in memory corruption of surrounding structures e.g. due to memsets.
> >
> > Fixes: 2d77474a2392 ("HID: playstation: add DualShock4 bluetooth support.")
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Roderick,
>
> thanks for the fixes. I believe
>
>         Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> would be appropriate for this one, right?
>
> --
> Jiri Kosina
> SUSE Labs
>

Yes, that would be appropriate there. I can submit if you would like.

Thanks,
Roderick
